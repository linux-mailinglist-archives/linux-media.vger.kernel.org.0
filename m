Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFFA1144E4
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 17:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbfLEQeJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 5 Dec 2019 11:34:09 -0500
Received: from plasma6.jpberlin.de ([80.241.56.68]:52707 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729047AbfLEQeE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 11:34:04 -0500
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
        by plasma.jpberlin.de (Postfix) with ESMTP id 27A3CBAC95;
        Thu,  5 Dec 2019 17:33:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([91.198.250.140])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id KJmBABq8Xpd0; Thu,  5 Dec 2019 17:33:40 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 0E934A5187;
        Thu,  5 Dec 2019 17:33:40 +0100 (CET)
Received: from MXS02.open-synergy.com ([fe80::7c10:5e76:68d5:f959]) by
 MXS01.open-synergy.com ([fe80::495b:2f07:c086:5db2%11]) with mapi id
 14.03.0468.000; Thu, 5 Dec 2019 17:33:39 +0100
From:   Dmitry Sepp <Dmitry.Sepp@opensynergy.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
        "kraxel@redhat.com" <kraxel@redhat.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "keiichiw@chromium.org" <keiichiw@chromium.org>,
        "acourbot@chromium.org" <acourbot@chromium.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "posciak@chromium.org" <posciak@chromium.org>,
        "marcheu@chromium.org" <marcheu@chromium.org>,
        "stevensd@chromium.org" <stevensd@chromium.org>,
        "dgreid@chromium.org" <dgreid@chromium.org>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "egranata@google.com" <egranata@google.com>
Subject: RE: [RFC] virtio video driver
Thread-Topic: [RFC] virtio video driver
Thread-Index: AQHVq4atbgjKurLfHkyUfILlhToFM6eru0sD
Date:   Thu, 5 Dec 2019 16:33:39 +0000
Message-ID: <616A957C6824E5468EC44010E4F1DA4801477DA25C@MXS02.open-synergy.com>
References: <4595464.3jghpSLKuc@os-lin-dmo>
In-Reply-To: <4595464.3jghpSLKuc@os-lin-dmo>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.25.255.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Kiran Pawar <kiran.pawar@opensynergy.com>

This adds a Virtio based video driver for video streaming device that
operates input and/or output data buffers to share video devices with
several guests. The current implementation consist of V4L2 based video
driver supporting video functions of decoder and encoder. This can be
extended for other functions e.g. processor, capture and output.
The device uses descriptor structures to advertise and negotiate stream
formats and controls. This allows the driver to modify the processing
logic of the device on a per stream basis.

Signed-off-by: Dmitry Sepp <Dmitry.Sepp@opensynergy.com>
Signed-off-by: Kiran Pawar <Kiran.Pawar@opensynergy.com>
Signed-off-by: Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
---
 drivers/media/Kconfig                      |    1 +
 drivers/media/Makefile                     |    2 +
 drivers/media/virtio/Kconfig               |   11 +
 drivers/media/virtio/Makefile              |   12 +
 drivers/media/virtio/virtio_video.h        |  372 +++++++
 drivers/media/virtio/virtio_video_caps.c   |  618 +++++++++++
 drivers/media/virtio/virtio_video_dec.c    |  947 +++++++++++++++++
 drivers/media/virtio/virtio_video_dec.h    |   30 +
 drivers/media/virtio/virtio_video_device.c |  747 +++++++++++++
 drivers/media/virtio/virtio_video_driver.c |  278 +++++
 drivers/media/virtio/virtio_video_enc.c    | 1124 ++++++++++++++++++++
 drivers/media/virtio/virtio_video_enc.h    |   30 +
 drivers/media/virtio/virtio_video_vq.c     |  950 +++++++++++++++++
 include/uapi/linux/virtio_ids.h            |    2 +
 include/uapi/linux/virtio_video.h          |  456 ++++++++
 15 files changed, 5580 insertions(+)
 create mode 100644 drivers/media/virtio/Kconfig
 create mode 100644 drivers/media/virtio/Makefile
 create mode 100644 drivers/media/virtio/virtio_video.h
 create mode 100644 drivers/media/virtio/virtio_video_caps.c
 create mode 100644 drivers/media/virtio/virtio_video_dec.c
 create mode 100644 drivers/media/virtio/virtio_video_dec.h
 create mode 100644 drivers/media/virtio/virtio_video_device.c
 create mode 100644 drivers/media/virtio/virtio_video_driver.c
 create mode 100644 drivers/media/virtio/virtio_video_enc.c
 create mode 100644 drivers/media/virtio/virtio_video_enc.h
 create mode 100644 drivers/media/virtio/virtio_video_vq.c
 create mode 100644 include/uapi/linux/virtio_video.h

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index b36a41332867..cc95806e8f8b 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -170,6 +170,7 @@ source "drivers/media/pci/Kconfig"
 source "drivers/media/platform/Kconfig"
 source "drivers/media/mmc/Kconfig"
 source "drivers/media/radio/Kconfig"
+source "drivers/media/virtio/Kconfig"
 
 comment "Supported FireWire (IEEE 1394) Adapters"
 	depends on DVB_CORE && FIREWIRE
diff --git a/drivers/media/Makefile b/drivers/media/Makefile
index f215f0a89f9e..9517a6f724d1 100644
--- a/drivers/media/Makefile
+++ b/drivers/media/Makefile
@@ -25,6 +25,8 @@ obj-y += rc/
 
 obj-$(CONFIG_CEC_CORE) += cec/
 
+obj-$(CONFIG_VIDEO_VIRTIO)  += virtio/
+
 #
 # Finally, merge the drivers that require the core
 #
diff --git a/drivers/media/virtio/Kconfig b/drivers/media/virtio/Kconfig
new file mode 100644
index 000000000000..3289bcf233f0
--- /dev/null
+++ b/drivers/media/virtio/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0+
+# Video driver for virtio
+
+config VIDEO_VIRTIO
+	tristate "Virtio video V4L2 driver"
+	depends on VIRTIO && VIDEO_DEV && VIDEO_V4L2
+	select VIDEOBUF2_DMA_SG
+	select V4L2_MEM2MEM_DEV
+	help
+          This is the virtual video driver for virtio.
+          Say Y or M.
diff --git a/drivers/media/virtio/Makefile b/drivers/media/virtio/Makefile
new file mode 100644
index 000000000000..6bc48fde57b4
--- /dev/null
+++ b/drivers/media/virtio/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+obj-$(CONFIG_VIDEO_VIRTIO) += virtio-video.o
+
+virtio-video-objs := \
+    virtio_video_driver.o \
+    virtio_video_vq.o \
+    virtio_video_device.o \
+    virtio_video_dec.o \
+    virtio_video_enc.o \
+    virtio_video_caps.o
+
diff --git a/drivers/media/virtio/virtio_video.h b/drivers/media/virtio/virtio_video.h
new file mode 100644
index 000000000000..23c77dc0cb93
--- /dev/null
+++ b/drivers/media/virtio/virtio_video.h
@@ -0,0 +1,372 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Common header for virtio video driver.
+ *
+ * Copyright 2019 OpenSynergy GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _VIRTIO_VIDEO_H
+#define _VIRTIO_VIDEO_H
+
+#include <linux/virtio.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_video.h>
+#include <linux/list.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ctrls.h>
+
+#define DRIVER_NAME "virtio-video"
+
+#ifndef VIRTIO_ID_VIDEO
+#define VIRTIO_ID_VIDEO 29
+#endif
+
+enum video_pin_type {
+	VIDEO_PIN_TYPE_INPUT = 0,
+	VIDEO_PIN_TYPE_OUTPUT,
+};
+
+enum video_params_scope {
+	VIDEO_PARAMS_SCOPE_STREAM = 0,
+	VIDEO_PARAMS_SCOPE_DEVICE,
+};
+
+#define MIN_BUFS_MIN 0
+#define MIN_BUFS_MAX 32
+#define MIN_BUFS_STEP 1
+#define MIN_BUFS_DEF 1
+
+struct video_frame_rate {
+	unsigned int min_rate;
+	unsigned int max_rate;
+	unsigned int step;
+};
+
+struct video_frame_size {
+	unsigned int min_width;
+	unsigned int max_width;
+	unsigned int step_width;
+	unsigned int min_height;
+	unsigned int max_height;
+	unsigned int step_height;
+	unsigned int num_rates;
+	struct video_frame_rate *frame_rates;
+};
+
+struct video_pix_format {
+	uint32_t fourcc_format;
+	unsigned int num_sizes;
+	struct video_frame_size *frame_sizes;
+};
+
+struct video_frame_format {
+	int pin_type; /* VIRTIO_VIDEO_PIN_ */
+	unsigned int num_formats;
+	struct video_pix_format *pix_formats;
+};
+
+struct video_control {
+	uint32_t control_type;
+	uint32_t step;
+	uint64_t min;
+	uint64_t max;
+	uint64_t def;
+};
+
+struct video_controls {
+	unsigned int num_controls;
+	struct video_control *control;
+};
+
+struct video_capability {
+	struct list_head caps_list_entry;
+	int cap_type; /* VIRTIO_VIDEO_CAP_ */
+	unsigned int cap_id;
+	union {
+		struct video_frame_format frame_format;
+		struct video_controls controls;
+	} u;
+};
+
+struct virtio_video;
+struct virtio_video_vbuffer;
+
+typedef void (*virtio_video_resp_cb)(struct virtio_video *vv,
+				     struct virtio_video_vbuffer *vbuf);
+
+struct virtio_video_vbuffer {
+	char *buf;
+	int size;
+
+	void *data_buf;
+	uint32_t data_size;
+
+	char *resp_buf;
+	int resp_size;
+
+	void *priv;
+	virtio_video_resp_cb resp_cb;
+
+	struct list_head list;
+};
+
+struct virtio_video_queue {
+	struct virtqueue *vq;
+	spinlock_t qlock;
+	wait_queue_head_t ack_queue;
+	struct work_struct dequeue_work;
+};
+
+struct virtio_video {
+	struct v4l2_device v4l2_dev;
+	int instance;
+
+	struct virtio_device *vdev;
+	struct virtio_video_queue ctrlq;
+	struct virtio_video_queue eventq;
+	wait_queue_head_t wq;
+	bool vq_ready;
+
+	struct kmem_cache *vbufs;
+
+	struct idr resource_idr;
+	spinlock_t resource_idr_lock;
+	struct idr stream_idr;
+	spinlock_t stream_idr_lock;
+
+	uint32_t num_devices;
+	uint32_t funcs_size;
+	bool got_funcs;
+
+	bool has_iommu;
+	struct list_head devices_list;
+
+	int debug;
+};
+
+struct video_plane_format {
+	uint32_t channel;
+	uint32_t plane_size;
+	uint32_t stride;
+	uint32_t padding;
+};
+
+struct video_format_info {
+	unsigned int frame_rate;
+	unsigned int frame_width;
+	unsigned int frame_height;
+	unsigned int min_buffers;
+	uint32_t fourcc_format;
+	uint32_t num_planes;
+	struct video_plane_format plane_format[VIRTIO_VIDEO_MAX_PLANES];
+	bool is_updated;
+};
+
+enum video_stream_state {
+	STREAM_STATE_IDLE = 0,
+	STREAM_STATE_INIT,
+	STREAM_STATE_METADATA, /* specific to decoder */
+	STREAM_STATE_RUNNING,
+	STREAM_STATE_DRAIN,
+	STREAM_STATE_STOPPED,
+	STREAM_STATE_RESET, /* specific to encoder */
+};
+
+struct virtio_video_device {
+	struct virtio_video *vv;
+	struct video_device video_dev;
+	struct mutex video_dev_mutex;
+
+	struct v4l2_m2m_dev *m2m_dev;
+
+	struct workqueue_struct *workqueue;
+
+	struct list_head devices_list_entry;
+	/* VIRTIO_VIDEO_FUNC_ */
+	int type;
+	unsigned int id;
+	/* List of control capabilities */
+	struct list_head ctrl_caps_list;
+	/* List of frame formats capabilities */
+	struct list_head fmt_caps_list;
+
+	/* The following 2 arrays contain pointers to pixel formats that are
+	 * stored in 'fmt_caps_list' (as a part of the 'video_frame_format'
+	 * structure). They are necessary to simplify indexing
+	 * through pixel formats in the implementation of ENUM_FMT callbacks
+	 */
+
+	/* Array of pointers to pixel formats of CAPTURE pin */
+	unsigned int num_capture_formats;
+	struct video_pix_format **capture_fmts;
+
+	/* Array of pointers to pixel formats of OUTPUT pin */
+	unsigned int num_output_formats;
+	struct video_pix_format **output_fmts;
+
+	struct video_format_info in_info;
+	struct video_format_info out_info;
+};
+
+int virtio_video_alloc_vbufs(struct virtio_video *vv);
+void virtio_video_free_vbufs(struct virtio_video *vv);
+int virtio_video_alloc_events(struct virtio_video *vv, size_t num);
+
+int virtio_video_devices_init(struct virtio_video *vv, void *funcs_buf);
+void virtio_video_devices_deinit(struct virtio_video *vv);
+
+struct virtio_video_stream {
+	uint32_t stream_id;
+	enum video_stream_state state;
+	struct video_device *video_dev;
+	struct v4l2_fh fh;
+	struct mutex vq_mutex;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct video_format_info in_info;
+	struct video_format_info out_info;
+	bool src_cleared;
+	bool dst_cleared;
+	bool mark_last_buffer_pending;
+	bool check_drain_sequence_pending;
+	struct work_struct work;
+	struct video_frame_size *current_frame_size;
+};
+
+struct virtio_video_buffer {
+	struct v4l2_m2m_buffer v4l2_m2m_vb;
+	uint32_t resource_id;
+	bool detached;
+	bool queued;
+};
+
+static inline struct virtio_video_device *
+to_virtio_vd(struct video_device *video_dev)
+{
+	return container_of(video_dev, struct virtio_video_device,
+			 video_dev);
+}
+
+static inline struct virtio_video_stream *file2stream(struct file *file)
+{
+	return container_of(file->private_data, struct virtio_video_stream, fh);
+}
+
+static inline struct virtio_video_stream *ctrl2stream(struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct virtio_video_stream,
+			    ctrl_handler);
+}
+
+static inline struct virtio_video_stream *work2stream(struct work_struct *work)
+{
+	return container_of(work, struct virtio_video_stream, work);
+}
+
+static inline struct virtio_video_buffer *to_virtio_vb(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_vb = to_vb2_v4l2_buffer(vb);
+
+	return container_of(v4l2_vb, struct virtio_video_buffer,
+			    v4l2_m2m_vb.vb);
+}
+
+void virtio_video_stream_id_get(struct virtio_video *vv,
+				struct virtio_video_stream *stream,
+				uint32_t *id);
+void virtio_video_stream_id_put(struct virtio_video *vv, uint32_t id);
+void virtio_video_resource_id_get(struct virtio_video *vv, uint32_t *id);
+void virtio_video_resource_id_put(struct virtio_video *vv, uint32_t id);
+
+int virtio_video_req_stream_create(struct virtio_video *vv,
+				   uint32_t function_id, uint32_t stream_id,
+				   const char *name);
+int virtio_video_req_stream_destroy(struct virtio_video *vv,
+				    uint32_t function_id, uint32_t stream_id);
+int virtio_video_req_stream_start(struct virtio_video *vv,
+				  uint32_t function_id, uint32_t stream_id);
+int virtio_video_req_stream_stop(struct virtio_video *vv,
+				 uint32_t function_id,
+				 struct virtio_video_stream *stream);
+int virtio_video_req_stream_drain(struct virtio_video *vv,
+				  uint32_t function_id, uint32_t stream_id);
+int virtio_video_req_resource_create(struct virtio_video *vv,
+				     uint32_t function_id, uint32_t stream_id,
+				     uint32_t resource_id);
+int virtio_video_req_resource_destroy(struct virtio_video *vv,
+				      uint32_t function_id, uint32_t stream_id,
+				      uint32_t resource_id);
+int virtio_video_req_resource_queue(struct virtio_video *vv,
+				uint32_t function_id, uint32_t stream_id,
+				struct virtio_video_buffer *virtio_vb,
+				uint32_t data_size[],
+				uint8_t num_data_size, bool is_in);
+int virtio_video_req_queue_clear(struct virtio_video *vv, uint32_t function_id,
+				 struct virtio_video_stream *stream,
+				 bool is_in);
+int
+virtio_video_req_resource_attach_backing(struct virtio_video *vv,
+					 uint32_t function_id,
+					 uint32_t stream_id,
+					 uint32_t resource_id,
+					 struct virtio_video_mem_entry *ents,
+					 uint32_t nents);
+int
+virtio_video_req_resource_detach_backing(struct virtio_video *vv,
+					 uint32_t function_id,
+					 uint32_t stream_id,
+					 struct virtio_video_buffer *virtio_vb);
+int virtio_video_req_funcs(struct virtio_video *vv, void *resp_buf,
+			   size_t resp_size);
+int virtio_video_req_set_params(struct virtio_video *vv, uint32_t function_id,
+					struct video_format_info *format_info,
+					enum video_pin_type pin_type,
+					enum video_params_scope scope,
+					struct virtio_video_stream *stream);
+int virtio_video_req_get_params(struct virtio_video *vv, uint32_t function_id,
+					enum video_pin_type pin_type,
+					enum video_params_scope scope,
+					struct virtio_video_stream *stream);
+int virtio_video_req_set_control(struct virtio_video *vv,
+				 uint32_t function_id, uint32_t stream_id,
+				 uint32_t control, uint32_t val);
+
+void virtio_video_queue_res_chg_event(struct virtio_video_stream *stream);
+void virtio_video_queue_eos_event(struct virtio_video_stream *stream);
+void virtio_video_ctrl_ack(struct virtqueue *vq);
+void virtio_video_event_ack(struct virtqueue *vq);
+void virtio_video_dequeue_ctrl_func(struct work_struct *work);
+void virtio_video_dequeue_event_func(struct work_struct *work);
+void virtio_video_buf_done(struct virtio_video_buffer *virtio_vb,
+			   uint32_t flags, uint64_t timestamp, uint32_t size);
+void virtio_video_mark_drain_complete(struct virtio_video_stream *stream,
+				      struct vb2_v4l2_buffer *v4l2_vb);
+
+void virtio_video_free_caps_list(struct list_head *caps_list);
+size_t virtio_video_parse_virtio_function(void *func_buf,
+					  struct virtio_video_device *vvd);
+void virtio_video_clean_virtio_function(struct virtio_video_device *vvd);
+
+uint32_t virtio_video_format_to_v4l2(uint32_t pixel_format);
+uint32_t virtio_video_v4l2_fourcc_to_virtio(uint32_t fourcc);
+uint32_t virtio_video_control_to_v4l2(uint32_t control_type);
+uint32_t virtio_video_profile_to_v4l2(uint32_t profile);
+uint32_t virtio_video_level_to_v4l2(uint32_t level);
+uint32_t virtio_video_v4l2_control_to_virtio(uint32_t v4l2_control);
+uint32_t virtio_video_v4l2_profile_to_virtio(uint32_t v4l2_profile);
+uint32_t virtio_video_v4l2_level_to_virtio(uint32_t v4l2_level);
+
+#endif /* _VIRTIO_VIDEO_H */
diff --git a/drivers/media/virtio/virtio_video_caps.c b/drivers/media/virtio/virtio_video_caps.c
new file mode 100644
index 000000000000..19b025805570
--- /dev/null
+++ b/drivers/media/virtio/virtio_video_caps.c
@@ -0,0 +1,618 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Driver for virtio video device.
+ *
+ * Copyright 2019 OpenSynergy GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-sg.h>
+
+#include "virtio_video.h"
+
+static void pix_format_free(struct video_pix_format *pix_fmt)
+{
+	int size_idx = 0;
+
+	if (!pix_fmt)
+		return;
+
+	for (size_idx = 0; size_idx < pix_fmt->num_sizes; size_idx++)
+		kfree(pix_fmt->frame_sizes[size_idx].frame_rates);
+	kfree(pix_fmt->frame_sizes);
+}
+
+static void fmt_capability_free(struct video_frame_format *frame_fmt)
+{
+	int fmt_idx = 0;
+
+	if (!frame_fmt)
+		return;
+
+	for (fmt_idx = 0; fmt_idx < frame_fmt->num_formats; fmt_idx++)
+		pix_format_free(&frame_fmt->pix_formats[fmt_idx]);
+	kfree(frame_fmt->pix_formats);
+}
+
+static void ctrl_capability_free(struct video_controls *controls)
+{
+	if (!controls)
+		return;
+
+	kfree(controls->control);
+}
+
+static void capability_free(struct video_capability *cap)
+{
+	if (!cap)
+		return;
+
+	switch (cap->cap_type) {
+	case VIRTIO_VIDEO_CAP_CONTROL:
+		ctrl_capability_free(&cap->u.controls);
+		break;
+	case VIRTIO_VIDEO_CAP_PIN_FORMATS:
+		fmt_capability_free(&cap->u.frame_format);
+		break;
+	default:
+		return;
+	}
+	kfree(cap);
+}
+
+static size_t parse_virtio_frame_rate(struct video_frame_rate *frame_rate,
+				      void *frame_rate_buf,
+				      struct virtio_video_device *vvd)
+{
+	struct virtio_video *vv = NULL;
+	struct virtio_video_frame_rate *virtio_frame_rate = NULL;
+	size_t frame_rate_size = sizeof(struct virtio_video_frame_rate);
+
+	if (!frame_rate || !frame_rate_buf || !vvd)
+		return 0;
+
+	vv = vvd->vv;
+	virtio_frame_rate = frame_rate_buf;
+
+	if (le32_to_cpu(virtio_frame_rate->desc.type) !=
+	    VIRTIO_VIDEO_DESC_FRAME_RATE) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to read frame rate descriptor\n");
+		return 0;
+	}
+
+	frame_rate->min_rate = le32_to_cpu(virtio_frame_rate->min_rate);
+	frame_rate->max_rate = le32_to_cpu(virtio_frame_rate->max_rate);
+	frame_rate->step = le32_to_cpu(virtio_frame_rate->step);
+
+	return frame_rate_size;
+}
+
+static size_t parse_virtio_frame_size(struct video_frame_size *frame_size,
+				      void *frame_size_buf,
+				      struct virtio_video_device *vvd)
+{
+	struct virtio_video *vv = NULL;
+	size_t frame_size_size = 0;
+	struct virtio_video_frame_size *virtio_frame_size = NULL;
+	int rate_idx = 0;
+	size_t offset = sizeof(struct virtio_video_frame_size);
+
+	if (!frame_size || !frame_size_buf || !vvd)
+		return 0;
+
+	vv = vvd->vv;
+	virtio_frame_size = frame_size_buf;
+
+	if (le32_to_cpu(virtio_frame_size->desc.type) !=
+	    VIRTIO_VIDEO_DESC_FRAME_SIZE) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to read frame size descriptor\n");
+		return 0;
+	}
+
+	frame_size->min_height = le32_to_cpu(virtio_frame_size->min_height);
+	frame_size->max_height = le32_to_cpu(virtio_frame_size->max_height);
+	frame_size->step_height = le32_to_cpu(virtio_frame_size->step_height);
+	frame_size->min_width = le32_to_cpu(virtio_frame_size->min_width);
+	frame_size->max_width = le32_to_cpu(virtio_frame_size->max_width);
+	frame_size->step_width = le32_to_cpu(virtio_frame_size->step_width);
+	frame_size->num_rates = le32_to_cpu(virtio_frame_size->num_rates);
+
+	frame_size->frame_rates = kcalloc(frame_size->num_rates,
+					  sizeof(struct video_frame_rate),
+					  GFP_KERNEL);
+	if (!frame_size->frame_rates) {
+		v4l2_err(&vv->v4l2_dev, "failed to alloc frame rates\n");
+		return 0;
+	}
+
+	for (rate_idx = 0; rate_idx < frame_size->num_rates; rate_idx++) {
+		struct video_frame_rate *frame_rate =
+			&frame_size->frame_rates[rate_idx];
+		size_t rate_size = 0;
+
+		rate_size = parse_virtio_frame_rate(frame_rate,
+						    frame_size_buf + offset,
+						    vvd);
+		if (rate_size == 0) {
+			v4l2_err(&vv->v4l2_dev, "failed to parse frame rate\n");
+			kfree(frame_size->frame_rates);
+			return 0;
+		}
+		offset += rate_size;
+	}
+
+	frame_size_size = offset;
+
+	return frame_size_size;
+}
+
+static size_t parse_virtio_pix_fmt(struct video_pix_format *pix_fmt,
+				   void *pix_buf,
+				   struct virtio_video_device *vvd)
+{
+	struct virtio_video *vv = NULL;
+	size_t pix_fmt_size = 0;
+	struct virtio_video_pix_format *virtio_pix_fmt = NULL;
+	int size_idx = 0;
+	size_t offset = sizeof(struct virtio_video_pix_format);
+
+	if (!pix_fmt || !pix_buf || !vvd)
+		return 0;
+
+	vv = vvd->vv;
+	virtio_pix_fmt = pix_buf;
+
+	if (le32_to_cpu(virtio_pix_fmt->desc.type) !=
+	    VIRTIO_VIDEO_DESC_PIX_FORMAT) {
+		v4l2_err(&vv->v4l2_dev, "failed to read pix fmt descriptor\n");
+		return 0;
+	}
+
+	pix_fmt->fourcc_format =
+			virtio_video_format_to_v4l2(
+				le32_to_cpu(virtio_pix_fmt->pixel_format));
+	pix_fmt->num_sizes = le32_to_cpu(virtio_pix_fmt->num_sizes);
+
+	pix_fmt->frame_sizes = kcalloc(pix_fmt->num_sizes,
+				       sizeof(struct video_frame_size),
+				       GFP_KERNEL);
+	if (!pix_fmt->frame_sizes) {
+		v4l2_err(&vv->v4l2_dev, "failed to alloc frame sizes\n");
+		return 0;
+	}
+
+	for (size_idx = 0; size_idx < pix_fmt->num_sizes; size_idx++) {
+		struct video_frame_size *frame_size = NULL;
+		size_t size_size = 0;
+
+		frame_size = &pix_fmt->frame_sizes[size_idx];
+		size_size = parse_virtio_frame_size(frame_size,
+						    pix_buf + offset, vvd);
+		if (size_size == 0) {
+			v4l2_err(&vv->v4l2_dev, "failed to parse frame size\n");
+			kfree(pix_fmt->frame_sizes);
+			return 0;
+		}
+		offset += size_size;
+	}
+
+	pix_fmt_size = offset;
+
+	return pix_fmt_size;
+}
+
+static size_t parse_virtio_fmts_cap(struct video_frame_format *frame_fmt,
+				    void *cap_buf,
+				    struct virtio_video_device *vvd)
+{
+	struct virtio_video *vv = NULL;
+	size_t fmts_size = 0;
+	struct virtio_video_frame_format *virtio_fmt = NULL;
+	int fmt_idx = 0;
+	size_t offset = sizeof(struct virtio_video_frame_format);
+	struct virtio_video_capability dummy;
+
+	if (!frame_fmt || !cap_buf || !vvd)
+		return 0;
+
+	vv = vvd->vv;
+	virtio_fmt = cap_buf;
+
+	frame_fmt->pin_type = le32_to_cpu(virtio_fmt->pin_type);
+	frame_fmt->num_formats = le32_to_cpu(virtio_fmt->num_formats);
+
+	frame_fmt->pix_formats = kcalloc(frame_fmt->num_formats,
+					 sizeof(struct video_pix_format),
+					 GFP_KERNEL);
+	if (!frame_fmt->pix_formats) {
+		v4l2_err(&vv->v4l2_dev, "failed to alloc pix formats\n");
+		return 0;
+	}
+
+	for (fmt_idx = 0; fmt_idx < frame_fmt->num_formats; fmt_idx++) {
+		struct video_pix_format *pix_fmt = NULL;
+		size_t fmt_size = 0;
+
+		pix_fmt = &frame_fmt->pix_formats[fmt_idx];
+		fmt_size = parse_virtio_pix_fmt(pix_fmt, cap_buf + offset, vvd);
+		if (fmt_size == 0) {
+			v4l2_err(&vv->v4l2_dev,
+				 "failed to parse pixel format\n");
+			fmt_capability_free(frame_fmt);
+			return 0;
+		}
+		offset += fmt_size;
+	}
+
+	switch (frame_fmt->pin_type) {
+	case VIRTIO_VIDEO_PIN_INPUT:
+		vvd->num_output_formats += frame_fmt->num_formats;
+		break;
+	case VIRTIO_VIDEO_PIN_OUTPUT:
+		vvd->num_capture_formats += frame_fmt->num_formats;
+		break;
+	default:
+		v4l2_err(&vv->v4l2_dev, "failed to parse a pin type\n");
+		return 0;
+	}
+
+	fmts_size = offset - sizeof(dummy.u);
+
+	return fmts_size;
+}
+
+static size_t parse_virtio_ctrl(struct video_control *control,
+				void *control_buf,
+				struct virtio_video_device *vvd)
+{
+	struct virtio_video *vv = NULL;
+	struct virtio_video_control *virtio_control = NULL;
+	size_t control_size = sizeof(struct virtio_video_control);
+
+	if (!control || !control_buf || !vvd)
+		return 0;
+
+	vv = vvd->vv;
+	virtio_control = control_buf;
+
+	if (le32_to_cpu(virtio_control->desc.type) !=
+	    VIRTIO_VIDEO_DESC_CONTROL) {
+		v4l2_err(&vv->v4l2_dev, "failed to read control descriptor\n");
+		return 0;
+	}
+
+	control->control_type =
+		virtio_video_control_to_v4l2
+		(le32_to_cpu(virtio_control->control_type));
+
+	switch (control->control_type) {
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		control->min =
+			virtio_video_profile_to_v4l2
+			(le64_to_cpu(virtio_control->min));
+		control->max =
+			virtio_video_profile_to_v4l2
+			(le64_to_cpu(virtio_control->max));
+		control->step =
+			virtio_video_profile_to_v4l2
+			(le32_to_cpu(virtio_control->step));
+		control->def =
+			virtio_video_profile_to_v4l2
+			(le64_to_cpu(virtio_control->def));
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		control->min =
+			virtio_video_level_to_v4l2
+			(le64_to_cpu(virtio_control->min));
+		control->max =
+			virtio_video_level_to_v4l2
+			(le64_to_cpu(virtio_control->max));
+		control->step =
+			virtio_video_level_to_v4l2
+			(le32_to_cpu(virtio_control->step));
+		control->def =
+			virtio_video_level_to_v4l2
+			(le64_to_cpu(virtio_control->def));
+		break;
+	default:
+		control->min = le64_to_cpu(virtio_control->min);
+		control->max = le64_to_cpu(virtio_control->max);
+		control->step = le32_to_cpu(virtio_control->step);
+		control->def = le64_to_cpu(virtio_control->def);
+		break;
+	}
+
+	return control_size;
+}
+
+static size_t parse_virtio_ctrls_cap(struct video_controls *controls,
+				     void *cap_buf,
+				     struct virtio_video_device *vvd)
+{
+	struct virtio_video_controls *virtio_controls = NULL;
+	struct virtio_video *vv = NULL;
+	size_t ctrls_size = 0;
+	int ctrl_idx = 0;
+	size_t offset = sizeof(struct virtio_video_controls);
+	struct virtio_video_capability dummy;
+
+	if (!controls || !cap_buf || !vvd)
+		return 0;
+
+	vv = vvd->vv;
+	virtio_controls = cap_buf;
+
+	controls->num_controls = le32_to_cpu(virtio_controls->num_controls);
+	controls->control = kcalloc(controls->num_controls,
+				    sizeof(struct video_control),
+				    GFP_KERNEL);
+	if (!controls->control) {
+		v4l2_err(&vv->v4l2_dev, "failed to alloc controls\n");
+		return 0;
+	}
+
+	for (ctrl_idx = 0; ctrl_idx < controls->num_controls; ctrl_idx++) {
+		struct video_control *ctrl = NULL;
+		size_t ctrl_size = 0;
+
+		ctrl = &controls->control[ctrl_idx];
+		ctrl_size = parse_virtio_ctrl(ctrl, cap_buf + offset, vvd);
+		if (ctrl_size == 0) {
+			v4l2_err(&vv->v4l2_dev, "failed to parse control\n");
+			ctrl_capability_free(controls);
+			return 0;
+		}
+		offset += ctrl_size;
+	}
+
+	ctrls_size = offset - sizeof(dummy.u);
+
+	return ctrls_size;
+}
+
+static size_t parse_virtio_capability(struct video_capability *cap,
+				      void *cap_buf,
+				      struct virtio_video_device *vvd)
+{
+	struct virtio_video *vv = NULL;
+	struct virtio_video_capability *virtio_cap = NULL;
+	size_t offset = 0;
+	size_t extra_size = 0;
+	size_t cap_size = 0;
+
+	if (!cap || !cap_buf || !vvd)
+		return 0;
+
+	vv = vvd->vv;
+	virtio_cap = cap_buf;
+	offset = sizeof(struct virtio_video_capability) - sizeof(virtio_cap->u);
+
+	if (le32_to_cpu(virtio_cap->desc.type) != VIRTIO_VIDEO_DESC_CAP) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to read capability descriptor\n");
+		return 0;
+	}
+
+	cap->cap_id = le32_to_cpu(virtio_cap->cap_id);
+	cap->cap_type = le32_to_cpu(virtio_cap->cap_type);
+
+	switch (cap->cap_type) {
+	case VIRTIO_VIDEO_CAP_CONTROL:
+		extra_size = parse_virtio_ctrls_cap(&cap->u.controls,
+						   cap_buf + offset, vvd);
+		if (extra_size == 0) {
+			v4l2_err(&vv->v4l2_dev, "failed to parse ctrl cap\n");
+			return 0;
+		}
+		break;
+	case VIRTIO_VIDEO_CAP_PIN_FORMATS:
+		extra_size = parse_virtio_fmts_cap(&cap->u.frame_format,
+						   cap_buf + offset, vvd);
+		if (extra_size == 0) {
+			v4l2_err(&vv->v4l2_dev, "failed to parse fmts cap\n");
+			return 0;
+		}
+		break;
+	default:
+		v4l2_err(&vv->v4l2_dev, "undefined capability type\n");
+		return 0;
+	}
+
+	if (extra_size < 0)
+		extra_size = 0;
+
+	cap_size = sizeof(struct virtio_video_capability) + extra_size;
+
+	return cap_size;
+
+}
+
+void virtio_video_free_caps_list(struct list_head *caps_list)
+{
+	struct video_capability *cap = NULL;
+	struct video_capability *tmp = NULL;
+
+	list_for_each_entry_safe(cap, tmp, caps_list, caps_list_entry) {
+		list_del(&cap->caps_list_entry);
+		capability_free(cap);
+	}
+
+}
+
+static int virtio_video_copy_params(struct video_format_info *dst,
+				   const struct virtio_video_params *src)
+{
+	if (!dst || !src)
+		return -EINVAL;
+
+	dst->fourcc_format =
+			virtio_video_format_to_v4l2(
+				le32_to_cpu(src->pixel_format));
+	dst->frame_height = le32_to_cpu(src->frame_height);
+	dst->frame_width = le32_to_cpu(src->frame_width);
+	dst->frame_rate = le32_to_cpu(src->frame_rate);
+	dst->min_buffers = le32_to_cpu(src->min_buffers);
+	return 0;
+}
+
+size_t virtio_video_parse_virtio_function(void *func_buf,
+					  struct virtio_video_device *vvd)
+{
+	struct virtio_video *vv = NULL;
+	size_t func_size = 0;
+	struct virtio_video_function *virtio_func = NULL;
+	uint32_t num_caps = 0;
+	int cap_idx = 0;
+	size_t offset = sizeof(struct virtio_video_function);
+	struct video_capability *cap = NULL;
+	int capture_idx = 0;
+	int output_idx = 0;
+	int ret = 0;
+
+	if (!func_buf || !vvd)
+		return 0;
+
+	vv = vvd->vv;
+	virtio_func = func_buf;
+
+	if (le32_to_cpu(virtio_func->desc.type) != VIRTIO_VIDEO_DESC_FUNC) {
+		v4l2_err(&vv->v4l2_dev, "failed to read function descriptor\n");
+		return 0;
+	}
+
+	vvd->id = le32_to_cpu(virtio_func->function_id);
+	vvd->type = le32_to_cpu(virtio_func->function_type);
+
+	if (le32_to_cpu(virtio_func->in_params.desc.type) !=
+	    VIRTIO_VIDEO_DESC_PARAMS) {
+		v4l2_err(&vv->v4l2_dev, "failed to read function params\n");
+		return 0;
+	}
+
+	ret = virtio_video_copy_params(&vvd->in_info,
+					 &virtio_func->in_params);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to read 'in' params\n");
+		return 0;
+	}
+
+	if (le32_to_cpu(virtio_func->out_params.desc.type) !=
+	    VIRTIO_VIDEO_DESC_PARAMS) {
+		v4l2_err(&vv->v4l2_dev, "failed to read function params\n");
+		return 0;
+	}
+
+	ret = virtio_video_copy_params(&vvd->out_info,
+					 &virtio_func->out_params);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to read 'out' params\n");
+		return 0;
+	}
+
+	num_caps = le32_to_cpu(virtio_func->num_caps);
+
+	for (cap_idx = 0; cap_idx < num_caps; cap_idx++) {
+		size_t cap_size = 0;
+
+		cap = kzalloc(sizeof(*cap), GFP_KERNEL);
+
+		if (!cap) {
+			virtio_video_free_caps_list(&vvd->ctrl_caps_list);
+			virtio_video_free_caps_list(&vvd->fmt_caps_list);
+			return 0;
+		}
+
+		cap_size = parse_virtio_capability(cap, func_buf + offset, vvd);
+		if (cap_size == 0) {
+			v4l2_err(&vv->v4l2_dev,
+				 "failed to parse a capability\n");
+			virtio_video_free_caps_list(&vvd->ctrl_caps_list);
+			virtio_video_free_caps_list(&vvd->fmt_caps_list);
+			kfree(cap);
+			return 0;
+		}
+		offset += cap_size;
+
+		switch (cap->cap_type) {
+		case VIRTIO_VIDEO_CAP_PIN_FORMATS:
+			list_add(&cap->caps_list_entry, &vvd->fmt_caps_list);
+			break;
+		case VIRTIO_VIDEO_CAP_CONTROL:
+			list_add(&cap->caps_list_entry, &vvd->ctrl_caps_list);
+			break;
+		default:
+			virtio_video_free_caps_list(&vvd->ctrl_caps_list);
+			virtio_video_free_caps_list(&vvd->fmt_caps_list);
+			capability_free(cap);
+			break;
+		}
+	}
+
+	vvd->capture_fmts = kcalloc(vvd->num_capture_formats,
+				    sizeof(struct video_capability *),
+				    GFP_KERNEL);
+	vvd->output_fmts = kcalloc(vvd->num_output_formats,
+				   sizeof(struct video_capability *),
+				   GFP_KERNEL);
+	if (!vvd->capture_fmts || !vvd->output_fmts) {
+		v4l2_err(&vv->v4l2_dev, "failed to alloc capability arrays\n");
+		virtio_video_free_caps_list(&vvd->ctrl_caps_list);
+		virtio_video_free_caps_list(&vvd->fmt_caps_list);
+	}
+
+	cap = NULL;
+	list_for_each_entry(cap, &vvd->fmt_caps_list, caps_list_entry) {
+		struct video_frame_format *frame_fmt = &cap->u.frame_format;
+		int pix_idx = 0;
+
+		switch (le32_to_cpu(frame_fmt->pin_type)) {
+		case VIRTIO_VIDEO_PIN_INPUT:
+			for (pix_idx = 0; pix_idx < frame_fmt->num_formats;
+			     pix_idx++) {
+				vvd->output_fmts[pix_idx + output_idx] =
+					&frame_fmt->pix_formats[pix_idx];
+			}
+			output_idx += pix_idx;
+			break;
+		case VIRTIO_VIDEO_PIN_OUTPUT:
+			for (pix_idx = 0; pix_idx < frame_fmt->num_formats;
+			     pix_idx++) {
+				vvd->capture_fmts[pix_idx + capture_idx] =
+					&frame_fmt->pix_formats[pix_idx];
+			}
+			capture_idx += pix_idx;
+			break;
+		default:
+			v4l2_err(&vv->v4l2_dev, "failed to parse a pin type\n");
+			return 0;
+		}
+	}
+
+	func_size = offset;
+	return func_size;
+}
+
+void virtio_video_clean_virtio_function(struct virtio_video_device *vvd)
+{
+	if (!vvd)
+		return;
+
+	kfree(vvd->capture_fmts);
+	kfree(vvd->output_fmts);
+	virtio_video_free_caps_list(&vvd->ctrl_caps_list);
+	virtio_video_free_caps_list(&vvd->fmt_caps_list);
+}
diff --git a/drivers/media/virtio/virtio_video_dec.c b/drivers/media/virtio/virtio_video_dec.c
new file mode 100644
index 000000000000..c2ad62229d21
--- /dev/null
+++ b/drivers/media/virtio/virtio_video_dec.c
@@ -0,0 +1,947 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Decoder for virtio video device.
+ *
+ * Copyright 2019 OpenSynergy GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-sg.h>
+
+#include "virtio_video.h"
+
+static int virtio_video_queue_setup(struct vb2_queue *vq,
+				    unsigned int *num_buffers,
+				    unsigned int *num_planes,
+				    unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	int i;
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
+	struct video_format_info *p_info;
+
+	if (*num_planes)
+		return 0;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		p_info = &stream->in_info;
+	else
+		p_info = &stream->out_info;
+
+	*num_planes = p_info->num_planes;
+
+	for (i = 0; i < p_info->num_planes; i++)
+		sizes[i] = p_info->plane_format[i].plane_size;
+
+	return 0;
+}
+
+static int virtio_video_buf_plane_init(uint32_t idx,
+				       uint32_t resource_id,
+				       struct virtio_video_device *vvd,
+				       struct virtio_video_stream *stream,
+				       struct vb2_buffer *vb)
+{
+	int ret;
+	unsigned int i;
+	struct virtio_video *vv = vvd->vv;
+	struct scatterlist *sg;
+	struct virtio_video_mem_entry *ents;
+	struct sg_table *sgt = vb2_dma_sg_plane_desc(vb, idx);
+
+	/* Freed when the request has been completed */
+	ents = kcalloc(sgt->nents, sizeof(*ents), GFP_KERNEL);
+	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+		ents[i].addr = cpu_to_le64(vv->has_iommu
+					   ? sg_dma_address(sg)
+					   : sg_phys(sg));
+		ents[i].length = cpu_to_le32(sg->length);
+	}
+
+	v4l2_dbg(1, vv->debug, &vv->v4l2_dev, "mem entries:\n");
+	if (vv->debug >= 1) {
+		for (i = 0; i < sgt->nents; i++)
+			pr_debug("\t%03i: addr=%llx length=%u\n", i,
+				 ents[i].addr, ents[i].length);
+	}
+
+	ret = virtio_video_req_resource_attach_backing(vv, vvd->id,
+						       stream->stream_id,
+						       resource_id, ents,
+						       sgt->nents);
+	if (ret)
+		kfree(ents);
+
+	return ret;
+}
+
+static int virtio_video_buf_init(struct vb2_buffer *vb)
+{
+	int ret = 0;
+	unsigned int i;
+	uint32_t resource_id;
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct virtio_video_buffer *virtio_vb = to_virtio_vb(vb);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+
+	virtio_video_resource_id_get(vv, &resource_id);
+	ret = virtio_video_req_resource_create(vv, vvd->id, stream->stream_id,
+					       resource_id);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < vb->num_planes; ++i) {
+		ret = virtio_video_buf_plane_init(i,
+				resource_id, vvd, stream, vb);
+		if (ret)
+			break;
+	}
+
+	if (ret) {
+		virtio_video_req_resource_destroy(vvd->vv, vvd->id,
+						  stream->stream_id,
+						  resource_id);
+		virtio_video_resource_id_put(vvd->vv, resource_id);
+		return ret;
+	}
+
+	virtio_vb->queued = false;
+	virtio_vb->detached = false;
+	virtio_vb->resource_id = resource_id;
+
+	return 0;
+}
+
+static void virtio_video_buf_cleanup(struct vb2_buffer *vb)
+{
+	int ret;
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct virtio_video_buffer *virtio_vb = to_virtio_vb(vb);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+
+	ret = virtio_video_req_resource_detach_backing(vv, vvd->id,
+						       stream->stream_id,
+						       virtio_vb);
+	if (ret)
+		return;
+
+	ret = wait_event_timeout(vv->wq, virtio_vb->detached, 5 * HZ);
+	if (ret == 0) {
+		v4l2_err(&vv->v4l2_dev, "timed out waiting for detach\n");
+		return;
+	}
+
+	virtio_video_req_resource_destroy(vv, vvd->id, stream->stream_id,
+					  virtio_vb->resource_id);
+	virtio_video_resource_id_put(vv, virtio_vb->resource_id);
+}
+
+static void virtio_video_buf_queue(struct vb2_buffer *vb)
+{
+	int i, ret;
+	struct vb2_buffer *src_buf;
+	struct virtio_video_buffer *virtio_vb;
+	uint32_t data_size[VB2_MAX_PLANES] = {0};
+	struct vb2_v4l2_buffer *v4l2_vb = to_vb2_v4l2_buffer(vb);
+	struct vb2_v4l2_buffer *src_vb;
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+
+	v4l2_m2m_buf_queue(stream->fh.m2m_ctx, v4l2_vb);
+
+	if ((stream->state != STREAM_STATE_INIT) ||
+	    !V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
+		return;
+
+	src_vb = v4l2_m2m_next_src_buf(stream->fh.m2m_ctx);
+	if (!src_vb) {
+		v4l2_err(&vv->v4l2_dev, "no src buf during initialization\n");
+		return;
+	}
+
+	src_buf = &src_vb->vb2_buf;
+	for (i = 0; i < src_buf->num_planes; ++i)
+		data_size[i] = src_buf->planes[i].bytesused;
+
+	virtio_vb = to_virtio_vb(src_buf);
+
+	ret = virtio_video_req_resource_queue(vv, vvd->id, stream->stream_id,
+					      virtio_vb, data_size,
+					      src_buf->num_planes,
+					      true);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to queue an src buffer\n");
+		return;
+	}
+
+	virtio_vb->queued = true;
+	stream->src_cleared = false;
+	src_vb = v4l2_m2m_src_buf_remove(stream->fh.m2m_ctx);
+}
+
+static int virtio_video_start_streaming(struct vb2_queue *vq,
+					unsigned int count)
+{
+	int ret;
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+
+	if ((V4L2_TYPE_IS_OUTPUT(vq->type) &&
+	    (stream->state == STREAM_STATE_INIT)) ||
+	    (stream->state == STREAM_STATE_STOPPED)) {
+		ret = virtio_video_req_stream_start(vv, vvd->id,
+						    stream->stream_id);
+		if (ret)
+			return ret;
+	}
+
+	if (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
+	    (stream->state >= STREAM_STATE_INIT))
+		stream->state = STREAM_STATE_RUNNING;
+
+	return 0;
+}
+
+static void virtio_video_stop_streaming(struct vb2_queue *vq)
+{
+	int ret;
+	bool *cleared;
+	bool is_output = V4L2_TYPE_IS_OUTPUT(vq->type);
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+	struct vb2_v4l2_buffer *v4l2_vb;
+
+	if (is_output)
+		cleared = &stream->src_cleared;
+	else
+		cleared = &stream->dst_cleared;
+
+	ret = virtio_video_req_queue_clear(vv, vvd->id, stream, is_output);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to clear queue\n");
+		return;
+	}
+
+	ret = wait_event_timeout(vv->wq, *cleared, 5 * HZ);
+	if (ret == 0) {
+		v4l2_err(&vv->v4l2_dev, "timed out waiting for queue clear\n");
+		return;
+	}
+
+	for (;;) {
+		if (is_output)
+			v4l2_vb = v4l2_m2m_src_buf_remove(stream->fh.m2m_ctx);
+		else
+			v4l2_vb = v4l2_m2m_dst_buf_remove(stream->fh.m2m_ctx);
+		if (!v4l2_vb)
+			break;
+		v4l2_m2m_buf_done(v4l2_vb, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct vb2_ops virtio_video_qops = {
+	.queue_setup	 = virtio_video_queue_setup,
+	.buf_init	 = virtio_video_buf_init,
+	.buf_cleanup	 = virtio_video_buf_cleanup,
+	.buf_queue	 = virtio_video_buf_queue,
+	.start_streaming = virtio_video_start_streaming,
+	.stop_streaming  = virtio_video_stop_streaming,
+	.wait_prepare	 = vb2_ops_wait_prepare,
+	.wait_finish	 = vb2_ops_wait_finish,
+};
+
+static int virtio_video_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	int ret = 0;
+	struct virtio_video_stream *stream = ctrl2stream(ctrl);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+
+	switch (ctrl->id) {
+	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
+		if (stream->state >= STREAM_STATE_METADATA)
+			ctrl->val = vvd->out_info.min_buffers;
+		else
+			ctrl->val = 0;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops virtio_video_ctrl_ops = {
+	.g_volatile_ctrl	= virtio_video_g_volatile_ctrl,
+};
+
+int virtio_video_init_dec_ctrls(struct virtio_video_stream *stream)
+{
+	struct v4l2_ctrl *ctrl;
+
+	v4l2_ctrl_handler_init(&stream->ctrl_handler, 1);
+
+	ctrl = v4l2_ctrl_new_std(&stream->ctrl_handler,
+				&virtio_video_ctrl_ops,
+				V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
+				MIN_BUFS_MIN, MIN_BUFS_MAX, MIN_BUFS_STEP,
+				MIN_BUFS_DEF);
+	ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+
+	if (stream->ctrl_handler.error)
+		return stream->ctrl_handler.error;
+
+	v4l2_ctrl_handler_setup(&stream->ctrl_handler);
+
+	return 0;
+}
+
+int virtio_video_init_dec_queues(void *priv, struct vb2_queue *src_vq,
+				 struct vb2_queue *dst_vq)
+{
+	int ret;
+	struct virtio_video_stream *stream = priv;
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct device *dev = vvd->vv->v4l2_dev.dev;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = stream;
+	src_vq->buf_struct_size = sizeof(struct virtio_video_buffer);
+	src_vq->ops = &virtio_video_qops;
+	src_vq->mem_ops = &vb2_dma_sg_memops;
+	src_vq->min_buffers_needed = vvd->in_info.min_buffers;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &stream->vq_mutex;
+	src_vq->dev = dev;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = stream;
+	dst_vq->buf_struct_size = sizeof(struct virtio_video_buffer);
+	dst_vq->ops = &virtio_video_qops;
+	dst_vq->mem_ops = &vb2_dma_sg_memops;
+	dst_vq->min_buffers_needed = vvd->out_info.min_buffers;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &stream->vq_mutex;
+	dst_vq->dev = dev;
+
+	return vb2_queue_init(dst_vq);
+}
+
+static int virtio_video_querycap(struct file *file, void *fh,
+				 struct v4l2_capability *cap)
+{
+	struct video_device *video_dev = video_devdata(file);
+
+	strncpy(cap->driver, DRIVER_NAME, sizeof(cap->driver));
+	strncpy(cap->card, video_dev->name, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "virtio:%s",
+		 video_dev->name);
+
+	cap->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
+
+	return 0;
+}
+
+static int virtio_video_enum_fmt_vid_cap(struct file *file, void *fh,
+					 struct v4l2_fmtdesc *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	if (f->index >= vvd->num_capture_formats)
+		return -EINVAL;
+
+	f->pixelformat = vvd->capture_fmts[f->index]->fourcc_format;
+
+	return 0;
+}
+
+static struct video_pix_format *find_pix_format(struct video_pix_format **list,
+						uint32_t fourcc, int num)
+{
+	int idx = 0;
+
+	for (idx = 0; idx < num; idx++) {
+		if (list[idx]->fourcc_format == fourcc)
+			return list[idx];
+	}
+	return NULL;
+}
+
+static int virtio_video_try_decoder_cmd(struct file *file, void *fh,
+					struct v4l2_decoder_cmd *cmd)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = video_drvdata(file);
+	struct virtio_video *vv = vvd->vv;
+
+	if (stream->state == STREAM_STATE_DRAIN)
+		return -EBUSY;
+
+	switch (cmd->cmd) {
+	case V4L2_DEC_CMD_STOP:
+	case V4L2_DEC_CMD_START:
+		if (cmd->flags != 0) {
+			v4l2_err(&vv->v4l2_dev, "flags=%u are not supported",
+				 cmd->flags);
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int virtio_video_decoder_cmd(struct file *file, void *fh,
+				    struct v4l2_decoder_cmd *cmd)
+{
+	int ret;
+	struct vb2_queue *src_vq, *dst_vq;
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = video_drvdata(file);
+	struct virtio_video *vv = vvd->vv;
+
+	ret = virtio_video_try_decoder_cmd(file, fh, cmd);
+	if (ret < 0)
+		return ret;
+
+	dst_vq = v4l2_m2m_get_vq(stream->fh.m2m_ctx,
+				 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	switch (cmd->cmd) {
+	case V4L2_DEC_CMD_START:
+		vb2_clear_last_buffer_dequeued(dst_vq);
+		ret = virtio_video_req_stream_start(vv, vvd->id,
+						    stream->stream_id);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_DEC_CMD_STOP:
+		src_vq = v4l2_m2m_get_vq(stream->fh.m2m_ctx,
+					 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+		if (!vb2_is_streaming(src_vq)) {
+			v4l2_dbg(1, vv->debug,
+				 &vv->v4l2_dev, "output is not streaming\n");
+			return 0;
+		}
+
+		if (!vb2_is_streaming(dst_vq)) {
+			v4l2_dbg(1, vv->debug,
+				 &vv->v4l2_dev, "capture is not streaming\n");
+			return 0;
+		}
+
+		ret = virtio_video_req_stream_drain(vv, vvd->id,
+						    stream->stream_id);
+		if (ret) {
+			v4l2_err(&vv->v4l2_dev, "failed to drain stream\n");
+			return ret;
+		}
+		stream->state = STREAM_STATE_DRAIN;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int virtio_video_enum_framesizes(struct file *file, void *fh,
+					struct v4l2_frmsizeenum *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct video_frame_size *frame_size = NULL;
+	int i = 0;
+	bool fake_non_discrete = false;
+	int idx = f->index;
+	struct video_pix_format *fmt = NULL;
+
+	fmt = find_pix_format(vvd->output_fmts, f->pixel_format,
+			      vvd->num_output_formats);
+	if (fmt == NULL)
+		fmt = find_pix_format(vvd->capture_fmts, f->pixel_format,
+				      vvd->num_capture_formats);
+	if (fmt == NULL)
+		return -EINVAL;
+
+	if (idx >= fmt->num_sizes)
+		return -EINVAL;
+
+	/* If the index is 0 - it is the first call of ENUM_FRAMESIZES, that
+	 * defines a type of all the frame sizes.
+	 *
+	 * Indexes > 0 can be used later only in case of the type is discrete.
+	 * But, if there is at least one non-discrete type later in the array -
+	 * it may be misinterpreted as a discrete one.
+	 *
+	 * Hence, check, whether there is a non-discrete frame size, and if yes
+	 * - return the first of them.
+	 */
+	if (!idx)
+		for (i = 0; i < fmt->num_sizes; i++) {
+			frame_size = &fmt->frame_sizes[i];
+			if (frame_size->min_width != frame_size->max_width ||
+			    frame_size->min_height != frame_size->max_height) {
+				idx = i;
+				fake_non_discrete = true;
+				break;
+			}
+		}
+
+	/* Index > 0 can be used only for discrete frame sizes. Type of the
+	 * frame sizes is equal to type of the first frame size.
+	 */
+	if (idx && !fake_non_discrete) {
+		frame_size = &fmt->frame_sizes[0];
+		if (frame_size->min_width != frame_size->max_width ||
+		    frame_size->min_height != frame_size->max_height)
+			return -EINVAL;
+	}
+
+	frame_size = &fmt->frame_sizes[idx];
+
+	if (frame_size->min_width == frame_size->max_width &&
+	   frame_size->min_height == frame_size->max_height) {
+		f->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+		f->discrete.width = frame_size->min_width;
+		f->discrete.height = frame_size->min_height;
+	} else {
+		if (idx && !fake_non_discrete)
+			return -EINVAL;
+		f->stepwise.min_width = frame_size->min_width;
+		f->stepwise.min_height = frame_size->min_height;
+		f->stepwise.step_height = frame_size->step_height;
+		f->stepwise.step_width = frame_size->step_width;
+		f->stepwise.max_height = frame_size->max_height;
+		f->stepwise.max_width = frame_size->max_width;
+		if (frame_size->step_width == 1 &&
+		    frame_size->min_height == 1) {
+			f->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+		} else {
+			f->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+		}
+	}
+
+	return 0;
+}
+
+static bool in_stepped_interval(uint32_t int_start, uint32_t int_end,
+				uint32_t step, uint32_t point)
+{
+	if (point < int_start || point > int_end)
+		return false;
+
+	if (step == 0 && int_start == int_end && int_start == point)
+		return true;
+
+	if (step != 0 && (point - int_start) % step == 0)
+		return true;
+
+	return false;
+}
+
+static int virtio_video_enum_framemintervals(struct file *file, void *fh,
+					     struct v4l2_frmivalenum *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct video_frame_size *fsize = NULL;
+	int fsize_idx = 0;
+	int i = 0;
+	bool fake_non_discrete = false;
+	int idx = f->index;
+	struct video_pix_format *fmt = NULL;
+	struct video_frame_rate *frate = NULL;
+
+	fmt = find_pix_format(vvd->output_fmts, f->pixel_format,
+			      vvd->num_output_formats);
+	if (fmt == NULL)
+		fmt = find_pix_format(vvd->capture_fmts, f->pixel_format,
+				      vvd->num_capture_formats);
+	if (fmt == NULL)
+		return -EINVAL;
+
+	for (fsize_idx = 0; fsize_idx <= fmt->num_sizes; fsize_idx++) {
+		fsize = &fmt->frame_sizes[fsize_idx];
+		if (in_stepped_interval(fsize->min_width, fsize->max_width,
+					fsize->step_width, f->width) &&
+		   in_stepped_interval(fsize->min_height, fsize->max_height,
+					fsize->step_height, f->height))
+			break;
+	}
+
+	if (fsize == NULL)
+		return -EINVAL;
+
+	if (idx >= fsize->num_rates)
+		return -EINVAL;
+
+	/* If the index is 0 - it is the first call of ENUM_FRAMEIVALS, that
+	 * defines a type of all the frame intervals.
+	 *
+	 * Indexes > 0 can be used later only in case of the type is discrete.
+	 * But, if there is at least one non-discrete type later in the array -
+	 * it may be misinterpreted as a discrete one.
+	 *
+	 * Hence, check, whether there is a non-discrete frame rate, and if yes
+	 * - return the first of them.
+	 */
+	if (!idx)
+		for (i = 0; i < fsize->num_rates; i++) {
+			frate = &fsize->frame_rates[i];
+			if (frate->min_rate != frate->max_rate) {
+				fake_non_discrete = true;
+				idx = i;
+				break;
+			}
+		}
+
+	/* Index > 0 can be used only for discrete frame rates. Type of the
+	 * frame rate is equal to the type of the first frame size.
+	 */
+	if (idx && !fake_non_discrete) {
+		frate = &fsize->frame_rates[0];
+		if (frate->max_rate != frate->min_rate)
+			return -EINVAL;
+	}
+
+	frate = &fsize->frame_rates[idx];
+	if (frate->max_rate == frate->min_rate) {
+		f->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+		f->discrete.numerator = 1;
+		f->discrete.denominator = frate->max_rate;
+	} else {
+		if (idx && !fake_non_discrete)
+			return -EINVAL;
+		/* If A > B, then 1/A < 1/B, so max denominator = min_rate
+		 * and vise versa
+		 */
+		f->stepwise.min.numerator = 1;
+		f->stepwise.min.denominator = frate->max_rate;
+		f->stepwise.max.numerator = 1;
+		f->stepwise.max.denominator = frate->min_rate;
+		f->stepwise.step.numerator = 1;
+		f->stepwise.step.denominator = frate->step;
+		if (frate->step == 1)
+			f->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
+		else
+			f->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	}
+
+	return 0;
+}
+
+static int virtio_video_enum_fmt_vid_out(struct file *file, void *fh,
+					 struct v4l2_fmtdesc *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	if (f->index >= vvd->num_output_formats)
+		return -EINVAL;
+
+	f->pixelformat = vvd->output_fmts[f->index]->fourcc_format;
+
+	return 0;
+}
+
+static void fill_v4l2_format_from_info(struct video_format_info *info,
+				       struct v4l2_pix_format_mplane *pix_mp)
+{
+	int i;
+
+	pix_mp->width = info->frame_width;
+	pix_mp->height = info->frame_height;
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->colorspace = V4L2_COLORSPACE_REC709;
+	pix_mp->xfer_func = 0;
+	pix_mp->ycbcr_enc = 0;
+	pix_mp->quantization = 0;
+	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
+	memset(pix_mp->plane_fmt[0].reserved, 0,
+	       sizeof(pix_mp->plane_fmt[0].reserved));
+
+	pix_mp->num_planes = info->num_planes;
+	pix_mp->pixelformat = info->fourcc_format;
+
+	for (i = 0; i < info->num_planes; i++) {
+		pix_mp->plane_fmt[i].bytesperline =
+					 info->plane_format[i].stride;
+		pix_mp->plane_fmt[i].sizeimage =
+					 info->plane_format[i].plane_size;
+	}
+}
+
+static int virtio_video_g_fmt(struct virtio_video_stream *stream,
+			      struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct video_format_info *info;
+
+	if (!V4L2_TYPE_IS_OUTPUT(f->type))
+		info = &stream->out_info;
+	else
+		info = &stream->in_info;
+
+	fill_v4l2_format_from_info(info, pix_mp);
+	return 0;
+}
+
+static int virtio_video_g_fmt_vid_out(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	return virtio_video_g_fmt(file2stream(file), f);
+}
+
+static int virtio_video_g_fmt_vid_cap(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	return virtio_video_g_fmt(file2stream(file), f);
+}
+
+static inline bool within_range(uint32_t min, uint32_t val, uint32_t max)
+{
+	return ((val - min) <= (max - min));
+}
+
+static inline bool needs_alignment(uint32_t val, uint32_t a)
+{
+	if (a == 0 || IS_ALIGNED(val, a))
+		return false;
+
+	return true;
+}
+
+static int virtio_video_try_fmt(struct virtio_video_stream *stream,
+				struct v4l2_format *f)
+{
+	int i, idx = 0;
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct video_pix_format *fmt = NULL;
+	struct video_frame_size *frm_sz = NULL;
+	bool found = false;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type))
+		fmt = find_pix_format(vvd->output_fmts, pix_mp->pixelformat,
+					 vvd->num_output_formats);
+	else
+		fmt = find_pix_format(vvd->capture_fmts, pix_mp->pixelformat,
+					 vvd->num_capture_formats);
+
+	if (!fmt) {
+		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+			fill_v4l2_format_from_info(&stream->out_info, pix_mp);
+		else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+			fill_v4l2_format_from_info(&stream->in_info, pix_mp);
+		else
+			return -EINVAL;
+		return 0;
+	}
+
+	for (i = 0; i < fmt->num_sizes && !found; i++) {
+		frm_sz = &fmt->frame_sizes[i];
+		if (!within_range(frm_sz->min_width, pix_mp->width,
+				 frm_sz->max_width))
+			continue;
+
+		if (!within_range(frm_sz->min_height, pix_mp->height,
+				  frm_sz->max_height))
+			continue;
+
+		idx = i;
+		/*
+		 * Try to find a more suitable frame size. Go with the current
+		 * one otherwise.
+		 */
+		if (needs_alignment(pix_mp->width, frm_sz->step_width))
+			continue;
+
+		if (needs_alignment(pix_mp->height, frm_sz->step_height))
+			continue;
+
+		found = true;
+	}
+
+	if (!found) {
+		frm_sz = &fmt->frame_sizes[idx];
+		pix_mp->width = clamp(pix_mp->width, frm_sz->min_width,
+				      frm_sz->max_width);
+		if (frm_sz->step_width != 0)
+			pix_mp->width = ALIGN(pix_mp->width,
+					      frm_sz->step_width);
+
+		pix_mp->height = clamp(pix_mp->height, frm_sz->min_height,
+				      frm_sz->max_height);
+		if (frm_sz->step_height != 0)
+			pix_mp->height = ALIGN(pix_mp->height,
+				       frm_sz->step_height);
+	}
+
+	return 0;
+}
+
+static int virtio_video_s_fmt(struct virtio_video_stream *stream,
+			      struct v4l2_format *f)
+{
+	int i, ret;
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+	struct video_format_info info;
+	struct video_format_info *p_info;
+	enum video_pin_type pin = VIDEO_PIN_TYPE_INPUT;
+
+	ret = virtio_video_try_fmt(stream, f);
+	if (ret)
+		return ret;
+
+	info.frame_width = pix_mp->width;
+	info.frame_height = pix_mp->height;
+	info.num_planes = pix_mp->num_planes;
+	info.fourcc_format = pix_mp->pixelformat;
+
+	for (i = 0; i < info.num_planes; i++) {
+		info.plane_format[i].stride =
+					 pix_mp->plane_fmt[i].bytesperline;
+		info.plane_format[i].plane_size =
+					 pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	if (!V4L2_TYPE_IS_OUTPUT(f->type))
+		pin = VIDEO_PIN_TYPE_OUTPUT;
+
+	virtio_video_req_set_params(vv, vvd->id, &info, pin,
+				    VIDEO_PARAMS_SCOPE_STREAM, stream);
+
+	virtio_video_req_get_params(vv, vvd->id, VIDEO_PIN_TYPE_INPUT,
+				    VIDEO_PARAMS_SCOPE_STREAM, stream);
+
+	virtio_video_req_get_params(vv, vvd->id, VIDEO_PIN_TYPE_OUTPUT,
+				    VIDEO_PARAMS_SCOPE_STREAM, stream);
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type))
+		p_info = &stream->in_info;
+	else
+		p_info = &stream->out_info;
+
+	fill_v4l2_format_from_info(p_info, pix_mp);
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		if (stream->state == STREAM_STATE_IDLE)
+			stream->state = STREAM_STATE_INIT;
+	}
+
+	return 0;
+}
+
+static int virtio_video_s_fmt_vid_cap(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+
+	return virtio_video_s_fmt(stream, f);
+}
+
+static int virtio_video_s_fmt_vid_out(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+
+	return virtio_video_s_fmt(stream, f);
+}
+
+static int
+virtio_video_subscribe_event(struct v4l2_fh *fh,
+			     const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subscribe(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ioctl_ops virtio_video_device_dec_ioctl_ops = {
+	.vidioc_querycap	= virtio_video_querycap,
+
+	.vidioc_enum_fmt_vid_cap = virtio_video_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap	= virtio_video_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap	= virtio_video_s_fmt_vid_cap,
+
+	.vidioc_g_fmt_vid_cap_mplane	= virtio_video_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap_mplane	= virtio_video_s_fmt_vid_cap,
+
+	.vidioc_enum_fmt_vid_out = virtio_video_enum_fmt_vid_out,
+	.vidioc_g_fmt_vid_out	= virtio_video_g_fmt_vid_out,
+	.vidioc_s_fmt_vid_out	= virtio_video_s_fmt_vid_out,
+
+	.vidioc_g_fmt_vid_out_mplane	= virtio_video_g_fmt_vid_out,
+	.vidioc_s_fmt_vid_out_mplane	= virtio_video_s_fmt_vid_out,
+
+	.vidioc_try_decoder_cmd	= virtio_video_try_decoder_cmd,
+	.vidioc_decoder_cmd	= virtio_video_decoder_cmd,
+	.vidioc_enum_frameintervals = virtio_video_enum_framemintervals,
+	.vidioc_enum_framesizes = virtio_video_enum_framesizes,
+
+	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_subscribe_event = virtio_video_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+int virtio_video_dec_init(struct virtio_video_device *vvd)
+{
+	struct video_device *vd = NULL;
+
+	if (!vvd)
+		return -EINVAL;
+
+	vd = &vvd->video_dev;
+	vd->ioctl_ops = &virtio_video_device_dec_ioctl_ops;
+	return 0;
+}
diff --git a/drivers/media/virtio/virtio_video_dec.h b/drivers/media/virtio/virtio_video_dec.h
new file mode 100644
index 000000000000..5f67478ef9c5
--- /dev/null
+++ b/drivers/media/virtio/virtio_video_dec.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Decoder header for virtio video driver.
+ *
+ * Copyright 2019 OpenSynergy GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _VIRTIO_VIDEO_DEC_H
+#define _VIRTIO_VIDEO_DEC_H
+
+#include "virtio_video.h"
+
+int virtio_video_dec_init(struct virtio_video_device *vvd);
+int virtio_video_init_dec_ctrls(struct virtio_video_stream *stream);
+int virtio_video_init_dec_queues(void *priv, struct vb2_queue *src_vq,
+				 struct vb2_queue *dst_vq);
+
+#endif /* _VIRTIO_VIDEO_DEC_H */
diff --git a/drivers/media/virtio/virtio_video_device.c b/drivers/media/virtio/virtio_video_device.c
new file mode 100644
index 000000000000..d105a2fb1594
--- /dev/null
+++ b/drivers/media/virtio/virtio_video_device.c
@@ -0,0 +1,747 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Driver for virtio video device.
+ *
+ * Copyright 2019 OpenSynergy GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-sg.h>
+
+#include "virtio_video.h"
+#include "virtio_video_dec.h"
+#include "virtio_video_enc.h"
+
+void virtio_video_queue_eos_event(struct virtio_video_stream *stream)
+{
+	static const struct v4l2_event eos_event = {
+		.type = V4L2_EVENT_EOS
+	};
+
+	v4l2_event_queue_fh(&stream->fh, &eos_event);
+}
+
+void virtio_video_queue_res_chg_event(struct virtio_video_stream *stream)
+{
+	static const struct v4l2_event ev_src_ch = {
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes =
+			V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
+
+	v4l2_event_queue_fh(&stream->fh, &ev_src_ch);
+}
+
+void virtio_video_mark_drain_complete(struct virtio_video_stream *stream,
+				      struct vb2_v4l2_buffer *v4l2_vb)
+{
+	struct vb2_buffer *vb2_buf;
+
+	v4l2_vb->flags |= V4L2_BUF_FLAG_LAST;
+
+	vb2_buf = &v4l2_vb->vb2_buf;
+	vb2_buf->planes[0].bytesused = 0;
+
+	v4l2_m2m_buf_done(v4l2_vb, VB2_BUF_STATE_DONE);
+	stream->state = STREAM_STATE_STOPPED;
+}
+
+void virtio_video_buf_done(struct virtio_video_buffer *virtio_vb,
+			   uint32_t flags, uint64_t timestamp, uint32_t size)
+{
+	int i, ret;
+	enum vb2_buffer_state done_state = VB2_BUF_STATE_DONE;
+	struct vb2_v4l2_buffer *v4l2_vb = &virtio_vb->v4l2_m2m_vb.vb;
+	struct vb2_buffer *vb = &v4l2_vb->vb2_buf;
+	struct vb2_queue *vb2_queue = vb->vb2_queue;
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb2_queue);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+	struct video_format_info *p_info;
+
+	virtio_vb->queued = false;
+
+	if (!V4L2_TYPE_IS_OUTPUT(vb2_queue->type) &&
+	    stream->check_drain_sequence_pending) {
+		virtio_video_mark_drain_complete(stream, v4l2_vb);
+		stream->check_drain_sequence_pending = false;
+		return;
+	}
+
+	if (flags & VIRTIO_VIDEO_BUFFER_F_ERR)
+		done_state = VB2_BUF_STATE_ERROR;
+
+	if (flags & VIRTIO_VIDEO_BUFFER_IFRAME)
+		v4l2_vb->flags |= V4L2_BUF_FLAG_KEYFRAME;
+
+	if (flags & VIRTIO_VIDEO_BUFFER_BFRAME)
+		v4l2_vb->flags |= V4L2_BUF_FLAG_BFRAME;
+
+	if (flags & VIRTIO_VIDEO_BUFFER_PFRAME)
+		v4l2_vb->flags |= V4L2_BUF_FLAG_PFRAME;
+
+	if (flags & VIRTIO_VIDEO_BUFFER_F_EOS) {
+		v4l2_vb->flags |= V4L2_BUF_FLAG_LAST;
+		ret = virtio_video_req_stream_stop(vv, vvd->id, stream);
+		if (ret)
+			v4l2_err(&vv->v4l2_dev, "failed to stop stream\n");
+		else
+			stream->state = STREAM_STATE_STOPPED;
+		virtio_video_queue_eos_event(stream);
+	}
+
+	if (!V4L2_TYPE_IS_OUTPUT(vb2_queue->type)) {
+		if (vvd->type == VIRTIO_VIDEO_FUNC_ENCODER) {
+			vb->planes[0].bytesused = size;
+		} else if (vvd->type == VIRTIO_VIDEO_FUNC_DECODER) {
+			p_info = &stream->out_info;
+			for (i = 0; i < p_info->num_planes; i++)
+				vb->planes[i].bytesused =
+					p_info->plane_format[i].plane_size;
+		}
+
+		vb->timestamp = timestamp;
+	}
+
+	v4l2_m2m_buf_done(v4l2_vb, done_state);
+}
+
+
+static void virtio_video_worker(struct work_struct *work)
+{
+	unsigned int i;
+	int ret;
+	struct vb2_buffer *vb2_buf;
+	struct vb2_v4l2_buffer *src_vb, *dst_vb;
+	struct virtio_video_buffer *virtio_vb;
+	struct virtio_video_stream *stream = work2stream(work);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct vb2_queue *src_vq =
+		v4l2_m2m_get_vq(stream->fh.m2m_ctx,
+				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	struct vb2_queue *dst_vq =
+		v4l2_m2m_get_vq(stream->fh.m2m_ctx,
+				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	struct virtio_video *vv = vvd->vv;
+	uint32_t data_size[VB2_MAX_PLANES] = {0};
+
+
+	mutex_lock(dst_vq->lock);
+	for (;;) {
+		dst_vb = v4l2_m2m_next_dst_buf(stream->fh.m2m_ctx);
+		if (dst_vb == NULL)
+			break;
+
+		vb2_buf = &dst_vb->vb2_buf;
+		virtio_vb = to_virtio_vb(vb2_buf);
+
+		for (i = 0; i < vb2_buf->num_planes; ++i)
+			data_size[i] = vb2_buf->planes[i].bytesused;
+
+		ret = virtio_video_req_resource_queue(vv, vvd->id,
+						      stream->stream_id,
+						      virtio_vb, data_size,
+						      vb2_buf->num_planes,
+						      false);
+		if (ret) {
+			v4l2_info(&vv->v4l2_dev,
+				  "failed to queue a dst buffer\n");
+			v4l2_m2m_job_finish(vvd->m2m_dev, stream->fh.m2m_ctx);
+			mutex_unlock(dst_vq->lock);
+			return;
+		}
+
+		virtio_vb->queued = true;
+		stream->dst_cleared = false;
+		dst_vb = v4l2_m2m_dst_buf_remove(stream->fh.m2m_ctx);
+	}
+	mutex_unlock(dst_vq->lock);
+
+	mutex_lock(src_vq->lock);
+	for (;;) {
+		if (stream->state == STREAM_STATE_DRAIN)
+			break;
+
+		src_vb = v4l2_m2m_next_src_buf(stream->fh.m2m_ctx);
+		if (src_vb == NULL)
+			break;
+
+		vb2_buf = &src_vb->vb2_buf;
+		virtio_vb = to_virtio_vb(vb2_buf);
+
+		for (i = 0; i < vb2_buf->num_planes; ++i)
+			data_size[i] = vb2_buf->planes[i].bytesused;
+
+		ret = virtio_video_req_resource_queue(vv, vvd->id,
+						      stream->stream_id,
+						      virtio_vb,
+							  data_size,
+							  vb2_buf->num_planes,
+						      true);
+		if (ret) {
+			v4l2_info(&vv->v4l2_dev,
+				  "failed to queue an src buffer\n");
+			v4l2_m2m_job_finish(vvd->m2m_dev, stream->fh.m2m_ctx);
+			mutex_unlock(src_vq->lock);
+			return;
+		}
+
+		virtio_vb->queued = true;
+		stream->src_cleared = false;
+		src_vb = v4l2_m2m_src_buf_remove(stream->fh.m2m_ctx);
+	}
+	mutex_unlock(src_vq->lock);
+
+	v4l2_m2m_job_finish(vvd->m2m_dev, stream->fh.m2m_ctx);
+}
+
+static int virtio_video_device_open(struct file *file)
+{
+	int ret;
+	uint32_t stream_id;
+	char name[TASK_COMM_LEN];
+	struct virtio_video_stream *stream;
+	struct video_device *video_dev = video_devdata(file);
+	struct virtio_video_device *vvd = video_drvdata(file);
+	struct virtio_video *vv = vvd->vv;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	get_task_comm(name, current);
+	virtio_video_stream_id_get(vv, stream, &stream_id);
+	ret = virtio_video_req_stream_create(vv, vvd->id, stream_id, name);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to create stream\n");
+		goto err_stream_create;
+	}
+
+	stream->video_dev = video_dev;
+	stream->stream_id = stream_id;
+	stream->state = STREAM_STATE_IDLE;
+	mutex_init(&stream->vq_mutex);
+	INIT_WORK(&stream->work, virtio_video_worker);
+	v4l2_fh_init(&stream->fh, video_dev);
+	stream->fh.ctrl_handler = &stream->ctrl_handler;
+
+	if (vvd->type == VIRTIO_VIDEO_FUNC_DECODER) {
+		stream->fh.m2m_ctx =
+			v4l2_m2m_ctx_init(vvd->m2m_dev, stream,
+					  &virtio_video_init_dec_queues);
+	} else if (vvd->type == VIRTIO_VIDEO_FUNC_ENCODER) {
+		stream->fh.m2m_ctx =
+			v4l2_m2m_ctx_init(vvd->m2m_dev, stream,
+					  &virtio_video_init_enc_queues);
+	} else {
+		v4l2_err(&vv->v4l2_dev, "unsupported device type\n");
+		goto err_stream_create;
+	}
+
+	v4l2_m2m_set_src_buffered(stream->fh.m2m_ctx, true);
+	v4l2_m2m_set_dst_buffered(stream->fh.m2m_ctx, true);
+	file->private_data = &stream->fh;
+	v4l2_fh_add(&stream->fh);
+
+	if (vvd->type == VIRTIO_VIDEO_FUNC_DECODER)
+		ret = virtio_video_init_dec_ctrls(stream);
+	else if (vvd->type == VIRTIO_VIDEO_FUNC_ENCODER)
+		ret = virtio_video_init_enc_ctrls(stream);
+
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to init controls\n");
+		goto err_init_ctrls;
+	}
+
+	ret = virtio_video_req_get_params(vv, vvd->id, VIDEO_PIN_TYPE_INPUT,
+					  VIDEO_PARAMS_SCOPE_STREAM, stream);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to get stream in params\n");
+		goto err_init_ctrls;
+	}
+
+	ret = virtio_video_req_get_params(vv, vvd->id, VIDEO_PIN_TYPE_OUTPUT,
+					  VIDEO_PARAMS_SCOPE_STREAM, stream);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to get stream out params\n");
+		goto err_init_ctrls;
+	}
+
+	return 0;
+
+err_init_ctrls:
+	v4l2_fh_del(&stream->fh);
+	v4l2_fh_exit(&stream->fh);
+	mutex_lock(video_dev->lock);
+	v4l2_m2m_ctx_release(stream->fh.m2m_ctx);
+	mutex_unlock(video_dev->lock);
+err_stream_create:
+	virtio_video_stream_id_put(vv, stream_id);
+	kfree(stream);
+
+	return ret;
+}
+
+static int virtio_video_device_release(struct file *file)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct video_device *video_dev = video_devdata(file);
+	struct virtio_video_device *vvd = video_drvdata(file);
+	struct virtio_video *vv = vvd->vv;
+
+	v4l2_fh_del(&stream->fh);
+	v4l2_fh_exit(&stream->fh);
+	mutex_lock(video_dev->lock);
+	v4l2_m2m_ctx_release(stream->fh.m2m_ctx);
+	mutex_unlock(video_dev->lock);
+
+	virtio_video_req_stream_destroy(vv, vvd->id, stream->stream_id);
+	virtio_video_stream_id_put(vv, stream->stream_id);
+
+	kfree(stream);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations virtio_video_device_fops = {
+	.owner		= THIS_MODULE,
+	.open		= virtio_video_device_open,
+	.release	= virtio_video_device_release,
+	.poll		= v4l2_m2m_fop_poll,
+	.unlocked_ioctl	= video_ioctl2,
+	.mmap		= v4l2_m2m_fop_mmap,
+};
+
+static void virtio_video_device_run(void *priv)
+{
+	struct virtio_video_stream *stream = priv;
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+
+	queue_work(vvd->workqueue, &stream->work);
+}
+
+static int virtio_video_device_job_ready(void *priv)
+{
+	struct virtio_video_stream *stream = priv;
+
+	if (stream->state == STREAM_STATE_STOPPED)
+		return 0;
+
+	if (v4l2_m2m_num_src_bufs_ready(stream->fh.m2m_ctx) > 0 ||
+	    v4l2_m2m_num_dst_bufs_ready(stream->fh.m2m_ctx) > 0)
+		return 1;
+
+	return 0;
+}
+
+static void virtio_video_device_job_abort(void *priv)
+{
+	struct virtio_video_stream *stream = priv;
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+
+	v4l2_m2m_job_finish(vvd->m2m_dev, stream->fh.m2m_ctx);
+}
+
+static const struct v4l2_m2m_ops virtio_video_device_m2m_ops = {
+	.device_run	= virtio_video_device_run,
+	.job_ready	= virtio_video_device_job_ready,
+	.job_abort	= virtio_video_device_job_abort,
+};
+
+uint32_t virtio_video_control_to_v4l2(uint32_t control_type)
+{
+	switch (control_type) {
+	case VIRTIO_VIDEO_CONTROL_BITRATE:
+		return V4L2_CID_MPEG_VIDEO_BITRATE;
+	case VIRTIO_VIDEO_CONTROL_PROFILE:
+		return V4L2_CID_MPEG_VIDEO_H264_PROFILE;
+	case VIRTIO_VIDEO_CONTROL_LEVEL:
+		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
+	default:
+		return 0;
+	}
+}
+
+uint32_t virtio_video_profile_to_v4l2(uint32_t profile)
+{
+	switch (profile) {
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_BASELINE:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_MAIN:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_MAIN;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_EXTENDED:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_10:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_422:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_10_INTRA:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10_INTRA;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_444_INTRA:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_INTRA;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_CAVLC_444_INTRA:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_CAVLC_444_INTRA;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH;
+	case VIRTIO_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH;
+	default:
+		return 0;
+	}
+}
+
+uint32_t virtio_video_level_to_v4l2(uint32_t level)
+{
+	switch (level) {
+	case VIRTIO_MPEG_VIDEO_H264_LEVEL_1_0:
+		return V4L2_MPEG_VIDEO_H264_LEVEL_1_0;
+	case VIRTIO_MPEG_VIDEO_H264_LEVEL_2_0:
+		return V4L2_MPEG_VIDEO_H264_LEVEL_2_0;
+	case VIRTIO_MPEG_VIDEO_H264_LEVEL_4_0:
+		return V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
+	case VIRTIO_MPEG_VIDEO_H264_LEVEL_4_1:
+		return V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
+	case VIRTIO_MPEG_VIDEO_H264_LEVEL_4_2:
+		return V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
+	case VIRTIO_MPEG_VIDEO_H264_LEVEL_5_0:
+		return V4L2_MPEG_VIDEO_H264_LEVEL_5_0;
+	case VIRTIO_MPEG_VIDEO_H264_LEVEL_5_1:
+		return V4L2_MPEG_VIDEO_H264_LEVEL_5_1;
+	default:
+		return 0;
+	}
+}
+
+uint32_t virtio_video_v4l2_control_to_virtio(uint32_t v4l2_control)
+{
+	switch (v4l2_control) {
+	case V4L2_CID_MPEG_VIDEO_BITRATE:
+		return VIRTIO_VIDEO_CONTROL_BITRATE;
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		return VIRTIO_VIDEO_CONTROL_PROFILE;
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		return VIRTIO_VIDEO_CONTROL_LEVEL;
+	default:
+		return 0;
+	}
+}
+
+uint32_t virtio_video_v4l2_profile_to_virtio(uint32_t v4l2_profile)
+{
+	switch (v4l2_profile) {
+	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_BASELINE;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_MAIN;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_EXTENDED;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_10;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_422;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10_INTRA:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_10_INTRA;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_INTRA:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_444_INTRA;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_CAVLC_444_INTRA:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_CAVLC_444_INTRA;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH;
+	default:
+		return VIRTIO_MPEG_VIDEO_H264_PROFILE_UNDEFINED;
+	}
+}
+
+uint32_t virtio_video_v4l2_level_to_virtio(uint32_t v4l2_level)
+{
+	switch (v4l2_level) {
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+		return VIRTIO_MPEG_VIDEO_H264_LEVEL_1_0;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+		return VIRTIO_MPEG_VIDEO_H264_LEVEL_2_0;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		return VIRTIO_MPEG_VIDEO_H264_LEVEL_4_0;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+		return VIRTIO_MPEG_VIDEO_H264_LEVEL_4_1;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+		return VIRTIO_MPEG_VIDEO_H264_LEVEL_4_2;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		return VIRTIO_MPEG_VIDEO_H264_LEVEL_5_0;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+		return VIRTIO_MPEG_VIDEO_H264_LEVEL_5_1;
+	default:
+		return VIRTIO_MPEG_VIDEO_H264_LEVEL_UNDEFINED;
+	}
+}
+
+uint32_t virtio_video_format_to_v4l2(uint32_t pixel_format)
+{
+
+	switch (pixel_format) {
+	case VIRTIO_VIDEO_PIX_FMT_H264:
+		return V4L2_PIX_FMT_H264;
+	case VIRTIO_VIDEO_PIX_FMT_H265:
+		return V4L2_PIX_FMT_HEVC;
+	case VIRTIO_VIDEO_PIX_FMT_MPEG4:
+		return V4L2_PIX_FMT_MPEG4;
+	case VIRTIO_VIDEO_PIX_FMT_MPEG2:
+		return V4L2_PIX_FMT_MPEG2;
+	case VIRTIO_VIDEO_PIX_FMT_NV12:
+		return V4L2_PIX_FMT_NV12;
+	case VIRTIO_VIDEO_PIX_FMT_I420:
+		return V4L2_PIX_FMT_YUV420;
+	default:
+		return 0;
+	}
+}
+
+uint32_t virtio_video_v4l2_fourcc_to_virtio(uint32_t fourcc)
+{
+	switch (fourcc) {
+	case V4L2_PIX_FMT_H264:
+		return VIRTIO_VIDEO_PIX_FMT_H264;
+	case V4L2_PIX_FMT_HEVC:
+		return VIRTIO_VIDEO_PIX_FMT_H265;
+	case V4L2_PIX_FMT_MPEG4:
+		return VIRTIO_VIDEO_PIX_FMT_MPEG4;
+	case V4L2_PIX_FMT_MPEG2:
+		return VIRTIO_VIDEO_PIX_FMT_MPEG2;
+	case V4L2_PIX_FMT_NV12:
+		return VIRTIO_VIDEO_PIX_FMT_NV12;
+	case V4L2_PIX_FMT_YUV420:
+		return VIRTIO_VIDEO_PIX_FMT_I420;
+	default:
+		return VIRTIO_VIDEO_PIX_FMT_UNKNOWN;
+	}
+}
+
+static int virtio_video_device_init(struct virtio_video_device *vvd)
+{
+	int ret = 0;
+	const char *device_name = NULL;
+	struct video_device *vd = NULL;
+	struct virtio_video *vv = NULL;
+
+	if (!vvd)
+		return -EINVAL;
+
+	vd = &vvd->video_dev;
+	vv = vvd->vv;
+
+	switch (vvd->type) {
+	case VIRTIO_VIDEO_FUNC_ENCODER:
+		device_name = "stateful-encoder";
+		ret = virtio_video_enc_init(vvd);
+		break;
+	case VIRTIO_VIDEO_FUNC_DECODER:
+		device_name = "stateful-decoder";
+		ret = virtio_video_dec_init(vvd);
+		break;
+	case VIRTIO_VIDEO_FUNC_PROCESSOR:
+	case VIRTIO_VIDEO_FUNC_CAPTURE:
+	case VIRTIO_VIDEO_FUNC_OUTPUT:
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to init device type");
+		return ret;
+	}
+
+	ret = video_register_device(vd, VFL_TYPE_GRABBER, 0);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to register video device\n");
+		return ret;
+	}
+
+	vvd->workqueue = alloc_ordered_workqueue(vd->name,
+						 WQ_MEM_RECLAIM | WQ_FREEZABLE);
+	if (!vvd->workqueue) {
+		v4l2_err(&vv->v4l2_dev, "failed to create a workqueue");
+		video_unregister_device(vd);
+		return -ENOMEM;
+	}
+
+	list_add(&vvd->devices_list_entry, &vv->devices_list);
+	v4l2_info(&vv->v4l2_dev, "Device '%s' registered as /dev/video%d\n",
+		  device_name, vd->num);
+
+	return 0;
+}
+
+static void virtio_video_device_deinit(struct virtio_video_device *vvd)
+{
+	if (!vvd)
+		return;
+
+	list_del(&vvd->devices_list_entry);
+	flush_workqueue(vvd->workqueue);
+	destroy_workqueue(vvd->workqueue);
+	video_unregister_device(&vvd->video_dev);
+}
+
+static struct virtio_video_device *
+virtio_video_device_create(struct virtio_video *vv)
+{
+	struct device *dev = NULL;
+	struct video_device *vd = NULL;
+	struct v4l2_m2m_dev *m2m_dev = NULL;
+	struct virtio_video_device *vvd = NULL;
+
+	if (!vv)
+		return ERR_PTR(-EINVAL);
+
+	dev = &vv->vdev->dev;
+
+	vvd = devm_kzalloc(dev, sizeof(*vvd), GFP_KERNEL);
+	if (!vvd)
+		return ERR_PTR(-ENOMEM);
+
+	m2m_dev = v4l2_m2m_init(&virtio_video_device_m2m_ops);
+	if (IS_ERR(m2m_dev)) {
+		v4l2_err(&vv->v4l2_dev, "failed to init m2m device\n");
+		goto err;
+	}
+
+	vvd->vv = vv;
+	vvd->m2m_dev = m2m_dev;
+	mutex_init(&vvd->video_dev_mutex);
+	vd = &vvd->video_dev;
+	vd->lock = &vvd->video_dev_mutex;
+	vd->v4l2_dev = &vv->v4l2_dev;
+	vd->vfl_dir = VFL_DIR_M2M;
+	vd->ioctl_ops = NULL;
+	vd->fops = &virtio_video_device_fops;
+	vd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
+	vd->release = video_device_release_empty;
+
+	memset(vd->name, 0, sizeof(vd->name));
+
+	video_set_drvdata(vd, vvd);
+
+	INIT_LIST_HEAD(&vvd->ctrl_caps_list);
+	INIT_LIST_HEAD(&vvd->fmt_caps_list);
+
+	vvd->num_output_formats = 0;
+	vvd->num_capture_formats = 0;
+
+	return vvd;
+
+err:
+	devm_kfree(dev, vvd);
+
+	return ERR_CAST(m2m_dev);
+}
+
+void virtio_video_device_destroy(struct virtio_video_device *vvd)
+{
+	if (!vvd)
+		return;
+
+	v4l2_m2m_release(vvd->m2m_dev);
+	devm_kfree(&vvd->vv->vdev->dev, vvd);
+}
+
+int virtio_video_devices_init(struct virtio_video *vv, void *funcs_buf)
+{
+	int ret = 0;
+	int fun_idx = 0;
+	size_t offset = 0;
+
+	if (!vv || !funcs_buf)
+		return -EINVAL;
+
+	for (fun_idx = 0; fun_idx < vv->num_devices; fun_idx++) {
+		struct virtio_video_device *vvd = NULL;
+		size_t func_size = 0;
+
+		vvd = virtio_video_device_create(vv);
+		if (IS_ERR(vvd)) {
+			v4l2_err(&vv->v4l2_dev,
+				 "failed to create virtio video device\n");
+			ret = PTR_ERR(vvd);
+			goto failed;
+		}
+
+		func_size = virtio_video_parse_virtio_function(funcs_buf +
+							       offset, vvd);
+		if (func_size == 0) {
+			v4l2_err(&vv->v4l2_dev, "failed to parse a function\n");
+			virtio_video_device_destroy(vvd);
+			ret = -EINVAL;
+			goto failed;
+		}
+		offset += func_size;
+
+		ret = virtio_video_device_init(vvd);
+		if (ret != 0) {
+			v4l2_err(&vv->v4l2_dev,
+				 "failed to init virtio video device\n");
+			virtio_video_clean_virtio_function(vvd);
+			virtio_video_device_destroy(vvd);
+			goto failed;
+		}
+	}
+
+	return 0;
+
+failed:
+	virtio_video_devices_deinit(vv);
+
+	return ret;
+}
+
+void virtio_video_devices_deinit(struct virtio_video *vv)
+{
+	struct virtio_video_device *vvd = NULL, *tmp = NULL;
+
+	list_for_each_entry_safe(vvd, tmp, &vv->devices_list,
+				 devices_list_entry) {
+		virtio_video_device_deinit(vvd);
+		virtio_video_clean_virtio_function(vvd);
+		virtio_video_device_destroy(vvd);
+	}
+}
diff --git a/drivers/media/virtio/virtio_video_driver.c b/drivers/media/virtio/virtio_video_driver.c
new file mode 100644
index 000000000000..78e02faba7aa
--- /dev/null
+++ b/drivers/media/virtio/virtio_video_driver.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for virtio video device.
+ *
+ * Copyright 2019 OpenSynergy GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/module.h>
+#include <linux/version.h>
+#include <linux/dma-mapping.h>
+
+#include "virtio_video.h"
+
+static unsigned int debug;
+module_param(debug, uint, 0644);
+
+static void virtio_video_init_vq(struct virtio_video_queue *vvq,
+				 void (*work_func)(struct work_struct *work))
+{
+	spin_lock_init(&vvq->qlock);
+	init_waitqueue_head(&vvq->ack_queue);
+	INIT_WORK(&vvq->dequeue_work, work_func);
+}
+
+static void *dma_phys_alloc(struct device *dev, size_t size,
+			    dma_addr_t *dma_handle, gfp_t gfp,
+			    unsigned long attrs)
+{
+	void *ret;
+
+	ret = (void *)__get_free_pages(gfp, get_order(size));
+	if (ret)
+		*dma_handle = virt_to_phys(ret) - PFN_PHYS(dev->dma_pfn_offset);
+
+	return ret;
+}
+
+static void dma_phys_free(struct device *dev, size_t size,
+			  void *cpu_addr, dma_addr_t dma_addr,
+			  unsigned long attrs)
+{
+	free_pages((unsigned long)cpu_addr, get_order(size));
+}
+
+static dma_addr_t dma_phys_map_page(struct device *dev, struct page *page,
+				    unsigned long offset, size_t size,
+				    enum dma_data_direction dir,
+				    unsigned long attrs)
+{
+	return page_to_phys(page) + offset - PFN_PHYS(dev->dma_pfn_offset);
+}
+
+static int dma_phys_map_sg(struct device *dev, struct scatterlist *sgl,
+			   int nents, enum dma_data_direction dir,
+			   unsigned long attrs)
+{
+	int i;
+	struct scatterlist *sg;
+
+	for_each_sg(sgl, sg, nents, i) {
+		dma_addr_t offset = PFN_PHYS(dev->dma_pfn_offset);
+		void *va;
+
+		BUG_ON(!sg_page(sg));
+		va = sg_virt(sg);
+		sg_dma_address(sg) = (dma_addr_t)virt_to_phys(va) - offset;
+		sg_dma_len(sg) = sg->length;
+	}
+
+	return nents;
+}
+
+const struct dma_map_ops dma_phys_ops = {
+	.alloc			= dma_phys_alloc,
+	.free			= dma_phys_free,
+	.map_page		= dma_phys_map_page,
+	.map_sg			= dma_phys_map_sg,
+};
+
+static int virtio_video_init(struct virtio_video *vv)
+{
+	int ret = 0;
+	void *resp_buf = NULL;
+	void *funcs_buf = NULL;
+	size_t total_resp_size = 0;
+
+	if (!vv)
+		return -EINVAL;
+
+	total_resp_size = vv->funcs_size +
+			  sizeof(struct virtio_video_get_functions);
+	resp_buf = kzalloc(total_resp_size, GFP_KERNEL);
+	if (IS_ERR(resp_buf))
+		return -ENOMEM;
+
+	ret = virtio_video_req_funcs(vv, resp_buf, total_resp_size);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to get devices from the host\n");
+		goto err;
+	}
+
+	ret = wait_event_timeout(vv->wq, vv->got_funcs, 5 * HZ);
+	if (ret == 0) {
+		v4l2_err(&vv->v4l2_dev, "timed out waiting for get_funcs\n");
+		ret = -EIO;
+		goto err;
+	}
+
+	funcs_buf = resp_buf + sizeof(struct virtio_video_ctrl_hdr);
+	ret = virtio_video_devices_init(vv, funcs_buf);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to initialize devices\n");
+		goto err;
+	}
+
+	kfree(resp_buf);
+	return 0;
+
+err:
+	kfree(resp_buf);
+	return ret;
+};
+
+static int virtio_video_probe(struct virtio_device *vdev)
+{
+	int ret;
+	struct virtio_video *vv;
+	struct virtqueue *vqs[2];
+	struct device *dev = &vdev->dev;
+
+	static const char * const names[] = { "control", "event" };
+	static vq_callback_t *callbacks[] = {
+		virtio_video_ctrl_ack,
+		virtio_video_event_ack
+	};
+
+	vv = devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
+	if (!vv)
+		return -ENOMEM;
+	vv->vdev = vdev;
+	vv->debug = debug;
+	vdev->priv = vv;
+
+	spin_lock_init(&vv->resource_idr_lock);
+	idr_init(&vv->resource_idr);
+	spin_lock_init(&vv->stream_idr_lock);
+	idr_init(&vv->stream_idr);
+
+	init_waitqueue_head(&vv->wq);
+
+	vv->has_iommu = !virtio_has_iommu_quirk(vdev);
+	if (!vv->has_iommu)
+		set_dma_ops(dev, &dma_phys_ops);
+
+	dev_set_name(dev, DRIVER_NAME);
+	ret = v4l2_device_register(dev, &vv->v4l2_dev);
+	if (ret)
+		goto err_v4l2_reg;
+
+	virtio_video_init_vq(&vv->ctrlq, virtio_video_dequeue_ctrl_func);
+	virtio_video_init_vq(&vv->eventq, virtio_video_dequeue_event_func);
+
+	ret = virtio_find_vqs(vdev, 2, vqs, callbacks, names, NULL);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to find virt queues\n");
+		goto err_vqs;
+	}
+
+	vv->ctrlq.vq = vqs[0];
+	vv->eventq.vq = vqs[1];
+
+	ret = virtio_video_alloc_vbufs(vv);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to alloc vbufs\n");
+		goto err_vbufs;
+	}
+
+	virtio_cread(vdev, struct virtio_video_config, total_functions_size,
+		     &vv->funcs_size);
+	if (!vv->funcs_size) {
+		v4l2_err(&vv->v4l2_dev, "virtio_functions_size is zero\n");
+		ret = -EINVAL;
+		goto err_config;
+	}
+
+	virtio_cread(vdev, struct virtio_video_config, num_functions,
+		     &vv->num_devices);
+	if (!vv->num_devices) {
+		v4l2_err(&vv->v4l2_dev, "num_devices is zero\n");
+		ret = -EINVAL;
+		goto err_config;
+	}
+
+	ret = virtio_video_alloc_events(vv, vv->eventq.vq->num_free);
+	if (ret)
+		goto err_events;
+
+	virtio_device_ready(vdev);
+	vv->vq_ready = true;
+	vv->got_funcs = false;
+
+	INIT_LIST_HEAD(&vv->devices_list);
+
+	ret = virtio_video_init(vv);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev,
+			 "failed to init virtio video\n");
+		goto err_init;
+	}
+
+	return 0;
+
+err_init:
+err_events:
+err_config:
+	virtio_video_free_vbufs(vv);
+err_vbufs:
+	vdev->config->del_vqs(vdev);
+err_vqs:
+	v4l2_device_unregister(&vv->v4l2_dev);
+err_v4l2_reg:
+	devm_kfree(&vdev->dev, vv);
+
+	return ret;
+}
+
+static void virtio_video_remove(struct virtio_device *vdev)
+{
+	struct virtio_video *vv = vdev->priv;
+
+	virtio_video_devices_deinit(vv);
+	virtio_video_free_vbufs(vv);
+	vdev->config->del_vqs(vdev);
+	v4l2_device_unregister(&vv->v4l2_dev);
+	devm_kfree(&vdev->dev, vv);
+}
+
+static struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_VIDEO, VIRTIO_DEV_ANY_ID },
+	{ 0 },
+};
+
+static unsigned int features[] = {
+	/* none */
+};
+
+static struct virtio_driver virtio_video_driver = {
+	.feature_table = features,
+	.feature_table_size = ARRAY_SIZE(features),
+	.driver.name = DRIVER_NAME,
+	.driver.owner = THIS_MODULE,
+	.id_table = id_table,
+	.probe = virtio_video_probe,
+	.remove = virtio_video_remove,
+};
+
+module_virtio_driver(virtio_video_driver);
+
+MODULE_DEVICE_TABLE(virtio, id_table);
+MODULE_DESCRIPTION("virtio video driver");
+MODULE_AUTHOR("Dmitry Morozov <dmitry.morozov@opensynergy.com>");
+MODULE_AUTHOR("Kiran Pawar <kiran.pawar@opensynergy.com>");
+MODULE_AUTHOR("Nikolay Martyanov <nikolay.martyanov@opensynergy.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/virtio/virtio_video_enc.c b/drivers/media/virtio/virtio_video_enc.c
new file mode 100644
index 000000000000..3fe6d0e52d4a
--- /dev/null
+++ b/drivers/media/virtio/virtio_video_enc.c
@@ -0,0 +1,1124 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Encoder for virtio video device.
+ *
+ * Copyright 2019 OpenSynergy GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-sg.h>
+
+#include "virtio_video.h"
+
+static int virtio_video_queue_setup(struct vb2_queue *vq,
+				    unsigned int *num_buffers,
+				    unsigned int *num_planes,
+				    unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	int i;
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
+	struct video_format_info *p_info;
+
+	if (*num_planes)
+		return 0;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		p_info = &stream->in_info;
+	else
+		p_info = &stream->out_info;
+
+	*num_planes = p_info->num_planes;
+
+	for (i = 0; i < p_info->num_planes; i++)
+		sizes[i] = p_info->plane_format[i].plane_size;
+
+	return 0;
+}
+
+static int virtio_video_buf_plane_init(uint32_t idx,
+				       uint32_t resource_id,
+				       struct virtio_video_device *vvd,
+				       struct virtio_video_stream *stream,
+				       struct vb2_buffer *vb)
+{
+	int ret;
+	unsigned int i;
+	struct virtio_video *vv = vvd->vv;
+	struct scatterlist *sg;
+	struct virtio_video_mem_entry *ents;
+	struct sg_table *sgt = vb2_dma_sg_plane_desc(vb, idx);
+
+	/* Freed when the request has been completed */
+	ents = kcalloc(sgt->nents, sizeof(*ents), GFP_KERNEL);
+	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+		ents[i].addr = cpu_to_le64(vv->has_iommu
+					   ? sg_dma_address(sg)
+					   : sg_phys(sg));
+		ents[i].length = cpu_to_le32(sg->length);
+	}
+
+	v4l2_dbg(1, vv->debug, &vv->v4l2_dev, "mem entries:\n");
+	if (vv->debug >= 1) {
+		for (i = 0; i < sgt->nents; i++)
+			pr_debug("\t%03i: addr=%llx length=%u\n", i,
+				 ents[i].addr, ents[i].length);
+	}
+
+	ret = virtio_video_req_resource_attach_backing(vv, vvd->id,
+						       stream->stream_id,
+						       resource_id, ents,
+						       sgt->nents);
+	if (ret)
+		kfree(ents);
+
+	return ret;
+}
+
+static int virtio_video_buf_init(struct vb2_buffer *vb)
+{
+	int ret = 0;
+	unsigned int i;
+	uint32_t resource_id;
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct virtio_video_buffer *virtio_vb = to_virtio_vb(vb);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+
+	virtio_video_resource_id_get(vv, &resource_id);
+	ret = virtio_video_req_resource_create(vv, vvd->id, stream->stream_id,
+					       resource_id);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < vb->num_planes; ++i) {
+		ret = virtio_video_buf_plane_init(i,
+				resource_id, vvd, stream, vb);
+		if (ret)
+			break;
+	}
+
+	if (ret) {
+		virtio_video_req_resource_destroy(vvd->vv, vvd->id,
+						  stream->stream_id,
+						  resource_id);
+		virtio_video_resource_id_put(vvd->vv, resource_id);
+		return ret;
+	}
+
+	virtio_vb->queued = false;
+	virtio_vb->detached = false;
+	virtio_vb->resource_id = resource_id;
+
+	return 0;
+}
+
+static void virtio_video_buf_cleanup(struct vb2_buffer *vb)
+{
+	int ret;
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct virtio_video_buffer *virtio_vb = to_virtio_vb(vb);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+
+	ret = virtio_video_req_resource_detach_backing(vv, vvd->id,
+						       stream->stream_id,
+						       virtio_vb);
+	if (ret)
+		return;
+
+	ret = wait_event_timeout(vv->wq, virtio_vb->detached, 5 * HZ);
+	if (ret == 0) {
+		v4l2_err(&vv->v4l2_dev, "timed out waiting for detach\n");
+		return;
+	}
+
+	virtio_video_req_resource_destroy(vv, vvd->id, stream->stream_id,
+					  virtio_vb->resource_id);
+	virtio_video_resource_id_put(vv, virtio_vb->resource_id);
+}
+
+static void virtio_video_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_vb = to_vb2_v4l2_buffer(vb);
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_m2m_buf_queue(stream->fh.m2m_ctx, v4l2_vb);
+
+	v4l2_vb = v4l2_m2m_next_dst_buf(stream->fh.m2m_ctx);
+	if (v4l2_vb && stream->mark_last_buffer_pending) {
+		v4l2_vb = v4l2_m2m_dst_buf_remove(stream->fh.m2m_ctx);
+		if (v4l2_vb)
+			virtio_video_mark_drain_complete(stream, v4l2_vb);
+		stream->mark_last_buffer_pending = false;
+	}
+}
+
+static int virtio_video_start_streaming(struct vb2_queue *vq,
+					unsigned int count)
+{
+	int ret;
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+
+	if (stream->state == STREAM_STATE_INIT ||
+	    (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
+	     stream->state == STREAM_STATE_RESET) ||
+	    (V4L2_TYPE_IS_OUTPUT(vq->type) &&
+	    stream->state == STREAM_STATE_STOPPED)) {
+		ret = virtio_video_req_stream_start(vv, vvd->id,
+						    stream->stream_id);
+		if (ret)
+			return ret;
+		stream->state = STREAM_STATE_RUNNING;
+	}
+
+	return 0;
+}
+
+static void virtio_video_stop_streaming(struct vb2_queue *vq)
+{
+	int ret;
+	bool *cleared;
+	bool is_output = V4L2_TYPE_IS_OUTPUT(vq->type);
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vq);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+	struct vb2_v4l2_buffer *v4l2_vb;
+
+	if (is_output)
+		cleared = &stream->src_cleared;
+	else
+		cleared = &stream->dst_cleared;
+
+	if (is_output && stream->state == STREAM_STATE_DRAIN)
+		stream->check_drain_sequence_pending = true;
+
+	ret = virtio_video_req_queue_clear(vv, vvd->id, stream, is_output);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to clear queue\n");
+		return;
+	}
+
+	ret = wait_event_timeout(vv->wq, *cleared, 5 * HZ);
+	if (ret == 0) {
+		v4l2_err(&vv->v4l2_dev, "timed out waiting for queue clear\n");
+		return;
+	}
+
+	if (stream->check_drain_sequence_pending) {
+		v4l2_vb = v4l2_m2m_dst_buf_remove(stream->fh.m2m_ctx);
+		if (v4l2_vb)
+			virtio_video_mark_drain_complete(stream, v4l2_vb);
+		else
+			stream->mark_last_buffer_pending = true;
+	}
+
+	for (;;) {
+		if (is_output)
+			v4l2_vb = v4l2_m2m_src_buf_remove(stream->fh.m2m_ctx);
+		else
+			v4l2_vb = v4l2_m2m_dst_buf_remove(stream->fh.m2m_ctx);
+		if (!v4l2_vb)
+			break;
+		v4l2_m2m_buf_done(v4l2_vb, VB2_BUF_STATE_ERROR);
+	}
+
+	if (is_output)
+		stream->state = STREAM_STATE_STOPPED;
+	else
+		stream->state = STREAM_STATE_RESET;
+}
+
+static const struct vb2_ops virtio_video_qops = {
+	.queue_setup	 = virtio_video_queue_setup,
+	.buf_init	 = virtio_video_buf_init,
+	.buf_cleanup	 = virtio_video_buf_cleanup,
+	.buf_queue	 = virtio_video_buf_queue,
+	.start_streaming = virtio_video_start_streaming,
+	.stop_streaming  = virtio_video_stop_streaming,
+	.wait_prepare	 = vb2_ops_wait_prepare,
+	.wait_finish	 = vb2_ops_wait_finish,
+};
+
+static int virtio_video_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	int ret = 0, val;
+	struct virtio_video_stream *stream = ctrl2stream(ctrl);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_BITRATE:
+		ret = virtio_video_req_set_control(vv, vvd->id,
+						   stream->stream_id,
+						   ctrl->id, ctrl->val);
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		val = virtio_video_v4l2_level_to_virtio(ctrl->val);
+		if (val == VIRTIO_MPEG_VIDEO_H264_LEVEL_UNDEFINED)
+			return -EINVAL;
+		ret = virtio_video_req_set_control
+			(vv, vvd->id, stream->stream_id, ctrl->id, val);
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		val = virtio_video_v4l2_profile_to_virtio(ctrl->val);
+		if (val == VIRTIO_MPEG_VIDEO_H264_PROFILE_UNDEFINED)
+			return -EINVAL;
+		ret = virtio_video_req_set_control
+			(vv, vvd->id, stream->stream_id, ctrl->id, val);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int virtio_video_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	int ret = 0;
+	struct virtio_video_stream *stream = ctrl2stream(ctrl);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+
+	switch (ctrl->id) {
+	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
+		if (stream->state >= STREAM_STATE_INIT) {
+			/* TODO: Get the real value from the device */
+			ctrl->val = vvd->in_info.min_buffers;
+		} else {
+			ctrl->val = 0;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops virtio_video_ctrl_ops = {
+	.g_volatile_ctrl	= virtio_video_g_volatile_ctrl,
+	.s_ctrl			= virtio_video_s_ctrl,
+};
+
+int virtio_video_init_enc_ctrls(struct virtio_video_stream *stream)
+{
+	struct v4l2_ctrl *ctrl;
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+	struct video_capability *cap = NULL;
+
+	v4l2_ctrl_handler_init(&stream->ctrl_handler, 1);
+
+	ctrl = v4l2_ctrl_new_std(&stream->ctrl_handler,
+				&virtio_video_ctrl_ops,
+				V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
+				MIN_BUFS_MIN, MIN_BUFS_MAX, MIN_BUFS_STEP,
+				MIN_BUFS_DEF);
+	ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+
+	list_for_each_entry(cap, &vvd->ctrl_caps_list, caps_list_entry) {
+		struct video_controls *video_controls = &cap->u.controls;
+		struct video_control *control = NULL;
+		int ctrl_idx = 0;
+
+		for (ctrl_idx = 0; ctrl_idx < video_controls->num_controls;
+		     ctrl_idx++) {
+			control = &video_controls->control[ctrl_idx];
+			if (!control)
+				continue;
+
+			switch (control->control_type) {
+			case V4L2_CID_MPEG_VIDEO_BITRATE:
+				v4l2_ctrl_new_std
+					(&stream->ctrl_handler,
+					 &virtio_video_ctrl_ops,
+					 control->control_type,
+					 control->min, control->max,
+					 control->step, control->def);
+				break;
+
+			case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+			case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+				v4l2_ctrl_new_std_menu
+					(&stream->ctrl_handler,
+					 &virtio_video_ctrl_ops,
+					 control->control_type,
+					 control->max, 0, control->def);
+				break;
+			default:
+				v4l2_err(&vv->v4l2_dev,
+					 "unsupported control type\n");
+			}
+		}
+	}
+
+	if (stream->ctrl_handler.error)
+		return stream->ctrl_handler.error;
+
+	v4l2_ctrl_handler_setup(&stream->ctrl_handler);
+
+	return 0;
+}
+
+int virtio_video_init_enc_queues(void *priv, struct vb2_queue *src_vq,
+				 struct vb2_queue *dst_vq)
+{
+	int ret;
+	struct virtio_video_stream *stream = priv;
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct device *dev = vvd->vv->v4l2_dev.dev;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = stream;
+	src_vq->buf_struct_size = sizeof(struct virtio_video_buffer);
+	src_vq->ops = &virtio_video_qops;
+	src_vq->mem_ops = &vb2_dma_sg_memops;
+	src_vq->min_buffers_needed = vvd->in_info.min_buffers;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &stream->vq_mutex;
+	src_vq->dev = dev;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = stream;
+	dst_vq->buf_struct_size = sizeof(struct virtio_video_buffer);
+	dst_vq->ops = &virtio_video_qops;
+	dst_vq->mem_ops = &vb2_dma_sg_memops;
+	dst_vq->min_buffers_needed = vvd->out_info.min_buffers;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &stream->vq_mutex;
+	dst_vq->dev = dev;
+
+	return vb2_queue_init(dst_vq);
+}
+
+static int virtio_video_querycap(struct file *file, void *fh,
+				 struct v4l2_capability *cap)
+{
+	struct video_device *video_dev = video_devdata(file);
+
+	strncpy(cap->driver, DRIVER_NAME, sizeof(cap->driver));
+	strncpy(cap->card, video_dev->name, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "virtio:%s",
+		 video_dev->name);
+
+	cap->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
+
+	return 0;
+}
+
+static int virtio_video_enum_fmt_vid_cap(struct file *file, void *fh,
+					 struct v4l2_fmtdesc *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	if (f->index >= vvd->num_capture_formats)
+		return -EINVAL;
+
+	f->pixelformat = vvd->capture_fmts[f->index]->fourcc_format;
+
+	return 0;
+}
+
+static struct video_pix_format *find_pix_format(struct video_pix_format **list,
+						uint32_t fourcc, int num)
+{
+	int idx = 0;
+
+	for (idx = 0; idx < num; idx++) {
+		if (list[idx]->fourcc_format == fourcc)
+			return list[idx];
+	}
+	return NULL;
+}
+
+static int virtio_video_try_encoder_cmd(struct file *file, void *fh,
+					struct v4l2_encoder_cmd *cmd)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = video_drvdata(file);
+	struct virtio_video *vv = vvd->vv;
+
+	if (stream->state == STREAM_STATE_DRAIN)
+		return -EBUSY;
+
+	switch (cmd->cmd) {
+	case V4L2_ENC_CMD_STOP:
+	case V4L2_ENC_CMD_START:
+		if (cmd->flags != 0) {
+			v4l2_err(&vv->v4l2_dev, "flags=%u are not supported",
+				 cmd->flags);
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int virtio_video_encoder_cmd(struct file *file, void *fh,
+				    struct v4l2_encoder_cmd *cmd)
+{
+	int ret;
+	struct vb2_queue *src_vq, *dst_vq;
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = video_drvdata(file);
+	struct virtio_video *vv = vvd->vv;
+
+	ret = virtio_video_try_encoder_cmd(file, fh, cmd);
+	if (ret < 0)
+		return ret;
+
+	dst_vq = v4l2_m2m_get_vq(stream->fh.m2m_ctx,
+				 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	switch (cmd->cmd) {
+	case V4L2_ENC_CMD_START:
+		vb2_clear_last_buffer_dequeued(dst_vq);
+		ret = virtio_video_req_stream_start(vv, vvd->id,
+						    stream->stream_id);
+		if (ret)
+			return ret;
+		stream->state = STREAM_STATE_RUNNING;
+		break;
+	case V4L2_ENC_CMD_STOP:
+		src_vq = v4l2_m2m_get_vq(stream->fh.m2m_ctx,
+					 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+		if (!vb2_is_streaming(src_vq)) {
+			v4l2_dbg(1, vv->debug,
+				 &vv->v4l2_dev, "output is not streaming\n");
+			return 0;
+		}
+
+		if (!vb2_is_streaming(dst_vq)) {
+			v4l2_dbg(1, vv->debug,
+				 &vv->v4l2_dev, "capture is not streaming\n");
+			return 0;
+		}
+
+		ret = virtio_video_req_stream_drain(vv, vvd->id,
+						    stream->stream_id);
+		if (ret) {
+			v4l2_err(&vv->v4l2_dev, "failed to drain stream\n");
+			return ret;
+		}
+
+		stream->state = STREAM_STATE_DRAIN;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int virtio_video_enum_framesizes(struct file *file, void *fh,
+					struct v4l2_frmsizeenum *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct video_frame_size *frame_size = NULL;
+	int i = 0;
+	bool fake_non_discrete = false;
+	int idx = f->index;
+	struct video_pix_format *fmt = NULL;
+
+	fmt = find_pix_format(vvd->output_fmts, f->pixel_format,
+			      vvd->num_output_formats);
+	if (fmt == NULL)
+		fmt = find_pix_format(vvd->capture_fmts, f->pixel_format,
+				      vvd->num_capture_formats);
+	if (fmt == NULL)
+		return -EINVAL;
+
+	if (idx >= fmt->num_sizes)
+		return -EINVAL;
+
+	/* If the index is 0 - it is the first call of ENUM_FRAMESIZES, that
+	 * defines a type of all the frame sizes.
+	 *
+	 * Indexes > 0 can be used later only in case of the type is discrete.
+	 * But, if there is at least one non-discrete type later in the array -
+	 * it may be misinterpreted as a discrete one.
+	 *
+	 * Hence, check, whether there is a non-discrete frame size, and if yes
+	 * - return the first of them.
+	 */
+	if (!idx)
+		for (i = 0; i < fmt->num_sizes; i++) {
+			frame_size = &fmt->frame_sizes[i];
+			if (frame_size->min_width != frame_size->max_width ||
+			    frame_size->min_height != frame_size->max_height) {
+				idx = i;
+				fake_non_discrete = true;
+				break;
+			}
+		}
+
+	/* Index > 0 can be used only for discrete frame sizes. Type of the
+	 * frame sizes is equal to type of the first frame size.
+	 */
+	if (idx && !fake_non_discrete) {
+		frame_size = &fmt->frame_sizes[0];
+		if (frame_size->min_width != frame_size->max_width ||
+		    frame_size->min_height != frame_size->max_height)
+			return -EINVAL;
+	}
+
+	frame_size = &fmt->frame_sizes[idx];
+
+	if (frame_size->min_width == frame_size->max_width &&
+	   frame_size->min_height == frame_size->max_height) {
+		f->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+		f->discrete.width = frame_size->min_width;
+		f->discrete.height = frame_size->min_height;
+	} else {
+		if (idx && !fake_non_discrete)
+			return -EINVAL;
+		f->stepwise.min_width = frame_size->min_width;
+		f->stepwise.min_height = frame_size->min_height;
+		f->stepwise.step_height = frame_size->step_height;
+		f->stepwise.step_width = frame_size->step_width;
+		f->stepwise.max_height = frame_size->max_height;
+		f->stepwise.max_width = frame_size->max_width;
+		if (frame_size->step_width == 1 &&
+		    frame_size->min_height == 1) {
+			f->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+		} else {
+			f->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+		}
+	}
+
+	return 0;
+}
+
+static bool in_stepped_interval(uint32_t int_start, uint32_t int_end,
+				uint32_t step, uint32_t point)
+{
+	if (point < int_start || point > int_end)
+		return false;
+
+	if (step == 0 && int_start == int_end && int_start == point)
+		return true;
+
+	if (step != 0 && (point - int_start) % step == 0)
+		return true;
+
+	return false;
+}
+
+static int virtio_video_enum_framemintervals(struct file *file, void *fh,
+					     struct v4l2_frmivalenum *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct video_frame_size *fsize = NULL;
+	int fsize_idx = 0;
+	int i = 0;
+	bool fake_non_discrete = false;
+	int idx = f->index;
+	struct video_pix_format *fmt = NULL;
+	struct video_frame_rate *frate = NULL;
+
+	fmt = find_pix_format(vvd->output_fmts, f->pixel_format,
+			      vvd->num_output_formats);
+	if (fmt == NULL)
+		fmt = find_pix_format(vvd->capture_fmts, f->pixel_format,
+				      vvd->num_capture_formats);
+	if (fmt == NULL)
+		return -EINVAL;
+
+	for (fsize_idx = 0; fsize_idx <= fmt->num_sizes; fsize_idx++) {
+		fsize = &fmt->frame_sizes[fsize_idx];
+		if (in_stepped_interval(fsize->min_width, fsize->max_width,
+					fsize->step_width, f->width) &&
+		   in_stepped_interval(fsize->min_height, fsize->max_height,
+					fsize->step_height, f->height))
+			break;
+	}
+
+	if (fsize == NULL)
+		return -EINVAL;
+
+	if (idx >= fsize->num_rates)
+		return -EINVAL;
+
+	/* If the index is 0 - it is the first call of ENUM_FRAMEIVALS, that
+	 * defines a type of all the frame intervals.
+	 *
+	 * Indexes > 0 can be used later only in case of the type is discrete.
+	 * But, if there is at least one non-discrete type later in the array -
+	 * it may be misinterpreted as a discrete one.
+	 *
+	 * Hence, check, whether there is a non-discrete frame rate, and if yes
+	 * - return the first of them.
+	 */
+	if (!idx)
+		for (i = 0; i < fsize->num_rates; i++) {
+			frate = &fsize->frame_rates[i];
+			if (frate->min_rate != frate->max_rate) {
+				fake_non_discrete = true;
+				idx = i;
+				break;
+			}
+		}
+
+	/* Index > 0 can be used only for discrete frame rates. Type of the
+	 * frame rate is equal to the type of the first frame size.
+	 */
+	if (idx && !fake_non_discrete) {
+		frate = &fsize->frame_rates[0];
+		if (frate->max_rate != frate->min_rate)
+			return -EINVAL;
+	}
+
+	frate = &fsize->frame_rates[idx];
+	if (frate->max_rate == frate->min_rate) {
+		f->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+		f->discrete.numerator = 1;
+		f->discrete.denominator = frate->max_rate;
+	} else {
+		if (idx && !fake_non_discrete)
+			return -EINVAL;
+		/* If A > B, then 1/A < 1/B, so max denominator = min_rate
+		 * and vise versa
+		 */
+		f->stepwise.min.numerator = 1;
+		f->stepwise.min.denominator = frate->max_rate;
+		f->stepwise.max.numerator = 1;
+		f->stepwise.max.denominator = frate->min_rate;
+		f->stepwise.step.numerator = 1;
+		f->stepwise.step.denominator = frate->step;
+		if (frate->step == 1)
+			f->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
+		else
+			f->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	}
+
+	return 0;
+}
+
+static int virtio_video_enum_fmt_vid_out(struct file *file, void *fh,
+					 struct v4l2_fmtdesc *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	if (f->index >= vvd->num_output_formats)
+		return -EINVAL;
+
+	f->pixelformat = vvd->output_fmts[f->index]->fourcc_format;
+
+	return 0;
+}
+
+static void fill_v4l2_format_from_info(struct video_format_info *info,
+				       struct v4l2_pix_format_mplane *pix_mp)
+{
+	int i;
+
+	pix_mp->width = info->frame_width;
+	pix_mp->height = info->frame_height;
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->colorspace = V4L2_COLORSPACE_REC709;
+	pix_mp->xfer_func = 0;
+	pix_mp->ycbcr_enc = 0;
+	pix_mp->quantization = 0;
+	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
+	memset(pix_mp->plane_fmt[0].reserved, 0,
+	       sizeof(pix_mp->plane_fmt[0].reserved));
+
+	pix_mp->num_planes = info->num_planes;
+	pix_mp->pixelformat = info->fourcc_format;
+
+	for (i = 0; i < info->num_planes; i++) {
+		pix_mp->plane_fmt[i].bytesperline =
+					 info->plane_format[i].stride;
+		pix_mp->plane_fmt[i].sizeimage =
+					 info->plane_format[i].plane_size;
+	}
+}
+
+static int virtio_video_g_fmt(struct virtio_video_stream *stream,
+			      struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct video_format_info *info;
+
+	if (!V4L2_TYPE_IS_OUTPUT(f->type))
+		info = &stream->out_info;
+	else
+		info = &stream->in_info;
+
+	fill_v4l2_format_from_info(info, pix_mp);
+	return 0;
+}
+
+static int virtio_video_g_fmt_vid_out(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	return virtio_video_g_fmt(file2stream(file), f);
+}
+
+static int virtio_video_g_fmt_vid_cap(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	return virtio_video_g_fmt(file2stream(file), f);
+}
+
+static inline bool within_range(uint32_t min, uint32_t val, uint32_t max)
+{
+	return ((val - min) <= (max - min));
+}
+
+static inline bool needs_alignment(uint32_t val, uint32_t a)
+{
+	if (a == 0 || IS_ALIGNED(val, a))
+		return false;
+
+	return true;
+}
+
+static int virtio_video_try_fmt(struct virtio_video_stream *stream,
+				struct v4l2_format *f)
+{
+	int i, idx = 0;
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct video_pix_format *fmt = NULL;
+	struct video_frame_size *frm_sz = NULL;
+	bool found = false;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type))
+		fmt = find_pix_format(vvd->output_fmts, pix_mp->pixelformat,
+					 vvd->num_output_formats);
+	else
+		fmt = find_pix_format(vvd->capture_fmts, pix_mp->pixelformat,
+					 vvd->num_capture_formats);
+
+	if (!fmt) {
+		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+			fill_v4l2_format_from_info(&stream->out_info, pix_mp);
+		else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+			fill_v4l2_format_from_info(&stream->in_info, pix_mp);
+		else
+			return -EINVAL;
+		return 0;
+	}
+
+	for (i = 0; i < fmt->num_sizes && !found; i++) {
+		frm_sz = &fmt->frame_sizes[i];
+		if (!within_range(frm_sz->min_width, pix_mp->width,
+				 frm_sz->max_width))
+			continue;
+
+		if (!within_range(frm_sz->min_height, pix_mp->height,
+				  frm_sz->max_height))
+			continue;
+
+		idx = i;
+		/*
+		 * Try to find a more suitable frame size. Go with the current
+		 * one otherwise.
+		 */
+		if (needs_alignment(pix_mp->width, frm_sz->step_width))
+			continue;
+
+		if (needs_alignment(pix_mp->height, frm_sz->step_height))
+			continue;
+
+		stream->current_frame_size = frm_sz;
+		found = true;
+	}
+
+	if (!found) {
+		frm_sz = &fmt->frame_sizes[idx];
+		pix_mp->width = clamp(pix_mp->width, frm_sz->min_width,
+				      frm_sz->max_width);
+		if (frm_sz->step_width != 0)
+			pix_mp->width = ALIGN(pix_mp->width,
+					      frm_sz->step_width);
+
+		pix_mp->height = clamp(pix_mp->height, frm_sz->min_height,
+				      frm_sz->max_height);
+		if (frm_sz->step_height != 0)
+			pix_mp->height = ALIGN(pix_mp->height,
+				       frm_sz->step_height);
+		stream->current_frame_size = frm_sz;
+	}
+
+	return 0;
+}
+
+static int virtio_video_s_fmt(struct virtio_video_stream *stream,
+			      struct v4l2_format *f)
+{
+	int i, ret;
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+	struct video_format_info info;
+	struct video_format_info *p_info;
+	enum video_pin_type pin = VIDEO_PIN_TYPE_INPUT;
+
+	ret = virtio_video_try_fmt(stream, f);
+	if (ret)
+		return ret;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		info.frame_rate = stream->in_info.frame_rate;
+	} else {
+		info.frame_rate = stream->out_info.frame_rate;
+		pin = VIDEO_PIN_TYPE_OUTPUT;
+	}
+
+	info.frame_width = pix_mp->width;
+	info.frame_height = pix_mp->height;
+	info.num_planes = pix_mp->num_planes;
+	info.fourcc_format = pix_mp->pixelformat;
+
+	for (i = 0; i < info.num_planes; i++) {
+		info.plane_format[i].stride =
+					 pix_mp->plane_fmt[i].bytesperline;
+		info.plane_format[i].plane_size =
+					 pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	virtio_video_req_set_params(vv, vvd->id, &info, pin,
+				    VIDEO_PARAMS_SCOPE_STREAM, stream);
+	virtio_video_req_get_params(vv, vvd->id, VIDEO_PIN_TYPE_INPUT,
+				    VIDEO_PARAMS_SCOPE_STREAM, stream);
+	virtio_video_req_get_params(vv, vvd->id, VIDEO_PIN_TYPE_OUTPUT,
+				    VIDEO_PARAMS_SCOPE_STREAM, stream);
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type))
+		p_info = &stream->in_info;
+	else
+		p_info = &stream->out_info;
+
+	fill_v4l2_format_from_info(p_info, pix_mp);
+
+	if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
+		if (stream->state == STREAM_STATE_IDLE)
+			stream->state = STREAM_STATE_INIT;
+	}
+
+	return 0;
+}
+
+static int virtio_video_s_fmt_vid_cap(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+
+	return virtio_video_s_fmt(stream, f);
+}
+
+static int virtio_video_s_fmt_vid_out(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+
+	return virtio_video_s_fmt(stream, f);
+}
+
+static int virtio_video_try_framerate(struct virtio_video_stream *stream,
+				     unsigned int fps)
+{
+	int rate_idx;
+	struct video_frame_size *frame_size = NULL;
+
+	if (stream->current_frame_size == NULL)
+		return -EINVAL;
+
+	frame_size = stream->current_frame_size;
+	for (rate_idx = 0; rate_idx < frame_size->num_rates; rate_idx++) {
+		struct video_frame_rate *frame_rate =
+			&frame_size->frame_rates[rate_idx];
+
+		if (within_range(frame_rate->min_rate,
+				 fps, frame_rate->max_rate))
+			return 0;
+	}
+	return -EINVAL;
+}
+
+static void fill_timeperframe_from_info(struct video_format_info *info,
+					struct v4l2_fract *timeperframe)
+{
+	timeperframe->numerator = info->frame_rate;
+	timeperframe->denominator = 1;
+}
+
+static int virtio_video_g_parm(struct file *file, void *priv,
+			       struct v4l2_streamparm *a)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+	struct v4l2_outputparm *out = &a->parm.output;
+	struct v4l2_fract *timeperframe = &out->timeperframe;
+
+	if (!V4L2_TYPE_IS_OUTPUT(a->type)) {
+		v4l2_err(&vv->v4l2_dev,
+			 "Getting FPS is only possible for the output queue\n");
+		return -EINVAL;
+	}
+
+	out->capability = V4L2_CAP_TIMEPERFRAME;
+	fill_timeperframe_from_info(&stream->in_info, timeperframe);
+	return 0;
+}
+
+static int virtio_video_s_parm(struct file *file, void *priv,
+			       struct v4l2_streamparm *a)
+{
+	struct virtio_video_stream *stream = file2stream(file);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+	struct v4l2_outputparm *out = &a->parm.output;
+	struct v4l2_fract *timeperframe = &out->timeperframe;
+	struct video_format_info info, *p_info;
+	int i, ret;
+	u64 frame_interval, frame_rate;
+
+	if (V4L2_TYPE_IS_OUTPUT(a->type)) {
+		frame_interval = timeperframe->numerator * (u64)USEC_PER_SEC;
+		do_div(frame_interval, timeperframe->denominator);
+		if (!frame_interval)
+			return -EINVAL;
+
+		frame_rate = (u64)USEC_PER_SEC;
+		do_div(frame_rate, frame_interval);
+	} else {
+		v4l2_err(&vv->v4l2_dev,
+			 "Setting FPS is only possible for the output queue\n");
+		return -EINVAL;
+	}
+
+	ret = virtio_video_try_framerate(stream, frame_rate);
+	if (ret)
+		return ret;
+
+	p_info = &stream->in_info;
+	info.frame_rate = frame_rate;
+	info.frame_width = p_info->frame_width;
+	info.frame_height = p_info->frame_height;
+	info.num_planes = p_info->num_planes;
+	info.fourcc_format = p_info->fourcc_format;
+
+	for (i = 0; i < info.num_planes; i++) {
+		info.plane_format[i].stride =
+			p_info->plane_format[i].stride;
+		info.plane_format[i].plane_size =
+			p_info->plane_format[i].plane_size;
+	}
+
+	virtio_video_req_set_params(vv, vvd->id, &info, VIDEO_PIN_TYPE_INPUT,
+				    VIDEO_PARAMS_SCOPE_STREAM, stream);
+	virtio_video_req_get_params(vv, vvd->id, VIDEO_PIN_TYPE_INPUT,
+				    VIDEO_PARAMS_SCOPE_STREAM, stream);
+	virtio_video_req_get_params(vv, vvd->id, VIDEO_PIN_TYPE_OUTPUT,
+				    VIDEO_PARAMS_SCOPE_STREAM, stream);
+
+	out->capability = V4L2_CAP_TIMEPERFRAME;
+	fill_timeperframe_from_info(&stream->in_info, timeperframe);
+	return 0;
+}
+
+static int
+virtio_video_subscribe_event(struct v4l2_fh *fh,
+			     const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subscribe(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ioctl_ops virtio_video_device_enc_ioctl_ops = {
+	.vidioc_querycap	= virtio_video_querycap,
+
+	.vidioc_enum_fmt_vid_cap = virtio_video_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap	= virtio_video_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap	= virtio_video_s_fmt_vid_cap,
+
+	.vidioc_g_fmt_vid_cap_mplane	= virtio_video_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap_mplane	= virtio_video_s_fmt_vid_cap,
+
+	.vidioc_enum_fmt_vid_out = virtio_video_enum_fmt_vid_out,
+	.vidioc_g_fmt_vid_out	= virtio_video_g_fmt_vid_out,
+	.vidioc_s_fmt_vid_out	= virtio_video_s_fmt_vid_out,
+
+	.vidioc_g_fmt_vid_out_mplane	= virtio_video_g_fmt_vid_out,
+	.vidioc_s_fmt_vid_out_mplane	= virtio_video_s_fmt_vid_out,
+
+	.vidioc_try_encoder_cmd	= virtio_video_try_encoder_cmd,
+	.vidioc_encoder_cmd	= virtio_video_encoder_cmd,
+	.vidioc_enum_frameintervals = virtio_video_enum_framemintervals,
+	.vidioc_enum_framesizes = virtio_video_enum_framesizes,
+
+	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_s_parm		= virtio_video_s_parm,
+	.vidioc_g_parm		= virtio_video_g_parm,
+
+	.vidioc_subscribe_event = virtio_video_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+int virtio_video_enc_init(struct virtio_video_device *vvd)
+{
+	struct video_device *vd = NULL;
+
+	if (!vvd)
+		return -EINVAL;
+
+	vd = &vvd->video_dev;
+	vd->ioctl_ops = &virtio_video_device_enc_ioctl_ops;
+	return 0;
+}
diff --git a/drivers/media/virtio/virtio_video_enc.h b/drivers/media/virtio/virtio_video_enc.h
new file mode 100644
index 000000000000..28fb385f40a7
--- /dev/null
+++ b/drivers/media/virtio/virtio_video_enc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Encoder header for virtio video driver.
+ *
+ * Copyright 2019 OpenSynergy GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _VIRTIO_VIDEO_ENC_H
+#define _VIRTIO_VIDEO_ENC_H
+
+#include "virtio_video.h"
+
+int virtio_video_enc_init(struct virtio_video_device *vvd);
+int virtio_video_init_enc_ctrls(struct virtio_video_stream *stream);
+int virtio_video_init_enc_queues(void *priv, struct vb2_queue *src_vq,
+				 struct vb2_queue *dst_vq);
+
+#endif /* _VIRTIO_VIDEO_ENC_H */
diff --git a/drivers/media/virtio/virtio_video_vq.c b/drivers/media/virtio/virtio_video_vq.c
new file mode 100644
index 000000000000..4ad72332112f
--- /dev/null
+++ b/drivers/media/virtio/virtio_video_vq.c
@@ -0,0 +1,950 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Driver for virtio video device.
+ *
+ * Copyright 2019 OpenSynergy GmbH.
+ *
+ * Based on drivers/gpu/drm/virtio/virtgpu_vq.c
+ * Copyright (C) 2015 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "virtio_video.h"
+
+#define MAX_INLINE_CMD_SIZE   298
+#define MAX_INLINE_RESP_SIZE  298
+#define VBUFFER_SIZE          (sizeof(struct virtio_video_vbuffer) \
+			       + MAX_INLINE_CMD_SIZE		   \
+			       + MAX_INLINE_RESP_SIZE)
+
+void virtio_video_resource_id_get(struct virtio_video *vv, uint32_t *id)
+{
+	int handle;
+
+	idr_preload(GFP_KERNEL);
+	spin_lock(&vv->resource_idr_lock);
+	handle = idr_alloc(&vv->resource_idr, NULL, 1, 0, GFP_NOWAIT);
+	spin_unlock(&vv->resource_idr_lock);
+	idr_preload_end();
+	*id = handle;
+}
+
+void virtio_video_resource_id_put(struct virtio_video *vv, uint32_t id)
+{
+	spin_lock(&vv->resource_idr_lock);
+	idr_remove(&vv->resource_idr, id);
+	spin_unlock(&vv->resource_idr_lock);
+}
+
+void virtio_video_stream_id_get(struct virtio_video *vv,
+				struct virtio_video_stream *stream,
+				uint32_t *id)
+{
+	int handle;
+
+	idr_preload(GFP_KERNEL);
+	spin_lock(&vv->stream_idr_lock);
+	handle = idr_alloc(&vv->stream_idr, stream, 1, 0, 0);
+	spin_unlock(&vv->stream_idr_lock);
+	idr_preload_end();
+	*id = handle;
+}
+
+void virtio_video_stream_id_put(struct virtio_video *vv, uint32_t id)
+{
+	spin_lock(&vv->stream_idr_lock);
+	idr_remove(&vv->stream_idr, id);
+	spin_unlock(&vv->stream_idr_lock);
+}
+
+void virtio_video_ctrl_ack(struct virtqueue *vq)
+{
+	struct virtio_video *vv = vq->vdev->priv;
+
+	schedule_work(&vv->ctrlq.dequeue_work);
+}
+
+void virtio_video_event_ack(struct virtqueue *vq)
+{
+	struct virtio_video *vv = vq->vdev->priv;
+
+	schedule_work(&vv->eventq.dequeue_work);
+}
+
+static struct virtio_video_vbuffer *
+virtio_video_get_vbuf(struct virtio_video *vv, int size,
+		      int resp_size, void *resp_buf,
+		      virtio_video_resp_cb resp_cb)
+{
+	struct virtio_video_vbuffer *vbuf;
+
+	vbuf = kmem_cache_alloc(vv->vbufs, GFP_KERNEL);
+	if (!vbuf)
+		return ERR_PTR(-ENOMEM);
+	memset(vbuf, 0, VBUFFER_SIZE);
+
+	BUG_ON(size > MAX_INLINE_CMD_SIZE);
+	vbuf->buf = (void *)vbuf + sizeof(*vbuf);
+	vbuf->size = size;
+
+	vbuf->resp_cb = resp_cb;
+	vbuf->resp_size = resp_size;
+	if (resp_size <= MAX_INLINE_RESP_SIZE && !resp_buf)
+		vbuf->resp_buf = (void *)vbuf->buf + size;
+	else
+		vbuf->resp_buf = resp_buf;
+	BUG_ON(!vbuf->resp_buf);
+
+	return vbuf;
+}
+
+static void free_vbuf(struct virtio_video *vv,
+		      struct virtio_video_vbuffer *vbuf)
+{
+	if (!vbuf->resp_cb &&
+	    vbuf->resp_size > MAX_INLINE_RESP_SIZE)
+		kfree(vbuf->resp_buf);
+	kfree(vbuf->data_buf);
+	kmem_cache_free(vv->vbufs, vbuf);
+}
+
+static void reclaim_vbufs(struct virtqueue *vq, struct list_head *reclaim_list)
+{
+	struct virtio_video_vbuffer *vbuf;
+	unsigned int len;
+	struct virtio_video *vv = vq->vdev->priv;
+	int freed = 0;
+
+	while ((vbuf = virtqueue_get_buf(vq, &len))) {
+		list_add_tail(&vbuf->list, reclaim_list);
+		freed++;
+	}
+
+	if (freed == 0)
+		v4l2_dbg(1, vv->debug, &vv->v4l2_dev,
+			 "zero vbufs reclaimed\n");
+}
+
+static void detach_vbufs(struct virtqueue *vq, struct list_head *detach_list)
+{
+	struct virtio_video_vbuffer *vbuf;
+
+	while ((vbuf = virtqueue_detach_unused_buf(vq)) != NULL)
+		list_add_tail(&vbuf->list, detach_list);
+}
+
+static void virtio_video_deatch_vbufs(struct virtio_video *vv)
+{
+	struct list_head detach_list;
+	struct virtio_video_vbuffer *entry, *tmp;
+
+	INIT_LIST_HEAD(&detach_list);
+
+	detach_vbufs(vv->eventq.vq, &detach_list);
+	detach_vbufs(vv->ctrlq.vq, &detach_list);
+
+	if (list_empty(&detach_list))
+		return;
+
+	list_for_each_entry_safe(entry, tmp, &detach_list, list) {
+		list_del(&entry->list);
+		free_vbuf(vv, entry);
+	}
+}
+
+int virtio_video_alloc_vbufs(struct virtio_video *vv)
+{
+	vv->vbufs =
+		kmem_cache_create("virtio-video-vbufs", VBUFFER_SIZE,
+				  __alignof__(struct virtio_video_vbuffer), 0,
+				  NULL);
+	if (!vv->vbufs)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void virtio_video_free_vbufs(struct virtio_video *vv)
+{
+	virtio_video_deatch_vbufs(vv);
+	kmem_cache_destroy(vv->vbufs);
+	vv->vbufs = NULL;
+}
+
+static void *virtio_video_alloc_req(struct virtio_video *vv,
+				    struct virtio_video_vbuffer **vbuffer_p,
+				    int size)
+{
+	struct virtio_video_vbuffer *vbuf;
+
+	vbuf = virtio_video_get_vbuf(vv, size,
+				     sizeof(struct virtio_video_ctrl_hdr),
+				     NULL, NULL);
+	if (IS_ERR(vbuf)) {
+		*vbuffer_p = NULL;
+		return ERR_CAST(vbuf);
+	}
+	*vbuffer_p = vbuf;
+
+	return vbuf->buf;
+}
+
+static void *
+virtio_video_alloc_req_resp(struct virtio_video *vv,
+			    virtio_video_resp_cb cb,
+			    struct virtio_video_vbuffer **vbuffer_p,
+			    int req_size, int resp_size,
+			    void *resp_buf)
+{
+	struct virtio_video_vbuffer *vbuf;
+
+	vbuf = virtio_video_get_vbuf(vv, req_size, resp_size, resp_buf, cb);
+	if (IS_ERR(vbuf)) {
+		*vbuffer_p = NULL;
+		return ERR_CAST(vbuf);
+	}
+	*vbuffer_p = vbuf;
+
+	return vbuf->buf;
+}
+
+void virtio_video_dequeue_ctrl_func(struct work_struct *work)
+{
+	struct virtio_video *vv =
+		container_of(work, struct virtio_video,
+			     ctrlq.dequeue_work);
+	struct list_head reclaim_list;
+	struct virtio_video_vbuffer *entry, *tmp;
+	struct virtio_video_ctrl_hdr *resp;
+
+	INIT_LIST_HEAD(&reclaim_list);
+	spin_lock(&vv->ctrlq.qlock);
+	do {
+		virtqueue_disable_cb(vv->ctrlq.vq);
+		reclaim_vbufs(vv->ctrlq.vq, &reclaim_list);
+
+	} while (!virtqueue_enable_cb(vv->ctrlq.vq));
+	spin_unlock(&vv->ctrlq.qlock);
+
+	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
+		resp = (struct virtio_video_ctrl_hdr *)entry->resp_buf;
+		if (resp->type >= cpu_to_le32(VIRTIO_VIDEO_S_ERR_UNSPEC))
+			v4l2_dbg(1, vv->debug, &vv->v4l2_dev,
+				 "response 0x%x\n", le32_to_cpu(resp->type));
+		if (entry->resp_cb)
+			entry->resp_cb(vv, entry);
+
+		list_del(&entry->list);
+		free_vbuf(vv, entry);
+	}
+	wake_up(&vv->ctrlq.ack_queue);
+}
+
+void virtio_video_dequeue_event_func(struct work_struct *work)
+{
+	struct virtio_video *vv =
+		container_of(work, struct virtio_video,
+			     eventq.dequeue_work);
+	struct list_head reclaim_list;
+	struct virtio_video_vbuffer *entry, *tmp;
+
+	INIT_LIST_HEAD(&reclaim_list);
+	spin_lock(&vv->eventq.qlock);
+	do {
+		virtqueue_disable_cb(vv->eventq.vq);
+		reclaim_vbufs(vv->eventq.vq, &reclaim_list);
+
+	} while (!virtqueue_enable_cb(vv->eventq.vq));
+	spin_unlock(&vv->eventq.qlock);
+
+	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
+		entry->resp_cb(vv, entry);
+		list_del(&entry->list);
+	}
+	wake_up(&vv->eventq.ack_queue);
+}
+
+static int
+virtio_video_queue_ctrl_buffer_locked(struct virtio_video *vv,
+				      struct virtio_video_vbuffer *vbuf)
+{
+	struct virtqueue *vq = vv->ctrlq.vq;
+	struct scatterlist *sgs[3], vreq, vout, vresp;
+	int outcnt = 0, incnt = 0;
+	int ret;
+
+	if (!vv->vq_ready)
+		return -ENODEV;
+
+	sg_init_one(&vreq, vbuf->buf, vbuf->size);
+	sgs[outcnt + incnt] = &vreq;
+	outcnt++;
+
+	if (vbuf->data_size) {
+		sg_init_one(&vout, vbuf->data_buf, vbuf->data_size);
+		sgs[outcnt + incnt] = &vout;
+		outcnt++;
+	}
+
+	if (vbuf->resp_size) {
+		sg_init_one(&vresp, vbuf->resp_buf, vbuf->resp_size);
+		sgs[outcnt + incnt] = &vresp;
+		incnt++;
+	}
+
+retry:
+	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
+	if (ret == -ENOSPC) {
+		spin_unlock(&vv->ctrlq.qlock);
+		wait_event(vv->ctrlq.ack_queue, vq->num_free);
+		spin_lock(&vv->ctrlq.qlock);
+		goto retry;
+	} else {
+		virtqueue_kick(vq);
+	}
+
+	return ret;
+}
+
+static int virtio_video_queue_ctrl_buffer(struct virtio_video *vv,
+					  struct virtio_video_vbuffer *vbuf)
+{
+	int ret;
+
+	spin_lock(&vv->ctrlq.qlock);
+	ret = virtio_video_queue_ctrl_buffer_locked(vv, vbuf);
+	spin_unlock(&vv->ctrlq.qlock);
+
+	return ret;
+}
+
+static int virtio_video_queue_event_buffer(struct virtio_video *vv,
+					   struct virtio_video_vbuffer *vbuf)
+{
+	int ret;
+	struct scatterlist vresp;
+	struct virtqueue *vq = vv->eventq.vq;
+
+	spin_lock(&vv->eventq.qlock);
+	sg_init_one(&vresp, vbuf->resp_buf, vbuf->resp_size);
+	ret = virtqueue_add_inbuf(vq, &vresp, 1, vbuf, GFP_ATOMIC);
+	spin_unlock(&vv->eventq.qlock);
+	if (ret)
+		return ret;
+
+	virtqueue_kick(vq);
+
+	return 0;
+}
+
+static void virtio_video_event_cb(struct virtio_video *vv,
+				  struct virtio_video_vbuffer *vbuf)
+{
+	int ret;
+	struct virtio_video_stream *stream;
+	struct virtio_video_event *event =
+		(struct virtio_video_event *)vbuf->resp_buf;
+
+	stream = idr_find(&vv->stream_idr, event->stream_id);
+	if (!stream) {
+		v4l2_warn(&vv->v4l2_dev, "no stream %u found for event\n",
+			  event->stream_id);
+		return;
+	}
+
+	switch (le32_to_cpu(event->event_type)) {
+	case VIRTIO_VIDEO_EVENT_T_RESOLUTION_CHANGED:
+		virtio_video_req_get_params(vv, event->function_id,
+					    VIDEO_PIN_TYPE_OUTPUT,
+					    VIDEO_PARAMS_SCOPE_STREAM, stream);
+		virtio_video_queue_res_chg_event(stream);
+		break;
+	case VIRTIO_VIDEO_EVENT_T_CONFIGURED:
+		if (stream->state == STREAM_STATE_INIT) {
+			stream->state = STREAM_STATE_METADATA;
+			wake_up(&vv->wq);
+		}
+		break;
+	default:
+		v4l2_warn(&vv->v4l2_dev, "failed to queue event buffer\n");
+		break;
+	}
+
+	memset(vbuf->resp_buf, 0, vbuf->resp_size);
+	ret = virtio_video_queue_event_buffer(vv, vbuf);
+	if (ret)
+		v4l2_warn(&vv->v4l2_dev, "queue event buffer failed\n");
+}
+
+int virtio_video_alloc_events(struct virtio_video *vv, size_t num)
+{
+	int ret;
+	size_t i;
+	struct virtio_video_vbuffer *vbuf;
+
+	for (i = 0; i < num; i++) {
+		vbuf = virtio_video_get_vbuf(vv, 0,
+					     sizeof(struct virtio_video_event),
+					     NULL, virtio_video_event_cb);
+		if (IS_ERR(vbuf))
+			return PTR_ERR(vbuf);
+
+		ret = virtio_video_queue_event_buffer(vv, vbuf);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int virtio_video_req_stream_create(struct virtio_video *vv,
+				   uint32_t function_id, uint32_t stream_id,
+				   const char *name)
+{
+	struct virtio_video_stream_create *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_STREAM_CREATE);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+	strncpy(req_p->debug_name, name, sizeof(req_p->debug_name) - 1);
+	req_p->debug_name[sizeof(req_p->debug_name) - 1] = 0;
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+int virtio_video_req_stream_destroy(struct virtio_video *vv,
+				    uint32_t function_id, uint32_t stream_id)
+{
+	struct virtio_video_stream_destroy *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_STREAM_DESTROY);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+int virtio_video_req_stream_start(struct virtio_video *vv,
+				  uint32_t function_id, uint32_t stream_id)
+{
+	struct virtio_video_stream_start *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_STREAM_START);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+int virtio_video_req_stream_stop(struct virtio_video *vv,
+				 uint32_t function_id,
+				 struct virtio_video_stream *stream)
+{
+	struct virtio_video_stream_stop *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_STREAM_STOP);
+	req_p->hdr.stream_id = cpu_to_le32(stream->stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+
+	vbuf->priv = stream;
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+int virtio_video_req_stream_drain(struct virtio_video *vv,
+				  uint32_t function_id, uint32_t stream_id)
+{
+	struct virtio_video_stream_drain *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_STREAM_DRAIN);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+int virtio_video_req_resource_create(struct virtio_video *vv,
+				     uint32_t function_id, uint32_t stream_id,
+				     uint32_t resource_id)
+{
+	struct virtio_video_resource_create *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_RESOURCE_CREATE);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+	req_p->resource_id = cpu_to_le32(resource_id);
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+int virtio_video_req_resource_destroy(struct virtio_video *vv,
+				      uint32_t function_id, uint32_t stream_id,
+				      uint32_t resource_id)
+{
+	struct virtio_video_resource_destroy *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_RESOURCE_DESTROY);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+	req_p->resource_id = cpu_to_le32(resource_id);
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+static void
+virtio_video_req_resource_queue_cb(struct virtio_video *vv,
+				   struct virtio_video_vbuffer *vbuf)
+{
+	uint32_t flags, bytesused;
+	uint64_t timestamp;
+	struct virtio_video_buffer *virtio_vb = vbuf->priv;
+	struct virtio_video_resource_queue_resp *resp =
+		(struct virtio_video_resource_queue_resp *)vbuf->resp_buf;
+
+	flags = le32_to_cpu(resp->flags);
+	bytesused = le32_to_cpu(resp->size);
+	timestamp = le64_to_cpu(resp->timestamp);
+
+	virtio_video_buf_done(virtio_vb, flags, timestamp, bytesused);
+}
+
+int virtio_video_req_resource_queue(struct virtio_video *vv,
+				    uint32_t function_id, uint32_t stream_id,
+				    struct virtio_video_buffer *virtio_vb,
+				    uint32_t data_size[],
+				    uint8_t num_data_size, bool is_in)
+{
+	uint8_t i;
+	struct virtio_video_resource_queue *req_p;
+	struct virtio_video_resource_queue_resp *resp_p;
+	struct virtio_video_vbuffer *vbuf;
+	size_t resp_size = sizeof(struct virtio_video_resource_queue_resp);
+
+	req_p = virtio_video_alloc_req_resp(vv,
+					    &virtio_video_req_resource_queue_cb,
+					    &vbuf, sizeof(*req_p), resp_size,
+					    NULL);
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_RESOURCE_QUEUE);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+	req_p->pin_type = cpu_to_le32(is_in ? VIRTIO_VIDEO_PIN_INPUT :
+				      VIRTIO_VIDEO_PIN_OUTPUT);
+
+	for (i = 0; i < num_data_size; ++i)
+		req_p->data_size[i] = cpu_to_le32(data_size[i]);
+
+	req_p->resource_id = cpu_to_le32(virtio_vb->resource_id);
+	req_p->nr_data_size = num_data_size;
+	req_p->timestamp =
+		cpu_to_le64(virtio_vb->v4l2_m2m_vb.vb.vb2_buf.timestamp);
+
+	resp_p = (struct virtio_video_resource_queue_resp *)vbuf->resp_buf;
+	memset(resp_p, 0, sizeof(*resp_p));
+
+	vbuf->priv = virtio_vb;
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+int
+virtio_video_req_resource_attach_backing(struct virtio_video *vv,
+					 uint32_t function_id,
+					 uint32_t stream_id,
+					 uint32_t resource_id,
+					 struct virtio_video_mem_entry *ents,
+					 uint32_t nents)
+{
+	struct virtio_video_resource_attach_backing *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_RESOURCE_ATTACH_BACKING);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+	req_p->resource_id = cpu_to_le32(resource_id);
+	req_p->nr_entries = cpu_to_le32(nents);
+
+	vbuf->data_buf = ents;
+	vbuf->data_size = sizeof(*ents) * nents;
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+static void
+virtio_video_req_detach_backing_cb(struct virtio_video *vv,
+				   struct virtio_video_vbuffer *vbuf)
+{
+	struct virtio_video_buffer *virtio_vb = vbuf->priv;
+
+	virtio_vb->detached = true;
+	wake_up(&vv->wq);
+}
+
+int
+virtio_video_req_resource_detach_backing(struct virtio_video *vv,
+					 uint32_t function_id,
+					 uint32_t stream_id,
+					 struct virtio_video_buffer *virtio_vb)
+{
+	struct virtio_video_resource_detach_backing *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req_resp
+		(vv, &virtio_video_req_detach_backing_cb, &vbuf, sizeof(*req_p),
+		 sizeof(struct virtio_video_ctrl_hdr), NULL);
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_RESOURCE_DETACH_BACKING);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+	req_p->resource_id = cpu_to_le32(virtio_vb->resource_id);
+	vbuf->priv = virtio_vb;
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+static void
+virtio_video_req_queue_clear_cb(struct virtio_video *vv,
+				struct virtio_video_vbuffer *vbuf)
+{
+	struct virtio_video_stream *stream = vbuf->priv;
+	struct virtio_video_queue_clear *req_p =
+		(struct virtio_video_queue_clear *)vbuf->buf;
+
+	if (le32_to_cpu(req_p->pin_type) == VIRTIO_VIDEO_PIN_INPUT)
+		stream->src_cleared = true;
+	else
+		stream->dst_cleared = true;
+
+	wake_up(&vv->wq);
+}
+
+int virtio_video_req_queue_clear(struct virtio_video *vv, uint32_t function_id,
+				 struct virtio_video_stream *stream,
+				 bool is_in)
+{
+	struct virtio_video_queue_clear *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req_resp
+		(vv, &virtio_video_req_queue_clear_cb, &vbuf, sizeof(*req_p),
+		 sizeof(struct virtio_video_ctrl_hdr), NULL);
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_QUEUE_CLEAR);
+	req_p->hdr.stream_id = cpu_to_le32(stream->stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+	req_p->pin_type = cpu_to_le32(is_in ? VIRTIO_VIDEO_PIN_INPUT :
+				      VIRTIO_VIDEO_PIN_OUTPUT);
+
+	vbuf->priv = stream;
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+static void
+virtio_video_req_funcs_cb(struct virtio_video *vv,
+			  struct virtio_video_vbuffer *vbuf)
+{
+	bool *got_resp_p = vbuf->priv;
+	*got_resp_p = true;
+	wake_up(&vv->wq);
+}
+
+int virtio_video_req_funcs(struct virtio_video *vv, void *resp_buf,
+			   size_t resp_size)
+{
+	struct virtio_video_get_functions *req_p = NULL;
+	struct virtio_video_vbuffer *vbuf = NULL;
+
+	if (!vv || !resp_buf)
+		return -1;
+
+	req_p = virtio_video_alloc_req_resp(vv, &virtio_video_req_funcs_cb,
+					    &vbuf, sizeof(*req_p), resp_size,
+					    resp_buf);
+	if (IS_ERR(req_p))
+		return -1;
+
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_GET_FUNCS);
+
+	vbuf->priv = &vv->got_funcs;
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+static void
+virtio_video_req_get_params_cb(struct virtio_video *vv,
+			       struct virtio_video_vbuffer *vbuf)
+{
+	int i;
+	struct virtio_video_get_params_resp *resp =
+		(struct virtio_video_get_params_resp *)vbuf->resp_buf;
+	struct virtio_video_params *params = &resp->params;
+	struct virtio_video_stream *stream = vbuf->priv;
+	enum virtio_video_pin_type pin_type;
+	enum virtio_video_scope_type scope;
+	struct video_format_info *format_info = NULL;
+	struct virtio_video_device *vvd  = NULL;
+
+	pin_type = le32_to_cpu(params->pin_type);
+	scope = le32_to_cpu(params->scope);
+
+	vvd = to_virtio_vd(stream->video_dev);
+	if (!vvd) {
+		v4l2_warn(&vv->v4l2_dev, "no video device found\n");
+		return;
+	}
+
+	if (scope == VIRTIO_VIDEO_SCOPE_STREAM) {
+		if (pin_type == VIRTIO_VIDEO_PIN_INPUT)
+			format_info = &stream->in_info;
+		else
+			format_info = &stream->out_info;
+	} else {
+		if (pin_type == VIRTIO_VIDEO_PIN_INPUT)
+			format_info = &vvd->in_info;
+		else
+			format_info = &vvd->out_info;
+	}
+
+	if (!format_info)
+		return;
+
+	format_info->frame_rate = le32_to_cpu(params->frame_rate);
+	format_info->frame_width = le32_to_cpu(params->frame_width);
+	format_info->frame_height = le32_to_cpu(params->frame_height);
+	format_info->min_buffers = le32_to_cpu(params->min_buffers);
+	format_info->fourcc_format = virtio_video_format_to_v4l2(
+			 le32_to_cpu(params->pixel_format));
+
+	format_info->num_planes = le32_to_cpu(params->num_planes);
+	for (i = 0; i < le32_to_cpu(params->num_planes); i++) {
+		struct virtio_video_plane_format *plane_formats =
+						 &params->plane_formats[i];
+		struct video_plane_format *plane_format =
+						 &format_info->plane_format[i];
+
+		plane_format->channel = le32_to_cpu(plane_formats->channel);
+		plane_format->plane_size =
+				 le32_to_cpu(plane_formats->plane_size);
+		plane_format->stride = le32_to_cpu(plane_formats->stride);
+		plane_format->padding = le32_to_cpu(plane_formats->padding);
+	}
+
+	format_info->is_updated = true;
+	wake_up(&vv->wq);
+}
+
+int virtio_video_req_get_params(struct virtio_video *vv, uint32_t function_id,
+				enum video_pin_type pin_type,
+				enum video_params_scope params_scope,
+				struct virtio_video_stream *stream)
+{
+	int ret;
+	struct virtio_video_get_params *req_p = NULL;
+	struct virtio_video_vbuffer *vbuf = NULL;
+	struct virtio_video_get_params_resp *resp_p;
+	struct video_format_info *format_info = NULL;
+	size_t resp_size = sizeof(struct virtio_video_get_params_resp);
+	struct virtio_video_device *vvd  = NULL;
+
+	if (!vv || !stream)
+		return -1;
+
+	req_p = virtio_video_alloc_req_resp(vv,
+					&virtio_video_req_get_params_cb,
+					&vbuf, sizeof(*req_p), resp_size,
+					NULL);
+
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_GET_PARAMS);
+	req_p->hdr.stream_id = cpu_to_le32(stream->stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+	req_p->pin_type =
+		cpu_to_le32(pin_type == VIDEO_PIN_TYPE_INPUT ?
+			    VIRTIO_VIDEO_PIN_INPUT : VIRTIO_VIDEO_PIN_OUTPUT);
+	req_p->scope =
+		cpu_to_le32(params_scope == VIDEO_PARAMS_SCOPE_DEVICE ?
+			    VIRTIO_VIDEO_SCOPE_GLOBAL :
+			    VIRTIO_VIDEO_SCOPE_STREAM);
+	resp_p = (struct virtio_video_get_params_resp *)vbuf->resp_buf;
+	memset(resp_p, 0, sizeof(*resp_p));
+
+	if (req_p->scope == VIRTIO_VIDEO_SCOPE_STREAM) {
+		if (req_p->pin_type == VIRTIO_VIDEO_PIN_INPUT)
+			format_info = &stream->in_info;
+		else
+			format_info = &stream->out_info;
+	} else {
+		vvd = to_virtio_vd(stream->video_dev);
+		if (!vvd) {
+			v4l2_warn(&vv->v4l2_dev, "no video device found\n");
+			return -1;
+		}
+		if (req_p->pin_type == VIRTIO_VIDEO_PIN_INPUT)
+			format_info = &vvd->in_info;
+		else
+			format_info = &vvd->out_info;
+	}
+
+	if (!format_info)
+		return -1;
+
+	format_info->is_updated = false;
+
+	vbuf->priv = stream;
+	ret = virtio_video_queue_ctrl_buffer(vv, vbuf);
+	if (ret)
+		return ret;
+
+	ret = wait_event_timeout(vv->wq,
+				 format_info->is_updated, 5 * HZ);
+	if (ret == 0) {
+		v4l2_err(&vv->v4l2_dev, "timed out waiting for get_params\n");
+		return -1;
+	}
+	return 0;
+}
+
+int
+virtio_video_req_set_params(struct virtio_video *vv, uint32_t function_id,
+			    struct video_format_info *format_info,
+			    enum video_pin_type pin_type,
+			    enum video_params_scope params_scope,
+			    struct virtio_video_stream *stream)
+{
+	int i;
+	struct virtio_video_set_params *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_SET_PARAMS);
+	req_p->hdr.stream_id = cpu_to_le32(stream->stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+	req_p->params.pin_type =
+		cpu_to_le32(pin_type == VIDEO_PIN_TYPE_INPUT ?
+			    VIRTIO_VIDEO_PIN_INPUT : VIRTIO_VIDEO_PIN_OUTPUT);
+	req_p->params.scope =
+		cpu_to_le32(params_scope == VIDEO_PARAMS_SCOPE_DEVICE ?
+			    VIRTIO_VIDEO_SCOPE_GLOBAL :
+			    VIRTIO_VIDEO_SCOPE_STREAM);
+	req_p->params.frame_rate = cpu_to_le32(format_info->frame_rate);
+	req_p->params.frame_width = cpu_to_le32(format_info->frame_width);
+	req_p->params.frame_height =
+				 cpu_to_le32(format_info->frame_height);
+	req_p->params.pixel_format = virtio_video_v4l2_fourcc_to_virtio(
+				 cpu_to_le32(format_info->fourcc_format));
+	req_p->params.min_buffers = cpu_to_le32(format_info->min_buffers);
+	req_p->params.num_planes = cpu_to_le32(format_info->num_planes);
+
+	for (i = 0; i < format_info->num_planes; i++) {
+		struct virtio_video_plane_format *plane_formats =
+			&req_p->params.plane_formats[i];
+		struct video_plane_format *plane_format =
+			&format_info->plane_format[i];
+		plane_formats->channel = cpu_to_le32(plane_format->channel);
+		plane_formats->plane_size =
+				 cpu_to_le32(plane_format->plane_size);
+		plane_formats->stride = cpu_to_le32(plane_format->stride);
+		plane_formats->padding = cpu_to_le32(plane_format->padding);
+	}
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
+int virtio_video_req_set_control(struct virtio_video *vv,
+				 uint32_t function_id, uint32_t stream_id,
+				 uint32_t control, uint32_t val)
+{
+	struct virtio_video_set_control *req_p;
+	struct virtio_video_vbuffer *vbuf;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+	memset(req_p, 0, sizeof(*req_p));
+
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_T_SET_CONTROL);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->hdr.function_id = cpu_to_le32(function_id);
+	req_p->type = virtio_video_v4l2_control_to_virtio(cpu_to_le32(control));
+	req_p->val = cpu_to_le64(val);
+
+	return virtio_video_queue_ctrl_buffer(vv, vbuf);
+}
+
diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index 585e07b27333..8be72c11ae22 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -47,4 +47,6 @@
 #define VIRTIO_ID_FS           26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM         27 /* virtio pmem */
 
+#define VIRTIO_ID_VIDEO        29 /* virtio video  */
+
 #endif /* _LINUX_VIRTIO_IDS_H */
diff --git a/include/uapi/linux/virtio_video.h b/include/uapi/linux/virtio_video.h
new file mode 100644
index 000000000000..c8122f03bfeb
--- /dev/null
+++ b/include/uapi/linux/virtio_video.h
@@ -0,0 +1,456 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Virtio Video Device
+ *
+ * This header is BSD licensed so anyone can use the definitions
+ * to implement compatible drivers/servers:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the name of IBM nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL IBM OR
+ * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
+ * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ */
+
+#ifndef _UAPI_VIRTIO_VIDEO_H
+#define	_UAPI_VIRTIO_VIDEO_H
+
+#include <linux/types.h>
+#include <linux/virtio_config.h>
+
+/* Maximum number of planes associated with a resource. */
+#define VIRTIO_VIDEO_MAX_PLANES 8
+
+/* Maximum size of get params response */
+#define VIRTIO_VIDEO_MAXSIZE_GET_PARAMS 1024
+
+enum virtio_video_func_type {
+	VIRTIO_VIDEO_FUNC_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_FUNC_ENCODER = 0x0100,
+	VIRTIO_VIDEO_FUNC_DECODER,
+	VIRTIO_VIDEO_FUNC_PROCESSOR,
+	VIRTIO_VIDEO_FUNC_CAPTURE,
+	VIRTIO_VIDEO_FUNC_OUTPUT,
+};
+
+enum virtio_video_ctrl_type {
+	VIRTIO_VIDEO_CTRL_UNDEFINED = 0,
+
+	/* request */
+	VIRTIO_VIDEO_T_GET_FUNCS = 0x0100,
+	VIRTIO_VIDEO_T_STREAM_CREATE,
+	VIRTIO_VIDEO_T_STREAM_DESTROY,
+	VIRTIO_VIDEO_T_STREAM_START,
+	VIRTIO_VIDEO_T_STREAM_STOP,
+	VIRTIO_VIDEO_T_STREAM_DRAIN,
+	VIRTIO_VIDEO_T_RESOURCE_CREATE,
+	VIRTIO_VIDEO_T_RESOURCE_DESTROY,
+	VIRTIO_VIDEO_T_RESOURCE_ATTACH_BACKING,
+	VIRTIO_VIDEO_T_RESOURCE_DETACH_BACKING,
+	VIRTIO_VIDEO_T_RESOURCE_QUEUE,
+	VIRTIO_VIDEO_T_QUEUE_CLEAR,
+	VIRTIO_VIDEO_T_SET_PARAMS,
+	VIRTIO_VIDEO_T_GET_PARAMS,
+	VIRTIO_VIDEO_T_SET_CONTROL,
+
+	/* response */
+	VIRTIO_VIDEO_S_OK = 0x0200,
+	VIRTIO_VIDEO_S_OK_RESOURCE_QUEUE,
+	VIRTIO_VIDEO_S_OK_GET_PARAMS,
+
+	VIRTIO_VIDEO_S_ERR_UNSPEC = 0x0300,
+	VIRTIO_VIDEO_S_ERR_OUT_OF_MEMORY,
+	VIRTIO_VIDEO_S_ERR_INVALID_FUNCTION_ID,
+	VIRTIO_VIDEO_S_ERR_INVALID_RESOURCE_ID,
+	VIRTIO_VIDEO_S_ERR_INVALID_STREAM_ID,
+	VIRTIO_VIDEO_S_ERR_INVALID_PARAMETER,
+};
+
+enum virtio_video_event_type {
+	VIRTIO_VIDEO_EVENT_T_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_EVENT_T_RESOLUTION_CHANGED = 0x0100,
+	VIRTIO_VIDEO_EVENT_T_CONFIGURED,
+};
+
+enum virtio_video_buffer_flag {
+	VIRTIO_VIDEO_BUFFER_F_ERR	= 0x0001,
+	VIRTIO_VIDEO_BUFFER_F_EOS	= 0x0002,
+	VIRTIO_VIDEO_BUFFER_IFRAME	= 0x0004,
+	VIRTIO_VIDEO_BUFFER_PFRAME	= 0x0008,
+	VIRTIO_VIDEO_BUFFER_BFRAME	= 0x0010,
+};
+
+enum virtio_video_desc_type {
+	VIRTIO_VIDEO_DESC_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_DESC_FRAME_RATE = 0x0100,
+	VIRTIO_VIDEO_DESC_FRAME_SIZE,
+	VIRTIO_VIDEO_DESC_PIX_FORMAT,
+	VIRTIO_VIDEO_DESC_PLANE_FORMAT,
+	VIRTIO_VIDEO_DESC_CONTROL,
+	VIRTIO_VIDEO_DESC_EXTRAS,
+	VIRTIO_VIDEO_DESC_CAP,
+	VIRTIO_VIDEO_DESC_FUNC,
+	VIRTIO_VIDEO_DESC_PARAMS,
+	VIRTIO_VIDEO_DESC_DEFAULTS,
+};
+
+enum virtio_video_pin_type {
+	VIRTIO_VIDEO_PIN_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_PIN_INPUT = 0x0100,
+	VIRTIO_VIDEO_PIN_OUTPUT,
+};
+
+enum virtio_video_channel_type {
+	VIRTIO_VIDEO_CHANNEL_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_CHANNEL_Y = 0x0100,
+	VIRTIO_VIDEO_CHANNEL_U,
+	VIRTIO_VIDEO_CHANNEL_V,
+	VIRTIO_VIDEO_CHANNEL_UV,
+	VIRTIO_VIDEO_CHANNEL_VU,
+	VIRTIO_VIDEO_CHANNEL_YUV,
+	VIRTIO_VIDEO_CHANNEL_YVU,
+	VIRTIO_VIDEO_CHANNEL_BGR,
+	VIRTIO_VIDEO_CHANNEL_BGRX,
+};
+
+enum virtio_video_control_type {
+	VIRTIO_VIDEO_CONTROL_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_CONTROL_BITRATE = 0x100,
+	VIRTIO_VIDEO_CONTROL_PROFILE,
+	VIRTIO_VIDEO_CONTROL_LEVEL,
+};
+
+enum virtio_video_scope_type {
+	VIRTIO_VIDEO_SCOPE_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_SCOPE_GLOBAL = 0x0100,
+	VIRTIO_VIDEO_SCOPE_STREAM,
+};
+
+enum virtio_video_cap_type {
+	VIRTIO_VIDEO_CAP_UNDEFINED = 0,
+
+	VIRTIO_VIDEO_CAP_PIN_FORMATS = 0x0100,
+	VIRTIO_VIDEO_CAP_CONTROL,
+};
+
+struct virtio_video_ctrl_hdr {
+	__le32 type;
+	__le32 stream_id;
+	__le32 function_id;
+	__u8 padding[4];
+};
+
+struct virtio_video_desc {
+	__le32 type; /* One of VIRTIO_VIDEO_DESC_* types */
+	__le16 length;
+	__u8 padding[2];
+};
+
+struct virtio_video_frame_rate {
+	struct virtio_video_desc desc;
+	__le32 min_rate;
+	__le32 max_rate;
+	__le32 step;
+	__u8 padding[4];
+};
+
+struct virtio_video_frame_size {
+	struct virtio_video_desc desc;
+	__le32 min_width;
+	__le32 max_width;
+	__le32 step_width;
+	__le32 min_height;
+	__le32 max_height;
+	__le32 step_height;
+	__le32 num_rates;
+	__u8 padding[4];
+	/* Followed by struct virtio_video_frame_rate frame_rates[]; */
+};
+
+struct virtio_video_pix_format {
+	struct virtio_video_desc desc;
+	__le32 pixel_format;
+	__le32 num_sizes;
+	/* Followed by struct virtio_video_frame_size frame_sizes[]; */
+};
+
+struct virtio_video_frame_format {
+	__le32 pin_type; /* One of VIRTIO_VIDEO_PIN_* types */
+	__le32 num_formats;
+	/* Followed by struct virtio_video_pix_format pix_formats[]; */
+};
+
+struct virtio_video_extras {
+	struct virtio_video_desc desc;
+};
+
+struct virtio_video_plane_format {
+	struct virtio_video_desc desc;
+	__le32 channel; /* One of VIRTIO_VIDEO_CHANNEL_* types */
+	__le32 plane_size;
+	__le32 stride;
+	__le32 padding;
+};
+
+struct virtio_video_control {
+	struct virtio_video_desc desc;
+	__le32 control_type;  /* One of VIRTO_VIDEO_CONTROL_* types */
+	__le32 step;
+	__le64 min;
+	__le64 max;
+	__le64 def;
+};
+
+struct virtio_video_controls {
+	__le32 num_controls;
+	__u8 padding[4];
+	/* Followed by struct virtio_video_control control[]; */
+};
+
+struct virtio_video_capability {
+	struct virtio_video_desc desc;
+	__le32 cap_type; /* One of VIRTIO_VIDEO_CAP_* types */
+	__le32 cap_id;
+	union {
+		struct virtio_video_frame_format frame_format;
+		struct virtio_video_controls controls;
+	} u;
+};
+
+struct virtio_video_params {
+	struct virtio_video_desc desc;
+	__le32 pin_type; /* One of VIRTIO_VIDEO_PIN_* types */
+	__le32 scope; /* One of VIRTIO_VIDEO_SCOPE_* types */
+	__le32 frame_rate;
+	__le32 frame_width;
+	__le32 frame_height;
+	__le32 pixel_format;
+	__le32 min_buffers;
+	__le32 num_planes;
+	struct virtio_video_plane_format plane_formats[VIRTIO_VIDEO_MAX_PLANES];
+	struct virtio_video_extras extra;
+
+};
+
+struct virtio_video_function {
+	struct virtio_video_desc desc;
+	__le32 function_type; /* One of VIRTIO_VIDEO_FUNC_* types */
+	__le32 function_id;
+	struct virtio_video_params in_params;
+	struct virtio_video_params out_params;
+	__le32 num_caps;
+	__u8 padding[4];
+	/* Followed by struct virtio_video_capability video_caps[]; */
+};
+
+struct virtio_video_config {
+	__u32 num_functions;
+	__u32 total_functions_size;
+};
+
+struct virtio_video_mem_entry {
+	__le64 addr;
+	__le32 length;
+	__u8 padding[4];
+};
+
+struct virtio_video_event {
+	__le32 event_type;
+	__le32 function_id;
+	__le32 stream_id;
+	__u8 padding[4];
+};
+
+/* VIRTIO_VIDEO_T_GET_FUNCS */
+struct virtio_video_get_functions {
+	struct virtio_video_ctrl_hdr hdr;
+};
+
+/* VIRTIO_VIDEO_T_STREAM_CREATE */
+struct virtio_video_stream_create {
+	struct virtio_video_ctrl_hdr hdr;
+	char debug_name[64];
+};
+
+/* VIRTIO_VIDEO_T_STREAM_DESTROY */
+struct virtio_video_stream_destroy {
+	struct virtio_video_ctrl_hdr hdr;
+};
+
+/* VIRTIO_VIDEO_T_STREAM_START */
+struct virtio_video_stream_start {
+	struct virtio_video_ctrl_hdr hdr;
+};
+
+/* VIRTIO_VIDEO_T_STREAM_STOP */
+struct virtio_video_stream_stop {
+	struct virtio_video_ctrl_hdr hdr;
+};
+
+/* VIRTIO_VIDEO_T_STREAM_DRAIN */
+struct virtio_video_stream_drain {
+	struct virtio_video_ctrl_hdr hdr;
+};
+
+/* VIRTIO_VIDEO_T_RESOURCE_CREATE */
+struct virtio_video_resource_create {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 resource_id;
+	__u8 padding[4];
+};
+
+/* VIRTIO_VIDEO_T_RESOURCE_DESTROY */
+struct virtio_video_resource_destroy {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 resource_id;
+	__u8 padding[4];
+};
+
+/* VIRTIO_VIDEO_T_RESOURCE_ATTACH_BACKING */
+struct virtio_video_resource_attach_backing {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 resource_id;
+	__le32 nr_entries;
+};
+
+/* VIRTIO_VIDEO_T_RESOURCE_DETACH_BACKING*/
+struct virtio_video_resource_detach_backing {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 resource_id;
+	__u8 padding[4];
+};
+
+/* VIRTIO_VIDEO_T_RESOURCE_QUEUE */
+struct virtio_video_resource_queue {
+	struct virtio_video_ctrl_hdr hdr;
+	__le64 timestamp;
+	__le32 resource_id;
+	__le32 pin_type;
+	__le32 data_size[VIRTIO_VIDEO_MAX_PLANES];
+	__u8 nr_data_size;
+	__u8 padding[7];
+};
+
+/* VIRTIO_VIDEO_QUEUE_CLEAR */
+struct virtio_video_queue_clear {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 pin_type;
+	__u8 padding[4];
+};
+
+/* VIRTIO_VIDEO_T_SET_PARAMS */
+struct virtio_video_set_params {
+	struct virtio_video_ctrl_hdr hdr;
+	struct virtio_video_params params;
+};
+
+/* VIRTIO_VIDEO_T_GET_PARAMS */
+struct virtio_video_get_params {
+	struct virtio_video_ctrl_hdr hdr;
+	__le32 pin_type; /* One of VIRTIO_VIDEO_PIN_* types */
+	__le32 scope; /* One of VIRTIO_VIDEO_SCOPE_* types */
+};
+
+struct virtio_video_resource_queue_resp {
+	struct virtio_video_ctrl_hdr hdr;
+	__le64 timestamp;
+	__le32 flags; /* One of VIRTIO_VIDEO_BUFFER_* flags */
+	__le32 size;  /* Encoded size */
+};
+
+struct virtio_video_get_params_resp {
+	struct virtio_video_ctrl_hdr hdr;
+	struct virtio_video_params params;
+};
+
+/* VIRTIO_VIDEO_T_SET_CONTROL */
+struct virtio_video_set_control {
+	struct virtio_video_ctrl_hdr hdr;
+	__le64 val;
+	__le32 type;  /* One of VIRTO_VIDEO_CONTROL_* types */
+	__u8 padding[4];
+};
+
+enum virtio_video_pix_format_type {
+	VIRTIO_VIDEO_PIX_FMT_UNKNOWN = 0,
+
+	VIRTIO_VIDEO_PIX_FMT_H264 = 0x100,
+	VIRTIO_VIDEO_PIX_FMT_NV12,
+	VIRTIO_VIDEO_PIX_FMT_NV21,
+	VIRTIO_VIDEO_PIX_FMT_I420,
+	VIRTIO_VIDEO_PIX_FMT_I422,
+	VIRTIO_VIDEO_PIX_FMT_XBGR,
+	VIRTIO_VIDEO_PIX_FMT_H265,
+	VIRTIO_VIDEO_PIX_FMT_MPEG4,
+	VIRTIO_VIDEO_PIX_FMT_MPEG2,
+};
+
+enum virtio_video_profile_type {
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_UNDEFINED = 0,
+
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_BASELINE	= 0x100,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_MAIN,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_EXTENDED,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_422,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_10_INTRA,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_HIGH_444_INTRA,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_CAVLC_444_INTRA,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH,
+	VIRTIO_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+};
+
+enum virtio_video_level_type {
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_UNDEFINED = 0,
+
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_1_0 = 0x100,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_1B,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_1_1,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_1_2,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_1_3,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_2_0,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_2_1,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_2_2,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_3_0,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_3_1,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_3_2,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_4_0,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_4_1,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_4_2,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_5_0,
+	VIRTIO_MPEG_VIDEO_H264_LEVEL_5_1,
+};
+
+#endif /* _UAPI_VIRTIO_VIDEO_H */
-- 
2.24.0


________________________________________
From: Dmitry Sepp
Sent: Thursday, December 05, 2019 17:11
To: linux-media@vger.kernel.org
Cc: virtio-dev@lists.oasis-open.org; kraxel@redhat.com; tfiga@chromium.org; keiichiw@chromium.org; acourbot@chromium.org; hverkuil@xs4all.nl; posciak@chromium.org; marcheu@chromium.org; stevensd@chromium.org; dgreid@chromium.org; daniel@ffwll.ch; egranata@google.com
Subject: [RFC] virtio video driver

Hello,

My apologies for the long delay. The driver code is now available and provided
as a follow-up to the discussion from this thread [1].

The reference Linux kernel 5.4 driver implementation is located here:
https://github.com/OpenSynergy/linux/tree/virtio-video-draft-v1

The driver is implemented using the V4L2 API. It allocates a v4l2 device for
each probed virtio device and then creates a video device for each function
within the respective virtio device. The driver implements the stateful
decoder interface [2] and the stateful encoder interface (WIP) [3].

The DMA SG memory allocator tries to map buffers right away. As it is not
always suitable, and some implementations might need just a physical address,
we had to introduce a set of simple dma ops directly in the driver.

The driver is in the RFC state and currently a bit ahead of the spec that was
proposed in the discussion mentioned above. On the other hand, the driver
unfortunately does not yet include changes proposed in the recent comments
[4]. The driver currently supports encoder and decoder functions. Also, it
does not fully pass the v4l2-compliance yet, it has been a bit out of the
focus so far.

Any feedback and contribution would be greatly appreciated.

[1] https://markmail.org/message/gc6h25acct22niut
[2] https://www.kernel.org/doc/html/v5.4/media/uapi/v4l/dev-decoder.html
[3] https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-encoder.html
[4] https://markmail.org/message/yy67elx2adbivdsp

Best regards,
Dmitry.

