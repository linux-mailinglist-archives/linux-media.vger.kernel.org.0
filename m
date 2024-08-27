Return-Path: <linux-media+bounces-16892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 575F09606DB
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B62B51F2368A
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820081A08C1;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lu/DdtrJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FF119E7E7;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753195; cv=none; b=pBtHiFQM3GV68j9GTPjd/hQpzgcfUbFfjjcQoWt9An/jnDwWCJVE4aMMYyK2SsK6NwcD6NoSG649W3X3TLB5noqHEmxXczIiVvafOSupNSMPCGI0267b29CmjStQJevt9yjvNHu75OxNVd8a8bOGJgOxuHf9tcStgQ2osEBnuDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753195; c=relaxed/simple;
	bh=UVNJ71Ij9oExCG/XltWUXJz2Zs49OHsINOrY5m5kMMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5sYqSSO/Bwoh5lKfQFIetj0QTebBzVXupcaI3X5U/4bd161r5iCTaakXw9+ET7AfpPJ4OE6o/4r3OQNitjJXd4TddFkJtEcJ1Re4ju6IxXKmV6JaOVVSRhHk44+9ctQQw5CAwJaa7QL1LQ44N14fISVCkrhY4pqCNjpvhQY6gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lu/DdtrJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E846FC4DDEA;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753195;
	bh=UVNJ71Ij9oExCG/XltWUXJz2Zs49OHsINOrY5m5kMMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Lu/DdtrJGiGjk5KWBzbxXiZlgImFtkmhaAYkEJ/eksWisc9RALpnfneLstBPIc1V4
	 NX2ZrJP2yxBCqJf+9lk0XnzWXadgSawdhBKLIpbqwXYRw7el1XF0WqU11O3tWRKKAr
	 IHD+wpS0qVU/uiYFjR7JhVIiuUHnXexFLDL7ob8xCEGzas3LVfhMKm5N8cHeV6Rciz
	 fksFbC8TQpOrkSEHFZcfozPmQ2Q1QfhNZHjhS9ivMSOj/UOJXqHJcEYMqOIuIbdvv7
	 VkjCGdd1JqAvDXTN6AwJnXl0gkg85u7l6Yx7CwWj0cMSHo/ommt8xyAYbY7JXTP3D2
	 mBI1W7H474YCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6FCC5472E;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:34 +0530
Subject: [PATCH v3 09/29] media: iris: introduce Host firmware interface
 with necessary hooks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-9-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=54416;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=4+G1OVfTsQ/pXuuP7tdqHzCEh/3AP4KeyYOvtsL+52w=;
 b=om+BThK/QE2oUffnPD8rreMXMyMVofwh3JVr0Wr46FyiTzNzEVhgI2FMMPBjp/ZQ7a9/04BKy
 vX8OaPikwmDDfh1xZe7WyeEhqNNAl0SNqCkR1MKIXGDUO/BkwdvSdAd
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Host firmware interface (HFI) is well defined set of interfaces
for communication between host driver and firmware.
The command and responses are exchanged in form of packets.
One or multiple packets are grouped under packet header.
Each packet has packet type which describes the specific HFI
and payload which holds the corresponding value for that HFI.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   5 +
 drivers/media/platform/qcom/iris/iris_core.c       |  26 ++-
 drivers/media/platform/qcom/iris/iris_core.h       |  20 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  56 +++++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  60 ++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   3 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  61 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  94 +++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 174 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   4 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  72 +++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  46 +++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 164 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  69 +++++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 229 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 201 ++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_queue.h  |   5 +
 .../platform/qcom/iris/iris_platform_common.h      |  15 ++
 .../platform/qcom/iris/iris_platform_sm8250.c      |   3 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |  14 ++
 drivers/media/platform/qcom/iris/iris_probe.c      |  40 ++++
 drivers/media/platform/qcom/iris/iris_state.c      |  15 ++
 drivers/media/platform/qcom/iris/iris_state.h      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  42 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 25 files changed, 1424 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 95f4e92fe085..d1f0b933df3d 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,12 +1,17 @@
 iris-objs += iris_core.o \
              iris_firmware.o \
+             iris_hfi_common.o \
              iris_hfi_gen1_command.o \
+             iris_hfi_gen1_response.o \
              iris_hfi_gen2_command.o \
+             iris_hfi_gen2_packet.o \
+             iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
              iris_platform_sm8250.o \
              iris_platform_sm8550.o \
              iris_probe.o \
              iris_resources.o \
+             iris_state.o \
              iris_vidc.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 5ad66ac113ae..92458d7f1e36 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -17,6 +17,26 @@ void iris_core_deinit(struct iris_core *core)
 	mutex_unlock(&core->lock);
 }
 
