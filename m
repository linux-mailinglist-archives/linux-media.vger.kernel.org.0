Return-Path: <linux-media+bounces-59552-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Oj3F5+v62mRQQAAu9opvQ
	(envelope-from <linux-media+bounces-59552-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 19:59:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E79924622FC
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 19:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 569E1300E286
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 17:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C083E7169;
	Fri, 24 Apr 2026 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eyFGk3wj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF006343D75;
	Fri, 24 Apr 2026 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777053577; cv=none; b=GenwAKgafa1zvRMDfSqNC6aFb7jBDMzNw0+q9lA9ZlYzjpc0IQ++WSxlgQqn3NPeTMQsZ/qyl/5T9AzV1aiH4rYCcP6c/FxgOCw0GghxfZxM0yaN748c4whFy4dJr4+ng0hnTpOR+3hyc2glAecWTDZ34pGgeZk8+fPyejEhOrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777053577; c=relaxed/simple;
	bh=8wPJ/zXi4bZsFsZQZaVuI6s0RECiBWurXMUJQl8/4Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HeO6IAJixhjNOF+SYdR2i/vA1sj6GupxZsUHBjBfXKoLsxt2Afwc+Sq+kQcjaAfb4YtiowuqQ8+U+k4/OowI/G387BthKwo8nWL2dkM2LReF45ywlRGpioTPnykbMCmR9KwP35qu4S64HukryQMxrqQqH/QYcGxn82zGAK41K24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eyFGk3wj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:5216:c7b6:205:5f59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 007821E3E;
	Fri, 24 Apr 2026 19:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777053472;
	bh=8wPJ/zXi4bZsFsZQZaVuI6s0RECiBWurXMUJQl8/4Yw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eyFGk3wjwQbTT7aiECfv7q8o3zFdaIvqTVX+hEphXTTOUQkYxrHRVH+BaWYHRvfWP
	 ZqJ/9cmX8DUMio+ImzRs0jANvjIYsuUYi8dF2l3bIA8CeBsI/Q1qo64GCc6ZkRzV6r
	 kGj6iQMPgauC3nx85Bw40186AzVCtLLcEaTl4qhQ=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/5] media: rkisp2: Add parameters output video node
Date: Sat, 25 Apr 2026 02:58:49 +0900
Message-ID: <20260424175853.638202-5-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260424175853.638202-1-paul.elder@ideasonboard.com>
References: <20260424175853.638202-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E79924622FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59552-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]

Implement support for setting parameters on the ISP by queueing
parameter buffers to rkisp2.

Support for the following parameters is added:
- BLS (black level subtraction)
- AWB gains (color gains)
- CSM (color space conversion)
- CCM (color correction matrix)
- GOC (gamma out correction)
- LSC (lens shading correction)

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp2/Makefile   |   3 +-
 .../platform/rockchip/rkisp2/rkisp2-common.h  |  50 ++
 .../platform/rockchip/rkisp2/rkisp2-dev.c     |  15 +
 .../platform/rockchip/rkisp2/rkisp2-isp.c     |  11 +-
 .../platform/rockchip/rkisp2/rkisp2-params.c  | 775 ++++++++++++++++++
 .../rockchip/rkisp2/rkisp2-regs-v3x.h         |  31 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/rkisp2-config.h            | 314 +++++++
 include/uapi/linux/videodev2.h                |   3 +
 9 files changed, 1201 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-params.c

diff --git a/drivers/media/platform/rockchip/rkisp2/Makefile b/drivers/media/platform/rockchip/rkisp2/Makefile
index 9a9d7b5233c4..0fa014afcae4 100644
--- a/drivers/media/platform/rockchip/rkisp2/Makefile
+++ b/drivers/media/platform/rockchip/rkisp2/Makefile
@@ -4,7 +4,8 @@ rockchip-isp2-y := rkisp2-capture.o \
            rkisp2-common.o \
            rkisp2-dev.o \
            rkisp2-dmarx.o \
-           rkisp2-isp.o
+           rkisp2-isp.o \
+           rkisp2-params.o
 
 rockchip-isp2-$(CONFIG_DEBUG_FS) += rkisp2-debug.o
 
diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h b/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
index e08adfec2c50..7473dae6c525 100644
--- a/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
+++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
@@ -22,6 +22,7 @@
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-isp.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "rkisp2-regs.h"
@@ -88,6 +89,7 @@ enum rkisp2_fmt_raw_pat_type {
 /* enum for the isp pads */
 enum rkisp2_isp_pad {
 	RKISP2_ISP_PAD_SINK_VIDEO,
+	RKISP2_ISP_PAD_SINK_PARAMS,
 	RKISP2_ISP_PAD_SOURCE_VIDEO,
 	RKISP2_ISP_PAD_MAX
 };
@@ -182,6 +184,26 @@ struct rkisp2_buffer {
 	dma_addr_t buff_addr[VIDEO_MAX_PLANES];
 };
 
+/*
+ * struct rkisp2_params_buffer - A container for the vb2 buffers used by the
+ *				 params video device
+ *
+ * @vb:		vb2 buffer
+ * @queue:	entry of the buffer in the queue
+ * @cfg:	scratch buffer used for caching the ISP configuration parameters
+ */
+struct rkisp2_params_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	struct v4l2_isp_params_buffer *cfg;
+};
+
+static inline struct rkisp2_params_buffer *
+to_rkisp2_params_buffer(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct rkisp2_params_buffer, vb);
+}
+
 /*
  * struct rkisp2_dummy_buffer - A buffer to write the next frame to in case
  *				there are no vb2 buffers available.
@@ -292,6 +314,25 @@ struct rkisp2_capture {
 	struct v4l2_rect crop;
 };
 
+/*
+ * struct rkisp2_params - ISP input parameters device
+ *
+ * @vnode:		video node
+ * @rkisp2:		pointer to the rkisp2 device
+ * @buf_lock:	locks the buffer list 'params'
+ * @params:		queue of rkisp2_buffer
+ * @raw_type:		the bayer pattern on the isp video sink pad
+ */
+struct rkisp2_params {
+	struct rkisp2_vdev_node vnode;
+	struct rkisp2_device *rkisp2;
+
+	spinlock_t buf_lock; /* locks the buffers list 'params' */
+	struct list_head params;
+
+	enum rkisp2_fmt_raw_pat_type raw_type;
+};
+
 struct rkisp2_debug {
 	struct dentry *debugfs_dir;
 	unsigned long data_loss;
@@ -324,6 +365,7 @@ struct rkisp2_debug {
  * @resizer_devs:  resizer sub-devices
  * @capture_devs:  capture devices
  * @dmarx:	   ISP memory read device
+ * @params:	   ISP parameters metadata output device
  * @pipe:	   media pipeline
  * @stream_lock:   serializes {start/stop}_streaming callbacks between the capture devices.
  * @debug:	   debug params to be exposed on debugfs
@@ -345,6 +387,7 @@ struct rkisp2_device {
 	struct rkisp2_isp isp;
 	struct rkisp2_capture capture_devs[2];
 	struct rkisp2_dmarx dmarx;
+	struct rkisp2_params params;
 	struct media_pipeline pipe;
 	struct mutex stream_lock; /* serialize {start/stop}_streaming cb between capture devices */
 	struct rkisp2_debug debug;
@@ -434,6 +477,7 @@ irqreturn_t rkisp2_isp_isr(int irq, void *ctx);
 irqreturn_t rkisp2_capture_isr(int irq, void *ctx);
 irqreturn_t rkisp2_mipi_isr(int irq, void *ctx);
 void rkisp2_dmarx_isr(struct rkisp2_device *rkisp2, u32 status);
+void rkisp2_params_isr(struct rkisp2_params *params);
 
 /* register/unregisters functions of the entities */
 int rkisp2_capture_devs_register(struct rkisp2_device *rkisp2);
@@ -444,6 +488,12 @@ void rkisp2_isp_unregister(struct rkisp2_device *rkisp2);
 int rkisp2_dmarx_register(struct rkisp2_device *rkisp2);
 void rkisp2_dmarx_unregister(struct rkisp2_device *rkisp2);
 
+int rkisp2_params_register(struct rkisp2_device *rkisp2);
+void rkisp2_params_unregister(struct rkisp2_device *rkisp2);
+void rkisp2_params_pre_configure(struct rkisp2_params *params,
+				 enum rkisp2_fmt_raw_pat_type bayer_pat);
+void rkisp2_params_post_configure(struct rkisp2_params *params);
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 void rkisp2_debug_init(struct rkisp2_device *rkisp2);
 void rkisp2_debug_cleanup(struct rkisp2_device *rkisp2);
diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c b/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
index 4d5c41850395..0356ef2a1cf1 100644
--- a/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
+++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
@@ -129,11 +129,22 @@ static int rkisp2_create_links(struct rkisp2_device *rkisp2)
 			return ret;
 	}
 
+	/* params links */
+	ret = media_create_pad_link(&rkisp2->params.vnode.vdev.entity, 0,
+				    &rkisp2->isp.sd.entity,
+				    RKISP2_ISP_PAD_SINK_PARAMS,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret)
+		return ret;
+
+
 	return 0;
 }
 
 static void rkisp2_entities_unregister(struct rkisp2_device *rkisp2)
 {
+	rkisp2_params_unregister(rkisp2);
 	rkisp2_dmarx_unregister(rkisp2);
 	rkisp2_capture_devs_unregister(rkisp2);
 	rkisp2_isp_unregister(rkisp2);
@@ -155,6 +166,10 @@ static int rkisp2_entities_register(struct rkisp2_device *rkisp2)
 	if (ret)
 		goto error;
 
+	ret = rkisp2_params_register(rkisp2);
+	if (ret)
+		goto error;
+
 	ret = rkisp2_create_links(rkisp2);
 	if (ret)
 		goto error;
diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c b/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
index 4140139da3c1..0967d5772bc9 100644
--- a/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
+++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
@@ -120,6 +120,10 @@ static int rkisp2_config_isp(struct rkisp2_isp *isp,
 		    RKISP2_CIF_ISP_PIC_SIZE_ERROR;
 	rkisp2_write(rkisp2, RKISP2_CIF_ISP_IMSC, irq_mask);
 
+	src_frm = v4l2_subdev_state_get_format(sd_state,
+					       RKISP2_ISP_PAD_SOURCE_VIDEO);
+	rkisp2_params_pre_configure(&rkisp2->params, sink_fmt->bayer_pat);
+
 	isp->sink_fmt = sink_fmt;
 
 	return 0;
@@ -248,6 +252,8 @@ static int rkisp2_isp_start(struct rkisp2_isp *isp,
 	       RKISP2_CIF_ISP_CTRL_ISP_INFORM_ENABLE | RKISP2_CIF_ISP_CTRL_ISP_CFG_UPD_PERMANENT;
 	rkisp2_write(rkisp2, RKISP2_CIF_ISP_CTRL, val);
 
+	rkisp2_params_post_configure(&rkisp2->params);
+
 	return 0;
 }
 
@@ -804,6 +810,7 @@ int rkisp2_isp_register(struct rkisp2_device *rkisp2)
 
 	pads[RKISP2_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
 						MEDIA_PAD_FL_MUST_CONNECT;
+	pads[RKISP2_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
 	pads[RKISP2_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&sd->entity, RKISP2_ISP_PAD_MAX, pads);
@@ -893,8 +900,10 @@ irqreturn_t rkisp2_isp_isr(int irq, void *ctx)
 		rkisp2->debug.data_loss++;
 	}
 
-	if (status & RKISP2_CIF_ISP_FRAME)
+	if (status & RKISP2_CIF_ISP_FRAME) {
 		rkisp2->debug.complete_frames++;
+		rkisp2_params_isr(&rkisp2->params);
+	}
 
 	rkisp2_write(rkisp2, RKISP2_CIF_ISP_ICR, status);
 
diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c b/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
new file mode 100644
index 000000000000..b7b27d0e90c6
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
@@ -0,0 +1,775 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Rockchip ISP2 Driver - Params subdevice
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2026 Ideas on Board Oy.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/build_bug.h>
+#include <linux/math.h>
+#include <linux/string.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-isp.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "rkisp2-common.h"
+
+#define RKISP2_PARAMS_DEV_NAME	RKISP2_DRIVER_NAME "_params"
+
+#define RKISP2_PARAMS_BLOCK_INFO(block, data) \
+	[RKISP2_PARAMS_BLOCK_ ## block] = { \
+		.size = sizeof(struct rkisp2_params_ ## data ), \
+	}
+
+#define RKISP2_PARAMS_BLOCK_HANDLER_INFO(block, handler_postfix, prio_postfix) \
+	[RKISP2_PARAMS_BLOCK_ ## block] = { \
+		.handler = rkisp2_params_ ## handler_postfix,\
+		.priority = RKISP2_PARAMS_CONFIG_PRIO_ ## prio_postfix, \
+	}
+
+union rkisp2_params_block {
+	const struct v4l2_isp_params_block_header *header;
+	const struct rkisp2_params_bls *bls;
+	const struct rkisp2_params_awb_gains *awb_gains;
+	const struct rkisp2_params_csm *csm;
+	const struct rkisp2_params_ccm *ccm;
+	const struct rkisp2_params_goc *goc;
+	const struct rkisp2_params_lsc *lsc;
+	const __u8 *data;
+};
+
+static void rkisp2_params_bls(struct rkisp2_params *params,
+			      union rkisp2_params_block block);
+static void rkisp2_params_awb_gains(struct rkisp2_params *params,
+				    union rkisp2_params_block block);
+static void rkisp2_params_csm(struct rkisp2_params *params,
+			      union rkisp2_params_block block);
+static void rkisp2_params_ccm(struct rkisp2_params *params,
+			      union rkisp2_params_block block);
+static void rkisp2_params_goc(struct rkisp2_params *params,
+			      union rkisp2_params_block block);
+static void rkisp2_params_lsc(struct rkisp2_params *params,
+			      union rkisp2_params_block block);
+
+typedef void (*rkisp2_params_handler)(struct rkisp2_params *params,
+				      const union rkisp2_params_block block);
+
+enum rkisp2_params_configure_priority {
+	RKISP2_PARAMS_CONFIG_PRIO_NONE = 0,
+	RKISP2_PARAMS_CONFIG_PRIO_PRE,
+	RKISP2_PARAMS_CONFIG_PRIO_POST,
+};
+
+struct rkisp2_params_block_handler_info {
+	rkisp2_params_handler handler;
+	enum rkisp2_params_configure_priority priority;
+};
+
+static const struct rkisp2_params_block_handler_info
+rkisp2_params_handlers[] = {
+	RKISP2_PARAMS_BLOCK_HANDLER_INFO(BLS, bls, PRE),
+	RKISP2_PARAMS_BLOCK_HANDLER_INFO(AWB_GAINS, awb_gains, PRE),
+	RKISP2_PARAMS_BLOCK_HANDLER_INFO(CSM, csm, PRE),
+	RKISP2_PARAMS_BLOCK_HANDLER_INFO(CCM, ccm, PRE),
+	RKISP2_PARAMS_BLOCK_HANDLER_INFO(GOC, goc, PRE),
+	RKISP2_PARAMS_BLOCK_HANDLER_INFO(LSC, lsc, POST),
+};
+
+static const struct v4l2_isp_params_block_type_info
+rkisp2_params_block_types_info[] = {
+	RKISP2_PARAMS_BLOCK_INFO(BLS, bls),
+	RKISP2_PARAMS_BLOCK_INFO(AWB_GAINS, awb_gains),
+	RKISP2_PARAMS_BLOCK_INFO(CSM, csm),
+	RKISP2_PARAMS_BLOCK_INFO(CCM, ccm),
+	RKISP2_PARAMS_BLOCK_INFO(GOC, goc),
+	RKISP2_PARAMS_BLOCK_INFO(LSC, lsc),
+};
+
+static_assert(ARRAY_SIZE(rkisp2_params_handlers) ==
+	      ARRAY_SIZE(rkisp2_params_block_types_info));
+
+static inline void
+rkisp2_param_set_bits(struct rkisp2_params *params, u32 reg, u32 bit_mask)
+{
+	u32 val;
+
+	val = rkisp2_read(params->rkisp2, reg);
+	rkisp2_write(params->rkisp2, reg, val | bit_mask);
+}
+
+static inline void
+rkisp2_param_clear_bits(struct rkisp2_params *params, u32 reg, u32 bit_mask)
+{
+	u32 val;
+
+	val = rkisp2_read(params->rkisp2, reg);
+	rkisp2_write(params->rkisp2, reg, val & ~bit_mask);
+}
+
+static void rkisp2_params_bls(struct rkisp2_params *params,
+			      union rkisp2_params_block block)
+{
+	const struct rkisp2_params_bls *arg = block.bls;
+	u32 control;
+
+	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		rkisp2_param_clear_bits(params, ISP_BLS_CTRL, ISP_BLS_ENA | ISP_BLS_BLS1_EN);
+		return;
+	}
+
+	if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
+		return;
+
+	control = ISP_BLS_ENA;
+
+	if (!arg->enable_auto) {
+		/* TODO plumb BLS1 */
+
+		rkisp2_write(params->rkisp2, ISP_BLS_A_FIXED, arg->bls_fixed_val.a);
+		rkisp2_write(params->rkisp2, ISP_BLS_B_FIXED, arg->bls_fixed_val.b);
+		rkisp2_write(params->rkisp2, ISP_BLS_C_FIXED, arg->bls_fixed_val.c);
+		rkisp2_write(params->rkisp2, ISP_BLS_D_FIXED, arg->bls_fixed_val.d);
+
+		/* Set fixed mode */
+		rkisp2_param_clear_bits(params, ISP_BLS_CTRL,
+					ISP_BLS_MODE_MEASURED);
+		return;
+	}
+
+	if (arg->enabled_windows & BIT(1)) {
+		rkisp2_write(params->rkisp2, ISP_BLS_H2_START,
+			     arg->bls_window2.h_offs);
+		rkisp2_write(params->rkisp2, ISP_BLS_H2_STOP,
+			     arg->bls_window2.h_size);
+		rkisp2_write(params->rkisp2, ISP_BLS_V2_START,
+			     arg->bls_window2.v_offs);
+		rkisp2_write(params->rkisp2, ISP_BLS_V2_STOP,
+			     arg->bls_window2.v_size);
+		control |= ISP_BLS_WINDOW_2;
+	}
+
+	if (arg->enabled_windows & BIT(0)) {
+		rkisp2_write(params->rkisp2, ISP_BLS_H1_START,
+			     arg->bls_window1.h_offs);
+		rkisp2_write(params->rkisp2, ISP_BLS_H1_STOP,
+			     arg->bls_window1.h_size);
+		rkisp2_write(params->rkisp2, ISP_BLS_V1_START,
+			     arg->bls_window1.v_offs);
+		rkisp2_write(params->rkisp2, ISP_BLS_V1_STOP,
+			     arg->bls_window1.v_size);
+		control |= ISP_BLS_WINDOW_1;
+	}
+
+	rkisp2_write(params->rkisp2, ISP_BLS_SAMPLES,
+		     arg->bls_samples);
+
+	control |= ISP_BLS_MODE_MEASURED;
+	rkisp2_write(params->rkisp2, ISP_BLS_CTRL, control);
+}
+
+static void rkisp2_params_awb_gains(struct rkisp2_params *params,
+				    union rkisp2_params_block block)
+{
+	const struct rkisp2_params_awb_gains *arg = block.awb_gains;
+	unsigned int i;
+
+	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		rkisp2_param_clear_bits(params, RKISP2_CIF_ISP_CTRL,
+					RKISP2_CIF_ISP_CTRL_ISP_AWB_ENA);
+		return;
+	}
+
+	if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(arg->gains); i++) {
+		rkisp2_write(params->rkisp2, ISP21_AWB_GAIN0_G + i * 8,
+			     arg->gains[i].gr << 16 | arg->gains[i].gb);
+		rkisp2_write(params->rkisp2, ISP21_AWB_GAIN0_RB + i * 8,
+			     arg->gains[i].r << 16 | arg->gains[i].b);
+	}
+
+	rkisp2_param_set_bits(params, RKISP2_CIF_ISP_CTRL,
+			      RKISP2_CIF_ISP_CTRL_ISP_AWB_ENA);
+}
+
+static void rkisp2_params_csm_reset(struct rkisp2_params *params)
+{
+	/* Write back the default values. */
+	rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_0, 0x80);
+	rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_1, 0);
+	rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_2, 0);
+	rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_3, 0);
+	rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_4, 0x80);
+	rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_5, 0);
+	rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_6, 0);
+	rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_7, 0);
+	rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_8, 0x80);
+}
+
+static void rkisp2_params_csm(struct rkisp2_params *params,
+			      union rkisp2_params_block block)
+{
+	const struct rkisp2_params_csm *arg = block.csm;
+	unsigned int i, j, k = 0;
+
+	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		rkisp2_params_csm_reset(params);
+		return;
+	}
+
+	if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
+		return;
+
+	for (i = 0; i < 3; i++)
+		for (j = 0; j < 3; j++)
+			rkisp2_write(params->rkisp2,
+				     RKISP2_CIF_ISP_CC_COEFF_0 + 4 * k++,
+				     arg->coeff[i][j]);
+}
+
+static void rkisp2_params_ccm(struct rkisp2_params *params,
+			      union rkisp2_params_block block)
+{
+	const struct rkisp2_params_ccm *arg = block.ccm;
+	unsigned int i;
+	u32 control = 0;
+
+	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		rkisp2_param_clear_bits(params, ISP_CCM_CTRL, ISP_CCM_EN);
+		return;
+	}
+
+	if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
+		return;
+
+	for (i = 0; i < 3; i++) {
+		rkisp2_write(params->rkisp2, ISP_CCM_COEFF0_R + 8 * i,
+			     ISP3X_CCM_COEFF(arg->coeff[i][0], arg->coeff[i][1]));
+		rkisp2_write(params->rkisp2, ISP_CCM_COEFF1_R + 8 * i,
+			     ISP3X_CCM_COEFF(arg->coeff[i][2], arg->offset[i]));
+	}
+
+	rkisp2_write(params->rkisp2, ISP_CCM_COEFF0_Y,
+		     ISP3X_CCM_COEFF(arg->y_coeff[0], arg->y_coeff[1]));
+	rkisp2_write(params->rkisp2, ISP_CCM_COEFF1_Y, arg->y_coeff[2]);
+
+	for (i = 0; i < 8; i++)
+		rkisp2_write(params->rkisp2, ISP_CCM_ALP_Y0 + 4 * i,
+			     ISP3X_CCM_COEFF(arg->alp[2 * i], arg->alp[2 * i + 1]));
+	rkisp2_write(params->rkisp2, ISP_CCM_ALP_Y8, arg->alp[16]);
+
+	rkisp2_write(params->rkisp2, ISP_CCM_BOUND_BIT, arg->inflection_point);
+
+	if (!arg->high_y_alpha_adj_en)
+		control = ISP3X_CCM_HIGHY_ADJ_DIS;
+	control |= ISP_CCM_EN;
+	rkisp2_write(params->rkisp2, ISP_CCM_CTRL, control);
+}
+
+static void rkisp2_params_goc(struct rkisp2_params *params,
+			      union rkisp2_params_block block)
+{
+	const struct rkisp2_params_goc *arg = block.goc;
+	unsigned int i;
+	u32 control = 0;
+
+	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		rkisp2_param_clear_bits(params, ISP3X_GAMMA_OUT_CTRL,
+					ISP3X_GAMMA_OUT_CTRL_EN);
+		return;
+	}
+
+	if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
+		return;
+
+	for (i = 0; i < RKISP2_ISP_GAMMA_OUT_MAX_SEGMENTS >> 1; i++)
+		rkisp2_write(params->rkisp2,
+			     ISP3X_GAMMA_OUT_Y0 + 4 * i,
+			     ISP3X_GAMMA_OUT_SAMPLE(arg->gamma_y[2 * i],
+						  arg->gamma_y[2 * i + 1]));
+
+	rkisp2_write(params->rkisp2, ISP3X_GAMMA_OUT_Y24,
+		     arg->gamma_y[RKISP2_ISP_GAMMA_OUT_MAX_SEGMENTS - 1]);
+
+	rkisp2_write(params->rkisp2, ISP3X_GAMMA_OUT_OFFSET, arg->offset);
+
+	if (arg->mode == RKISP2_ISP_GOC_MODE_EQUIDISTANT)
+		control = ISP3X_GAMMA_OUT_CTRL_MODE_EQUIDISTANT;
+	if (arg->mode == RKISP2_ISP_GOC_SEGMENTS_48)
+		control |= ISP3X_GAMMA_OUT_CTRL_SEGMENTS_48;
+	control |= ISP3X_GAMMA_OUT_CTRL_EN;
+	rkisp2_write(params->rkisp2, ISP3X_GAMMA_OUT_CTRL, control);
+}
+
+static void rkisp2_params_lsc(struct rkisp2_params *params,
+			      union rkisp2_params_block block)
+{
+	const struct rkisp2_params_lsc *arg = block.lsc;
+	struct rkisp2_device *rkisp2 = params->rkisp2;
+	u32 sram_addr;
+	u32 data;
+	unsigned int i, j, table_i;
+
+	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		rkisp2_param_clear_bits(params, ISP3X_LSC_CTRL, ISP3X_LSC_CTRL_EN);
+		return;
+	}
+
+	if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
+		return;
+
+	if (arg->set_active_table_when == RKISP2_ISP_LSC_SET_ACTIVE_TABLE_BEFORE)
+		rkisp2_write(rkisp2, ISP3X_LSC_TABLE_SEL, arg->active_table ? 1 : 0);
+
+	/*
+	 * - No need to disable the lsc before writing the table 
+	 * - Table 0 starts at 0, table 1 starts at 153.
+	 * - TABLE_SEL selects which table is active, but programming the tables
+	 *   is done by just writing to the right address.
+	 * - The address automatically increments, so no need to increment it.
+	 */
+
+	for (table_i = 0; table_i < 2; table_i++) {
+		if (!arg->write_table[table_i])
+			continue;
+
+		sram_addr = table_i * 153;
+
+		rkisp2_write(rkisp2, ISP3X_LSC_R_TABLE_ADDR, sram_addr);
+		rkisp2_write(rkisp2, ISP3X_LSC_GR_TABLE_ADDR, sram_addr);
+		rkisp2_write(rkisp2, ISP3X_LSC_B_TABLE_ADDR, sram_addr);
+		rkisp2_write(rkisp2, ISP3X_LSC_GB_TABLE_ADDR, sram_addr);
+
+		/* Program data tables (table size is 9 * 17 = 153) */
+		for (i = 0; i < RKISP2_ISP_LSC_SAMPLES_MAX; i++) {
+			const __u16 *r_row = arg->r_data_tbl[table_i][i];
+			const __u16 *gr_row = arg->gr_data_tbl[table_i][i];
+			const __u16 *gb_row = arg->gb_data_tbl[table_i][i];
+			const __u16 *b_row = arg->b_data_tbl[table_i][i];
+
+			/*
+			 * 17 sectors with 2 values in one DWORD = 9
+			 * DWORDs (2nd value of last DWORD unused)
+			 */
+			for (j = 0; j < RKISP2_ISP_LSC_SAMPLES_MAX / 2; j++) {
+				rkisp2_write(rkisp2, ISP3X_LSC_R_TABLE_DATA,
+					     ISP3X_LSC_TABLE_DATA(r_row[2 * j], r_row[2 * j + 1]));
+				rkisp2_write(rkisp2, ISP3X_LSC_GR_TABLE_DATA,
+					     ISP3X_LSC_TABLE_DATA(gr_row[2 * j], gr_row[2 * j + 1]));
+				rkisp2_write(rkisp2, ISP3X_LSC_GB_TABLE_DATA,
+					     ISP3X_LSC_TABLE_DATA(gb_row[2 * j], gb_row[2 * j + 1]));
+				rkisp2_write(rkisp2, ISP3X_LSC_B_TABLE_DATA,
+					     ISP3X_LSC_TABLE_DATA(b_row[2 * j], b_row[2 * j + 1]));
+			}
+
+			rkisp2_write(rkisp2, ISP3X_LSC_R_TABLE_DATA,
+				     ISP3X_LSC_TABLE_DATA(r_row[2 * j], 0));
+			rkisp2_write(rkisp2, ISP3X_LSC_GR_TABLE_DATA,
+				     ISP3X_LSC_TABLE_DATA(gr_row[2 * j], 0));
+			rkisp2_write(rkisp2, ISP3X_LSC_GB_TABLE_DATA,
+				     ISP3X_LSC_TABLE_DATA(gb_row[2 * j], 0));
+			rkisp2_write(rkisp2, ISP3X_LSC_B_TABLE_DATA,
+				     ISP3X_LSC_TABLE_DATA(b_row[2 * j], 0));
+
+		}
+	}
+
+	/* Program grid sizes and interpolation gradients */
+	for (i = 0; i < RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX / 2; i++) {
+		/* program x size tables */
+		data = ISP3X_LSC_SECT_SIZE(arg->x_sizes[i * 2],
+					   arg->x_sizes[i * 2 + 1]);
+		rkisp2_write(rkisp2, ISP3X_LSC_XSIZE(i), data);
+
+		/* program x grad tables */
+		data = ISP3X_LSC_GRAD_SIZE(arg->x_grads[i * 2],
+					   arg->x_grads[i * 2 + 1]);
+		rkisp2_write(rkisp2, ISP3X_LSC_XGRAD(i), data);
+
+		/* program y size tables */
+		data = ISP3X_LSC_SECT_SIZE(arg->y_sizes[i * 2],
+					   arg->y_sizes[i * 2 + 1]);
+		rkisp2_write(rkisp2, ISP3X_LSC_YSIZE(i), data);
+
+		/* program y grad tables */
+		data = ISP3X_LSC_GRAD_SIZE(arg->y_grads[i * 2],
+					   arg->y_grads[i * 2 + 1]);
+		rkisp2_write(rkisp2, ISP3X_LSC_YGRAD(i), data);
+	}
+
+	rkisp2_write(rkisp2, ISP3X_LSC_TABLE_SEL, arg->active_table ? 1 : 0);
+
+	data = 0;
+	if (arg->window_mode)
+		data |= ISP3X_LSC_SECTOR_16X16;
+	/* TODO plumb the rest of the ctrl fields */
+	data |= ISP3X_LSC_CTRL_EN;
+
+	rkisp2_param_set_bits(params, ISP3X_LSC_CTRL, data);
+}
+
+static void rkisp2_params_configure(struct rkisp2_params *params,
+				    struct rkisp2_params_buffer *buf,
+				    enum rkisp2_params_configure_priority prio)
+{
+	struct v4l2_isp_params_buffer *cfg;
+	const struct rkisp2_params_block_handler_info *info;
+	size_t block_offset = 0;
+	size_t max_offset;
+
+	buf->vb.sequence = params->rkisp2->isp.frame_sequence + 1;
+	cfg = buf->cfg;
+
+	max_offset = cfg->data_size;
+
+	/* Walk the list of parameter blocks and process them. */
+	while (max_offset && block_offset < max_offset) {
+		union rkisp2_params_block block;
+
+		/* \todo Check if we want to avoid this copy */
+		block.data = &cfg->data[block_offset];
+
+		block_offset += block.header->size;
+
+		info = &rkisp2_params_handlers[block.header->type];
+
+		if (prio != RKISP2_PARAMS_CONFIG_PRIO_NONE &&
+		    prio != info->priority)
+			continue;
+
+		info->handler(params, block);
+	}
+
+	/* update shadow register immediately */
+	rkisp2_param_set_bits(params, RKISP2_CIF_ISP_CTRL,
+			      RKISP2_CIF_ISP_CTRL_ISP_CFG_UPD);
+
+	if (prio == RKISP2_PARAMS_CONFIG_PRIO_NONE)
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+void rkisp2_params_isr(struct rkisp2_params *params)
+{
+	struct rkisp2_params_buffer *buf;
+
+	spin_lock(&params->buf_lock);
+	buf = list_first_entry_or_null(&params->params,
+				       struct rkisp2_params_buffer, queue);
+	if (buf)
+		list_del(&buf->queue);
+	spin_unlock(&params->buf_lock);
+
+	if (!buf)
+		return;
+
+	rkisp2_params_configure(params, buf, RKISP2_PARAMS_CONFIG_PRIO_NONE);
+}
+
+void rkisp2_params_pre_configure(struct rkisp2_params *params,
+				 enum rkisp2_fmt_raw_pat_type bayer_pat)
+{
+	struct rkisp2_params_buffer *buf;
+
+	params->raw_type = bayer_pat;
+
+	spin_lock_irq(&params->buf_lock);
+	buf = list_first_entry_or_null(&params->params,
+				       struct rkisp2_params_buffer, queue);
+	spin_unlock_irq(&params->buf_lock);
+
+	if (!buf)
+		return;
+
+	rkisp2_params_configure(params, buf, RKISP2_PARAMS_CONFIG_PRIO_PRE);
+}
+
+void rkisp2_params_post_configure(struct rkisp2_params *params)
+{
+	struct rkisp2_params_buffer *buf;
+
+	spin_lock_irq(&params->buf_lock);
+	buf = list_first_entry_or_null(&params->params,
+				       struct rkisp2_params_buffer, queue);
+	if (buf)
+		list_del(&buf->queue);
+	spin_unlock_irq(&params->buf_lock);
+
+	if (!buf)
+		return;
+
+	rkisp2_params_configure(params, buf, RKISP2_PARAMS_CONFIG_PRIO_POST);
+}
+
+/*** V4L2 ***/
+
+static int rkisp2_params_enum_fmt_meta_out(struct file *file, void *fh,
+					   struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	if (f->mbus_code && f->mbus_code != MEDIA_BUS_FMT_METADATA_FIXED)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_RKISP2_PARAMS;
+
+	return 0;
+}
+
+static int rkisp2_params_g_fmt_meta_out(struct file *file, void *fh,
+					struct v4l2_format *f)
+{
+
+	static const struct v4l2_meta_format mfmt = {
+		.dataformat = V4L2_META_FMT_RKISP2_PARAMS,
+		.buffersize = v4l2_isp_params_buffer_size(RKISP2_PARAMS_MAX_SIZE),
+	};
+
+	f->fmt.meta = mfmt;
+
+	return 0;
+}
+
+static int rkisp2_params_querycap(struct file *file,
+				  void *priv, struct v4l2_capability *cap)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	strscpy(cap->driver, RKISP2_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, vdev->name, sizeof(cap->card));
+	strscpy(cap->bus_info, RKISP2_BUS_INFO, sizeof(cap->bus_info));
+
+	return 0;
+}
+
+/* ISP params video device IOCTLs */
+static const struct v4l2_ioctl_ops rkisp2_params_ioctl = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_enum_fmt_meta_out = rkisp2_params_enum_fmt_meta_out,
+	.vidioc_g_fmt_meta_out = rkisp2_params_g_fmt_meta_out,
+	.vidioc_s_fmt_meta_out = rkisp2_params_g_fmt_meta_out,
+	.vidioc_try_fmt_meta_out = rkisp2_params_g_fmt_meta_out,
+	.vidioc_querycap = rkisp2_params_querycap,
+};
+
+static int rkisp2_params_vb2_queue_setup(struct vb2_queue *vq,
+					 unsigned int *num_buffers,
+					 unsigned int *num_planes,
+					 unsigned int sizes[],
+					 struct device *alloc_devs[])
+{
+	/* \todo num_buffers? */
+
+	*num_planes = 1;
+
+	sizes[0] = v4l2_isp_params_buffer_size(RKISP2_PARAMS_MAX_SIZE);
+
+	return 0;
+}
+
+static int rkisp2_params_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp2_params_buffer *params_buf = to_rkisp2_params_buffer(vbuf);
+
+	params_buf->cfg = kvmalloc(v4l2_isp_params_buffer_size(RKISP2_PARAMS_MAX_SIZE),
+				   GFP_KERNEL);
+	if (!params_buf->cfg)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void rkisp2_params_vb2_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp2_params_buffer *params_buf = to_rkisp2_params_buffer(vbuf);
+
+	kvfree(params_buf->cfg);
+	params_buf->cfg = NULL;
+}
+
+static void rkisp2_params_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp2_params_buffer *params_buf = to_rkisp2_params_buffer(vbuf);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct rkisp2_params *params = vq->drv_priv;
+
+	spin_lock_irq(&params->buf_lock);
+	list_add_tail(&params_buf->queue, &params->params);
+	spin_unlock_irq(&params->buf_lock);
+}
+
+static int rkisp2_params_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct rkisp2_params *params = vb->vb2_queue->drv_priv;
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp2_params_buffer *params_buf = to_rkisp2_params_buffer(vbuf);
+	struct v4l2_isp_params_buffer *cfg = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+	size_t payload_size = vb2_get_plane_payload(vb, 0);
+	int ret;
+
+	ret = v4l2_isp_params_validate_buffer_size(params->rkisp2->dev, vb,
+						   v4l2_isp_params_buffer_size(RKISP2_PARAMS_MAX_SIZE));
+	if (ret)
+		return ret;
+
+	/*
+	 * Copy the parameters buffer to the internal scratch buffer to avoid
+	 * userspace modifying the buffer content while the driver processes it.
+	 */
+	memcpy(params_buf->cfg, cfg, payload_size);
+
+	return v4l2_isp_params_validate_buffer(params->rkisp2->dev, vb, cfg,
+				rkisp2_params_block_types_info,
+				ARRAY_SIZE(rkisp2_params_block_types_info));
+}
+
+static void rkisp2_params_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct rkisp2_params *params = vq->drv_priv;
+	struct rkisp2_params_buffer *buf;
+	LIST_HEAD(tmp_list);
+
+	/*
+	 * we first move the buffers into a local list 'tmp_list'
+	 * and then we can iterate it and call vb2_buffer_done
+	 * without holding the lock
+	 */
+	spin_lock_irq(&params->buf_lock);
+	list_splice_init(&params->params, &tmp_list);
+	spin_unlock_irq(&params->buf_lock);
+
+	list_for_each_entry(buf, &tmp_list, queue)
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops rkisp2_params_vb2_ops = {
+	.queue_setup = rkisp2_params_vb2_queue_setup,
+	.buf_init = rkisp2_params_vb2_buf_init,
+	.buf_cleanup = rkisp2_params_vb2_buf_cleanup,
+	.buf_queue = rkisp2_params_vb2_buf_queue,
+	.buf_prepare = rkisp2_params_vb2_buf_prepare,
+	.stop_streaming = rkisp2_params_vb2_stop_streaming,
+};
+
+static const struct v4l2_file_operations rkisp2_params_fops = {
+	.mmap = vb2_fop_mmap,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = vb2_fop_poll,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release
+};
+
+static int rkisp2_params_link_validate(struct media_link *link)
+{
+	/* \todo implement this */
+	return 0;
+}
+
+static const struct media_entity_operations rkisp2_params_media_ops = {
+	.link_validate = rkisp2_params_link_validate,
+};
+
+static int rkisp2_params_init_vb2_queue(struct vb2_queue *q,
+					struct rkisp2_params *params)
+{
+	struct rkisp2_vdev_node *node;
+
+	node = container_of(q, struct rkisp2_vdev_node, buf_queue);
+
+	q->type = V4L2_BUF_TYPE_META_OUTPUT;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->drv_priv = params;
+	q->ops = &rkisp2_params_vb2_ops;
+	q->mem_ops = &vb2_vmalloc_memops;
+	q->buf_struct_size = sizeof(struct rkisp2_params_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &node->vlock;
+
+	return vb2_queue_init(q);
+}
+
+int rkisp2_params_register(struct rkisp2_device *rkisp2)
+{
+	struct rkisp2_params *params = &rkisp2->params;
+	struct rkisp2_vdev_node *node = &params->vnode;
+	struct video_device *vdev = &node->vdev;
+	int ret;
+
+	params->rkisp2 = rkisp2;
+	mutex_init(&node->vlock);
+	INIT_LIST_HEAD(&params->params);
+	spin_lock_init(&params->buf_lock);
+
+	strscpy(vdev->name, RKISP2_PARAMS_DEV_NAME, sizeof(vdev->name));
+
+	video_set_drvdata(vdev, params);
+	vdev->ioctl_ops = &rkisp2_params_ioctl;
+	vdev->fops = &rkisp2_params_fops;
+	vdev->release = video_device_release_empty;
+	/*
+	 * Provide a mutex to v4l2 core. It will be used
+	 * to protect all fops and v4l2 ioctls.
+	 */
+	vdev->lock = &node->vlock;
+	vdev->v4l2_dev = &rkisp2->v4l2_dev;
+	vdev->queue = &node->buf_queue;
+	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
+	vdev->entity.ops = &rkisp2_params_media_ops;
+	vdev->vfl_dir = VFL_DIR_TX;
+	ret = rkisp2_params_init_vb2_queue(vdev->queue, params);
+	if (ret)
+		goto err_media;
+
+	video_set_drvdata(vdev, params);
+
+	node->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
+	if (ret)
+		goto err_media;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(rkisp2->dev,
+			"failed to register %s, ret=%d\n", vdev->name, ret);
+		return ret;
+	}
+
+	return 0;
+
+err_media:
+	media_entity_cleanup(&vdev->entity);
+	mutex_destroy(&node->vlock);
+	return ret;
+}
+
+void rkisp2_params_unregister(struct rkisp2_device *rkisp2)
+{
+	struct rkisp2_params *params = &rkisp2->params;
+	struct rkisp2_vdev_node *node = &params->vnode;
+	struct video_device *vdev = &node->vdev;
+
+	if (!video_is_registered(vdev))
+		return;
+
+	vb2_video_unregister_device(vdev);
+	media_entity_cleanup(&vdev->entity);
+	mutex_destroy(&node->vlock);
+}
diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v3x.h b/drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v3x.h
index bb79d08d206f..d27d9a48887e 100644
--- a/drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v3x.h
+++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v3x.h
@@ -881,6 +881,15 @@
 #define ISP3X_LSC_YSIZE_CD			(ISP3X_LSC_BASE + 0x000A8)
 #define ISP3X_LSC_YSIZE_EF			(ISP3X_LSC_BASE + 0x000AC)
 
