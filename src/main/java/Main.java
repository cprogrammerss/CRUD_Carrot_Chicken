import cn.hutool.core.io.FileUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        ExcelReader reader = ExcelUtil.getReader(FileUtil.file("E:\\users.xlsx"));

        List<List<Object>> readAll = reader.read();
        System.out.println(readAll);
        for (List<Object> row  :readAll){
            String id = row.get(0).toString();
            String username = (String) row.get(1);
            String password = (String) row.get(2);
            System.out.println(id);
            System.out.println(username);
            System.out.println(password);
        }
    }
}