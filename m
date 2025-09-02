Return-Path: <linux-media+bounces-41532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60547B3F8F2
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD17B3A5949
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271AE18991E;
	Tue,  2 Sep 2025 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mjLFmWEl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD1826D4E5
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802639; cv=none; b=WJBSCB8JZZRy9hNrJDkEHUQb1fpQ3cXZ9SeNuws/cE5wPBB058546gjYUPBq9LO6w1EUPuYtMp6NbFAGQLKcXXsuAP4rzgEgtcqGx/Hg1l6GZaDROFHZQu6LA1Uw9/oQEGNiCPvW+aiVqCLjjZh4WSyKl22I3KYJt0QzBBRgSaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802639; c=relaxed/simple;
	bh=+XwbwAiFHkyD3CirRZBAQjcoiJGJefCWvdqJ4uceKG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rdTXAPAZkAOohIDkEYqwXjS+VQ8D3BWvKsiTX2rLHM2K7ilhgZR95++KgDzf8q63kLLzeTvdyzfnhDxam0/t1NbpiwunJyqq2JfGswkIaryw0DOd/G48xc3YSHbsvbbIMqLNUtSJCWa11jHqB0by7UdEvLyYpvUgisnlnulL4ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mjLFmWEl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ce4ed7a73fso2604732f8f.1
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 01:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756802635; x=1757407435; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7IpqcIjKyOanWZmyjk93APyKeLgqYayNDX8wX9Y4vs8=;
        b=mjLFmWEl3RsgR8Y8wat9k2nuUnYC+tfxdzHg0Nv0Et/jnY2IOw3TD4D+qVunsLzRlb
         TqajkmNZpltGQC+cplbvhxD7lMGlXlxSzLL2wxcpq2GUP7fBf+MrrlXCLMgOShLUQgPt
         iD3m4nzSUtEFxjnejOs/XBbKY/tlmOMl/lv9bfkd8xB4YwbTqWU4jB4qowzvGf0DWLRd
         qYaXTyuOT8Ozbtt2OsepD0AobQHB9chmBysKzfVL9hCASdsPjwt11/Tr9NImDftlLmkT
         qRuLQSmSKnn1B1l1Haf+mo/wRKqri0PnwRMPqMYCybbJvEwTw0kUB0/6Bo5JsB1PtWFD
         HAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756802635; x=1757407435;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IpqcIjKyOanWZmyjk93APyKeLgqYayNDX8wX9Y4vs8=;
        b=KzM+d+/VTlX3ZKKvoVDMxZA5p2kWWhepl4xRTjRJSkwOAFEGQH3KEiVFj5brWWyh21
         JcEMct97xq4NgjBIz7MYHqGyRdyP77R7Na+iZLtVdQCmyUOUBHalPTNlH6JFSEr7fH4z
         MuJJdcFc/9stxjItmpOC5ULmGLIpV4bI6PxVVN5LFfCPUxiV6b9p9hKubfC5g+xTrD5V
         jYFlLDl4u9cijPxNFNp57nufgqXaat+dMS3mDrF9AUahtBeAn08PxfJWg+Mm3Uwn9XQr
         fHWmavrdQ+ljEZ6RhIn/fX4zlSeouDPHCh1SPuoZZlchhc/sKu++P8WUHk0hFKxppPJv
         EJ8w==
X-Gm-Message-State: AOJu0YzYFe6zzhA5YYYYrTpcJ6QHHsaRwoLh2V3Pnh8By4dAi2elbHk2
	gkcN5TWmwP4uy71xy63Da/72u8Z0oy1YHJwzm9oariQ4/Gse8K1i6l3ICWoiC/ozDSw=
X-Gm-Gg: ASbGncsYCygDKG0wr2p4+5LAIVbJ2FyQ2AjE34EDOIEfv+DOD0Uf+sS0Y2f4PZ6E5Sa
	OuGJqfj3PwjUGY64c7loiNsh4J8Eg3hCoLuERk92UBgjyFDmC/5+E52/sRZqFYsAOSS9pJJt+k9
	9Dj99BU2Hk7cGk4Qxd+j5j226QuXgtK0rjyuK30/+mCvOMvgbuJUA51hjRBhTNIsR/lVr3k2K+B
	L9k0JpnfROr/WuhIHItWrSjYvA2fnSLJvuC13K8JWWiILVEONK6NsEDZ88G5FUUWP4CkGJXmXGf
	fNYEeaVrENMCoBTNPHn81YtaKskXsj1ldOHCvf1hduJMjq1shakS6Gm6TvqqZVc+8RgsAdKls5D
	Ytz7zgRn1+msBlc6m8Bo6lkDXp3FYpOlCvNBFQ488bsZaHeHyBYaF+A==
