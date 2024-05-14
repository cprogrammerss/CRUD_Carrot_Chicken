package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.io.FileUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import dbutil.Dbconn;
import entity.User;

public class Model {
	private Statement stat;
	private PreparedStatement ps;
	private ResultSet rs;
	Dbconn s=new Dbconn();
	public int update(Integer id,String name,String password){
		int a=0;
		try {
			Connection conn=s.getConnection();
			String sql="update user set name=?,password=? where id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(3, id);
			ps.setString(1, name);
			ps.setString(2, password);
			a=ps.executeUpdate();
			s.closeAll(conn,ps,rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}
	public int insert(Integer id,String name,String password){
		int a=0;
		try {
			Connection conn=s.getConnection();
			String sql="insert user values(?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, password);
			a=ps.executeUpdate();
			s.closeAll(conn,ps,rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}
	//����idɾ��
	public int delete(Integer id){
		int a=0;
		try { 
			Connection conn=s.getConnection();
			String sql="delete from user where id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			a=ps.executeUpdate();
			s.closeAll(conn,ps,rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}
	//����id����
	public User load(Integer id){
		User user=new User();
		try { 
			Connection conn=s.getConnection();
			String sql="select * from user where id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()){
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
			} 
			s.closeAll(conn,stat,rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public ArrayList userSelect(){
		ArrayList<User> users=new ArrayList<User>();
		try { 
			Connection conn=s.getConnection();
			String sql="select * from user";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			User user;
			while(rs.next()){
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				users.add(user);
			} 
			s.closeAll(conn,stat,rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	//��excel�е������ݣ��������ݿ�
	public ArrayList<User> updateFromExcel() {
		ArrayList<User> users = new ArrayList<User>();
		Connection conn = null;
		PreparedStatement statement = null;

		try {
			// ��ȡexcel�е�����
			ExcelReader reader = ExcelUtil.getReader(FileUtil.file("users.xlsx"));
			List<List<Object>> readAll = reader.read();

			conn = s.getConnection();
			String sqlSelect = "SELECT id FROM user WHERE id = ?";
			PreparedStatement selectStatement = conn.prepareStatement(sqlSelect);

			String sqlInsert = "INSERT INTO user (id, name, password) VALUES (?, ?, ?)";
			statement = conn.prepareStatement(sqlInsert);

			for (List<Object> row : readAll) {
				String id = row.get(0).toString();
				String username = (String) row.get(1);
				String password = (String) row.get(2);

				int id_int;
				try {
					id_int = Integer.parseInt(id);
				} catch (NumberFormatException e) {
					// ����IDת���쳣
					continue; // ����ʹ�������߼�����������
				}

				// ������ݿ����Ƿ��Ѵ�����ͬID�ļ�¼
				selectStatement.setInt(1, id_int);
				ResultSet resultSet = selectStatement.executeQuery();
				if (resultSet.next()) {
					// ���������ͬID�ļ�¼������ѡ����¸ü�¼���������ü�¼�Ĳ������
					continue;
				}

				User user = new User();
				user.setId(id_int);
				user.setName(username);
				user.setPassword(password);
				users.add(user);

				// ����PreparedStatement����
				statement.setInt(1, id_int);
				statement.setString(2, username);
				statement.setString(3, password);
				// ���������
				statement.addBatch();
			}

			// ִ��������
			statement.executeBatch();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			// �ر�Statement
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
					// ����ر�Statement�쳣
				}
			}
			// �ر�����
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// ����ر������쳣
				}
			}
		}

		return users;

	}
}