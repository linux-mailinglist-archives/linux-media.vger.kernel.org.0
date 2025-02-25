Return-Path: <linux-media+bounces-26915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D87A438F4
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B10617FD2D
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBED266B62;
	Tue, 25 Feb 2025 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dNoRXEcN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E73266597
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474326; cv=none; b=cvODNcmKKvepfqMiteWg1a75ceJjE03jF07ygb8m73DvVSQ0/EeyEVwOTlCkxE7cbB3RIy+kpAmbEiGRaIfMNycMGICNulUx+9mizRqaIl1EiqLL+alGKXRlErQAu2cCPiYZpUgXg7TN42RToVg5yU52YoGDexfsDSulVAsY9mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474326; c=relaxed/simple;
	bh=v00FvgOpYb+n3FGLO6d0TWMNJxGJTCgKGQ6XpRBKpZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXtJMO+gbL1zkKFzs97xy3UDE0shePPs+PedevxedY36KQEO1JDRV2p/YHJ193qj2xBTXrg8jZYlGx0aQyQ3UZM5PIFh3DLl6OJueFXLd/quou/D4PbraDHBsNuHo+MUOJUSQ+NtscQBg7j6hV5/uPAYRoYPF6DiirMhZnULKXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dNoRXEcN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f70170005so3152886f8f.3
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 01:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474321; x=1741079121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYmR6wYxHn+OrnAqeln0/aM1+4hC+I2kO2nIYcMMvmw=;
        b=dNoRXEcNpKTgyENRt2YKRnxuc7ju/CM3DuA82uiDarjV+d0xiIYrd9z+N8rV7GlB5O
         sJa3NJWhHJAMWX/S6ulxy00O0GbsTiSoCjNLUm2RUQI+WfuEtli+36acp+qidtPGA0tx
         d5W1pXZbuIjgVzEiKVoVAYUJHf0ShBs8cPISsQoZ8ssJGNtp6pAfkjGF4KjJ2U1lnfzA
         VF+SGucMWavbnJTPE4SF9a0cjF2SKrjLxf2l0FEzJmtvHnKvimNyUQ44YTae6xRhHaoX
         6JfXpj6MB5J+6xfuL4VnLX7j1fW106wwqmiPTsaV/619A7PgIPJTEiFOi3JQaiGh9Jke
         zuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474321; x=1741079121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYmR6wYxHn+OrnAqeln0/aM1+4hC+I2kO2nIYcMMvmw=;
        b=Kgze4LwdQAfiGMfSP5cyd6AEtPMCyaVUztdtvAOjTzgYSOmgk7x1g+Iee4miR6LarI
         87Ki2y8Yr1GaDVkFbpGZYUMVzSPm8eyu0i3AT0S8pwa+fLIMBG4rOcQgEXLBNNJlHgs/
         D/aQ9jnYr1k+WgL1fLGHJxpEDjysA8Ntg7GL+g6YRyS9Ko1W9vXTVp87zLAbn8HZAPNp
         xkc3jQwipxOYgkwA19APR/r1PiIEyNLwxg54i/aeZ/VNYexa3zgS5lVVKg36hE5pimQ0
         eMjZzlLITt7t5a9AZCnZkYELwxPVyzawMIvjDAVfKJ0Bfroc1cmsvhKzEI/NNlpcw4xV
         cxUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDmh5sfzq3ubx56M26cLRzWC1+M1zZaqen4q83Par4Qpp0lJAdqQzFEnpufqjQhDtnjtqXiWFsINHTGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx21IDtZgMRUwmfcWP1BQtMCgXW9Eh5q28iP/Q6iB/v1sgVh3lf
	Ja6sdHk8wjDtQPyq8nAz4qJwiyCfvNMCZZG/OJHzw4601SP1uvpNEePfOBFFrkY=
X-Gm-Gg: ASbGnctMFdEj1cYGyQTNkbCck4Ad0GhJTidbybAIBKZVIbJpNuDPLvtPSVCCuhl711e
	fPQyCxf8WYR4dgTL4FzpchkE2y35NAilVYtUVgJ9+xyJjymB14qh5FqMQjmMpNZoFI1jDHDw9sC
	kHg4khEwXlFfqw7BLzTUPuZaK0R6dhWic+NBXg0ORW4ZlrO1PGUVPLteYDkgQ0qlJOvS0W6LVbK
	16Bc0sBXqBJJvfSlkhYQmxZeEmnX/ZS+AlVhafXmu4BSRJwPbBV2J3gam8haa3NGci259S7khEO
	2fFgsscVcEZSFoniyMRxOX56jJW4AypGQde2HxFzk5pJS94=