X-Google-Smtp-Source: AGHT+IFmfxVcPeqNWVuOW1vIqRI0oy7nwjrjxc1qG+gRBTXx7sZ69f1EsfNm66LCU/xhe9zBPaZZOA==
X-Received: by 2002:a05:6000:250e:b0:3c8:c89d:6b5b with SMTP id ffacd0b85a97d-3d1e01d2f18mr8160425f8f.48.1756802635427;
        Tue, 02 Sep 2025 01:43:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b93fae643sm34031725e9.3.2025.09.02.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 01:43:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Sep 2025 10:43:49 +0200
Subject: [PATCH v3] media: iris: add VPU33 specific encoding buffer
 calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-topic-sm8x50-iris-encoder-v3-hevc-debug-v3-1-9867edfb4dff@linaro.org>
X-B4-Tracking: v=1; b=H4sIAESutmgC/5XNOw7CMBBF0a1ErhnkTz6Gin0gisQeJyNBHNlgg
 aLsHScNooPyveLcmUUMhJEdi5kFTBTJj3moXcHM0I49Atm8meSy4lpKuPuJDMSbflYcKFAEHI2
 3GCApGDAZsNg9ehBcNMqVWmlULGtTQEfPrXS+5D1QvPvw2sJJrO//jSRAQK2UPfDSucaq05XGN
 vi9Dz1bI0l+4AMXv8Myw6auSl53nXW1/oKXZXkDaqH1ZTgBAAA=
X-Change-ID: 20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-10173f4838e3
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13989;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+XwbwAiFHkyD3CirRZBAQjcoiJGJefCWvdqJ4uceKG0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotq5KsacSWX7j8ubpeh6q42qffu7//8lSvrXuYcMB
 FDYgXZOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLauSgAKCRB33NvayMhJ0WfKD/
 9SxRSTySWdAB6izILLI1MyBtoh5dy+dPbs0XKSsF9/jxQY1mNuCgJM+aN0uNQzmPz4u4iEiX+TW8Vl
 a5pvNkWYh4La0NQt+Ni0upvUv+lWb9vdl0EOjWZqILNaWJ5mUQQ1KjYgL8EoyyogVyv0wcq9mxf62/
 2tnZmSb5S7GU5ZbXVhXaT8xJagnmIdqZz6JNYtHrYBAwouQOH+oVKfvfhq0bp14QiT9viYtrY1relh
 ZbGz9D6NIXs22GIoglQenfYu1/EoGBBKKb5NVg0G6cBwh4SMSMaqrIDYFrAClfVim1geejutXUUdTv
 YehbcB4SzmuWM+5r610UTElaP0+BBTChp7d44/t9KmNVcIV2yFYmGxw+fB7AAeiyfVM8TEFEugd7HO
 jc16fjF7nYUnPe/HZr1sUYi+SGuYSELn9jBre9fx87jQRTdKjgGzqrTL+YLKV6BWGxJJ0E/9kWaoKg
 gt5t5/5T/CrhPyELaotfgwuMzqoX+nEL3ixTlD+uAnzsjEtfZS5VKQDlklo4AdkNF38A7F7BP0Szdf
 MB219wxm76IdyerHHqHQYr9EADtJXSIeeqFwnWT8+uDpgE5d9PvTE8XaLH0w6jzWgjv8IvHBB6vQ5r
 H4BxTkHmK8oErJchIE6bSVLp/kw/wNW5b9miqgesh9Z0u/eKy027JulgiORQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The VPU33 found in the SM8650 Platform requires some slighly different
