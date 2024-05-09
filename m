Return-Path: <linux-media+bounces-11184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E58C0AD5
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 07:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5160128487D
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 05:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC22714901C;
	Thu,  9 May 2024 05:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hf+zMMq3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC7912C497;
	Thu,  9 May 2024 05:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715231685; cv=none; b=uV9FyvvKqA5AUizKfeWXCwZpXYNciEP9Ym3uKQ0026hGoAlZMVnMrVJCNYAOIfPo1D6AcE/ZsvoynMVtms41HLPnRLRm2cqQEbowUk0UC52qbPKSDurmuRI3Rz8NJMamM76Z8zDyrkVE5VvMLRPTO4gGvVbI6NS2tk3YNhMnl34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715231685; c=relaxed/simple;
	bh=b9lMhPPY/o4o8wPg9WDp+6wnV+tsJL1p4/lb6iDclRg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=UX1ym72Tc3STd+Hfe7gHD+vbNWRy9I8n2yNXE9+tg7/uOlMHtVLmtc7vatiBeKpIttYOLpbdorsrpQ8on+S9llPD0lSYix4qiXZKWKeMiAc01M1xjtkzRXZUB5OpZO0WVaJBicZP3NYw/XWbc9b5qQlNi2NJij4LBJYaC9jnjgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hf+zMMq3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448KlU9n029314;
	Thu, 9 May 2024 05:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=dNHJhwt9U3uG
	DKgV4yBC5FWsVm2A4CVhbGkT4nmtRtE=; b=Hf+zMMq3Vw4KtifYFcYOuabanICX
	hWfoDa8/Iheq0G6BW0VdTo/WVWYdk2dY1jQw6JzN231pUezmxq3vOiGBrmP5qvsM
	3hkvG2fPRSl2BFxRRdd1s1tNGpLaiYvRV0SqsLOlOamcq124M4byK0IQay1k1SPu
	ySUNIi4nv0LjH4q9xIuqCuoe2gpOl2bS5R4gjeW94382i4uwUApxb6TPRXwqFoYt
	eSEb2aOtBojkeB7zDs5ti4w0DMuvIjZDoUm5md3TDo2ZvTSsYZ0xEyjmeSs9nDIa
	svPNIqS/LKIU8cbv2n1mQQeAI3/tsgn6ZKPfZ87o1gJcuEhh062JU0DcSg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07u9a27c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 05:14:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4495EY85024756;
	Thu, 9 May 2024 05:14:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3xwe3m39gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 09 May 2024 05:14:34 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4495EYIB024748;
	Thu, 9 May 2024 05:14:34 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-dikshita-hyd.qualcomm.com [10.213.110.13])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4495EXwB024747;
	Thu, 09 May 2024 05:14:34 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 347544)
	id 36B5F3030; Thu,  9 May 2024 10:44:33 +0530 (+0530)
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <quic_dikshita@quicinc.com>, stable@vger.kernel.org
Subject: [PATCH v4] media: venus: fix use after free in vdec_close
Date: Thu,  9 May 2024 10:44:29 +0530
Message-Id: <1715231669-16795-1-git-send-email-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yro7f_kxu2BfgGXkMNoGHzlhcZ6jCD_H
X-Proofpoint-ORIG-GUID: yro7f_kxu2BfgGXkMNoGHzlhcZ6jCD_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_01,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090032
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

There appears to be a possible use after free with vdec_close().
The firmware will add buffer release work to the work queue through
HFI callbacks as a normal part of decoding. Randomly closing the
decoder device from userspace during normal decoding can incur
a read after free for inst.

Fix it by cancelling the work in vdec_close.

Cc: stable@vger.kernel.org
Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Changes since v3:
- Fixed style issue with fixes tag 

Changes since v2:
- Fixed email id

Changes since v1:
- Added fixes and stable tags

 drivers/media/platform/qcom/venus/vdec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9..56f8a25 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1747,6 +1747,7 @@ static int vdec_close(struct file *file)
 
 	vdec_pm_get(inst);
 
+	cancel_work_sync(&inst->delayed_process_work);
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	vdec_ctrl_deinit(inst);
-- 
2.7.4


