Return-Path: <linux-media+bounces-37628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D62B04058
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AF1F7B05E3
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4A3255F4C;
	Mon, 14 Jul 2025 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQVJ74by"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA5A2512E6
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500495; cv=none; b=eXEWBPpIklLymhw0vPWpoQ/V97JMiKtDAdWYw+M75MlVm45AfSjJmR1QULO1q425NnjP3elSZwofcxonate+q+sSr00PSkP4kSlAnzep/Obnm4McplMmqr9dX9fU2SS5/DpQ3/EWSXPkBJrVvJqIykTTwoBK3nebuINPmjB29Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500495; c=relaxed/simple;
	bh=i0K/LlWzYq+vH2Fvviwgj+oRLZM0bLuBlclZyfr9jYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mmj4yuZXM69Ptvj0gcwO823JqHLS4qqC3XBWYslvpkkSGOoXr1PVTdzTCkCTY8tr6/J/R9tOqpIhegb/K3TkoCJfsHuZ05LvSDArEg1XL9ogKq4xkpGR1DHbVwvhqA3S5njK2YUi5F8pIL39yOVwBFcH9JNuqXqNplHY6wHynvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQVJ74by; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so643661f8f.0
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752500491; x=1753105291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJWPqrlQF1baw83/gR8GKPvH1Wc5XQeX24WBznJ/8oY=;
        b=YQVJ74by2TXU3y66uQGpHnWDCQmaJL24dPHgw6IBt4SBxjLqo7ZPkYGKHIXBBCOWbJ
         WehKjDQxD2H1b99t8xyq1/2g+l63AvfUdpwOLsDHPZ8fJC56lGWTZPVB+aV/YfliKWCG
         urgTzBG1NyowMW7sNDNla8pxMT0GM3cxT4+940WM8rML1x+5aKjG8+BzX1IyhNRligRU
         1+IctFX9MCIW36JhkcJmDR674dofzOx2Oeu4fcuD04JtDKSKOP33Pb9Rxs77pGtWEeMs
         symOb6xt/hTyWKIXwpsHlWdQapsw7jZw2hP8uallr4E7HzL5esEO0veqBxSue+0icWd6
         CBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500491; x=1753105291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJWPqrlQF1baw83/gR8GKPvH1Wc5XQeX24WBznJ/8oY=;
        b=Y2prTYe2uLdA45Xq50U7+IeoabHbtApiE9+g4a/cDBhVVojLgBTTmkMttUZdcPgAjE
         MwTxlxSNBf51ooAu/ngHznf15u+XGBZ4GNlNtvRxSD/ZIuVJWGP1qOfgz6REnxDY5dzd
         heEwuvT1QRfscINtFTV0AYNVtt3EwY4j1ZoHV97YD0Vbwn0pUgxYBquNH2jCxcaklESz
         lTx4MLffuu3c3CL4MMmAg7+32v7tE0oyef1z8yMiWzAIzxKPltWhcD0D0/LA0Wp4ekgl
         COF/jRIsYIUbk0CQ8EsyfAyeLDiCwYQIY6dgBOTgm1WkPNIqlDFoDkTdhzw3RKnkOVYA
         fmRw==
X-Forwarded-Encrypted: i=1; AJvYcCXBKHBPn7Tyai+PRP9uC9jpkIa9bi+ZiTaBmeWOnp3O1oPo8dZ5wrNFXIu2N4lJUyUPvLxcwbFqIa9aNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpXpotV0dKo4VcVMQWiNFqSJOEC1jPiY0HX22Ru2JvlT7oSDeN
	5HfkNRSOO67aPv1Co93naJNI95LVlP70rpihElcJ+HuVOJkn5Gv7HMBwKuHR7Ob+Cpc=
X-Gm-Gg: ASbGnctyo9LwEUxzaqzdvNj8emsCMU3xphf0hFFWb0dckgNLEv2pOQ5FbNsVtPNjvLi
	CkC02vei/VyesfQhRE/bqng5KMd80YyPMUfuCppX9t5+9FB68Vagl56nS+p8FMU9WNsgdvdSJx6
	niO2tGbzs0HTtxWHLZGvwgCa0vvX404P3VBp1U/06rXkC0nXsC5ONs0MAjvd3L25E/30oNHjXO1
	TcCxRC60DaG5jMAw8n7f8ZoW8ecJVsPQhT4DDMR+FopE+XGpiv7D4fqUq2ebGpW9KtcjT9t8g1r
	Wcj6e0r3XGexpk/cSpUPTi0t7BLgdmUFtw6y1nju5rgkV2eDKr9kSdPKGHMHS11dv1/x+bb+BFL
	TbWh6kQCfNBnBcSeStpMhr4zN2RAKz8OjcuP6
X-Google-Smtp-Source: AGHT+IGL3IRU7nC0D+p5FvJdd/lbAgg9H5EWw9bOhTNFd2Fb3AkxJURhVh6xEe6Xw2a8YyJIB4t5/A==
X-Received: by 2002:a05:600c:a117:b0:456:2137:5662 with SMTP id 5b1f17b1804b1-45621375ademr6087655e9.7.1752500490511;
        Mon, 14 Jul 2025 06:41:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b176f87sm31371375e9.35.2025.07.14.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:41:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 14 Jul 2025 15:41:18 +0200
