Return-Path: <linux-media+bounces-32814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFD6ABC0D8
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5618C3BE4F4
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A02228369F;
	Mon, 19 May 2025 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f2JErkhC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4304D283FEA;
	Mon, 19 May 2025 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665287; cv=none; b=n14fyRVN5cnTcmYqc2p7kfddZusd7noaCujgaaxAgOL2dzw5rfBilBRyuMOxZrRVdmFR4qdAlJTL2tFBbrMBxz8NBsPVjUFSRzqbUEdYkXGJtkG+S10irTxP2R73QHLJreQNd5VwrJY9mCkQHl5kpAa6nPEpWGugiabNbLSlBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665287; c=relaxed/simple;
	bh=d1PWpzRw5W/IMdXVkXALPlFYeYbI6WtACuj+l/lP7Co=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cbWGNb91eEH5Kan+d4GhL51dNjH4kgBaoiBAHhFvMkLgsgakBxX3AL88rddtN2T4Pc1Ipe/7ld5luspcLqHgI9LNfCrDAns4pWdPfu7oeAUcjllhu4rMLytVE7K2cqhstCku+thWF06vCmrBHCT9QELGIY5KsTZ9cvmPzsTLPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f2JErkhC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 664481C0A;
	Mon, 19 May 2025 16:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747665248;
	bh=d1PWpzRw5W/IMdXVkXALPlFYeYbI6WtACuj+l/lP7Co=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f2JErkhCBh+MVyhX0lu01LOsCGjkMIo1X9ptYYOEBUUTSkWIPG7U1AKRBlLCXP1B+
	 zjs+cMDF0B9qnnRPGHS5F+fDB410kN+F5DkXYRPajU6KRWq34M+qCd/PAHBX8VJCIa
	 OI2e3ksH4hTDHXhw564OUuSBjX3A+7VhYtfs6b5w=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v9 12/17] media: platform: Add mali-c55 3a stats devnode
Date: Mon, 19 May 2025 15:34:04 +0100
Message-Id: <20250519143409.451100-13-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519143409.451100-1-dan.scally@ideasonboard.com>
References: <20250519143409.451100-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new code file to govern the 3a statistics capture node.

On ISP_START, fill the stats buffer by reading out the metering space
in the ISP's memory. This is done for the non-active config just as
the dma transfer of the registers is. To acheive that, move the
checking of the current config outside of mali_c55_swap_next_config()
so we can use it for both functions.

Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v9:

	- Squashed the originally separate patch that filled the stats buffer on
	  the ISP start interrupt into this patch.
	- A couple of differences accounting for the different way of operating
	  in inline and memory input mode
	- Infrastructure for the media jobs framework.
	- Include this video device in the synchronised start/stop across the
	  pipeline

Changes in v8:

	- None

Changes in v7:

	- Set width and height of MEDIA_BUS_FMT_METADATA_FIXED to 0.
	- Added cpu fallback to stats in the event of no DMA channel acquired
	- Terminate ISP streaming in the statistics vb2 stop streaming function
	
Changes in v6:

	- Fixed mising includes
	- Minor renames and formatting
	- Reworked mali_c55_stats_metering_complete() so it could only return
	  buffers when both halves of the DMA read were done
	- Terminate dma transfers on streamoff
	
Changes in v5:

	- New patch

 drivers/media/platform/arm/mali-c55/Makefile  |   1 +
 .../platform/arm/mali-c55/mali-c55-common.h   |  32 ++
 .../platform/arm/mali-c55/mali-c55-core.c     |  51 +-
 .../platform/arm/mali-c55/mali-c55-isp.c      |  11 +
 .../arm/mali-c55/mali-c55-registers.h         |   3 +
 .../platform/arm/mali-c55/mali-c55-stats.c    | 522 ++++++++++++++++++
 6 files changed, 610 insertions(+), 10 deletions(-)
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-stats.c

diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
index 9178ac35e50e..b5a22d414479 100644
--- a/drivers/media/platform/arm/mali-c55/Makefile
+++ b/drivers/media/platform/arm/mali-c55/Makefile
@@ -4,6 +4,7 @@ mali-c55-y := mali-c55-capture.o \
 	      mali-c55-core.o \
 	      mali-c55-isp.o \
 	      mali-c55-resizer.o \
