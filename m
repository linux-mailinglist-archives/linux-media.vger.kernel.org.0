Return-Path: <linux-media+bounces-43615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 748D9BB39CB
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88E203BEDC3
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990E630B509;
	Thu,  2 Oct 2025 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H7YbC0BC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E073093A7;
	Thu,  2 Oct 2025 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400344; cv=none; b=ovr0VeXxQyE5Mp7glhW6Cilfg5fQ4QGXubWyCj1AT1zrJcud17guBhMqmvXnlATNXofhXMqbQhH8cVejz/egZz7/cy1JGS1z5xcBoxwpQJ2c/00H6c/pCFQWhyp2qYPe+SmGHX6Ek47LOWcfV2oIJzOggGcz7wkWHDZRWRSztA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400344; c=relaxed/simple;
	bh=oMTe+AbyY2b1XwFQVR34m6vLmL3T5wW6DcaOXus4JtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QwFZdIkbed/i9sr9dig2DXxZ04CC+2I+U5quzyeEgi70RBC8fkqwD3NmhuZw1hcFhmJgtJQPAM0SNaA4E+noMumTZTU5Nqd9MyDn7o+MbKMOfiMpQLXhsMtixPMK4OUSGKeAJoG9eVVWLQ/CDCtTwX6KFZ3tyxuVDG4Qo7QF8rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H7YbC0BC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF4ED1E60;
	Thu,  2 Oct 2025 12:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400234;
	bh=oMTe+AbyY2b1XwFQVR34m6vLmL3T5wW6DcaOXus4JtE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H7YbC0BCOynL3PHbcceH1izytagbjVqIdHI/dMgBmIy4f8FwXgvXpJc59a7DjoOPC
	 zrD3oFuIFTQ+NGNtr5baxe8UqqCNPAZvjIwRTLI552ES2OThzK/rRA1zm+/92uBPeR
	 seQzQ9NMPbVbwu9U5Ytv3hbZo85TK7THTh7nggNY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:18:29 +0100
Subject: [PATCH v12 10/15] media: platform: Add mali-c55 3a stats devnode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-c55-v12-10-3eda2dba9554@ideasonboard.com>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=21113;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=oMTe+AbyY2b1XwFQVR34m6vLmL3T5wW6DcaOXus4JtE=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF6FfdMq+nYpE+/QzFFB271iaVbdu2fGKFxy
 PdkzhaOXj+JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5RegAKCRDISVd6bEV1
 Mru8D/9yuy7Mwh11iMIx53HgueWjxTfDHqMzz4E3eqMbHqMSOUjMOcFTWNQaAcVvgpiaOCY3AiP
 BT59CELpFjagWscUqRJJSxUIgXRmpL4l8I+xDvOnUpO5dxMIIL9vPkJwpsQEyUHzKAhE1K9ipqr
 BszgF/3amp2VQ8sqU/WPe0v3qM7n89FSmb6dPm1nZ3IAYS1cDLlgvxA2fSwVUXqFwcQosiRS/3I
 5DfXGy3QFZNUVd3OBCVxQTyGJOJJgcee0HfJH6rAajHKRxMfqRBeGyyAw9J56wtUnQtVortARok
 9TUSLnzjELRkSl/9WQlU0qjd1GvIpBO/tzZIRQuNh19VbfAcuDJTCkwgWQ0qqcAoMw7wbl7dB/h
 pboltrjLUvG0nL4fO9EzUBRbEsHK/QSpp7UaQD18i0+BVBoeCMLAMiDqDwdrDtd2JCjzXCyU22i
 nGjDkRpDg0zVcNLy3/SFBdBTkAloCdv8yc2qh0yQAe8Ri/QbXhRry422K0xZJQP65SvFMIRSzls
 aKEjbpOViZrxNOqkeyGMIAzL/usVmct0o0I+w2X2bXmUL88lIW4eoPTbOcEiN6P+QLrDNBi71cw
 oLo0yhkDbqCjkqEawu5fhHNxhc+GVh0VMpNd8jSZAVBe+BGQ0Ju8/J9p2eTosrm8NT2kSIq1Jv+
 w5IAB1W6+6ciI2g==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

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
Changes in v12:

	- Remove the use of the dmaengine API to read stats buffers
	  from the hardware. This works on some platforms but not
	  others, so for now rely on the CPU memcpy.
	- Dropped the use of the new media entity .pipeline_started() and
	  .pipeline_stopped() operations and the V4L2 / MC helpers for them.

Changes in v11:

	- Don't use the media jobs framework, we'll add it separately
	  later.
	- Update copyright year
	- Use new video_device_pipeline_started() helper

