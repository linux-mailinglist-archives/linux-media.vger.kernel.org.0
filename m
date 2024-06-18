Return-Path: <linux-media+bounces-13503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A84690C7EB
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 183041F20FBA
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 10:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9191CE095;
	Tue, 18 Jun 2024 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qz4y1zSi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F8156F5E;
	Tue, 18 Jun 2024 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718702803; cv=none; b=OGN80vww7GpMuuAUoAj4PYMCdGJz2cCIO4OXXljAxljy2rhVBqFEto075n0w8Ve5ALUxERI59TyiY8UBHfMGa+bo55TWpa/4i3weLI19WLxj9h0FKsppOBpw7Dwagw6dZ457hemThn5oDw6GlyvoKIvJc573bI1D/YW6CTSLnLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718702803; c=relaxed/simple;
	bh=DrWNUqlodNWphpl4db5ftnDdMdqxjQFTcF7ia2DCoEg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=VRv/jG3deTTnUYrzIGtnYvuyQuBE0uR8CPoPxMT6YKuLkmZ/b9qiESXcd84K+FUjQgZsihfK5grac3rfjk1eYfYjNGebPaBVhjPaz2S9pOBCE8/cLVsxBeK/ItPgIEBP7zgo1bNlJ/Uc5hWoXBr3IuP0DFsebG9l59hCWjM795M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qz4y1zSi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I9LBpE003923;
	Tue, 18 Jun 2024 09:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=kzCbpGUZRfQH
	vL0wyrp+IrtWtyMeO5w+QTeqqQME+Iw=; b=Qz4y1zSiI8wjtFooo9Xqg/DmjtMt
	eUV+ezzefomIoiNd+/tu9a9oCk9YZ5IZl2zOl7BXn5y8v+RKI5WGaI2jUlcffox/
	Pmsut9DjOI7tFS2R/wlyGqtChNPkfL6itWsVdx2fTVrq4fAIyFMxYpaPITfDfz5S
	JfV53fYkZX9RR3NC/hpvb+tbIv1cANUBNeioSrTdOOnrn6brTL7FTySSsm+nhtIs
	bIvkU2z0kUQu+OCHJY12Rqq0OYtpKn1CChClZuf6xLQKurEw72qc9J8HsPUQP6zk
	eqxX78s88S7xO8F3eylomIthtOVoADzgmB/XgLazfMa8Wi4VGV6Bl6etvg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys3qf63mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 09:26:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45I9QPUO007770;
	Tue, 18 Jun 2024 09:26:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3ys41kpnkw-1;
	Tue, 18 Jun 2024 09:26:25 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45I9QPDm007765;
	Tue, 18 Jun 2024 09:26:25 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-dikshita-hyd.qualcomm.com [10.213.110.13])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 45I9QPEg007764;
	Tue, 18 Jun 2024 09:26:25 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 347544)
	id DDF063275; Tue, 18 Jun 2024 14:56:24 +0530 (+0530)
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
        linux-kernel@vger.kernel.org, Zheng Wang <zyytlz.wz@163.com>,
        stable@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH v3] media: venus: fix use after free bug in venus_remove due to race condition
Date: Tue, 18 Jun 2024 14:55:59 +0530
Message-Id: <1718702759-18914-1-git-send-email-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h4fzPSZPSkh-Bqb6o9oWh8Bk5cEiQxlI
X-Proofpoint-ORIG-GUID: h4fzPSZPSkh-Bqb6o9oWh8Bk5cEiQxlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 malwarescore=0 spamscore=0 mlxlogscore=904 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180069
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

From: Zheng Wang <zyytlz.wz@163.com>

in venus_probe, core->work is bound with venus_sys_error_handler, which is
used to handle error. The code use core->sys_err_done to make sync work.
The core->work is started in venus_event_notify.

If we call venus_remove, there might be an unfished work. The possible
sequence is as follows:

CPU0                  CPU1

                     |venus_sys_error_handler
venus_remove         |
hfi_destroy	 		 |
venus_hfi_destroy	 |
kfree(hdev);	     |
                     |hfi_reinit
					 |venus_hfi_queues_reinit
                     |//use hdev

Fix it by canceling the work in venus_remove.

Cc: stable@vger.kernel.org
Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Changes since v2:
- used cancel_delayed_work_sync instead of cancel_delayed_work

 drivers/media/platform/qcom/venus/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a712dd4..c139270 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -424,6 +424,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
+	cancel_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);
 
-- 
2.7.4