+	      mali-c55-stats.o \
 	      mali-c55-tpg.o
 
 obj-$(CONFIG_VIDEO_MALI_C55) += mali-c55.o
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
index 740ac0fa142d..9b54f70c1c3e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
@@ -54,6 +54,7 @@ enum mali_c55_isp_pads {
 	MALI_C55_ISP_PAD_SINK_VIDEO,
 	MALI_C55_ISP_PAD_SOURCE_VIDEO,
 	MALI_C55_ISP_PAD_SOURCE_BYPASS,
+	MALI_C55_ISP_PAD_SOURCE_STATS,
 	MALI_C55_ISP_NUM_PADS,
 };
 
@@ -164,6 +165,30 @@ struct mali_c55_cap_dev {
 	} buffers;
 };
 
+struct mali_c55_stats_buf {
+	struct vb2_v4l2_buffer vb;
+	unsigned int segments_remaining;
+	struct list_head queue;
+	bool failed;
+};
+
+struct mali_c55_stats {
+	struct mali_c55 *mali_c55;
+	struct video_device vdev;
+	struct dma_chan *channel;
+	struct vb2_queue queue;
+	struct media_pad pad;
+	/* Mutex to provide to vb2 */
+	struct mutex lock;
+
+	struct {
+		/* Spinlock to guard buffer queue */
+		spinlock_t lock;
+		struct list_head queue;
+		struct list_head pending;
+	} buffers;
+};
+
 enum mali_c55_config_spaces {
 	MALI_C55_CONFIG_PING,
 	MALI_C55_CONFIG_PONG,
@@ -209,6 +234,7 @@ struct mali_c55 {
 	struct mali_c55_isp isp;
 	struct mali_c55_resizer resizers[MALI_C55_NUM_RSZS];
 	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
+	struct mali_c55_stats stats;
 
 	struct mali_c55_context context;
 	u32 next_config;
@@ -237,12 +263,16 @@ int mali_c55_register_resizers(struct mali_c55 *mali_c55);
 void mali_c55_unregister_resizers(struct mali_c55 *mali_c55);
 int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
 void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
+int mali_c55_register_stats(struct mali_c55 *mali_c55);
+void mali_c55_unregister_stats(struct mali_c55 *mali_c55);
 struct mali_c55_context *mali_c55_get_active_context(struct mali_c55 *mali_c55);
 void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
 			     enum mali_c55_planes plane);
 void mali_c55_set_next_buffer(struct mali_c55_cap_dev *cap_dev);
 int mali_c55_cap_dev_populate_job(struct media_job *job,
 				  struct mali_c55_cap_dev *cap_dev);
+int mali_c55_stats_populate_job(struct media_job *job,
+				struct mali_c55_stats *stats);
 void mali_c55_isp_queue_event_sof(struct mali_c55 *mali_c55);
 
 bool mali_c55_format_is_raw(unsigned int mbus_code);
@@ -256,5 +286,7 @@ mali_c55_isp_get_mbus_config_by_shifted_code(u32 code);
 const struct mali_c55_isp_format_info *
 mali_c55_isp_get_mbus_config_by_index(u32 index);
 bool mali_c55_pipeline_ready(struct media_pipeline *pipe);
+void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
+				enum mali_c55_config_spaces cfg_space);
 
 #endif /* _MALI_C55_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 11f882682fe9..d7d703ee52d4 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -378,6 +378,16 @@ static int mali_c55_create_links(struct mali_c55 *mali_c55)
 		}
 	}
 
+	ret = media_create_pad_link(&mali_c55->isp.sd.entity,
+				    MALI_C55_ISP_PAD_SOURCE_STATS,
+				    &mali_c55->stats.vdev.entity, 0,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(mali_c55->dev,
+			"failed to link ISP and 3a stats node\n");
+		goto err_remove_links;
+	}
+
 	return 0;
 
 err_remove_links:
@@ -392,19 +402,13 @@ static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
 	mali_c55_unregister_isp(mali_c55);
 	mali_c55_unregister_resizers(mali_c55);
 	mali_c55_unregister_capture_devs(mali_c55);
