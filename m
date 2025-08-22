Return-Path: <linux-media+bounces-40754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA6EB316D0
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6094620C2D
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 12:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654DC2FA0FA;
	Fri, 22 Aug 2025 12:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VcljSDg6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952C617B402
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 12:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864141; cv=none; b=q+B+2q60lveSVzh/7/LF79wA/q6xMtoIfX+rWcIlKTxaTZylH4ewYWNviHc65lL42QErfJ3fCmlglUQ5PljES0MmtnVftdAlzpNrhLLWWTaubwD1QRN6GvxplDkMBOyWsDNW68QZfgh+dpc/7dIiKbmluuEpbVZNdfHyCOpfdJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864141; c=relaxed/simple;
	bh=hmsFha62hBYxNEmWQE2a9XRWH3IZz4cwWzWGkhDYQzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ka0eP8cyNpJICmd8c2vb+gzyXUtKKnMrP7iUVU98etJdJV2RthhfA6q4D25cxp9qcoeYcRrPhBkpJUl2ToUoEA29PpNHkEwnBAOBgBOjyHyFKPCf+DvLqajJT6U1NXQx+RvlrggkDMceCeI60uinCwI+UfM1YacUPt6frflJi7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VcljSDg6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a20c51c40so16609665e9.3
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 05:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864136; x=1756468936; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8SWI9DLP5lStpnCjpTkxBn8nTBRDdls4+/CPBAumrqk=;
        b=VcljSDg6BnWlwsB+FGhsr+W8tbUYtad0qSheSAaBGsTHBWyb07eOCUfqUt3aYlLGfc
         tcj9UBXLpTQl3Z0NRoYnk3DEuAUcawV/VjJQZR0tjOzd7Y7t0Cjz3oBpNaB4M3ou92uc
         aQAffZa2RHSqC1nx38VzPK2mQotxMHRlDDPBcmH0cbhsrmyRvUE3dFi04dppMUQ8l1If
         x9Daqj1jUqM7RGOv5MsmVGDx2EFgCYUL1+nbakS27t7v3gTe/Am5waWClVn6bSgVMz5+
         Q0SwRC2R/SMrpTlGM3PHnvTDhs9O97MIA9NdyryI8ifJAWa1x9N+IdMykL8v3z3tHxUh
         FkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864136; x=1756468936;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SWI9DLP5lStpnCjpTkxBn8nTBRDdls4+/CPBAumrqk=;
        b=iXtkcpPf52q43IiRoicRw6rvZlsf0u9eZSKwjQPPtZIaRXKfgWeUsRIqViifLZkhKz
         5TryJUbpKd/el7h9UaU/4C2AqWAGINEOyn7LOnHvS/l00n4VWIYhM/NVDE60MtPh5jtY
         zwqN+gY4aHtp13NIq5upyy+WlebFdWhH3PR9LzXXMG+ywDsyGeMdoRTH366ZokCwM+8l
         8hf8LFKL+7D7h3q+I5NAFfL4j3RIeH05HZ43i8X4AMGXiG17/cTZUJ+T2gqFNva7evq/
         qA27pRiz1BOxHHdBZZ3BqTpfKGL+urOMtmE/chNoWGIwCiYmBd+SD763m+6V5Uldvu2c
         Qw3A==
X-Gm-Message-State: AOJu0YxAeS6I7TSgNmWII2GPj60f6IhUIXRFYwgbjaPxuPoXllFO/b4Y
	VjSi6wc/v6LlSuF+1mxHJ9Sykn9+QVafOOA3ZkufBSFRYnWcij8+5XI3beHE/lyiYXg=
X-Gm-Gg: ASbGncsIBLlTgKuxXRPWyG67v/btlm2ZQtiWp/5yTphLrRNIbGHp6q9TGoa7C6+j8B8
	CkHSz1Srnhlr8jqRqBxX0/mm3bu8TVdAOQrMJikbyB9rLh8LSw9jRFurfBuXdnp3DM5zQ/6Czzq
	V1iS+dYg5rLDdyqnnKYb+HTgVQlqbrg4qNxssnkA2+aLOOuy130jb+D/CwEdo+SwYWJjtsnuOEq
	E2Hxd+aVBU3Vp+82ysAoBPj5XUDHKw96Gk2wdj7Pbe4PmSLC/4uvqIqyAlmp9yonjHpYobZxjzs
	W8lomTu0kuAIfk//aGnVWBPoi6h9bjJFkhFYC2JXwC22lIX3tORogPA/fTyjMx2NetjkA95gilS
	slNQuN3yrVdrFYvgBJTFi08BE2pVTD/X8YjqNjZARpkc=
