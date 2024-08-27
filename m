Return-Path: <linux-media+bounces-16893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 189369606D9
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CDA61F21E42
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8631E1A08C5;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vo5ePoWo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09519E81F;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753195; cv=none; b=MhrHZxTYhKApLKggUMUAaqeG3MeUi64p8ud90iMTjExK0XGU0kTEU84XDcjMyPe0CMzWb5x7ZPxk89Swe5AB0wiCmdjGnND5XbP9ajhJftICkYGl89bpZtwjJBNQvVSIelt2y/6C7lC0nbW/UzFSi63Lpp5SazChS46Kzq5ORkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753195; c=relaxed/simple;
	bh=ZuAPvKSbqYfqwq91wQ1If8zgBTs6irQujGVfq2+jRLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hbra44rwi1iU6W1i35mLlnyAdCz2sJi3gB84dHpUTgEmBWonYB9qgAXDdjF4UkKFX0PoJ0c+yxRxMwvHNXY/OXKehyjTP+HCwYzPS/RCOjLRhChwtN0+hnTyONZNe2m8UjCjuwt270bnUx5wQQiCoHWK7k4OJVKLDW3uCBQO1zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vo5ePoWo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 155EAC4DDED;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753195;
	bh=ZuAPvKSbqYfqwq91wQ1If8zgBTs6irQujGVfq2+jRLc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vo5ePoWoucOPPYKTc/0fdDgVXBB1NS6V9Ewg9JdLp1LAfmYqwfCs4Anx9F0V5iLUj
	 bJ84eYXj4NV8D1XVSevOSsmwuYHek5CYV4LniuDykH7J8CSVWHQpgyvi1vC2Ifd8gA
	 KKlcxyaIVAsz2Py298oht4+Gqw1hLEBRwRkrOc0DITaoZ/8ExcU1/Mf07HIafPSI7S
	 ClpDF9wdlH8u0nSxcx++tcPn/pgpWKibUYK65Cxr0sWw/BYz9YJmnQT+Piav1Eubz5
	 vguv2/PCFMJTK3/t9LrlXnpgTFVui40GONtb/XP0jG3kIMs3DQP3Za0D2RgIUV2tAs
	 uBGkTzziVMppw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D94C54732;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:35 +0530
Subject: [PATCH v3 10/29] media: iris: implement power management
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-10-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=44362;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=db5KZurs+6DzDTrjvTJKSa+j0rf2+ys3m/s7/zLCrGo=;
 b=lSLZO7dnE6PNLzt2WnwKKlhQ7+x0Y32rNSRtIYXrca/UpwvOqVQSqDWrDXO2UgxtTOGxJTH0y
 h7Bsf2HSN++DLTl0bUndtxUzrzsftN3VqwtzpZhp1jBqbhgpARa2XUU
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Implement runtime power management for iris including
platform specific power on/off sequence.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   3 +
 drivers/media/platform/qcom/iris/iris_core.c       |  16 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   5 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |   5 +
 drivers/media/platform/qcom/iris/iris_firmware.h   |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  72 +++++-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  11 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  20 ++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  13 ++
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  20 +-
 .../platform/qcom/iris/iris_platform_common.h      |  14 ++
 .../platform/qcom/iris/iris_platform_sm8250.c      |   9 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |   9 +
 drivers/media/platform/qcom/iris/iris_power.c      |  35 +++
 drivers/media/platform/qcom/iris/iris_power.h      |  14 ++
 drivers/media/platform/qcom/iris/iris_probe.c      |  66 +++++-
 drivers/media/platform/qcom/iris/iris_resources.c  | 167 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |   8 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   8 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  11 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       |  79 +++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 250 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  11 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  17 ++
 28 files changed, 862 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index d1f0b933df3d..b0447af45891 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -9,10 +9,13 @@ iris-objs += iris_core.o \
              iris_hfi_queue.o \
              iris_platform_sm8250.o \
              iris_platform_sm8550.o \
+             iris_power.o \
              iris_probe.o \
              iris_resources.o \
              iris_state.o \
              iris_vidc.o \
+             iris_vpu2.o \
+             iris_vpu3.o \
              iris_vpu_common.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 92458d7f1e36..34847fb36aa0 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -3,18 +3,26 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/pm_runtime.h>
+
 #include "iris_core.h"
 #include "iris_firmware.h"
