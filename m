Return-Path: <linux-media+bounces-42686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F4B80AD6
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 17:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7EA7524626
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80B7321273;
	Wed, 17 Sep 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TO1K05DO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE14369997;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758123533; cv=none; b=TDwsbt8HTfnY8slopcv7FpKpM9rpVLJhhHRTwKuwsUfcMf7eDmQVgovnxrMpCloMj1Uc6BUqXnAHRrF/LVPqQEDqKxpJT53ImPMoorj2izYDoDTS7A+cX3GJY+IFUJZmT/lnJjzvxDQgLQeGGN6MhQX9xmb6Xx9XjydGAczIQrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758123533; c=relaxed/simple;
	bh=tLL4/WL79/3U/bTMhSlaO2Wh2uWsyiNptaFuyhpyQ8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2fVqnk8xncv3pz/wBg6Bs5hM0tr9vy1IRTuXlFimEWfb9Q3qKG66cKL17Qgd4jqSErHWmVvkJQPgEaDtYmbE9vDoM0Jc2D2PLDSUpX8VUhzwsTz4TW/k+H3wI/NRNRKAmRptUYORhyqobvzOJxHoYxsfLc3o5sxlRj/aTbzQKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TO1K05DO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60819C4CEFA;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758123533;
	bh=tLL4/WL79/3U/bTMhSlaO2Wh2uWsyiNptaFuyhpyQ8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TO1K05DOW2Mixa66NM4vPdZZGDg3qhigt8LR+01ZLYSY7cjwFsHfHX9o4J0ZD/vKU
	 3AwKibncScigwDnwm9Uo1WYg9/PxON0wlyikWuc40BnPKd60nbdLYQSGK2XyGvxk/O
	 WjJIb3W1kqRE/3w3yVrR0DkWBDCF3FNontHW0auEp6yIM+ardwchuYG40ssKHHcAkZ
	 U7uts7uG413mtkdyksnVEXTiM5g0FLtUb0Ql/smvR5mFma8/g4T46GIIV9FeMBxltY
	 AOJWAvx3HUCv+uzuxsZc7+YDGw0+kUuhxgpElq1dS1MciRHc26qM1h6L/RVHtWzuXk
	 Sm97bN2NT6ajg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E0BCAC59A;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 17 Sep 2025 17:38:49 +0200
Subject: [PATCH v11 09/17] media: rockchip: rkcif: add abstraction for dma
 blocks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v11-9-af0eada54e5d@collabora.com>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758123529; l=26014;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=m22pPHZ7nrfOYiij8i7G0D/EAXxMwSAqjxo+GsZsxwc=;
 b=EeRxO+AOnkDp5+goSLY+jdRUiaq9zdH7kBz/W1giVbCTMeovkuLQ5XYxCUjKC3XleFAY4tOcl
 paYeZgmxZIMDemYccneKNHM6fY1o8cB3SMWoWDWXka9DLuo7lmDaXFK
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add an abstraction for the DMA parts and the ping-pong scheme (a
double-buffering mechanism) of the different CIF variants. Each
stream is represented as V4L2 device whose corresponding media
entity has one sink pad. This sink pad is connected to an instance
of the INTERFACE/CROP abstraction.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |  67 +++
 .../platform/rockchip/rkcif/rkcif-interface.c      |  37 ++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 637 +++++++++++++++++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
 5 files changed, 773 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
index 9d535fc27e51..256335d95050 100644
--- a/drivers/media/platform/rockchip/rkcif/Makefile
+++ b/drivers/media/platform/rockchip/rkcif/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
 
 rockchip-cif-objs += rkcif-dev.o
 rockchip-cif-objs += rkcif-interface.o
+rockchip-cif-objs += rkcif-stream.o
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index a3e052ad885a..395ec7e7e13b 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -32,6 +32,14 @@ enum rkcif_format_type {
 	RKCIF_FMT_TYPE_RAW,
 };
 
