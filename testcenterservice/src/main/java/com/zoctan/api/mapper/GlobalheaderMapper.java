package com.zoctan.api.mapper;

import com.zoctan.api.core.mapper.MyMapper;
import com.zoctan.api.entity.Globalheader;
import tk.mybatis.mapper.entity.Condition;

import java.util.List;
import java.util.Map;

public interface GlobalheaderMapper extends MyMapper<Globalheader> {
    int ifexist(Condition condition);
    List<Globalheader> findGlobalheaderWithName(final Map<String, Object> params);
    void updateGlobalheader(Globalheader params);
}