buffer calculation for encoding to allow working with the latest
firwware uploaded on linux-firmware at [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=ece445af91bbee49bf0d8b23c2b99b596ae6eac7

Suggested-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
[2] https://lore.kernel.org/all/20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com/
---
Changes in v3:
- EDITME: use bulletpoints and terse descriptions.
- renamed vpu33x to vpu33
- reformated calculation to match original code, dropped default set variables to 0
- Link to v2: https://lore.kernel.org/r/20250901-topic-sm8x50-iris-encoder-v3-hevc-debug-v2-1-c65406bbdf68@linaro.org

Changes in v2:
- Removed calculation fix for hevc encoding, as it was added in common code
- Link to v1: https://lore.kernel.org/r/20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-v1-1-633d904ff7d3@linaro.org
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |   4 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 103 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   3 +-
 7 files changed, 111 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 8891a297d384b018b3cc8313ad6416db6317798b..c0900038e7defccf7de3cb60e17c71e36a0e8ead 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -284,7 +284,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 
-	buffers->size = iris_vpu_buf_size(inst, buffer_type);
+	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 29cf392ca2566da286ea3e928ce4a22c2e970cc8..e1788c266bb1080921f17248fd5ee60156b3143d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -911,7 +911,7 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst, u32 plane)
 
 	if (iris_split_mode_enabled(inst)) {
 		bufsz.type = HFI_BUFFER_OUTPUT;
-		bufsz.size = iris_vpu_buf_size(inst, BUF_DPB);
+		bufsz.size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, BUF_DPB);
 
 		ret = hfi_gen1_set_property(inst, ptype, &bufsz, sizeof(bufsz));
 		if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 96fa7b1bb592441e85664da408ea4ba42c9a15b5..7057c4cd1a9ebefa02c855014e5f19993da58e38 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -7,6 +7,7 @@
 #define __IRIS_PLATFORM_COMMON_H__
 
 #include <linux/bits.h>
+#include "iris_buffer.h"
 
 struct iris_core;
 struct iris_inst;
@@ -189,6 +190,7 @@ struct iris_platform_data {
 	void (*init_hfi_command_ops)(struct iris_core *core);
 	void (*init_hfi_response_ops)(struct iris_core *core);
 	struct iris_inst *(*get_instance)(void);
+	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index cf4b92f534b272a0a1ac2a0e7bb9316501374332..9b3c65ebee94998729246652578278e1664be9d2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -8,6 +8,7 @@
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_defines.h"
 #include "iris_platform_common.h"
+#include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
 #include "iris_platform_qcs8300.h"
@@ -738,6 +739,7 @@ struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
 	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
@@ -827,6 +829,7 @@ struct iris_platform_data sm8650_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
 	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
@@ -916,6 +919,7 @@ struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
 	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 978d0130d43b5f6febb65430a9bbe3932e8f24df..16486284f8acccf6a95a27f6003e885226e28f4d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -9,6 +9,7 @@
 #include "iris_resources.h"
 #include "iris_hfi_gen1.h"
 #include "iris_hfi_gen1_defines.h"
+#include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
 #define BITRATE_MIN		32000
@@ -317,6 +318,7 @@ struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
 	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 34a9094201ccd11d30a776f284ede8248d8017a9..86894e03e37be5cd42aef225f29dbf751080b039 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -867,6 +867,27 @@ u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
 		      (((((max_t(u32, (frame_width_coded),
 				 (frame_height_coded)) + 3) >> 2) << 5) + 256) * 16)), 256);
 }
+static inline
+u32 size_vpss_line_buf_vpu33(u32 num_vpp_pipes_enc, u32 frame_height_coded,
+			     u32 frame_width_coded)
+{
+	u32 vpss_4tap_top, vpss_4tap_left, vpss_div2_top;
+	u32 vpss_div2_left, vpss_top_lb, vpss_left_lb;
+	u32 size_left, size_top;
+	u32 max_width_height;
+
+	max_width_height = max_t(u32, frame_width_coded, frame_height_coded);
+	vpss_4tap_top = ((((max_width_height * 2) + 3) >> 2) << 4) + 256;
+	vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
+	vpss_div2_top = (((max_width_height + 3) >> 2) << 4) + 256;
+	vpss_div2_left = ((((max_width_height * 2) + 3) >> 2) << 5) + 64;
+	vpss_top_lb = (frame_width_coded + 1) << 3;
+	vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
+	size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
+	size_top = (vpss_4tap_top + vpss_div2_top) * 2;
+
+	return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb, DMA_ALIGNMENT);
+}
 
 static inline
 u32 size_top_line_buf_first_stg_sao(u32 frame_width_coded)
