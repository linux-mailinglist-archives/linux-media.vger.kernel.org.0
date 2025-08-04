Return-Path: <linux-media+bounces-38859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9CB1A392
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 15:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54E84620E67
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 13:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D1526D4E3;
	Mon,  4 Aug 2025 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a6+Njhnj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FDA26D4DF
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754314677; cv=none; b=YArE8YrVx3YPfhci++Mpq69U0c7XyyamIKTB/0oGBqMLYVltVSqZpYpDuLhk0kFS5+N4wgNn24h7+oNw7Oa/xyfrjh10jmKAUdqJ3xlEbr80EZ3cayy6zRP44KiwVdz4VuFaA+b79dHXqmp3X+FhSMOJceO4AMa1PMIuambvPA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754314677; c=relaxed/simple;
	bh=OkkzwlTlIswOtIsVRUIyGeqkadjY3iO1UMpWmycrQ7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3ktO7fVvtYkaR96BW+QVbH0AqK3lj3sTxyN20LUDkEnrnNhKqYy4eEuyP3n2N/5c0BV4ZFsugEatRPzTlndmy+JD80WAnXYmKf64Yne/vrGChvwh76POQC+OZL3iS1W2NfpplHo36V79ftoS/aZk7qs51oI1UmMI8GtFq8hFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a6+Njhnj; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af9176e6134so67062866b.3
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 06:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754314674; x=1754919474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUssIjapGIx6gyV76Tc5i1eTr3ROiN2kUpMKAZhON7I=;
        b=a6+Njhnjzp9Oc7c1V/EYUd+To7f3UxSJVNiAL0YW3xh19V1fxpTiBns4hS4GqIqiDw
         5b3hKNDyUMkXyVq8DcnqTfNGc/HGaiahV/blT/493Qoe/zhrLVq/20b08YPXmuxL6szu
         1SAJlKXDLlVjtp9CqDQeYLEKfqBtLkJdDcY0Ha23aFYXfV9U3K7972cRTK3gVTqAp81t
         kT8wgCXds/eLenJ1QUoG/66sdEhUEztLhKkCm9lKeLVKsi8jTd/yXHLJuFzDkEITmyBs
         I8QCcs6o9Qfqe6Ri39l+wwx7wkM6HayvZmHygQg4Zhl9B/fP243LJQT32X77Y+a/MiIe
         aHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754314674; x=1754919474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUssIjapGIx6gyV76Tc5i1eTr3ROiN2kUpMKAZhON7I=;
        b=tHISnOlN7+y/NU67DJYtJEsAt+VljKy9E6FMqROXh5WLTql811Hyo9kQPPDtMa2Enp
         Foxva14pognBaMO7oWf/RzYcUiWqVjyQVR2/FHvjTQ/wWomk2Cu9HRBCIScWqyVD3zBh
         gBAwSD4u6iDxEdhw7fYuAEo+dY3dJmu5zfnccXH+Qm8ULPvDqdX6NjJH7B9/CLRPfeTE
         zDz4ONcM3yPfon8Na796fswQ7qbgGSAb2v+JOkT9fBF9KCtMnIcN1B3lK4ZbMxqcfMKq
         q+twnnU+rJugJwOyVSYbDRvDvCkRpfTDXUIpV6g7Wz2yBJoDHGje6aapg1CH5n1KX3IE
         hIug==
X-Forwarded-Encrypted: i=1; AJvYcCWtb4qG/Ys9SteEXKKZrNFnfyhwFEkyAazsPA6j6PKQJNP3pWl/qBfujNYBw2sB4m2DBDnuMmMca4ofBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNeTM3TcABZe+/YJAM9g0FdXfNOerDwfX3cMjLXn7by/OkPM+T
	p5uLF5cC7yB9hIZks0czPpsPvIvT+5i4w2NiToavKLPHvvU3u4w0fGP5rYpGQunkEKE=
X-Gm-Gg: ASbGnct1RKJT8VBIF44fkYhy1M0rODDi9zHhBp6ItU/X+MmJWt+90TqzcJ4Wyczmult
	m0osNj5jyZQgK/F0CsipUQYq5J7yKVXCZucNIrCk7r71aQIu7ZOhX0UxOGwjxbirt+m5XUYMhly
	nWbNdFQoszuEiX3ouJVjFyjnEOU/5g9d1Uv3V2CKc5JdhLbT3w191D2dkN1yiIdj9NalPWp7SKY
	+OJIFuz+cqHNcaBqkEyIelf1BQ73x2IgqdK/TP83aJrZjTpwealpYMOssQPTWmLYux5k73x0fdu
	BYX6cFCAD+6z3dBUDLsLjzug67qS5SBN+TKycLKUUAq8pC0Rc212Tv+QqSFLk5xuIfMa3ZdCMLJ
	hT7EFP729zAZGLDe9F/Ym5qbvhmHu05EDjiE74r6Hwe0hchT0yFl00Li6ghV2
