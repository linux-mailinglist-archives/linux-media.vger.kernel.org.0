Return-Path: <linux-media+bounces-10821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72C28BC717
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 07:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0DF2B2098F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 05:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824F7482CD;
	Mon,  6 May 2024 05:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wya50mj1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB6B18E3F;
	Mon,  6 May 2024 05:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714974135; cv=none; b=OaGTxm2vH0G6ZNZFat7te4m7Bu/54/Cuykaz46vUmF22AQlduzTowXwp8L6OE8Q4I4W+H4JO5+smb6ov+v4RJ6oG+gZvAiL0950uYb3sYOePUXrh+pJDCB3ENk2MF1q6T4H2UdyjV4LxcXqjITRg0oJPAlPkWKE2jXPtTAcHdmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714974135; c=relaxed/simple;
	bh=I2gC6db5W94sY/Nje6LL1nITZWWBOZMxi+knIFHED6s=;
	h=From:To:Cc:Subject:Date:Message-Id; b=UvMQmlhLKvdHGlBBg8TCa14jezH48ag0BQBrqfdT38e4IVMzP1F/zo5Z2CdK2KQ1vbcVPb5yGJQsxXv/2au1TkORoVZ0tjQwgSBFIpNAHPQP8r/cHZ5H5xxKkATkJPm5UeffTjpBpTTjM8XLRmYJ6Gu/yvwXzEyUDPDSPUW9VSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wya50mj1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4465A4Lf017862;
	Mon, 6 May 2024 05:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=RGbz+d0cSA3C
	BWhPN/b2OFxYrWV8839GXBNsImCm8Pc=; b=Wya50mj1KnX6ccahnifyzXdisUuL
	+xP92gPC6WOf/FjIhHCwI3+u+RfDKLlGgdMGr1bb/WX1erW4CXuGr8+dWcvuIUBc
	lqfBT/68/Qd11HcRt2K26JBR09U5diBtS/IsMU2NJVIj+vqyY+535vx1JWabhLYb
	SztttNjUrm3vlnvtQuaYNAjqi7g56burw9rJuBs1foVcZlwM2LV5Onp6+TwDlwgg
	oGJgHhMgqdu7+HKVsw+J1LgU8do/N5RNm9BkQPyBPJZ6o2MeJyH4G4cChW6ey24g
	HHf/KMTzk1D76hOYI8VGe972PN+3QxX5WeMoEnPrFbmdAp9NrZO//WXIrA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xwe6rtn64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 05:42:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4465g5sP025075;
	Mon, 6 May 2024 05:42:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3xwe3kdgcb-1;
	Mon, 06 May 2024 05:42:05 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4465g5Pe025062;
	Mon, 6 May 2024 05:42:05 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-dikshita-hyd.qualcomm.com [10.213.110.13])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4465g5M6025061;
	Mon, 06 May 2024 05:42:05 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 347544)
	id E7B843040; Mon,  6 May 2024 11:12:03 +0530 (+0530)
From: "Agarwal, Dikshita" <dikshita@qti.qualcomm.com>
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
Subject: [PATCH v2] media: venus: fix use after free in vdec_close
Date: Mon,  6 May 2024 11:11:50 +0530
Message-Id: <1714974110-19175-1-git-send-email-dikshita@qti.qualcomm.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q_PPJDu1W2ORzfZaGO6JQq3JHjkm95gE
X-Proofpoint-GUID: Q_PPJDu1W2ORzfZaGO6JQq3JHjkm95gE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_02,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1011 mlxscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2405060033
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

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


