Return-Path: <linux-media+bounces-31530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C3FAA63F5
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 749D24A5730
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3A5242930;
	Thu,  1 May 2025 19:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A7mEGZIC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E1B241690;
	Thu,  1 May 2025 19:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126951; cv=none; b=IxOlk4djaPQ2aBTv957JapfvbJcBUKHH5XpAtVnExWL/WuLgY8XmOOUCu5MacsYcO9yVpogNA6UKy/UzUkY+bNU+nhOm+zE2r2UvbCWQMPBg/m5bWpMZ3kE/CLUW+fP8y/0yP+Dzv00S0JRqKeIRNP4pAe4aBFwmGQAauZoB+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126951; c=relaxed/simple;
	bh=a3++/s2XcaCj3JbtFDOR3QBpLNiIeWN5LbULvThyKsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UdkpEr/qNQCnamwdthUFaqPrRoXh9PEEVLIRolvonYjlhZXudO95E1w+ElQ8Qe08djYczZGZVIWgUJksLBCijy9mOoIaICCXT6MlZ8tIWM0Jcg9JJWoj+CW6/JKXEgNkErKk09AH0RSr9KaX/VicIHM9xAFx7esSlEkjVlxf59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A7mEGZIC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D2KZA010313;
	Thu, 1 May 2025 19:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Oihj6rn5GTUvwmOLIIkZ27tRzlBh0KpEUL+RBpJ47s=; b=A7mEGZICJRhwUYnJ
	l6X9A6ln4OtI8Bg0HR/n+Sg0EW9JiEee7MqtG3waWXnWONYlg5dxR0yFkjf9keqd
	vBomZKLKOPfu1RDF/R8A8KuiaO/AcuOT4ASAb/wPbTaWjT6q30ofu33ezYIVNbJ7
	tVUIsiDOJobW13rSIF8uhwD7j8VX5vlA14N5eQpadqoD+h0vWtJp8oTOFHk6UrYg
	EZHdV4xcLUDnNqascm+j9g1jhHZCoSr00viCEq6NhtEHxxkI4vXcnmr/tSq+XzUw
	WWPjTHea2dlq7/Lf2t0BZTrItmbEN220A+dm1xiwa0InZ9svb/5SVZIdI28c8qFt
	gGUARg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3x5jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:15:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JFj7E016923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:15:45 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:15:39 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:48 +0530
Subject: [PATCH v3 18/23] media: iris: Add a comment to explain usage of
 MBPS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-18-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=2892;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=a3++/s2XcaCj3JbtFDOR3QBpLNiIeWN5LbULvThyKsc=;
 b=PUSOSQfMTJHoYoHjbHtU7Hn7jx/Fukj9dicKUI7VbZzs+ga3EXaTbXTTrTkYMjjfxxgSYGJWC
 9OqwMXIh/gkCPdsoZ/yXuxOxfMMU6Cp+CKGVEp+CWYMjbZgEpdUcyyJ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6813c862 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=RRgCcmiGNgFMu6QMrkQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: B8DnFQ_2dBsY7pdco-SnjYOFbVW-McWW
X-Proofpoint-ORIG-GUID: B8DnFQ_2dBsY7pdco-SnjYOFbVW-McWW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfXwb5xsO8CuQG9 jCWoT6bg09nmrM7Ydl65YBIbwhwTd1H55wHcYskLgNYhAhVj79yE8vlf7cHD1ZXj4MgE8oP8eFp rPPPADbn1sfXwqeAxnuD7+waOk0SPxNESE7LbHPxJznudNkWbKRX01PJZ9aICfy0Zq5Uv8iun80
 3nHeF+ezz/wAvmIvQWxwCreOyeddMAj/0sTWbhNOxKYQNU5O2KYfwrSIb31rFL1217opR4iE2Mj gcWp8789Tf5zR1etrZ3UB2QuhrRHd+6TDUjAqpspnsfWkDhHFHSI5mvqmIt8r+ZsltHr71cjdY1 tKLUfPaPPf7NT/9cfglQMBfVI5+thwnq1mpJXmvO387O7mVyd3GMnug6jbTyDGse7mgRx3ab3Pv
 mNRsvRQ+SL1/FPl488GyV+YhBj0qmbuA7soYVo9Jdtj5105mKZgZk/aoG65c5/MoQicSveIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

Add a comment to explain usage of MBPS and define a macro for 8K
resolution for better readability

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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


