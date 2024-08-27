Return-Path: <linux-media+bounces-16895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C93679606E1
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCD3D1F21E27
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3A11A08DB;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIHdIq8U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67519EED0;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753195; cv=none; b=RP7JgrRfWQE02ufGiotvAQROHcL9kU6Dj95K8yHo4BGXy/p5idCLGqE5b4EbqMYot+ldOw98DDUq3ZqUfznjT/zbZkvKqL0vdcpmGc9lRgGm+yzJTwMN2EdgzNnWkNIKtomP+GdoEOyyKpS8gC4vP1i1cIxhCzOLk4A/iz16+Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753195; c=relaxed/simple;
	bh=I3tGXkypHF3ecnXstUY12fVCBQjs+Lk5cPvYfleTxXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L34LQfm0KSgbSbUCOEpN1K7XtoEz8i+5MAF3K6AycBlC6frk7NDRMCi6YoODmE9tcHA8/qFrwDtsBFnRejSeHNL1GwKHJfOciJYeGNoWbZtudpvoH6va2LG7jsIWivYwOP86YPDTmVTECPWfOx0rY9Fiz4hUsHGF6bmdL6IpSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIHdIq8U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35F77C4AF1C;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753195;
	bh=I3tGXkypHF3ecnXstUY12fVCBQjs+Lk5cPvYfleTxXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GIHdIq8UD9rw9PKuUTTYXD3dHCplGQXTFDF3DM1JX1Rlo6x0mfMTlOaKLWPIVR2Pd
	 QT3c6bMJXTJyUYRCbBUyAHWq8QhgCS88fQ06Z5D67N+5fE9chulT/7wa2rUWe69j1G
	 jc7C/BnHDNNw35p+wyUbClrp0zZfZjZxs+iWR6YpoeIcNX2SqAtySjvHvDcfoMzhNl
	 8l2H5m9FGWCDej256UAcKm2N794tmeXwDk5fdZ/w1i7McHw9UBZBcDaTrokf/mC0WP
	 nmKNMHlm/f7ghSz1hBUemBjG52o+N+h7qmPmIwxkqqNoF2DqNSl4SLGQaQNWgZ9rDf
	 zma7hxWpZeL9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D9EC5472E;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:36 +0530
Subject: [PATCH v3 11/29] media: iris: implement reqbuf ioctl with
 vb2_queue_setup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-11-c5fdbbe65e70@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=54899;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=uPHnVUh9Ex5xFZOzbNSn7IEqjN2FgJkyoFzRZWdb7CI=;
 b=+v9gmY6aHgl7F0kBHRzuE9SbySLtxTa4amai1Nw+z57L768U9gugMKzrkHCCHlkF9fYJSCq0k
 puobzfbD2mGCDTvoC4Jv8FOIMcFeaA1X+MlU36sx3mK4129hl8zbDzP
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Implement reqbuf IOCTL op and vb2_queue_setup vb2 op
in the driver with necessary hooks.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   7 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     | 115 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     | 107 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_core.h       |   6 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  40 +++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  47 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  88 ++++++++++++++--
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 106 +++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  34 ++++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  39 +++++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   7 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 109 ++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_instance.h   |  22 ++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |   1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |   1 +
 drivers/media/platform/qcom/iris/iris_probe.c      |   2 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  55 ++++++++++
 drivers/media/platform/qcom/iris/iris_utils.h      |  38 +++++++
 drivers/media/platform/qcom/iris/iris_vb2.c        |  92 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vb2.h        |  12 +++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  58 +++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h       |  14 +++
 drivers/media/platform/qcom/iris/iris_vidc.c       |  92 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  19 ++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  15 +++
 28 files changed, 1124 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index b0447af45891..9c50e29db41e 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,4 +1,5 @@
-iris-objs += iris_core.o \
+iris-objs += iris_buffer.o \
+             iris_core.o \
              iris_firmware.o \
              iris_hfi_common.o \
              iris_hfi_gen1_command.o \
@@ -13,9 +14,13 @@ iris-objs += iris_core.o \
              iris_probe.o \
              iris_resources.o \
              iris_state.o \
+             iris_utils.o \
              iris_vidc.o \
+             iris_vb2.o \
+             iris_vdec.o \
              iris_vpu2.o \
              iris_vpu3.o \
+             iris_vpu_buffer.o \
              iris_vpu_common.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
