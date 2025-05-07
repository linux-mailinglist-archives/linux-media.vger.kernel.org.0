Return-Path: <linux-media+bounces-31915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFCAAAD8B3
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBD5D172F47
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0702C22B59C;
	Wed,  7 May 2025 07:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N5G4+GDy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FE3221F01;
	Wed,  7 May 2025 07:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603713; cv=none; b=Jn7Ttn13dI29iTj5T1ocM3BnEO3um41NIcRV0QEQjQgV+eB0Gxrn0dhLs6qsRKHSwhIi/1qT0b7FyH+0KvX9MQmRY5Eh0GX1l/0kbi4fS4WV8r3rojS5Wqs4hll/9DC34JsfL18DuZLK7p5NubZv9aCZqq9v63jHCbPslOmZpsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603713; c=relaxed/simple;
	bh=0WEf3fPcINzcr/Sp9CY2ZH7DMRuGEu/D5PkJEsFdnJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WIlnK13rXB/vhTvgnZcYvAksgRRhK4Rs2RRBj57jrplz09ogMuW+2EBTcUAYrxQWWvFg+s1qGXNjZqnnY1xDOOMjIXxJaWq86HJsjzZ9lnxUg+qCLCs8TDb0rz9lQVLtJNgcEu5aeeckBOC4TCbdT83tv8BpJq+F+IhzdXmftJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N5G4+GDy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GkQj020076;
	Wed, 7 May 2025 07:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gn9R+0KwyLKUWNIDZ023Tpqp/wRRGHib2dXar9tdOmM=; b=N5G4+GDyDr+ktKJA
	Mz77E6LwtDLfe+/uGNH/Irp+5QpmvjRBuF5HS+E//vXwWmBED/8R+t7mwJsCTNdh
	0eCjvBdmHV5YVsKpyrL7E6yo/jDI/KsTijb/gCX7+rC/kMeeEOxj1H5SbX/zvcvg
	DpagdUxVzs7wHSAqQ+ZQpgfzEr45018L7L4oFxEnNq8r2jJHdx8xFrNiri0E6jdl
	Ct9loF+eAMcW6En24KrabQJhdgrZtXCI9ZvNP3ltdZTdDl3zKpO0M/4LG89Kda3i
	du8aaP8PhoR+Vj2XJY4juTfxuc7szO48LvqVwt/J+dXH5pYaINZUODn7K8HOvXQY
	40POjQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9epab1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:41:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477fkV9001957
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:41:46 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:41:42 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:51 +0530
Subject: [PATCH v4 20/25] media: iris: Add a comment to explain usage of
 MBPS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-20-58db3660ac61@quicinc.com>
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=3120;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=0WEf3fPcINzcr/Sp9CY2ZH7DMRuGEu/D5PkJEsFdnJ8=;
 b=cEKNBiHyM7YZLIXzOrMyGeStPNqA5ScltfyAOnlXmkTg+KhjOn+hCGPU3vYcq/YgPfNfr0iI5
 NbcluM8N8zwDyK0BC3FeTsGp7iRIyeS0VwsTiqIXpwxQB/kAi2ZUDoq
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681b0ebb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=su6-HETSscyyXXVItQ0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ik9Kev1FypG258qEKS-kKNz0ezu_-SQn
X-Proofpoint-GUID: Ik9Kev1FypG258qEKS-kKNz0ezu_-SQn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX39GWdR8m5NP1
 6QXmMiQ5RZTvqxa+QTcVqPj6m5i3XQZottkhOD4NlUm/YyLOmPAnPlpGynaF53sED1FD7yAcRdh
 Js4V3QlIj+gAs5RP2FHPWvV9r0pmnGawMbUDImpq6VRAnxAPMLZUoZfls8AOpdYFQfSfcU7TRhY
 hikcAeTUcecQG+7pJZStrXJN7XAsmwFLfKWrZavoqo4uxXLRdMeM43nLmjfOvuHUp1+nSFBPNqm
 B+sdkqsJUIW/vVBPMWk46Idl858du+tjRZ//lFQVjf446Khpt4UK3qN19ZHuLY7XQZZjEvgFfpz
 PMt76jJUcCjvSyMkXCZ5S7HUlQphoklsNuCHxcRMUZgZ+oZyVLFi/ulhd+DrNWHLC9/DMA1EY7Q
 2RjoZKV5YG7d3zTfx/OX4aWfQP+mwxd0nCxK0dg4ZtEKpXY8jfurLfsgWhrN04887qZmROUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

Add a comment to explain usage of MBPS and define a macro for 8K
resolution for better readability

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


