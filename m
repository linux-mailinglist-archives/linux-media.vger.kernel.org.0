Return-Path: <linux-media+bounces-31156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B5EA9ECBB
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A938D3BFAAF
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F413F268C4F;
	Mon, 28 Apr 2025 09:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q9BCvRfC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA949268690;
	Mon, 28 Apr 2025 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832596; cv=none; b=LHzlFWlaBA8Npuv4S00BvYArI3UmuRmJ15QYLfyk7nMpXR/wuIs9/PFTcRBSc5lvAaFH/OHy5ELmbWf1NpjwVBi+DNddb/7cGGcayuDJ8ZfuNRjrHQ1lGzoZ54sT6uOoIz/enHQ03Zh0Ov/D/NHaK2Z716gpBiYhpDdZlZF03vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832596; c=relaxed/simple;
	bh=cqa7MaLkkGTyDgV8g9MQayI4Z4eK+WK2Zo4O/B26r8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hYZQfKzQTsb5Hc/i+KrauAPzhBGDROQyxQI6f03/37K/9XAgplRggXYwSUSkSlNznhPDbu2MswDgREuzDxjkBCOKt7oBqEL1mjj5mEZvU/ryuQEsdmZuAY0w0GSfATtH2LzxR1d5Pmrt/a3+TjrI0jVOZpmeO1hr2orS9j37sU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q9BCvRfC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6Uwpg018434;
	Mon, 28 Apr 2025 09:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+eLGyl0WACB95C2TnEdvJpslYR2fRosURDYolHi2kU=; b=Q9BCvRfCsnsou8RZ
	dDSiyu1TL0GC7nZQZJXKI3UgVH3KglPmwWNOL/MKNnM2Z3u313nba2tQ7/e2GxKf
	Li/ObQkwwQszP8F5CsDve2iGfU/MYo1IyWq/nCNRNnhw3oSnd1K5nvOSZl+RA6xx
	NwUXUv4WXsykhhx1rBEJMZPyNau8/WX9WvzqSIhtzFq4+q8ZhZ/t5VZMQ8xdSn2P
	jpCdjv2ircpgDDji2yqE8J2EOs2PaNdwa+M5dBfUQW0Y0VEQnGp8uPDtwfjKELDE
	GJcKLRi6ST3HaN0BlV9IMSOMw1VniCkKUWAKSnBjJwIrxoyQXKJHksOY//8bayff
	p1Lhag==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hqfy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:29:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9Tox5020243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:29:50 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:29:43 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:58:50 +0530
Subject: [PATCH v2 02/23] media: iris: Update CAPTURE format info based on
 OUTPUT format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-2-3a6013ecb8a5@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=1400;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=cqa7MaLkkGTyDgV8g9MQayI4Z4eK+WK2Zo4O/B26r8A=;
 b=1hyqFE70qgKDQ9X2LttwU2LhJyWmQ9/UvrbLWZAYvkccBVSIndrGEVDm1684+pJE5angl2MbU
 vo8yYQoTexnDQR02Db58MhaNPaqpwoSF5S/v8j4n1Ja6qiea5yck36U
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mnEGfzCzoOIQ3JSs0QCQHgAoejiFInBL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3NyBTYWx0ZWRfX61XqCj+am4Ad Z/aW1jnwwXGxAKdEV1z/kUjTkSGyjrlCrHtMP9lkkhSx++gjKbyVl0EVDaWHDFVnNNy/ND3Xl83 ApVMhnNbVeblSjq0V7QQ0vimVJChrkqWx+bOkqy6iNVblHUgRvxjuTqN2xJ10955iQzofr+08In
 zZlF8u0QoT0x2PuVMzMwEDq5c8MFpp1TFEsF61aKQhV7Edqh4t1rvG5BwI5eemleWxosony7pEV k4lGRL+17oHVgqBXXRRrrrbB2qUB7w01B5hcFimmvXGPmBJPl6RJwKLekrYcXcY4x9jnvfzsLH/ 0yrBYdohaJttGnrTqy/Q5pwJe+P3mtnX1d+wOO6j1c8xcXP+tK+001I8DzfE3PmttXGt2K2japJ
 NK3hYvU6Xf53oiPRLOQgS/BQ1BErEbEcVUly2GYaLWx9zzlfxP8CWPX1jeCx2NAYUoG1aqGD
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680f4a8e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=H4aCPc18VLGkYZj90ZUA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mnEGfzCzoOIQ3JSs0QCQHgAoejiFInBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280077

Update the width, height and buffer size of CAPTURE based on the
resolution set to OUTPUT via VIDIOC_S_FMT. This is required to set the
updated capture resolution to firmware when S_FMT is called only for
OUTPUT.

Cc: stable@vger.kernel.org
Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 2c1a7162d2da..71751365b000 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -171,6 +171,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
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


