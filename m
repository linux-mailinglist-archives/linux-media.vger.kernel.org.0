Return-Path: <linux-media+bounces-32106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCEDAB0D9D
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC0E1629C2
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA082749D1;
	Fri,  9 May 2025 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H0li8Dxm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F942749CA;
	Fri,  9 May 2025 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780048; cv=none; b=W24eNxEhmzRXSJMUqvTcA8DTzCbhOzZhkIy00zRUgMtyQnziCXTafnhVUh8T42RAPi/Nsew0i3VqK7HekBt5shuhw55EqZliM2uNf0YRznTQ1SKdKM4E3Baaet0+cscsrZPqJ2unE7baD2bP/LD+WS+ZZGttJvMAO79N1xaE/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780048; c=relaxed/simple;
	bh=fe/HFMCj8bJapCx4CcxfMEjvOXWqbjn39EnNAsf88MY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=afAJauoYhzV9XToXFKnCcKGn0ZBr5nEGpXyI2/wtyqWcaokdGHFeXaSk70KTasoTlZ5Y1i25Rg0wK5KuxcU4xqo/2Neo+shRjXVNzjHa0jDiE9RM0dyLa3w+Kr6hW29Fu9wVUicb7bLffMsI+6ujUk+lCcvOnImeUk6Jct5WipI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H0li8Dxm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491dBKJ025202;
	Fri, 9 May 2025 08:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYWdRAD7aRlCLKPdrJZE0ejAuDRJ24E9evk6DOXIRLY=; b=H0li8DxmjJPZ78FP
	NZQlKJ1Pw2oU+vnBGpspuzWSUOSOEeSSrGZqCkKP2fBrDshhkqB8eTPl6bFEIWKr
	pUrUOiXZ0UnuLAzNUmE3nfauJAA21p+WOodoPtyBdbSaLxgnQUDTjpBY8lvoCcfx
	S2RyVgzVF6k9+WZmx0ksVscnnyrpkfzeSlevnwHiufreSprvuXlNFjAPy4R1YclF
	Yo7t8+3L22fK1FGbD5QfSHSwed4NxXlLBHJNtNWZEtise+qNgRIYayfYJj8m2wAK
	WYhWWVMtWisqO0hfk2fWhDyg9nIhNVCm+U+Zgn7JNAFGAmryevgGsLQ+RapWxatF
	kPj67w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp1419k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498edPO023176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:39 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:34 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:07 +0530
Subject: [PATCH v5 21/26] media: iris: Add a comment to explain usage of
 MBPS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-21-59b4ff7d331c@quicinc.com>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=3404;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=fe/HFMCj8bJapCx4CcxfMEjvOXWqbjn39EnNAsf88MY=;
 b=ohN+5V49ii3V4fHn8N5Tieebi1PPZVui/VAQkKAKku5q3IWKsVrHevoybVMpBpT0Scxc6lJIf
 dTvAQLWDNjqDq+84MKHHPXpr/1c4fRyhvFfd/k17aXycfVR+B2pQNJF
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX9Eih4GEgqDrI
 nPr/itVgvvibMLL/TPg81u22t63U5bWxAJOUMklceWkMjsQLib7BISgVxmkGMegDM3b2J3exUif
 iuZSBRkM5mgb4fhPVqJfiP69Bg545Uebw4vm6WGAAVTm24U127P9PA20pc3k1CW0QZMiOTkPv+j
 ppvA6L4fP/E0k4CNC6qj4uIozcBlVH84vaa91rkuoc7CDicg9BdJdp5LO9swg72w94QghV9Evyg
 jb0T45W5MwIMEipLidhGER1S1af+M5/9Y4emGZaFRJk9NuGXkeHLCpA+9/CdAO3+RwueJHoTuz3
 ayQ6uJEMd1FeMxGiXNB8+DkARRZm4Z4FFbFs0lMxYYF3xi9dWhZVjzl+Qi3bFhTAqpgIlqlBAT3
 WXX1ke8FynwM4qJosv7k3WhUOs/FCNEVAm4IhqANqcJLR7fasnj1Ah8haTJFQt4+gmXMi1+E
X-Proofpoint-GUID: 1_OuPQwAZafo5T1rGRhOhXhhEFagTUq5
X-Proofpoint-ORIG-GUID: 1_OuPQwAZafo5T1rGRhOhXhhEFagTUq5
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681dbf87 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=su6-HETSscyyXXVItQ0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

Add a comment to explain usage of MBPS and define a macro for 8K
resolution for better readability

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 1dab276431c716f39d89f3c92f930194ae2275d1..3e0ae87526a0c95a46ddcfd75deda17e4c7dbdd4 100644
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
index 1e69ba15db0fd99a83fd5f9bccc0ba7d4ffe5a48..deb7037e8e86fe803ddb43f1ce6630815e798cb8 100644
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
index 543fa2661539188ee267838bc4742717b5b11204..8183e4e95fa4e94e3fb20ff4849084da2472f7da 100644
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