+#include "iris_power.h"
 #include "iris_state.h"
 #include "iris_vpu_common.h"
 
 void iris_core_deinit(struct iris_core *core)
 {
+	pm_runtime_resume_and_get(core->dev);
+
 	mutex_lock(&core->lock);
 	iris_fw_unload(core);
+	iris_power_off(core);
 	iris_hfi_queues_deinit(core);
 	core->state = IRIS_CORE_DEINIT;
 	mutex_unlock(&core->lock);
+
+	pm_runtime_put_sync(core->dev);
 }
 
 static int iris_wait_for_system_response(struct iris_core *core)
@@ -56,10 +64,14 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error;
 
-	ret = iris_fw_load(core);
+	ret = iris_power_on(core);
 	if (ret)
 		goto error_queue_deinit;
 
+	ret = iris_fw_load(core);
+	if (ret)
+		goto error_power_off;
+
 	ret = iris_vpu_boot_firmware(core);
 	if (ret)
 		goto error_unload_fw;
@@ -74,6 +86,8 @@ int iris_core_init(struct iris_core *core)
 
 error_unload_fw:
 	iris_fw_unload(core);
+error_power_off:
+	iris_power_off(core);
 error_queue_deinit:
 	iris_hfi_queues_deinit(core);
 error:
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 409f9822807d..09a6904c7bb1 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -7,6 +7,7 @@
 #define _IRIS_CORE_H_
 
 #include <linux/types.h>
+#include <linux/pm_domain.h>
 #include <media/v4l2-device.h>
 
 #include "iris_hfi_common.h"
@@ -47,6 +48,8 @@
  * @response_packet: a pointer to response packet from fw to driver
  * @header_id: id of packet header
  * @packet_id: id of packet
+ * @power_enabled: a boolean to check if power is on or off
+ * @power: a structure for clock and bw information
  * @hfi_ops: iris hfi command ops
  * @hfi_response_ops: iris hfi response ops
  * @core_init_done: structure of signal completion for system response
@@ -81,6 +84,8 @@ struct iris_core {
 	u8					*response_packet;
 	u32					header_id;
 	u32					packet_id;
+	bool					power_enabled;
+	struct iris_core_power			power;
 	const struct iris_hfi_command_ops	*hfi_ops;
 	const struct iris_hfi_response_ops	*hfi_response_ops;
 	struct completion			core_init_done;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 55bbcc798f4c..b6c779ec13bb 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -144,3 +144,8 @@ int iris_fw_unload(struct iris_core *core)
 
 	return ret;
 }
+
+int iris_set_hw_state(struct iris_core *core, bool resume)
+{
+	return qcom_scm_set_remote_state(resume, 0);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.h b/drivers/media/platform/qcom/iris/iris_firmware.h
index 8d4f6b7f75c5..1550916c92a1 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.h
+++ b/drivers/media/platform/qcom/iris/iris_firmware.h
@@ -10,5 +10,6 @@ struct iris_core;
 
 int iris_fw_load(struct iris_core *core);
 int iris_fw_unload(struct iris_core *core);
+int iris_set_hw_state(struct iris_core *core, bool resume);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index a5a28029d8d1..bf9ec678ff90 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -3,8 +3,12 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/pm_runtime.h>
+
+#include "iris_firmware.h"
 #include "iris_core.h"
 #include "iris_hfi_common.h"
+#include "iris_power.h"
 #include "iris_vpu_common.h"
 
 int iris_hfi_core_init(struct iris_core *core)
@@ -42,7 +46,7 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 		mutex_unlock(&core->lock);
 		goto exit;
 	}
-
+	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
 	mutex_unlock(&core->lock);
 
@@ -54,3 +58,69 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 
 	return IRQ_HANDLED;
 }