@@ -977,8 +998,8 @@ static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
 }
 
 static inline
-u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
-			u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
+u32 hfi_buffer_line_enc_base(u32 frame_width, u32 frame_height, bool is_ten_bit,
+			     u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
 {
 	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
 	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
@@ -1018,10 +1039,38 @@ u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
 		line_buff_recon_pix_size +
 		size_left_linebuff_ctrl_fe(frame_height_coded, num_vpp_pipes_enc) +
 		size_line_buf_sde(frame_width_coded) +
-		size_vpss_line_buf(num_vpp_pipes_enc, frame_height_coded, frame_width_coded) +
 		size_top_line_buf_first_stg_sao(frame_width_coded);
 }
 
+static inline
+u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
+			u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
+{
+	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
+	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
+	u32 frame_height_coded = height_in_lcus * (lcu_size);
+	u32 frame_width_coded = width_in_lcus * (lcu_size);
+
+	return hfi_buffer_line_enc_base(frame_width, frame_height, is_ten_bit,
+					num_vpp_pipes_enc, lcu_size, standard) +
+		size_vpss_line_buf(num_vpp_pipes_enc, frame_height_coded, frame_width_coded);
+}
+
+static inline
+u32 hfi_buffer_line_enc_vpu33(u32 frame_width, u32 frame_height, bool is_ten_bit,
+			      u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
+{
+	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
+	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
+	u32 frame_height_coded = height_in_lcus * (lcu_size);
+	u32 frame_width_coded = width_in_lcus * (lcu_size);
+
+	return hfi_buffer_line_enc_base(frame_width, frame_height, is_ten_bit,
+					num_vpp_pipes_enc, lcu_size, standard) +
+		size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_height_coded,
+					 frame_width_coded);
+}
+
 static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
@@ -1040,6 +1089,24 @@ static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
 				   lcu_size, HFI_CODEC_ENCODE_AVC);
 }
 
+static u32 iris_vpu33_enc_line_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	u32 lcu_size = 16;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		lcu_size = 32;
+		return hfi_buffer_line_enc_vpu33(width, height, 0, num_vpp_pipes,
+						 lcu_size, HFI_CODEC_ENCODE_HEVC);
+	}
+
+	return hfi_buffer_line_enc_vpu33(width, height, 0, num_vpp_pipes,
+					 lcu_size, HFI_CODEC_ENCODE_AVC);
+}
+
 static inline
 u32 hfi_buffer_dpb_enc(u32 frame_width, u32 frame_height, bool is_ten_bit)
 {
@@ -1387,7 +1454,7 @@ struct iris_vpu_buf_type_handle {
 	u32 (*handle)(struct iris_inst *inst);
 };
 
-int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 {
 	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
 	u32 size = 0, buf_type_handle_size = 0, i;
@@ -1431,6 +1498,34 @@ int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 	return size;
 }
 
+u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	u32 size = 0, i;
+
+	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_enc_bin_size         },
+		{BUF_COMV,        iris_vpu_enc_comv_size        },
+		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size    },
+		{BUF_LINE,        iris_vpu33_enc_line_size      },
+		{BUF_ARP,         iris_vpu_enc_arp_size         },
+		{BUF_VPSS,        iris_vpu_enc_vpss_size        },
+		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size    },
+		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size    },
+	};
+
+	if (inst->domain == DECODER)
+		return iris_vpu_buf_size(inst, buffer_type);
+
+	for (i = 0; i < ARRAY_SIZE(enc_internal_buf_type_handle); i++) {
+		if (enc_internal_buf_type_handle[i].type == buffer_type) {
+			size = enc_internal_buf_type_handle[i].handle(inst);
+			break;
+		}
+	}
+
+	return size;
+}
+
 static u32 internal_buffer_count(struct iris_inst *inst,
 				 enum iris_buffer_type buffer_type)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 94668c5b3d15fb6e10d0b5ed6ed704cadb5a6534..04f0b7400a1e4e1d274d690a2761b9e57778e8b7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -146,7 +146,8 @@ static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
 	return DIV_ROUND_UP(frame_width, 64) * DIV_ROUND_UP(frame_height, 64) * 128;
 }
 
-int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

---
base-commit: 58717ecfffd642c1e0950dee4a247dd6cdfeb31e
change-id: 20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-10173f4838e3

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


