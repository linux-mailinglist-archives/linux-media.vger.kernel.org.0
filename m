Return-Path: <linux-media+bounces-29651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16137A8114D
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC7E5886497
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E717224A050;
	Tue,  8 Apr 2025 15:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ENWi12oj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBD522FDE2;
	Tue,  8 Apr 2025 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127765; cv=none; b=aknFbDInuOP1XBgJkftBl1kHuC7TX8CWAQkK4TbvXLnMvdaC1UlOMI0fUvHTGOzvPIsH/SHOiTESanyQ3qs2xcxnn5yAIFXVcAVyn4kgoDAu0metPh3zk0+MU22/6WTjm7+GQbf5h8mX/LpcSoF7EKo34LScvCE0WWtN9Oy6g4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127765; c=relaxed/simple;
	bh=TFPWnA4ibEwOEQVADWpbaQzgeHAA90C9wveA4HSVqWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iny7zMytjcxLPNtMgtvAlLe6N/aYy6N+D35RW6zPDCs5SoVnmh1aMM6IdadCN8HYXTdeFdnjU3Zhz83ybe1CO3IH67RGg2mK2VvJq5ohG9cNqNGN3lVb4KyffXncB7R3oG7JY6hF3P+iU9eQCtHAkEn/fYeHXmfI1EIEYTgFZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ENWi12oj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AuQmg020678;
	Tue, 8 Apr 2025 15:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHyY2fCtPZCPzD2yNGMN4jxt0tdlD97bL8QazDCHQxc=; b=ENWi12oj7yZ32l9D
	K/HDYOoYGKm1k9byi/X5llhBGzC+f+p1GyFS/Ut2Guu38YcQb6OmQ8kblwTs2uMK
	cXRxOrvjW7NyXeBC4Jz9coctLokeWbbGtA6xawMqqisj7txp1+OGBtMiIp1a11Ro
	WQSxrclk6RO0ZZ/JRx6++xa2e92aBe31NTh7RD2Qg3wzWlkkBdExgu2CrUwwGFC7
	fXHQqIUfk/IiOr0hZYq+qXaqlXpx2LEhBTGrHvHLK4dld2UKvNIktY6FetoZhCln
	ozy1oBWxXZcjTDJfNxnA1ZP9WfuK3CBqSpJpmWFBQn7gDN6DdwMNhDhAq4Z81Xyl
	yIJL9w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdggb9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:55:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538FtwCa018354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 15:55:58 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 08:55:53 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 8 Apr 2025 21:24:29 +0530
Subject: [PATCH 15/20] media: iris: Add a comment to explain usage of MBPS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250408-iris-dec-hevc-vp9-v1-15-acd258778bd6@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
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
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127674; l=2515;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=TFPWnA4ibEwOEQVADWpbaQzgeHAA90C9wveA4HSVqWQ=;
 b=Rda56Le4IyGdltF9c3tQFS9pvz+cnt0gbLqTkimyvLIgxpJlS32qkAC0Y1r7IvvIlSTr6jcrv
 4u+LgGgWPX0AGr2gW+NWvOo9xuvWd91nIcy19R11bTN205n0zV+eH0G
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f5470f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=RRgCcmiGNgFMu6QMrkQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: p_O3KtXudC2SF6jlhvTiNcauQ1tumzJX
X-Proofpoint-GUID: p_O3KtXudC2SF6jlhvTiNcauQ1tumzJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080110

Add a comment to explain usage of MBPS and define a macro for 8K
resolution for better readability

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_sm8550.c | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c00fd4a83ba7..229697b2257a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -21,6 +21,7 @@ struct iris_inst;
 #define DEFAULT_MAX_HOST_BUF_COUNT		64
 #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
 #define DEFAULT_FPS				30
+#define NUM_MBS_8K				((8192 * 4352) / 256)
 
 enum stage_type {
 	STAGE_1 = 1,
@@ -168,6 +169,7 @@ struct iris_platform_data {
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	u32 max_session_count;
+	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
 	const u32 *input_config_params;
 	unsigned int input_config_params_size;
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
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 35d278996c43..49e775dd1b95 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -245,7 +245,7 @@ struct iris_platform_data sm8550_data = {
 	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
-	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
+	.max_core_mbpf = NUM_MBS_8K * 2,
 	.input_config_params =
 		sm8550_vdec_input_config_params,
 	.input_config_params_size =

-- 
2.34.1