+#define ISP3X_LSC_XGRAD(n)		(n < 4 ? (ISP3X_LSC_XGRAD_01 + (n) * 4) : \
+						 (ISP3X_LSC_XGRAD_89 + ((n) - 4) * 4))
+#define ISP3X_LSC_YGRAD(n)		(n < 4 ? (ISP3X_LSC_YGRAD_01 + (n) * 4) : \
+						 (ISP3X_LSC_YGRAD_89 + ((n) - 4) * 4))
+#define ISP3X_LSC_XSIZE(n)		(n < 4 ? (ISP3X_LSC_XSIZE_01 + (n) * 4) : \
+						 (ISP3X_LSC_XSIZE_89 + ((n) - 4) * 4))
+#define ISP3X_LSC_YSIZE(n)		(n < 4 ? (ISP3X_LSC_YSIZE_01 + (n) * 4) : \
+						 (ISP3X_LSC_YSIZE_89 + ((n) - 4) * 4))
+
 #define ISP3X_DEBAYER_BASE			0x00002500
 #define ISP3X_DEBAYER_CONTROL			(ISP3X_DEBAYER_BASE + 0x00000)
 #define ISP3X_DEBAYER_G_INTERP			(ISP3X_DEBAYER_BASE + 0x00004)
@@ -3235,6 +3244,12 @@
 #define ISP33_IIR_WR_ID(x)		(((x) & 0x3f) << 16)
 #define ISP33_IIR_WR_CLEAR		BIT(24)
 