X-Google-Smtp-Source: AGHT+IH1jUwz1faa0ur3nGsP2laIgjCWYvnosp+3/cyknKLSU5mo+Rx5BTepI8NXMmhCLhExGHR3aw==
X-Received: by 2002:a17:906:7955:b0:ad8:9fa3:8dd9 with SMTP id a640c23a62f3a-af940187868mr358502466b.13.1754314673481;
        Mon, 04 Aug 2025 06:37:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078cbasm741533166b.5.2025.08.04.06.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:37:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 04 Aug 2025 15:37:40 +0200
Subject: [PATCH v2 3/3] media: iris: Add support for SM8750 (VPU v3.5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-sm8750-iris-v2-3-6d78407f8078@linaro.org>
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
In-Reply-To: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15215;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OkkzwlTlIswOtIsVRUIyGeqkadjY3iO1UMpWmycrQ7I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBokLeq6iwhe0NZxP31r9vtQaZMwlIgiT7vnXoAQ
 sQStaX+sMeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJC3qgAKCRDBN2bmhouD
 14vQD/0dP6HXWiLcWoMoOLMYyaNr3tBERWpIrlR8tmFzt0YA3WHEz6f5tJBS5WELXS7G9Q2Eevp
 eK5mHdmljVIO5AwcJ6/rXOgvD87bzTqT4kmramW38zdlhizLkIVhTPSiJUL/o2WBaO9PR0fAxKO
 JEFPceE5PqhsjLnEtOmrmnD3ekLy9q0aCEKCw7mQiqG+MpwP71dPfPS0b5BLDpHgV3LfWbSsJJK
 4RwRy5zbqav0M/sjfRPqBn3nAnlzyeZAXdmZOy5Z3GWHgLUGCPb11u+emZs9yICtDs1E3iZQUmv
 ZFxRKwuImlXGzsofKVBxZuQigzn299yX/wnafnccZScVCClvDvQnkb0n8sqc37KP18YHIsDsjSN
 UOyMXlPBZhgXVRwkrQ1D5gD9KhwGyUwvCdLhxkOpXYw0Aq7ITG2KOGzffwMeLnXDQcABit6tZAj
 ijzL7Kesy0pO8O8NeMhz7S9DxvCPGP9HIDFfKJ50hVd/NfIhvW0DiOphdj4CyEXcc5wwuMehjRr
 za9Xsu4sRJs8e8QLg+Hh98CEcV2zAmXxlG1T6tukiG3kQcpLIogieKbldgkGyINN6DtRRbeemaE
 j9I3cJc6nqaF9hzk5d5gsddxW+hUMcO/EQicQGNLgZCkS7MiRjj90VdWbcUh2JSHEz8LRYUvCOu
 CQZtoGQMQtf8W5Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for SM8750 Iris codec with major differences against
previous generation SM8650:

1. New clocks and new resets, thus new power up and power down
   sequences,

2. New WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0 register programmed
   during boot-up

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 ++++++++++
 .../platform/qcom/iris/iris_platform_sm8750.h      |  22 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 146 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 7 files changed, 251 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index adafdce8a856f9c661aabc5ca28f0faceaa93551..fd5a6e69e01cfd00253f4ffb282d40112b93073b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -38,11 +38,15 @@ extern struct iris_platform_data qcs8300_data;
 extern struct iris_platform_data sm8250_data;
 extern struct iris_platform_data sm8550_data;
 extern struct iris_platform_data sm8650_data;
+extern struct iris_platform_data sm8750_data;
 
 enum platform_clk_type {
-	IRIS_AXI_CLK,
+	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
 	IRIS_CTRL_CLK,
 	IRIS_HW_CLK,
+	IRIS_AXI1_CLK,
+	IRIS_CTRL_FREERUN_CLK,
+	IRIS_HW_FREERUN_CLK,
 };
 
 struct platform_clk_data {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index d3026b2bcb708c7ec31f134f628df7e57b54af4f..c7c384fce2332255ea96da69ef4dc0bc1a24771c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Linaro Ltd
  */
 
 #include "iris_core.h"
@@ -12,6 +13,7 @@
 
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
+#include "iris_platform_sm8750.h"
 
 #define VIDEO_ARCH_LX 1
 
@@ -463,6 +465,72 @@ struct iris_platform_data sm8650_data = {
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 };
 
+struct iris_platform_data sm8750_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.vpu_ops = &iris_vpu35_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8750_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8750_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu35_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps = inst_fw_cap_sm8550,
+	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
+	.tz_cp_config_data = &tz_cp_config_sm8550,
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.output_config_params =
+		sm8550_vdec_output_config_params,
+	.output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
new file mode 100644
index 0000000000000000000000000000000000000000..719056656a5baf48a7bced634d2582629333cf5c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Linaro Ltd
+ */
+
+#ifndef __MEDIA_IRIS_PLATFORM_SM8750_H__
+#define __MEDIA_IRIS_PLATFORM_SM8750_H__
+
+static const char * const sm8750_clk_reset_table[] = {
+	"bus0", "bus1", "core", "vcodec0_core"
+};
+
+static const struct platform_clk_data sm8750_clk_table[] = {
+	{IRIS_AXI_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,		"core"			},
+	{IRIS_HW_CLK,		"vcodec0_core"		},
+	{IRIS_AXI1_CLK,		"iface1"		},
+	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
+	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4e6e92357968d7419f114cc0ffa9b571bad19e46..5fb936a04155e72f4298cd6760eff6e9d1da6310 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -353,6 +353,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8650-iris",
 		.data = &sm8650_data,
 	},
+	{
+		.compatible = "qcom,sm8750-iris",
+		.data = &sm8750_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index c235112057aa7b7eab1995737541b7a8276ff18b..86a5aeaba9f336c1a08367842914e0d50f538622 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Linaro Ltd
  */
 
 #include <linux/iopoll.h>
@@ -21,6 +22,8 @@
 #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
+/* VPU v3.5 */
+#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 
 #define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
 #define CTL_AXI_CLK_HALT			BIT(0)
@@ -52,6 +55,8 @@
 #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
 
 static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 {
@@ -225,6 +230,138 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
 	return 0;
 }
 
+static int iris_vpu35_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axi_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_hw_free_clk;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	if (ret)
+		goto err_disable_hw_clk;
+
+	return 0;
+
+err_disable_hw_clk:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_hw_free_clk:
+	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+err_disable_axi_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu35_power_off_hw(struct iris_core *core)
+{
+	iris_vpu33_power_off_hardware(core);
+
+	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+}
+
+static int iris_vpu35_power_off_controller(struct iris_core *core)
+{
+	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+	u32 val = 0;
+	int ret;
+
+	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
+
+	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0x0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
+
+	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
+				 val, val & (BIT(0) | BIT(1) | BIT(2)), 15, 1000);
+	if (ret)
+		goto disable_power;
+
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+
+	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
+				 val, val == 0, 200, 2000);
+	if (ret)
+		goto disable_power;
+
+disable_power:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
+
+	return 0;
+}
+
+static int iris_vpu35_power_on_controller(struct iris_core *core)
+{
+	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = reset_control_bulk_reset(rst_tbl_size, core->resets);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axi1_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_ctrl_free_clk;
+
+	return 0;
+
+err_disable_ctrl_free_clk:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+err_disable_axi1_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu35_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
+}
+
 static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
@@ -277,3 +414,12 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_calculate_frequency,
 };
