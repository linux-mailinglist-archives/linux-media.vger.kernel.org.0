Return-Path: <linux-media+bounces-16889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3E49606CC
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17AC4288A8B
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124701A01C1;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWi1YW8m"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E772619DF8D;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753195; cv=none; b=Tnn+dtdJb8MuHVumXLrbDnIBINu2iZNiS3U0qsVrkahaOy/9RzQjh7rMYnlUFm844uFVy9hdXiRaZNAeGCfhpCpyGM1HMAPa7AdCM2tNqn/oR+TuOWoe5SYfhwggL55rqUpH7lfonACpdlCEJT1Atu+nSvSZKhqg5uvaD16Or+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753195; c=relaxed/simple;
	bh=OB5Rp6gsgfos2TFAJYV37NyV+/pYeOFg27UfU7DNr5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eakGtUKOEYGJxjtJIAgij3UWogL3ykqrVG0ub3wYroy7i5Ykg95BYd+buZ4sm8F8SL9FAv5rR7pt+7Af8Dg85Lu/3XudZSjW9nV4Irv5ycF01bx1LrSxi5f5FUK7nZHHuUJ3VLfhcFGYB5qAnRisYybvmYxXjxn6/Cl7LIxiwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWi1YW8m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ADC2C4AF52;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753194;
	bh=OB5Rp6gsgfos2TFAJYV37NyV+/pYeOFg27UfU7DNr5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lWi1YW8mMEjuMLHwzlpBU9hUSv16q4Vmg1FkKv/jAfOZJ5I6EnFHlrxB3SP9e1taX
	 n0Fyo3HeEihwipw8tVNmb7ZCJYFGrvXtvt/R6m4chmf9E4vWZdyhHZGVHouVfF/MhT
	 S6uzjSSSL765msHGILrXTKqtgT/A+/7aliEW0i2I5d4KFBkylyWvRzIS/1m7hy1NOP
	 9gKCQ/yU6yCKk74IGUdxtP+3ipLwFc91oBD2+1NZfj7m80xqxw4yH8pmPs3Ux5r4Iz
	 q49zAy7zzweTKPNsXk7TfpVb6RPbX1SGIvpd6wacuZAZbw38aujseSf5jg11DUDjJP
	 YUxJvoqyzPlSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CBDC52D6F;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:31 +0530
Subject: [PATCH v3 06/29] media: iris: introduce iris core state management
 with shared queues
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-6-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=21630;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=LxcvU47s32KaX6LlNTKQBKpSaR+rju6FxEtyCqXceNg=;
 b=Q2ZXW0Xlc3tmvUgqNitIP4VQj74k5MHoRG489mOy/3wNqR/NMyhFioFQX8vu5lOJewCNXOkYb
 qYyvjV1nhCNC1lzYqUklh+nwaW4C48mLnmDH1NBlslEoNtohY7uSGXN
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Introduce core state management for iris driver with
necessary queues needed for host firmware communication.

There are 3 types of queues:
Command queue - driver to write any command to firmware.
Message queue - firmware to send any response to driver.
Debug queue - firmware to write debug messages.
Initialize and configire shared queues during probe.

Different states for core:
IRIS_CORE_DEINIT - default state.
IRIS_CORE_INIT - core state with core initialized. FW loaded and
HW brought out of reset, shared queues established between host
driver and firmware.
IRIS_CORE_ERROR - error state.
      -----------
           |
           V
       -----------
       | DEINIT  |
       -----------
           ^
          / \
         /   \
        /     \
       /       \
      v         v
 -----------   ----------.
 |  INIT  |-->|  ERROR  |
 -----------   ----------.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   4 +-
 drivers/media/platform/qcom/iris/iris_core.c       |  46 ++++++
 drivers/media/platform/qcom/iris/iris_core.h       |  23 +++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 126 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_queue.h  | 175 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |   1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |   1 +
 drivers/media/platform/qcom/iris/iris_probe.c      |  20 +++
 drivers/media/platform/qcom/iris/iris_state.h      |  41 +++++
 drivers/media/platform/qcom/iris/iris_vidc.c       |   6 +
 11 files changed, 443 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index dcc393a3780a..48d54e53a576 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,5 +1,7 @@
-iris-objs += iris_hfi_gen1_command.o \
+iris-objs += iris_core.o \
+             iris_hfi_gen1_command.o \
              iris_hfi_gen2_command.o \
+             iris_hfi_queue.o \
              iris_platform_sm8250.o \
              iris_platform_sm8550.o \
              iris_probe.o \
diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
new file mode 100644
index 000000000000..360a54909ef6
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_state.h"
+
+void iris_core_deinit(struct iris_core *core)
+{
+	mutex_lock(&core->lock);
+	iris_hfi_queues_deinit(core);
+	core->state = IRIS_CORE_DEINIT;
+	mutex_unlock(&core->lock);
+}
+
+int iris_core_init(struct iris_core *core)
+{
+	int ret;
+
+	mutex_lock(&core->lock);
+	if (core->state == IRIS_CORE_INIT) {
+		ret = 0;
+		goto exit;
+	} else if (core->state == IRIS_CORE_ERROR) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	core->state = IRIS_CORE_INIT;
+
+	ret = iris_hfi_queues_init(core);
+	if (ret)
+		goto error;
+
+	mutex_unlock(&core->lock);
+
+	return 0;
+
+error:
+	core->state = IRIS_CORE_DEINIT;
+exit:
+	mutex_unlock(&core->lock);
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 14489bd4474c..13c5932f9110 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -9,8 +9,10 @@
 #include <linux/types.h>
 #include <media/v4l2-device.h>
 
+#include "iris_hfi_queue.h"
 #include "iris_platform_common.h"
 #include "iris_resources.h"
+#include "iris_state.h"
 
 /**
  * struct iris_core - holds core parameters valid for all instances
@@ -29,6 +31,15 @@
  * @clk_count: count of iris clocks
  * @resets: table of iris reset clocks
  * @iris_platform_data: a structure for platform data
+ * @state: current state of core
+ * @iface_q_table_daddr: device address for interface queue table memory
+ * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
+ * @iface_q_table_vaddr: virtual address for interface queue table memory
+ * @sfr_vaddr: virtual address for SFR (Sub System Failure Reason) register memory
+ * @command_queue: shared interface queue to send commands to firmware
+ * @message_queue: shared interface queue to receive responses from firmware
+ * @debug_queue: shared interface queue to receive debug info from firmware
+ * @lock: a lock for this strucure
  */
 
 struct iris_core {
@@ -46,6 +57,18 @@ struct iris_core {
 	u32					clk_count;
 	struct reset_control_bulk_data		*resets;
 	const struct iris_platform_data		*iris_platform_data;
+	enum iris_core_state			state;
+	dma_addr_t				iface_q_table_daddr;
+	dma_addr_t				sfr_daddr;
+	void					*iface_q_table_vaddr;
+	void					*sfr_vaddr;
+	struct iris_iface_q_info		command_queue;
+	struct iris_iface_q_info		message_queue;
+	struct iris_iface_q_info		debug_queue;
+	struct mutex				lock; /* lock for core related operations */
 };
 
+int iris_core_init(struct iris_core *core);
+void iris_core_deinit(struct iris_core *core);
+
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
new file mode 100644
index 000000000000..11938880b8cd
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_hfi_queue.h"
+
+static void iris_hfi_queue_set_header(struct iris_core *core, u32 queue_id,
+				      struct iris_iface_q_info *iface_q)
+{
+	iface_q->qhdr->status = 0x1;
+	iface_q->qhdr->start_addr = iface_q->device_addr;
+	iface_q->qhdr->header_type = IFACEQ_DFLT_QHDR;
+	iface_q->qhdr->queue_type = queue_id;
+	iface_q->qhdr->q_size = IFACEQ_QUEUE_SIZE / sizeof(u32);
+	iface_q->qhdr->pkt_size = 0; /* variable packet size */
+	iface_q->qhdr->rx_wm = 0x1;
+	iface_q->qhdr->tx_wm = 0x1;
+	iface_q->qhdr->rx_req = 0x1;
+	iface_q->qhdr->tx_req = 0x0;
+	iface_q->qhdr->rx_irq_status = 0x0;
+	iface_q->qhdr->tx_irq_status = 0x0;
+	iface_q->qhdr->read_idx = 0x0;
+	iface_q->qhdr->write_idx = 0x0;
+
+	/*
+	 * Set receive request to zero on debug queue as there is no
+	 * need of interrupt from video hardware for debug messages
+	 */
+	if (queue_id == IFACEQ_DBGQ_ID)
+		iface_q->qhdr->rx_req = 0;
+}
+
+static void
+iris_hfi_queue_init(struct iris_core *core, u32 queue_id, struct iris_iface_q_info *iface_q)
+{
+	struct iris_hfi_queue_table_header *q_tbl_hdr;
+	unsigned int offset = 0;
+
+	q_tbl_hdr = core->iface_q_table_vaddr;
+
+	offset = sizeof(*q_tbl_hdr) + (queue_id * IFACEQ_QUEUE_SIZE);
+	iface_q->device_addr = core->iface_q_table_daddr + offset;
+	iface_q->kernel_vaddr =
+			(void *)((char *)core->iface_q_table_vaddr + offset);
+	iface_q->qhdr = &q_tbl_hdr->q_hdr[queue_id];
+
+	iris_hfi_queue_set_header(core, queue_id, iface_q);
+}
+
+static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
+{
+	iface_q->qhdr = NULL;
+	iface_q->kernel_vaddr = NULL;
+	iface_q->device_addr = 0;
+}
+
+int iris_hfi_queues_init(struct iris_core *core)
+{
+	struct iris_hfi_queue_table_header *q_tbl_hdr;
+	u32 queue_size;
+
+	/* Iris hardware requires 4K queue alignment */
+	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
+	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
+						    &core->iface_q_table_daddr,
+						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
+	if (!core->iface_q_table_vaddr) {
+		dev_err(core->dev, "queues alloc and map failed\n");
+		return -ENOMEM;
+	}
+
+	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
+					  &core->sfr_daddr,
+					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
+	if (!core->sfr_vaddr) {
+		dev_err(core->dev, "sfr alloc and map failed\n");
+		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
+			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
+		return -ENOMEM;
+	}
+
+	iris_hfi_queue_init(core, IFACEQ_CMDQ_ID, &core->command_queue);
+	iris_hfi_queue_init(core, IFACEQ_MSGQ_ID, &core->message_queue);
+	iris_hfi_queue_init(core, IFACEQ_DBGQ_ID, &core->debug_queue);
+
+	q_tbl_hdr = (struct iris_hfi_queue_table_header *)core->iface_q_table_vaddr;
+	q_tbl_hdr->version = 0;
+	q_tbl_hdr->device_addr = (void *)core;
+	strscpy(q_tbl_hdr->name, "iris-hfi-queues", sizeof(q_tbl_hdr->name));
+	q_tbl_hdr->size = sizeof(*q_tbl_hdr);
+	q_tbl_hdr->qhdr0_offset = sizeof(*q_tbl_hdr) -
+		(IFACEQ_NUMQ * sizeof(struct iris_hfi_queue_header));
+	q_tbl_hdr->qhdr_size = sizeof(q_tbl_hdr->q_hdr[0]);
+	q_tbl_hdr->num_q = IFACEQ_NUMQ;
+	q_tbl_hdr->num_active_q = IFACEQ_NUMQ;
+
+	 /* Write sfr size in first word to be used by firmware */
+	*((u32 *)core->sfr_vaddr) = SFR_SIZE;
+
+	return 0;
+}
+
+void iris_hfi_queues_deinit(struct iris_core *core)
+{
+	if (!core->iface_q_table_vaddr)
+		return;
+
+	iris_hfi_queue_deinit(&core->debug_queue);
+	iris_hfi_queue_deinit(&core->message_queue);
+	iris_hfi_queue_deinit(&core->command_queue);
+
+	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
+		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
+
+	core->sfr_vaddr = NULL;
+	core->sfr_daddr = 0;
+
+	dma_free_attrs(core->dev, sizeof(struct iris_hfi_queue_table_header),
+		       core->iface_q_table_vaddr, core->iface_q_table_daddr,
+		       DMA_ATTR_WRITE_COMBINE);
+
+	core->iface_q_table_vaddr = NULL;
+	core->iface_q_table_daddr = 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.h b/drivers/media/platform/qcom/iris/iris_hfi_queue.h
new file mode 100644
index 000000000000..54994bb776f1
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.h
@@ -0,0 +1,175 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_HFI_QUEUE_H_
+#define _IRIS_HFI_QUEUE_H_
+
+struct iris_core;
+
+/*
+ * Maximum number of buffers which queue can hold until
+ * hardware stops responding and driver times out.
+ */
+#define IFACEQ_MAX_BUF_COUNT		50
+/*
+ * Max session supported are 16.
+ * this value is used to calcualte the size of
+ * individual shared queue.
+ */
+#define IFACE_MAX_PARALLEL_SESSIONS	16
+#define IFACEQ_DFLT_QHDR		0x0101
+#define IFACEQ_MAX_PKT_SIZE		1024 /* Maximum size of a packet in the queue */
+
+/*
+ * SFR: Subsystem Failure Reason
+ * when hardware goes into bad state/failure, firmware fills this memory
+ * and driver will get to know the actual failure reason from this SFR buffer.
+ */
+#define SFR_SIZE			SZ_4K /* Iris hardware requires 4K queue alignment */
+
+#define IFACEQ_QUEUE_SIZE		(IFACEQ_MAX_PKT_SIZE * \
+					 IFACEQ_MAX_BUF_COUNT * IFACE_MAX_PARALLEL_SESSIONS)
+
+/*
+ * Memory layout of the shared queues:
+ *
+ *   ||=================||  ^        ^         ^
+ *   ||                 ||  |        |         |
+ *   ||    Queue Table  || 288 Bytes |         |
+ *   ||      Header     ||  |        |         |
+ *   ||                 ||  |        |         |
+ *   ||-----------------||  V        |         |
+ *   ||-----------------||  ^        |         |
+ *   ||                 ||  |        |         |
+ *   ||  Command Queue  || 56 Bytes  |         |
+ *   ||     Header      ||  |        |         |
+ *   ||                 ||  |        |         |
+ *   ||-----------------||  V       456 Bytes  |
+ *   ||-----------------||  ^        |         |
+ *   ||                 ||  |        |         |
+ *   ||  Message Queue  || 56 Bytes  |         |
+ *   ||     Header      ||  |        |         |
+ *   ||                 ||  |        |         |
+ *   ||-----------------||  V        |         Buffer size aligned to 4k
+ *   ||-----------------||  ^        |         Overall Queue Size = 2,404 KB
+ *   ||                 ||  |        |         |
+ *   ||   Debug Queue   || 56 Bytes  |         |
+ *   ||     Header      ||  |        |         |
+ *   ||                 ||  |        |         |
+ *   ||=================||  V        V         |
+ *   ||=================||           ^         |
+ *   ||                 ||           |         |
+ *   ||     Command     ||         800 KB      |
+ *   ||      Queue      ||           |         |
+ *   ||                 ||           |         |
+ *   ||=================||           V         |
+ *   ||=================||           ^         |
+ *   ||                 ||           |         |
+ *   ||     Message     ||         800 KB      |
+ *   ||      Queue      ||           |         |
+ *   ||                 ||           |         |
+ *   ||=================||           V         |
+ *   ||=================||           ^         |
+ *   ||                 ||           |         |
+ *   ||      Debug      ||         800 KB      |
+ *   ||      Queue      ||           |         |
+ *   ||                 ||           |         |
+ *   ||=================||           V         |
+ *   ||                 ||                     |
+ *   ||=================||                     V
+ */
+
+/*
+ * Shared queues are used for communication between driver and firmware.
+ * There are 3 types of queues:
+ * Command queue - driver to write any command to firmware.
+ * Message queue - firmware to send any response to driver.
+ * Debug queue - firmware to write debug message.
+ */
+
+/* Host-firmware shared queue ids */
+enum iris_iface_queue {
+	IFACEQ_CMDQ_ID,
+	IFACEQ_MSGQ_ID,
+	IFACEQ_DBGQ_ID,
+	IFACEQ_NUMQ, /* not an index */
+};
+
+/**
+ * struct iris_hfi_queue_header
+ *
+ * @status: Queue status, qhdr_state define possible status
+ * @start_addr: Queue start address in non cached memory
+ * @type: qhdr_tx, qhdr_rx, qhdr_q_id and priority defines qhdr type
+ * @q_size: Queue size
+ *		Number of queue packets if pkt_size is non-zero
+ *		Queue size in bytes if pkt_size is zero
+ * @pkt_size: Size of queue packet entries
+ *		0x0: variable queue packet size
+ *		non zero: size of queue packet entry, fixed
+ * @pkt_drop_cnt: Number of packets dropped by sender
+ * @rx_wm: Receiver watermark, applicable in event driven mode
+ * @tx_wm: Sender watermark, applicable in event driven mode
+ * @rx_req: Receiver sets this bit if queue is empty
+ * @tx_req: Sender sets this bit if queue is full
+ * @rx_irq_status: Receiver sets this bit and triggers an interrupt to
+ *		the sender after packets are dequeued. Sender clears this bit
+ * @tx_irq_status: Sender sets this bit and triggers an interrupt to
+ *		the receiver after packets are queued. Receiver clears this bit
+ * @read_idx: Index till where receiver has consumed the packets from the queue.
+ * @write_idx: Index till where sender has written the packets into the queue.
+ */
+struct iris_hfi_queue_header {
+	u32 status;
+	u32 start_addr;
+	u16 queue_type;
+	u16 header_type;
+	u32 q_size;
+	u32 pkt_size;
+	u32 pkt_drop_cnt;
+	u32 rx_wm;
+	u32 tx_wm;
+	u32 rx_req;
+	u32 tx_req;
+	u32 rx_irq_status;
+	u32 tx_irq_status;
+	u32 read_idx;
+	u32 write_idx;
+};
+
+/**
+ * struct iris_hfi_queue_table_header
+ *
+ * @version: Queue table version number
+ * @size: Queue table size from version to last parametr in qhdr entry
+ * @qhdr0_offset: Offset to the start of first qhdr
+ * @qhdr_size: Queue header size in bytes
+ * @num_q: Total number of queues in Queue table
+ * @num_active_q: Total number of active queues
+ * @device_addr: Device address of the queue
+ * @name: Queue name in characters
+ */
+struct iris_hfi_queue_table_header {
+	u32 version;
+	u32 size;
+	u32 qhdr0_offset;
+	u32 qhdr_size;
+	u32 num_q;
+	u32 num_active_q;
+	void *device_addr;
+	char name[256]; /* NUL-terminated array of characters */
+	struct iris_hfi_queue_header q_hdr[IFACEQ_NUMQ];
+};
+
+struct iris_iface_q_info {
+	struct iris_hfi_queue_header *qhdr;
+	dma_addr_t	device_addr;
+	void		*kernel_vaddr;
+};
+
+int iris_hfi_queues_init(struct iris_core *core);
+void iris_hfi_queues_deinit(struct iris_core *core);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index daa6a74b376f..5287fdf913bc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -32,6 +32,7 @@ struct iris_platform_data {
 	unsigned int clk_tbl_size;
 	const char * const *clk_rst_tbl;
 	unsigned int clk_rst_tbl_size;
+	u64 dma_mask;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 5d4211a93bc1..664cb2b359a3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -37,4 +37,5 @@ struct iris_platform_data sm8250_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
 	.clk_tbl = sm8250_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
+	.dma_mask = GENMASK(31, 29) - 1,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index e0a3a162c55f..0db832b099ac 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -37,4 +37,5 @@ struct iris_platform_data sm8550_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8550_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.dma_mask = GENMASK(31, 29) - 1,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index fdf9f12c7728..64bac287d3a8 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -47,15 +47,21 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
+	iris_core_deinit(core);
+
 	video_unregister_device(core->vdev_dec);
 
 	v4l2_device_unregister(&core->v4l2_dev);
+
+	mutex_destroy(&core->lock);
+	core->state = IRIS_CORE_DEINIT;
 }
 
 static int iris_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct iris_core *core;
+	u64 dma_mask;
 	int ret;
 
 	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
@@ -63,6 +69,9 @@ static int iris_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	core->dev = dev;
 
+	core->state = IRIS_CORE_DEINIT;
+	mutex_init(&core->lock);
+
 	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(core->reg_base))
 		return PTR_ERR(core->reg_base);
@@ -95,8 +104,19 @@ static int iris_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
+	dma_mask = core->iris_platform_data->dma_mask;
+
+	ret = dma_set_mask_and_coherent(dev, dma_mask);
+	if (ret)
+		goto err_vdev_unreg;
+
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(64));
+
 	return 0;
 
