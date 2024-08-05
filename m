Return-Path: <linux-media+bounces-15780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE60C947E7B
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 17:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6010281C20
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 15:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CBA15B57B;
	Mon,  5 Aug 2024 15:46:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA45589B;
	Mon,  5 Aug 2024 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722872794; cv=none; b=dWbmGk5SnaZ9FtM7b8O2JS/VJDwc9Y9etzfpQ5J/a+Chbz6MkCQ8SJyEet93OmxVcwwac8o9C2uM3j3laUPedXHfg1rCzMZ0pbIq92jtcAe3wSCP8CtRBu0h5XM2575kcr/XAV0H2UTVpj+Sk9Ya8tk6KXgqAsox+5K2MuLqa2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722872794; c=relaxed/simple;
	bh=jeBJ1MHD6FKZant11EmycpvNvP6FvXl0TXaYZPAQBAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AYoGWDmXTWJnIYG8yB43uDyxE09ovQhKut+swZzbFHnLqM0QaFMMsGurnXsSFAhao/P+q2MbrvScNbwBi9I3zWZilpOsqmaWsilxHp2KGlJLypVcV5qKmehrXDbmHfCOJ8SFI2W5oHlFFViFiMtVFNMBULhIv0Noj8xJfI8rGvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 1E23B3CCDD;
	Mon, 05 Aug 2024 17:41:02 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v6 2/4 RESEND] media: mgb4: Add support for V4L2_CAP_TIMEPERFRAME
