Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550514555E1
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 08:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243951AbhKRHoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 02:44:32 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:26157 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243850AbhKRHoW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 02:44:22 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1AI7GPnQ076150;
        Thu, 18 Nov 2021 15:16:25 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Nov
 2021 15:40:12 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <hverkuil-cisco@xs4all.nl>,
        <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 08/10] media: aspeed: Support aspeed mode to reduce compressed data
Date:   Thu, 18 Nov 2021 15:40:29 +0800
Message-ID: <20211118074030.685-9-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118074030.685-1-jammy_huang@aspeedtech.com>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AI7GPnQ076150
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

aspeed supports differential jpeg format which only compress the parts
which are changed. In this way, it reduces both the amount of data to be
transferred by network and those to be decoded on the client side.

4 new ctrls are added:
* Aspeed JPEG Format: to control aspeed's partial jpeg on/off
  0: standard jpeg, 1: aspeed jpeg
* Aspeed Compression Mode: to control aspeed's compression mode
  0: DCT Only, 1: DCT VQ mix 2-color, 2: DCT VQ mix 4-color
  This is AST2400 only. It will adapt JPEG or VQ encoding method according
  to the context automatically.
* Aspeed HQ Mode: to control aspeed's high quality(2-pass) compression mode
  This only works with yuv444 subsampling.
* Aspeed HQ Quality: to control the quality of aspeed's HQ mode
  only useful if Aspeed HQ mode is enabled

Aspeed JPEG Format requires an additional buffer, called bcd, to store
the information about which macro block in the new frame is different
from the previous one.

To have bcd correctly working, we need to swap the buffers for src0/1 to
make src1 refer to previous frame and src0 to the coming new frame.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
v5:
  - use runtime configuration to handle differences between soc
  - add aspeed_video_swap_src_buf().
v4
  - add include/uapi/linux/aspeed-video.h for V4L2_CID_ASPEED_XXX
  - add aspeed_video_set_format
  - remove aspeed_ctrl_format
  - add variable, format, to replace partial_jpeg
  - modify aspeed_ctrl_HQ_jpeg_quality's range
  - reduce bcd buffer size
  - update commit message
v3:
  - 'compression mode' only available for G4
v2:
  - update commit message
  - use v4l2_xxx log rather than self-defined macro
---
 drivers/media/platform/aspeed-video.c | 252 +++++++++++++++++++++++---
 include/uapi/linux/aspeed-video.h     |  15 ++
 2 files changed, 243 insertions(+), 24 deletions(-)
 create mode 100644 include/uapi/linux/aspeed-video.h

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index ba8ee82b38c3..419825ed7737 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -31,6 +31,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-contig.h>
 #include <linux/videodev2.h>
+#include <uapi/linux/aspeed-video.h>
 
 #define DEVICE_NAME			"aspeed-video"
 
@@ -55,6 +56,7 @@
 
 #define VE_MAX_SRC_BUFFER_SIZE		0x8ca000 /* 1920 * 1200, 32bpp */
 #define VE_JPEG_HEADER_SIZE		0x006000 /* 512 * 12 * 4 */
+#define VE_BCD_BUFF_SIZE		0x9000 /* (1920/8) * (1200/8) */
 
 #define VE_PROTECTION_KEY		0x000
 #define  VE_PROTECTION_KEY_UNLOCK	0x1a038aa8
@@ -105,6 +107,13 @@
 #define VE_SCALING_FILTER2		0x020
 #define VE_SCALING_FILTER3		0x024
 
+#define VE_BCD_CTRL			0x02C
+#define  VE_BCD_CTRL_EN_BCD		BIT(0)
+#define  VE_BCD_CTRL_EN_ABCD		BIT(1)
+#define  VE_BCD_CTRL_EN_CB		BIT(2)
+#define  VE_BCD_CTRL_THR		GENMASK(23, 16)
+#define  VE_BCD_CTRL_ABCD_THR		GENMASK(31, 24)
+
 #define VE_CAP_WINDOW			0x030
 #define VE_COMP_WINDOW			0x034
 #define VE_COMP_PROC_OFFSET		0x038
@@ -113,6 +122,7 @@
 #define VE_SRC0_ADDR			0x044
 #define VE_SRC_SCANLINE_OFFSET		0x048
 #define VE_SRC1_ADDR			0x04c
+#define VE_BCD_ADDR			0x050
 #define VE_COMP_ADDR			0x054
 
 #define VE_STREAM_BUF_SIZE		0x058
@@ -133,6 +143,8 @@
 #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
 #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
 
