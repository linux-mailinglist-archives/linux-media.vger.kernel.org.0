Return-Path: <linux-media+bounces-16891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F79606DF
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40FCC1F22BE8
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BC91A08CE;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQqSd8BK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9D619E7DF;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753195; cv=none; b=JRcWfOgOfOCDHRVx1ffbJGB7EEcj062nyb5Orf4dj1Sw0Ox/IFTVEsxHMTHS3anzEoJkvT1Xypk1ehkCvBiYycK5szahrwenOBdJxbeHCeiEjqQJ3Dn51XCkU7A0+HD3vpE5z7vC8xTSWLkz+cRcJXX822LVR6cgljXKCSWSGbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753195; c=relaxed/simple;
	bh=GwIO+Ge/Pd4kA/s7XrF8gZmyUOGZvnQGbYrU6qhTL8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIsMCDV1vC+ZaVypNkPKVaqLL2lSO4UokUbNLDiiqr2lrra+LbwKbfyDD41AbMhYNdEafajjrTCvkyysgQCJc1YQAGn9MmXEDBvVsmm0F0m+vk1lgbKqhJRwfV3+DUw4PsISEoSyhqwph4EVF7bSKK7tuyvhtsvqg+Qp4qc8Nqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQqSd8BK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1A77C4AF63;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753194;
	bh=GwIO+Ge/Pd4kA/s7XrF8gZmyUOGZvnQGbYrU6qhTL8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mQqSd8BKwlAvHuKpLTP4jiJ57adYRZAEgohmCaskrSc33XeS9ANVjguvYsP/6r/me
	 oyRxCo955LDFr1pMJygGiniP/OkBtJaKyAZw+LJou5VJb3laVhOoJVT8UCv0+BPQ5y
	 /Gw1ozjhJL5iVaakahbj/n/qW0Y5TmHIsGuJzHuLmLtX/9xNmIgMjK0j87eXynA6an
	 O7V3QGuV9PxY6fhKydm9SBbfnDrWtF1dGIBNU8ZE0Z5M349SnPA2CDL7vePi/mCaF9
	 ft0NIf/Dhb2VW3TO9siWHlzKx3cALW5xv2HLTBuc6iTTJo3zRq9tIl4Uk8cCjygUDr
	 O9DMXQvFV9lqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A255DC5472E;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:32 +0530
Subject: [PATCH v3 07/29] media: iris: implement video firmware load/unload
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-7-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=10200;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=bQGBq5FPPJkFFZUFXpindbNsVWATyZ0PV6VZQSW2mXE=;
 b=W6MmSIJ+I2MP32j9yDxygBBVUeD1bZmyNlvMeh8ucXLjgIOrlOLgX4RhO6zKJrILmN/8QahIR
 AEb52og5TsEAucYUarnUZCcj8FrkdRsxRBK668PJXy+uhd6jMUUvjtB
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Load/unload firmware in memory via mdt loader.
Firmware is loaded as part of core initialization
and unloaded as part of core de-initialization.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Kconfig           |   2 +
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_core.c       |   8 ++
 drivers/media/platform/qcom/iris/iris_firmware.c   | 146 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_firmware.h   |  14 ++
 .../platform/qcom/iris/iris_platform_common.h      |  12 ++
 .../platform/qcom/iris/iris_platform_sm8250.c      |  10 ++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  10 ++
 8 files changed, 203 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 4b757bb8adf3..ea518760c65c 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -3,6 +3,8 @@ config VIDEO_QCOM_IRIS
         depends on VIDEO_DEV
         depends on ARCH_QCOM || COMPILE_TEST
         select V4L2_MEM2MEM_DEV
+        select QCOM_MDT_LOADER if ARCH_QCOM
+        select QCOM_SCM
         help
           This is a V4L2 driver for Qualcomm Iris video accelerator
           hardware. It accelerates decoding operations on various
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48d54e53a576..ddd4c994a0b9 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,4 +1,5 @@
 iris-objs += iris_core.o \