new file mode 100644
index 000000000000..a1017ceede7d
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <media/v4l2-mem2mem.h>
+
+#include "iris_buffer.h"
+#include "iris_instance.h"
+
+#define PIXELS_4K 4096
+#define MAX_WIDTH 4096
+#define MAX_HEIGHT 2304
+#define NUM_MBS_4K (DIV_ROUND_UP(MAX_WIDTH, 16) * DIV_ROUND_UP(MAX_HEIGHT, 16))
+#define BASE_RES_MB_MAX 138240
+
+/*
+ * NV12:
+ * YUV 4:2:0 image with a plane of 8 bit Y samples followed
+ * by an interleaved U/V plane containing 8 bit 2x2 subsampled
+ * colour difference samples.
+ *
+ * <-------- Y/UV_Stride -------->
+ * <------- Width ------->
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          y_scanlines
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              V
+ * U V U V U V U V U V U V . . . .  ^
+ * U V U V U V U V U V U V . . . .  |
+ * U V U V U V U V U V U V . . . .  |
+ * U V U V U V U V U V U V . . . .  uv_scanlines
+ * . . . . . . . . . . . . . . . .  |
+ * . . . . . . . . . . . . . . . .  V
+ * . . . . . . . . . . . . . . . .  --> Buffer size alignment
+ *
+ * y_stride : Width aligned to 128
+ * uv_stride : Width aligned to 128
+ * y_scanlines: Height aligned to 32
+ * uv_scanlines: Height/2 aligned to 16
+ * Total size = align((y_stride * y_scanlines
+ *          + uv_stride * uv_scanlines , 4096)
+ */
+static u32 iris_output_buffer_size_nv12(struct iris_inst *inst)
+{
+	u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
+	struct v4l2_format *f;
+
+	f = inst->fmt_dst;
+	y_stride = ALIGN(f->fmt.pix_mp.width, 128);
+	uv_stride = ALIGN(f->fmt.pix_mp.width, 128);
+	y_scanlines = ALIGN(f->fmt.pix_mp.height, 32);
+	uv_scanlines = ALIGN((f->fmt.pix_mp.height + 1) >> 1, 16);
+	y_plane = y_stride * y_scanlines;
+	uv_plane = uv_stride * uv_scanlines;
+
+	return ALIGN(y_plane + uv_plane, PIXELS_4K);
+}
+
+static u32 iris_input_buffer_size(struct iris_inst *inst)
+{
+	u32 base_res_mbs = NUM_MBS_4K;
+	u32 frame_size, num_mbs;
+	u32 div_factor;
+
+	num_mbs = iris_get_mbpf(inst);
+	if (num_mbs > NUM_MBS_4K) {
+		div_factor = 4;
+		base_res_mbs = BASE_RES_MB_MAX;
+	} else {
+		base_res_mbs = NUM_MBS_4K;
+		div_factor = 2;
+	}
+
+	/*
+	 * frame_size = YUVsize / div_factor
+	 * where YUVsize = resolution_in_MBs * MBs_in_pixel * 3 / 2
+	 */
+
+	frame_size = base_res_mbs * (16 * 16) * 3 / 2 / div_factor;
+
+	return ALIGN(frame_size, PIXELS_4K);
+}
+
+int iris_get_buffer_size(struct iris_inst *inst,
+			 enum iris_buffer_type buffer_type)
+{
+	switch (buffer_type) {
+	case BUF_INPUT:
+		return iris_input_buffer_size(inst);
+	case BUF_OUTPUT:
+		return iris_output_buffer_size_nv12(inst);
+	default:
+		return 0;
+	}
+}
+
+void iris_vb2_queue_error(struct iris_inst *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct vb2_queue *q;
+
+	q = v4l2_m2m_get_src_vq(m2m_ctx);
+	vb2_queue_error(q);
+	q = v4l2_m2m_get_dst_vq(m2m_ctx);
+	vb2_queue_error(q);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
new file mode 100644
index 000000000000..98844e89e0e3
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_BUFFER_H_
+#define _IRIS_BUFFER_H_
+
+#include <media/videobuf2-v4l2.h>
+
+struct iris_inst;
+
+#define to_iris_buffer(ptr)	container_of(ptr, struct iris_buffer, vb2)
+
+/**
+ * enum iris_buffer_type
+ *
+ * BUF_INPUT: input buffer to the iris hardware
+ * BUF_OUTPUT: output buffer from the iris hardware
+ * BUF_BIN: buffer to store intermediate bin data
+ * BUF_ARP: buffer for auto register programming
+ * BUF_COMV: buffer to store colocated motion vectors
+ * BUF_NON_COMV: buffer to hold config data for HW
+ * BUF_LINE: buffer to store decoding/encoding context data for HW
+ * BUF_DPB: buffer to store display picture buffers for reference
+ * BUF_PERSIST: buffer to store session context data
+ * BUF_SCRATCH_1: buffer to store decoding/encoding context data for HW
+ */
+enum iris_buffer_type {
+	BUF_INPUT = 1,
+	BUF_OUTPUT,
+	BUF_BIN,
+	BUF_ARP,
+	BUF_COMV,
+	BUF_NON_COMV,
+	BUF_LINE,
+	BUF_DPB,
+	BUF_PERSIST,
+	BUF_SCRATCH_1,
+	BUF_TYPE_MAX,
+};
+
+/*
+ * enum iris_buffer_attributes
+ *
+ * BUF_ATTR_DEFERRED: buffer queued by client but not submitted to firmware.
+ * BUF_ATTR_PENDING_RELEASE: buffers requested to be released from firmware.
+ * BUF_ATTR_QUEUED: buffers submitted to firmware.
+ * BUF_ATTR_DEQUEUED: buffers received from firmware.
+ * BUF_ATTR_BUFFER_DONE: buffers sent back to vb2.
+ */
+enum iris_buffer_attributes {
+	BUF_ATTR_DEFERRED		= BIT(0),
+	BUF_ATTR_PENDING_RELEASE	= BIT(1),
+	BUF_ATTR_QUEUED			= BIT(2),
+	BUF_ATTR_DEQUEUED		= BIT(3),
+	BUF_ATTR_BUFFER_DONE		= BIT(4),
+};
+
+/**
+ * struct iris_buffer
+ *
+ * @vb2: v4l2 vb2 buffer
+ * @list: list head for the iris_buffers structure
+ * @inst: iris instance structure
+ * @type: enum for type of iris buffer
+ * @index: identifier for the iris buffer
+ * @fd: file descriptor of the buffer
+ * @buffer_size: accessible buffer size in bytes starting from addr_offset
+ * @data_offset: accessible buffer offset from base address
+ * @data_size: data size in bytes
+ * @device_addr: device address of the buffer
+ * @kvaddr: kernel virtual address of the buffer
+ * @dma_attrs: dma attributes
+ * @flags: buffer flags. It is represented as bit masks.
+ * @timestamp: timestamp of the buffer in nano seconds (ns)
+ * @attr: enum for iris buffer attributes
+ */
+struct iris_buffer {
+	struct vb2_v4l2_buffer		vb2;
+	struct list_head		list;
+	struct iris_inst		*inst;
+	enum iris_buffer_type		type;
+	u32				index;
+	int				fd;
+	size_t				buffer_size;
+	u32				data_offset;
+	size_t				data_size;
+	dma_addr_t			device_addr;
+	void				*kvaddr;
+	unsigned long			dma_attrs;
+	u32				flags; /* V4L2_BUF_FLAG_* */
+	u64				timestamp;
+	enum iris_buffer_attributes	attr;
+};
+
+struct iris_buffers {
+	struct list_head	list;
+	u32			min_count;
+	u32			actual_count;
+	u32			size;
+};
+
+int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+void iris_vb2_queue_error(struct iris_inst *inst);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 09a6904c7bb1..1f6eca31928d 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -28,6 +28,8 @@
  * @v4l2_dev: a holder for v4l2 device structure
  * @vdev_dec: iris video device structure for decoder
  * @iris_v4l2_file_ops: iris v4l2 file ops
+ * @iris_v4l2_ioctl_ops: iris v4l2 ioctl ops
+ * @vb2_ops: iris vb2 ops
  * @icc_tbl: table of iris interconnects
  * @icc_count: count of iris interconnects
  * @pmdomain_tbl: table of iris power domains
@@ -55,6 +57,7 @@
  * @core_init_done: structure of signal completion for system response
  * @intr_status: interrupt status
  * @sys_error_handler: a delayed work for handling system fatal error
+ * @instances: a list_head of all instances
  */
 
 struct iris_core {
@@ -64,6 +67,8 @@ struct iris_core {
 	struct v4l2_device			v4l2_dev;
 	struct video_device			*vdev_dec;
 	const struct v4l2_file_operations	*iris_v4l2_file_ops;
+	const struct v4l2_ioctl_ops		*iris_v4l2_ioctl_ops;
+	const struct vb2_ops			*iris_vb2_ops;
 	struct icc_bulk_data			*icc_tbl;
 	u32					icc_count;
 	struct dev_pm_domain_list		*pmdomain_tbl;
@@ -91,6 +96,7 @@ struct iris_core {
 	struct completion			core_init_done;
 	u32					intr_status;
 	struct delayed_work			sys_error_handler;
+	struct list_head			instances;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index e050b1ae90fe..f59ce97d5b7e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <media/v4l2-device.h>
 
+struct iris_inst;
 struct iris_core;
 
 enum hfi_packet_port_type {
@@ -47,6 +48,8 @@ struct iris_hfi_command_ops {
 	int (*sys_image_version)(struct iris_core *core);
 	int (*sys_interframe_powercollapse)(struct iris_core *core);
 	int (*sys_pc_prep)(struct iris_core *core);
+	int (*session_open)(struct iris_inst *inst);
+	int (*session_close)(struct iris_inst *inst);
 };
 
 struct iris_hfi_response_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e778ae33b953..f8bd185bb68b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -66,11 +66,51 @@ static int iris_hfi_gen1_sys_pc_prep(struct iris_core *core)
 	return iris_hfi_queue_cmd_write_locked(core, &pkt, pkt.hdr.size);
 }
 
+static int iris_hfi_gen1_session_open(struct iris_inst *inst)
+{
+	struct hfi_session_open_pkt packet;
+	int ret;
+
+	packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
+	packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
+	packet.shdr.session_id = inst->session_id;
+	packet.session_domain = HFI_SESSION_TYPE_DEC;
+	packet.session_codec = HFI_VIDEO_CODEC_H264;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &packet, packet.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst);
+}
+
+static void iris_hfi_gen1_packet_session_cmd(struct iris_inst *inst,
+					     struct hfi_session_pkt *packet,
+					     u32 ptype)
+{
+	packet->shdr.hdr.size = sizeof(*packet);
+	packet->shdr.hdr.pkt_type = ptype;
+	packet->shdr.session_id = inst->session_id;
+}
+
+static int iris_hfi_gen1_session_close(struct iris_inst *inst)
+{
+	struct hfi_session_pkt packet;
+
+	iris_hfi_gen1_packet_session_cmd(inst, &packet, HFI_CMD_SYS_SESSION_END);
+
+	return iris_hfi_queue_cmd_write(inst->core, &packet, packet.shdr.hdr.size);
+}
+
 static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
 	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
+	.session_open = iris_hfi_gen1_session_open,
+	.session_close = iris_hfi_gen1_session_close,
 };
 
 void iris_hfi_gen1_command_ops_init(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 991d5a5dc792..da52e497b74a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -9,19 +9,34 @@
 #include <linux/types.h>
 
 #define HFI_VIDEO_ARCH_OX				0x1
+
+#define HFI_SESSION_TYPE_DEC				2
+
+#define HFI_VIDEO_CODEC_H264				0x00000002
+
 #define HFI_ERR_NONE					0x0
 
 #define HFI_CMD_SYS_INIT				0x10001
 #define HFI_CMD_SYS_PC_PREP				0x10002
 #define HFI_CMD_SYS_SET_PROPERTY			0x10005
 #define HFI_CMD_SYS_GET_PROPERTY			0x10006
+#define HFI_CMD_SYS_SESSION_INIT			0x10007
+#define HFI_CMD_SYS_SESSION_END				0x10008
 
-#define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
-#define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
+#define HFI_ERR_SESSION_UNSUPPORTED_SETTING		0x1008
+#define HFI_ERR_SESSION_UNSUPPORT_BUFFERTYPE		0x1010
+#define HFI_ERR_SESSION_INVALID_SCALE_FACTOR		0x1012
+#define HFI_ERR_SESSION_UPSCALE_NOT_SUPPORTED		0x1013
 
 #define HFI_EVENT_SYS_ERROR				0x1
+#define HFI_EVENT_SESSION_ERROR				0x2
+
+#define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
+#define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
 
 #define HFI_MSG_SYS_INIT				0x20001
+#define HFI_MSG_SYS_SESSION_INIT			0x20006
+#define HFI_MSG_SYS_SESSION_END				0x20007
 #define HFI_MSG_SYS_COV					0x20009
 #define HFI_MSG_SYS_PROPERTY_INFO			0x2000a
 
@@ -32,6 +47,21 @@ struct hfi_pkt_hdr {
 	u32 pkt_type;
 };
 
+struct hfi_session_hdr_pkt {
+	struct hfi_pkt_hdr hdr;
+	u32 session_id;
+};
+
+struct hfi_session_open_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 session_domain;
+	u32 session_codec;
+};
+
+struct hfi_session_pkt {
+	struct hfi_session_hdr_pkt shdr;
+};
+
 struct hfi_sys_init_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 arch_type;
@@ -54,7 +84,7 @@ struct hfi_sys_pc_prep_pkt {
 };
 
 struct hfi_msg_event_notify_pkt {
-	struct hfi_pkt_hdr hdr;
+	struct hfi_session_hdr_pkt shdr;
 	u32 event_id;
 	u32 event_data1;
 	u32 event_data2;
@@ -68,6 +98,17 @@ struct hfi_msg_sys_init_done_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_hdr_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 error_type;
+};
+
+struct hfi_msg_session_init_done_pkt {
+	struct hfi_msg_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data[];
+};
+
 struct hfi_msg_sys_property_info_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 num_properties;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 3eb2ce99c614..c9b87ff4db3a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -13,13 +13,54 @@ iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
 	struct hfi_msg_event_notify_pkt *pkt = packet;
 
 	if (pkt->event_id == HFI_EVENT_SYS_ERROR)
-		dev_err(core->dev, "sys error (type: %x, data1:%x, data2:%x)\n",
-			pkt->event_id, pkt->event_data1, pkt->event_data2);
+		dev_err(core->dev, "sys error (type: %x, session id:%x, data1:%x, data2:%x)\n",
+			pkt->event_id, pkt->shdr.session_id, pkt->event_data1,
+			pkt->event_data2);
 
 	iris_change_core_state(core, IRIS_CORE_ERROR);
 	schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
 }
 
+static void
+iris_hfi_gen1_event_session_error(struct iris_inst *inst, struct hfi_msg_event_notify_pkt *pkt)
+{
+	switch (pkt->event_data1) {
+	/* non fatal session errors */
+	case HFI_ERR_SESSION_INVALID_SCALE_FACTOR:
+	case HFI_ERR_SESSION_UNSUPPORT_BUFFERTYPE:
+	case HFI_ERR_SESSION_UNSUPPORTED_SETTING:
+	case HFI_ERR_SESSION_UPSCALE_NOT_SUPPORTED:
+		dev_dbg(inst->core->dev, "session error: event id:%x, session id:%x\n",
+			pkt->event_data1, pkt->shdr.session_id);
+		break;
+	/* fatal session errors */
+	default:
+		/*
+		 * firmware fills event_data2 as an additional information about the
+		 * hfi command for which session error has ouccured.
+		 */
+		dev_err(inst->core->dev,
+			"session error for command: %x, event id:%x, session id:%x\n",
+			pkt->event_data2, pkt->event_data1,
+			pkt->shdr.session_id);
+		iris_vb2_queue_error(inst);
+		break;
+	}
+}
+
+static void iris_hfi_gen1_session_event_notify(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_event_notify_pkt *pkt = packet;
+
+	switch (pkt->event_id) {
+	case HFI_EVENT_SESSION_ERROR:
+		iris_hfi_gen1_event_session_error(inst, pkt);
+		break;
+	default:
+		break;
+	}
+}
+
 static void iris_hfi_gen1_sys_init_done(struct iris_core *core, void *packet)
 {
 	struct hfi_msg_sys_init_done_pkt *pkt = packet;
@@ -99,6 +140,14 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SYS_PROPERTY_INFO,
 	 .pkt_sz = sizeof(struct hfi_msg_sys_property_info_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SYS_SESSION_INIT,
+	 .pkt_sz = sizeof(struct hfi_msg_session_init_done_pkt),
+	},
+	{
+	 .pkt = HFI_MSG_SYS_SESSION_END,
+	 .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -106,6 +155,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 	const struct iris_hfi_gen1_response_pkt_info *pkt_info;
 	struct device *dev = core->dev;
 	struct hfi_pkt_hdr *hdr;
+	struct iris_inst *inst;
 	bool found = false;
 	unsigned int i;
 
@@ -126,12 +176,38 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		return;
 	}
 
-	if (hdr->pkt_type == HFI_MSG_SYS_INIT)
+	if (hdr->pkt_type == HFI_MSG_SYS_INIT) {
 		iris_hfi_gen1_sys_init_done(core, hdr);
-	else if (hdr->pkt_type == HFI_MSG_SYS_PROPERTY_INFO)
+	} else if (hdr->pkt_type == HFI_MSG_SYS_PROPERTY_INFO) {
 		iris_hfi_gen1_sys_property_info(core, hdr);
-	else if (hdr->pkt_type == HFI_MSG_EVENT_NOTIFY)
-		iris_hfi_gen1_sys_event_notify(core, hdr);
+	} else if (hdr->pkt_type == HFI_MSG_EVENT_NOTIFY) {
+		struct hfi_session_pkt *pkt;
+
+		pkt = (struct hfi_session_pkt *)hdr;
+		inst = iris_get_instance(core, pkt->shdr.session_id);
+		if (inst) {
+			mutex_lock(&inst->lock);
+			iris_hfi_gen1_session_event_notify(inst, hdr);
+			mutex_unlock(&inst->lock);
+		} else {
+			iris_hfi_gen1_sys_event_notify(core, hdr);
+		}
+	} else {
+		struct hfi_session_pkt *pkt;
+
+		pkt = (struct hfi_session_pkt *)hdr;
+		inst = iris_get_instance(core, pkt->shdr.session_id);
+		if (!inst) {
+			dev_warn(dev, "no valid instance(pkt session_id:%x, pkt:%x)\n",
+				 pkt->shdr.session_id,
+				 pkt_info ? pkt_info->pkt : 0);
+			return;
+		}
+
+		mutex_lock(&inst->lock);
+		complete(&inst->completion);
+		mutex_unlock(&inst->lock);
+	}
 }
 
 static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 6ec83984fda9..76f0c9032a92 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -10,13 +10,18 @@
 
 struct iris_core;
 
+#define to_iris_inst_hfi_gen2(ptr) \
+	container_of(ptr, struct iris_inst_hfi_gen2, inst)
+
 /**
  * struct iris_inst_hfi_gen2 - holds per video instance parameters for hfi_gen2
  *
  * @inst: pointer to iris_instance structure
+ * @packet: HFI packet
  */
 struct iris_inst_hfi_gen2 {
 	struct iris_inst		inst;
+	struct iris_hfi_header		*packet;
 };
 
 void iris_hfi_gen2_command_ops_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 0871c0bdea90..a74114b0761a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -85,11 +85,117 @@ static int iris_hfi_gen2_sys_pc_prep(struct iris_core *core)
 	return ret;
 }
 