+
+int iris_hfi_pm_suspend(struct iris_core *core)
+{
+	int ret;
+
+	if (!mutex_is_locked(&core->lock))
+		return -EINVAL;
+
+	if (core->state != IRIS_CORE_INIT)
+		return -EINVAL;
+
+	if (!core->power_enabled) {
+		dev_err(core->dev, "power not enabled\n");
+		return 0;
+	}
+
+	ret = iris_vpu_prepare_pc(core);
+	if (ret) {
+		dev_err(core->dev, "prepare pc ret %d\n", ret);
+		pm_runtime_mark_last_busy(core->dev);
+		return -EAGAIN;
+	}
+
+	ret = iris_set_hw_state(core, false);
+	if (ret)
+		return ret;
+
+	iris_power_off(core);
+
+	return 0;
+}
+
+int iris_hfi_pm_resume(struct iris_core *core)
+{
+	const struct iris_hfi_command_ops *ops;
+	int ret;
+
+	ops = core->hfi_ops;
+
+	ret = iris_power_on(core);
+	if (ret)
+		goto error;
+
+	ret = iris_set_hw_state(core, true);
+	if (ret)
+		goto err_power_off;
+
+	ret = iris_vpu_boot_firmware(core);
+	if (ret)
+		goto err_suspend_hw;
+
+	ret = ops->sys_interframe_powercollapse(core);
+	if (ret)
+		goto err_suspend_hw;
+
+	return 0;
+
+err_suspend_hw:
+	iris_set_hw_state(core, false);
+err_power_off:
+	iris_power_off(core);
+error:
+	dev_err(core->dev, "failed to resume\n");
+
+	return -EBUSY;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index c3d5b899cf60..e050b1ae90fe 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -46,6 +46,7 @@ struct iris_hfi_command_ops {
 	int (*sys_init)(struct iris_core *core);
 	int (*sys_image_version)(struct iris_core *core);
 	int (*sys_interframe_powercollapse)(struct iris_core *core);
+	int (*sys_pc_prep)(struct iris_core *core);
 };
 
 struct iris_hfi_response_ops {
@@ -53,6 +54,8 @@ struct iris_hfi_response_ops {
 };
 
 int iris_hfi_core_init(struct iris_core *core);
+int iris_hfi_pm_suspend(struct iris_core *core);
+int iris_hfi_pm_resume(struct iris_core *core);
 
 irqreturn_t iris_hfi_isr(int irq, void *data);
 irqreturn_t iris_hfi_isr_handler(int irq, void *data);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 8f045ef56163..e778ae33b953 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -56,10 +56,21 @@ static int iris_hfi_gen1_sys_interframe_powercollapse(struct iris_core *core)
 	return ret;
 }
 
+static int iris_hfi_gen1_sys_pc_prep(struct iris_core *core)
+{
+	struct hfi_sys_pc_prep_pkt pkt;
+
+	pkt.hdr.size = sizeof(struct hfi_sys_pc_prep_pkt);
+	pkt.hdr.pkt_type = HFI_CMD_SYS_PC_PREP;
+
+	return iris_hfi_queue_cmd_write_locked(core, &pkt, pkt.hdr.size);
+}
+
 static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
 	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
+	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 };
 
 void iris_hfi_gen1_command_ops_init(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 5c07d6a29863..991d5a5dc792 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -12,6 +12,7 @@
 #define HFI_ERR_NONE					0x0
 
 #define HFI_CMD_SYS_INIT				0x10001
+#define HFI_CMD_SYS_PC_PREP				0x10002
 #define HFI_CMD_SYS_SET_PROPERTY			0x10005
 #define HFI_CMD_SYS_GET_PROPERTY			0x10006
 
@@ -48,6 +49,10 @@ struct hfi_sys_get_property_pkt {
 	u32 data;
 };
 
+struct hfi_sys_pc_prep_pkt {
+	struct hfi_pkt_hdr hdr;
+};
+
 struct hfi_msg_event_notify_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 event_id;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 807266858d93..0871c0bdea90 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -66,10 +66,30 @@ static int iris_hfi_gen2_sys_interframe_powercollapse(struct iris_core *core)
 	return ret;
 }
 
+static int iris_hfi_gen2_sys_pc_prep(struct iris_core *core)
+{
+	struct iris_hfi_header *hdr;
+	u32 packet_size;
+	int ret;
+
+	packet_size = sizeof(*hdr) + sizeof(struct iris_hfi_packet);
+	hdr = kzalloc(packet_size, GFP_KERNEL);
+	if (!hdr)
+		return -ENOMEM;
+
+	iris_hfi_gen2_packet_sys_pc_prep(core, hdr);
+	ret = iris_hfi_queue_cmd_write_locked(core, hdr, hdr->size);
+
+	kfree(hdr);
+
+	return ret;
+}
+
 static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
 	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
+	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 };
 
 void iris_hfi_gen2_command_ops_init(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 3e3e4ddfe21f..4104479c7251 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -12,6 +12,7 @@
 
 #define HFI_CMD_BEGIN				0x01000000
 #define HFI_CMD_INIT				0x01000001
+#define HFI_CMD_POWER_COLLAPSE			0x01000002
 #define HFI_CMD_END				0x01FFFFFF
 
 #define HFI_PROP_BEGIN				0x03000000
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 8266eae5ff94..9ea26328a300 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -162,3 +162,16 @@ void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
 				    &payload,
 				    sizeof(u32));
 }
+
+void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr)
+{
+	iris_hfi_gen2_create_header(hdr, 0 /*session_id*/, core->header_id++);
+
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_CMD_POWER_COLLAPSE,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_NONE,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    NULL, 0);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
index eba109efeb76..163295783b7d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
@@ -65,5 +65,6 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct iris_hfi_header *hdr);
 void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
 						       struct iris_hfi_header *hdr);