Subject: [PATCH 3/3] media: iris: Add support for SM8750 (VPU v3.5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-sm8750-iris-v1-3-3006293a5bc7@linaro.org>
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
In-Reply-To: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17400;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i0K/LlWzYq+vH2Fvviwgj+oRLZM0bLuBlclZyfr9jYk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodQkEDv0i1qoowT0K1QZkAmbzMVaR1J2VbzEB+
 Juk3eMsL+uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHUJBAAKCRDBN2bmhouD
 19APD/4ljyzaXgCKSz99SW+bJGBV5Z6Il+IKaC5lI9SMW94Mc0nqjL33B4ajiDQcl6ozNSSYkHQ
 JsKs51XFs8NNw4ayztejs9q2i5oVIMB1/Od3CrJNWBQAtwNRP2YFm4qiLrfxx0IG+drnzbTnu0D
 VbQvtZAoUWfBq3IlIF7Cwk9OHRaovSDIzBK/qNYMYgvVSDVBQC295QMbsK5BIvvUC58ZF45l8Ph
 ZyU6/pvg2wURwGl097JM/Oy1YBzKLJk56vEv+m+8YZcEEI2BzKeWYvo/h/7DXRO50Uqm+qEGZdz
 YDJGrhatY4SK361ntha/6H6Bw87SF0UGb+l7BqkjkBdef6yplcj0RHqIxE8vEKj3avtVaAfHxPc
 9lEi7HliBifUf9Fy/ygWerXuDbe4txzryIIr1Pq/eqgzJ6JMtLg54tzZXB6hozv/C6hiUr0Il8T
 JedIcfT6UjEpEHrtk9TXUCaHxZawGPg3FlCUHX9FV9P57oOvomShXOpAlGNRd/b2R+EAjBXCSF9
 vEP9YZdtf+oWC6zEdHmeOmP+0HWbvUzna+eYTlTS3guUOOzTmdHDkJ/cJWSJugxaV1ls2GlTHaP
 LI9eigsfUG2mBAMihLl3fZaKTIqtUFPJ+Hs0fn9sU871LBmdKfSlifiSP5Mvp9ZQVbFOvfrS94v
 06MPt0oKYrE5NHQ==
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
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 +++++++
 .../platform/qcom/iris/iris_platform_sm8750.h      |  22 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 203 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 7 files changed, 308 insertions(+), 1 deletion(-)

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
index d3026b2bcb708c7ec31f134f628df7e57b54af4f..795efe2226228c4d7155ce18ff42ba9cb74b4af2 100644
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
+	.fwname = "qcom/vpu/vpu35_4v.mbn",
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
index c235112057aa7b7eab1995737541b7a8276ff18b..b00702a4d6c23258550a77373eb34740e785ef22 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Linaro Ltd
  */
 
 #include <linux/iopoll.h>
@@ -19,8 +20,11 @@
 #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
 #define REQ_POWER_DOWN_PREP			BIT(0)
 #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
+#define WRAPPER_CORE_POWER_CONTROL		(WRAPPER_BASE_OFFS + 0x84)
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
+/* VPU v3.5 */
+#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 
 #define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
 #define CTL_AXI_CLK_HALT			BIT(0)
@@ -52,6 +56,8 @@
 #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
 
 static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 {
@@ -225,6 +231,194 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
 	return 0;
 }
 
+static int iris_vpu35_power_on_hw(struct iris_core *core)
+{
+	int ret;
+	u32 val;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	/* Switch GDSC to SW control */
+	writel(0x0, core->reg_base + WRAPPER_CORE_POWER_CONTROL);
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_CORE_POWER_STATUS,
+				 val, val & BIT(1), 200, 2000);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret)
+		goto err_gdsc;
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
+err_gdsc:
+	writel(BIT(0), core->reg_base + WRAPPER_CORE_POWER_CONTROL);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu35_power_off_hw(struct iris_core *core)
+{
+	u32 val = 0, value, i;
+	int ret;
+
+	if (iris_vpu3x_hw_power_collapsed(core))
+		goto disable_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
+					 val, val & 0x400000, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
+	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_power:
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+
+	writel(BIT(0), core->reg_base + WRAPPER_CORE_POWER_CONTROL);
+	/*
+	 * Do not wait for power-down, because hardware might delay it (it
+	 * always timeouts).
+	 */
+
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+}
+
+static int iris_vpu35_power_off_controller(struct iris_core *core)
+{
+	u32 xo_rst_tbl_size = core->iris_platform_data->controller_rst_tbl_size;
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
+	reset_control_bulk_assert(xo_rst_tbl_size, core->controller_resets);
+
+	usleep_range(400, 500);
+
+	reset_control_bulk_deassert(xo_rst_tbl_size, core->controller_resets);
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
@@ -277,3 +471,12 @@ const struct vpu_ops iris_vpu33_ops = {
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
2.43.0