+static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 codec;
+
+	codec = HFI_CODEC_DECODE_AVC;
+	iris_hfi_gen2_packet_session_property(inst,
+					      HFI_PROP_CODEC,
+					      HFI_HOST_FLAGS_NONE,
+					      HFI_PORT_NONE,
+					      HFI_PAYLOAD_U32_ENUM,
+					      &codec,
+					      sizeof(u32));
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
+static int iris_hfi_gen2_session_set_default_header(struct iris_inst *inst)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 default_header = false;
+
+	iris_hfi_gen2_packet_session_property(inst,
+					      HFI_PROP_DEC_DEFAULT_HEADER,
+					      HFI_HOST_FLAGS_NONE,
+					      HFI_PORT_BITSTREAM,
+					      HFI_PAYLOAD_U32,
+					      &default_header,
+					      sizeof(u32));
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
+static int iris_hfi_gen2_session_open(struct iris_inst *inst)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	int ret;
+
+	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
+	if (!inst_hfi_gen2->packet)
+		return -ENOMEM;
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_OPEN,
+					     HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					     HFI_HOST_FLAGS_INTR_REQUIRED,
+					     HFI_PORT_NONE,
+					     0,
+					     HFI_PAYLOAD_U32,
+					     &inst->session_id,
+					     sizeof(u32));
+
+	ret = iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+				       inst_hfi_gen2->packet->size);
+	if (ret)
+		goto fail_free_packet;
+
+	ret = iris_hfi_gen2_session_set_codec(inst);
+	if (ret)
+		goto fail_free_packet;
+
+	ret = iris_hfi_gen2_session_set_default_header(inst);
+	if (ret)
+		goto fail_free_packet;
+
+	return ret;
+
+fail_free_packet:
+	kfree(inst_hfi_gen2->packet);
+	inst_hfi_gen2->packet = NULL;
+
+	return ret;
+}
+
+static int iris_hfi_gen2_session_close(struct iris_inst *inst)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	int ret;
+
+	if (!inst_hfi_gen2->packet)
+		return -EINVAL;
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_CLOSE,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					     HFI_HOST_FLAGS_INTR_REQUIRED |
+					     HFI_HOST_FLAGS_NON_DISCARDABLE),
+					     HFI_PORT_NONE,
+					     inst->session_id,
+					     HFI_PAYLOAD_NONE,
+					     NULL,
+					     0);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+				       inst_hfi_gen2->packet->size);
+
+	kfree(inst_hfi_gen2->packet);
+	inst_hfi_gen2->packet = NULL;
+
+	return ret;
+}
+
 static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
 	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
