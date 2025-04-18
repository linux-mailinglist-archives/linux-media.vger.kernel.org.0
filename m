Return-Path: <linux-media+bounces-30513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ADAA931F9
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F5CB8E2C45
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 06:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AC9268FCB;
	Fri, 18 Apr 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BhUNmL4K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91F269CEC;
	Fri, 18 Apr 2025 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957758; cv=none; b=Qk5JGxL6qPcmNS++GKXHF//O5RkY/s8EqIoVx3OLlPC4AtoFbftKsbhjrwR8Oq5XTPCN5I5LCKGoBQW23NkIt7Z1bIT3SyCZYUoJlogw92ri351hp5wxqXJj2F6l6T1YcDMxmYEhZCo2Z0W104MlJ1Nk+/2IlRGCNBBZ0hfjMIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957758; c=relaxed/simple;
	bh=IXStSfjdESXE2pwyRcwovzwZhGZKb+lqooWrN0kvtBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aj89xtJsvOv/qlxE0IFx8okmH58yVZHwwrZVW62YatkckXSe+uI1UIUpk2ldmxH4NrH8qbqrHR12FcIVA9iJO4PrIKnRT7nostozeM7umLyzVpUO21cokCzaMpn9YFN9wyCSr0jVQZyhS9rghT+wnJ5p5HsLtmSD/vlPe+hewXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BhUNmL4K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2EGI4015466;
	Fri, 18 Apr 2025 06:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4MucncQYY6nwqiZvO7pP9I/2aCgJ3DP/TJXeHgR3Ew=; b=BhUNmL4K6fqo456Q
	qlcQoFLKxDYDA6XsPMfWXyooQgh2cuvMOetR2Yx8PusBYePy7iF8H2IycBMXqL5D
	Fhq4j7e6znY5YpdyiaiTW1ru/x5sNh7F8CiyBevrHqVaX2oNE3V6UuJq81MXxvDr
	izEuHhvJWo0LOWeEEk+uvjsBqI1k3bTPE1JjhPb9j2Car6mbA1mmzOet9FRl3Eav
	P8LHJGNjaZDFfRpHJeRnXWC9/HGLquOfpFxF84Z4s0euDkLYGLDU6ou6SkIJ6Wsu
	4xpwkQDwAosjZxDydTBUSP9KuOT6XME7cpuZkgs5j3sjI0SAt6UCwMjfHip+gXBi
	M4TK/w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqhd5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:29:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I6TBAu026180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:29:11 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 23:29:07 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 18 Apr 2025 11:58:42 +0530
Subject: [PATCH v2 4/4] media: iris: add qcs8300 platform data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-qcs8300_iris-v2-4-1e01385b90e9@quicinc.com>
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
In-Reply-To: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744957731; l=8830;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=IXStSfjdESXE2pwyRcwovzwZhGZKb+lqooWrN0kvtBk=;
 b=WwZmsjpzLeCJJmReyyRacREj7PD/862jAVqnjVng6I8NQMQ8FqF30T8kps5/NpIqOw8q6r84H
 PpsaIbRSCB5CA17fgtCBbQkNN1/YLBsZHk9pG6CEy4n72LGsXKpvZie
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: X8KPmJ1XQs9idus2h6oGN085atQUnHoy
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=6801f138 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=glt1T1EG--dW8uzeodgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: X8KPmJ1XQs9idus2h6oGN085atQUnHoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180046

QCS8300 has a downscaled video core compared to SM8550, while it has
same bindings as that of SM8550. QCS8300.h captures the capabilities for
QCS8300 which is delta from SM8550.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  57 ++++++++++
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 124 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 4 files changed, 186 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6bc3a7975b04d612f6c89206eae95dac678695fc..3191a910653ce4bd71de9a0b4465fd583602adf6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -36,6 +36,7 @@ enum pipe_type {
 extern struct iris_platform_data sm8250_data;
 extern struct iris_platform_data sm8550_data;
 extern struct iris_platform_data sm8650_data;
+extern struct iris_platform_data qcs8300_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5ff82296ee8ea5ad3954bd2254594048adcb8404..723e9f4cef42408168aca22b34ccd0a674a4fd25 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -11,6 +11,7 @@
 #include "iris_vpu_common.h"
 
 #include "iris_platform_sm8650.h"
+#include "iris_platform_qcs8300.h"
 
 #define VIDEO_ARCH_LX 1
 
@@ -326,3 +327,59 @@ struct iris_platform_data sm8650_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 };
+
+/*
+ * Shares most of SM8550 data except:
+ * - inst_caps to platform_inst_cap_qcs8300
+ * - inst_fw_caps to inst_fw_cap_qcs8300
+ */
+struct iris_platform_data qcs8300_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.vpu_ops = &iris_vpu3_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_caps = &platform_inst_cap_qcs8300,
+	.inst_fw_caps = inst_fw_cap_qcs8300,
+	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_qcs8300),
+	.tz_cp_config_data = &tz_cp_config_sm8550,
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
+	.input_config_params =
+		sm8550_vdec_input_config_params,
+	.input_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params),
+	.output_config_params =
+		sm8550_vdec_output_config_params,
+	.output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
+	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
new file mode 100644
index 0000000000000000000000000000000000000000..f82355d72fcffe7e361bd30877cccb83fe9b549f
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+static struct platform_inst_fw_cap inst_fw_cap_qcs8300[] = {
+	{
+		.cap_id = PROFILE,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B)  |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
+			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROP_STAGE,
+		.set = iris_set_stage,
+	},
+	{
+		.cap_id = PIPE,
+		.min = PIPE_1,
+		.max = PIPE_2,
+		.step_or_mask = 1,
+		.value = PIPE_2,
+		.hfi_id = HFI_PROP_PIPE,
+		.set = iris_set_pipe,
+	},
+	{
+		.cap_id = POC,
+		.min = 0,
+		.max = 2,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
+	},
+	{
+		.cap_id = CODED_FRAMES,
+		.min = CODED_FRAMES_PROGRESSIVE,
+		.max = CODED_FRAMES_PROGRESSIVE,
+		.step_or_mask = 0,
+		.value = CODED_FRAMES_PROGRESSIVE,
+		.hfi_id = HFI_PROP_CODED_FRAMES,
+	},
+	{
+		.cap_id = BIT_DEPTH,
+		.min = BIT_DEPTH_8,
+		.max = BIT_DEPTH_8,
+		.step_or_mask = 1,
+		.value = BIT_DEPTH_8,
+		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	},
+	{
+		.cap_id = RAP_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+};
+
+static struct platform_inst_caps platform_inst_cap_qcs8300 = {
+	.min_frame_width = 96,
+	.max_frame_width = 4096,
+	.min_frame_height = 96,
+	.max_frame_height = 4096,
+	.max_mbpf = (4096 * 2176) / 256,
+	.mb_cycles_vpp = 200,
+	.mb_cycles_fw = 326389,
+	.mb_cycles_fw_vpp = 44156,
+	.num_comv = 0,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 7cd8650fbe9c09598670530103e3d5edf32953e7..e5f1896e55c390e920d206e7fc2c2be283bb39d8 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -349,6 +349,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8650-iris",
 		.data = &sm8650_data,
 	},
+	{
+		.compatible = "qcom,qcs8300-iris",
+		.data = &qcs8300_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);

-- 
2.34.1


