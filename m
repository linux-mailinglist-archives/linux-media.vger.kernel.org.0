Return-Path: <linux-media+bounces-27660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D42A50AF9
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 20:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0275A7A654D
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 19:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11611259C98;
	Wed,  5 Mar 2025 19:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGCJTLM5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD7256C7C
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 19:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201538; cv=none; b=nz5A5e+PKwQFCoWRxazJ18IxZ3XnzLLh37zD/kTWuD7MA8LGvQuByzzMu2DV+A1buOtlTrVWfgtOb69OwVXjlRc/A9oR25P9VoxThV8BFXfuEHAjnRPKBPOEeZ8YOhhfnmhJJak13pE1wsf8SJ4/Z08CeuAHOg2eAqoWc/ShNy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201538; c=relaxed/simple;
	bh=neXImAtQA6tzq28UA2f7Fc6YFrL/8512jm9dsPst4Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cz4fJdvRP+j4JdPuqccK6S3qobUrPGc+q7fiStT6N+VsonbQ9wziX/28Ci3Ib1QE0ZiHZs5pX5wJ3bjPnPHQTP7lPqWRQgcP9Tmk+jS7GAEoEOePgNcH/oqKSwVYKaRp6fFpJV/2j+dTGyBLjFjqursKvdS+GO8LlZ9TCQnhdyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sGCJTLM5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso49315695e9.1
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 11:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201533; x=1741806333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvVRJL05EetY3b5wXnazV4Utq3Bno8ucEIV3aAjgwZI=;
        b=sGCJTLM5akhjtpBw2rOqKdzH1v5/sNTJ8XuwjgZiiwYYYdpbozEUMTdo82pP0rAQ+6
         pCN880LOAO3K0JKIdEkuTdERbCn+O+V3JYV3VBdfopjLzghr/M5k/VRb3gCYptP3s+Vc
         eXBfEFO4M889JegPAYacxm4OgFE2MssEvIStp7UHSveGhaqUIhKRNLfrnZZxS70GJlR/
         UWTuL91IvOwEkwvN9wsU+hrwkKjC80HM2ZYR55CvzsuglUq0ZdZUaM4ptd4/GcUAXckY
         7atWsVkjhqf/pDD1tnRp4mVLNw0yKvjwO6gtmoV93q0qBUOs6eE7MMMFsFkFUk01/F1J
         T7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201533; x=1741806333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvVRJL05EetY3b5wXnazV4Utq3Bno8ucEIV3aAjgwZI=;
        b=aUMiJ/nEzcHdg6nQ0mwNNmULw9kcap6Lne5RSKXeeIrn1J+MgrkNQ/M+ereKdTfpvc
         X5GyBhn81r6bnaXpiAXLfBLvIRRNwiob+0QwrYUj76o7B4T/10yAWyddaMvNU8Rcu4hc
         Ak+PTLyi6dahiUGKB3DzvkuMb4gpbhW4nPjXesFaqcUV4suTjlDDPTXJS06qXrKUaME8
         cLvmgJjEfYhNEx9qOUVyovWSGT4+WdU8IzoBrKYvo9k/An4vDJQN8TDNZPsxm3QY05C9
         l64cc974VoNuJmISEOF9zKQDv4B2zWmH88QvqPGu4QObQm9aZHZWzfVghfK2B9e5AY5D
         tsYg==
X-Gm-Message-State: AOJu0YzWrdYN4CkAVByAQ4WYWrQvN6OR1lvYadCjMawUxVc+3IhH+9Cc
	i2CMWNTl8VyMIQJF/ERmOnvyhizt4nFhNK5/MEMm0cXV5tVmbyxzt0wYP7l6dVM=
X-Gm-Gg: ASbGncvef0uFSAkLb52WTlj+wNPTT+YRniAV4rPSAbL8Z/2sLJmNrh+YwIQCsgQa9cw
	zMeKwad4iOh6SVARkwadA2h0VPSNgV5Bbx2c77oOCTHCMzK6uZGP/kwlfciIxauLpE97h9af37Q
	IKcRqUYsTB6gVAD8Pk1CDfWu330PPUpn9RnAMf2eiUaDbzjoyArzGN2Z87HjWEYtqiQPNq/uAfb
	8g1jJjXtILo5sTlwqAeeRpaYXFlwhtWkuADinLDbMaioE7JJ3h1O5DA9w63ocAxhELwqUJ1t6CT
	4c2LmXDUA4uIn1U66lrQQqUNbYkf4TEYMSR1wEAs3WDF7K7BZ+Uav5AUmQj24sC0JQ==