+err_vdev_unreg:
+	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
 
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
new file mode 100644
index 000000000000..a0bfee98578a
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_STATE_H_
+#define _IRIS_STATE_H_
+
+/**
+ * enum iris_core_state
+ *
+ * IRIS_CORE_DEINIT: default state.
+ * IRIS_CORE_INIT:   core state with core initialized. FW loaded and
+ *                   HW brought out of reset, shared queues established
+ *                   between host driver and firmware.
+ * IRIS_CORE_ERROR:  error state.
+ *
+ *        -----------
+ *             |
+ *             V
+ *        -----------
+ *   +--->| DEINIT  |<---+
+ *   |   -----------    |
+ *   |         |        |
+ *   |         v        |
+ *   |   -----------    |
+ *   |     /     \      |
+ *   |    /       \     |
+ *   |   /         \    |
+ *   |  v           v   v
+ * -----------    -----------
+ * |  INIT  |--->|  ERROR  |
+ * -----------    -----------
+ */
+enum iris_core_state {
+	IRIS_CORE_DEINIT,
+	IRIS_CORE_INIT,
+	IRIS_CORE_ERROR,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 24a6d744deaf..a5c4e73ae531 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -96,6 +96,12 @@ int iris_open(struct file *filp)
 	struct iris_inst *inst = NULL;
 	int ret;
 
+	ret = iris_core_init(core);
+	if (ret) {
+		dev_err(core->dev, "core init failed\n");
+		return ret;
+	}
+
 	inst = core->iris_platform_data->get_instance();
 	if (!inst)
 		return -ENOMEM;

-- 
2.34.1