X-Google-Smtp-Source: AGHT+IH83B7ODFHyYMcRtllawZ/lAAKJpqszR+2hPDA2zmKCFTwOE62vwh3/S58f0KI5rcPBHd6VVg==
X-Received: by 2002:a05:600c:1912:b0:453:8bc7:5cbb with SMTP id 5b1f17b1804b1-45b517d2885mr23835645e9.25.1755864135688;
        Fri, 22 Aug 2025 05:02:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e2fb15sm36836465e9.12.2025.08.22.05.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:02:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 14:02:10 +0200
Subject: [PATCH] media: iris: add VPU33 specific encoding buffer
 calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-v1-1-633d904ff7d3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEJcqGgC/x3NywrCMBBG4Vcps3YgF4vBVxEXmvxtZ2FSMjYUS
 t/d4PLbnHOQogqU7sNBFU1USu6wl4Hi8sozWFI3OeNGE5zjb1klsn7CPhqWKsrIsSRUbp4XtMg
 J721ma+zNT9fgAzz12loxyf4/PZ7n+QO9hskIeQAAAA==
X-Change-ID: 20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-10173f4838e3
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14244;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hmsFha62hBYxNEmWQE2a9XRWH3IZz4cwWzWGkhDYQzc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqFxFuAG85JO+w/yQnIH5DAQjGs5Anai9Nbhl9DEj
 bo9bW8iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKhcRQAKCRB33NvayMhJ0S4rEA
 C2AIq8pfqC150XrD7K1L/9Px7X3KTEN97Enuqy2Xh1YHbYQQLsFUH0CdkXN+U36TptNO91aDPs+vJg
 Qq1FjBFHqo1mDwlWBDxjhPV9F8ull7pEnau0uzV5fi3DtIp8VwLDLrSPSTKZ+bBp5bB7TUXr/59b0I
 NOcvwRnCSY3TQInBBQl+MPC5G0fwEk0QK33sVo7WJV7N6HMvmOp/ArbWLEp/vIL8QmcKsNjPmd83fQ
 ijSb7NNBGOMR/W3pbSh2SUrnzQr6v/mLtDke0x+kdqVf+NGr5kod25Zx3XRfAcBxK6MXhJmgEy/5RR
 E3BbeggmeWn7jLwZ1lL0527Bg7KHS82HTt+2dIuyezqevmnvjoEC92Zz0w6IdzmF+H4ME7DRX9c/vt
 pOxKshhVtle5/Ed+UYUKY78eeEgl3oRZKPDmmrBHu5E69XeieBTtX1KAvrI6S78CU2wTLrI+tcbcn4
 qDMBy/nYGsC6XDGakjbGpl8TdHgfed6vbMIVEOK4x0C1LgNtuUFS9ZiBGx/T8QvFZMZc/81W6rxISr
 De9nFfb4dS7xHBS3hmO2Q/NmBP8QkYJMcgDCofZJeDsDyLA5c0ZO0d6fNTD/giUudpCCoTbcASJ2rP
 /9zPSkMvco/HXygpW1GU79Ha1id9rAtqWEuIl+bqZrPKMHIwCBucw5LTW0Tg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The VPU33 found in the SM8650 Platform requires some slighly different
buffer calculation for encoding to allow working with the latest
firwware uploaded on linux-firmware at [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=ece445af91bbee49bf0d8b23c2b99b596ae6eac7

Suggested-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
[2] https://lore.kernel.org/all/20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com/
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |   4 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 118 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   4 +-
 7 files changed, 127 insertions(+), 7 deletions(-)

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
index cf4b92f534b272a0a1ac2a0e7bb9316501374332..78a04e76de7c00703b84bd3c1c6e9a884ee7cebe 100644
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
+	.get_vpu_buffer_size = iris_vpu33x_buf_size,
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
index 7337d8d33715810669399d9f86b864d0eb002897..5658acf371506d1190e885986d362b2731b0660e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -867,6 +867,34 @@ u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
 		      (((((max_t(u32, (frame_width_coded),
 				 (frame_height_coded)) + 3) >> 2) << 5) + 256) * 16)), 256);
 }
