Return-Path: <linux-media+bounces-29959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D590A849FC
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 18:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 734AF9C5A5E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 16:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E19A28135E;
	Thu, 10 Apr 2025 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KOenOsFU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1461C5D7E
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 16:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302615; cv=none; b=dnXrpoPrA4bEi1fp3rsiagF/5EWpjJKJP24Z7VYnxh4Or7B5/uyRdPKanBQcD/vtP0rRVDm/9YSi17UGKbqxXnnVO3geEf88eAt6/26tCfXdApei4ZGGTTbvgglwTcPI0jCHu3D8umc2YGvxwBDhCMYsuxWmDNB0J3zLilJnl6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302615; c=relaxed/simple;
	bh=tCEOYGPmIc1SPAM1HF+UO1/NYRAAsIsKLUXJIESOnu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBzim029wzjv9ahfvb2hBkfCD8kIXKx8m1NQGIOTyHk0AVKLf8fMyCpK2xjXx9PLwQeaQcsVs7V8cU15wTZXkr/QhHuAXnnGdxTYbZhog8vKIQB822Tc1SDRYVQSq8ueNAXlJqLkY9tyIyEiqjgEmHunZ7lzDOR+4RYYCp4kxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KOenOsFU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso7973105e9.0
        for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302610; x=1744907410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfgoiISEI6CCBXz+KLnorq2mkzdptbjBXDbJbv0ENcI=;
        b=KOenOsFUYl1MszShGxzm6w4IkmvEmCf15tkHW6HQ94NGCjzhXE/D+c/guxGlsMXC+8
         5YAmZvhxSQYv7j/fQUwVVHCCm6IxfllWb5NZ5Wv1rLSBFugLS46xkdLfKO0MiwPQWytH
         bNB91sWbKbJCVrjz3/D/D2YmNAiynxhEC42f51vMxe6Gh26KwHnhDAHLluoajQ2jFYwB
         kAYQfq1HhN+RLEKa5URPU2ytFAKjgP1iGG1UQKbpgnNsGDQ++amA33l6KqVRHIhIXk+6
         Pyv9hVtWulP0f/jc1RKxLnQYHV4ZW/JSq6zB2jj8Hdm3kpmB2Myg6ASsISxzlqR2PUvN
         MFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302610; x=1744907410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfgoiISEI6CCBXz+KLnorq2mkzdptbjBXDbJbv0ENcI=;
        b=IvbYw5avR1GFL/GRqDRd5VmYRc8fjnF23A1fj+jEQwhuxDGas2cknbYckTE2U8xU5U
         uNFIBkv+fq7Fy7a4AVhCSIptcebBXwlBlqrVtxjyvbTt8lnRrcUAyQ9Z4k+/jGrZPvOS
         aszXcfADnxtQ6fojWs0F0z2/BuQjJA6nmu1PdKDLaJ43ASevvFFHZXgPi5ewBlzcG04E
         vOs7Jfm8Y3NsTsTIKezeNr5MhB5E25Vlatb7/OFNyOwbsFWeoImxt0871GetsW1ann0E
         tuDgEyJ9syCSSJ/QYexxqbSksWQj5yMz6B+5M0SswWLfSlrcEhYxYhWkmstrW1R9JvlE
         BTFg==
X-Forwarded-Encrypted: i=1; AJvYcCVucKbkivLxdgrTzxLNOaKlZ27+TkReVYnizkOCmgH34MPTvUtkYEnF2pwnAnUb2Cl7GWByLFb1xGGzUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyibphTG+rqLpu4iF9QgByX7sw2aeczpKguJz9zpw0NmIu059An
	0Xqzy9KY8f5lRosiw5kGGxhF4FNGVzC13xpb0IiXqa9JFWBFe9XHm2vpkZQgxMQ=
X-Gm-Gg: ASbGnctxBF1KyfAPro5WAuA4nuzDaclqRxsHhJidvPO05VoH4/9i4w5eUG0V+VzyiZ0
	yz3R2pRcnXmidrWmhMQlNgf78fxyO7nqTtitxeLRkB2mNNMOibJ6Kbqi1e7fuLeuz8VVtHoFBF7
	/pS8egU5kpLBiW8HpahkzdWvMGaaRp70Lq8JsIskATwqOwqvNqLQ+DbwKwYocBLyNjBrg5PZ/BX
	wsW4IupCiMwRIIKSTAj24g9TcxpZAV/1zUkP0GSK5Is6PaHJlbYr50P2Tm1QGoLjoVteFYidSpS
	vOexpGRYN93eQE74Cg6L8zw+zhuEcIlB9uNDh9NvA+Fh3obY1caUvtR+4eFKQw==