+	.session_open = iris_hfi_gen2_session_open,
+	.session_close = iris_hfi_gen2_session_close,
 };
 
 void iris_hfi_gen2_command_ops_init(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 4104479c7251..18cc9365ab75 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -13,6 +13,8 @@
 #define HFI_CMD_BEGIN				0x01000000
 #define HFI_CMD_INIT				0x01000001
 #define HFI_CMD_POWER_COLLAPSE			0x01000002
+#define HFI_CMD_OPEN				0x01000003
+#define HFI_CMD_CLOSE				0x01000004
 #define HFI_CMD_END				0x01FFFFFF
 
 #define HFI_PROP_BEGIN				0x03000000
@@ -25,12 +27,44 @@
 #define HFI_PROP_UBWC_BANK_SWZL_LEVEL2		0x03000007
 #define HFI_PROP_UBWC_BANK_SWZL_LEVEL3		0x03000008
 #define HFI_PROP_UBWC_BANK_SPREADING		0x03000009
+#define HFI_PROP_CODEC				0x03000100
+#define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
 #define HFI_PROP_END				0x03FFFFFF
 
+#define HFI_SESSION_ERROR_BEGIN			0x04000000
+#define HFI_ERROR_UNKNOWN_SESSION		0x04000001
+#define HFI_ERROR_MAX_SESSIONS			0x04000002
+#define HFI_ERROR_FATAL				0x04000003
+#define HFI_ERROR_INVALID_STATE			0x04000004
+#define HFI_ERROR_INSUFFICIENT_RESOURCES	0x04000005
+#define HFI_ERROR_BUFFER_NOT_SET		0x04000006
+#define HFI_SESSION_ERROR_END			0x04FFFFFF
+
 #define HFI_SYSTEM_ERROR_BEGIN			0x05000000
 #define HFI_SYS_ERROR_WD_TIMEOUT		0x05000001
 #define HFI_SYSTEM_ERROR_END			0x05FFFFFF
 
+enum hfi_codec_type {
+	HFI_CODEC_DECODE_AVC			= 1,
+	HFI_CODEC_ENCODE_AVC			= 2,
+};
+
+enum hfi_buffer_type {
+	HFI_BUFFER_BITSTREAM			= 0x00000001,
+	HFI_BUFFER_RAW				= 0x00000002,
+	HFI_BUFFER_METADATA			= 0x00000003,
+	HFI_BUFFER_SUBCACHE			= 0x00000004,
+	HFI_BUFFER_PARTIAL_DATA			= 0x00000005,
+	HFI_BUFFER_DPB				= 0x00000006,
+	HFI_BUFFER_BIN				= 0x00000007,
+	HFI_BUFFER_LINE				= 0x00000008,
+	HFI_BUFFER_ARP				= 0x00000009,
+	HFI_BUFFER_COMV				= 0x0000000A,
+	HFI_BUFFER_NON_COMV			= 0x0000000B,
+	HFI_BUFFER_PERSIST			= 0x0000000C,
+	HFI_BUFFER_VPSS				= 0x0000000D,
+};
+
 enum hfi_packet_firmware_flags {
 	HFI_FW_FLAGS_SUCCESS			= 0x00000001,
 	HFI_FW_FLAGS_INFORMATION		= 0x00000002,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 9ea26328a300..09e7c07fdc5f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -146,6 +146,45 @@ void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct iris_hfi_
 				    NULL, 0);
 }
 