+	mali_c55_unregister_stats(mali_c55);
 }
 
 static void mali_c55_swap_next_config(struct mali_c55 *mali_c55)
 {
 	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
 
-	u32 curr_config;
-
-	curr_config = mali_c55_read(mali_c55, MALI_C55_REG_PING_PONG_READ);
-	curr_config = (curr_config & MALI_C55_REG_PING_PONG_READ_MASK)
-		      >> (ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1);
-	mali_c55->next_config = curr_config ^ 1;
-
 	mali_c55_config_write(ctx, mali_c55->next_config ?
 			      MALI_C55_CONFIG_PING : MALI_C55_CONFIG_PONG,
 			      false);
@@ -448,8 +452,12 @@ static int mali_c55_populate_media_job(struct media_job *job, void *data)
 	 * The ordering of this call is important - it needs to come after all
 	 * the others with the same flag.
 	 */
-	return media_jobs_add_job_step(job, mali_c55_core_run_step, mali_c55,
-				       MEDIA_JOBS_FL_STEP_ANYWHERE, 0);
+	ret = media_jobs_add_job_step(job, mali_c55_core_run_step, mali_c55,
+				      MEDIA_JOBS_FL_STEP_ANYWHERE, 0);
+	if (ret)
+		return ret;
+
+	return mali_c55_stats_populate_job(job, &mali_c55->stats);
 }
 
 static int mali_c55_register_entities(struct mali_c55 *mali_c55)
@@ -472,6 +480,10 @@ static int mali_c55_register_entities(struct mali_c55 *mali_c55)
 	if (ret)
 		goto err_unregister_entities;
 
+	ret = mali_c55_register_stats(mali_c55);
+	if (ret)
+		goto err_unregister_entities;
+
 	ret = mali_c55_create_links(mali_c55);
 	if (ret)
 		goto err_unregister_entities;
@@ -710,6 +722,7 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 	struct device *dev = context;
 	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
 	u32 interrupt_status;
