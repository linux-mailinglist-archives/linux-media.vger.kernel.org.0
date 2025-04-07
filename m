Return-Path: <linux-media+bounces-29534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F063A7E476
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 17:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AD4E189EDEC
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDEA1FFC77;
	Mon,  7 Apr 2025 15:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NU9DG/Kj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070491FE45F
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 15:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039469; cv=none; b=PhOyeZSSinDVef0AkJFJUz5RqdGeCpDrGAYkFEhHV0kOOgZnYgjefW72F64GRP9czHHkpKTEU6pP17NQ+qys60zUXjWjKA+UqVPRW+Tt/rYO920bojI/TaG8VFSOZVflrvJYURuLTjrxCB3byEGQHExc4cBsL733fryz9jOGtSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039469; c=relaxed/simple;
	bh=neXImAtQA6tzq28UA2f7Fc6YFrL/8512jm9dsPst4Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KMSiWvOMwzQeRt+Q0StS/pHS1oxaO9FvdB7iokmcnOJu7P3oBIEoaXVrBDJ+AkERtooLVAWbtYv+MJUVbHy/Lq6ReeAuKGvKs5oOinC1kMGaAYyjxNBgzhOa7Y2/Es8hbdZJrSKkMlHtTkIb4n5NWWeTfEia6+0RkkKcl7MEzR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NU9DG/Kj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3558975f8f.3
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039464; x=1744644264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvVRJL05EetY3b5wXnazV4Utq3Bno8ucEIV3aAjgwZI=;
        b=NU9DG/KjEbAZWy4uKneBAfMFo0Yy9+eLmoe1IzOUvWUQ1Al4VIJ4G7CTsdg/lzZFhG
         KNxVLVzlzkNz3XPqAViTtXdQa8PUmtMNRR5R6t9G3vrXrBD3OmO+QCwqDymuX3PSjnmj
         MBmrCH/TGvf3wKW/zxCsKljm1AvMQeyhpigiok2UdztOxNzTr1F+dIpHzlxGeoS4HNlV
         VFyISx+CIOGk7cEB4WiBnYXwyTPSr4pqa/7xJSf5R/2LcH+iPn0OgZ8FvrVCgdcF3Lea
         izIYNshs2wrx12X0bBQudaAt7ITnBn7dWchyalQMRyOgDH7Llvpj2T3knWzRsCuj+q6W
         r3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039464; x=1744644264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvVRJL05EetY3b5wXnazV4Utq3Bno8ucEIV3aAjgwZI=;
        b=oy9BkTH/bqEAg1Hhqu46vYFnpuQBagOaN98KHfY7tKqthdTpNdF2QLVV+2PXnB5ODN
         Z+r8fWci65QfUlAwJQp2j2FpQ0P2RoPu2y+qfOxOpii0gGd/dxM7sU7b7DK1S4zBMuN1
         g5C6/+18LPyVlLd8lJ+mDEqC8f8SbM8J78Msh2oQOXhfRin+KzuaN16NeYbxmgoo61HI
         TBUcf2NvpJXB9JibWpxrtJnZCWjS8bm27yYfkcK42gw41KH6eb8VG6q8liwkYQowLYSO
         eNg2HtOY/RI3E4ilfeWPmTQI5D57/ZAFtKWGpnlLEw/ZvfShsxvh4mAN1+sfMLHsB2H2
         Xu9Q==
X-Gm-Message-State: AOJu0Yy1k9/HzvpkEzLS0U7TDN6ZeSBI9Myl9AIlXrrDewdjkN2RfzXE
	vlMS0X2YcGj9mqQCxyvvMMiokLbXzersI00fNWp5KpX3u4Xf9Z/WE1ZHMC304xM=
X-Gm-Gg: ASbGncukyb7mjwHNaKMJAzg/ycR/Gmh73c4/PsM3ljjEEBi3fDzQZqaXM7hZgPPQq8h
	KgTG9qT8msLWOlk8GNHL9R5wk9itiPwgasMnm4WPQOSAA3YE5a7cDfdsHCpdYM1iy7sRW2Y2zRA
	6tx4ZGAOWUzaD4r58NIJYssoKj5p736cDyNWhWc4M40sKfaCZvX6lAG/7ykoTDiaBHysnYEsjgY
	mBlwvTdR8RRnu55IixUH5y3mKxk/FvMMbg+PIXwR+6Le3SsYw9kPSZ4whqYQrrOzI1ioD94l71d
	IWxUkKm+FoVI/WT8HtEXUrk9gSpN7MIlk5CuL8umoPxezqYDlUxit6+/SZIoa6I4qA==
X-Google-Smtp-Source: AGHT+IHBRqMiDiPVAjeRnWAr5LUDeSmE9wHz0sfR5rKfiXLkQ3xumNNQLM66y4ktKIF4vGMuDePqHw==
X-Received: by 2002:a05:6000:430c:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-39cba93382fmr10973353f8f.23.1744039464251;
        Mon, 07 Apr 2025 08:24:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b42besm12212001f8f.41.2025.04.07.08.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:24:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 17:24:17 +0200
Subject: [PATCH v3 5/5] media: platform: qcom/iris: add sm8650 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-sm8x50-iris-v10-v3-5-63569f6d04aa@linaro.org>
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn8+4j0nULgROhyU7aboOye/k8H2jz5sPE6W1sl6I6
 s+uzY5aJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/PuIwAKCRB33NvayMhJ0VuyD/
 40kl4zHzWK5Xmkv75+p6h9FHxrRPpglQiiMrtp7UVlwXQ2uhLsV+aYatTw6HY1AY1Ei06uYIcfme7t
 Zg9fO262jpl9i1KLUVXt8Mkx/FuZlKLwRU/RCdFpVJOfqynGfOlDkOoKoyLM9K7R8jxvezN9NZOqES
 5wm9T7PDdvULxzzDte08K+0u8o2HQjKA/fzZzoYjOX/o0WiXXqbQzhh/IIi+gFxxW3Mjt2V+bqmVRQ
 tSxlEpHs6LbLGIUar2gd58yqxrVWfJ7G8DMS0PsaHx22V0Cu8Kw/xiuQ4wmat3te11JBSKLJ4D8iXW
 8zsoNanTyCG0wpBGmpZSmthsEpZMnBabpy6RVIPxDKJ1qROkVaWikduUyCfw5Cqj6+A06bO61YrhWn
 zLHD9ySNmVzxGUnOH12pTC27VRpcsSVQo5mhRaC6N/9M7SMENGlRvB7j5kzOAGCrDkX53TalNGZW+o
 YVLdilahUVTONrJLYlCuv5vt5NOkxOOTG7p+3dPWGbD+lykd9Z8L8lgMcQA3UMpb8PrGYnEKn0Y0yZ
 kvZ3PJ+htkS27SzwIrmmLVZq/Vv9/5ZGsNphXLIIEvab6APnl7JqY1j9/Q5wtQdILSd0Wns9k9rwvi
 gTJc3vweAqEZEKQ8aQsY/NOyWQ8Cjg+hg8JQNtBlfVJDxa+JOfy2qjSEeL6g==
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