+#define VE_CB_ADDR			0x06C
+
 #define AST2400_VE_COMP_SIZE_READ_BACK	0x078
 #define AST2600_VE_COMP_SIZE_READ_BACK	0x084
 
@@ -191,6 +203,12 @@ enum {
 	VIDEO_CLOCKS_ON,
 };
 
+enum aspeed_video_format {
+	VIDEO_FMT_STANDARD = 0,
+	VIDEO_FMT_ASPEED,
+	VIDEO_FMT_MAX = VIDEO_FMT_ASPEED
+};
+
 struct aspeed_video_addr {
 	unsigned int size;
 	dma_addr_t dma;
@@ -241,10 +259,15 @@ struct aspeed_video {
 	unsigned int max_compressed_size;
 	struct aspeed_video_addr srcs[2];
 	struct aspeed_video_addr jpeg;
+	struct aspeed_video_addr bcd;
 
 	bool yuv420;
+	enum aspeed_video_format format;
+	bool hq_mode;
 	unsigned int frame_rate;
 	unsigned int jpeg_quality;
+	unsigned int jpeg_hq_quality;
+	unsigned int compression_mode;
 
 	unsigned int frame_bottom;
 	unsigned int frame_left;
@@ -413,8 +436,20 @@ static const struct v4l2_dv_timings_cap aspeed_video_timings_cap = {
 	},
 };
 
+static const char * const compress_mode_str[] = {"DCT Only",
+	"DCT VQ mix 2-color", "DCT VQ mix 4-color"};
+static const char * const format_str[] = {"Standard JPEG",
+	"Aspeed JPEG", "Partial JPEG"};
+
 static unsigned int debug;
 
+static bool aspeed_video_alloc_buf(struct aspeed_video *video,
+				   struct aspeed_video_addr *addr,
+				   unsigned int size);
+
+static void aspeed_video_free_buf(struct aspeed_video *video,
+				  struct aspeed_video_addr *addr);
+
 static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
 {
 	int i;
@@ -502,6 +537,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 	unsigned long flags;
 	struct aspeed_video_buffer *buf;
 	u32 seq_ctrl = aspeed_video_read(video, VE_SEQ_CTRL);
+	bool bcd_buf_need = (video->format != VIDEO_FMT_STANDARD);
 
 	if (video->v4l2_input_status) {
 		v4l2_warn(&video->v4l2_dev, "No signal; don't start frame\n");
@@ -514,6 +550,20 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 		return -EBUSY;
 	}
 
+	if (bcd_buf_need && !video->bcd.size) {
+		if (!aspeed_video_alloc_buf(video, &video->bcd,
+					    VE_BCD_BUFF_SIZE)) {
+			dev_err(video->dev, "Failed to allocate BCD buffer\n");
+			dev_err(video->dev, "don't start frame\n");
+			return -ENOMEM;
+		}
+		aspeed_video_write(video, VE_BCD_ADDR, video->bcd.dma);
+		v4l2_dbg(1, debug, &video->v4l2_dev, "bcd addr(%#x) size(%d)\n",
+			 video->bcd.dma, video->bcd.size);
+	} else if (!bcd_buf_need && video->bcd.size) {
+		aspeed_video_free_buf(video, &video->bcd);
+	}
+
 	spin_lock_irqsave(&video->lock, flags);
 	buf = list_first_entry_or_null(&video->buffers,
 				       struct aspeed_video_buffer, link);
@@ -610,6 +660,20 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
 	schedule_delayed_work(&video->res_work, delay);
 }
 
+static void aspeed_video_swap_src_buf(struct aspeed_video *v)
+{
+	if (v->format == VIDEO_FMT_STANDARD)
+		return;
+
+	if (v->sequence & 0x01) {
+		aspeed_video_write(v, VE_SRC0_ADDR, v->srcs[1].dma);
+		aspeed_video_write(v, VE_SRC1_ADDR, v->srcs[0].dma);
+	} else {
+		aspeed_video_write(v, VE_SRC0_ADDR, v->srcs[0].dma);
+		aspeed_video_write(v, VE_SRC1_ADDR, v->srcs[1].dma);
+	}
+}
+
 /*
  * Interrupts that we don't use but have to explicitly ignore because the
  * hardware asserts them even when they're disabled in the VE_INTERRUPT_CTRL
@@ -661,6 +725,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 
 	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
 		struct aspeed_video_buffer *buf;
+		bool empty = true;
 		u32 frame_size = aspeed_video_read(video,
 						   video->config.comp_size_read);
 
@@ -674,13 +739,23 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 		if (buf) {
 			vb2_set_plane_payload(&buf->vb.vb2_buf, 0, frame_size);
 
-			if (!list_is_last(&buf->link, &video->buffers)) {
+			/*
+			 * partial_jpeg requires continuous update.
+			 * On the contrary, standard jpeg can keep last buffer
+			 * to always have the latest result.
+			 */
+			if (video->format == VIDEO_FMT_STANDARD &&
+			    list_is_last(&buf->link, &video->buffers)) {
+				empty = false;
+				v4l2_warn(&video->v4l2_dev, "skip to keep last frame updated\n");
+			} else {
 				buf->vb.vb2_buf.timestamp = ktime_get_ns();
 				buf->vb.sequence = video->sequence++;
 				buf->vb.field = V4L2_FIELD_NONE;
 				vb2_buffer_done(&buf->vb.vb2_buf,
 						VB2_BUF_STATE_DONE);
 				list_del(&buf->link);
+				empty = list_empty(&video->buffers);
 			}
 		}
 		spin_unlock(&video->lock);