X-Google-Smtp-Source: AGHT+IF7YxresxxIUSbFvKOXhrMSn92TtBy4rTG0L/x99604fWMt5TARqsw/+/xZMRt9jngqCpO+LA==
X-Received: by 2002:a05:6000:240b:b0:391:ba6:c066 with SMTP id ffacd0b85a97d-39d8fd526f8mr3324426f8f.35.1744302609788;
        Thu, 10 Apr 2025 09:30:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8936129dsm5350663f8f.18.2025.04.10.09.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 10 Apr 2025 18:30:00 +0200
Subject: [PATCH RFC v5 1/8] media: qcom: iris: move sm8250 to gen1 catalog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6915;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=tCEOYGPmIc1SPAM1HF+UO1/NYRAAsIsKLUXJIESOnu8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9/IMfeilWuF7TCcmZY4Vf7hudfDLAqCN0DgvzgK+
 br44w/SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/fyDAAKCRB33NvayMhJ0U6SD/
 9eu8VP5fZKJUmWqiNhVFsP9SryZn/Pch5CB3w0UsohBaxx5ZsdmQ/hOV2noeGbQVAA3Y+ZuPPHEUFq
 XG5qS3iWPxny7ZWiv84OANxwLyeVo92A4cf/yFN/UD0xpRRh+OY1gs0gj4hmu2WaJ8AMuvwIx6Y7YI
 Wa1PRKGm6IFlwUAQLPbn0w1hjDu5Qq49NTvgSP+ZRuob350ZBM/F8KmeRQGypHOShJD4YZIAGrO0m1
 peYZvwEDaD/q4I8QXH3XrRYM229nEbp2rOUhGR1eyxdxiLmDNwW5LjX/Tit2Hy548v/Ekbfyc0Adtb
 vLRISSZLyGHx4NtWa1/oTXLn5GRFHwjZw/IESaujA2+NrIKHncSUk5z1XQdQuyNt6Wv3dUJGz0RpyJ
 RPO8ijfo960Popy9dvNzz9FIamuyo+P8Jt7xOPhmYDl9SPPrHfE7kyebOkx9VPuejQMyvX9dVQ8CFT
 dUXQrcRu9MY4tRsWkKVc41XhqKV9x8SzXznOuTNCY8QPhXH48jpwfrHVqNyf9yjkTlqBw3P25tcp98
 qZck9hdzUfJcTO0aFLvnG4plAQyNpeOnAFXT0JAhYMvo4YgjZ7DQJMyJDFU+DHIB0el3soh1FPLN+D
 WATjkT2LrgGa7QXhQ/x9z4yghkEeR0MKNAH3RAR/R4dfGUxFw1yMzQVTE7dQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Re-organize the platform support core into a gen1 catalog C file
declaring common platform structure and include platform headers
containing platform specific entries and iris_platform_data
structure.

The goal is to share most of the structure while having
clear and separate per-SoC catalog files.

The organization is based on the current drm/msm dpu1 catalog
entries.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile          |  2 +-
 .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++++++++++++++++
 ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 ++-------------------
 3 files changed, 89 insertions(+), 76 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 35390534534e93f4617c1036a05ca0921567ba1d..7e7bc5ca81e0f0119846ccaff7f79fd17b8298ca 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -25,7 +25,7 @@ qcom-iris-objs += \
              iris_vpu_common.o \
 
 ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_sm8250.o
