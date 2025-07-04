Return-Path: <linux-media+bounces-36766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 009FCAF8A15
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8E271C82109
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4AE2857DA;
	Fri,  4 Jul 2025 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lbI4DNeo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9823285C8C;
	Fri,  4 Jul 2025 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615614; cv=none; b=GsgsN6FfqH2zK5BTSZ0oV29uY4eqmenYGEdolBsVdFeYGKzlS+UM6X4zVvfDnpicBq3DDBnH4OESzPdZiN51V4xhrx/FoeKDc7SEj/kiBGdVxFn+PeS5gqZqi1DcK+mCIVO64O1hhQid6JRrOKxQH8AMWsgw0IY1vOdu/gndCm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615614; c=relaxed/simple;
	bh=XjXb/f4mBC+GMBUn31nFodWyuIyN27+97CH15XpX1Tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fMAkAzaxATCU8EuMNbZhK7nTa1MC2tp2cTC+rSCvSvmUpCQ1yoxBNuiZpMelIUWYZYr/vxKCoSSplpl96cDBuRSN9qoAb8nOEIPVuPgeTsyR10FuHJLMCikSqldyjgjK6s8y4nzAUxGCpGB4tw4vHAStaW2LyOF8w9sgls62Ok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lbI4DNeo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5646R4Km018560;
	Fri, 4 Jul 2025 07:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Flw3+3vxE9NVGKronCkiecrpyoqLvf9P4ImipXtgPsw=; b=lbI4DNeo2iML9g9w
	BzySqIzDSQw2MZjYY8wptmRPTf/5btTDSMYnCKM+A5hZycmwZ0FwlIfrrChKCTCS
	tTl6WHOKJoqGYzAlpfXn6++bgbkecQ3c/4P2IAE0KE10aApuNddAo7JCP9DoeoMo
	IEMmtzlsjbtttOliPf0xwF6/8sP6LEj0cCvR1q/IZg1suDTj0Trn9RzG2AsT4ndE
	zt/UGBUsEmlguWIQilPT7Kmwl9I4KfzCfYFRQNOoRgmqkthHJ3FihGIKg1+LuXoJ
	CUDBumWdf45XoKaJwWsk5AB0+P4YipqQMcUCEfiNlfKglM/gLDFTerG7I1UxRKO4
	hy7NhA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxu28a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647rQlF018147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:26 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:23 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:01 +0530
Subject: [PATCH 01/25] media: iris: Fix buffer count reporting in internal
 buffer check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-1-b6ce24e273cf@quicinc.com>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=1216;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=XjXb/f4mBC+GMBUn31nFodWyuIyN27+97CH15XpX1Tg=;
 b=ps0SZCqiLy+VFitAj6ex4pNAfGK4eU/8JlvjlriaH+KtPdjG5sJKrWXJyy+aFGId7V2tSb2LG
 IexGs4KjMN5AiG3MrR2zEbPr75pQUzYkL8z0yXk7nUrNb9M0fYtFKsm
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX8MysmOHuCu6n
 +EjL/7zTHX7KKE4c0gwhPQW7lie2rAg+v00phHnHErZYX9pcHAA+mY7znHLhG1z6YVDz+29lHeH
 QKMvnY9yCtOAloHDoMPBJOnsM8uyB8jFisiaIazEo8ZNwitv1GY6l+r5WCxkNJuTNzVpg0sZCtQ
 HUlB/dMk5HRs+tpm3b7JrjDY0nUNl7f7RDykCko+GB3cBe/cPL6b0ILIMRxRFFcrZ6Mat9aMLsW
 xXR6iGpMb5XMIKQs8sOYXlb/A/Sh8C76Qppie+tGiMxpIWBOrrv3xJdG8W3xYo9q4CtkqAgJsVV
 wyrM9SY3r0/a3ghfautWVcjP0RN42a3KUOxNKfEf2oD5Nwgh+T7Gk/zT3gItGTrHhDmi2TMMHPV
 N6/SRC6YC9DKmvdRM24T6XK0ZPmRuOwcdCVL8R7D+e2j0nepNe9EsXREa90rNp4qGzKZCm40
X-Proofpoint-GUID: TqA5tFCFowQI2FJDIWuvFNEy_N9atNEE
X-Proofpoint-ORIG-GUID: TqA5tFCFowQI2FJDIWuvFNEy_N9atNEE
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68678877 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=-BUsXMgqhKYdWNcrEH8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=852 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

Initialize the count variable to zero before counting unreleased
internal buffers in iris_check_num_queued_internal_buffers().
This prevents stale values from previous iterations and ensures accurate
error reporting for each buffer type. Without this initialization, the
count could accumulate across types, leading to incorrect log messages.

Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index c417e8c31f806e03555cd5e2a662a6efe5d58f3e..8285bdaf9466d4bea0f89a3b1943ed7d6c014b7d 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -240,6 +240,7 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
+		count = 0;
 		list_for_each_entry_safe(buf, next, &buffers->list, list)
 			count++;
 		if (count)

-- 
2.34.1