+static int iris_wait_for_system_response(struct iris_core *core)
+{
+	u32 hw_response_timeout_val;
+	int ret;
+
+	if (core->state == IRIS_CORE_ERROR)
+		return -EIO;
+
+	hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
+
+	ret = wait_for_completion_timeout(&core->core_init_done,
+					  msecs_to_jiffies(hw_response_timeout_val));
+	if (!ret) {
+		iris_change_core_state(core, IRIS_CORE_ERROR);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 int iris_core_init(struct iris_core *core)
 {
 	int ret;
@@ -44,9 +64,13 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	ret = iris_hfi_core_init(core);
+	if (ret)
+		goto error_unload_fw;
+
 	mutex_unlock(&core->lock);
 
-	return 0;
+	return iris_wait_for_system_response(core);
 
 error_unload_fw:
 	iris_fw_unload(core);
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 13c5932f9110..409f9822807d 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -9,11 +9,15 @@
 #include <linux/types.h>
 #include <media/v4l2-device.h>
 
+#include "iris_hfi_common.h"
 #include "iris_hfi_queue.h"
 #include "iris_platform_common.h"
 #include "iris_resources.h"
 #include "iris_state.h"
 
+#define IRIS_FW_VERSION_LENGTH		128
+#define IFACEQ_CORE_PKT_SIZE		(1024 * 4)
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -40,6 +44,14 @@
  * @message_queue: shared interface queue to receive responses from firmware
  * @debug_queue: shared interface queue to receive debug info from firmware
  * @lock: a lock for this strucure
+ * @response_packet: a pointer to response packet from fw to driver
+ * @header_id: id of packet header
+ * @packet_id: id of packet
+ * @hfi_ops: iris hfi command ops
+ * @hfi_response_ops: iris hfi response ops
+ * @core_init_done: structure of signal completion for system response
+ * @intr_status: interrupt status
+ * @sys_error_handler: a delayed work for handling system fatal error
  */
 
 struct iris_core {
@@ -66,6 +78,14 @@ struct iris_core {
 	struct iris_iface_q_info		message_queue;
 	struct iris_iface_q_info		debug_queue;
 	struct mutex				lock; /* lock for core related operations */
+	u8					*response_packet;
+	u32					header_id;
+	u32					packet_id;
+	const struct iris_hfi_command_ops	*hfi_ops;
+	const struct iris_hfi_response_ops	*hfi_response_ops;
+	struct completion			core_init_done;
+	u32					intr_status;
+	struct delayed_work			sys_error_handler;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
new file mode 100644
index 000000000000..a5a28029d8d1
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_hfi_common.h"
+#include "iris_vpu_common.h"
+
+int iris_hfi_core_init(struct iris_core *core)
+{
+	const struct iris_hfi_command_ops *hfi_ops = core->hfi_ops;
+	int ret;
+
+	ret = hfi_ops->sys_init(core);
+	if (ret)
+		return ret;
+
+	ret = hfi_ops->sys_image_version(core);
+	if (ret)
+		return ret;
+
+	return hfi_ops->sys_interframe_powercollapse(core);
+}
+
+irqreturn_t iris_hfi_isr(int irq, void *data)
+{
+	disable_irq_nosync(irq);
+
+	return IRQ_WAKE_THREAD;
+}
+
+irqreturn_t iris_hfi_isr_handler(int irq, void *data)
+{
+	struct iris_core *core = data;
+
+	if (!core)
+		return IRQ_NONE;
+
+	mutex_lock(&core->lock);
+	if (core->state != IRIS_CORE_INIT) {
+		mutex_unlock(&core->lock);
+		goto exit;
+	}
+
+	iris_vpu_clear_interrupt(core);
+	mutex_unlock(&core->lock);
+
+	core->hfi_response_ops->hfi_response_handler(core);
+
+exit:
+	if (!iris_vpu_watchdog(core, core->intr_status))
+		enable_irq(irq);
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
new file mode 100644
index 000000000000..c3d5b899cf60
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_HFI_COMMON_H_
+#define _IRIS_HFI_COMMON_H_
+
+#include <linux/types.h>
+#include <media/v4l2-device.h>
+
+struct iris_core;
+
+enum hfi_packet_port_type {
+	HFI_PORT_NONE		= 0x00000000,
+	HFI_PORT_BITSTREAM	= 0x00000001,
+	HFI_PORT_RAW		= 0x00000002,
+};
+
+enum hfi_packet_payload_info {
+	HFI_PAYLOAD_NONE	= 0x00000000,
+	HFI_PAYLOAD_U32		= 0x00000001,
+	HFI_PAYLOAD_S32		= 0x00000002,
+	HFI_PAYLOAD_U64		= 0x00000003,
+	HFI_PAYLOAD_S64		= 0x00000004,
+	HFI_PAYLOAD_STRUCTURE	= 0x00000005,
+	HFI_PAYLOAD_BLOB	= 0x00000006,
+	HFI_PAYLOAD_STRING	= 0x00000007,
+	HFI_PAYLOAD_Q16		= 0x00000008,
+	HFI_PAYLOAD_U32_ENUM	= 0x00000009,
+	HFI_PAYLOAD_32_PACKED	= 0x0000000a,
+	HFI_PAYLOAD_U32_ARRAY	= 0x0000000b,
+	HFI_PAYLOAD_S32_ARRAY	= 0x0000000c,
+	HFI_PAYLOAD_64_PACKED	= 0x0000000d,
+};
+
+enum hfi_packet_host_flags {
+	HFI_HOST_FLAGS_NONE			= 0x00000000,
+	HFI_HOST_FLAGS_INTR_REQUIRED		= 0x00000001,
+	HFI_HOST_FLAGS_RESPONSE_REQUIRED	= 0x00000002,
+	HFI_HOST_FLAGS_NON_DISCARDABLE		= 0x00000004,
+	HFI_HOST_FLAGS_GET_PROPERTY		= 0x00000008,
+};
+
+struct iris_hfi_command_ops {
+	int (*sys_init)(struct iris_core *core);
+	int (*sys_image_version)(struct iris_core *core);
+	int (*sys_interframe_powercollapse)(struct iris_core *core);
+};
+
+struct iris_hfi_response_ops {
+	void (*hfi_response_handler)(struct iris_core *core);
+};
+
+int iris_hfi_core_init(struct iris_core *core);
+
+irqreturn_t iris_hfi_isr(int irq, void *data);
+irqreturn_t iris_hfi_isr_handler(int irq, void *data);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index b02f629a9cdc..15edbb359c71 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -6,8 +6,11 @@
 #ifndef _IRIS_HFI_GEN1_H_
 #define _IRIS_HFI_GEN1_H_
 
+struct iris_core;
 struct iris_inst;
 
+void iris_hfi_gen1_command_ops_init(struct iris_core *core);
+void iris_hfi_gen1_response_ops_init(struct iris_core *core);
 struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 20c68f4ffb72..8f045ef56163 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -4,8 +4,69 @@
  */
 
 #include "iris_hfi_gen1.h"
+#include "iris_hfi_gen1_defines.h"
 #include "iris_instance.h"
 
+static int iris_hfi_gen1_sys_init(struct iris_core *core)
+{
+	struct hfi_sys_init_pkt sys_init_pkt;
+
+	sys_init_pkt.hdr.size = sizeof(sys_init_pkt);
+	sys_init_pkt.hdr.pkt_type = HFI_CMD_SYS_INIT;
+	sys_init_pkt.arch_type = HFI_VIDEO_ARCH_OX;
+
+	return iris_hfi_queue_cmd_write_locked(core, &sys_init_pkt, sys_init_pkt.hdr.size);
+}
+
+static int iris_hfi_gen1_sys_image_version(struct iris_core *core)
+{
+	struct hfi_sys_get_property_pkt packet;
+
+	packet.hdr.size = sizeof(packet);
+	packet.hdr.pkt_type = HFI_CMD_SYS_GET_PROPERTY;
+	packet.num_properties = 1;
+	packet.data = HFI_PROPERTY_SYS_IMAGE_VERSION;
+
+	return iris_hfi_queue_cmd_write_locked(core, &packet, packet.hdr.size);
+}
+
+static int iris_hfi_gen1_sys_interframe_powercollapse(struct iris_core *core)
+{
+	struct hfi_sys_set_property_pkt *pkt;
+	struct hfi_enable *hfi;
+	u32 packet_size;
+	u32 ret;
+
+	packet_size = struct_size(pkt, data, 1) + sizeof(*hfi);
+	pkt = kzalloc(packet_size, GFP_KERNEL);
+	if (!pkt)
+		return -ENOMEM;
+
+	hfi = (struct hfi_enable *)&pkt->data[1];
+
+	pkt->hdr.size = packet_size;
+	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
+	pkt->num_properties = 1;
+	pkt->data[0] = HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL;
+	hfi->enable = true;
+
+	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt->hdr.size);
+	kfree(pkt);
+
+	return ret;
+}
+
+static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
+	.sys_init = iris_hfi_gen1_sys_init,
+	.sys_image_version = iris_hfi_gen1_sys_image_version,
+	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
+};
+
+void iris_hfi_gen1_command_ops_init(struct iris_core *core)
+{
+	core->hfi_ops = &iris_hfi_gen1_command_ops;
+}
+
 struct iris_inst *iris_hfi_gen1_get_instance(void)
 {
 	return kzalloc(sizeof(struct iris_inst), GFP_KERNEL);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
new file mode 100644
index 000000000000..5c07d6a29863
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_HFI_GEN1_DEFINES_H_
+#define _IRIS_HFI_GEN1_DEFINES_H_
+
+#include <linux/types.h>
+
+#define HFI_VIDEO_ARCH_OX				0x1
+#define HFI_ERR_NONE					0x0
+
+#define HFI_CMD_SYS_INIT				0x10001
+#define HFI_CMD_SYS_SET_PROPERTY			0x10005
+#define HFI_CMD_SYS_GET_PROPERTY			0x10006
+
+#define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
+#define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
+
+#define HFI_EVENT_SYS_ERROR				0x1
+
+#define HFI_MSG_SYS_INIT				0x20001
+#define HFI_MSG_SYS_COV					0x20009
+#define HFI_MSG_SYS_PROPERTY_INFO			0x2000a
+
+#define HFI_MSG_EVENT_NOTIFY				0x21001
+
+struct hfi_pkt_hdr {
+	u32 size;
+	u32 pkt_type;
+};
+
+struct hfi_sys_init_pkt {
+	struct hfi_pkt_hdr hdr;
+	u32 arch_type;
+};
+
+struct hfi_sys_set_property_pkt {
+	struct hfi_pkt_hdr hdr;
+	u32 num_properties;
+	u32 data[];
+};
+
+struct hfi_sys_get_property_pkt {
+	struct hfi_pkt_hdr hdr;
+	u32 num_properties;
+	u32 data;
+};
+
+struct hfi_msg_event_notify_pkt {
+	struct hfi_pkt_hdr hdr;
+	u32 event_id;
+	u32 event_data1;
+	u32 event_data2;
+	u32 ext_event_data[];
+};
+
+struct hfi_msg_sys_init_done_pkt {
+	struct hfi_pkt_hdr hdr;
+	u32 error_type;
+	u32 num_properties;
+	u32 data[];
+};
+
+struct hfi_msg_sys_property_info_pkt {
+	struct hfi_pkt_hdr hdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
+struct hfi_enable {
+	u32 enable;
+};
+
+struct hfi_msg_sys_debug_pkt {
+	struct hfi_pkt_hdr hdr;
+	u32 msg_type;
+	u32 msg_size;
+	u32 time_stamp_hi;
+	u32 time_stamp_lo;
+	u8 msg_data[];
+};
+
+struct hfi_msg_sys_coverage_pkt {
+	struct hfi_pkt_hdr hdr;
+	u32 msg_size;
+	u32 time_stamp_hi;
+	u32 time_stamp_lo;
+	u8 msg_data[];
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
new file mode 100644
index 000000000000..3eb2ce99c614
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_hfi_gen1.h"
+#include "iris_hfi_gen1_defines.h"
+#include "iris_instance.h"
+
+static void
+iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
+{
+	struct hfi_msg_event_notify_pkt *pkt = packet;
+
+	if (pkt->event_id == HFI_EVENT_SYS_ERROR)
+		dev_err(core->dev, "sys error (type: %x, data1:%x, data2:%x)\n",
+			pkt->event_id, pkt->event_data1, pkt->event_data2);
+
+	iris_change_core_state(core, IRIS_CORE_ERROR);
+	schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
+}
+
+static void iris_hfi_gen1_sys_init_done(struct iris_core *core, void *packet)
+{
+	struct hfi_msg_sys_init_done_pkt *pkt = packet;
+
+	if (pkt->error_type != HFI_ERR_NONE) {
+		iris_change_core_state(core, IRIS_CORE_ERROR);
+		return;
+	}
+
+	complete(&core->core_init_done);
+}
+
+static void
+iris_hfi_gen1_sys_get_prop_image_version(struct iris_core *core,
+					 struct hfi_msg_sys_property_info_pkt *pkt)
+{
+	char fw_version[IRIS_FW_VERSION_LENGTH];
+	u8 *str_image_version;
+	int req_bytes;
+	u32 i;
+
+	req_bytes = pkt->hdr.size - sizeof(*pkt);
+
+	if (req_bytes < IRIS_FW_VERSION_LENGTH - 1 || !pkt->data[0] || pkt->num_properties > 1)
+		/* bad packet */
+		return;
+
+	str_image_version = pkt->data;
+	if (!str_image_version)
+		return;
+
+	for (i = 0; i < IRIS_FW_VERSION_LENGTH - 1; i++) {
+		if (str_image_version[i] != '\0')
+			fw_version[i] = str_image_version[i];
+		else
+			fw_version[i] = ' ';
+	}
+	fw_version[i] = '\0';
+
+	dev_dbg(core->dev, "firmware version: %s\n", fw_version);
+}
+
+static void iris_hfi_gen1_sys_property_info(struct iris_core *core, void *packet)
+{
+	struct hfi_msg_sys_property_info_pkt *pkt = packet;
+
+	if (!pkt->num_properties) {
+		dev_dbg(core->dev, "no properties\n");
+		return;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_SYS_IMAGE_VERSION:
+		iris_hfi_gen1_sys_get_prop_image_version(core, pkt);
+		break;
+	default:
+		dev_dbg(core->dev, "unknown property data\n");
+		break;
+	}
+}
+
+struct iris_hfi_gen1_response_pkt_info {
+	u32 pkt;
+	u32 pkt_sz;
+};
+
+static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
+	{
+	 .pkt = HFI_MSG_EVENT_NOTIFY,
+	 .pkt_sz = sizeof(struct hfi_msg_event_notify_pkt),
+	},
+	{
+	 .pkt = HFI_MSG_SYS_INIT,
+	 .pkt_sz = sizeof(struct hfi_msg_sys_init_done_pkt),
+	},
+	{
+	 .pkt = HFI_MSG_SYS_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_sys_property_info_pkt),
+	},
+};
+
+static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
+{
+	const struct iris_hfi_gen1_response_pkt_info *pkt_info;
+	struct device *dev = core->dev;
+	struct hfi_pkt_hdr *hdr;
+	bool found = false;
+	unsigned int i;
+
+	hdr = (struct hfi_pkt_hdr *)response;
+
+	for (i = 0; i < ARRAY_SIZE(pkt_infos); i++) {
+		pkt_info = &pkt_infos[i];
+		if (pkt_info->pkt != hdr->pkt_type)
+			continue;
+		found = true;
+		break;
+	}
+
+	if (!found || hdr->size < pkt_info->pkt_sz) {
+		dev_err(dev, "bad packet size (%d should be %d, pkt type:%x, found %d)\n",
+			hdr->size, pkt_info->pkt_sz, hdr->pkt_type, found);
+
+		return;
+	}
+
+	if (hdr->pkt_type == HFI_MSG_SYS_INIT)
+		iris_hfi_gen1_sys_init_done(core, hdr);
+	else if (hdr->pkt_type == HFI_MSG_SYS_PROPERTY_INFO)
+		iris_hfi_gen1_sys_property_info(core, hdr);
+	else if (hdr->pkt_type == HFI_MSG_EVENT_NOTIFY)
+		iris_hfi_gen1_sys_event_notify(core, hdr);
+}
+
+static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
+{
+	struct hfi_msg_sys_coverage_pkt *pkt;
+
+	while (!iris_hfi_queue_dbg_read(core, packet)) {
+		pkt = (struct hfi_msg_sys_coverage_pkt *)packet;
+
+		if (pkt->hdr.pkt_type != HFI_MSG_SYS_COV) {
+			struct hfi_msg_sys_debug_pkt *pkt =
+				(struct hfi_msg_sys_debug_pkt *)packet;
+
+			dev_dbg(core->dev, "%s", pkt->msg_data);
+		}
+	}
+}
+
+static void iris_hfi_gen1_response_handler(struct iris_core *core)
+{
+	memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
+	while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
+		iris_hfi_gen1_handle_response(core, core->response_packet);
+		if (core->state != IRIS_CORE_INIT)
+			break;
+
+		memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
+	}
+
+	iris_hfi_gen1_flush_debug_queue(core, core->response_packet);
+}
+
+static const struct iris_hfi_response_ops iris_hfi_gen1_response_ops = {
+	.hfi_response_handler = iris_hfi_gen1_response_handler,
+};
+
+void iris_hfi_gen1_response_ops_init(struct iris_core *core)
+{
+	core->hfi_response_ops = &iris_hfi_gen1_response_ops;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 4f9748cbe0e3..6ec83984fda9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -8,6 +8,8 @@
 
 #include "iris_instance.h"
 
+struct iris_core;
+
 /**
  * struct iris_inst_hfi_gen2 - holds per video instance parameters for hfi_gen2
  *
@@ -17,6 +19,8 @@ struct iris_inst_hfi_gen2 {
 	struct iris_inst		inst;
 };
 
+void iris_hfi_gen2_command_ops_init(struct iris_core *core);
+void iris_hfi_gen2_response_ops_init(struct iris_core *core);
 struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 3ee33c8befae..807266858d93 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -4,6 +4,78 @@
  */
 
 #include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_packet.h"
+
+#define NUM_SYS_INIT_PACKETS 8
+
+static int iris_hfi_gen2_sys_init(struct iris_core *core)
+{
+	struct iris_hfi_header *hdr;
+	u32 packet_size;
+	int ret;
+
+	packet_size = sizeof(*hdr) +
+		NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32));
+	hdr = kzalloc(packet_size, GFP_KERNEL);
+	if (!hdr)
+		return -ENOMEM;
+
+	iris_hfi_gen2_packet_sys_init(core, hdr);
+	ret = iris_hfi_queue_cmd_write_locked(core, hdr, hdr->size);
+
+	kfree(hdr);
+
+	return ret;
+}
+
+static int iris_hfi_gen2_sys_image_version(struct iris_core *core)
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
+	iris_hfi_gen2_packet_image_version(core, hdr);
+	ret = iris_hfi_queue_cmd_write_locked(core, hdr, hdr->size);
+
+	kfree(hdr);
+
+	return ret;
+}
+
+static int iris_hfi_gen2_sys_interframe_powercollapse(struct iris_core *core)
+{
+	struct iris_hfi_header *hdr;
+	u32 packet_size;
+	int ret;
+
+	packet_size = sizeof(*hdr) + sizeof(struct iris_hfi_packet) + sizeof(u32);
+	hdr = kzalloc(packet_size, GFP_KERNEL);
+	if (!hdr)
+		return -ENOMEM;
+
+	iris_hfi_gen2_packet_sys_interframe_powercollapse(core, hdr);
+	ret = iris_hfi_queue_cmd_write_locked(core, hdr, hdr->size);
+
+	kfree(hdr);
+
+	return ret;
+}
+
+static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
+	.sys_init = iris_hfi_gen2_sys_init,
+	.sys_image_version = iris_hfi_gen2_sys_image_version,
+	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
+};
+
+void iris_hfi_gen2_command_ops_init(struct iris_core *core)
+{
+	core->hfi_ops = &iris_hfi_gen2_command_ops;
+}
 
 struct iris_inst *iris_hfi_gen2_get_instance(void)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
new file mode 100644
index 000000000000..3e3e4ddfe21f
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_HFI_GEN2_DEFINES_H_
+#define _IRIS_HFI_GEN2_DEFINES_H_
+
+#include <linux/types.h>
+
+#define HFI_VIDEO_ARCH_LX			0x1
+
+#define HFI_CMD_BEGIN				0x01000000
+#define HFI_CMD_INIT				0x01000001
+#define HFI_CMD_END				0x01FFFFFF
+
+#define HFI_PROP_BEGIN				0x03000000
+#define HFI_PROP_IMAGE_VERSION			0x03000001
+#define HFI_PROP_INTRA_FRAME_POWER_COLLAPSE	0x03000002
+#define HFI_PROP_UBWC_MAX_CHANNELS		0x03000003
+#define HFI_PROP_UBWC_MAL_LENGTH		0x03000004
+#define HFI_PROP_UBWC_HBB			0x03000005
+#define HFI_PROP_UBWC_BANK_SWZL_LEVEL1		0x03000006
+#define HFI_PROP_UBWC_BANK_SWZL_LEVEL2		0x03000007
+#define HFI_PROP_UBWC_BANK_SWZL_LEVEL3		0x03000008
+#define HFI_PROP_UBWC_BANK_SPREADING		0x03000009
+#define HFI_PROP_END				0x03FFFFFF
+
+#define HFI_SYSTEM_ERROR_BEGIN			0x05000000
+#define HFI_SYS_ERROR_WD_TIMEOUT		0x05000001
+#define HFI_SYSTEM_ERROR_END			0x05FFFFFF
+
+enum hfi_packet_firmware_flags {
+	HFI_FW_FLAGS_SUCCESS			= 0x00000001,
+	HFI_FW_FLAGS_INFORMATION		= 0x00000002,
+	HFI_FW_FLAGS_SESSION_ERROR		= 0x00000004,
+	HFI_FW_FLAGS_SYSTEM_ERROR		= 0x00000008,
+};
+
+struct hfi_debug_header {
+	u32 size;
+	u32 debug_level;
+	u32 reserved[2];
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
new file mode 100644
index 000000000000..8266eae5ff94
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_hfi_common.h"
+#include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_packet.h"
+
+static void iris_hfi_gen2_create_header(struct iris_hfi_header *hdr,
+					u32 session_id, u32 header_id)
+{
+	memset(hdr, 0, sizeof(*hdr));
+
+	hdr->size = sizeof(*hdr);
+	hdr->session_id = session_id;
+	hdr->header_id = header_id;
+	hdr->num_packets = 0;
+}
+
+static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
+					u32 pkt_flags, u32 payload_type, u32 port,
+					u32 packet_id, void *payload, u32 payload_size)
+{
+	struct iris_hfi_packet *pkt;
+	u32 pkt_size;
+
+	pkt = (struct iris_hfi_packet *)((u8 *)hdr + hdr->size);
+	pkt_size = sizeof(*pkt) + payload_size;
+
+	memset(pkt, 0, pkt_size);
+	pkt->size = pkt_size;
+	pkt->type = pkt_type;
+	pkt->flags = pkt_flags;
+	pkt->payload_info = payload_type;
+	pkt->port = port;
+	pkt->packet_id = packet_id;
+	if (payload_size)
+		memcpy(&pkt->payload[0], payload, payload_size);
+
+	hdr->num_packets++;
+	hdr->size += pkt->size;
+}
+
+void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
+{
+	u32 payload = 0;
+
+	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
+
+	payload = HFI_VIDEO_ARCH_LX;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_CMD_INIT,
+				    (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+				    HFI_HOST_FLAGS_INTR_REQUIRED |
+				    HFI_HOST_FLAGS_NON_DISCARDABLE),
+				    HFI_PAYLOAD_U32,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+
+	payload = core->iris_platform_data->ubwc_config->max_channels;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_UBWC_MAX_CHANNELS,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+
+	payload = core->iris_platform_data->ubwc_config->mal_length;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_UBWC_MAL_LENGTH,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+
+	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_UBWC_HBB,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+
+	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+
+	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+
+	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+
+	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_UBWC_BANK_SPREADING,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+}
+
+void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct iris_hfi_header *hdr)
+{
+	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
+
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_IMAGE_VERSION,
+				    (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+				    HFI_HOST_FLAGS_INTR_REQUIRED |
+				    HFI_HOST_FLAGS_GET_PROPERTY),
+				    HFI_PAYLOAD_NONE,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    NULL, 0);
+}
+
+void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
+						       struct iris_hfi_header *hdr)
+{
+	u32 payload = 1; /* HFI_TRUE */
+
+	iris_hfi_gen2_create_header(hdr, 0 /*session_id*/, core->header_id++);
+
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_INTRA_FRAME_POWER_COLLAPSE,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
new file mode 100644
index 000000000000..eba109efeb76
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_HFI_GEN2_PACKET_H_
+#define _IRIS_HFI_GEN2_PACKET_H_
+
+#include "iris_hfi_gen2_defines.h"
+
+struct iris_core;
+
+/**
+ * struct iris_hfi_header
+ *
+ * @size: size of the total packet in bytes including hfi_header
+ * @session_id: For session level hfi_header session_id is non-zero.
+ *                For  system level hfi_header session_id is zero.
+ * @header_id: unique header id for each hfi_header
+ * @reserved: reserved for future use
+ * @num_packets: number of hfi_packet that are included with the hfi_header
+ */
+struct iris_hfi_header {
+	u32 size;
+	u32 session_id;
+	u32 header_id;
+	u32 reserved[4];
+	u32 num_packets;
+};
+
+/**
+ * struct iris_hfi_packet
+ *
+ * @size: size of the hfi_packet in bytes including payload
+ * @type: one of the below hfi_packet types:
+ *        HFI_CMD_*,
+ *        HFI_PROP_*,
+ *        HFI_ERROR_*,
+ *        HFI_INFO_*,
+ *        HFI_SYS_ERROR_*
+ * @flags: hfi_packet flags. It is represented as bit masks.
+ *         host packet flags are "enum hfi_packet_host_flags"
+ *         firmware packet flags are "enum hfi_packet_firmware_flags"
+ * @payload_info: payload information indicated by "enum hfi_packet_payload_info"
+ * @port: hfi_packet port type indicated by "enum hfi_packet_port_type"
+ *        This is bitmask and may be applicable to multiple ports.
+ * @packet_id: host hfi_packet contains unique packet id.
+ *             firmware returns host packet id in response packet
+ *             wherever applicable. If not applicable firmware sets it to zero.
+ * @reserved: reserved for future use.
+ * @payload: flexible array of payload having additional packet information.
+ */
+struct iris_hfi_packet {
+	u32 size;
+	u32 type;
+	u32 flags;
+	u32 payload_info;
+	u32 port;
+	u32 packet_id;
+	u32 reserved[2];
+	u32 payload[];
+};
+
+void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr);
+void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct iris_hfi_header *hdr);
+void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
+						       struct iris_hfi_header *hdr);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
new file mode 100644
index 000000000000..e208a5ae664a
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_defines.h"
+#include "iris_hfi_gen2_packet.h"
+#include "iris_vpu_common.h"
+
+struct iris_hfi_gen2_core_hfi_range {
+	u32 begin;
+	u32 end;
+	int (*handle)(struct iris_core *core, struct iris_hfi_packet *pkt);
+};
+
+static int iris_hfi_gen2_validate_packet(u8 *response_pkt, u8 *core_resp_pkt)
+{
+	u32 response_pkt_size = 0;
+	u8 *response_limit;
+
+	response_limit = core_resp_pkt + IFACEQ_CORE_PKT_SIZE;
+
+	response_pkt_size = *(u32 *)response_pkt;
+	if (!response_pkt_size)
+		return -EINVAL;
+
+	if (response_pkt_size < sizeof(struct iris_hfi_packet))
+		return -EINVAL;
+
+	if (response_pkt + response_pkt_size > response_limit)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int iris_hfi_gen2_validate_hdr_packet(struct iris_core *core, struct iris_hfi_header *hdr)
+{
+	struct iris_hfi_packet *packet;
+	int i, ret = 0;
+	u8 *pkt;
+
+	if (hdr->size < sizeof(*hdr) + sizeof(*packet))
+		return -EINVAL;
+
+	pkt = (u8 *)((u8 *)hdr + sizeof(*hdr));
+
+	for (i = 0; i < hdr->num_packets; i++) {
+		packet = (struct iris_hfi_packet *)pkt;
+		ret = iris_hfi_gen2_validate_packet(pkt, core->response_packet);
+		if (ret)
+			return ret;
+
+		pkt += packet->size;
+	}
+
+	return ret;
+}
+
+static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
+					     struct iris_hfi_packet *pkt)
+{
+	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
+
+	iris_change_core_state(core, IRIS_CORE_ERROR);
+	schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
+
+	return 0;
+}
+
+static int iris_hfi_gen2_handle_system_init(struct iris_core *core,
+					    struct iris_hfi_packet *pkt)
+{
+	if (!(pkt->flags & HFI_FW_FLAGS_SUCCESS)) {
+		iris_change_core_state(core, IRIS_CORE_ERROR);
+		return 0;
+	}
+
+	complete(&core->core_init_done);
+
+	return 0;
+}
+
+static int iris_hfi_gen2_handle_image_version_property(struct iris_core *core,
+						       struct iris_hfi_packet *pkt)
+{
+	char fw_version[IRIS_FW_VERSION_LENGTH];
+	u8 *str_image_version;
+	u32 req_bytes;
+	u32 i = 0;
+
+	req_bytes = pkt->size - sizeof(*pkt);
+	if (req_bytes < IRIS_FW_VERSION_LENGTH - 1)
+		return -EINVAL;
+
+	str_image_version = (u8 *)pkt + sizeof(*pkt);
+
+	for (i = 0; i < IRIS_FW_VERSION_LENGTH - 1; i++) {
+		if (str_image_version[i] != '\0')
+			fw_version[i] = str_image_version[i];
+		else
+			fw_version[i] = ' ';
+	}
+	fw_version[i] = '\0';
+
+	dev_dbg(core->dev, "firmware version: %s\n", fw_version);
+
+	return 0;
+}
+
+static int iris_hfi_gen2_handle_system_property(struct iris_core *core,
+						struct iris_hfi_packet *pkt)
+{
+	int ret = 0;
+
+	switch (pkt->type) {
+	case HFI_PROP_IMAGE_VERSION:
+		ret = iris_hfi_gen2_handle_image_version_property(core, pkt);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int iris_hfi_gen2_handle_system_response(struct iris_core *core,
+						struct iris_hfi_header *hdr)
+{
+	struct iris_hfi_packet *packet;
+	u8 *pkt, *start_pkt;
+	int ret = 0;
+	int i, j;
+	static const struct iris_hfi_gen2_core_hfi_range range[] = {
+		{HFI_SYSTEM_ERROR_BEGIN, HFI_SYSTEM_ERROR_END, iris_hfi_gen2_handle_system_error },
+		{HFI_PROP_BEGIN,         HFI_PROP_END, iris_hfi_gen2_handle_system_property },
+		{HFI_CMD_BEGIN,          HFI_CMD_END, iris_hfi_gen2_handle_system_init },
+	};
+
+	start_pkt = (u8 *)((u8 *)hdr + sizeof(*hdr));
+	for (i = 0; i < ARRAY_SIZE(range); i++) {
+		pkt = start_pkt;
+		for (j = 0; j < hdr->num_packets; j++) {
+			packet = (struct iris_hfi_packet *)pkt;
+			if (packet->flags & HFI_FW_FLAGS_SYSTEM_ERROR) {
+				ret = iris_hfi_gen2_handle_system_error(core, packet);
+				return ret;
+			}
+
+			if (packet->type > range[i].begin && packet->type < range[i].end) {
+				ret = range[i].handle(core, packet);
+				if (ret)
+					return ret;
+
+				if (packet->type >  HFI_SYSTEM_ERROR_BEGIN &&
+				    packet->type < HFI_SYSTEM_ERROR_END)
+					return 0;
+			}
+			pkt += packet->size;
+		}
+	}
+
+	return ret;
+}
+
+static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
+{
+	struct iris_hfi_header *hdr;
+	int ret;
+
+	hdr = (struct iris_hfi_header *)response;
+	ret = iris_hfi_gen2_validate_hdr_packet(core, hdr);
+	if (ret)
+		return iris_hfi_gen2_handle_system_error(core, NULL);
+
+	return iris_hfi_gen2_handle_system_response(core, hdr);
+}
+
+static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
+{
+	struct hfi_debug_header *pkt;
+	u8 *log;
+
+	while (!iris_hfi_queue_dbg_read(core, packet)) {
+		pkt = (struct hfi_debug_header *)packet;
+
+		if (pkt->size < sizeof(*pkt))
+			continue;
+
+		if (pkt->size >= IFACEQ_CORE_PKT_SIZE)
+			continue;
+
+		packet[pkt->size] = '\0';
+		log = (u8 *)packet + sizeof(*pkt) + 1;
+		dev_dbg(core->dev, "%s", log);
+	}
+}
+
+static void iris_hfi_gen2_response_handler(struct iris_core *core)
+{
+	if (iris_vpu_watchdog(core, core->intr_status)) {
+		struct iris_hfi_packet pkt = {.type = HFI_SYS_ERROR_WD_TIMEOUT};
+
+		dev_err(core->dev, "cpu watchdog error received\n");
+		iris_change_core_state(core, IRIS_CORE_ERROR);
+		iris_hfi_gen2_handle_system_error(core, &pkt);
+
+		return;
+	}
+
+	memset(core->response_packet, 0, sizeof(struct iris_hfi_header));
+	while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
+		iris_hfi_gen2_handle_response(core, core->response_packet);
+		if (core->state != IRIS_CORE_INIT)
+			break;
+		memset(core->response_packet, 0, sizeof(struct iris_hfi_header));
+	}
+
+	iris_hfi_gen2_flush_debug_queue(core, core->response_packet);
+}
+
+static const struct iris_hfi_response_ops iris_hfi_gen2_response_ops = {
+	.hfi_response_handler = iris_hfi_gen2_response_handler,
+};
+
+void iris_hfi_gen2_response_ops_init(struct iris_core *core)
+{
+	core->hfi_response_ops = &iris_hfi_gen2_response_ops;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index 11938880b8cd..b24d4640fea9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -5,6 +5,207 @@
 
 #include "iris_core.h"
 #include "iris_hfi_queue.h"
+#include "iris_vpu_common.h"
+
+static int iris_hfi_queue_write(struct iris_iface_q_info *qinfo, void *packet, u32 packet_size)
+{
+	u32 empty_space, read_idx, write_idx, new_write_idx;
+	struct iris_hfi_queue_header *queue;
+	u32 *write_ptr;
+	u32 residue;
+
+	queue = qinfo->qhdr;
+
+	read_idx = queue->read_idx * sizeof(u32);
+	write_idx = queue->write_idx * sizeof(u32);
+
+	if (write_idx < read_idx)
+		empty_space = read_idx - write_idx;
+	else
+		empty_space = IFACEQ_QUEUE_SIZE - (write_idx -  read_idx);
+	if (empty_space < packet_size)
+		return -ENOSPC;
+
+	queue->tx_req =  0;
+
+	new_write_idx = write_idx + packet_size;
+	write_ptr = (u32 *)((u8 *)qinfo->kernel_vaddr + write_idx);
+
+	if (write_ptr < (u32 *)qinfo->kernel_vaddr ||
+	    write_ptr > (u32 *)(qinfo->kernel_vaddr +
+	    IFACEQ_QUEUE_SIZE))
+		return -EINVAL;
+
+	if (new_write_idx < IFACEQ_QUEUE_SIZE) {
+		memcpy(write_ptr, packet, packet_size);
+	} else {
+		residue = new_write_idx - IFACEQ_QUEUE_SIZE;
+		memcpy(write_ptr, packet, (packet_size - residue));
+		memcpy(qinfo->kernel_vaddr,
+		       packet + (packet_size - residue), residue);
+		new_write_idx = residue;
+	}
+
+	/* Make sure packet is written before updating the write index */
+	mb();
+	queue->write_idx = new_write_idx / sizeof(u32);
+
+	/* Make sure write index is updated before an interrupt is raised */
+	mb();
+
+	return 0;
+}
+
+static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
+{
+	u32 read_idx, write_idx, new_read_idx;
+	struct iris_hfi_queue_header *queue;
+	u32 packet_size, residue;
+	u32 receive_request = 0;
+	u32 *read_ptr;
+	int ret = 0;
+
+	queue = qinfo->qhdr;
+
+	if (queue->queue_type == IFACEQ_MSGQ_ID)
+		receive_request = 1;
+
+	read_idx = queue->read_idx * sizeof(u32);
+	write_idx = queue->write_idx * sizeof(u32);
+
+	if (read_idx == write_idx) {
+		queue->rx_req = receive_request;
+		/* Ensure qhdr is updated in main memory */
+		mb();
+		return -ENODATA;
+	}
+
+	read_ptr = qinfo->kernel_vaddr + read_idx;
+	if (read_ptr < (u32 *)qinfo->kernel_vaddr ||
+	    read_ptr > (u32 *)(qinfo->kernel_vaddr +
+	    IFACEQ_QUEUE_SIZE - sizeof(*read_ptr)))
+		return -ENODATA;
+
+	packet_size = *read_ptr;
+	if (!packet_size)
+		return -EINVAL;
+
+	new_read_idx = read_idx + packet_size;
+	if (packet_size <= IFACEQ_CORE_PKT_SIZE) {
+		if (new_read_idx < IFACEQ_QUEUE_SIZE) {
+			memcpy(packet, read_ptr, packet_size);
+		} else {
+			residue = new_read_idx - IFACEQ_QUEUE_SIZE;
+			memcpy(packet, read_ptr, (packet_size - residue));
+			memcpy((packet + (packet_size - residue)),
+			       qinfo->kernel_vaddr, residue);
+			new_read_idx = residue;
+		}
+	} else {
+		new_read_idx = write_idx;
+		ret = -EBADMSG;
+	}
+
+	queue->rx_req = receive_request;
+
+	queue->read_idx = new_read_idx / sizeof(u32);
+	/* Ensure qhdr is updated in main memory */
+	mb();
+
+	return ret;
+}
+
+int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_size)
+{
+	struct iris_iface_q_info *q_info;
+
+	if (!mutex_is_locked(&core->lock))
+		return -EINVAL;
+
+	if (core->state != IRIS_CORE_INIT)
+		return -EINVAL;
+
+	q_info = &core->command_queue;
+	if (!q_info || !q_info->kernel_vaddr || !pkt) {
+		dev_err(core->dev, "cannot write to shared command queue\n");
+		return -ENODATA;
+	}
+
+	if (!iris_hfi_queue_write(q_info, pkt, pkt_size)) {
+		iris_vpu_raise_interrupt(core);
+	} else {
+		dev_err(core->dev, "queue full\n");
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
+int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
+{
+	int ret;
+
+	mutex_lock(&core->lock);
+	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);
+	if (ret)
+		dev_err(core->dev, "iris_hfi_queue_cmd_write_locked failed with %d\n", ret);
+
+	mutex_unlock(&core->lock);
+
+	return ret;
+}
+
+int iris_hfi_queue_msg_read(struct iris_core *core, void *pkt)
+{
+	struct iris_iface_q_info *q_info;
+	int ret = 0;
+
+	mutex_lock(&core->lock);
+	if (core->state != IRIS_CORE_INIT) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	q_info = &core->message_queue;
+	if (iris_hfi_queue_read(q_info, pkt)) {
+		ret = -ENODATA;
+		goto unlock;
+	}
+
+unlock:
+	mutex_unlock(&core->lock);
+
+	return ret;
+}
+
+int iris_hfi_queue_dbg_read(struct iris_core *core, void *pkt)
+{
+	struct iris_iface_q_info *q_info;
+	int ret = 0;
+
+	mutex_lock(&core->lock);
+	if (core->state != IRIS_CORE_INIT) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	q_info = &core->debug_queue;
+	if (!q_info || !q_info->kernel_vaddr || !pkt) {
+		dev_err(core->dev, "cannot read from shared debug queue\n");
+		ret = -ENODATA;
+		goto unlock;
+	}
+
+	if (iris_hfi_queue_read(q_info, pkt)) {
+		ret = -ENODATA;
+		goto unlock;
+	}
+
+unlock:
+	mutex_unlock(&core->lock);
+
+	return ret;
+}
 
 static void iris_hfi_queue_set_header(struct iris_core *core, u32 queue_id,
 				      struct iris_iface_q_info *iface_q)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.h b/drivers/media/platform/qcom/iris/iris_hfi_queue.h
index 54994bb776f1..1b728ebddd1d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.h
@@ -172,4 +172,9 @@ struct iris_iface_q_info {
 int iris_hfi_queues_init(struct iris_core *core);
 void iris_hfi_queues_deinit(struct iris_core *core);
 
+int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_size);
+int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size);
+int iris_hfi_queue_msg_read(struct iris_core *core, void *pkt);
+int iris_hfi_queue_dbg_read(struct iris_core *core, void *pkt);
+
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 47fdebd8135c..4577977f9f8c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -7,6 +7,7 @@
 #define _IRIS_PLATFORM_COMMON_H_
 
 #define IRIS_PAS_ID				9
+#define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
 
 extern struct iris_platform_data sm8550_data;
 extern struct iris_platform_data sm8250_data;
@@ -29,7 +30,19 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
+struct ubwc_config_data {
+	u32	max_channels;
+	u32	mal_length;
+	u32	highest_bank_bit;
+	u32	bank_swzl_level;
+	u32	bank_swz2_level;
+	u32	bank_swz3_level;
+	u32	bank_spreading;
+};
+
 struct iris_platform_data {
+	void (*init_hfi_command_ops)(struct iris_core *core);
+	void (*init_hfi_response_ops)(struct iris_core *core);
 	struct iris_inst *(*get_instance)(void);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
@@ -46,6 +59,8 @@ struct iris_platform_data {
 	u32 pas_id;
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
+	u32 hw_response_timeout;
+	struct ubwc_config_data *ubwc_config;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 36bcb1b851ed..b83665a9c5a2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -34,6 +34,8 @@ static struct tz_cp_config tz_cp_config_sm8250 = {
 
 struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
+	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -48,4 +50,5 @@ struct iris_platform_data sm8250_data = {
 	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.tz_cp_config_data = &tz_cp_config_sm8250,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index a559e095fefc..91bfc0fa0989 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -27,6 +27,16 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
+static struct ubwc_config_data ubwc_config_sm8550 = {
+	.max_channels = 8,
+	.mal_length = 32,
+	.highest_bank_bit = 16,
+	.bank_swzl_level = 0,
+	.bank_swz2_level = 1,
+	.bank_swz3_level = 1,
+	.bank_spreading = 1,
+};
+
 static struct tz_cp_config tz_cp_config_sm8550 = {
 	.cp_start = 0,
 	.cp_size = 0x25800000,
@@ -36,6 +46,8 @@ static struct tz_cp_config tz_cp_config_sm8550 = {
 
 struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -51,4 +63,6 @@ struct iris_platform_data sm8550_data = {
 	.pas_id = IRIS_PAS_ID,
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 64bac287d3a8..ecf1a50be63b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -8,6 +8,21 @@
 #include "iris_core.h"
 #include "iris_vidc.h"
 
+static inline int iris_init_isr(struct iris_core *core)
+{
+	int ret;
+
+	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
+					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
+	if (ret) {
+		dev_err(core->dev, "failed to allocate irq\n");
+		return ret;
+	}
+	disable_irq_nosync(core->irq);
+
+	return ret;
+}
+
 static int iris_register_video_device(struct iris_core *core)
 {
 	struct video_device *vdev;
@@ -57,6 +72,15 @@ static void iris_remove(struct platform_device *pdev)
 	core->state = IRIS_CORE_DEINIT;
 }
 
+static void iris_sys_error_handler(struct work_struct *work)
+{
+	struct iris_core *core =
+			container_of(work, struct iris_core, sys_error_handler.work);
+
+	iris_core_deinit(core);
+	iris_core_init(core);
+}
+
 static int iris_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -71,6 +95,13 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->state = IRIS_CORE_DEINIT;
 	mutex_init(&core->lock);
+	init_completion(&core->core_init_done);
+
+	core->response_packet = devm_kzalloc(core->dev, IFACEQ_CORE_PKT_SIZE, GFP_KERNEL);
+	if (!core->response_packet)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&core->sys_error_handler, iris_sys_error_handler);
 
 	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(core->reg_base))
@@ -80,6 +111,12 @@ static int iris_probe(struct platform_device *pdev)
 	if (core->irq < 0)
 		return core->irq;
 
+	ret = iris_init_isr(core);
+	if (ret) {
+		dev_err_probe(core->dev, ret, "Failed to init isr\n");
+		return ret;
+	}
+
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 	if (!core->iris_platform_data) {
 		ret = -ENODEV;
@@ -88,6 +125,9 @@ static int iris_probe(struct platform_device *pdev)
 	}
 
 	iris_init_ops(core);
+	core->iris_platform_data->init_hfi_command_ops(core);
+	core->iris_platform_data->init_hfi_response_ops(core);
+
 	ret = iris_init_resources(core);
 	if (ret) {
 		dev_err_probe(core->dev, ret, "init resource failed\n");
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
new file mode 100644
index 000000000000..043aa0ee80b6
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_state.h"
+
+void iris_change_core_state(struct iris_core *core,
+			    enum iris_core_state request_state)
+{
+	mutex_lock(&core->lock);
+	core->state = request_state;
+	mutex_unlock(&core->lock);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index a0bfee98578a..8bf22f839311 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -6,6 +6,8 @@
 #ifndef _IRIS_STATE_H_
 #define _IRIS_STATE_H_
 
+struct iris_core;
+
 /**
  * enum iris_core_state
  *
@@ -38,4 +40,6 @@ enum iris_core_state {
 	IRIS_CORE_ERROR,
 };
 
+void iris_change_core_state(struct iris_core *core,
+			    enum iris_core_state request_state);
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index df87b1b719a9..5930cf105a87 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -11,6 +11,9 @@
 #define CPU_BASE_OFFS				0x000A0000
 
 #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
+#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
+
+#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
 
 #define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
 #define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
@@ -27,6 +30,15 @@
 #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
 #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
 
+#define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
+#define CPU_IC_SOFTINT_H2A_SHFT			0x0
+
+#define WRAPPER_BASE_OFFS			0x000B0000
+#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		0x8
+#define WRAPPER_INTR_STATUS_A2H_BMSK		0x4
+#define CTRL_INIT_IDLE_MSG_BMSK			0x40000000
+
 static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 {
 	u32 queue_size, value;
@@ -85,3 +97,33 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 
 	return 0;
 }
+
+void iris_vpu_raise_interrupt(struct iris_core *core)
+{
+	writel(1 << CPU_IC_SOFTINT_H2A_SHFT, core->reg_base + CPU_IC_SOFTINT);
+}
+
+void iris_vpu_clear_interrupt(struct iris_core *core)
+{
+	u32 intr_status = 0, mask = 0;
+
+	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
+		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+		CTRL_INIT_IDLE_MSG_BMSK);
+
+	if (intr_status & mask)
+		core->intr_status |= intr_status;
+
+	writel(1, core->reg_base + CPU_CS_A2HSOFTINTCLR);
+}
+
+int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
+{
+	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+		dev_err(core->dev, "received interrupt\n");
+		return -ETIME;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index d9b8df6e3f80..706b207bc295 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -9,5 +9,8 @@
 struct iris_core;
 
 int iris_vpu_boot_firmware(struct iris_core *core);
+void iris_vpu_raise_interrupt(struct iris_core *core);
+void iris_vpu_clear_interrupt(struct iris_core *core);
+int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 
 #endif

-- 
2.34.1



