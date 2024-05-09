package com.zoctan.api.service.impl;

import com.zoctan.api.mapper.TestsceneTestcaseMapper;
import com.zoctan.api.entity.TestsceneTestcase;
import com.zoctan.api.service.TestsceneTestcaseService;
import com.zoctan.api.core.service.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
* @author SeasonFan
* @date 2023/10/29
*/
@Service
@Transactional(rollbackFor = Exception.class)
public class TestsceneTestcaseServiceImpl extends AbstractService<TestsceneTestcase> implements TestsceneTestcaseService {
@Resource
private TestsceneTestcaseMapper testsceneTestcaseMapper;

    @Override
    public List<TestsceneTestcase> findCasebyscenenid(Map<String, Object> params) {
        return testsceneTestcaseMapper.findCasebyscenenid(params);
    }

    @Override
    public void savetestscenencase(List<TestsceneTestcase> testcase) {
        testsceneTestcaseMapper.savetestscenencase(testcase);
    }

    @Override
    public void updatescenenCaseorder(long id, long caseorder) {
        testsceneTestcaseMapper.updatescenenCaseorder(id, caseorder);
    }

    @Override
    public void updatescenecaselogic(long id, long loopnums, String stopflag) {
        testsceneTestcaseMapper.updatescenecaselogic(id,loopnums,stopflag);
    }

    @Override
    public List<TestsceneTestcase> finddeployunitbyscenenid(long sceneid) {
        return testsceneTestcaseMapper.finddeployunitbyscenenid(sceneid);
    }

    @Override
    public List<TestsceneTestcase> findcasebyscenenid(long sceneid) {
        return testsceneTestcaseMapper.findcasebyscenenid(sceneid);
    }
}