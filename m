Return-Path: <linux-media+bounces-16894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 024949606D8
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 833431F22AAF
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8533E1A08C4;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAyCGBAn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718F219EED6;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753195; cv=none; b=mUaJWX6ix4lOmAfS2CB9tNCugkXtZsmH1CzYh2APvlfi4w8Y2/0jJb+EhqRSQhqP6zTXaNreMvfIOms6ZKiUAtLCFri6p9c5OyW5W0nzq72UatfDwyrEZ2no8thdCASTxRxJwTMz/gMV11RNNr03W0x5yb9AxnYjFPOdRlW7KF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753195; c=relaxed/simple;
	bh=dGedGxPef2BEMiILioXsvSiip310l/fl+IFf11PTqsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AyVIuKTGx4uSQadEepiGp4WX0FEcZ/0+KxOOver3SrsSnb56VyLefpctUGcDtj43G0q7yQkzKfXw8NV9SpXYkEx+GCbcjxU3DlSwP/w15GjsrKUsc9TLYYzJxwwKEy5J44LFqmm4+BejHKDvZCrk0I67U/4rwHYaGemibqX7KZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAyCGBAn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEFD1C4AF13;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753194;
	bh=dGedGxPef2BEMiILioXsvSiip310l/fl+IFf11PTqsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AAyCGBAnutdFxfChLx94lPz03v8RlzGl8iJmItSaOF+y3i54ipQLdjf61xnS9OXEK
	 /CDAwEohp/d1s7plucbfibo7HnN8XT6D6lVpAFYysS7SK2oATn0t6f6UDzf0jZzV6z
	 vE8Cw8QKd8kKbq6Z+dGf9qVsYkheEvnF00ZfukmEriyAAXh8G8U8FTlO4r+k02n/+l
	 d2urto0j/eQAApr8HaHuj5rkAu+dfou0tadv/yvZ4bYqrqjL5AO1LyWWPi8YYAtPYc
	 vdZTu7msoNsBNurrYN0FmlwJAOZrquNOUAAuP9VbwONqV7UN8vDIf/8mxaah9hgQen
	 bxdGomjmnu2tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D2EC52D6F;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:33 +0530
Subject: [PATCH v3 08/29] media: iris: implement boot sequence of the
 firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-8-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=6375;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=vprjPkfA56WiJKSKCvvkhoItc/1c1Wiqg2FkMZE2yYw=;
 b=uVGCxI/YEeoYsgKcYehxlphcA2joA23fV2m4CrMOgBwmxgSANx12Jaz/12FmdfI3Yv8AMwgrL
 9YqihN/UNR9B3eNWYrfUkrnytLvoRMVpBIWGFcT3LZT1OYo7ZDcKBqV
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Set memory region to firmware and implement boot sequence.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 drivers/media/platform/qcom/iris/iris_core.c       |  7 ++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |  3 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 87 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 13 ++++
 6 files changed, 112 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index ddd4c994a0b9..95f4e92fe085 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -8,5 +8,6 @@ iris-objs += iris_core.o \
              iris_probe.o \
              iris_resources.o \
              iris_vidc.o \
+             iris_vpu_common.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8c7d53c57086..5ad66ac113ae 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -6,6 +6,7 @@
 #include "iris_core.h"
 #include "iris_firmware.h"
 #include "iris_state.h"
+#include "iris_vpu_common.h"
 
 void iris_core_deinit(struct iris_core *core)
 {
@@ -39,10 +40,16 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_queue_deinit;
 
+	ret = iris_vpu_boot_firmware(core);
+	if (ret)
+		goto error_unload_fw;
+
 	mutex_unlock(&core->lock);
 
 	return 0;
 
+error_unload_fw:
+	iris_fw_unload(core);
 error_queue_deinit:
 	iris_hfi_queues_deinit(core);
 error:
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9c919367f9d7..47fdebd8135c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -45,6 +45,7 @@ struct iris_platform_data {
 	const char *fwname;
 	u32 pas_id;
 	struct tz_cp_config *tz_cp_config_data;
+	u32 core_arch;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 1bb34c3e6e18..a559e095fefc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -8,6 +8,8 @@
 #include "iris_platform_common.h"
 #include "iris_resources.h"
 
+#define VIDEO_ARCH_LX 1
+
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -48,4 +50,5 @@ struct iris_platform_data sm8550_data = {
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.tz_cp_config_data = &tz_cp_config_sm8550,
+	.core_arch = VIDEO_ARCH_LX,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
new file mode 100644
index 000000000000..df87b1b719a9
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/iopoll.h>
+
+#include "iris_core.h"
+#include "iris_vpu_common.h"
+
+#define CPU_BASE_OFFS				0x000A0000
+
+#define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
+
+#define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
+#define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
+
+#define CTRL_ERROR_STATUS__M			0xfe
+
+#define QTBL_INFO				(CPU_CS_BASE_OFFS + 0x50)
+#define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
+#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
+#define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
+#define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
+#define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
+
+#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
+#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
+
+static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
+{
+	u32 queue_size, value;
+
+	/* Iris hardware requires 4K queue alignment */
+	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
+		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
+
+	value = (u32)core->iface_q_table_daddr;
+	writel(value, core->reg_base + UC_REGION_ADDR);
+
+	/* Iris hardware requires 1M queue alignment */
+	value = ALIGN(SFR_SIZE + queue_size, SZ_1M);
+	writel(value, core->reg_base + UC_REGION_SIZE);
+
+	value = (u32)core->iface_q_table_daddr;
+	writel(value, core->reg_base + QTBL_ADDR);
+
+	writel(0x01, core->reg_base + QTBL_INFO);
+
+	if (core->sfr_daddr) {
+		value = (u32)core->sfr_daddr + core->iris_platform_data->core_arch;
+		writel(value, core->reg_base + SFR_ADDR);
+	}
+}
+
+int iris_vpu_boot_firmware(struct iris_core *core)
+{
+	u32 ctrl_init = 0, ctrl_status = 0, count = 0, max_tries = 1000;
+
+	iris_vpu_setup_ucregion_memory_map(core);
+
+	ctrl_init = BIT(0);
+
+	writel(ctrl_init, core->reg_base + CTRL_INIT);
+	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
+
+	while (!ctrl_status && count < max_tries) {
+		ctrl_status = readl(core->reg_base + CTRL_STATUS);
+		if ((ctrl_status & CTRL_ERROR_STATUS__M) == 0x4) {
+			dev_err(core->dev, "invalid setting for uc_region\n");
+			break;
+		}
+
+		usleep_range(50, 100);
+		count++;
+	}
+
+	if (count >= max_tries) {
+		dev_err(core->dev, "error booting up iris firmware\n");
+		return -ETIME;
+	}
+
+	writel(0x1, core->reg_base + CPU_CS_H2XSOFTINTEN);
+	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
new file mode 100644
index 000000000000..d9b8df6e3f80
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_VPU_COMMON_H_
+#define _IRIS_VPU_COMMON_H_
+
+struct iris_core;
+
+int iris_vpu_boot_firmware(struct iris_core *core);
+
+#endif

-- 
2.34.1



