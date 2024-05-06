Return-Path: <linux-media+bounces-10824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D7C8BC736
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 07:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42FEC281B8F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 05:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DC84C627;
	Mon,  6 May 2024 05:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T/HnHDU2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE9347F4A;
	Mon,  6 May 2024 05:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714975158; cv=none; b=GzpcsioOM6ecZoiMXHmE/Q7TS2gGmVXH7SwF4//ohWuhVTg2FOBvxhKi5UwCLejOZkjyMeDsryOVpICYwpM/00Yw6H+zstdoYDmppkkoqzCqfFXgVFjn6RZ2RIlX0XZ9I2HuQNTRlQB+cRTeDXQgtmoL6RiJwdbbLn0llhBrUW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714975158; c=relaxed/simple;
	bh=koI1sNIqKLDuNDuh6AXSWnfEH8YF3otZZ16U0c6dsdU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Z3lsrSPxxiSi4L1b2mZCOCkp8a3s6N31yU4QD85Tnrb6FOfIzHHI3f7CtMKMT/8CRnfisIxs/Be5dCIbHgNBhmTSvrlwv0OM6K3Z3tBfBw6jjof1UtD1o2HWQg3pMtdoCQ6TvfT/Yxe88st64R5eQOwKuTec7EubX9CLHBfP5Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T/HnHDU2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4464XxDo021324;
	Mon, 6 May 2024 05:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=Tdi6iZl5Ie3N
	jA5KUJfNGAiZlVUpcEl7xfcMC74VT04=; b=T/HnHDU2qFbdVzSnsFx/akia7LE/
	xivYuAbGIJjRzrgBXPhKe2wHcc3+/AtGktMcxH92AnNMXddiu0OPwx8P5OoQzldH
	3fDxO7hKglA1ggGwqb2llOCpESNVmcBVcSwf/8XZRTC7BnvCU0dCrCc5JQXY/XOv
	v/cB6Br1cTakBtjn3x54cmwDWLpN2FDq0sczNfq9YeN++cH8z8Os2Ixw8+CFPyd+
	yWewa2qmzKHqYOuVHhU0BDW/KokuI7H1t7r3WfznsWAi2Hh261k0HzIsXcS5OG4D
	g8WGc1ltVdJUxO0NJcO4b7WDWiVanFvFQ6eUEeCX45qM3ITW2cwX9qnmBA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xwd3yark7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 05:59:11 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4465vY2L009891;
	Mon, 6 May 2024 05:59:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3xwe3k7u63-1;
	Mon, 06 May 2024 05:59:07 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4465x729013432;
	Mon, 6 May 2024 05:59:07 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-dikshita-hyd.qualcomm.com [10.213.110.13])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4465x6vc013430;
	Mon, 06 May 2024 05:59:07 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 347544)
	id 87322303D; Mon,  6 May 2024 11:29:05 +0530 (+0530)
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
Subject: [PATCH v3] media: venus: fix use after free in vdec_close
Date: Mon,  6 May 2024 11:28:53 +0530
Message-Id: <1714975133-1777-1-git-send-email-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TohBs7UZkK2NQCEaSzKufJMQTFHVDs56
X-Proofpoint-GUID: TohBs7UZkK2NQCEaSzKufJMQTFHVDs56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_02,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405060035
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
Fixes: af2c3834c ("media: venus: adding core part and helper functions")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Changes since v2:
- fixed email id

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