X-Google-Smtp-Source: AGHT+IGXsU7hwX2gAxEY6VM940MGo0A6mKVnjChXhYTPaOpxxIOzGvKpEQd12j49B57MKG7ir3Lmxw==
X-Received: by 2002:a5d:588c:0:b0:38d:e584:81ea with SMTP id ffacd0b85a97d-38f6f0d1c8bmr14397863f8f.45.1740474320749;
        Tue, 25 Feb 2025 01:05:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86c93bsm1573540f8f.26.2025.02.25.01.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 25 Feb 2025 10:05:12 +0100
Subject: [PATCH 4/4] media: platform: qcom/iris: add sm8650 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-topic-sm8x50-iris-v10-v1-4-128ef05d9665@linaro.org>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
In-Reply-To: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10895;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=v00FvgOpYb+n3FGLO6d0TWMNJxGJTCgKGQ6XpRBKpZQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnvYfM2Pkodfx6ekVFlWwGC6OZlaJQwd1Zg59AtaMQ
 ll0ke2GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ72HzAAKCRB33NvayMhJ0fBPD/
 0ex0MrvnJ4VSu61N+p3fbe5XoMW7FsUtGQlHerBoFYV8dyvkXHnCZ2+ZaVec//9iZVqr9MpWFWxm1v
 jVGnzgby4nvCV4+oyMkt7P7lkRq9twRscWd9yk2OBrmGSsE7XXjpElGq1xUx9GJFuetiO5wfrn6e6z
 yhT9daI5GNFgV5Tgl8mwgDDqeH54iGELuw4VjEzJQwFsDW9MXVUUSdBeLhp77kCHOA+Ms1Pm8p8mQn
 AVf9v531WrAX2RuwVVd/IUOWRrE+g4OkGYdj9GzR39agzDkub9NnUbPV6vQLfgXyTDmJJJ8NuRie6i
 fMeGkFccjwbdrxwbHVU3kLQcmcYHgSfGd3Tn3ouAkNvUiws+S932ncBGB93O4nitGwN7JwLy/FM4Yv
 hBGx/S4W/qKccEm4YznMmOMochU57GmpWTlSGDVS5KKDTsjH9BHsFCovNCa/aaumrGKBYhUgPbWlTv
 hx7WoNhSxrbg/LTFTZBWCKOJJsYcDeq4XRtUcBeCEt1I3pbiI05spvY78B8on2PUPAmo0ml5XOfc5k
 0rHcuWDcZoqNS6Gon7K0pa202zm6ThDhJ1Ql8MFOSviFH31j7UhhLjKbCIhfeDOKy3IyD3OOSqMBxD
 QaASEjQBc9otjwMmnuayINzAqi6vNWQBC+EshgWVc/YLsPz0wMyh55Qz7SCQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the SM8650 platform by re-using the SM8550
definitions and using the vpu33 ops.

The SM8650/vpu33 requires more reset lines, but the H.284
decoder capabilities are identical.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_sm8650.c      | 266 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 4 files changed, 272 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 6b64c9988505afd9707c704449d60bb53209229f..4caba81a95b806b9fa4937d9c7973031dea43d0e 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -11,6 +11,7 @@ qcom-iris-objs += \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
              iris_platform_sm8550.o \
