package com.library.service;

import com.library.bean.Lend;
import com.library.dao.LendDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class LendService {
    @Autowired
    private LendDao lendDao;

    public ArrayList<Lend> searchLend(String type,String search){
        return lendDao.queryLend(type,search);
    }
    public boolean returnBook(long bookId, long readerId){
        return lendDao.returnBookOne(bookId, readerId)>0 && lendDao.returnBookTwo(bookId)>0;
    }

    public boolean lendBook(long bookId,long readerId){
        return lendDao.lendBookOne(bookId,readerId)>0 && lendDao.lendBookTwo(bookId)>0;
    }

    public ArrayList<Lend> lendList(){
        return lendDao.lendList();
    }
    public ArrayList<Lend> myLendList(long readerId){
        return lendDao.myLendList(readerId);
    }

    public int deleteLend(long serNum) {
        return lendDao.deleteLend(serNum);
    }

}