+enum rkcif_id_index {
+	RKCIF_ID0,
+	RKCIF_ID1,
+	RKCIF_ID2,
+	RKCIF_ID3,
+	RKCIF_ID_MAX
+};
+
 enum rkcif_interface_index {
 	RKCIF_DVP,
 	RKCIF_MIPI_BASE,
@@ -62,6 +70,19 @@ enum rkcif_interface_type {
 	RKCIF_IF_MIPI,
 };
 
+struct rkcif_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	dma_addr_t buff_addr[VIDEO_MAX_PLANES];
+	bool is_dummy;
+};
+
+struct rkcif_dummy_buffer {
+	struct rkcif_buffer buffer;
+	void *vaddr;
+	u32 size;
+};
+
 struct rkcif_input_fmt {
 	u32 mbus_code;
 
@@ -69,6 +90,12 @@ struct rkcif_input_fmt {
 	enum v4l2_field field;
 };
 
+struct rkcif_output_fmt {
+	u32 fourcc;
+	u32 mbus_code;
+	u8 cplanes;
+};
+
 struct rkcif_interface;
 
 struct rkcif_remote {
@@ -78,6 +105,42 @@ struct rkcif_remote {
 	struct rkcif_interface *interface;
 };
 
+struct rkcif_stream {
+	enum rkcif_id_index id;
+	struct rkcif_device *rkcif;
+	struct rkcif_interface *interface;
+	const struct rkcif_output_fmt *out_fmts;
+	unsigned int out_fmts_num;
+
+	/* in ping-pong mode, two buffers can be provided to the HW */
+	struct rkcif_buffer *buffers[2];
+	int frame_idx;
+	int frame_phase;
+
+	/* in case of no available buffer, HW can write to the dummy buffer */
+	struct rkcif_dummy_buffer dummy;
+
+	bool stopping;
+	wait_queue_head_t wq_stopped;
+
+	/* queue of available buffers plus spinlock that protects it */
+	spinlock_t driver_queue_lock;
+	struct list_head driver_queue;
+
+	/* lock used by the V4L2 core */
+	struct mutex vlock;
+
+	struct media_pad pad;
+	struct media_pipeline pipeline;
+	struct v4l2_pix_format_mplane pix;
+	struct vb2_queue buf_queue;
+	struct video_device vdev;
+
+	void (*queue_buffer)(struct rkcif_stream *stream, unsigned int index);
+	int (*start_streaming)(struct rkcif_stream *stream);
+	void (*stop_streaming)(struct rkcif_stream *stream);
+};
+
 struct rkcif_dvp {
 	u32 dvp_clk_delay;
 };
@@ -88,6 +151,8 @@ struct rkcif_interface {
 	enum rkcif_interface_index index;
 	struct rkcif_device *rkcif;
 	struct rkcif_remote *remote;
+	struct rkcif_stream streams[RKCIF_ID_MAX];
+	unsigned int streams_num;
 	const struct rkcif_input_fmt *in_fmts;
 	unsigned int in_fmts_num;
 
@@ -98,6 +163,8 @@ struct rkcif_interface {
 	union {
 		struct rkcif_dvp dvp;
 	};
+
+	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
 };
 
 struct rkcif_match_data {
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
index 06386144b70c..ef07759604a7 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -140,15 +140,41 @@ static int rkcif_interface_set_routing(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
+	for (unsigned int i = 0; i < routing->num_routes; i++) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (route->source_stream >= RKCIF_ID_MAX)
+			return -EINVAL;
+	}
+
 	ret = v4l2_subdev_set_routing(sd, state, routing);
 
 	return ret;
 }
 
+static int rkcif_interface_apply_crop(struct rkcif_stream *stream,
+				      struct v4l2_subdev_state *state)
+{
+	struct rkcif_interface *interface = stream->interface;
+	struct v4l2_rect *crop;
+
+	crop = v4l2_subdev_state_get_crop(state, RKCIF_IF_PAD_SRC, stream->id);
+	if (!crop)
+		return -EINVAL;
+
+	if (interface->set_crop)
+		interface->set_crop(stream, crop->left, crop->top);
+
+	return 0;
+}
+
 static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
 					  struct v4l2_subdev_state *state,
 					  u32 pad, u64 streams_mask)
 {
+	struct rkcif_interface *interface = to_rkcif_interface(sd);
+	struct rkcif_stream *stream;
+	struct v4l2_subdev_route *route;
 	struct v4l2_subdev *remote_sd;
 	struct media_pad *remote_pad;
 	u64 mask;
@@ -157,6 +183,17 @@ static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
 		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
+	/* DVP has one crop setting for all IDs */
+	if (interface->type == RKCIF_IF_DVP) {
+		stream = &interface->streams[RKCIF_ID0];
+		rkcif_interface_apply_crop(stream, state);
+	} else {
+		for_each_active_route(&state->routing, route) {
+			stream = &interface->streams[route->sink_stream];
+			rkcif_interface_apply_crop(stream, state);
+		}
+	}
+
 	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
 					       RKCIF_IF_PAD_SRC, &streams_mask);
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
new file mode 100644
index 000000000000..ce8a743ed5d0
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -0,0 +1,637 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ */
+
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "rkcif-common.h"
+#include "rkcif-stream.h"
+
+#define CIF_REQ_BUFS_MIN 1
+#define CIF_MIN_WIDTH	 64
+#define CIF_MIN_HEIGHT	 64
+#define CIF_MAX_WIDTH	 8192
+#define CIF_MAX_HEIGHT	 8192
+
+static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
+{
+	return container_of(vb, struct rkcif_buffer, vb);
+}
+
+static inline struct rkcif_stream *to_rkcif_stream(struct video_device *vdev)
+{
+	return container_of(vdev, struct rkcif_stream, vdev);
+}
+
+static struct rkcif_buffer *rkcif_stream_pop_buffer(struct rkcif_stream *stream)
+{
+	struct rkcif_buffer *buffer;
+
+	guard(spinlock_irqsave)(&stream->driver_queue_lock);
+
+	if (list_empty(&stream->driver_queue))
+		return NULL;
+
+	buffer = list_first_entry(&stream->driver_queue, struct rkcif_buffer,
+				  queue);
+	list_del(&buffer->queue);
+
+	return buffer;
+}
+
+static void rkcif_stream_push_buffer(struct rkcif_stream *stream,
+				     struct rkcif_buffer *buffer)
+{
+	guard(spinlock_irqsave)(&stream->driver_queue_lock);
+
+	list_add_tail(&buffer->queue, &stream->driver_queue);
+}
+
+static inline void rkcif_stream_return_buffer(struct rkcif_buffer *buffer,
+					      enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *vb = &buffer->vb;
+
+	vb2_buffer_done(&vb->vb2_buf, state);
+}
+
+static void rkcif_stream_complete_buffer(struct rkcif_stream *stream,
+					 struct rkcif_buffer *buffer)
+{
+	struct vb2_v4l2_buffer *vb = &buffer->vb;
+
+	vb->vb2_buf.timestamp = ktime_get_ns();
+	vb->sequence = stream->frame_idx;
+	vb2_buffer_done(&vb->vb2_buf, VB2_BUF_STATE_DONE);
+	stream->frame_idx++;
+}
+
+void rkcif_stream_pingpong(struct rkcif_stream *stream)
+{
+	struct rkcif_buffer *buffer;
+
+	buffer = stream->buffers[stream->frame_phase];
+	if (!buffer->is_dummy)
+		rkcif_stream_complete_buffer(stream, buffer);
+
+	buffer = rkcif_stream_pop_buffer(stream);
+	if (buffer) {
+		stream->buffers[stream->frame_phase] = buffer;
+		stream->buffers[stream->frame_phase]->is_dummy = false;
+	} else {
+		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
+		stream->buffers[stream->frame_phase]->is_dummy = true;
+		dev_dbg(stream->rkcif->dev,
+			"no buffer available, frame will be dropped\n");
+	}
+
+	if (stream->queue_buffer)
+		stream->queue_buffer(stream, stream->frame_phase);
+
+	stream->frame_phase = 1 - stream->frame_phase;
+}
+
+static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
+{
+	struct v4l2_pix_format_mplane *pix = &stream->pix;
+
+	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
+	if (!stream->buffers[0])
+		goto err_buff_0;
+
+	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
+	if (!stream->buffers[1])
+		goto err_buff_1;
+
+	if (stream->queue_buffer) {
+		stream->queue_buffer(stream, 0);
+		stream->queue_buffer(stream, 1);
+	}
+
+	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
+	stream->dummy.vaddr =
+		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
+				&stream->dummy.buffer.buff_addr[0], GFP_KERNEL,
+				DMA_ATTR_NO_KERNEL_MAPPING);
+	if (!stream->dummy.vaddr)
+		goto err_dummy;
+
+	for (unsigned int i = 1; i < pix->num_planes; i++)
+		stream->dummy.buffer.buff_addr[i] =
+			stream->dummy.buffer.buff_addr[i - 1] +
+			pix->plane_fmt[i - 1].bytesperline * pix->height;
+
+	return 0;
+
+err_dummy:
+	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
+	stream->buffers[1] = NULL;
+
+err_buff_1:
+	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
+	stream->buffers[0] = NULL;
+err_buff_0:
+	return -EINVAL;
+}
+
+static void rkcif_stream_return_all_buffers(struct rkcif_stream *stream,
+					    enum vb2_buffer_state state)
+{
+	struct rkcif_buffer *buffer;
+
+	if (stream->buffers[0] && !stream->buffers[0]->is_dummy) {
+		rkcif_stream_return_buffer(stream->buffers[0], state);
+		stream->buffers[0] = NULL;
+	}
+
+	if (stream->buffers[1] && !stream->buffers[1]->is_dummy) {
+		rkcif_stream_return_buffer(stream->buffers[1], state);
+		stream->buffers[1] = NULL;
+	}
+
+	while ((buffer = rkcif_stream_pop_buffer(stream)))
+		rkcif_stream_return_buffer(buffer, state);
+
+	if (stream->dummy.vaddr) {
+		dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
+			       stream->dummy.vaddr,
+			       stream->dummy.buffer.buff_addr[0],
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		stream->dummy.vaddr = NULL;
+	}
+}
+
+static int rkcif_stream_setup_queue(struct vb2_queue *queue,
+				    unsigned int *num_buffers,
+				    unsigned int *num_planes,
+				    unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	struct rkcif_stream *stream = queue->drv_priv;
+	struct v4l2_pix_format_mplane *pix = &stream->pix;
+
+	if (*num_planes) {
+		if (*num_planes != pix->num_planes)
+			return -EINVAL;
+
+		for (unsigned int i = 0; i < pix->num_planes; i++)
+			if (sizes[i] < pix->plane_fmt[i].sizeimage)
+				return -EINVAL;
+	} else {
+		*num_planes = pix->num_planes;
+		for (unsigned int i = 0; i < pix->num_planes; i++)
+			sizes[i] = pix->plane_fmt[i].sizeimage;
+	}
+
+	return 0;
+}
+
+static int rkcif_stream_prepare_buffer(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkcif_buffer *buffer = to_rkcif_buffer(vbuf);
+	struct rkcif_stream *stream = vb->vb2_queue->drv_priv;
+	const struct rkcif_output_fmt *fmt;
+	struct v4l2_pix_format_mplane *pix = &stream->pix;
+	unsigned int i;
+
+	memset(buffer->buff_addr, 0, sizeof(buffer->buff_addr));
+	for (i = 0; i < pix->num_planes; i++)
+		buffer->buff_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
+
+	/* apply fallback for non-mplane formats, if required */
+	if (pix->num_planes == 1) {
+		fmt = rkcif_stream_find_output_fmt(stream, true,
+						   pix->pixelformat);
+		for (i = 1; i < fmt->cplanes; i++)
+			buffer->buff_addr[i] =
+				buffer->buff_addr[i - 1] +
+				pix->plane_fmt[i - 1].bytesperline *
+					pix->height;
+	}
+
+	for (i = 0; i < pix->num_planes; i++) {
+		unsigned long size = pix->plane_fmt[i].sizeimage;
+
+		if (vb2_plane_size(vb, i) < size) {
+			dev_err(stream->rkcif->dev,
+				"user buffer too small (%ld < %ld)\n",
+				vb2_plane_size(vb, i), size);
+			return -EINVAL;
+		}
+
+		vb2_set_plane_payload(vb, i, size);
+	}
+
+	vbuf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static void rkcif_stream_queue_buffer(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkcif_buffer *buffer = to_rkcif_buffer(vbuf);
+	struct rkcif_stream *stream = vb->vb2_queue->drv_priv;
+
+	rkcif_stream_push_buffer(stream, buffer);
+}
+
+static int rkcif_stream_start_streaming(struct vb2_queue *queue,
+					unsigned int count)
+{
+	struct rkcif_stream *stream = queue->drv_priv;
+	struct rkcif_device *rkcif = stream->rkcif;
+	u64 mask;
+	int ret;
+
+	stream->frame_idx = 0;
+	stream->frame_phase = 0;
+
+	ret = video_device_pipeline_start(&stream->vdev, &stream->pipeline);
+	if (ret) {
+		dev_err(rkcif->dev, "failed to start pipeline %d\n", ret);
+		goto err_out;
+	}
+
+	ret = pm_runtime_resume_and_get(rkcif->dev);
+	if (ret < 0) {
+		dev_err(rkcif->dev, "failed to get runtime pm, %d\n", ret);
+		goto err_pipeline_stop;
+	}
+
+	ret = rkcif_stream_init_buffers(stream);
+	if (ret)
+		goto err_runtime_put;
+
+	if (stream->start_streaming) {
+		ret = stream->start_streaming(stream);
+		if (ret < 0)
+			goto err_runtime_put;
+	}
+
+	mask = BIT_ULL(stream->id);
+	ret = v4l2_subdev_enable_streams(&stream->interface->sd,
+					 RKCIF_IF_PAD_SRC, mask);
+	if (ret < 0)
+		goto err_stop_stream;
+
+	return 0;
+
+err_stop_stream:
+	if (stream->stop_streaming)
+		stream->stop_streaming(stream);
+err_runtime_put:
+	pm_runtime_put(rkcif->dev);
+err_pipeline_stop:
+	video_device_pipeline_stop(&stream->vdev);
+err_out:
+	rkcif_stream_return_all_buffers(stream, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
+{
+	struct rkcif_stream *stream = queue->drv_priv;
+	struct rkcif_device *rkcif = stream->rkcif;
+	u64 mask;
+	int ret;
+
+	mask = BIT_ULL(stream->id);
+	v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC,
+				    mask);
+
+	stream->stopping = true;
+	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
+				 msecs_to_jiffies(1000));
+
+	if (!ret && stream->stop_streaming)
+		stream->stop_streaming(stream);
+
+	pm_runtime_put(rkcif->dev);
+
+	rkcif_stream_return_all_buffers(stream, VB2_BUF_STATE_ERROR);
+
+	video_device_pipeline_stop(&stream->vdev);
+}
+
+static const struct vb2_ops rkcif_stream_vb2_ops = {
+	.queue_setup = rkcif_stream_setup_queue,
+	.buf_prepare = rkcif_stream_prepare_buffer,
+	.buf_queue = rkcif_stream_queue_buffer,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.start_streaming = rkcif_stream_start_streaming,
+	.stop_streaming = rkcif_stream_stop_streaming,
+};
+
+static int rkcif_stream_fill_format(struct rkcif_stream *stream,
+				    struct v4l2_pix_format_mplane *pix)
+{
+	const struct rkcif_output_fmt *fmt;
+	u32 height, width;
+	int ret;
+
+	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
+	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
+	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
+	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
+	if (ret)
+		return ret;
+
+	pix->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static int rkcif_stream_try_format(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct rkcif_stream *stream = video_drvdata(file);
+	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
+
+	return rkcif_stream_fill_format(stream, pix);
+}
+
+static int rkcif_stream_set_format(struct file *file, void *priv,
+				   struct v4l2_format *f)
+{
+	struct rkcif_stream *stream = video_drvdata(file);
+	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
+	int ret;
+
+	if (vb2_is_busy(&stream->buf_queue))
+		return -EBUSY;
+
+	ret = rkcif_stream_try_format(file, priv, f);
+	if (ret)
+		return ret;
+
+	stream->pix = *pix;
+
+	return 0;
+}
+
+static int rkcif_stream_get_format(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct rkcif_stream *stream = video_drvdata(file);
+
+	f->fmt.pix_mp = stream->pix;
+
+	return 0;
+}
+
+static int rkcif_stream_enum_formats(struct file *file, void *priv,
+				     struct v4l2_fmtdesc *f)
+{
+	struct rkcif_stream *stream = video_drvdata(file);
+
+	if (f->index >= stream->out_fmts_num)
+		return -EINVAL;
+
+	f->pixelformat = stream->out_fmts[f->index].fourcc;
+
+	return 0;
+}
+
+static int rkcif_stream_enum_framesizes(struct file *file, void *fh,
+					struct v4l2_frmsizeenum *fsize)
+{
+	struct rkcif_stream *stream = video_drvdata(file);
+
+	if (fsize->index > 0)
+		return -EINVAL;
+
+	if (!rkcif_stream_find_output_fmt(stream, false, fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = CIF_MIN_WIDTH;
+	fsize->stepwise.max_width = CIF_MAX_WIDTH;
+	fsize->stepwise.step_width = 8;
+	fsize->stepwise.min_height = CIF_MIN_HEIGHT;
+	fsize->stepwise.max_height = CIF_MAX_HEIGHT;
+	fsize->stepwise.step_height = 8;
+
+	return 0;
+}
+
+static int rkcif_stream_querycap(struct file *file, void *priv,
+				 struct v4l2_capability *cap)
+{
+	struct rkcif_stream *stream = video_drvdata(file);
+	struct device *dev = stream->rkcif->dev;
+
+	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
+	strscpy(cap->card, dev->driver->name, sizeof(cap->card));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops rkcif_stream_ioctl_ops = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_try_fmt_vid_cap_mplane = rkcif_stream_try_format,
+	.vidioc_s_fmt_vid_cap_mplane = rkcif_stream_set_format,
+	.vidioc_g_fmt_vid_cap_mplane = rkcif_stream_get_format,
+	.vidioc_enum_fmt_vid_cap = rkcif_stream_enum_formats,
+	.vidioc_enum_framesizes = rkcif_stream_enum_framesizes,
+	.vidioc_querycap = rkcif_stream_querycap,
+};
+
+static int rkcif_stream_link_validate(struct media_link *link)
+{
+	struct video_device *vdev =
+		media_entity_to_video_device(link->sink->entity);
+	struct v4l2_mbus_framefmt *source_fmt;
+	struct v4l2_subdev *sd;
+	struct v4l2_subdev_state *state;
+	struct rkcif_stream *stream = to_rkcif_stream(vdev);
+	int ret = -EINVAL;
+
+	if (!media_entity_remote_source_pad_unique(link->sink->entity))
+		return -ENOTCONN;
+
+	sd = media_entity_to_v4l2_subdev(link->source->entity);
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	source_fmt = v4l2_subdev_state_get_format(state, link->source->index,
+						  stream->id);
+	if (!source_fmt)
+		goto out;
+
+	if (source_fmt->height != stream->pix.height ||
+	    source_fmt->width != stream->pix.width) {
+		dev_dbg(stream->rkcif->dev,
+			"link '%s':%u -> '%s':%u not valid: %ux%u != %ux%u\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			source_fmt->width, source_fmt->height,
+			stream->pix.width, stream->pix.height);
+		goto out;
+	}
+
+	ret = 0;
+
+out:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static const struct media_entity_operations rkcif_stream_media_ops = {
+	.link_validate = rkcif_stream_link_validate,
+};
+
+static const struct v4l2_file_operations rkcif_stream_file_ops = {
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+};
+
+static int rkcif_stream_init_vb2_queue(struct vb2_queue *q,
+				       struct rkcif_stream *stream)
+{
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->drv_priv = stream;
+	q->ops = &rkcif_stream_vb2_ops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->buf_struct_size = sizeof(struct rkcif_buffer);
+	q->min_queued_buffers = CIF_REQ_BUFS_MIN;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &stream->vlock;
+	q->dev = stream->rkcif->dev;
+
+	return vb2_queue_init(q);
+}
+
+int rkcif_stream_register(struct rkcif_device *rkcif,
+			  struct rkcif_stream *stream)
+{
+	struct rkcif_interface *interface = stream->interface;
+	struct v4l2_device *v4l2_dev = &rkcif->v4l2_dev;
+	struct video_device *vdev = &stream->vdev;
+	u32 link_flags = 0;
+	int ret;
+
+	stream->rkcif = rkcif;
+
+	INIT_LIST_HEAD(&stream->driver_queue);
+	spin_lock_init(&stream->driver_queue_lock);
+
+	init_waitqueue_head(&stream->wq_stopped);
+
+	mutex_init(&stream->vlock);
+
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING |
+			    V4L2_CAP_IO_MC;
+	vdev->entity.ops = &rkcif_stream_media_ops;
+	vdev->fops = &rkcif_stream_file_ops;
+	vdev->ioctl_ops = &rkcif_stream_ioctl_ops;
+	vdev->lock = &stream->vlock;
+	vdev->minor = -1;
+	vdev->release = video_device_release_empty;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->vfl_dir = VFL_DIR_RX;
+	video_set_drvdata(vdev, stream);
+
+	stream->pad.flags = MEDIA_PAD_FL_SINK;
+
+	stream->pix.height = CIF_MIN_HEIGHT;
+	stream->pix.width = CIF_MIN_WIDTH;
+	rkcif_stream_fill_format(stream, &stream->pix);
+
+	rkcif_stream_init_vb2_queue(&stream->buf_queue, stream);
+
+	vdev->queue = &stream->buf_queue;
+	if (interface->type == RKCIF_IF_DVP)
+		snprintf(vdev->name, sizeof(vdev->name), "rkcif-dvp0-id%d",
+			 stream->id);
+	else if (interface->type == RKCIF_IF_MIPI)
+		snprintf(vdev->name, sizeof(vdev->name), "rkcif-mipi%d-id%d",
+			 interface->index - RKCIF_MIPI_BASE, stream->id);
+
+	ret = media_entity_pads_init(&vdev->entity, 1, &stream->pad);
+	if (ret < 0) {
+		dev_err(rkcif->dev,
+			"failed to initialize stream media pad: %d\n", ret);
+		return ret;
+	}
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		dev_err(rkcif->dev, "failed to register video device: %d\n",
+			ret);
+		goto err_media_entity_cleanup;
+	}
+
+	/* enable only stream ID0 by default */
+	if (stream->id == RKCIF_ID0)
+		link_flags |= MEDIA_LNK_FL_ENABLED;
+
+	ret = media_create_pad_link(&interface->sd.entity, RKCIF_IF_PAD_SRC,
+				    &stream->vdev.entity, 0, link_flags);
+	if (ret) {
+		dev_err(rkcif->dev, "failed to link stream media pad: %d\n",
+			ret);
+		goto err_video_unregister;
+	}
+
+	v4l2_info(v4l2_dev, "registered %s as /dev/video%d\n", vdev->name,
+		  vdev->num);
+
+	return 0;
+
+err_video_unregister:
+	video_unregister_device(&stream->vdev);
+err_media_entity_cleanup:
+	media_entity_cleanup(&stream->vdev.entity);
+	return ret;
+}
+
+void rkcif_stream_unregister(struct rkcif_stream *stream)
+{
+	video_unregister_device(&stream->vdev);
+	media_entity_cleanup(&stream->vdev.entity);
+}
+
+const struct rkcif_output_fmt *
+rkcif_stream_find_output_fmt(struct rkcif_stream *stream, bool ret_def,
+			     u32 pixelfmt)
+{
+	const struct rkcif_output_fmt *fmt;
+
+	WARN_ON(stream->out_fmts_num == 0);
+
+	for (unsigned int i = 0; i < stream->out_fmts_num; i++) {
+		fmt = &stream->out_fmts[i];
+		if (fmt->fourcc == pixelfmt)
+			return fmt;
+	}
+
+	if (ret_def)
+		return &stream->out_fmts[0];
+	else
+		return NULL;
+}
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.h b/drivers/media/platform/rockchip/rkcif/rkcif-stream.h
new file mode 100644
index 000000000000..e50c9771f1b0
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Abstraction for the DMA part and the ping-pong scheme (a double-buffering
+ * mechanism) of the different CIF variants.
+ * Each stream is represented as V4L2 device whose corresponding media entity
+ * has one sink pad.
+ * The sink pad is connected to an instance of the INTERFACE/CROP abstraction
+ * in rkcif-interface.c.
+ *
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ */
+
+#ifndef _RKCIF_STREAM_H
+#define _RKCIF_STREAM_H
+
+#include "rkcif-common.h"
+
+void rkcif_stream_pingpong(struct rkcif_stream *stream);
+
+int rkcif_stream_register(struct rkcif_device *rkcif,
+			  struct rkcif_stream *stream);
+
+void rkcif_stream_unregister(struct rkcif_stream *stream);
+
+const struct rkcif_output_fmt *
+rkcif_stream_find_output_fmt(struct rkcif_stream *stream, bool ret_def,
+			     u32 pixelfmt);
+
+#endif

-- 
2.39.5