X-Google-Smtp-Source: AGHT+IFYKLnbBRjUoClSNfoh1wWUEkoomndMQiw1Y73Ybrnmb822oEVcCwKZmOMKtP8MBlDxn2Meqg==
X-Received: by 2002:a05:6000:1f8c:b0:390:f116:d230 with SMTP id ffacd0b85a97d-3911f74bc14mr4769589f8f.16.1741201532944;
        Wed, 05 Mar 2025 11:05:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391241bd151sm2045218f8f.21.2025.03.05.11.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:05:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Mar 2025 20:05:25 +0100
Subject: [PATCH v2 7/7] media: platform: qcom/iris: add sm8650 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-topic-sm8x50-iris-v10-v2-7-bd65a3fc099e@linaro.org>
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5217;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=neXImAtQA6tzq28UA2f7Fc6YFrL/8512jm9dsPst4Uw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnyKB1HLO9Z9d394GsUYIIHIi6x+YViVfgPszprcEs
 3N73EoWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8igdQAKCRB33NvayMhJ0fSOEA
 CXRdQdRV1ZYZOurILMyVtf3HyF/wL0JbBB3ktMurqv7RarFp8KAcdq9CcXOVjpTq575rTJMwF3j1p9
 Ug9CCZ8lAOuDkpxyW/tQx3bwOeZEf7HZ91nRwWd0ZJsL0ZuH/H4PhM44RlzgGxvJcDixEmnmdQte25
 t04c8VcLrooeMi5rkGRn0f5d7uW1GlEmQey7Hfq64ND1/w73pO7iPc2AjykO7D/IRLMiuxDzwEgcAy
 CHz0w4Sz2CxkTGkXhVeLFCs+I73Dazhgrdjq062pZPUqS6eWzPXSJm/wPI2jkl+7hAXf6z+W2/d0fv
 KrqhEDUjBLJcwYE4wvvesrPLffBdNt4xhU2sAMesrc2G6BXQWQv33Y9kguT4x+nQYJB4OJdyVDbIfr
 3G1VdvAWsWBO4oFppgMpQeEW12/7bq3tq8BwCPUp4NqSW3JQ9FxadAVShQ+XlxTGraGRIUoSPR/b7I
 NXAf/hARIMF2LAx9uYUhncKpeLL3EeBqX7e6rSl8kHDKyUVwTu/fHjgb8kWWr4+rUqPqs7BdR1XyKr
 OwRjlo0PweXOzVt7TSz+TdP+P9o+cUXiO0MmaKQUB0dHXMgW3BJjWTpQnnM1KPnEM31Oku35y0Vx6R
 UUWXaRBR+p2MLIArCI3GE3KdxQFR55ASP6+r5rg2jXu9XZD3L+08w/026ncg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the SM8650 platform by re-using the SM8550
definitions and using the vpu33 ops.

The SM8650/vpu33 requires more reset lines, but the H.284
decoder capabilities are identical.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      | 64 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 3 files changed, 69 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -35,6 +35,7 @@ enum pipe_type {
 
 extern struct iris_platform_data sm8250_data;
 extern struct iris_platform_data sm8550_data;
+extern struct iris_platform_data sm8650_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 35d278996c430f2856d0fe59586930061a271c3e..d0f8fa960d53367023e41bc5807ba3f8beae2efc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -144,6 +144,10 @@ static const struct icc_info sm8550_icc_table[] = {
 
 static const char * const sm8550_clk_reset_table[] = { "bus" };
 
+static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
+
+static const char * const sm8650_controller_reset_table[] = { "xo" };
+
 static const struct bw_info sm8550_bw_table_dec[] = {
 	{ ((4096 * 2160) / 256) * 60, 1608000 },
 	{ ((4096 * 2160) / 256) * 30,  826000 },
@@ -264,3 +268,63 @@ struct iris_platform_data sm8550_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 };
+
+/*
+ * Shares most of SM8550 data except:
+ * - vpu_ops to iris_vpu33_ops
+ * - clk_rst_tbl to sm8650_clk_reset_table
+ * - controller_rst_tbl to sm8650_controller_reset_table
+ * - fwname to "qcom/vpu/vpu33_p4.mbn"
+ */
+struct iris_platform_data sm8650_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.vpu_ops = &iris_vpu33_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8650_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
+	.controller_rst_tbl = sm8650_controller_reset_table,
+	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
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
+	.fwname = "qcom/vpu/vpu33_p4.mbn",
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
+	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
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
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e..7cd8650fbe9c09598670530103e3d5edf32953e7 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -345,6 +345,10 @@ static const struct of_device_id iris_dt_match[] = {
 			.data = &sm8250_data,
 		},
 #endif
+	{
+		.compatible = "qcom,sm8650-iris",
+		.data = &sm8650_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);

-- 
2.34.1