+
+const struct vpu_ops iris_vpu35_ops = {
+	.power_off_hw = iris_vpu35_power_off_hw,
+	.power_on_hw = iris_vpu35_power_on_hw,
+	.power_off_controller = iris_vpu35_power_off_controller,
+	.power_on_controller = iris_vpu35_power_on_controller,
+	.program_bootup_registers = iris_vpu35_program_bootup_registers,
+	.calc_freq = iris_vpu3x_calculate_frequency,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 6c51002f72ab3d9e16d5a2a50ac712fac91ae25c..bb98950e018fadf69ac4f41b3037f7fd6ac33c5b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -84,6 +84,7 @@ static void iris_vpu_interrupt_init(struct iris_core *core)
 static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 {
 	u32 queue_size, value;
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 
 	/* Iris hardware requires 4K queue alignment */
 	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
@@ -105,6 +106,9 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 		value = (u32)core->sfr_daddr + core->iris_platform_data->core_arch;
 		writel(value, core->reg_base + SFR_ADDR);
 	}
+
+	if (vpu_ops->program_bootup_registers)
+		vpu_ops->program_bootup_registers(core);
 }
 
 int iris_vpu_boot_firmware(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index d95b305ca5a89ba8f08aefb6e6acd9ea4a721a8b..d636e287457adf0c44540af5c85cfa69decbca8b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -11,12 +11,14 @@ struct iris_core;
 extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
+extern const struct vpu_ops iris_vpu35_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
 	int (*power_on_hw)(struct iris_core *core);
 	int (*power_off_controller)(struct iris_core *core);
 	int (*power_on_controller)(struct iris_core *core);
+	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 };
 

-- 
2.48.1