@@ -694,7 +769,10 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 		aspeed_video_write(video, VE_INTERRUPT_STATUS,
 				   VE_INTERRUPT_COMP_COMPLETE);
 		sts &= ~VE_INTERRUPT_COMP_COMPLETE;
-		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
+
+		aspeed_video_swap_src_buf(video);
+
+		if (test_bit(VIDEO_STREAMING, &video->flags) && !empty)
 			aspeed_video_start_frame(video);
 	}
 
@@ -953,10 +1031,14 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 				   FIELD_PREP(VE_TGS_FIRST, video->frame_top) |
 				   FIELD_PREP(VE_TGS_LAST,
 					      video->frame_bottom + 1));
-		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
+		aspeed_video_update(video, VE_CTRL,
+				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
+				    VE_CTRL_INT_DE);
 	} else {
 		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
-		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
+		aspeed_video_update(video, VE_CTRL,
+				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
+				    VE_CTRL_DIRECT_FETCH);
 	}
 
 	size *= 4;
@@ -991,35 +1073,71 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 
 static void aspeed_video_update_regs(struct aspeed_video *video)
 {
-	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
-		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
-		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
+	u8 jpeg_hq_quality = clamp((int)video->jpeg_hq_quality - 1, 0,
+				   ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1);
+	u32 comp_ctrl =	FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
+		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
+		FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
+		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_LUM, jpeg_hq_quality) |
+		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_CHR, jpeg_hq_quality |
+			   0x10);
 	u32 ctrl = 0;
-	u32 seq_ctrl = video->config.jpeg_mode;
+	u32 seq_ctrl = 0;
 
-	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
-		 video->frame_rate);
-	v4l2_dbg(1, debug, &video->v4l2_dev, "subsample(%s)\n",
+	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n", video->frame_rate);
+	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
+		 format_str[video->format],
 		 video->yuv420 ? "420" : "444");
-	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
-		 video->jpeg_quality);
+	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d) hq(%s) hq_quality(%d)\n",
+		 video->jpeg_quality, video->hq_mode ? "on" : "off",
+		 video->jpeg_hq_quality);
+	v4l2_dbg(1, debug, &video->v4l2_dev, "compression mode(%s)\n",
+		 compress_mode_str[video->compression_mode]);
+
+	if (video->format == VIDEO_FMT_ASPEED)
+		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
+	else
+		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
 
 	if (video->frame_rate)
 		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
 
+	if (video->format == VIDEO_FMT_STANDARD) {
+		comp_ctrl &= ~FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode);
+		seq_ctrl |= video->config.jpeg_mode;
+	}
+
 	if (video->yuv420)
 		seq_ctrl |= VE_SEQ_CTRL_YUV420;
 
 	if (video->jpeg.virt)
 		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
 
+	if (video->config.version == 4) {
+		switch (video->compression_mode) {
+		case 0:	//DCT only
+			comp_ctrl |= VE_COMP_CTRL_VQ_DCT_ONLY;
+			break;
+		case 1:	//DCT VQ mix 2-color
+			comp_ctrl &= ~(VE_COMP_CTRL_VQ_4COLOR |
+				     VE_COMP_CTRL_VQ_DCT_ONLY);
+			break;
+		case 2:	//DCT VQ mix 4-color
+			comp_ctrl |= VE_COMP_CTRL_VQ_4COLOR;
+			break;
+		}
+	}
+
 	/* Set control registers */
 	aspeed_video_update(video, VE_SEQ_CTRL,
 			    video->config.jpeg_mode | VE_SEQ_CTRL_YUV420,
 			    seq_ctrl);
 	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
 	aspeed_video_update(video, VE_COMP_CTRL,
-			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR,
+			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR |
+			    VE_COMP_CTRL_EN_HQ | VE_COMP_CTRL_HQ_DCT_LUM |
+			    VE_COMP_CTRL_HQ_DCT_CHR | VE_COMP_CTRL_VQ_4COLOR |
+			    VE_COMP_CTRL_VQ_DCT_ONLY,
 			    comp_ctrl);
 }
 