+void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index b24d4640fea9..3a511d5e5cfc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/pm_runtime.h>
+
 #include "iris_core.h"
 #include "iris_hfi_queue.h"
 #include "iris_vpu_common.h"
@@ -145,13 +147,27 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
 {
 	int ret;
 
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret < 0)
+		goto exit;
+
 	mutex_lock(&core->lock);
 	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);
-	if (ret)
+	if (ret) {
 		dev_err(core->dev, "iris_hfi_queue_cmd_write_locked failed with %d\n", ret);
-
+		mutex_unlock(&core->lock);
+		goto exit;
+	}
 	mutex_unlock(&core->lock);
 
+	pm_runtime_mark_last_busy(core->dev);
+	pm_runtime_put_autosuspend(core->dev);
+
+	return 0;
+
+exit:
+	pm_runtime_put_sync(core->dev);
+
 	return ret;
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 4577977f9f8c..899a696a931d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -8,6 +8,7 @@
 
 #define IRIS_PAS_ID				9
 #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
+#define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
 
 extern struct iris_platform_data sm8550_data;
 extern struct iris_platform_data sm8250_data;
@@ -40,10 +41,22 @@ struct ubwc_config_data {
 	u32	bank_spreading;
 };
 
+struct iris_core_power {
+	u64 clk_freq;
+	u64 icc_bw;
+};
+
+enum platform_pm_domain_type {
+	IRIS_CTRL_POWER_DOMAIN,
+	IRIS_HW_POWER_DOMAIN,
+};
+
 struct iris_platform_data {
 	void (*init_hfi_command_ops)(struct iris_core *core);
 	void (*init_hfi_response_ops)(struct iris_core *core);
 	struct iris_inst *(*get_instance)(void);
+	const struct vpu_ops *vpu_ops;
+	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const char * const *pmdomain_tbl;
@@ -61,6 +74,7 @@ struct iris_platform_data {
 	u32 core_arch;
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
+	u32 num_vpp_pipe;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index b83665a9c5a2..1adbafa373a5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -7,6 +7,12 @@
 #include "iris_platform_common.h"
 #include "iris_resources.h"
 #include "iris_hfi_gen1.h"
+#include "iris_vpu_common.h"
+
+static void iris_set_sm8250_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xB0088);
+}
 
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
@@ -36,6 +42,8 @@ struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -51,4 +59,5 @@ struct iris_platform_data sm8250_data = {
 	.pas_id = IRIS_PAS_ID,
 	.tz_cp_config_data = &tz_cp_config_sm8250,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 4,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 91bfc0fa0989..950ccdccde31 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -7,9 +7,15 @@
 #include "iris_hfi_gen2.h"
 #include "iris_platform_common.h"
 #include "iris_resources.h"
+#include "iris_vpu_common.h"
 
 #define VIDEO_ARCH_LX 1
 
+static void iris_set_sm8550_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xB0088);
+}
+
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -48,6 +54,8 @@ struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.vpu_ops = &iris_vpu3_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -65,4 +73,5 @@ struct iris_platform_data sm8550_data = {
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 4,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
new file mode 100644
index 000000000000..e697c27c8a8a
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_power.h"
+#include "iris_vpu_common.h"
+
+void iris_power_off(struct iris_core *core)
+{
+	if (!core->power_enabled)
+		return;
+
+	iris_vpu_power_off(core);
+	core->power_enabled = false;
+}
+
+int iris_power_on(struct iris_core *core)
+{
+	int ret;
+
+	if (core->power_enabled)
+		return 0;
+
+	ret = iris_vpu_power_on(core);
+	if (ret) {
+		dev_err(core->dev, "failed to power on, err: %d\n", ret);
+		return ret;
+	}
+
+	core->power_enabled = true;
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_power.h b/drivers/media/platform/qcom/iris/iris_power.h
new file mode 100644
index 000000000000..ff9b6be3b086
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_power.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_POWER_H_
+#define _IRIS_POWER_H_
+
+struct iris_core;
+
+int iris_power_on(struct iris_core *core);
+void iris_power_off(struct iris_core *core);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ecf1a50be63b..3222e9116551 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 
 #include "iris_core.h"
 #include "iris_vidc.h"
@@ -111,17 +112,25 @@ static int iris_probe(struct platform_device *pdev)
 	if (core->irq < 0)
 		return core->irq;
 
+	pm_runtime_set_autosuspend_delay(core->dev, AUTOSUSPEND_DELAY_VALUE);
+	pm_runtime_use_autosuspend(core->dev);
+	ret = devm_pm_runtime_enable(core->dev);
+	if (ret) {
+		dev_err(core->dev, "failed to enable runtime pm\n");
+		goto err_runtime_disable;
+	}
+
 	ret = iris_init_isr(core);
 	if (ret) {
 		dev_err_probe(core->dev, ret, "Failed to init isr\n");
-		return ret;
+		goto err_runtime_disable;
 	}
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 	if (!core->iris_platform_data) {
 		ret = -ENODEV;
 		dev_err_probe(core->dev, ret, "init platform failed\n");
-		return ret;
+		goto err_runtime_disable;
 	}
 
 	iris_init_ops(core);
@@ -131,12 +140,12 @@ static int iris_probe(struct platform_device *pdev)
 	ret = iris_init_resources(core);
 	if (ret) {
 		dev_err_probe(core->dev, ret, "init resource failed\n");
-		return ret;
+		goto err_runtime_disable;
 	}
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
-		return ret;
+		goto err_runtime_disable;
 
 	ret = iris_register_video_device(core);
 	if (ret)
@@ -159,10 +168,58 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_runtime_disable:
+	pm_runtime_set_suspended(core->dev);
+
+	return ret;
+}
+
+static int iris_pm_suspend(struct device *dev)
+{
+	struct iris_core *core;
+	int ret;
+
+	if (!dev || !dev->driver)
+		return 0;
+
+	core = dev_get_drvdata(dev);
+
+	mutex_lock(&core->lock);
+	ret = iris_hfi_pm_suspend(core);
+	mutex_unlock(&core->lock);
 
 	return ret;
 }
 
+static int iris_pm_resume(struct device *dev)
+{
+	struct iris_core *core;
+	int ret = 0;
+
+	if (!dev || !dev->driver)
+		return 0;
+
+	core = dev_get_drvdata(dev);
+
+	mutex_lock(&core->lock);
+	if (core->state != IRIS_CORE_INIT)
+		goto exit;
+
+	ret = iris_hfi_pm_resume(core);
+	pm_runtime_mark_last_busy(core->dev);
+
+exit:
+	mutex_unlock(&core->lock);
+
+	return ret;
+}
+
+static const struct dev_pm_ops iris_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(iris_pm_suspend, iris_pm_resume, NULL)
+};
+
 static const struct of_device_id iris_dt_match[] = {
 	{
 		.compatible = "qcom,sm8550-iris",
@@ -182,6 +239,7 @@ static struct platform_driver qcom_iris_driver = {
 	.driver = {
 		.name = "qcom-iris",
 		.of_match_table = iris_dt_match,
+		.pm = &iris_pm_ops,
 	},
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 57c6f9f3449b..eb3052acd426 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -7,11 +7,14 @@
 #include <linux/interconnect.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
 #include "iris_core.h"
 #include "iris_resources.h"
 
+#define BW_THRESHOLD 50000
+
 static int iris_init_icc(struct iris_core *core)
 {
 	const struct icc_info *icc_tbl;
@@ -39,6 +42,57 @@ static int iris_init_icc(struct iris_core *core)
 	return ret;
 }
 
+int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
+{
+	unsigned long bw_kbps = 0, bw_prev = 0;
+	const struct icc_info *icc_tbl;
+	int ret = 0, i;
+
+	icc_tbl = core->iris_platform_data->icc_tbl;
+
+	for (i = 0; i < core->icc_count; i++) {
+		if (!strcmp(core->icc_tbl[i].name, "video-mem")) {
+			bw_kbps = icc_bw;
+			bw_prev = core->power.icc_bw;
+
+			bw_kbps = clamp_t(typeof(bw_kbps), bw_kbps,
+					  icc_tbl[i].bw_min_kbps, icc_tbl[i].bw_max_kbps);
+
+			if (abs(bw_kbps - bw_prev) < BW_THRESHOLD && bw_prev)
+				return ret;
+
+			core->icc_tbl[i].avg_bw = bw_kbps;
+
+			core->power.icc_bw = bw_kbps;
+			break;
+		}
+	}
+
+	ret = icc_bulk_set_bw(core->icc_count, core->icc_tbl);
+	if (ret)
+		dev_err(core->dev, "failed to unset icc bw\n");
+
+	return ret;
+}
+
+int iris_unset_icc_bw(struct iris_core *core)
+{
+	int ret, i;
+
+	core->power.icc_bw = 0;
+
+	for (i = 0; i < core->icc_count; i++) {
+		core->icc_tbl[i].avg_bw = 0;
+		core->icc_tbl[i].peak_bw = 0;
+	}
+
+	ret = icc_bulk_set_bw(core->icc_count, core->icc_tbl);
+	if (ret)
+		dev_err(core->dev, "failed to unset icc bw\n");
+
+	return ret;
+}
+
 static int iris_pd_get(struct iris_core *core)
 {
 	int ret;
@@ -73,6 +127,19 @@ static int iris_opp_pd_get(struct iris_core *core)
 	return 0;
 }
 
+int iris_opp_set_rate(struct iris_core *core, u64 freq)
+{
+	int ret;
+
+	ret = dev_pm_opp_set_rate(core->dev, freq);
+	if (ret) {
+		dev_err(core->dev, "failed to set rate\n");
+		return ret;
+	}
+
+	return ret;
+}
+
 static int iris_init_power_domains(struct iris_core *core)
 {
 	const struct platform_clk_data *clk_tbl;
@@ -107,6 +174,36 @@ static int iris_init_power_domains(struct iris_core *core)
 	return ret;
 }
 
+int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
+{
+	int ret;
+
+	ret = iris_opp_set_rate(core, ULONG_MAX);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_get_sync(pd_dev);
+	if (ret < 0)
+		return ret;
+
+	return ret;
+}
+
+int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
+{
+	int ret;
+
+	ret = iris_opp_set_rate(core, 0);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_put_sync(pd_dev);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
 static int iris_init_clocks(struct iris_core *core)
 {
 	int ret;
@@ -122,6 +219,62 @@ static int iris_init_clocks(struct iris_core *core)
 	return 0;
 }
 
+static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
+{
+	const struct platform_clk_data *clk_tbl;
+	u32 clk_cnt;
+	int i, j;
+
+	clk_tbl = core->iris_platform_data->clk_tbl;
+	clk_cnt = core->iris_platform_data->clk_tbl_size;
+
+	for (i = 0; i < clk_cnt; i++) {
+		if (clk_tbl[i].clk_type == clk_type) {
+			for (j = 0; core->clock_tbl && j < core->clk_count; j++) {
+				if (!strcmp(core->clock_tbl[j].id, clk_tbl[i].clk_name))
+					return core->clock_tbl[j].clk;
+			}
+		}
+	}
+
+	return NULL;
+}
+
+int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type)
+{
+	struct clk *clock;
+	int ret = 0;
+
+	clock = iris_get_clk_by_type(core, clk_type);
+	if (!clock) {
+		dev_err(core->dev, "failed to get clk: %d\n", clk_type);
+		return -EINVAL;
+	}
+
+	ret = clk_prepare_enable(clock);
+	if (ret) {
+		dev_err(core->dev, "failed to enable clock %d\n", clk_type);
+		return ret;
+	}
+
+	return ret;
+}
+
+int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type)
+{
+	struct clk *clock;
+
+	clock = iris_get_clk_by_type(core, clk_type);
+	if (!clock) {
+		dev_err(core->dev, "failed to get clk: %d\n", clk_type);
+		return -EINVAL;
+	}
+
+	clk_disable_unprepare(clock);
+
+	return 0;
+}
+
 static int iris_init_resets(struct iris_core *core)
 {
 	const char * const *rst_tbl;
@@ -149,6 +302,20 @@ static int iris_init_resets(struct iris_core *core)
 	return 0;
 }
 
+int iris_reset_ahb2axi_bridge(struct iris_core *core)
+{
+	u32 rst_tbl_size;
+	int ret;
+
+	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+
+	ret = reset_control_bulk_reset(rst_tbl_size, core->resets);
+	if (ret)
+		dev_err(core->dev, "failed to toggle resets: %d\n", ret);
+
+	return ret;
+}
+
 int iris_init_resources(struct iris_core *core)
 {
 	int ret;
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index b0217399030a..a13d8307cb2c 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -14,6 +14,14 @@ struct icc_info {
 	u32			bw_max_kbps;
 };
 
+int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev);
+int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev);
+int iris_unset_icc_bw(struct iris_core *core);
+int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
+int iris_reset_ahb2axi_bridge(struct iris_core *core);
+int iris_opp_set_rate(struct iris_core *core, u64 freq);
+int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
+int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_init_resources(struct iris_core *core);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index a5c4e73ae531..bc0a3232214b 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/pm_runtime.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -96,12 +97,19 @@ int iris_open(struct file *filp)
 	struct iris_inst *inst = NULL;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret < 0)