Date: Mon,  5 Aug 2024 17:40:52 +0200
Message-ID: <20240805154054.8633-3-tumic@gpxsee.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240805154054.8633-1-tumic@gpxsee.org>
References: <20240805154054.8633-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Recent mgb4 firmwares have support for setting a variable framerate independent
of the signal framerate. Add/fix (the mgb4 driver already did promote
V4L2_CAP_TIMEPERFRAME, but it didn't work) support for V4L2_CAP_TIMEPERFRAME to
the driver to enable this feature.

Additionally add support for the DV timings API (VIDIOC_G_DV_TIMINGS,
VIDIOC_ENUM_DV_TIMINGS, ...) for the outputs that was missing. The timings info
is required/used for implementing the V4L2_CAP_TIMEPERFRAME functionality.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_core.c      |   2 +-
 drivers/media/pci/mgb4/mgb4_core.h      |   2 +
 drivers/media/pci/mgb4/mgb4_io.h        |  24 ++-
 drivers/media/pci/mgb4/mgb4_sysfs_out.c |   4 +-
 drivers/media/pci/mgb4/mgb4_vin.c       |  86 ++++++++---
 drivers/media/pci/mgb4/mgb4_vin.h       |   3 +-
 drivers/media/pci/mgb4/mgb4_vout.c      | 190 +++++++++++++++++++++++-
 drivers/media/pci/mgb4/mgb4_vout.h      |   3 +-
 8 files changed, 277 insertions(+), 37 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index 60498a5abebf..0dd59770fe8a 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -302,7 +302,7 @@ static int init_i2c(struct mgb4_dev *mgbdev)
 	/* create dummy clock required by the xiic-i2c adapter */
 	snprintf(clk_name, sizeof(clk_name), "xiic-i2c.%d", id);
 	mgbdev->i2c_clk = clk_hw_register_fixed_rate(NULL, clk_name, NULL,
-						     0, 125000000);
+						     0, MGB4_HW_FREQ);
 	if (IS_ERR(mgbdev->i2c_clk)) {
 		dev_err(dev, "failed to register I2C clock\n");
 		return PTR_ERR(mgbdev->i2c_clk);
diff --git a/drivers/media/pci/mgb4/mgb4_core.h b/drivers/media/pci/mgb4/mgb4_core.h
index 2a946e46aec1..b52cd67270b5 100644
--- a/drivers/media/pci/mgb4/mgb4_core.h
+++ b/drivers/media/pci/mgb4/mgb4_core.h
@@ -13,6 +13,8 @@
 #include <linux/dmaengine.h>
 #include "mgb4_regs.h"
 
+#define MGB4_HW_FREQ 125000000
+
 #define MGB4_VIN_DEVICES  2
 #define MGB4_VOUT_DEVICES 2
 
diff --git a/drivers/media/pci/mgb4/mgb4_io.h b/drivers/media/pci/mgb4/mgb4_io.h
index 204613a6685c..dd8696d7df31 100644
--- a/drivers/media/pci/mgb4/mgb4_io.h
+++ b/drivers/media/pci/mgb4/mgb4_io.h
@@ -7,11 +7,9 @@
 #ifndef __MGB4_IO_H__
 #define __MGB4_IO_H__
 
+#include <linux/math64.h>
 #include <media/v4l2-dev.h>
-
-#define MGB4_DEFAULT_WIDTH     1280
-#define MGB4_DEFAULT_HEIGHT    640
-#define MGB4_DEFAULT_PERIOD    (125000000 / 60)
+#include "mgb4_core.h"
 
 /* Register access error indication */
 #define MGB4_ERR_NO_REG        0xFFFFFFFE
@@ -20,6 +18,9 @@
 #define MGB4_ERR_QUEUE_EMPTY   0xFFFFFFFC
 #define MGB4_ERR_QUEUE_FULL    0xFFFFFFFB
 
+#define MGB4_PERIOD(numerator, denominator) \
+	((u32)div_u64((MGB4_HW_FREQ * (u64)(numerator)), (denominator)))
+
 struct mgb4_frame_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head list;
@@ -30,11 +31,24 @@ static inline struct mgb4_frame_buffer *to_frame_buffer(struct vb2_v4l2_buffer *
 	return container_of(vbuf, struct mgb4_frame_buffer, vb);
 }
 
-static inline bool has_yuv(struct mgb4_regs *video)
+static inline bool has_yuv_and_timeperframe(struct mgb4_regs *video)
 {
 	u32 status = mgb4_read_reg(video, 0xD0);
 
 	return (status & (1U << 8));
 }
 
+#define has_yuv(video) has_yuv_and_timeperframe(video)
+#define has_timeperframe(video) has_yuv_and_timeperframe(video)
+
+static inline u32 pixel_size(struct v4l2_dv_timings *timings)
+{
+	struct v4l2_bt_timings *bt = &timings->bt;
+
+	u32 height = bt->height + bt->vfrontporch + bt->vsync + bt->vbackporch;
+	u32 width = bt->width + bt->hfrontporch + bt->hsync + bt->hbackporch;
+
+	return width * height;
+}
+
 #endif
diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_out.c b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
index 9f6e81c57726..f67ff2a48329 100644
--- a/drivers/media/pci/mgb4/mgb4_sysfs_out.c
+++ b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
@@ -231,7 +231,7 @@ static ssize_t frame_rate_show(struct device *dev,
 	u32 period = mgb4_read_reg(&voutdev->mgbdev->video,
 				   voutdev->config->regs.frame_period);
 
-	return sprintf(buf, "%u\n", 125000000 / period);
+	return sprintf(buf, "%u\n", MGB4_HW_FREQ / period);
 }
 
 /*
@@ -252,7 +252,7 @@ static ssize_t frame_rate_store(struct device *dev,
 		return ret;
 
 	mgb4_write_reg(&voutdev->mgbdev->video,
-		       voutdev->config->regs.frame_period, 125000000 / val);
+		       voutdev->config->regs.frame_period, MGB4_HW_FREQ / val);
 
 	return count;
 }
diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 7fb14e867e8d..e9332abb3172 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -18,6 +18,7 @@
 #include <linux/workqueue.h>
 #include <linux/align.h>
 #include <linux/dma/amd_xdma.h>
+#include <linux/v4l2-dv-timings.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-sg.h>
@@ -34,8 +35,8 @@ ATTRIBUTE_GROUPS(mgb4_fpdl3_in);
 ATTRIBUTE_GROUPS(mgb4_gmsl_in);
 
 static const struct mgb4_vin_config vin_cfg[] = {
-	{0, 0, 0, 6, {0x10, 0x00, 0x04, 0x08, 0x1C, 0x14, 0x18, 0x20, 0x24, 0x28}},
-	{1, 1, 1, 7, {0x40, 0x30, 0x34, 0x38, 0x4C, 0x44, 0x48, 0x50, 0x54, 0x58}}
+	{0, 0, 0, 6, {0x10, 0x00, 0x04, 0x08, 0x1C, 0x14, 0x18, 0x20, 0x24, 0x28, 0xE8}},
+	{1, 1, 1, 7, {0x40, 0x30, 0x34, 0x38, 0x4C, 0x44, 0x48, 0x50, 0x54, 0x58, 0xEC}}
 };
 
 static const struct i2c_board_info fpdl3_deser_info[] = {
@@ -76,6 +77,9 @@ static const struct v4l2_dv_timings_cap video_timings_cap = {
 	},
 };
 
+/* Dummy timings when no signal present */
+static const struct v4l2_dv_timings cea1080p60 = V4L2_DV_BT_CEA_1920X1080P60;
+
 /*
  * Returns the video output connected with the given video input if the input
  * is in loopback mode.
@@ -318,7 +322,8 @@ static int fh_open(struct file *file)
 	if (!v4l2_fh_is_singular_file(file))
 		goto out;
 
-	get_timings(vindev, &vindev->timings);
+	if (get_timings(vindev, &vindev->timings) < 0)
+		vindev->timings = cea1080p60;
 	set_loopback_padding(vindev, vindev->padding);
 
 out:
@@ -394,12 +399,13 @@ static int vidioc_enum_frameintervals(struct file *file, void *priv,
 	    ival->height != vindev->timings.bt.height)
 		return -EINVAL;
 
-	ival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
-	ival->stepwise.min.denominator = 60;
-	ival->stepwise.min.numerator = 1;
-	ival->stepwise.max.denominator = 1;
-	ival->stepwise.max.numerator = 1;
-	ival->stepwise.step = ival->stepwise.max;
+	ival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	ival->stepwise.max.denominator = MGB4_HW_FREQ;
+	ival->stepwise.max.numerator = 0xFFFFFFFF;
+	ival->stepwise.min.denominator = vindev->timings.bt.pixelclock;
+	ival->stepwise.min.numerator = pixel_size(&vindev->timings);
+	ival->stepwise.step.denominator = MGB4_HW_FREQ;
+	ival->stepwise.step.numerator = 1;
 
 	return 0;
 }
@@ -558,24 +564,56 @@ static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int vidioc_parm(struct file *file, void *priv,
-		       struct v4l2_streamparm *parm)
+static int vidioc_g_parm(struct file *file, void *priv,
+			 struct v4l2_streamparm *parm)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
 	struct mgb4_regs *video = &vindev->mgbdev->video;
-	const struct mgb4_vin_regs *regs = &vindev->config->regs;
-	struct v4l2_fract timeperframe = {
-		.numerator = mgb4_read_reg(video, regs->frame_period),
-		.denominator = 125000000,
-	};
+	struct v4l2_fract *tpf = &parm->parm.output.timeperframe;
+	u32 timer;
 
 	parm->parm.capture.readbuffers = 2;
-	parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	parm->parm.capture.timeperframe = timeperframe;
+
+	if (has_timeperframe(video)) {
+		timer = mgb4_read_reg(video, vindev->config->regs.timer);
+		if (timer < 0xFFFF) {
+			tpf->numerator = pixel_size(&vindev->timings);
+			tpf->denominator = vindev->timings.bt.pixelclock;
+		} else {
+			tpf->numerator = timer;
+			tpf->denominator = MGB4_HW_FREQ;
+		}
+
+		parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	}
 
 	return 0;
 }
 
+static int vidioc_s_parm(struct file *file, void *priv,
+			 struct v4l2_streamparm *parm)
+{
+	struct mgb4_vin_dev *vindev = video_drvdata(file);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
+	struct v4l2_fract *tpf = &parm->parm.output.timeperframe;
+	u32 period, timer;
+
+	if (has_timeperframe(video)) {
+		timer = tpf->denominator ?
+			MGB4_PERIOD(tpf->numerator, tpf->denominator) : 0;
+		if (timer) {
+			period = MGB4_PERIOD(pixel_size(&vindev->timings),
+					     vindev->timings.bt.pixelclock);
+			if (timer < period)
+				timer = 0;
+		}
+
+		mgb4_write_reg(video, vindev->config->regs.timer, timer);
+	}
+
+	return vidioc_g_parm(file, priv, parm);
+}
+
 static int vidioc_s_dv_timings(struct file *file, void *fh,
 			       struct v4l2_dv_timings *timings)
 {
@@ -659,8 +697,8 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
 	.vidioc_expbuf = vb2_ioctl_expbuf,
 	.vidioc_streamon = vb2_ioctl_streamon,
 	.vidioc_streamoff = vb2_ioctl_streamoff,
-	.vidioc_g_parm = vidioc_parm,
-	.vidioc_s_parm = vidioc_parm,
+	.vidioc_g_parm = vidioc_g_parm,
+	.vidioc_s_parm = vidioc_s_parm,
 	.vidioc_dv_timings_cap = vidioc_dv_timings_cap,
 	.vidioc_enum_dv_timings = vidioc_enum_dv_timings,
 	.vidioc_g_dv_timings = vidioc_g_dv_timings,
@@ -843,10 +881,16 @@ static void debugfs_init(struct mgb4_vin_dev *vindev)
 	vindev->regs[7].offset = vindev->config->regs.signal2;
 	vindev->regs[8].name = "PADDING_PIXELS";
 	vindev->regs[8].offset = vindev->config->regs.padding;
+	if (has_timeperframe(video)) {
+		vindev->regs[9].name = "TIMER";
+		vindev->regs[9].offset = vindev->config->regs.timer;
+		vindev->regset.nregs = 10;
+	} else {
+		vindev->regset.nregs = 9;
+	}
 
 	vindev->regset.base = video->membase;
 	vindev->regset.regs = vindev->regs;
-	vindev->regset.nregs = ARRAY_SIZE(vindev->regs);
 
 	debugfs_create_regset32("registers", 0444, vindev->debugfs,
 				&vindev->regset);
diff --git a/drivers/media/pci/mgb4/mgb4_vin.h b/drivers/media/pci/mgb4/mgb4_vin.h
index 0249b400ad4d..9693bd0ce180 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.h
+++ b/drivers/media/pci/mgb4/mgb4_vin.h
@@ -25,6 +25,7 @@ struct mgb4_vin_regs {
 	u32 signal;
 	u32 signal2;
 	u32 padding;
+	u32 timer;
 };
 
 struct mgb4_vin_config {
@@ -59,7 +60,7 @@ struct mgb4_vin_dev {
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 	struct debugfs_regset32 regset;
-	struct debugfs_reg32 regs[9];
+	struct debugfs_reg32 regs[sizeof(struct mgb4_vin_regs) / 4];
 #endif
 };
 
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 2ee9606d9072..d98b6e87d71f 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -16,6 +16,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-sg.h>
+#include <media/v4l2-dv-timings.h>
 #include "mgb4_core.h"
 #include "mgb4_dma.h"
 #include "mgb4_sysfs.h"
@@ -23,12 +24,16 @@
 #include "mgb4_cmt.h"
 #include "mgb4_vout.h"
 
+#define DEFAULT_WIDTH     1280
+#define DEFAULT_HEIGHT    640
+#define DEFAULT_PERIOD    (MGB4_HW_FREQ / 60)
+
 ATTRIBUTE_GROUPS(mgb4_fpdl3_out);
 ATTRIBUTE_GROUPS(mgb4_gmsl_out);
 
 static const struct mgb4_vout_config vout_cfg[] = {
-	{0, 0, 8, {0x78, 0x60, 0x64, 0x68, 0x74, 0x6C, 0x70, 0x7c}},
-	{1, 1, 9, {0x98, 0x80, 0x84, 0x88, 0x94, 0x8c, 0x90, 0x9c}}
+	{0, 0, 8, {0x78, 0x60, 0x64, 0x68, 0x74, 0x6C, 0x70, 0x7C, 0xE0}},
+	{1, 1, 9, {0x98, 0x80, 0x84, 0x88, 0x94, 0x8C, 0x90, 0x9C, 0xE4}}
 };
 
 static const struct i2c_board_info fpdl3_ser_info[] = {
@@ -40,6 +45,49 @@ static const struct mgb4_i2c_kv fpdl3_i2c[] = {
 	{0x05, 0xFF, 0x04}, {0x06, 0xFF, 0x01}, {0xC2, 0xFF, 0x80}
 };
 
+static const struct v4l2_dv_timings_cap video_timings_cap = {
+	.type = V4L2_DV_BT_656_1120,
+	.bt = {
+		.min_width = 320,
+		.max_width = 4096,
+		.min_height = 240,
+		.max_height = 2160,
+		.min_pixelclock = 1843200, /* 320 x 240 x 24Hz */
+		.max_pixelclock = 530841600, /* 4096 x 2160 x 60Hz */
+		.standards = V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
+			V4L2_DV_BT_STD_CVT | V4L2_DV_BT_STD_GTF,
+		.capabilities = V4L2_DV_BT_CAP_PROGRESSIVE |
+			V4L2_DV_BT_CAP_CUSTOM,
+	},
+};
+
+static void get_timings(struct mgb4_vout_dev *voutdev,
+			struct v4l2_dv_timings *timings)
+{
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	const struct mgb4_vout_regs *regs = &voutdev->config->regs;
+
+	u32 hsync = mgb4_read_reg(video, regs->hsync);
+	u32 vsync = mgb4_read_reg(video, regs->vsync);
+	u32 resolution = mgb4_read_reg(video, regs->resolution);
+
+	memset(timings, 0, sizeof(*timings));
+	timings->type = V4L2_DV_BT_656_1120;
+	timings->bt.width = resolution >> 16;
+	timings->bt.height = resolution & 0xFFFF;
+	if (hsync & (1U << 31))
+		timings->bt.polarities |= V4L2_DV_HSYNC_POS_POL;
+	if (vsync & (1U << 31))
+		timings->bt.polarities |= V4L2_DV_VSYNC_POS_POL;
+	timings->bt.pixelclock = voutdev->freq * 1000;
+	timings->bt.hsync = (hsync & 0x00FF0000) >> 16;
+	timings->bt.vsync = (vsync & 0x00FF0000) >> 16;
+	timings->bt.hbackporch = (hsync & 0x0000FF00) >> 8;
+	timings->bt.hfrontporch = hsync & 0x000000FF;
+	timings->bt.vbackporch = (vsync & 0x0000FF00) >> 8;
+	timings->bt.vfrontporch = vsync & 0x000000FF;
+}
+
 static void return_all_buffers(struct mgb4_vout_dev *voutdev,
 			       enum vb2_buffer_state state)
 {
@@ -336,11 +384,128 @@ static int vidioc_enum_output(struct file *file, void *priv,
 		return -EINVAL;
 
 	out->type = V4L2_OUTPUT_TYPE_ANALOG;
+	out->capabilities = V4L2_OUT_CAP_DV_TIMINGS;
 	strscpy(out->name, "MGB4", sizeof(out->name));
 
 	return 0;
 }
 
+static int vidioc_enum_frameintervals(struct file *file, void *priv,
+				      struct v4l2_frmivalenum *ival)
+{
+	struct mgb4_vout_dev *voutdev = video_drvdata(file);
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	struct v4l2_dv_timings timings;
+
+	if (ival->index != 0)
+		return -EINVAL;
+	if (!(ival->pixel_format == V4L2_PIX_FMT_ABGR32 ||
+	      ((has_yuv(video) && ival->pixel_format == V4L2_PIX_FMT_YUYV))))
+		return -EINVAL;
+	if (ival->width != voutdev->width || ival->height != voutdev->height)
+		return -EINVAL;
+
+	get_timings(voutdev, &timings);
+
+	ival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	ival->stepwise.max.denominator = MGB4_HW_FREQ;
+	ival->stepwise.max.numerator = 0xFFFFFFFF;
+	ival->stepwise.min.denominator = timings.bt.pixelclock;
+	ival->stepwise.min.numerator = pixel_size(&timings);
+	ival->stepwise.step.denominator = MGB4_HW_FREQ;
+	ival->stepwise.step.numerator = 1;
+
+	return 0;
+}
+
+static int vidioc_g_parm(struct file *file, void *priv,
+			 struct v4l2_streamparm *parm)
+{
+	struct mgb4_vout_dev *voutdev = video_drvdata(file);
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	struct v4l2_fract *tpf = &parm->parm.output.timeperframe;
+	struct v4l2_dv_timings timings;
+	u32 timer;
+
+	parm->parm.output.writebuffers = 2;
+
+	if (has_timeperframe(video)) {
+		timer = mgb4_read_reg(video, voutdev->config->regs.timer);
+		if (timer < 0xFFFF) {
+			get_timings(voutdev, &timings);
+			tpf->numerator = pixel_size(&timings);
+			tpf->denominator = timings.bt.pixelclock;
+		} else {
+			tpf->numerator = timer;
+			tpf->denominator = MGB4_HW_FREQ;
+		}
+
+		parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	}
+
+	return 0;
+}
+
+static int vidioc_s_parm(struct file *file, void *priv,
+			 struct v4l2_streamparm *parm)
+{
+	struct mgb4_vout_dev *voutdev = video_drvdata(file);
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	struct v4l2_fract *tpf = &parm->parm.output.timeperframe;
+	struct v4l2_dv_timings timings;
+	u32 timer, period;
+
+	if (has_timeperframe(video)) {
+		timer = tpf->denominator ?
+			MGB4_PERIOD(tpf->numerator, tpf->denominator) : 0;
+		if (timer) {
+			get_timings(voutdev, &timings);
+			period = MGB4_PERIOD(pixel_size(&timings),
+					     timings.bt.pixelclock);
+			if (timer < period)
+				timer = 0;
+		}
+
+		mgb4_write_reg(video, voutdev->config->regs.timer, timer);
+	}
+
+	return vidioc_g_parm(file, priv, parm);
+}
+
+static int vidioc_g_dv_timings(struct file *file, void *fh,
+			       struct v4l2_dv_timings *timings)
+{
+	struct mgb4_vout_dev *voutdev = video_drvdata(file);
+
+	get_timings(voutdev, timings);
+
+	return 0;
+}
+
+static int vidioc_s_dv_timings(struct file *file, void *fh,
+			       struct v4l2_dv_timings *timings)
+{
+	struct mgb4_vout_dev *voutdev = video_drvdata(file);
+
+	get_timings(voutdev, timings);
+
+	return 0;
+}
+
+static int vidioc_enum_dv_timings(struct file *file, void *fh,
+				  struct v4l2_enum_dv_timings *timings)
+{
+	return v4l2_enum_dv_timings_cap(timings, &video_timings_cap, NULL, NULL);
+}
+
+static int vidioc_dv_timings_cap(struct file *file, void *fh,
+				 struct v4l2_dv_timings_cap *cap)
+{
+	*cap = video_timings_cap;
+
+	return 0;
+}
+
 static const struct v4l2_ioctl_ops video_ioctl_ops = {
 	.vidioc_querycap = vidioc_querycap,
 	.vidioc_enum_fmt_vid_out = vidioc_enum_fmt,
@@ -348,8 +513,15 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
 	.vidioc_s_fmt_vid_out = vidioc_s_fmt,
 	.vidioc_g_fmt_vid_out = vidioc_g_fmt,
 	.vidioc_enum_output = vidioc_enum_output,
+	.vidioc_enum_frameintervals = vidioc_enum_frameintervals,
 	.vidioc_g_output = vidioc_g_output,
 	.vidioc_s_output = vidioc_s_output,
+	.vidioc_g_parm = vidioc_g_parm,
+	.vidioc_s_parm = vidioc_s_parm,
+	.vidioc_dv_timings_cap = vidioc_dv_timings_cap,
+	.vidioc_enum_dv_timings = vidioc_enum_dv_timings,
+	.vidioc_g_dv_timings = vidioc_g_dv_timings,
+	.vidioc_s_dv_timings = vidioc_s_dv_timings,
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
 	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
@@ -492,10 +664,10 @@ static void fpga_init(struct mgb4_vout_dev *voutdev)
 
 	mgb4_write_reg(video, regs->config, 0x00000011);
 	mgb4_write_reg(video, regs->resolution,
-		       (MGB4_DEFAULT_WIDTH << 16) | MGB4_DEFAULT_HEIGHT);
+		       (DEFAULT_WIDTH << 16) | DEFAULT_HEIGHT);
 	mgb4_write_reg(video, regs->hsync, 0x00102020);
 	mgb4_write_reg(video, regs->vsync, 0x40020202);
-	mgb4_write_reg(video, regs->frame_period, MGB4_DEFAULT_PERIOD);
+	mgb4_write_reg(video, regs->frame_period, DEFAULT_PERIOD);
 	mgb4_write_reg(video, regs->padding, 0x00000000);
 
 	voutdev->freq = mgb4_cmt_set_vout_freq(voutdev, 70000 >> 1) << 1;
@@ -526,12 +698,18 @@ static void debugfs_init(struct mgb4_vout_dev *voutdev)
 	voutdev->regs[4].offset = voutdev->config->regs.vsync;
 	voutdev->regs[5].name = "FRAME_PERIOD";
 	voutdev->regs[5].offset = voutdev->config->regs.frame_period;
-	voutdev->regs[6].name = "PADDING";
+	voutdev->regs[6].name = "PADDING_PIXELS";
 	voutdev->regs[6].offset = voutdev->config->regs.padding;
+	if (has_timeperframe(video)) {
+		voutdev->regs[7].name = "TIMER";
+		voutdev->regs[7].offset = voutdev->config->regs.timer;
+		voutdev->regset.nregs = 8;
+	} else {
+		voutdev->regset.nregs = 7;
+	}
 
 	voutdev->regset.base = video->membase;
 	voutdev->regset.regs = voutdev->regs;
-	voutdev->regset.nregs = ARRAY_SIZE(voutdev->regs);
 
 	debugfs_create_regset32("registers", 0444, voutdev->debugfs,
 				&voutdev->regset);
diff --git a/drivers/media/pci/mgb4/mgb4_vout.h b/drivers/media/pci/mgb4/mgb4_vout.h
index b163dee711fd..ab9b58b1deb7 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.h
+++ b/drivers/media/pci/mgb4/mgb4_vout.h
@@ -23,6 +23,7 @@ struct mgb4_vout_regs {
 	u32 hsync;
 	u32 vsync;
 	u32 padding;
+	u32 timer;
 };
 
 struct mgb4_vout_config {
@@ -55,7 +56,7 @@ struct mgb4_vout_dev {
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 	struct debugfs_regset32 regset;
-	struct debugfs_reg32 regs[7];
+	struct debugfs_reg32 regs[sizeof(struct mgb4_vout_regs) / 4];
 #endif
 };
 
-- 
2.45.1