+void iris_hfi_gen2_packet_session_command(struct iris_inst *inst, u32 pkt_type,
+					  u32 flags, u32 port, u32 session_id,
+					  u32 payload_type, void *payload,
+					  u32 payload_size)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	struct iris_core *core = inst->core;
+
+	iris_hfi_gen2_create_header(inst_hfi_gen2->packet, session_id, core->header_id++);
+
+	iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
+				    pkt_type,
+				    flags,
+				    payload_type,
+				    port,
+				    core->packet_id++,
+				    payload,
+				    payload_size);
+}
+
+void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
+					   u32 pkt_type, u32 flags, u32 port,
+					   u32 payload_type, void *payload, u32 payload_size)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	struct iris_core *core = inst->core;
+
+	iris_hfi_gen2_create_header(inst_hfi_gen2->packet, inst->session_id, core->header_id++);
+
+	iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
+				    pkt_type,
+				    flags,
+				    payload_type,
+				    port,
+				    core->packet_id++,
+				    payload,
+				    payload_size);
+}
+
 void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
 						       struct iris_hfi_header *hdr)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
index 163295783b7d..120592322e78 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
@@ -63,6 +63,13 @@ struct iris_hfi_packet {
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr);
 void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct iris_hfi_header *hdr);
+void iris_hfi_gen2_packet_session_command(struct iris_inst *inst, u32 pkt_type,
+					  u32 flags, u32 port, u32 session_id,
+					  u32 payload_type, void *payload,
+					  u32 payload_size);
+void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
+					   u32 pkt_type, u32 flags, u32 port,
+					   u32 payload_type, void *payload, u32 payload_size);
 void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
 						       struct iris_hfi_header *hdr);
 void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index e208a5ae664a..dce2cf04a856 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -14,6 +14,17 @@ struct iris_hfi_gen2_core_hfi_range {
 	int (*handle)(struct iris_core *core, struct iris_hfi_packet *pkt);
 };
 