+static inline
+u32 size_vpss_line_buf_vpu33x(u32 num_vpp_pipes_enc, u32 frame_height_coded,
+			      u32 frame_width_coded)
+{
+	u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0;
+	u32 vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0;
+	u32 size_left = 0, size_top = 0;
+
+	vpss_4tap_top = (max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3;
+	vpss_4tap_top >>= 2;
+	vpss_4tap_top <<= 4;
+	vpss_4tap_top += 256;
+	vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
+	vpss_div2_top = max_t(u32, frame_width_coded, frame_height_coded) + 3;
+	vpss_div2_top >>= 2;
+	vpss_div2_top <<= 4;
+	vpss_div2_top += 256;
+	vpss_div2_left = (max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3;
+	vpss_div2_left >>= 2;
+	vpss_div2_left <<= 5;
+	vpss_div2_left += 64;
+	vpss_top_lb = (frame_width_coded + 1) << 3;
+	vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
+	size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
+	size_top = (vpss_4tap_top + vpss_div2_top) * 2;
+
+	return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb, DMA_ALIGNMENT);
+}
 
 static inline
 u32 size_top_line_buf_first_stg_sao(u32 frame_width_coded)
@@ -975,9 +1003,17 @@ static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
 				       lcu_size, HFI_CODEC_ENCODE_AVC);
 }
 
+static u32 iris_vpu33x_enc_non_comv_size(struct iris_inst *inst)
+{
+	if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return iris_vpu_enc_non_comv_size(inst) + SIZE_ONE_SLICE_BUF;
+
+	return iris_vpu_enc_non_comv_size(inst);
+}
+
 static inline
-u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
-			u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
+u32 hfi_buffer_line_enc_base(u32 frame_width, u32 frame_height, bool is_ten_bit,
+			     u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
 {
 	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
 	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
@@ -1017,10 +1053,38 @@ u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
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
+u32 hfi_buffer_line_enc_vpu33x(u32 frame_width, u32 frame_height, bool is_ten_bit,
+			       u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
+{
+	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
+	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
+	u32 frame_height_coded = height_in_lcus * (lcu_size);
+	u32 frame_width_coded = width_in_lcus * (lcu_size);
+
+	return hfi_buffer_line_enc_base(frame_width, frame_height, is_ten_bit,
+					num_vpp_pipes_enc, lcu_size, standard) +
+		size_vpss_line_buf_vpu33x(num_vpp_pipes_enc, frame_height_coded,
+					  frame_width_coded);
+}
+
 static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
@@ -1039,6 +1103,24 @@ static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
 				   lcu_size, HFI_CODEC_ENCODE_AVC);
 }
 
+static u32 iris_vpu33x_enc_line_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	u32 lcu_size = 16;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		lcu_size = 32;
+		return hfi_buffer_line_enc_vpu33x(width, height, 0, num_vpp_pipes,
+						  lcu_size, HFI_CODEC_ENCODE_HEVC);
+	}
+
+	return hfi_buffer_line_enc_vpu33x(width, height, 0, num_vpp_pipes,
+					  lcu_size, HFI_CODEC_ENCODE_AVC);
+}
+
 static inline
 u32 hfi_buffer_dpb_enc(u32 frame_width, u32 frame_height, bool is_ten_bit)
 {
@@ -1386,7 +1468,7 @@ struct iris_vpu_buf_type_handle {
 	u32 (*handle)(struct iris_inst *inst);
 };
 
-int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 {
 	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
 	u32 size = 0, buf_type_handle_size = 0, i;
@@ -1430,6 +1512,34 @@ int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 	return size;
 }
 
+u32 iris_vpu33x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	u32 size = 0, i;
+
+	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_enc_bin_size         },
+		{BUF_COMV,        iris_vpu_enc_comv_size        },
+		{BUF_NON_COMV,    iris_vpu33x_enc_non_comv_size },
+		{BUF_LINE,        iris_vpu33x_enc_line_size     },
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
index 1ff1b07ecbaa85345ca948affeb1c4a1c55e36b0..e4fd1fcf2dbf25e69d55599a8fd4ad775f9e6575 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -41,6 +41,7 @@ struct iris_inst;
 #define SIZE_SLIST_BUF_H265 (BIT(10))
 #define H265_DISPLAY_BUF_SIZE (3072)
 #define H265_NUM_FRM_INFO (48)
+#define SIZE_ONE_SLICE_BUF 256
 
 #define VP9_NUM_FRAME_INFO_BUF 32
 #define VP9_NUM_PROBABILITY_TABLE_BUF (VP9_NUM_FRAME_INFO_BUF + 4)
@@ -145,7 +146,8 @@ static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
 	return DIV_ROUND_UP(frame_width, 64) * DIV_ROUND_UP(frame_height, 64) * 128;
 }
 
-int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu33x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

---
base-commit: 3390731fe7686441519f59d7599962e0abbca7d6
change-id: 20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-10173f4838e3

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


