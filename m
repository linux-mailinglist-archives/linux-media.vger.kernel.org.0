Return-Path: <linux-media+bounces-27594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B728CA4FC9C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2A263AD6C1
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5DA219306;
	Wed,  5 Mar 2025 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XHSCHvBD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE72139C1;
	Wed,  5 Mar 2025 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171489; cv=none; b=an5BqSr01L3X3+IDJH8Zxv9Qza8jH0UNMvBLqW3Pmti2CW+A5ou4qEEGzTtwVRbD/1SK3PLgCDWVBM+BR99WPYPqdAoHMYyVQBlpX/SINVSWqBad54i41YxEQ7XF+mTDmMBIRGCjKoSXDhTTW+zL/7f+qHh8Tp+d6KxZeWOh6HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171489; c=relaxed/simple;
	bh=KiFkC44xIAtVS9AQVvgN0capdFt6C1K4P+YkCfj3kH0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbvY3UE6kCO0vh3zw6Yr8zhmrbZ8UTeJVVRK+YtmQzKGpoHS9DswDFFKUnpqIc7KnY85C1uencc6ydVbhSLwoRpbeNmu2v1UEVC3Cwlfoo9Rs4AVJVryaU95hML53njFQ8bBTVXjO2wE1jWprkFDep92RcLqoZrt3800gsMl0A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XHSCHvBD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NBKWg000384;
	Wed, 5 Mar 2025 10:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y1NPIb2hYrDTRSe2/x7kWtlvyZEEkau7bFB0vzlOCRc=; b=XHSCHvBDbp8KIQH2
	xYvJVsPpRDfs1lKye4Y1eQxxYdF7L1mBmmAjMkN7gNRM0AhPZjNgA8UOAfvIang3
	XIj9MX5uHsK9XWqjAGja4+Ed2jAB5+QeXHRSenWEW0QZ29vrD0ad83V9KqNkwlbN
	RoiXzODnhUbVJPeWnI007oAOAm8jFoBFcaS5QAnybr570aZnsOz6ual5ay1N4g63
	W36ANRkACYwq2QKmWInNTmECkdJB9tonNJjIrgmb3gyJ03/vZhD21UKF6UmEGOva
	VkOpwJb1Klufoua2KJJYNzDivDFRmO6509l/h3aTM0k/kTE6QPzBpTueubgqp0Fj
	1A7+Wg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tn1wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:44:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525Aijrt013774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:45 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:41 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 06/12] media: iris: Update CAPTURE format info based on OUTPUT format
Date: Wed, 5 Mar 2025 16:13:29 +0530
Message-ID: <20250305104335.3629945-7-quic_dikshita@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c82b1d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=2wt8lGDi6eTc_CL52jEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8_ACqOMsbk0_xAELYhlcwUO7xVFs1s6G
X-Proofpoint-GUID: 8_ACqOMsbk0_xAELYhlcwUO7xVFs1s6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=974
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

Update the width, height and buffer size of CAPTURE based on the
resolution set to OUTPUT via VIDIOC_S_FMT. This is required to set the
updated capture resolution to firmware when S_FMT is called only for
OUTPUT.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index cdcfe71f5b96..16ae83948076 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -228,6 +228,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
 		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
+		/* Update capture format based on new ip w/h */
+		output_fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+		output_fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+		inst->buffers[BUF_OUTPUT].size = iris_get_buffer_size(inst, BUF_OUTPUT);
+
 		inst->crop.left = 0;
 		inst->crop.top = 0;
 		inst->crop.width = f->fmt.pix_mp.width;
-- 
2.34.1