+             iris_firmware.o \
              iris_hfi_gen1_command.o \
              iris_hfi_gen2_command.o \
              iris_hfi_queue.o \
diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 360a54909ef6..8c7d53c57086 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -4,11 +4,13 @@
  */
 
 #include "iris_core.h"
+#include "iris_firmware.h"
 #include "iris_state.h"
 
 void iris_core_deinit(struct iris_core *core)
 {
 	mutex_lock(&core->lock);
+	iris_fw_unload(core);
 	iris_hfi_queues_deinit(core);
 	core->state = IRIS_CORE_DEINIT;
 	mutex_unlock(&core->lock);
@@ -33,10 +35,16 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error;
 
+	ret = iris_fw_load(core);
+	if (ret)
+		goto error_queue_deinit;
+
 	mutex_unlock(&core->lock);
 
 	return 0;
 
+error_queue_deinit:
+	iris_hfi_queues_deinit(core);
 error:
 	core->state = IRIS_CORE_DEINIT;
 exit:
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
new file mode 100644
index 000000000000..55bbcc798f4c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/firmware.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/soc/qcom/mdt_loader.h>
+
+#include "iris_core.h"
+#include "iris_firmware.h"
+
+#define MAX_FIRMWARE_NAME_SIZE	128
+
+static int iris_protect_cp_mem(struct iris_core *core)
+{
+	struct tz_cp_config *cp_config;
+	int ret;
+
+	cp_config = core->iris_platform_data->tz_cp_config_data;
+
+	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
+					     cp_config->cp_size,
+					     cp_config->cp_nonpixel_start,
+					     cp_config->cp_nonpixel_size);
+	if (ret)
+		dev_err(core->dev, "failed to protect memory(%d)\n", ret);
+
+	return ret;
+}
+
+static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
+{
+	const struct firmware *firmware = NULL;
+	struct device_node *node = NULL;
+	struct reserved_mem *rmem;
+	phys_addr_t mem_phys = 0;
+	void *mem_virt = NULL;
+	size_t res_size = 0;
+	ssize_t fw_size = 0;
+	struct device *dev;
+	int pas_id = 0;
+	int ret;
+
+	if (!fw_name || !(*fw_name) || !core)
+		return -EINVAL;
+
+	dev = core->dev;
+
+	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
+		return -EINVAL;
+
+	pas_id = core->iris_platform_data->pas_id;
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!node)
+		return -EINVAL;
+
+	rmem = of_reserved_mem_lookup(node);
+	if (!rmem) {
+		ret = -EINVAL;
+		goto err_put_node;
+	}
+
+	mem_phys = rmem->base;
+	res_size = rmem->size;
+
+	ret = request_firmware(&firmware, fw_name, dev);
+	if (ret) {
+		dev_err(core->dev, "failed to request fw \"%s\", error %d\n",
+			fw_name, ret);
+		goto err_put_node;
+	}
+
+	fw_size = qcom_mdt_get_size(firmware);
+	if (fw_size < 0 || res_size < (size_t)fw_size) {
+		ret = -EINVAL;
+		dev_err(core->dev, "out of bound fw image fw size: %ld, res_size: %lu\n",
+			fw_size, res_size);
+		goto err_release_fw;
+	}
+
+	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
+	if (!mem_virt) {
+		dev_err(core->dev, "failed to remap fw memory phys %pa[p]\n",
+			&mem_phys);
+		goto err_release_fw;
+	}
+
+	ret = qcom_mdt_load(dev, firmware, fw_name,
+			    pas_id, mem_virt, mem_phys, res_size, NULL);
+	if (ret) {
+		dev_err(core->dev, "error %d loading fw \"%s\"\n",
+			ret, fw_name);
+		goto err_mem_unmap;
+	}
+	ret = qcom_scm_pas_auth_and_reset(pas_id);
+	if (ret) {
+		dev_err(core->dev, "error %d authenticating fw \"%s\"\n",
+			ret, fw_name);
+		goto err_mem_unmap;
+	}
+
+	return ret;
+
+err_mem_unmap:
+	memunmap(mem_virt);
+err_release_fw:
+	release_firmware(firmware);
+err_put_node:
+	of_node_put(node);
+	return ret;
+}
+
+int iris_fw_load(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_load_fw_to_memory(core, core->iris_platform_data->fwname);
+	if (ret) {
+		dev_err(core->dev, "firmware download failed\n");
+		return -ENOMEM;
+	}
+
+	ret = iris_protect_cp_mem(core);
+	if (ret) {
+		dev_err(core->dev, "protect memory failed\n");
+		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+		return ret;
+	}
+
+	return ret;
+}
+
+int iris_fw_unload(struct iris_core *core)
+{
+	int ret;
+
+	ret = qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	if (ret)
+		dev_err(core->dev, "firmware unload failed with ret %d\n", ret);
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.h b/drivers/media/platform/qcom/iris/iris_firmware.h
new file mode 100644
index 000000000000..8d4f6b7f75c5
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_firmware.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_FIRMWARE_H_
+#define _IRIS_FIRMWARE_H_
+
+struct iris_core;
+
+int iris_fw_load(struct iris_core *core);
+int iris_fw_unload(struct iris_core *core);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5287fdf913bc..9c919367f9d7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -6,6 +6,8 @@
 #ifndef _IRIS_PLATFORM_COMMON_H_
 #define _IRIS_PLATFORM_COMMON_H_
 
+#define IRIS_PAS_ID				9
+
 extern struct iris_platform_data sm8550_data;
 extern struct iris_platform_data sm8250_data;
 
@@ -20,6 +22,13 @@ struct platform_clk_data {
 	const char *clk_name;
 };
 
+struct tz_cp_config {
+	u32 cp_start;
+	u32 cp_size;
+	u32 cp_nonpixel_start;
+	u32 cp_nonpixel_size;
+};
+
 struct iris_platform_data {
 	struct iris_inst *(*get_instance)(void);
 	const struct icc_info *icc_tbl;
@@ -33,6 +42,9 @@ struct iris_platform_data {
 	const char * const *clk_rst_tbl;
 	unsigned int clk_rst_tbl_size;
 	u64 dma_mask;
+	const char *fwname;
+	u32 pas_id;
+	struct tz_cp_config *tz_cp_config_data;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 664cb2b359a3..36bcb1b851ed 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -25,6 +25,13 @@ static const struct platform_clk_data sm8250_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
+static struct tz_cp_config tz_cp_config_sm8250 = {
+	.cp_start = 0,
+	.cp_size = 0x25800000,
+	.cp_nonpixel_start = 0x01000000,
+	.cp_nonpixel_size = 0x24800000,
+};
+
 struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.icc_tbl = sm8250_icc_table,
@@ -38,4 +45,7 @@ struct iris_platform_data sm8250_data = {
 	.clk_tbl = sm8250_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
 	.dma_mask = GENMASK(31, 29) - 1,
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.tz_cp_config_data = &tz_cp_config_sm8250,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 0db832b099ac..1bb34c3e6e18 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -25,6 +25,13 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
+static struct tz_cp_config tz_cp_config_sm8550 = {
+	.cp_start = 0,
+	.cp_size = 0x25800000,
+	.cp_nonpixel_start = 0x01000000,
+	.cp_nonpixel_size = 0x24800000,
+};
+
 struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.icc_tbl = sm8550_icc_table,
@@ -38,4 +45,7 @@ struct iris_platform_data sm8550_data = {
 	.clk_tbl = sm8550_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
 	.dma_mask = GENMASK(31, 29) - 1,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.tz_cp_config_data = &tz_cp_config_sm8550,
 };

-- 
2.34.1



