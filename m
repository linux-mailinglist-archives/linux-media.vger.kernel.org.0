Return-Path: <linux-media+bounces-29535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 574CDA7E48B
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 17:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31C37189F1A2
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BCC200105;
	Mon,  7 Apr 2025 15:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YHIJnjJG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C68D1FC0E4
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 15:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039469; cv=none; b=Ydk/4ZBuYtgxcTjM3B78Mizoh6D7faJg3uaT+W2ETASp3OL0lBUXSsgp2lreROwzDdu5bK4OUQuWArDWFLfbgk9WS+13858Nh9xKIbu7ZA+tgnoVmC/xcDKIHgpbRhql/6AccVAIY119//k2sRGtR0yGMsX+SzHhyoFnhQxZMEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039469; c=relaxed/simple;
	bh=IyC6JW//NbJzVtegnLef5xtYp51ySL42pB1CufF2oxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=atx7UtVlPlnHTZyewl/QjNmWljdZH7rzqrOje9zGKcNMJPUu6+f69Ft5WzJoDnA7sGuhJuYrv41WPUCk9Et0yKffj4pfrwkmV5bG1N6pzCLk9hWH2jeRaZudaJUBvrVia29n3alsTfwg7Gl84KLqXDV1pDdRA3iMs7ghu/FkILs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YHIJnjJG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso2596851f8f.0
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039463; x=1744644263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AtVW2rGRagVdMOph9/UNvZYKMcGWGQRR+J3UbKnxtRQ=;
        b=YHIJnjJGTON+IjyEPMFnQA1GN6Y2H4zjSP1dRLaDfOXFDSPHn8On1QoBBTaR3uegU3
         Tjsm/xHzJXvDR8qKgzlGgDCHNGxUl1Pa+8YzqrWo6jkB6iL3Ma+WR6Qv3lZr5n5T7Mee
         i2DGE242j4ywr90/Gf5QmTBJGEx/psuRQJgd++MPGeorZb9fO7GGTXAHr6Hf52A+X87W
         iqKG5J7XLWmA0MCg0a2POtcEHqM5roThV+HWtjJEH5oHaQZgsvlpV3Y8hcojNPPGCu61
         3UNsX+IgQn0ICIBvwz/YIiLD1c9W9avu3pYy9jN8+/6PKP2wMWXadbFaDq7VpHeOTNvq
         kSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039463; x=1744644263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtVW2rGRagVdMOph9/UNvZYKMcGWGQRR+J3UbKnxtRQ=;
        b=WWkVr88vNr3SimPW1AOvorFPd922oTlGt4HJLdU25fIbk11IuhEvrEbzQTXTtqE+uC
         r79A8G8ZTXZ6N/X3g3T5c5rbt7vvWvkoqz+g7oa0jSQl1MoNmIvaI7D5E6mg/4Rqe/TD
         jvGoqbm+h2EB3/I+h+JC4Nnqyqj/Lhs5qjr0sDIBaqOF0RaaWGLD2Zg5QgwiMFmNlSc8
         L8wcWUIuhP+p4dfBbvkUhXAqrQm0KWjvrKAe5Oa210GHUKAMjj9Ck1PnwTHmCyAbk9Tx
         db7zDXAFEKtnu1mu/1fM5KU3Pv6nDzU9lsTKX50xAR95OK1VoaOW81OVXaXsD6y60IS2
         /Z+g==
X-Gm-Message-State: AOJu0YwK8dDUlOS2vWE5sQeI/BacjcJLnzlIPidZExbTPhGnyiStlWVd
	FnrM801AAXIRpE6R2dGx5WJco5Nv7RbZcYsNvaixjIQm3WolWvFZ6rXtcI35mnE=
X-Gm-Gg: ASbGncv9nxyQ2hiMGmxRg3dsBbOHukSgzUkfQstzxnola7/VFqYcd3CEu5gYHG13qDg
	JtIqW7vn5eK/Jixhadz56P8cXj1hD2wse6F1OTI6t1wAWi09gv2rxJzquFd8J4qAYMl/5tTSdIK
	bcDzfBfcA/J2ZVBTO43aQftrNj5MuZzZLqJ9nGx2wrxO8KcM0NDTEwy5DUrNCKKZ1000PjiaaJW
	aFXdzYm/avYJJRY/HRA403j3q11qyOTVbX3z8+owo9GnB2aRip9pwGte5xPPgfcffuFqugEnGy5
	dUDaoleIlyUjf0RGVlpmGrwSQT8UC+zZ6+elrRD1K75Gl+hHTaO/dmtxrWl6+V2njA==