+qcom-iris-objs += iris_catalog_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_catalog_gen1.c b/drivers/media/platform/qcom/iris/iris_catalog_gen1.c
new file mode 100644
index 0000000000000000000000000000000000000000..c4590f8996431eb5103d45f01c6bee2b38b848c2
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_catalog_gen1.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_ctrls.h"
+#include "iris_platform_common.h"
+#include "iris_resources.h"
+#include "iris_hfi_gen1.h"
+#include "iris_hfi_gen1_defines.h"
+#include "iris_vpu_common.h"
+
+/* Common SM8250 & variants */
+static struct platform_inst_fw_cap inst_fw_cap_sm8250[] = {
+	{
+		.cap_id = PIPE,
+		.min = PIPE_1,
+		.max = PIPE_4,
+		.step_or_mask = 1,
+		.value = PIPE_4,
+		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
+		.set = iris_set_pipe,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
+		.set = iris_set_stage,
+	},
+	{
+		.cap_id = DEBLOCK,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
+		.set = iris_set_u32,
+	},
+};
+
+static struct platform_inst_caps platform_inst_cap_sm8250 = {
+	.min_frame_width = 128,
+	.max_frame_width = 8192,
+	.min_frame_height = 128,
+	.max_frame_height = 8192,
+	.max_mbpf = 138240,
+	.mb_cycles_vsp = 25,
+	.mb_cycles_vpp = 200,
+};
+
+static struct tz_cp_config tz_cp_config_sm8250 = {
+	.cp_start = 0,
+	.cp_size = 0x25800000,
+	.cp_nonpixel_start = 0x01000000,
+	.cp_nonpixel_size = 0x24800000,
+};
+
+static const u32 sm8250_vdec_input_config_param_default[] = {
+	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
+	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
+	HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
+	HFI_PROPERTY_PARAM_FRAME_SIZE,
+	HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
+	HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
+};
+
+static const u32 sm8250_dec_ip_int_buf_tbl[] = {
+	BUF_BIN,
+	BUF_SCRATCH_1,
+};
+
+static const u32 sm8250_dec_op_int_buf_tbl[] = {
+	BUF_DPB,
+};
+
+/* platforms catalogs */
+#include "iris_catalog_sm8250.h"
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_catalog_sm8250.h
similarity index 59%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
rename to drivers/media/platform/qcom/iris/iris_catalog_sm8250.h
index 5c86fd7b7b6fd36dc2d57a1705d915308b4c0f92..4d2df669b3e1df2ef2b0d2f88fc5f309b27546db 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_catalog_sm8250.h
@@ -1,55 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0-only
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-#include "iris_core.h"
-#include "iris_ctrls.h"
-#include "iris_platform_common.h"
-#include "iris_resources.h"
-#include "iris_hfi_gen1.h"
-#include "iris_hfi_gen1_defines.h"
-#include "iris_vpu_common.h"
-
-static struct platform_inst_fw_cap inst_fw_cap_sm8250[] = {
-	{
-		.cap_id = PIPE,
-		.min = PIPE_1,
-		.max = PIPE_4,
-		.step_or_mask = 1,
-		.value = PIPE_4,
-		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
-		.set = iris_set_pipe,
-	},
-	{
-		.cap_id = STAGE,
-		.min = STAGE_1,
-		.max = STAGE_2,
-		.step_or_mask = 1,
-		.value = STAGE_2,
-		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
-		.set = iris_set_stage,
-	},
-	{
-		.cap_id = DEBLOCK,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
-		.set = iris_set_u32,
-	},
-};
-
-static struct platform_inst_caps platform_inst_cap_sm8250 = {
-	.min_frame_width = 128,
-	.max_frame_width = 8192,
-	.min_frame_height = 128,
-	.max_frame_height = 8192,
-	.max_mbpf = 138240,
-	.mb_cycles_vsp = 25,
-	.mb_cycles_vpp = 200,
-};
+#ifndef _IRIS_CATALOG_SM8250_H
+#define _IRIS_CATALOG_SM8250_H
 
 static void iris_set_sm8250_preset_registers(struct iris_core *core)
 {
@@ -80,33 +35,6 @@ static const struct platform_clk_data sm8250_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
-static struct tz_cp_config tz_cp_config_sm8250 = {
-	.cp_start = 0,
-	.cp_size = 0x25800000,
-	.cp_nonpixel_start = 0x01000000,
-	.cp_nonpixel_size = 0x24800000,
-};
-
-static const u32 sm8250_vdec_input_config_param_default[] = {
-	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
-	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
-	HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
-	HFI_PROPERTY_PARAM_FRAME_SIZE,
-	HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
-	HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
-};
-
-static const u32 sm8250_dec_ip_int_buf_tbl[] = {
-	BUF_BIN,
-	BUF_SCRATCH_1,
-};
-
-static const u32 sm8250_dec_op_int_buf_tbl[] = {
-	BUF_DPB,
-};
-
 struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
@@ -147,3 +75,5 @@ struct iris_platform_data sm8250_data = {
 	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
 };
+
+#endif

-- 
2.34.1