+/* GAMMA_OUT */
+#define ISP3X_GAMMA_OUT_CTRL_EN			BIT(0)
+#define ISP3X_GAMMA_OUT_CTRL_MODE_EQUIDISTANT	BIT(1)
+#define ISP3X_GAMMA_OUT_CTRL_SEGMENTS_48		BIT(2)
+#define ISP3X_GAMMA_OUT_SAMPLE(a, b)		(((a) & 0xfff) | (((b) & 0xfff) << 16))
+
 /* HDRTMO */
 
 /* HDRDRC */
@@ -3264,6 +3279,7 @@
 #define ISP3X_DPCC_WORKING		BIT(30)
 
 /* CCM */
+#define ISP3X_CCM_COEFF(a, b)		((a & 0x7ff) | (b << 16))
 #define ISP3X_CCM_HIGHY_ADJ_DIS		BIT(1)
 #define ISP32_CCM_ENH_ADJ_EN		BIT(2)
 #define ISP32_CCM_ASYM_ADJ_EN		BIT(3)
@@ -3288,6 +3304,21 @@
 #define ISP3X_LSC_TABLE_ADDRESS_0	0
 #define ISP3X_LSC_TABLE_ADDRESS_153	153
 
+#define ISP3X_LSC_CTRL_EN		BIT(0)
+
+#define ISP3X_LSC_ACTIVE_TABLE		BIT(1)
+
+#define ISP3X_LSC_LUT_EN		BIT(1)
+#define ISP3X_LSC_SECTOR_16X16		BIT(2)
+#define ISP3X_LSC_PRE_RD_ST_MODE	BIT(4)
+
+#define ISP3X_LSC_TABLE_DATA(v0, v1)     \
+	(((v0) & 0x1FFF) | (((v1) & 0x1FFF) << 16))
+#define ISP3X_LSC_SECT_SIZE(v0, v1)      \
+	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
+#define ISP3X_LSC_GRAD_SIZE(v0, v1)      \
+	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
+
 #define ISP3X_LSC_LUT_EN		BIT(1)
 #define ISP3X_LSC_SECTOR_16X16		BIT(2)
 #define ISP3X_LSC_PRE_RD_ST_MODE	BIT(4)
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c..470e5b84ed15 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1467,6 +1467,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
+	case V4L2_META_FMT_RKISP2_PARAMS:	descr = "Rockchip ISP2 3A Parameters"; break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/rkisp2-config.h b/include/uapi/linux/rkisp2-config.h
index ce8093db5998..0e42dbf2c9f2 100644
--- a/include/uapi/linux/rkisp2-config.h
+++ b/include/uapi/linux/rkisp2-config.h
@@ -8,6 +8,18 @@
 #ifndef _UAPI_RKISP2_CONFIG_H
 #define _UAPI_RKISP2_CONFIG_H
 