Changes in v10:

	- Account for v2 of media jobs framework

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
---
 drivers/media/platform/arm/mali-c55/Makefile       |   1 +
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  28 ++
 .../media/platform/arm/mali-c55/mali-c55-core.c    |  43 ++-
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  11 +
 .../platform/arm/mali-c55/mali-c55-registers.h     |   3 +
 .../media/platform/arm/mali-c55/mali-c55-stats.c   | 325 +++++++++++++++++++++
 6 files changed, 403 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
index 9178ac35e50efdc42289f5ed5e3ef5af55e8ac32..b5a22d414479dd1eb6435f474cb95aaa14879aa8 100644
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
index 0c713c7d2f7e97f94a3235c6ee8f0c3fc3432b86..262fb33bc5ff56195c52e3d9f62435e442937492 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
@@ -51,6 +51,7 @@ enum mali_c55_isp_pads {
 	MALI_C55_ISP_PAD_SINK_VIDEO,
 	MALI_C55_ISP_PAD_SOURCE_VIDEO,
 	MALI_C55_ISP_PAD_SOURCE_BYPASS,
+	MALI_C55_ISP_PAD_SOURCE_STATS,
 	MALI_C55_ISP_NUM_PADS,
 };
 
@@ -162,6 +163,28 @@ struct mali_c55_cap_dev {
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
+	struct vb2_queue queue;
+	struct media_pad pad;
+	/* Mutex to provide to vb2 */
+	struct mutex lock;
+
+	struct {
+		/* Spinlock to guard buffer queue */
+		spinlock_t lock;
+		struct list_head queue;
+	} buffers;
+};
+
 enum mali_c55_config_spaces {
 	MALI_C55_CONFIG_PONG,
 	MALI_C55_CONFIG_PING,
@@ -205,6 +228,7 @@ struct mali_c55 {
 	struct mali_c55_isp isp;
 	struct mali_c55_resizer resizers[MALI_C55_NUM_RSZS];
 	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
+	struct mali_c55_stats stats;
 
 	struct mali_c55_context context;
 	u32 next_config;
@@ -233,6 +257,8 @@ int mali_c55_register_resizers(struct mali_c55 *mali_c55);
 void mali_c55_unregister_resizers(struct mali_c55 *mali_c55);
 int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
 void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
+int mali_c55_register_stats(struct mali_c55 *mali_c55);
+void mali_c55_unregister_stats(struct mali_c55 *mali_c55);
 struct mali_c55_context *mali_c55_get_active_context(struct mali_c55 *mali_c55);
 void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
 			     enum mali_c55_planes plane);
@@ -250,5 +276,7 @@ mali_c55_isp_get_mbus_config_by_shifted_code(u32 code);
 const struct mali_c55_isp_format_info *
 mali_c55_isp_get_mbus_config_by_index(u32 index);
 bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55);
+void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
+				enum mali_c55_config_spaces cfg_space);
 
 #endif /* _MALI_C55_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 8174adb19c80ce58d7c27bf5d1015b122afcc735..a9c0653162faaffec7336754a1bf985f4fd4dd89 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -284,6 +284,16 @@ static int mali_c55_create_links(struct mali_c55 *mali_c55)
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
@@ -298,19 +308,13 @@ static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
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
@@ -340,6 +344,10 @@ static int mali_c55_register_entities(struct mali_c55 *mali_c55)
 	if (ret)
 		goto err_unregister_entities;
 
+	ret = mali_c55_register_stats(mali_c55);
+	if (ret)
+		goto err_unregister_entities;
+
 	ret = mali_c55_create_links(mali_c55);
 	if (ret)
 		goto err_unregister_entities;
@@ -484,10 +492,12 @@ bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55)
 {
 	struct mali_c55_cap_dev *fr = &mali_c55->cap_devs[MALI_C55_CAP_DEV_FR];
 	struct mali_c55_cap_dev *ds = &mali_c55->cap_devs[MALI_C55_CAP_DEV_DS];
+	struct mali_c55_stats *stats = &mali_c55->stats;
 
 	return vb2_start_streaming_called(&fr->queue) &&
 	       (!(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED) ||
-		vb2_start_streaming_called(&ds->queue));
+		vb2_start_streaming_called(&ds->queue)) &&
+	       vb2_start_streaming_called(&stats->queue);
 }
 
 static int mali_c55_check_hwcfg(struct mali_c55 *mali_c55)
@@ -529,6 +539,7 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 	struct device *dev = context;
 	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
 	unsigned long interrupt_status;