+             iris_platform_sm8650.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f6b15d2805fb2004699709bb12cd7ce9b052180c..75e266a6b718acb8518079c2125dfb30435cbf2b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -35,6 +35,7 @@ enum pipe_type {
 
 extern struct iris_platform_data sm8250_data;
 extern struct iris_platform_data sm8550_data;
+extern struct iris_platform_data sm8650_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8650.c b/drivers/media/platform/qcom/iris/iris_platform_sm8650.c
new file mode 100644
index 0000000000000000000000000000000000000000..823e349dead2606129e52d6d2d674cb2550eaf17
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8650.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_ctrls.h"
+#include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_defines.h"
+#include "iris_platform_common.h"
+#include "iris_vpu_common.h"
+
+#define VIDEO_ARCH_LX 1
+
+static struct platform_inst_fw_cap inst_fw_cap_sm8650[] = {
+	{
+		.cap_id = PROFILE,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
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
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
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
+		.max = PIPE_4,
+		.step_or_mask = 1,
+		.value = PIPE_4,
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
+static struct platform_inst_caps platform_inst_cap_sm8650 = {
+	.min_frame_width = 96,
+	.max_frame_width = 8192,
+	.min_frame_height = 96,
+	.max_frame_height = 8192,
+	.max_mbpf = (8192 * 4352) / 256,
+	.mb_cycles_vpp = 200,
+	.mb_cycles_fw = 489583,
+	.mb_cycles_fw_vpp = 66234,
+	.num_comv = 0,
+};
+
+static void iris_set_sm8650_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xB0088);
+}
+
+static const struct icc_info sm8650_icc_table[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const char * const sm8650_clk_reset_table[] = { "bus", "xo", "core" };
+
+static const struct bw_info sm8650_bw_table_dec[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const sm8650_pmdomain_table[] = { "venus", "vcodec0" };
+
+static const char * const sm8650_opp_pd_table[] = { "mxc", "mmcx" };
+
+static const struct platform_clk_data sm8650_clk_table[] = {
+	{IRIS_AXI_CLK,  "iface"        },
+	{IRIS_CTRL_CLK, "core"         },
+	{IRIS_HW_CLK,   "vcodec0_core" },
+};
+
+static struct ubwc_config_data ubwc_config_sm8650 = {
+	.max_channels = 8,
+	.mal_length = 32,
+	.highest_bank_bit = 16,
+	.bank_swzl_level = 0,
+	.bank_swz2_level = 1,
+	.bank_swz3_level = 1,
+	.bank_spreading = 1,
+};
+
+static struct tz_cp_config tz_cp_config_sm8650 = {
+	.cp_start = 0,
+	.cp_size = 0x25800000,
+	.cp_nonpixel_start = 0x01000000,
+	.cp_nonpixel_size = 0x24800000,
+};
+
+static const u32 sm8650_vdec_input_config_params[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_CODED_FRAMES,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PIC_ORDER_CNT_TYPE,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 sm8650_vdec_output_config_params[] = {
+	HFI_PROP_COLOR_FORMAT,
+	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+};
+
+static const u32 sm8650_vdec_subscribe_input_properties[] = {
+	HFI_PROP_NO_OUTPUT,
+};
+
+static const u32 sm8650_vdec_subscribe_output_properties[] = {
+	HFI_PROP_PICTURE_TYPE,
+	HFI_PROP_CABAC_SESSION,
+};
+
+static const u32 sm8650_dec_ip_int_buf_tbl[] = {
+	BUF_BIN,
+	BUF_COMV,
+	BUF_NON_COMV,
+	BUF_LINE,
+};
+
+static const u32 sm8650_dec_op_int_buf_tbl[] = {
+	BUF_DPB,
+};
+
+struct iris_platform_data sm8650_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.vpu_ops = &iris_vpu33_ops,
+	.set_preset_registers = iris_set_sm8650_preset_registers,
+	.icc_tbl = sm8650_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8650_icc_table),
+	.clk_rst_tbl = sm8650_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
+	.bw_tbl_dec = sm8650_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8650_bw_table_dec),
+	.pmdomain_tbl = sm8650_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8650_pmdomain_table),
+	.opp_pd_tbl = sm8650_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8650_opp_pd_table),
+	.clk_tbl = sm8650_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8650_clk_table),
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu33_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_caps = &platform_inst_cap_sm8650,
+	.inst_fw_caps = inst_fw_cap_sm8650,
+	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8650),
+	.tz_cp_config_data = &tz_cp_config_sm8650,
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8650,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
+	.input_config_params =
+		sm8650_vdec_input_config_params,
+	.input_config_params_size =
+		ARRAY_SIZE(sm8650_vdec_input_config_params),
+	.output_config_params =
+		sm8650_vdec_output_config_params,
+	.output_config_params_size =
+		ARRAY_SIZE(sm8650_vdec_output_config_params),
+	.dec_input_prop = sm8650_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8650_vdec_subscribe_input_properties),
+	.dec_output_prop = sm8650_vdec_subscribe_output_properties,
+	.dec_output_prop_size = ARRAY_SIZE(sm8650_vdec_subscribe_output_properties),
+
+	.dec_ip_int_buf_tbl = sm8650_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8650_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8650_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8650_dec_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index aca442dcc153830e6252d1dca87afb38c0b9eb8f..8e6cc1dc529608696e81f2764e90ea3864030125 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -330,6 +330,10 @@ static const struct of_device_id iris_dt_match[] = {
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


