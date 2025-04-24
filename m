Return-Path: <linux-media+bounces-30915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C078A9A70A
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D540A167D5B
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 08:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F73227E99;
	Thu, 24 Apr 2025 08:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O8GGxxDp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E127225A35;
	Thu, 24 Apr 2025 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484683; cv=none; b=kivWkxNBr4UX7fon55OrWyhrggvTKGaCEEyrkNYbLKdwOUvuSu4qEdM0eguvRe1x1EwseNhgV9CZTM8UXDI/HqSMngFUZUYbGED2kyia8NQvx0bGdmFOsnhjfXnDf9TNFX8RfKqM3HWoV+C5Jx3zy5uzPfqC1n50SUqUR8IZBzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484683; c=relaxed/simple;
	bh=isM/rjJmvD6SL8cS+qQg6hexr+fYFZd90bej7DuEnd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=W/+t+eMHAuNU6fetnOF5y8oNpf6AFkxLHX7MAYMR3mu6KuHnWXqPhQqxGVwNQx6uYup154s6Ti26qcS7XOSlATKues8c5TEIE6F96BG4TviWwOXt+U1/uMsU8wbdteXH1sPoQwQFJpbr7AgxHsDy+b52i1WLDwszHzYFfxyLofc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O8GGxxDp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F5CO016942;
	Thu, 24 Apr 2025 08:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXkOBGI2ixK8XBM411DVT4Anc5qPjv4greq4S2zyjoc=; b=O8GGxxDpNF7QZjk6
	+jlx/B+bsc/eiRf+6EzrVsgFj0ZiZMYuxww/ggAjrBYkRc+ZL1Gc8Tv4BBjfd923
	z01/c8H4O7u6mK62pgUr6K6dAKfN4GDsy+l9r6t8uzX9OmHsR8NLrsDwpmh3y5wZ
	9uSgnSQp4NBdoL9WOy+cDY5jV4QWuTTLARH6r/KFUSP/xx1HZkpTFnqzeTbtF+sa
	GNvzEY95ImR//aPq71usCflfgteuK1U6hXFOrPEi1sFoEtTAlD80ZKAgmMjK83fH
	NC6E6Vss1YkcqkHUFpUf0Ywgsw2hR4OVVDsKSw0uYo/F1+hUrdH1BIghVosx1TXq
	FNUezA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh14uan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:51:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O8pCph022498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:51:12 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 01:51:08 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 24 Apr 2025 14:20:47 +0530
Subject: [PATCH v5 3/5] media: iris: add qcs8300 platform data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs8300_iris-v5-3-f118f505c300@quicinc.com>
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
In-Reply-To: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745484655; l=8885;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=isM/rjJmvD6SL8cS+qQg6hexr+fYFZd90bej7DuEnd4=;
 b=Wiki9ZlhLjudsF+L0J8GGBUUZAGk5xHO7ADKAb2nR+7bQdFlyhHHda5j043Di74x7xiT/HBYs
 68RXQUi3FKoDa/9mH0mYyZv8CzvtBJH+tYqSwhy5iE1ylZQ/CwZ7iu8
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h6WNjFTJ59FgBEkkLySz9AwQP8IU_SoO
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6809fb81 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=glt1T1EG--dW8uzeodgA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: h6WNjFTJ59FgBEkkLySz9AwQP8IU_SoO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1OCBTYWx0ZWRfX/bep6oAheDuc 1NJy2sI/quXCvUNnN/DRjpCiKalfSYvB15NMWBh4irLh73+JoDasm6PZMEHe/y+K+wHaOKUJ2RN PmMjBYcsnbqaEF1WoOWsxKA3Qj2g97lh25wFVM9nic01SPluJfWLBFDD6zNfXF9STXVG9EFxfGP
 pukZjO3udSWndqbGxoEW+skPG3HWGnDqFBnCan6QZj8wS9XCW5IfIVJZ+M76ZppsiZ4k/viS53D OEN0BQRSQ7oK/5do3+z+/JN5mPZHZbCbyb1B0PPDliD1TKVcq/8sHqkroq66721ChardlsfyjJT kriHWNvKQdW8fnt1nvL4PW+5DgHQ/CAl/+/7j6E5KFkG5LuvvpMeoBMvpaAQqn6psb1v33CjZWt
 LmMc5ca/DCHyQgPueoH1OPZPlIBBDV6+nAEEZgIDqa8uztKti8BFY8nkfqhJBE1eD0ZpoJqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240058

Add platform data for QCS8300, which has different capabilities compared
to SM8550. Introduce a QCS8300 header that defines these capabilities.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  57 ++++++++++
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 124 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 4 files changed, 186 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6bc3a7975b04d612f6c89206eae95dac678695fc..ac76d9e1ef9c14dd132f306fae55cccbfa141092 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -33,6 +33,7 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
+extern struct iris_platform_data qcs8300_data;
 extern struct iris_platform_data sm8250_data;
 extern struct iris_platform_data sm8550_data;
 extern struct iris_platform_data sm8650_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5ff82296ee8ea5ad3954bd2254594048adcb8404..1e69ba15db0fd99a83fd5f9bccc0ba7d4ffe5a48 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -10,6 +10,7 @@
 #include "iris_platform_common.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 
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
index fa3b9c9b1493e4165f8c6d9c1cc0b76d3dfa9b7b..9a7ce142f7007ffcda0bd422c1983f2374bb0d92 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -335,6 +335,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,qcs8300-iris",
+		.data = &qcs8300_data,
+	},
 #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 	{
 		.compatible = "qcom,sm8250-venus",

-- 
2.34.1