@@ -1051,6 +1169,8 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
 
 	/* Set mode detection defaults */
 	aspeed_video_write(video, VE_MODE_DETECT, 0x22666500);
+
+	aspeed_video_write(video, VE_BCD_CTRL, 0);
 }
 
 static void aspeed_video_start(struct aspeed_video *video)
@@ -1084,6 +1204,9 @@ static void aspeed_video_stop(struct aspeed_video *video)
 	if (video->srcs[1].size)
 		aspeed_video_free_buf(video, &video->srcs[1]);
 
+	if (video->bcd.size)
+		aspeed_video_free_buf(video, &video->bcd);
+
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 	video->flags = 0;
 }
@@ -1102,10 +1225,12 @@ static int aspeed_video_querycap(struct file *file, void *fh,
 static int aspeed_video_enum_format(struct file *file, void *fh,
 				    struct v4l2_fmtdesc *f)
 {
+	struct aspeed_video *video = video_drvdata(file);
+
 	if (f->index)
 		return -EINVAL;
 
-	f->pixelformat = V4L2_PIX_FMT_JPEG;
+	f->pixelformat = video->pix_fmt.pixelformat;
 
 	return 0;
 }
@@ -1120,6 +1245,29 @@ static int aspeed_video_get_format(struct file *file, void *fh,
 	return 0;
 }
 
+static int aspeed_video_set_format(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct aspeed_video *video = video_drvdata(file);
+
+	if (vb2_is_busy(&video->queue))
+		return -EBUSY;
+
+	switch (f->fmt.pix.pixelformat) {
+	case V4L2_PIX_FMT_JPEG:
+		video->format = VIDEO_FMT_STANDARD;
+		break;
+	case V4L2_PIX_FMT_AJPG:
+		video->format = VIDEO_FMT_ASPEED;
+		break;
+	default:
+		return -EINVAL;
+	}
+	video->pix_fmt.pixelformat = f->fmt.pix.pixelformat;
+
+	return 0;
+}
+
 static int aspeed_video_enum_input(struct file *file, void *fh,
 				   struct v4l2_input *inp)
 {
@@ -1337,7 +1485,7 @@ static const struct v4l2_ioctl_ops aspeed_video_ioctl_ops = {
 
 	.vidioc_enum_fmt_vid_cap = aspeed_video_enum_format,
 	.vidioc_g_fmt_vid_cap = aspeed_video_get_format,
-	.vidioc_s_fmt_vid_cap = aspeed_video_get_format,
+	.vidioc_s_fmt_vid_cap = aspeed_video_set_format,
 	.vidioc_try_fmt_vid_cap = aspeed_video_get_format,
 
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
@@ -1386,6 +1534,24 @@ static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
 		if (test_bit(VIDEO_STREAMING, &video->flags))
 			aspeed_video_update_regs(video);
 		break;
+	case V4L2_CID_ASPEED_COMPRESSION_MODE:
+		if (video->config.version > 4)
+			return -EINVAL;
+
+		video->compression_mode = ctrl->val;
+		if (test_bit(VIDEO_STREAMING, &video->flags))
+			aspeed_video_update_regs(video);
+		break;
+	case V4L2_CID_ASPEED_HQ_MODE:
+		video->hq_mode = ctrl->val;
+		if (test_bit(VIDEO_STREAMING, &video->flags))
+			aspeed_video_update_regs(video);
+		break;
+	case V4L2_CID_ASPEED_HQ_JPEG_QUALITY:
+		video->jpeg_hq_quality = ctrl->val;
+		if (test_bit(VIDEO_STREAMING, &video->flags))
+			aspeed_video_update_regs(video);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1397,6 +1563,39 @@ static const struct v4l2_ctrl_ops aspeed_video_ctrl_ops = {
 	.s_ctrl = aspeed_video_set_ctrl,
 };
 
+static const struct v4l2_ctrl_config aspeed_ctrl_compression_mode = {
+	.ops = &aspeed_video_ctrl_ops,
+	.id = V4L2_CID_ASPEED_COMPRESSION_MODE,
+	.name = "Aspeed Compression Mode",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = 0,
+	.max = 2,
+	.step = 1,
+	.def = 0,
+};
+
+static const struct v4l2_ctrl_config aspeed_ctrl_HQ_mode = {
+	.ops = &aspeed_video_ctrl_ops,
+	.id = V4L2_CID_ASPEED_HQ_MODE,
+	.name = "Aspeed HQ Mode",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = false,
+	.max = true,
+	.step = 1,
+	.def = false,
+};
+
+static const struct v4l2_ctrl_config aspeed_ctrl_HQ_jpeg_quality = {
+	.ops = &aspeed_video_ctrl_ops,
+	.id = V4L2_CID_ASPEED_HQ_JPEG_QUALITY,
+	.name = "Aspeed HQ Quality",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = 1,
+	.max = ASPEED_VIDEO_JPEG_NUM_QUALITIES,
+	.step = 1,
+	.def = 1,
+};
+
 static void aspeed_video_resolution_work(struct work_struct *work)
 {
 	struct delayed_work *dwork = to_delayed_work(work);
@@ -1619,7 +1818,6 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 		   (v->perf.totaltime && v->sequence) ?
 		   1000/(v->perf.totaltime/v->sequence) : 0);
 
-
 	return 0;
 }
 
@@ -1663,6 +1861,7 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 	struct v4l2_device *v4l2_dev = &video->v4l2_dev;
 	struct vb2_queue *vbq = &video->queue;
 	struct video_device *vdev = &video->vdev;
+	struct v4l2_ctrl_handler *hdl = &video->ctrl_handler;
 	int rc;
 
 	video->pix_fmt.pixelformat = V4L2_PIX_FMT_JPEG;
@@ -1677,22 +1876,26 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 		return rc;
 	}
 
-	v4l2_ctrl_handler_init(&video->ctrl_handler, 2);
-	v4l2_ctrl_new_std(&video->ctrl_handler, &aspeed_video_ctrl_ops,
-			  V4L2_CID_JPEG_COMPRESSION_QUALITY, 0,
-			  ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1, 1, 0);
-	v4l2_ctrl_new_std_menu(&video->ctrl_handler, &aspeed_video_ctrl_ops,
+	v4l2_ctrl_handler_init(hdl, 6);
+	v4l2_ctrl_new_std(hdl, &aspeed_video_ctrl_ops,
+			  V4L2_CID_JPEG_COMPRESSION_QUALITY, 1,
+			  ASPEED_VIDEO_JPEG_NUM_QUALITIES, 1, 1);
+	v4l2_ctrl_new_std_menu(hdl, &aspeed_video_ctrl_ops,
 			       V4L2_CID_JPEG_CHROMA_SUBSAMPLING,
 			       V4L2_JPEG_CHROMA_SUBSAMPLING_420, mask,
 			       V4L2_JPEG_CHROMA_SUBSAMPLING_444);
+	if (video->config.version == 4)
+		v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_compression_mode, NULL);
+	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_mode, NULL);
+	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_jpeg_quality, NULL);
 