+	u32 curr_config;
 	unsigned int i;
 
 	interrupt_status = mali_c55_read(mali_c55,
@@ -732,8 +745,26 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 
 			__mali_c55_set_next_buffer(mali_c55);
 
-			if (mali_c55->inline_mode)
+			/*
+			 * When the ISP starts a frame we have some work to do:
+			 *
+			 * 1. Copy over the config for the **next** frame
+			 * 2. Read out the metering stats for the **last** frame
+			 */
+
+			curr_config = mali_c55_read(mali_c55,
+						    MALI_C55_REG_PING_PONG_READ);
+			curr_config &= MALI_C55_REG_PING_PONG_READ_MASK;
+			curr_config >>= ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1;
+			mali_c55->next_config = curr_config ^ 1;
+
+			if (mali_c55->inline_mode) {
+				mali_c55_stats_fill_buffer(mali_c55,
+					mali_c55->next_config ?
+					MALI_C55_CONFIG_PING :
+					MALI_C55_CONFIG_PONG);
 				mali_c55_swap_next_config(mali_c55);
+			}
 
 			break;
 		case MALI_C55_IRQ_ISP_DONE:
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index 20d4d16c75fb..b9b2806a5eb3 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2024 Ideas on Board Oy
  */
 
+#include <linux/media/arm/mali-c55-config.h>
+
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/property.h>
@@ -512,6 +514,14 @@ static int mali_c55_isp_init_state(struct v4l2_subdev *sd,
 	in_crop->width = MALI_C55_DEFAULT_WIDTH;
 	in_crop->height = MALI_C55_DEFAULT_HEIGHT;
 
+	src_fmt = v4l2_subdev_state_get_format(state,
+					       MALI_C55_ISP_PAD_SOURCE_STATS);
+
+	src_fmt->width = 0;
+	src_fmt->height = 0;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+
 	return 0;
 }
 
@@ -609,6 +619,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
 						       MEDIA_PAD_FL_MUST_CONNECT;
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
+	isp->pads[MALI_C55_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
 				     isp->pads);
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
index 36a81be0191a..58dd6ce556a0 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
@@ -103,6 +103,9 @@ enum mali_c55_interrupts {
 #define MALI_C55_VC_START(v)				((v) & 0xffff)
 #define MALI_C55_VC_SIZE(v)				(((v) & 0xffff) << 16)
 
+#define MALI_C55_REG_1024BIN_HIST			0x054a8
+#define MALI_C55_1024BIN_HIST_SIZE			4096
+
 /* Ping/Pong Configuration Space */
 #define MALI_C55_REG_BASE_ADDR				0x18e88
 #define MALI_C55_REG_BYPASS_0				0x18eac
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
new file mode 100644
index 000000000000..52e27bd6e13e
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
@@ -0,0 +1,522 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Mali-C55 ISP Driver - 3A Statistics capture device
+ *
+ * Copyright (C) 2023 Ideas on Board Oy
+ */
+
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/dmaengine.h>
+#include <linux/list.h>
+#include <linux/media/arm/mali-c55-config.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mali-c55-common.h"
+#include "mali-c55-registers.h"
+
+static const unsigned int metering_space_addrs[] = {
+	[MALI_C55_CONFIG_PING] = 0x095ac,
+	[MALI_C55_CONFIG_PONG] = 0x2156c,
+};
+
+static int mali_c55_stats_enum_fmt_meta_cap(struct file *file, void *fh,
+					    struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_MALI_C55_STATS;
+
+	return 0;
+}
+
+static int mali_c55_stats_g_fmt_meta_cap(struct file *file, void *fh,
+					 struct v4l2_format *f)
+{
+	static const struct v4l2_meta_format mfmt = {
+		.dataformat = V4L2_META_FMT_MALI_C55_STATS,
+		.buffersize = sizeof(struct mali_c55_stats_buffer)
+	};
+
+	f->fmt.meta = mfmt;
+
+	return 0;
+}
+
+static int mali_c55_stats_querycap(struct file *file,
+				   void *priv, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, MALI_C55_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "ARM Mali-C55 ISP", sizeof(cap->card));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mali_c55_stats_v4l2_ioctl_ops = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_enum_fmt_meta_cap = mali_c55_stats_enum_fmt_meta_cap,
+	.vidioc_g_fmt_meta_cap = mali_c55_stats_g_fmt_meta_cap,
+	.vidioc_s_fmt_meta_cap = mali_c55_stats_g_fmt_meta_cap,
+	.vidioc_try_fmt_meta_cap = mali_c55_stats_g_fmt_meta_cap,
+	.vidioc_querycap = mali_c55_stats_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations mali_c55_stats_v4l2_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+};
+
+static bool mali_c55_stats_job_check_dep(void *data)
+{
+	struct mali_c55_stats *stats = data;
+
+	guard(spinlock)(&stats->buffers.lock);
+
+	if (list_empty(&stats->buffers.pending))
+		return false;
+
+	return true;
+}
+
+static void mali_c55_stats_job_clear_dep(void *data)
+{
+	struct mali_c55_stats *stats = data;
+	struct mali_c55_stats_buf *buf;
+
+	guard(spinlock)(&stats->buffers.lock);
+	buf = list_first_entry(&stats->buffers.pending,
+			       struct mali_c55_stats_buf, queue);
+	list_move_tail(&buf->queue, &stats->buffers.queue);
+}
+
+static void mali_c55_stats_job_reset_dep(void *data)
+{
+	struct mali_c55_stats *stats = data;
+	struct mali_c55_stats_buf *buf;
+
+	guard(spinlock)(&stats->buffers.lock);
+	buf = list_first_entry(&stats->buffers.queue,
+			       struct mali_c55_stats_buf, queue);
+
+	if (buf)
+		list_move(&buf->queue, &stats->buffers.pending);
+}
+
+static void mali_c55_stats_run_step(void *data)
+{
+	struct mali_c55_stats *stats = data;
+	struct mali_c55 *mali_c55 = stats->mali_c55;
+	enum mali_c55_config_spaces cfg_space;
+
+	cfg_space = mali_c55->next_config ? MALI_C55_CONFIG_PING :
+					    MALI_C55_CONFIG_PONG;
+
+	mali_c55_stats_fill_buffer(mali_c55, cfg_space);
+}
+
+static struct media_job_dep_ops mali_c55_stats_job_dep_ops = {
+	.check_dep = mali_c55_stats_job_check_dep,
+	.clear_dep = mali_c55_stats_job_clear_dep,
+	.reset_dep = mali_c55_stats_job_reset_dep,
+};
+
+static int
+mali_c55_stats_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+			   unsigned int *num_planes, unsigned int sizes[],
+			   struct device *alloc_devs[])
+{
+	struct mali_c55_stats *stats = vb2_get_drv_priv(q);
+
+	if (*num_planes && *num_planes > 1)
+		return -EINVAL;
+
+	if (sizes[0] && sizes[0] < sizeof(struct mali_c55_stats_buffer))
+		return -EINVAL;
+
+	*num_planes = 1;
+
+	if (!sizes[0])
+		sizes[0] = sizeof(struct mali_c55_stats_buffer);
+
+	if (stats->channel)
+		alloc_devs[0] = stats->channel->device->dev;
+
+	return 0;
+}
+
+static void mali_c55_stats_buf_queue(struct vb2_buffer *vb)
+{
+	struct mali_c55_stats *stats = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c55_stats_buf *buf = container_of(vbuf,
+						struct mali_c55_stats_buf, vb);
+	struct mali_c55 *mali_c55 = stats->mali_c55;
+	struct list_head *queue;
+
+	vb2_set_plane_payload(vb, 0, sizeof(struct mali_c55_stats_buffer));
+	buf->segments_remaining = 2;
+	buf->failed = false;
+
+	queue = mali_c55->inline_mode ? &stats->buffers.queue :
+					&stats->buffers.pending;
+
+	spin_lock(&stats->buffers.lock);
+	list_add_tail(&buf->queue, queue);
+	spin_unlock(&stats->buffers.lock);
+
+	media_jobs_try_queue_job(stats->mali_c55->sched,
+				 MEDIA_JOB_TYPE_PIPELINE_PULSE,
+				 &mali_c55_stats_job_dep_ops, stats);
+}
+
+static void mali_c55_stats_return_buffers(struct mali_c55_stats *stats,
+					  enum vb2_buffer_state state)
+{
+	struct mali_c55_stats_buf *buf, *tmp;
+
+	guard(spinlock)(&stats->buffers.lock);
+
+	list_for_each_entry_safe(buf, tmp, &stats->buffers.queue, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+
+	list_for_each_entry_safe(buf, tmp, &stats->buffers.pending, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+}
+
+static int mali_c55_stats_start_streaming(struct vb2_queue *q,
+					  unsigned int count)
+{
+	struct mali_c55_stats *stats = vb2_get_drv_priv(q);
+	struct mali_c55 *mali_c55 = stats->mali_c55;
+	struct media_pipeline *pipe;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(mali_c55->dev);
+	if (ret)
+		goto err_return_buffers;
+
+	ret = video_device_pipeline_alloc_start(&stats->vdev);
+	if (ret)
+		goto err_pm_put;
+
+	pipe = video_device_pipeline(&stats->vdev);
+	if (mali_c55_pipeline_ready(pipe)) {
+		ret = media_pipeline_started(pipe);
+		if (ret)
+			goto err_stop_pipeline;
+
+		media_jobs_run_jobs(stats->mali_c55->sched);
+	}
+
+	return 0;
+
+err_stop_pipeline:
+	video_device_pipeline_stop(&stats->vdev);
+err_pm_put:
+	pm_runtime_put(mali_c55->dev);
+err_return_buffers:
+	mali_c55_stats_return_buffers(stats, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mali_c55_stats_stop_streaming(struct vb2_queue *q)
+{
+	struct mali_c55_stats *stats = vb2_get_drv_priv(q);
+	struct media_pipeline *pipe;
+
+	if (stats->channel)
+		dmaengine_terminate_sync(stats->channel);
+
+	pipe = video_device_pipeline(&stats->vdev);
+	if (mali_c55_pipeline_ready(pipe)) {
+		media_pipeline_stopped(pipe);
+		media_jobs_cancel_jobs(stats->mali_c55->sched);
+	}
+
+	video_device_pipeline_stop(&stats->vdev);
+	mali_c55_stats_return_buffers(stats, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops mali_c55_stats_vb2_ops = {
+	.queue_setup = mali_c55_stats_queue_setup,
+	.buf_queue = mali_c55_stats_buf_queue,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.start_streaming = mali_c55_stats_start_streaming,
+	.stop_streaming = mali_c55_stats_stop_streaming,
+};
+
+int mali_c55_stats_populate_job(struct media_job *job,
+				 struct mali_c55_stats *stats)
+{
+	int ret;
+
+	ret = media_jobs_add_job_dep(job, &mali_c55_stats_job_dep_ops, stats);
+	if (ret)
+		return ret;
+
+	ret = media_jobs_add_job_step(job, mali_c55_stats_run_step, stats,
+				      MEDIA_JOBS_FL_STEP_FROM_BACK, 0);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void
+mali_c55_stats_metering_complete(void *param,
+				 const struct dmaengine_result *result)
+{
+	struct mali_c55_stats_buf *buf = param;
+
+	if (result->result != DMA_TRANS_NOERROR)
+		buf->failed = true;
+
+	if (!--buf->segments_remaining)
+		vb2_buffer_done(&buf->vb.vb2_buf, buf->failed ?
+				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+}
+
+static int mali_c55_stats_dma_xfer(struct mali_c55_stats *stats, dma_addr_t src,
+				   dma_addr_t dst,
+				   struct mali_c55_stats_buf *buf,
+				   size_t length)
+{
+	struct dma_async_tx_descriptor *tx;
+	dma_cookie_t cookie;
+
+	tx = dmaengine_prep_dma_memcpy(stats->channel, dst, src, length, 0);
+	if (!tx) {
+		dev_err(stats->mali_c55->dev, "failed to prep stats DMA\n");
+		return -EIO;
+	}
+
+	tx->callback_result = mali_c55_stats_metering_complete;
+	tx->callback_param = buf;
+
+	cookie = dmaengine_submit(tx);
+	if (dma_submit_error(cookie)) {
+		dev_err(stats->mali_c55->dev, "failed to submit stats DMA\n");
+		return -EIO;
+	}
+
+	dma_async_issue_pending(stats->channel);
+	return 0;
+}
+
+static int mali_c55_stats_dma_read(struct mali_c55_stats *stats,
+				   struct mali_c55_stats_buf *buf,
+				   enum mali_c55_config_spaces cfg_space)
+{
+	struct mali_c55 *mali_c55 = stats->mali_c55;
+	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
+	dma_addr_t src, dst;
+	size_t length;
+	int ret;
+
+	/*
+	 * There are in fact two noncontiguous sections of the ISP's
+	 * memory space that hold statistics for 3a algorithms to use: A
+	 * section in each config space and a global section holding
+	 * histograms which is double buffered and so holds data for the
+	 * last frame. We need to read both.
+	 */
+	src = ctx->base + MALI_C55_REG_1024BIN_HIST;
+	dst = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+
+	ret = mali_c55_stats_dma_xfer(stats, src, dst, buf,
+				      MALI_C55_1024BIN_HIST_SIZE);
+	if (ret)
+		return ret;
+
+	src = ctx->base + metering_space_addrs[cfg_space];
+	dst += MALI_C55_1024BIN_HIST_SIZE;
+
+	length = sizeof(struct mali_c55_stats_buffer) - MALI_C55_1024BIN_HIST_SIZE;
+	ret = mali_c55_stats_dma_xfer(stats, src, dst, buf, length);
+	if (ret) {
+		dmaengine_terminate_sync(stats->channel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mali_c55_stats_cpu_read(struct mali_c55_stats *stats,
+				    struct mali_c55_stats_buf *buf,
+				    enum mali_c55_config_spaces cfg_space)
+{
+	struct mali_c55 *mali_c55 = stats->mali_c55;
+	size_t length;
+	void *src;
+	void *dst;
+
+	src = mali_c55->base + MALI_C55_REG_1024BIN_HIST;
+	dst = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+	memcpy_fromio(dst, src, MALI_C55_1024BIN_HIST_SIZE);
+
+	src = mali_c55->base + metering_space_addrs[cfg_space];
+	dst += MALI_C55_1024BIN_HIST_SIZE;
+	length = sizeof(struct mali_c55_stats_buffer) - MALI_C55_1024BIN_HIST_SIZE;
+	memcpy_fromio(dst, src, length);
+}
+
+void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
+				enum mali_c55_config_spaces cfg_space)
+{
+	struct mali_c55_stats *stats = &mali_c55->stats;
+	struct mali_c55_stats_buf *buf = NULL;
+	int ret;
+
+	spin_lock(&stats->buffers.lock);
+	if (!list_empty(&stats->buffers.queue)) {
+		buf = list_first_entry(&stats->buffers.queue,
+				       struct mali_c55_stats_buf, queue);
+		list_del(&buf->queue);
+	}
+	spin_unlock(&stats->buffers.lock);
+
+	if (!buf)
+		return;
+
+	buf->vb.sequence = mali_c55->isp.frame_sequence;
+	buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
+
+	if (stats->channel) {
+		ret = mali_c55_stats_dma_read(stats, buf, cfg_space);
+		if (ret)
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	} else {
+		mali_c55_stats_cpu_read(stats, buf, cfg_space);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+}
+
+void mali_c55_unregister_stats(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_stats *stats = &mali_c55->stats;
+
+	if (!video_is_registered(&stats->vdev))
+		return;
+
+	vb2_video_unregister_device(&stats->vdev);
+	media_entity_cleanup(&stats->vdev.entity);
+
+	if (stats->channel)
+		dma_release_channel(stats->channel);
+
+	mutex_destroy(&stats->lock);
+}
+
+int mali_c55_register_stats(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_stats *stats = &mali_c55->stats;
+	struct video_device *vdev = &stats->vdev;
+	struct vb2_queue *vb2q = &stats->queue;
+	dma_cap_mask_t mask;
+	int ret;
+
+	mutex_init(&stats->lock);
+	INIT_LIST_HEAD(&stats->buffers.queue);
+	INIT_LIST_HEAD(&stats->buffers.pending);
+	spin_lock_init(&stats->buffers.lock);
+
+	dma_cap_zero(mask);
+	dma_cap_set(DMA_MEMCPY, mask);
+
+	/*
+	 * No failure here, because we will just fallback on memcpy if there is
+	 * no usable DMA channel on the system.
+	 */
+	stats->channel = dma_request_channel(mask, 0, NULL);
+	if (!stats->channel)
+		dev_dbg(mali_c55->dev,
+			"No DMA channel for stats, falling back to memcpy\n");
+
+	stats->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&stats->vdev.entity, 1, &stats->pad);
+	if (ret)
+		goto err_release_dma_channel;
+
+	vb2q->type = V4L2_BUF_TYPE_META_CAPTURE;
+	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
+	vb2q->drv_priv = stats;
+	vb2q->mem_ops = &vb2_dma_contig_memops;
+	vb2q->ops = &mali_c55_stats_vb2_ops;
+	vb2q->buf_struct_size = sizeof(struct mali_c55_stats_buf);
+	vb2q->min_queued_buffers = 1;
+	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vb2q->lock = &stats->lock;
+	vb2q->dev = stats->channel ? stats->channel->device->dev : mali_c55->dev;
+
+	ret = vb2_queue_init(vb2q);
+	if (ret) {
+		dev_err(mali_c55->dev, "stats vb2 queue init failed\n");
+		goto err_cleanup_entity;
+	}
+
+	strscpy(stats->vdev.name, "mali-c55 3a stats", sizeof(stats->vdev.name));
+	vdev->release = video_device_release_empty;
+	vdev->fops = &mali_c55_stats_v4l2_fops;
+	vdev->ioctl_ops = &mali_c55_stats_v4l2_ioctl_ops;
+	vdev->lock = &stats->lock;
+	vdev->v4l2_dev = &mali_c55->v4l2_dev;
+	vdev->queue = &stats->queue;
+	vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->vfl_dir = VFL_DIR_RX;
+	video_set_drvdata(vdev, stats);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(mali_c55->dev,
+			"failed to register stats video device\n");
+		goto err_release_vb2q;
+	}
+
+	stats->mali_c55 = mali_c55;
+
+	return 0;
+
+err_release_vb2q:
+	vb2_queue_release(vb2q);
+err_cleanup_entity:
+	media_entity_cleanup(&stats->vdev.entity);
+err_release_dma_channel:
+	if (stats->channel)
+		dma_release_channel(stats->channel);
+
+	mutex_destroy(&stats->lock);
+
+	return ret;
+}
-- 
2.34.1