+		return ret;
+
 	ret = iris_core_init(core);
 	if (ret) {
 		dev_err(core->dev, "core init failed\n");
+		pm_runtime_put_sync(core->dev);
 		return ret;
 	}
 
+	pm_runtime_put_sync(core->dev);
+
 	inst = core->iris_platform_data->get_instance();
 	if (!inst)
 		return -ENOMEM;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
new file mode 100644
index 000000000000..bd8427411576
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+
+const struct vpu_ops iris_vpu2_ops = {
+	.power_off_hw = iris_vpu_power_off_hw,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
new file mode 100644
index 000000000000..414b8ec67b33
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/iopoll.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+#include "iris_vpu_register_defines.h"
+
+#define AON_MVP_NOC_RESET			0x0001F000
+
+#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
+
+#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
+
+#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
+#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
+
+#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
+
+static bool iris_vpu3_hw_power_collapsed(struct iris_core *core)
+{
+	u32 value = 0, pwr_status = 0;
+
+	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
+	pwr_status = value & BIT(1);
+
+	return pwr_status ? false : true;
+}
+
+static void iris_vpu3_power_off_hardware(struct iris_core *core)
+{
+	u32 reg_val = 0;
+	u32 value = 0;
+	int ret, i;
+
+	if (iris_vpu3_hw_power_collapsed(core))
+		goto disable_power;
+
+	dev_err(core->dev, "video hw is power on\n");
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
+					 reg_val, reg_val & 0x400000, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	writel(0x3, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
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
+	writel(0x3, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x2, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_power:
+	iris_vpu_power_off_hw(core);
+}
+
+const struct vpu_ops iris_vpu3_ops = {
+	.power_off_hw = iris_vpu3_power_off_hardware,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 5930cf105a87..23e4afe24761 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -7,10 +7,11 @@
 
 #include "iris_core.h"
 #include "iris_vpu_common.h"
+#include "iris_vpu_register_defines.h"
 
-#define CPU_BASE_OFFS				0x000A0000
+#define WRAPPER_TZ_BASE_OFFS			0x000C0000
+#define AON_BASE_OFFS				0x000E0000
 
-#define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
 #define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
 
 #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
@@ -18,7 +19,9 @@
 #define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
 #define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
 
+#define CTRL_INIT_IDLE_MSG_BMSK			0x40000000
 #define CTRL_ERROR_STATUS__M			0xfe
+#define CTRL_STATUS_PC_READY			0x100
 
 #define QTBL_INFO				(CPU_CS_BASE_OFFS + 0x50)
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
@@ -33,11 +36,35 @@
 #define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
 #define CPU_IC_SOFTINT_H2A_SHFT			0x0
 
-#define WRAPPER_BASE_OFFS			0x000B0000
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
 #define WRAPPER_INTR_STATUS_A2HWD_BMSK		0x8
 #define WRAPPER_INTR_STATUS_A2H_BMSK		0x4
-#define CTRL_INIT_IDLE_MSG_BMSK			0x40000000
+
+#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
+#define WRAPPER_INTR_MASK_A2HWD_BMSK		0x8
+#define WRAPPER_INTR_MASK_A2HCPU_BMSK		0x4
+
+#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
+#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
+#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
+#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
+
+#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
+#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
+#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
+
+#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
+#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
+
+static void iris_vpu_interrupt_init(struct iris_core *core)
+{
+	u32 mask_val;
+
+	mask_val = readl(core->reg_base + WRAPPER_INTR_MASK);
+	mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BMSK |
+		      WRAPPER_INTR_MASK_A2HCPU_BMSK);
+	writel(mask_val, core->reg_base + WRAPPER_INTR_MASK);
+}
 
 static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 {
@@ -127,3 +154,218 @@ int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 
 	return 0;
 }
+
+int iris_vpu_prepare_pc(struct iris_core *core)
+{
+	u32 wfi_status = 0, idle_status = 0, pc_ready = 0;
+	u32 ctrl_status = 0;
+	int val = 0;
+	int ret;
+
+	ctrl_status = readl(core->reg_base + CTRL_STATUS);
+	pc_ready = ctrl_status & CTRL_STATUS_PC_READY;
+	idle_status = ctrl_status & BIT(30);
+	if (pc_ready)
+		return 0;
+
+	wfi_status = readl(core->reg_base + WRAPPER_TZ_CPU_STATUS);
+	wfi_status &= BIT(0);
+	if (!wfi_status || !idle_status)
+		goto skip_power_off;
+
+	ret = core->hfi_ops->sys_pc_prep(core);
+	if (ret) {
+		dev_err(core->dev, "failed to prepare iris for power off\n");
+		goto skip_power_off;
+	}
+
+	ret = readl_poll_timeout(core->reg_base + CTRL_STATUS, val,
+				 val & CTRL_STATUS_PC_READY, 250, 2500);
+	if (ret)
+		goto skip_power_off;
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_TZ_CPU_STATUS,
+				 val, val & BIT(0), 250, 2500);
+	if (ret)
+		goto skip_power_off;
+
+	return 0;
+
+skip_power_off:
+	ctrl_status = readl(core->reg_base + CTRL_STATUS);
+	wfi_status = readl(core->reg_base + WRAPPER_TZ_CPU_STATUS);
+	wfi_status &= BIT(0);
+	dev_err(core->dev, "skip power collapse, wfi=%#x, idle=%#x, pcr=%#x, ctrl=%#x)\n",
+		wfi_status, idle_status, pc_ready, ctrl_status);
+
+	return -EAGAIN;
+}
+
+static int iris_vpu_power_off_controller(struct iris_core *core)
+{
+	int val = 0;
+	int ret;
+
+	writel(0x3, core->reg_base + CPU_CS_X2RPMH);
+
+	writel(0x1, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0x1, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
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
+	writel(0x3, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
+	writel(0x1, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
+	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
+	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
+
+disable_power:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return 0;
+}
+
+void iris_vpu_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+}
+
+void iris_vpu_power_off(struct iris_core *core)
+{
+	if (!core->power_enabled)
+		return;
+
+	iris_opp_set_rate(core, 0);
+	core->iris_platform_data->vpu_ops->power_off_hw(core);
+	iris_vpu_power_off_controller(core);
+	iris_unset_icc_bw(core);
+
+	if (!iris_vpu_watchdog(core, core->intr_status))
+		disable_irq_nosync(core->irq);
+
+	core->power_enabled = false;
+}
+
+static int iris_vpu_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_reset_ahb2axi_bridge(core);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_clock;
+
+	return 0;
+
+err_disable_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	if (ret)
+		goto err_disable_clock;
+
+	return 0;
+
+err_disable_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+int iris_vpu_power_on(struct iris_core *core)
+{
+	u32 freq = 0;
+	int ret;
+
+	if (core->power_enabled)
+		return 0;
+
+	if (core->state != IRIS_CORE_INIT)
+		return -EINVAL;
+
+	ret = iris_set_icc_bw(core, INT_MAX);
+	if (ret)
+		goto err;
+
+	ret = iris_vpu_power_on_controller(core);
+	if (ret)
+		goto err_unvote_icc;
+
+	ret = iris_vpu_power_on_hw(core);
+	if (ret)
+		goto err_power_off_ctrl;
+
+	core->power_enabled = true;
+
+	freq = core->power.clk_freq ? core->power.clk_freq :
+				      (u32)ULONG_MAX;
+
+	iris_opp_set_rate(core, freq);
+
+	core->iris_platform_data->set_preset_registers(core);
+
+	iris_vpu_interrupt_init(core);
+	core->intr_status = 0;
+	enable_irq(core->irq);
+
+	return 0;
+
+err_power_off_ctrl:
+	dev_err(core->dev, "power on failed\n");
+	iris_vpu_power_off_controller(core);
+err_unvote_icc:
+	iris_unset_icc_bw(core);
+err:
+	core->power_enabled = false;
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 706b207bc295..525bbb52dd79 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -8,9 +8,20 @@
 
 struct iris_core;
 
+extern const struct vpu_ops iris_vpu2_ops;
+extern const struct vpu_ops iris_vpu3_ops;
+
+struct vpu_ops {
+	void (*power_off_hw)(struct iris_core *core);
+};
+
 int iris_vpu_boot_firmware(struct iris_core *core);
 void iris_vpu_raise_interrupt(struct iris_core *core);
 void iris_vpu_clear_interrupt(struct iris_core *core);
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
+int iris_vpu_prepare_pc(struct iris_core *core);
+int iris_vpu_power_on(struct iris_core *core);
+void iris_vpu_power_off_hw(struct iris_core *core);
+void iris_vpu_power_off(struct iris_core *core);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
new file mode 100644
index 000000000000..818c81048fe5
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_VPU_REGISTER_DEFINES_H_
+#define _IRIS_VPU_REGISTER_DEFINES_H_
+
+#define VCODEC_BASE_OFFS			0x00000000
+#define CPU_BASE_OFFS				0x000A0000
+#define WRAPPER_BASE_OFFS			0x000B0000
+
+#define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
+
+#define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
+
+#endif

-- 
2.34.1



