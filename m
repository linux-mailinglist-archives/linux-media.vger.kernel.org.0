Return-Path: <linux-media+bounces-27593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C56A4FC98
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC3A51885E3C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820EA214806;
	Wed,  5 Mar 2025 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TUmGcnT6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8061B212FBC;
	Wed,  5 Mar 2025 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171487; cv=none; b=pUTUL2RCIVGMC/73cvqOuQosP6iDmntSznCi09v92RSTHc20M3mPWXkc5MPhq3U/RHUIVNgX2U9j/9KEE2qckC7KGLmfACuLj9VUwkgtQJe8WViiVW3MwUA5u3s+7CTeNAmhpgk6+mAWxGZ3Z939rsGjzNS8xmpnRgy/dFODIwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171487; c=relaxed/simple;
	bh=2Uwqflt1i6YvUoXlmrw0PNRO38ytpKFvyffurFSAURU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ComkU/oDCeWeJiDrpNFhShVkB/QUoxFSEKyqlfpsIwI6768B6DmhazTtv7WCV4q2fpsVcpUiT8wPEpFTKd/inYJMtHDjInB7INqQE+NEwMoalGkzY6MNKxsLfoyVEcyr6Mb+KVknvy/fUd/om4r8kl5DN+ucL+uwl6LlWQdnyWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TUmGcnT6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525AHcCt005551;
	Wed, 5 Mar 2025 10:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sdu3DC8jh4DXtBD8xaXO/X4hHVQnczuZEXg7SvWthi8=; b=TUmGcnT68mGLfrdI
	6GnmbYzJLMMxR/1rduTAY6ywHFUwpnohXbfFLSKlN8EioiIlhxzuG5fpUcHq88kp
	GhtWiliSkYrlS9xr0/gccbcB+gnNKhNNX2GaF96PnFVNO6bjC3qOeu9kkyKoqf3/
	YXkwQWF443rL2VC6UTNNITrtUVwsasbiJFiG7u6sR/sjuLi39N7AJTKD5WZBX628
	P6e7EMJgg5lzhkY0dSd5zR5zq8JftXySS4x3PIhgl3U/newTe7DLl9dv7iELzU1b
	jj/NR3j9vf/D+oQj1lgLq1zfEoD5LXMEkjRNjaJhtawIVweoYzFAhTc/58MdpYEP
	qxZWOg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v50hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:44:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525AigNL011601
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:42 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:38 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 05/12] media: iris: Skip destroying internal buffer if not dequeued
Date: Wed, 5 Mar 2025 16:13:28 +0530
Message-ID: <20250305104335.3629945-6-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OPVuDFTex9trv3CuGXM0k4_C-g4atKfP
X-Proofpoint-ORIG-GUID: OPVuDFTex9trv3CuGXM0k4_C-g4atKfP
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c82b1b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=koQBp3Y6DNsLUkExdoYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

Firmware might hold the DPB buffers for reference in case of sequence
change, so skip destroying buffers for which QUEUED flag is not removed.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 8c9d5b7fe75c..305b630ca269 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -399,6 +399,13 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
 	for (i = 0; i < len; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
 		list_for_each_entry_safe(buf, next, &buffers->list, list) {
+			/*
+			 * skip destroying internal(DPB) buffer if firmware
+			 * did not return it.
+			 */
+			if (buf->attr & BUF_ATTR_QUEUED)
+				continue;
+
 			ret = iris_destroy_internal_buffer(inst, buf);
 			if (ret)
 				return ret;
-- 
2.34.1