X-Google-Smtp-Source: AGHT+IFbcn28uMZN/VHUjDzDXKzulv27c+dG/hO7Xql0YkhQNwvzxwRfwlPVTt5OTVGfaiuaUTcl8Q==
X-Received: by 2002:a05:6000:1a8d:b0:391:487f:282a with SMTP id ffacd0b85a97d-39cba93cdd3mr10870523f8f.50.1744039463476;
        Mon, 07 Apr 2025 08:24:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b42besm12212001f8f.41.2025.04.07.08.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:24:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 17:24:16 +0200
Subject: [PATCH v3 4/5] media: platform: qcom/iris: rename iris_vpu3 to
 iris_vpu3x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-sm8x50-iris-v10-v3-4-63569f6d04aa@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16029;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IyC6JW//NbJzVtegnLef5xtYp51ySL42pB1CufF2oxE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn8+4iwswrcFxiJoi81s3xGGFHQKofr0E8S771rlF0
 qutd0eOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/PuIgAKCRB33NvayMhJ0SDED/
 9KIB7Cx1AySZFS5MkbZlh15EvXzpdgILWqpesKTPf+zv2HbkLUH+AY07gvKqeLoKDKW0TZnuJuHTop
 7pDbYAeYkRAfdI77xbJ2NDopMiI7xFIddb8rIyEee464qcOjvvDDVVIYNixlayDmje1rJ3uCKuWZ0N
 y1Fjc6ifkoXTYToOyBraz4TB2o2Lk4TN5wBxGSbh28dGBlKnOjo2/72bRWAGNydxj6phjPqMrgXLVA
 5axZwfa5eBpZ1Osic55dNGjShw75jTNpaWGYrfjTzUipLtoGtUcPCLevd8PYUG1WaQLTf13aBfD5Cs
 PjNGTcADC90Lb/RFDCqS14tMCTyXMI4BGhlshYxLmVwrQYLx2nYDF9LXhot46cf5yRpUWQGK5se0H8
 d3pQyV7KkYfovh/cMZNxBEqQwlbSgV8KjR4GMmuKa+ceNaQh+BwqKwDhnsR37VpHjzfmeFVkYPpaHl
 YRPIqHpz1ccGLlZ1AE4Fbu44dMvv1bxjneMkYAQBAcOtgyh6G7Q6NG0I7t2uABLROADzTL+ysWbsCO
 hdlTGX82TxZYGPwYtvpgMROxRij2sW0lETu11czbi+rQZmADShldG1XcUqeygZ2BJZvmm13o4Ax8DU
 gojMKbLCkp7MJ2K2xGZiYAvrn/W4+sT7s6VU+0h+En8ZJvdH+HTpGUAk+aew==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The vpu33 HW is very close to vpu3, and shares most of the
operations, so rename file to vpu3x since we'll handle all vpu3
variants in it.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile          |   2 +-
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 123 ---------
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 277 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 4 files changed, 281 insertions(+), 124 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 35390534534e93f4617c1036a05ca0921567ba1d..473aaf655448180ade917e642289677fc1277f99 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -20,7 +20,7 @@ qcom-iris-objs += \
              iris_vb2.o \
              iris_vdec.o \
              iris_vpu2.o \