-	rc = video->ctrl_handler.error;
+	rc = hdl->error;
 	if (rc) {
 		dev_err(video->dev, "Failed to init controls: %d\n", rc);
 		goto err_ctrl_init;
 	}
 
-	v4l2_dev->ctrl_handler = &video->ctrl_handler;
+	v4l2_dev->ctrl_handler = hdl;
 
 	vbq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	vbq->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
@@ -1833,6 +2036,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	video->frame_rate = 30;
+	video->jpeg_hq_quality = 1;
 	video->dev = &pdev->dev;
 	spin_lock_init(&video->lock);
 	mutex_init(&video->video_lock);
diff --git a/include/uapi/linux/aspeed-video.h b/include/uapi/linux/aspeed-video.h
new file mode 100644
index 000000000000..117bfeaaa83a
--- /dev/null
+++ b/include/uapi/linux/aspeed-video.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 ASPEED Technology Inc.
+ */
+
+#ifndef _UAPI_LINUX_ASPEED_VIDEO_H
+#define _UAPI_LINUX_ASPEED_VIDEO_H
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_ASPEED_COMPRESSION_MODE	(V4L2_CID_USER_ASPEED_BASE  + 1)
+#define V4L2_CID_ASPEED_HQ_MODE			(V4L2_CID_USER_ASPEED_BASE  + 2)
+#define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(V4L2_CID_USER_ASPEED_BASE  + 3)
+
+#endif /* _UAPI_LINUX_ASPEED_VIDEO_H */
-- 
2.25.1

