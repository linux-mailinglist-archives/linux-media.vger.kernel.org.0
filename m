Return-Path: <linux-media+bounces-31170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BEFA9ECE7
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B26817A3CBB
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE020274FEA;
	Mon, 28 Apr 2025 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MJeHoUKt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E829A274FD7;
	Mon, 28 Apr 2025 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832683; cv=none; b=By0i+8ykisd1m4e/G3d7c/9V6lDbmlk6YGe+zt04i629nX5HbyoYhLm6/teML+gaHtHcbSXBWDvA/CUoKOfeM8lmPyu7zBYS3PwBYN1flMgfI3ce5PLaOb9uWF+vCR3PkPmVi2g8RmABWanIYgeXNVtOJs8D2pAMI9roEu7uEKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832683; c=relaxed/simple;
	bh=g+317qQSOZE5clMjzgtfaX1CNWFpGmDUMz2Z0DK4/5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=T51aCb+8y4AraDpiSHXOuFuYm6SeLmx9rKfb9DYMl2Kuh9memYXWF5lz7S2n3xpwvHI+8m4jhJCcJK3ZD/NDsck2aWUspy2xR3Gr/Msl2cbggvGxqe9b7rdnIk7I3raMwzxDmpfCB/tCuHFQdRjKyhPTtDvbtyr9YkQfO6GmIAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MJeHoUKt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6einN018694;
	Mon, 28 Apr 2025 09:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F94XVpP+rdZDFCSQKCKm7bQIlAiOEz0mdGFxxc4l1aU=; b=MJeHoUKtGkski9Jt
	5wluP5T4yGS2Zx+4axk/2d8kZzHUh8lvj+O56UqqV1bhK28d+/qRaLaWZ+DwExb6
	fkB+NslWHhFMPKfnt4mBet9mCYaOe8/njL/crzMJdBj9HqKz+5JpbjNgJbBhuQ4k
	Ze3W48SUZHJvIKEe2PwtJ2tJLKDMIYACM33OQvN4TWQRofw44f5z7AOEc1anyNsi
	vxKJv210t1m0KeSgcBx/mccPVjscN/uJKgz3nvZ0dCAg4LOhIRQPK2h3t7QnJFdf
	+fpiTWa0Alnv/CpkP8Bv/di4j0eI9U9+4nSq4nm6wtj71K3+stgtBiCuRYI5b5c7
	DYSJQw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jfsfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9VHmB023342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:17 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:31:10 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:59:04 +0530
Subject: [PATCH v2 16/23] media: iris: Add a comment to explain usage of
 MBPS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-16-3a6013ecb8a5@quicinc.com>
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=2838;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=g+317qQSOZE5clMjzgtfaX1CNWFpGmDUMz2Z0DK4/5Q=;
 b=h2Lyt0TlYHtTGdEl8zHNZ6LU89nKhqntlDCLVXV+yoE+g7h4iii24PUlEDlSa8rxBSwUDkTqO
 q/CdgRy3lAMBRdpkWmRlmzQr/sTLgybhqTwDrXCE3QGs5jZcTnvKpHu
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfXyVL5QCBAj2fa zOTD0e81TVxrD33+OjWi8BZ2LAKAY9xV2dZSAqsYpgalHyi/BKoMU5QkbWEMvim5sTF3/TfjF9b 1zHsdpGj66w4+B/XkccKm8+Dr72uYTFV+dGfcm5f7bkOMuceyh1qAkSdg/Un3OCAY2c6NPlPdVv
 ywn6mw8pZBnQFg+dOLxjN9c/lTAWlWPfoGmQ1TzixdxWVVlGBhfrBIYcc4VQwED2HTkbahjBh1z u7KmEbXy7k6XnIA8C9sh3V9Hs30QY9s6HFYyN2qXzmX39A4VrOqlLVUhhXRtHloB45PovG/WjZX keA/BlMvWU8m+kRulOM19Gtn2zTSu4eB7dSgOplMOdR4BIne70FEtWMwTkSPskZBIyv2BajHsqE
 +edNiacKi+62zpyIeTT3Pczdwdk9kcDPKGVHuEAmWyrVCOoSOZw+VyH4wf+nObN9haC5p7H9
X-Proofpoint-GUID: jdA9P4jP67Wnlzakc2RA5hLfyJkTv_Lr
X-Proofpoint-ORIG-GUID: jdA9P4jP67Wnlzakc2RA5hLfyJkTv_Lr
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680f4ae6 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=RRgCcmiGNgFMu6QMrkQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Add a comment to explain usage of MBPS and define a macro for 8K
resolution for better readability

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 1dab276431c7..3e0ae87526a0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -21,6 +21,7 @@ struct iris_inst;
 #define DEFAULT_MAX_HOST_BUF_COUNT		64
 #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
 #define DEFAULT_FPS				30
+#define NUM_MBS_8K				((8192 * 4352) / 256)
 
 enum stage_type {
 	STAGE_1 = 1,
@@ -172,6 +173,7 @@ struct iris_platform_data {
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	u32 max_session_count;
+	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
 	const u32 *input_config_params;
 	unsigned int input_config_params_size;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 1e69ba15db0f..deb7037e8e86 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -248,7 +248,7 @@ struct iris_platform_data sm8550_data = {
 	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
-	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
+	.max_core_mbpf = NUM_MBS_8K * 2,
 	.input_config_params =
 		sm8550_vdec_input_config_params,
 	.input_config_params_size =
@@ -308,7 +308,7 @@ struct iris_platform_data sm8650_data = {
 	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
-	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
+	.max_core_mbpf = NUM_MBS_8K * 2,
 	.input_config_params =
 		sm8550_vdec_input_config_params,
 	.input_config_params_size =
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 543fa2661539..8183e4e95fa4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -127,7 +127,7 @@ struct iris_platform_data sm8250_data = {
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
-	.max_core_mbpf = (8192 * 4352) / 256,
+	.max_core_mbpf = NUM_MBS_8K,
 	.input_config_params =
 		sm8250_vdec_input_config_param_default,
 	.input_config_params_size =

-- 
2.34.1