+struct iris_hfi_gen2_inst_hfi_range {
+	u32 begin;
+	u32 end;
+	int (*handle)(struct iris_inst *inst, struct iris_hfi_packet *pkt);
+};
+
+struct iris_hfi_gen2_packet_handle {
+	enum hfi_buffer_type type;
+	int (*handle)(struct iris_inst *inst, struct iris_hfi_packet *pkt);
+};
+
 static int iris_hfi_gen2_validate_packet(u8 *response_pkt, u8 *core_resp_pkt)
 {
 	u32 response_pkt_size = 0;
@@ -57,6 +68,43 @@ static int iris_hfi_gen2_validate_hdr_packet(struct iris_core *core, struct iris
 	return ret;
 }
 
+static int iris_hfi_gen2_handle_session_error(struct iris_inst *inst,
+					      struct iris_hfi_packet *pkt)
+{
+	struct iris_core *core = inst->core;
+	char *error;
+
+	switch (pkt->type) {
+	case HFI_ERROR_MAX_SESSIONS:
+		error = "exceeded max sessions";
+		break;
+	case HFI_ERROR_UNKNOWN_SESSION:
+		error = "unknown session id";
+		break;
+	case HFI_ERROR_INVALID_STATE:
+		error = "invalid operation for current state";
+		break;
+	case HFI_ERROR_INSUFFICIENT_RESOURCES:
+		error = "insufficient resources";
+		break;
+	case HFI_ERROR_BUFFER_NOT_SET:
+		error = "internal buffers not set";
+		break;
+	case HFI_ERROR_FATAL:
+		error = "fatal error";
+		break;
+	default:
+		error = "unknown";
+		break;
+	}
+
+	dev_err(core->dev, "session error received %#x: %s\n",
+		pkt->type, error);
+	iris_vb2_queue_error(inst);
+
+	return 0;
+}
+
 static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
 					     struct iris_hfi_packet *pkt)
 {
@@ -81,6 +129,22 @@ static int iris_hfi_gen2_handle_system_init(struct iris_core *core,
 	return 0;
 }
 
+static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
+						struct iris_hfi_packet *pkt)
+{
+	int ret = 0;
+
+	switch (pkt->type) {
+	case HFI_CMD_CLOSE:
+		complete(&inst->completion);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static int iris_hfi_gen2_handle_image_version_property(struct iris_core *core,
 						       struct iris_hfi_packet *pkt)
 {
@@ -163,6 +227,46 @@ static int iris_hfi_gen2_handle_system_response(struct iris_core *core,
 	return ret;
 }
 
+static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
+						 struct iris_hfi_header *hdr)
+{
+	struct iris_hfi_packet *packet;
+	struct iris_inst *inst;
+	u8 *pkt, *start_pkt;
+	int ret = 0;
+	int i, j;
+	static const struct iris_hfi_gen2_inst_hfi_range range[] = {
+		{HFI_SESSION_ERROR_BEGIN, HFI_SESSION_ERROR_END,
+		 iris_hfi_gen2_handle_session_error},
+		{HFI_CMD_BEGIN, HFI_CMD_END,
+		 iris_hfi_gen2_handle_session_command },
+	};
+
+	inst = iris_get_instance(core, hdr->session_id);
+	if (!inst)
+		return -EINVAL;
+
+	mutex_lock(&inst->lock);
+
+	start_pkt = (u8 *)((u8 *)hdr + sizeof(*hdr));
+	for (i = 0; i < ARRAY_SIZE(range); i++) {
+		pkt = start_pkt;
+		for (j = 0; j < hdr->num_packets; j++) {
+			packet = (struct iris_hfi_packet *)pkt;
+			if (packet->flags & HFI_FW_FLAGS_SESSION_ERROR)
+				iris_hfi_gen2_handle_session_error(inst, packet);
+
+			if (packet->type > range[i].begin && packet->type < range[i].end)
+				ret = range[i].handle(inst, packet);
+			pkt += packet->size;
+		}
+	}
+
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
 static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
 {
 	struct iris_hfi_header *hdr;
@@ -173,7 +277,10 @@ static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
 	if (ret)
 		return iris_hfi_gen2_handle_system_error(core, NULL);
 
-	return iris_hfi_gen2_handle_system_response(core, hdr);
+	if (!hdr->session_id)
+		return iris_hfi_gen2_handle_system_response(core, hdr);
+	else
+		return iris_hfi_gen2_handle_session_response(core, hdr);
 }
 
 static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 63cb9d70166f..bb43119af352 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -6,24 +6,46 @@
 #ifndef _IRIS_INSTANCE_H_
 #define _IRIS_INSTANCE_H_
 
+#include <media/v4l2-ctrls.h>
+
+#include "iris_buffer.h"
 #include "iris_core.h"
+#include "iris_utils.h"
 
 /**
  * struct iris_inst - holds per video instance parameters
  *
+ * @list: used for attach an instance to the core
  * @core: pointer to core structure
+ * @session_id: id of current video session
  * @ctx_q_lock: lock to serialize queues related ioctls
  * @lock: lock to seralise forward and reverse threads
  * @fh: reference of v4l2 file handler
+ * @fmt_src: structure of v4l2_format for source
+ * @fmt_dst: structure of v4l2_format for destination
+ * @crop: structure of crop info
+ * @completions: structure of signal completions
+ * @buffers: array of different iris buffers
+ * @fw_min_count: minimnum count of buffers needed by fw
+ * @once_per_session_set: boolean to set once per session property
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
  */
 
 struct iris_inst {
+	struct list_head		list;
 	struct iris_core		*core;
+	u32				session_id;
 	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
 	struct mutex			lock; /* lock to serialize forward and reverse threads */
 	struct v4l2_fh			fh;
+	struct v4l2_format		*fmt_src;
+	struct v4l2_format		*fmt_dst;
+	struct iris_hfi_rect_desc	crop;
+	struct completion		completion;
+	struct iris_buffers		buffers[BUF_TYPE_MAX];
+	u32				fw_min_count;
+	bool				once_per_session_set;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct v4l2_m2m_ctx		*m2m_ctx;
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 899a696a931d..754cccc638a5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -75,6 +75,7 @@ struct iris_platform_data {
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
+	u32 max_session_count;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 1adbafa373a5..cbc5e84641f6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -60,4 +60,5 @@ struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8250,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
+	.max_session_count = 16,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 950ccdccde31..57fe9986b8cf 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -74,4 +74,5 @@ struct iris_platform_data sm8550_data = {
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
+	.max_session_count = 16,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 3222e9116551..5d492b3919cc 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -36,6 +36,7 @@ static int iris_register_video_device(struct iris_core *core)
 	strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
 	vdev->release = video_device_release;
 	vdev->fops = core->iris_v4l2_file_ops;
+	vdev->ioctl_ops = core->iris_v4l2_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
@@ -102,6 +103,7 @@ static int iris_probe(struct platform_device *pdev)
 	if (!core->response_packet)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&core->instances);
 	INIT_DELAYED_WORK(&core->sys_error_handler, iris_sys_error_handler);
 
 	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
new file mode 100644
index 000000000000..d7e7c9852aca
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/pm_runtime.h>
+
+#include "iris_instance.h"
+#include "iris_utils.h"
+
+int iris_get_mbpf(struct iris_inst *inst)
+{
+	struct v4l2_format *inp_f;
+	int height, width;
+
+	inp_f = inst->fmt_src;
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	return NUM_MBS_PER_FRAME(height, width);
+}
+
+int iris_wait_for_session_response(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	u32 hw_response_timeout_val;
+	int ret;
+
+	hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
+
+	mutex_unlock(&inst->lock);
+	ret = wait_for_completion_timeout(&inst->completion,
+					  msecs_to_jiffies(hw_response_timeout_val));
+	mutex_lock(&inst->lock);
+	if (!ret)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
+{
+	struct iris_inst *inst = NULL;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list) {
+		if (inst->session_id == session_id) {
+			mutex_unlock(&core->lock);
+			return inst;
+		}
+	}
+	mutex_unlock(&core->lock);
+
+	return NULL;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
new file mode 100644
index 000000000000..1c1e109d9b5b
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_UTILS_H_
+#define _IRIS_UTILS_H_
+
+struct iris_core;
+#include "iris_buffer.h"
+
+struct iris_hfi_rect_desc {
+	u32 left;
+	u32 top;
+	u32 width;
+	u32 height;
+};
+
+#define NUM_MBS_PER_FRAME(height, width) \
+	(DIV_ROUND_UP(height, 16) * DIV_ROUND_UP(width, 16))
+
+static inline enum iris_buffer_type iris_v4l2_type_to_driver(u32 type)
+{
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		return BUF_INPUT;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		return BUF_OUTPUT;
+	default:
+		return -EINVAL;
+	}
+}
+
+int iris_get_mbpf(struct iris_inst *inst);
+struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
+int iris_wait_for_session_response(struct iris_inst *inst);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
new file mode 100644
index 000000000000..3fd18b6773fd
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_buffer.h"
+#include "iris_instance.h"
+#include "iris_vb2.h"
+#include "iris_vpu_buffer.h"
+
+int iris_vb2_queue_setup(struct vb2_queue *q,
+			 unsigned int *num_buffers, unsigned int *num_planes,
+			 unsigned int sizes[], struct device *alloc_devs[])
+{
+	enum iris_buffer_type buffer_type = 0;
+	struct iris_buffers *buffers;
+	struct iris_inst *inst;
+	struct iris_core *core;
+	struct v4l2_format *f;
+	int ret = 0;
+
+	if (!q || !num_buffers || !num_planes || !sizes)
+		return -EINVAL;
+
+	inst = vb2_get_drv_priv(q);
+	if (!inst || !inst->core)
+		return -EINVAL;
+
+	mutex_lock(&inst->lock);
+
+	core = inst->core;
+	f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
+
+	if (*num_planes) {
+		if (*num_planes != f->fmt.pix_mp.num_planes ||
+		    sizes[0] < f->fmt.pix_mp.plane_fmt[0].sizeimage) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+	}
+
+	buffer_type = iris_v4l2_type_to_driver(q->type);
+	if (buffer_type == -EINVAL) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if (!inst->once_per_session_set) {
+		inst->once_per_session_set = true;
+
+		mutex_lock(&core->lock);
+		if (core->state == IRIS_CORE_ERROR) {
+			mutex_unlock(&core->lock);
+			ret = -EIO;
+			goto unlock;
+		}
+		mutex_unlock(&core->lock);
+
+		ret = core->hfi_ops->session_open(inst);
+		if (ret) {
+			ret = -EINVAL;
+			dev_err(core->dev, "session open failed\n");
+			goto unlock;
+		}
+	}
+
+	buffers = &inst->buffers[buffer_type];
+	if (!buffers) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
+	if (*num_buffers < buffers->min_count)
+		*num_buffers = buffers->min_count;
+	buffers->actual_count = *num_buffers;
+	*num_planes = 1;
+
+	buffers->size = iris_get_buffer_size(inst, buffer_type);
+
+	if (sizes[0] < buffers->size) {
+		f->fmt.pix_mp.plane_fmt[0].sizeimage = buffers->size;
+		sizes[0] = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+	}
+
+	q->dev = core->dev;
+
+unlock:
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.h b/drivers/media/platform/qcom/iris/iris_vb2.h
new file mode 100644
index 000000000000..78157a97b86e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vb2.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_VB2_H_
+#define _IRIS_VB2_H_
+
+int iris_vb2_queue_setup(struct vb2_queue *q,
+			 unsigned int *num_buffers, unsigned int *num_planes,
+			 unsigned int sizes[], struct device *alloc_devs[]);
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
new file mode 100644
index 000000000000..7d1ef31c7c44
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_buffer.h"
+#include "iris_instance.h"
+#include "iris_vdec.h"
+#include "iris_vpu_buffer.h"
+
+#define DEFAULT_WIDTH 320
+#define DEFAULT_HEIGHT 240
+
+void iris_vdec_inst_init(struct iris_inst *inst)
+{
+	struct v4l2_format *f;
+
+	inst->fmt_src  = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
+	inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
+
+	inst->fw_min_count = MIN_BUFFERS;
+
+	f = inst->fmt_src;
+	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	f->fmt.pix_mp.width = DEFAULT_WIDTH;
+	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
+	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
+	f->fmt.pix_mp.num_planes = 1;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
+	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
+	inst->buffers[BUF_INPUT].actual_count = inst->buffers[BUF_INPUT].min_count;
+	inst->buffers[BUF_INPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	f = inst->fmt_dst;
+	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
+	f->fmt.pix_mp.width = ALIGN(DEFAULT_WIDTH, 128);
+	f->fmt.pix_mp.height = ALIGN(DEFAULT_HEIGHT, 32);
+	f->fmt.pix_mp.num_planes = 1;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(DEFAULT_WIDTH, 128);
+	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
+	inst->buffers[BUF_OUTPUT].actual_count = inst->buffers[BUF_OUTPUT].min_count;
+	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+}
+
+void iris_vdec_inst_deinit(struct iris_inst *inst)
+{
+	kfree(inst->fmt_dst);
+	kfree(inst->fmt_src);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
new file mode 100644
index 000000000000..0324d7f796dd
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_VDEC_H_
+#define _IRIS_VDEC_H_
+
+struct iris_inst;
+
+void iris_vdec_inst_init(struct iris_inst *inst);
+void iris_vdec_inst_deinit(struct iris_inst *inst);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bc0a3232214b..70ce2296d1b2 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,8 @@
 
 #include "iris_vidc.h"
 #include "iris_instance.h"
+#include "iris_vdec.h"
+#include "iris_vb2.h"
 #include "iris_platform_common.h"
 
 #define IRIS_DRV_NAME "iris_driver"
@@ -39,6 +41,46 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst)
 	v4l2_fh_exit(&inst->fh);
 }
 
+static int iris_add_session(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *i;
+	u32 count = 0;
+	int ret = 0;
+
+	mutex_lock(&core->lock);
+	if (core->state != IRIS_CORE_INIT) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+	list_for_each_entry(i, &core->instances, list)
+		count++;
+
+	if (count < core->iris_platform_data->max_session_count)
+		list_add_tail(&inst->list, &core->instances);
+	else
+		ret = -EAGAIN;
+unlock:
+	mutex_unlock(&core->lock);
+
+	return ret;
+}
+
+static void iris_remove_session(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	struct iris_inst *i, *temp;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry_safe(i, temp, &core->instances, list) {
+		if (i->session_id == inst->session_id) {
+			list_del_init(&i->list);
+			break;
+		}
+	}
+	mutex_unlock(&core->lock);
+}
+
 static struct iris_inst *iris_get_inst(struct file *filp, void *fh)
 {
 	if (!filp || !filp->private_data)
@@ -74,7 +116,9 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->ops = inst->core->iris_vb2_ops;
 	src_vq->drv_priv = inst;
+	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->dev = inst->core->dev;
 	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
@@ -84,7 +128,9 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->ops = inst->core->iris_vb2_ops;
 	dst_vq->drv_priv = inst;
+	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->dev = inst->core->dev;
 	dst_vq->lock = &inst->ctx_q_lock;
 
@@ -115,9 +161,11 @@ int iris_open(struct file *filp)
 		return -ENOMEM;
 
 	inst->core = core;
+	inst->session_id = hash32_ptr(inst);
 
 	mutex_init(&inst->lock);
 	mutex_init(&inst->ctx_q_lock);
+	init_completion(&inst->completion);
 
 	ret = iris_v4l2_fh_init(inst);
 	if (ret)
@@ -135,11 +183,24 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
+	iris_vdec_inst_init(inst);
+	if (ret)
+		goto fail_m2m_ctx_release;
+
+	ret = iris_add_session(inst);
+	if (ret)
+		goto fail_inst_deinit;
+
 	inst->fh.m2m_ctx = inst->m2m_ctx;
 	filp->private_data = &inst->fh;
 
 	return 0;
 
+fail_inst_deinit:
+	iris_remove_session(inst);
+	iris_vdec_inst_deinit(inst);
+fail_m2m_ctx_release:
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
 fail_m2m_release:
 	v4l2_m2m_release(inst->m2m_dev);
 fail_v4l2_fh_deinit:
@@ -152,6 +213,24 @@ int iris_open(struct file *filp)
 	return ret;
 }
 
+static void iris_session_close(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	bool wait_for_response;
+	int ret;
+
+	wait_for_response = true;
+
+	reinit_completion(&inst->completion);
+
+	ret = hfi_ops->session_close(inst);
+	if (ret)
+		wait_for_response = false;
+
+	if (wait_for_response)
+		iris_wait_for_session_response(inst);
+}
+
 int iris_close(struct file *filp)
 {
 	struct iris_inst *inst;
@@ -163,7 +242,10 @@ int iris_close(struct file *filp)
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	mutex_lock(&inst->lock);
+	iris_vdec_inst_deinit(inst);
+	iris_session_close(inst);
 	iris_v4l2_fh_deinit(inst);
+	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);
 	mutex_destroy(&inst->lock);
@@ -182,7 +264,17 @@ static struct v4l2_file_operations iris_v4l2_file_ops = {
 	.mmap                           = v4l2_m2m_fop_mmap,
 };
 
+static const struct vb2_ops iris_vb2_ops = {
+	.queue_setup                    = iris_vb2_queue_setup,
+};
+
+static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
+	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
+};
+
 void iris_init_ops(struct iris_core *core)
 {
 	core->iris_v4l2_file_ops = &iris_v4l2_file_ops;
+	core->iris_vb2_ops = &iris_vb2_ops;
+	core->iris_v4l2_ioctl_ops = &iris_v4l2_ioctl_ops;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
new file mode 100644
index 000000000000..2402a33723ab
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_instance.h"
+#include "iris_vpu_buffer.h"
+
+int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	switch (buffer_type) {
+	case BUF_INPUT:
+		return MIN_BUFFERS;
+	case BUF_OUTPUT:
+		return inst->fw_min_count;
+	default:
+		return 0;
+	}
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
new file mode 100644
index 000000000000..f0f974cebd8a
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_VPU_BUFFER_H_
+#define _IRIS_VPU_BUFFER_H_
+
+struct iris_inst;
+
+#define MIN_BUFFERS			4
+
+int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+
+#endif

-- 
2.34.1