+#ifdef __KERNEL__
+#include <linux/build_bug.h>
+#endif /* __KERNEL__ */
+#include <linux/types.h>
+
+#include <linux/media/v4l2-isp.h>
+
+#define RKISP2_ISP_GAMMA_OUT_MAX_SEGMENTS   49
+
+#define RKISP2_ISP_LSC_SAMPLES_MAX		17
+#define RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX	16
+
 /**
  * enum rkisp2_isp_version - ISP variants
  *
@@ -17,4 +29,306 @@ enum rkisp2_isp_version {
 	RKISP3_V0 = 30,
 };
 
+/* See enum rkisp2_isp_goc_segments for logarithmic segment sizes */
+enum rkisp2_isp_goc_mode {
+	RKISP2_ISP_GOC_MODE_LOGARITHMIC,
+	RKISP2_ISP_GOC_MODE_EQUIDISTANT
+};
+
+/*
+ * The segments are:
+ * 1 x8, 2 x4, 4 x4, 8 x4, 16 x4, 32 x4, 64 x4, 128 x4, 256 x4, 512 x4
+ * In 48-segment mode, the last group of 512 x4 becomes 256 x8
+ */
+enum rkisp2_isp_goc_segments {
+	RKISP2_ISP_GOC_SEGMENTS_44,
+	RKISP2_ISP_GOC_SEGMENTS_48
+};
+
+enum rkisp2_isp_lsc_config {
+	RKISP2_ISP_LSC_CONFIG_8X8,
+	RKISP2_ISP_LSC_CONFIG_16X16
+};
+
+enum rkisp2_isp_set_active_table_when {
+	RKISP2_ISP_LSC_SET_ACTIVE_TABLE_AFTER,
+	RKISP2_ISP_LSC_SET_ACTIVE_TABLE_BEFORE,
+};
+
+/*---------- Parameters ------------*/
+
+/**
+ * enum rkisp2_params_block_type - RkISP1 extensible params block type
+ *
+ * @RKISP2_PARAMS_BLOCK_BLS: Black level subtraction
+ * @RKISP2_PARAMS_BLOCK_AWB_GAINS: AWB gains
+ * @RKISP2_PARAMS_BLOCK_CSM: Color conversion coefficients (in the ISP block)
+ * @RKISP2_PARAMS_BLOCK_CCM: Color correction matrix (in the CCM block)
+ * @RKISP2_PARAMS_BLOCK_GOC: Gamma out correction
+ * @RKISP2_PARAMS_BLOCK_LSC: Lens shading correction
+ * */
+enum rkisp2_params_block_type {
+	RKISP2_PARAMS_BLOCK_BLS,
+	RKISP2_PARAMS_BLOCK_AWB_GAINS,
+	RKISP2_PARAMS_BLOCK_CSM,
+	RKISP2_PARAMS_BLOCK_CCM,
+	RKISP2_PARAMS_BLOCK_GOC,
+	RKISP2_PARAMS_BLOCK_LSC,
+};
+
+/**
+ * struct rkisp2_isp_window -  measurement window.
+ *
+ * Measurements are calculated per window inside the frame.
+ * This struct represents a window for a measurement.
+ *
+ * @h_offs: the horizontal offset of the window from the left of the frame in pixels.
+ * @v_offs: the vertical offset of the window from the top of the frame in pixels.
+ * @h_size: the horizontal size of the window in pixels
+ * @v_size: the vertical size of the window in pixels.
+ */
+struct rkisp2_isp_window {
+	__u16 h_offs;
+	__u16 v_offs;
+	__u16 h_size;
+	__u16 v_size;
+};
+
+/**
+ * struct rkisp2_isp_bls_fixed_val - BLS fixed subtraction values
+ *
+ * These are signed 13-bit (-4096 to +4095).
+ *
+ * @a: Fixed black level value for Bayer channel 0
+ * @b: Fixed black level value for Bayer channel 1
+ * @c: Fixed black level value for Bayer channel 2
+ * @d: Fixed black level value for Bayer channel 3
+ */
+struct rkisp2_isp_bls_fixed_val {
+	__s16 a;
+	__s16 b;
+	__s16 c;
+	__s16 d;
+};
+
+/**
+ * struct rkisp2_isp_awb_gains - Auto white balance gain in the ISP block
+ *
+ * All fields in this struct are 16 bit, where:
+ * 0x100h = 1, unsigned integer value, range 0 to 63 with 8 bit fractional part.
+ *
+ * This leaves the upper two msb unaccounted for; it is unknown if these are
+ * unused or misdocumented.
+ *
+ * TODO investigate the upper two bits
+ *
+ * @r: gain value for red component.
+ * @gr: gain value for green component in red line.
+ * @b: gain value for blue component.
+ * @gb: gain value for green component in blue line.
+ */
+struct rkisp2_isp_awb_gains {
+	__u16 r;
+	__u16 gr;
+	__u16 b;
+	__u16 gb;
+};
+
+/**
+ * struct rkisp2_params_bls - RkISP2 params BLS config
+ *
+ * RkISP2 parameters Black Level Subtraction configuration block.
+ * Identified by :c:type:`RKISP2_PARAMS_BLOCK_BLS`.
+ *
+ * TODO Check if auto-mode and window selection is for both blocks or just for
+ * one block (it might be the same as 2.x)
+ *
+ * @header: The RkISP2 parameters block header
+ * @enable_auto: Automatic mode activated means that the measured values
+ *		 are subtracted. Otherwise the fixed subtraction
+ *		 values will be subtracted.
+ * @enabled_windows: enabled window (bit 0 for window 1, bit 1 for window 2)
+ * @bls_window1: Measurement window 1 size
+ * @bls_window2: Measurement window 2 size
+ * @bls_samples: Set amount of measured pixels for each Bayer position
+ *		 (A, B, C and D) to 2^bls_samples. (TODO needs confirmation)
+ * @bls_fixed_val: Black Level Subtraction fixed values for the BLS module at
+ * 		   the front of the pipeline
+ * @bls1_fixed_val: Black Level Subtraction fixed values for the BLS module after
+ * 		    bayer noise reduction
+ */
+struct rkisp2_params_bls {
+	struct v4l2_isp_params_block_header header;
+	__u8 enable_auto;
+	__u8 enabled_windows;
+	struct rkisp2_isp_window bls_window1;
+	struct rkisp2_isp_window bls_window2;
+	__u8 bls_samples;
+	struct rkisp2_isp_bls_fixed_val bls_fixed_val;
+	struct rkisp2_isp_bls_fixed_val bls1_fixed_val;
+} __attribute__((aligned(8)));
+
+/**
+ * struct rkisp2_params_awb_gains - RKISP2 params AWB gains config
+ *
+ * RkISP2 parameters auto white balance gains configuration block.
+ * Identified by :c:type:`RKISP2_PARAMS_BLOCK_AWB_GAINS`.
+ *
+ * TODO investigate what the different blocks mean
+ *
+ * Block 0 is equivalent to the awb gains block on 2.x, but blocks 1 and
+ * 2 do not exist on 2.x.
+ *
+ * @header: The RkISP2 parameters block header
+ * @gains: Gains configuration for block i
+ */
+struct rkisp2_params_awb_gains {
+	struct v4l2_isp_params_block_header header;
+	struct rkisp2_isp_awb_gains gains[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct rkisp2_params_csm - Configuration used by Color Space Conversion
+ *
+ * RkISP2 parameters histogram configuration block.
+ * Identified by :c:type:`RKISP2_PARAMS_BLOCK_CSM`.
+ *
+ * @header: The RkISP2 parameters block header
+ * @coeff: color correction matrix. Values are 9-bit signed fixed-point numbers with 2 bit integer
+ *		and 7 bit fractional part, ranging from -2 (0x100) to +1.992 (0x0FF). 0 is
+ *		represented by 0x000 and a coefficient value of 1 as 0x080.
+ */
+struct rkisp2_params_csm {
+	struct v4l2_isp_params_block_header header;
+	__u16 coeff[3][3];
+};
+
+/**
+ * struct rkisp2_params_ccm - Configuration used by Color Correction Matrix
+ *
+ * RkISP2 parameters histogram configuration block.
+ * Identified by :c:type:`RKISP2_PARAMS_BLOCK_CCM`.
+ *
+ * @header: The RkISP2 parameters block header
+ * @high_y_alpha_adj_en: Enable CCM high Y alpha adjustment (TODO figure out what this does)
+ * @coeff: color correction matrix. Values are 11-bit signed fixed-point numbers with 4 bit integer
+ *		and 7 bit fractional part, ranging from -8 (0x400) to +7.992 (0x3FF). 0 is
+ *		represented by 0x000 and a coefficient value of 1 as 0x080. The
+ *		value is expanded 128 times (TODO figure out what this means).
+ * @offset: Red, Green, Blue offsets for the color correction matrix. 12-bits
+ *	    wide ranging from -4096 to 4095, but only for red; green and blue are 11-bit
+ *	    signed fixed-point like coeff, but are still 12-bits wide.
+ * @y_coeff: Red, Green, Blue coefficients for RGB2Y calculation. red and green
+ *	     are 11-bits wide and blue is 12-bits wide. The value is expanded 128 times.
+ * @alp: CCM curve y-axis point definition for ccm input pixel's luminance.
+ *       11-bit unsigned ranging from 0 to 1024. The value is expanded 128 times.
+ * @inflection_point: Inflection point of the ccm alpha interpolation curve.
+ * 		      The inflection point is 2^inflection_point. Since the maximum y-value is
+ * 		      1024, the maximum value of this field is expected to be 10 (0xa), but the
+ * 		      documentation says 4'b10.
+ */
+struct rkisp2_params_ccm {
+	struct v4l2_isp_params_block_header header;
+	__u8 high_y_alpha_adj_en;
+	__u16 coeff[3][3];
+	__u16 offset[3];
+	__u16 y_coeff[3];
+	__u16 alp[17];
+	__u8 inflection_point;
+};
+
+/**
+ * struct rkisp2_params_goc - Configuration used by Gamma Out correction
+ *
+ * RkISP2 parameters gamma out correction configuration block.
+ * Identified by :c:type:`RKISP2_PARAMS_BLOCK_GOC`.
+ *
+ * @header: The RkISP2 parameters block header
+ * @mode: goc mode (from enum rkisp2_isp_goc_mode)
+ * @segments: segments mode (from enum rkisp2_isp_goc_segments)
+ * @offset: offset value of the gamma out curve
+ * @gamma_y: gamma out curve y-axis for all color components
+ *
+ * The number of entries of @gamma_y depends on the segments mode. The entries
+ * are 12-bit unsigned.
+ */
+struct rkisp2_params_goc {
+	struct v4l2_isp_params_block_header header;
+	__u8 mode;
+	__u8 segments;
+	__u16 offset;
+	__u16 gamma_y[RKISP2_ISP_GAMMA_OUT_MAX_SEGMENTS];
+};
+
+/**
+ * struct rkisp2_params_lsc - Configuration used by Lens shading correction
+ *
+ * RkISP2 parameters lens shading correction configuration block.
+ * Identified by :c:type:`RKISP2_PARAMS_BLOCK_LSC`.
+ *
+ * The LSC module on the rkisp2 two tables: the 0th table and the 1th table.
+ * They can be programmed independently and (somewhat) simultaneously, and can be
+ * swapped by setting a single register. Hence the UAPI here is designed so
+ * that all these components can be controlled independently.
+ *
+ * In the first dimension of {r,gr,gb,b}_data_tbl we can designate which table
+ * to write the data to. write_table is then used to signal whether to write
+ * the data, and this can be controlled for both tables. active_table chooses
+ * which table to activate. set_active_table_when signals whether to set the
+ * active_table before or after programming the table. This allows
+ * optimizations such as setting a future table in one parameter buffer while
+ * swapping before setting it.
+ *
+ * This design gives us more control. For example, if we want to only program
+ * the 0th table without modifying the 1th table, we do not need to also
+ * populate the 1th table and we can use write_table to designate that we only
+ * want to program the 0th table. We can also swap tables without needing to
+ * re-populate the tables by setting active_table and unsetting write_table.
+ *
+ * {x,y}_sizes designates the grid of the LSC, and the table entries above
+ * correspond to the *vertices* of the grid. {x,y}_grads control the bilinear
+ * interpolation within the grid.
+ *
+ * @header: The RkISP2 parameters block header
+ * @r_data_tbl: Sample table red
+ * @gr_data_tbl: Sample table green (red)
+ * @gb_data_tbl: Sample table green (blue)
+ * @b_data_tbl: Sample table blue
+ * @write_table: Set to 1 to signal to write the respective table from above
+ * @active_table: Choose which of the two tables is active (0 or 1)
+ * @set_active_table_when: From rkisp2_isp_set_active_table_when; switch to the
+ *			   active table before or after programming the table
+ * @x_sizes: Sizes x
+ * @y_sizes: Sizes y
+ * @x_grads: Gradients x
+ * @y_grads: Gradients y
+ * @window_mode: From enum rkisp2_isp_lsc_config
+ */
+struct rkisp2_params_lsc {
+	struct v4l2_isp_params_block_header header;
+
+	__u16 r_data_tbl[2][RKISP2_ISP_LSC_SAMPLES_MAX][RKISP2_ISP_LSC_SAMPLES_MAX];
+	__u16 gr_data_tbl[2][RKISP2_ISP_LSC_SAMPLES_MAX][RKISP2_ISP_LSC_SAMPLES_MAX];
+	__u16 gb_data_tbl[2][RKISP2_ISP_LSC_SAMPLES_MAX][RKISP2_ISP_LSC_SAMPLES_MAX];
+	__u16 b_data_tbl[2][RKISP2_ISP_LSC_SAMPLES_MAX][RKISP2_ISP_LSC_SAMPLES_MAX];
+	__u8 write_table[2];
+	__u8 active_table;
+	__u8 set_active_table_when;
+
+	__u16 x_sizes[RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX];
+	__u16 y_sizes[RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX];
+	__u16 x_grads[RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX];
+	__u16 y_grads[RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX];
+
+	__u8 window_mode;
+};
+
+#define RKISP2_PARAMS_MAX_SIZE					\
+	(sizeof(struct rkisp2_params_bls)			+\
+	sizeof(struct rkisp2_params_awb_gains)			+\
+	sizeof(struct rkisp2_params_csm)			+\
+	sizeof(struct rkisp2_params_ccm)			+\
+	sizeof(struct rkisp2_params_goc)			+\
+	sizeof(struct rkisp2_params_lsc))
+
 #endif /* _UAPI_RKISP2_CONFIG_H */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc..1d418a752d89 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -876,6 +876,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor specific - used for RKISP2 camera sub-system */
+#define V4L2_META_FMT_RKISP2_PARAMS	v4l2_fourcc('R', 'K', '2', 'P') /* Rockchip ISP2 Parameters */
+
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
 #define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', '3', 'S', 'T') /* Amlogic C3 ISP Statistics */
-- 
2.47.2