-             iris_vpu3.o \
+             iris_vpu3x.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
deleted file mode 100644
index 13dab61427b8bd0491b69a9bc5f5144d27d17362..0000000000000000000000000000000000000000
--- a/drivers/media/platform/qcom/iris/iris_vpu3.c
+++ /dev/null
@@ -1,123 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
- */
-
-#include <linux/iopoll.h>
-
-#include "iris_instance.h"
-#include "iris_vpu_common.h"
-#include "iris_vpu_register_defines.h"
-
-#define AON_MVP_NOC_RESET			0x0001F000
-
-#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
-#define CORE_CLK_RUN				0x0
-
-#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
-#define CORE_BRIDGE_SW_RESET			BIT(0)
-#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
-
-#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
-#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
-
-#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
-
-#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
-
-static bool iris_vpu3_hw_power_collapsed(struct iris_core *core)
-{
-	u32 value, pwr_status;
-
-	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
-	pwr_status = value & BIT(1);
-
-	return pwr_status ? false : true;
-}
-
-static void iris_vpu3_power_off_hardware(struct iris_core *core)
-{
-	u32 reg_val = 0, value, i;
-	int ret;
-
-	if (iris_vpu3_hw_power_collapsed(core))
-		goto disable_power;
-
-	dev_err(core->dev, "video hw is power on\n");
-
-	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
-	if (value)
-		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
-
-	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
-		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
-					 reg_val, reg_val & 0x400000, 2000, 20000);
-		if (ret)
-			goto disable_power;
-	}
-
-	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
-
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
-				 reg_val, reg_val & 0x3, 200, 2000);
-	if (ret)
-		goto disable_power;
-
-	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
-
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
-				 reg_val, !(reg_val & 0x3), 200, 2000);
-	if (ret)
-		goto disable_power;
-
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
-	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-
-disable_power:
-	iris_vpu_power_off_hw(core);
-}
-
-static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_size)
-{
-	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
-	struct v4l2_format *inp_f = inst->fmt_src;
-	u32 height, width, mbs_per_second, mbpf;
-	u64 fw_cycles, fw_vpp_cycles;
-	u64 vsp_cycles, vpp_cycles;
-	u32 fps = DEFAULT_FPS;
-
-	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
-	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
-
-	mbpf = NUM_MBS_PER_FRAME(height, width);
-	mbs_per_second = mbpf * fps;
-
-	fw_cycles = fps * caps->mb_cycles_fw;
-	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
-
-	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
-	/* 21 / 20 is minimum overhead factor */
-	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
-
-	/* 1.059 is multi-pipe overhead */
-	if (inst->fw_caps[PIPE].value > 1)
-		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
-
-	vsp_cycles = fps * data_size * 8;
-	vsp_cycles = div_u64(vsp_cycles, 2);
-	/* VSP FW overhead 1.05 */
-	vsp_cycles = div_u64(vsp_cycles * 21, 20);
-
-	if (inst->fw_caps[STAGE].value == STAGE_1)
-		vsp_cycles = vsp_cycles * 3;
-
-	return max3(vpp_cycles, vsp_cycles, fw_cycles);
-}
-
-const struct vpu_ops iris_vpu3_ops = {
-	.power_off_hw = iris_vpu3_power_off_hardware,
-	.power_off_controller = iris_vpu_power_off_controller,
-	.calc_freq = iris_vpu3_calculate_frequency,
-};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
new file mode 100644
index 0000000000000000000000000000000000000000..ea7be2e0a3a255f61e236740e1082e7c9207250d
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+#include "iris_vpu_register_defines.h"
+
+#define WRAPPER_TZ_BASE_OFFS			0x000C0000
+#define AON_BASE_OFFS				0x000E0000
+#define AON_MVP_NOC_RESET			0x0001F000
+
+#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
+#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
+#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
+#define REQ_POWER_DOWN_PREP			BIT(0)
+#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
+#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
+#define CORE_CLK_RUN				0x0
+
+#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
+#define CTL_AXI_CLK_HALT			BIT(0)
+#define CTL_CLK_HALT				BIT(1)
+
+#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
+#define RESET_HIGH				BIT(0)
+
+#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
+#define CORE_BRIDGE_SW_RESET			BIT(0)
+#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+
+#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
+#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
+#define MSK_CORE_POWER_ON			BIT(1)
+
+#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
+#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
+
+#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
+
+#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
+
+#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
+#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
+
+#define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
+#define SW_RESET				BIT(0)
+#define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
+#define NOC_HALT				BIT(0)
+#define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
+
+static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
+{
+	u32 value, pwr_status;
+
+	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
+	pwr_status = value & BIT(1);
+
+	return pwr_status ? false : true;
+}
+
+static int iris_vpu3x_power_off_hardware_begin(struct iris_core *core)
+{
+	u32 reg_val = 0, value, i;
+	int ret;
+
+	if (iris_vpu3x_hw_power_collapsed(core))
+		return 1;
+
+	dev_err(core->dev, "video hw is power on\n");
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
+					 reg_val, reg_val & 0x400000, 2000, 20000);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void iris_vpu3x_power_off_hardware_end(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+}
+
+static void iris_vpu3_power_off_hardware(struct iris_core *core)
+{
+	u32 reg_val = 0;
+	int ret;
+
+	ret = iris_vpu3x_power_off_hardware_begin(core);
+	if (ret)
+		goto disable_power;
+
+	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 reg_val, reg_val & 0x3, 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 reg_val, !(reg_val & 0x3), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	iris_vpu3x_power_off_hardware_end(core);
+
+disable_power:
+	iris_vpu_power_off_hw(core);
+}
+
+static void iris_vpu33_power_off_hardware(struct iris_core *core)
+{
+	u32 reg_val = 0;
+	int ret;
+
+	ret = iris_vpu3x_power_off_hardware_begin(core);
+	if (ret)
+		goto disable_power;
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+			reg_val, reg_val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
+	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	iris_vpu3x_power_off_hardware_end(core);
+
+disable_power:
+	iris_vpu_power_off_hw(core);
+}
+
+static int iris_vpu33_power_off_controller(struct iris_core *core)
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
+	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
+				 val, val == 0, 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
+	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
+	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
+	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
+	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
+
+	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
+
+	/* Disable MVP NoC clock */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+	val |= NOC_HALT;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+
+	/* enable MVP NoC reset */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+	val |= SW_RESET;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+
+	/* poll AON spare register bit0 to become zero with 50ms timeout */
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_SPARE,
+				 val, (val & BIT(0)) == 0, 1000, 50000);
+	if (ret)
+		goto disable_power;
+
+	/* enable bit(1) to avoid cvp noc xo reset */
+	val = readl(core->reg_base + AON_WRAPPER_SPARE);
+	val |= BIT(1);
+	writel(val, core->reg_base + AON_WRAPPER_SPARE);
+
+	reset_control_bulk_assert(xo_rst_tbl_size, core->controller_resets);
+
+	/* De-assert MVP NoC reset */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+	val &= ~SW_RESET;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+
+	usleep_range(80, 100);
+
+	reset_control_bulk_deassert(xo_rst_tbl_size, core->controller_resets);
+
+	/* reset AON spare register */
+	writel(0, core->reg_base + AON_WRAPPER_SPARE);
+
+	/* Enable MVP NoC clock */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+	val &= ~NOC_HALT;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+
+disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+
+	return 0;
+}
+
+static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 height, width, mbs_per_second, mbpf;
+	u64 fw_cycles, fw_vpp_cycles;
+	u64 vsp_cycles, vpp_cycles;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	fw_cycles = fps * caps->mb_cycles_fw;
+	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
+
+	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
+	/* 21 / 20 is minimum overhead factor */
+	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
+
+	/* 1.059 is multi-pipe overhead */
+	if (inst->fw_caps[PIPE].value > 1)
+		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
+
+	vsp_cycles = fps * data_size * 8;
+	vsp_cycles = div_u64(vsp_cycles, 2);
+	/* VSP FW overhead 1.05 */
+	vsp_cycles = div_u64(vsp_cycles * 21, 20);
+
+	if (inst->fw_caps[STAGE].value == STAGE_1)
+		vsp_cycles = vsp_cycles * 3;
+
+	return max3(vpp_cycles, vsp_cycles, fw_cycles);
+}
+
+const struct vpu_ops iris_vpu3_ops = {
+	.power_off_hw = iris_vpu3_power_off_hardware,
+	.power_off_controller = iris_vpu_power_off_controller,
+	.calc_freq = iris_vpu3x_calculate_frequency,
+};
+
+const struct vpu_ops iris_vpu33_ops = {
+	.power_off_hw = iris_vpu33_power_off_hardware,
+	.power_off_controller = iris_vpu33_power_off_controller,
+	.calc_freq = iris_vpu3x_calculate_frequency,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f8965661c602f990d5a7057565f79df4112d097e..4af3cb0d44e00be498fc7ba648c68f1ef2cb0f20 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -10,6 +10,7 @@ struct iris_core;
 
 extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
+extern const struct vpu_ops iris_vpu33_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
@@ -23,6 +24,8 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
+void iris_vpu_power_off_controller_begin(struct iris_core *core);
+int iris_vpu_power_off_controller_end(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);

-- 
2.34.1