+	u32 curr_config;
 	unsigned int i;
 
 	interrupt_status = mali_c55_read(mali_c55,
@@ -550,6 +561,22 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 			if (mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED)
 				mali_c55_set_next_buffer(&mali_c55->cap_devs[MALI_C55_CAP_DEV_DS]);
 
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
+			mali_c55_stats_fill_buffer(mali_c55,
+				mali_c55->next_config ^ 1);
+
 			mali_c55_swap_next_config(mali_c55);
 
 			break;
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index 7a80be328c5dbb34187d2120fc1a5aff991ba7cf..c5183d7092a908b343ac7fd5eb1e0e557e291a6f 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2025 Ideas on Board Oy
  */
 
+#include <linux/media/arm/mali-c55-config.h>
+
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/property.h>
@@ -490,6 +492,14 @@ static int mali_c55_isp_init_state(struct v4l2_subdev *sd,
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
 
@@ -586,6 +596,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
 						       MEDIA_PAD_FL_MUST_CONNECT;
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
+	isp->pads[MALI_C55_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
 				     isp->pads);
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
index 66b144c6fe906b56ea98302d2d8515db883411f0..8b04aff1990a962ddb7671d2f66f70c0638737a7 100644
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
index 0000000000000000000000000000000000000000..84e444bc355483e6c599e3431a0a8f8c93b616e2
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Mali-C55 ISP Driver - 3A Statistics capture device
+ *
+ * Copyright (C) 2025 Ideas on Board Oy
+ */
+
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
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
+static int
+mali_c55_stats_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+			   unsigned int *num_planes, unsigned int sizes[],
+			   struct device *alloc_devs[])
+{
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
+	return 0;
+}
+
+static void mali_c55_stats_buf_queue(struct vb2_buffer *vb)
+{
+	struct mali_c55_stats *stats = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c55_stats_buf *buf = container_of(vbuf,
+						struct mali_c55_stats_buf, vb);
+
+	vb2_set_plane_payload(vb, 0, sizeof(struct mali_c55_stats_buffer));
+	buf->segments_remaining = 2;
+	buf->failed = false;
+
+	spin_lock(&stats->buffers.lock);
+	list_add_tail(&buf->queue, &stats->buffers.queue);
+	spin_unlock(&stats->buffers.lock);
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
+}
+
+static int mali_c55_stats_start_streaming(struct vb2_queue *q,
+					  unsigned int count)
+{
+	struct mali_c55_stats *stats = vb2_get_drv_priv(q);
+	struct mali_c55 *mali_c55 = stats->mali_c55;
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
+	if (mali_c55_pipeline_ready(mali_c55)) {
+		ret = v4l2_subdev_enable_streams(&mali_c55->isp.sd,
+						 MALI_C55_ISP_PAD_SOURCE_VIDEO,
+						 BIT(0));
+		if (ret < 0)
+			goto err_stop_pipeline;
+	}
+
+	return 0;
+
+err_stop_pipeline:
+	video_device_pipeline_stop(&stats->vdev);
+err_pm_put:
+	pm_runtime_put_autosuspend(mali_c55->dev);
+err_return_buffers:
+	mali_c55_stats_return_buffers(stats, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mali_c55_stats_stop_streaming(struct vb2_queue *q)
+{
+	struct mali_c55_stats *stats = vb2_get_drv_priv(q);
+	struct mali_c55 *mali_c55 = stats->mali_c55;
+	struct mali_c55_isp *isp = &mali_c55->isp;
+
+	if (mali_c55_pipeline_ready(mali_c55)) {
+		if (v4l2_subdev_is_streaming(&isp->sd))
+			v4l2_subdev_disable_streams(
+				&isp->sd, MALI_C55_ISP_PAD_SOURCE_VIDEO,
+				BIT(0));
+	}
+
+	video_device_pipeline_stop(&stats->vdev);
+	mali_c55_stats_return_buffers(stats, VB2_BUF_STATE_ERROR);
+
+	pm_runtime_put_autosuspend(stats->mali_c55->dev);
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
+static void mali_c55_stats_cpu_read(struct mali_c55_stats *stats,
+				    struct mali_c55_stats_buf *buf,
+				    enum mali_c55_config_spaces cfg_space)
+{
+	struct mali_c55 *mali_c55 = stats->mali_c55;
+	const void __iomem *src;
+	size_t length;
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
+	mali_c55_stats_cpu_read(stats, buf, cfg_space);
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
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
+	mutex_destroy(&stats->lock);
+}
+
+int mali_c55_register_stats(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_stats *stats = &mali_c55->stats;
+	struct video_device *vdev = &stats->vdev;
+	struct vb2_queue *vb2q = &stats->queue;
+	int ret;
+
+	mutex_init(&stats->lock);
+	INIT_LIST_HEAD(&stats->buffers.queue);
+	spin_lock_init(&stats->buffers.lock);
+
+	stats->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&stats->vdev.entity, 1, &stats->pad);
+	if (ret)
+		goto err_destroy_mutex;
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
+	vb2q->dev = mali_c55->dev;
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
+err_destroy_mutex:
+
+	mutex_destroy(&stats->lock);
+
+	return ret;
+}

-- 
2.43.0


