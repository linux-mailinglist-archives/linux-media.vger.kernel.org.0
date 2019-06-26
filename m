Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF42556795
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 13:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfFZL16 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 07:27:58 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:49451 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727296AbfFZL15 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 07:27:57 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g65chWtPYSfvXg65ghKPMI; Wed, 26 Jun 2019 13:27:53 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/5] media/pci: don't set description for ENUM_FMT
Date:   Wed, 26 Jun 2019 13:27:46 +0200
Message-Id: <20190626112748.31730-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl>
References: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBYiohrDrTXdPkv7t4DvPwkcE6dNEQ8zWqe5DXiBhwL5TFs6mKk3EtJ7YmH9KrsxCAtchDGaxaynqqeh1+mE40QcjQEEtHcvXcDurnzeNtbMwtQpctnn
 dpX40rp8ESj/8P63WUjO3wg0G5Tp3qu3+isX7DjJRXSHoCjSPqkYR86aSiH9t52QE3E87B2GmOW5CAZIlnbyxs5uhrCAZj/gpnhaC4UyNwmfzpQnrsfeNuv6
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 core sets the description for the driver in order to ensure
consistent naming.

So drop the strscpy of the description in drivers. Also remove any
description strings in driver-internal structures since those are
no longer needed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_video.c  | 16 ++---------
 drivers/media/pci/bt8xx/bttv-driver.c         | 19 -------------
 drivers/media/pci/bt8xx/bttv-risc.c           |  8 +++---
 drivers/media/pci/bt8xx/bttvp.h               |  1 -
 drivers/media/pci/cobalt/cobalt-v4l2.c        |  5 ----
 drivers/media/pci/cx23885/cx23885-417.c       |  1 -
 drivers/media/pci/cx23885/cx23885-video.c     |  7 ++---
 drivers/media/pci/cx23885/cx23885.h           |  1 -
 drivers/media/pci/cx25821/cx25821-video.c     |  7 ++---
 drivers/media/pci/cx25821/cx25821.h           |  1 -
 drivers/media/pci/cx88/cx88-blackbird.c       |  2 --
 drivers/media/pci/cx88/cx88-video.c           | 17 ++---------
 drivers/media/pci/cx88/cx88.h                 |  1 -
 drivers/media/pci/dt3155/dt3155.c             |  1 -
 drivers/media/pci/meye/meye.c                 |  3 --
 drivers/media/pci/saa7134/saa7134-empress.c   |  2 --
 drivers/media/pci/saa7134/saa7134-video.c     | 28 +++----------------
 drivers/media/pci/saa7134/saa7134.h           |  1 -
 drivers/media/pci/saa7164/saa7164-encoder.c   |  1 -
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    |  7 -----
 drivers/media/pci/solo6x10/solo6x10-v4l2.c    |  2 --
 drivers/media/pci/sta2x11/sta2x11_vip.c       |  2 --
 drivers/media/pci/tw68/tw68-video.c           | 13 ---------
 drivers/media/pci/tw68/tw68.h                 |  1 -
 include/media/drv-intf/saa7146_vv.h           |  1 -
 25 files changed, 17 insertions(+), 131 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 4c399a42e874..d16122039b0c 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -20,62 +20,52 @@ MODULE_PARM_DESC(max_memory, "maximum memory usage for capture buffers (default:
 /* format descriptions for capture and preview */
 static struct saa7146_format formats[] = {
 	{
-		.name		= "RGB-8 (3-3-2)",
 		.pixelformat	= V4L2_PIX_FMT_RGB332,
 		.trans		= RGB08_COMPOSED,
 		.depth		= 8,
 		.flags		= 0,
 	}, {
-		.name		= "RGB-16 (5/B-6/G-5/R)",
 		.pixelformat	= V4L2_PIX_FMT_RGB565,
 		.trans		= RGB16_COMPOSED,
 		.depth		= 16,
 		.flags		= 0,
 	}, {
-		.name		= "RGB-24 (B-G-R)",
 		.pixelformat	= V4L2_PIX_FMT_BGR24,
 		.trans		= RGB24_COMPOSED,
 		.depth		= 24,
 		.flags		= 0,
 	}, {
-		.name		= "RGB-32 (B-G-R)",
 		.pixelformat	= V4L2_PIX_FMT_BGR32,
 		.trans		= RGB32_COMPOSED,
 		.depth		= 32,
 		.flags		= 0,
 	}, {
-		.name		= "RGB-32 (R-G-B)",
 		.pixelformat	= V4L2_PIX_FMT_RGB32,
 		.trans		= RGB32_COMPOSED,
 		.depth		= 32,
 		.flags		= 0,
 		.swap		= 0x2,
 	}, {
-		.name		= "Greyscale-8",
 		.pixelformat	= V4L2_PIX_FMT_GREY,
 		.trans		= Y8,
 		.depth		= 8,
 		.flags		= 0,
 	}, {
-		.name		= "YUV 4:2:2 planar (Y-Cb-Cr)",
 		.pixelformat	= V4L2_PIX_FMT_YUV422P,
 		.trans		= YUV422_DECOMPOSED,
 		.depth		= 16,
 		.flags		= FORMAT_BYTE_SWAP|FORMAT_IS_PLANAR,
 	}, {
-		.name		= "YVU 4:2:0 planar (Y-Cb-Cr)",
 		.pixelformat	= V4L2_PIX_FMT_YVU420,
 		.trans		= YUV420_DECOMPOSED,
 		.depth		= 12,
 		.flags		= FORMAT_BYTE_SWAP|FORMAT_IS_PLANAR,
 	}, {
-		.name		= "YUV 4:2:0 planar (Y-Cb-Cr)",
 		.pixelformat	= V4L2_PIX_FMT_YUV420,
 		.trans		= YUV420_DECOMPOSED,
 		.depth		= 12,
 		.flags		= FORMAT_IS_PLANAR,
 	}, {
-		.name		= "YUV 4:2:2 (U-Y-V-Y)",
 		.pixelformat	= V4L2_PIX_FMT_UYVY,
 		.trans		= YUV422_COMPOSED,
 		.depth		= 16,
@@ -147,10 +137,10 @@ int saa7146_start_preview(struct saa7146_fh *fh)
 	}
 	vv->ov.win = fmt.fmt.win;
 
-	DEB_D("%dx%d+%d+%d %s field=%s\n",
+	DEB_D("%dx%d+%d+%d 0x%08x field=%s\n",
 	      vv->ov.win.w.width, vv->ov.win.w.height,
 	      vv->ov.win.w.left, vv->ov.win.w.top,
-	      vv->ov_fmt->name, v4l2_field_names[vv->ov.win.field]);
+	      vv->ov_fmt->pixelformat, v4l2_field_names[vv->ov.win.field]);
 
 	if (0 != (ret = saa7146_enable_overlay(fh))) {
 		DEB_D("enabling overlay failed: %d\n", ret);
@@ -515,8 +505,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtd
 {
 	if (f->index >= ARRAY_SIZE(formats))
 		return -EINVAL;
-	strscpy((char *)f->description, formats[f->index].name,
-		sizeof(f->description));
 	f->pixelformat = formats[f->index].pixelformat;
 	return 0;
 }
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 612d1c0010c1..a359da7773a9 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -503,77 +503,65 @@ static const unsigned int BTTV_TVNORMS = ARRAY_SIZE(bttv_tvnorms);
    packed pixel formats must come first */
 static const struct bttv_format formats[] = {
 	{
-		.name     = "8 bpp, gray",
 		.fourcc   = V4L2_PIX_FMT_GREY,
 		.btformat = BT848_COLOR_FMT_Y8,
 		.depth    = 8,
 		.flags    = FORMAT_FLAGS_PACKED,
 	},{
-		.name     = "8 bpp, dithered color",
 		.fourcc   = V4L2_PIX_FMT_HI240,
 		.btformat = BT848_COLOR_FMT_RGB8,
 		.depth    = 8,
 		.flags    = FORMAT_FLAGS_PACKED | FORMAT_FLAGS_DITHER,
 	},{
-		.name     = "15 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_RGB555,
 		.btformat = BT848_COLOR_FMT_RGB15,
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	},{
-		.name     = "15 bpp RGB, be",
 		.fourcc   = V4L2_PIX_FMT_RGB555X,
 		.btformat = BT848_COLOR_FMT_RGB15,
 		.btswap   = 0x03, /* byteswap */
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	},{
-		.name     = "16 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_RGB565,
 		.btformat = BT848_COLOR_FMT_RGB16,
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	},{
-		.name     = "16 bpp RGB, be",
 		.fourcc   = V4L2_PIX_FMT_RGB565X,
 		.btformat = BT848_COLOR_FMT_RGB16,
 		.btswap   = 0x03, /* byteswap */
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	},{
-		.name     = "24 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_BGR24,
 		.btformat = BT848_COLOR_FMT_RGB24,
 		.depth    = 24,
 		.flags    = FORMAT_FLAGS_PACKED,
 	},{
-		.name     = "32 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_BGR32,
 		.btformat = BT848_COLOR_FMT_RGB32,
 		.depth    = 32,
 		.flags    = FORMAT_FLAGS_PACKED,
 	},{
-		.name     = "32 bpp RGB, be",
 		.fourcc   = V4L2_PIX_FMT_RGB32,
 		.btformat = BT848_COLOR_FMT_RGB32,
 		.btswap   = 0x0f, /* byte+word swap */
 		.depth    = 32,
 		.flags    = FORMAT_FLAGS_PACKED,
 	},{
-		.name     = "4:2:2, packed, YUYV",
 		.fourcc   = V4L2_PIX_FMT_YUYV,
 		.btformat = BT848_COLOR_FMT_YUY2,
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	},{
-		.name     = "4:2:2, packed, UYVY",
 		.fourcc   = V4L2_PIX_FMT_UYVY,
 		.btformat = BT848_COLOR_FMT_YUY2,
 		.btswap   = 0x03, /* byteswap */
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	},{
-		.name     = "4:2:2, planar, Y-Cb-Cr",
 		.fourcc   = V4L2_PIX_FMT_YUV422P,
 		.btformat = BT848_COLOR_FMT_YCrCb422,
 		.depth    = 16,
@@ -581,7 +569,6 @@ static const struct bttv_format formats[] = {
 		.hshift   = 1,
 		.vshift   = 0,
 	},{
-		.name     = "4:2:0, planar, Y-Cb-Cr",
 		.fourcc   = V4L2_PIX_FMT_YUV420,
 		.btformat = BT848_COLOR_FMT_YCrCb422,
 		.depth    = 12,
@@ -589,7 +576,6 @@ static const struct bttv_format formats[] = {
 		.hshift   = 1,
 		.vshift   = 1,
 	},{
-		.name     = "4:2:0, planar, Y-Cr-Cb",
 		.fourcc   = V4L2_PIX_FMT_YVU420,
 		.btformat = BT848_COLOR_FMT_YCrCb422,
 		.depth    = 12,
@@ -597,7 +583,6 @@ static const struct bttv_format formats[] = {
 		.hshift   = 1,
 		.vshift   = 1,
 	},{
-		.name     = "4:1:1, planar, Y-Cb-Cr",
 		.fourcc   = V4L2_PIX_FMT_YUV411P,
 		.btformat = BT848_COLOR_FMT_YCrCb411,
 		.depth    = 12,
@@ -605,7 +590,6 @@ static const struct bttv_format formats[] = {
 		.hshift   = 2,
 		.vshift   = 0,
 	},{
-		.name     = "4:1:0, planar, Y-Cb-Cr",
 		.fourcc   = V4L2_PIX_FMT_YUV410,
 		.btformat = BT848_COLOR_FMT_YCrCb411,
 		.depth    = 9,
@@ -613,7 +597,6 @@ static const struct bttv_format formats[] = {
 		.hshift   = 2,
 		.vshift   = 2,
 	},{
-		.name     = "4:1:0, planar, Y-Cr-Cb",
 		.fourcc   = V4L2_PIX_FMT_YVU410,
 		.btformat = BT848_COLOR_FMT_YCrCb411,
 		.depth    = 9,
@@ -621,7 +604,6 @@ static const struct bttv_format formats[] = {
 		.hshift   = 2,
 		.vshift   = 2,
 	},{
-		.name     = "raw scanlines",
 		.fourcc   = -1,
 		.btformat = BT848_COLOR_FMT_RAW,
 		.depth    = 8,
@@ -2500,7 +2482,6 @@ static int bttv_enum_fmt_cap_ovr(struct v4l2_fmtdesc *f)
 		return -EINVAL;
 
 	f->pixelformat = formats[i].fourcc;
-	strscpy(f->description, formats[i].name, sizeof(f->description));
 
 	return i;
 }
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 6b59ca337c7f..fc8708047be8 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -699,9 +699,9 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 	const struct bttv_tvnorm *tvnorm = bttv_tvnorms + buf->tvnorm;
 	struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
 
-	dprintk("%d: buffer field: %s  format: %s  size: %dx%d\n",
+	dprintk("%d: buffer field: %s  format: 0x%08x  size: %dx%d\n",
 		btv->c.nr, v4l2_field_names[buf->vb.field],
-		buf->fmt->name, buf->vb.width, buf->vb.height);
+		buf->fmt->fourcc, buf->vb.width, buf->vb.height);
 
 	/* packed pixel modes */
 	if (buf->fmt->flags & FORMAT_FLAGS_PACKED) {
@@ -860,9 +860,9 @@ bttv_overlay_risc(struct bttv *btv,
 		  struct bttv_buffer *buf)
 {
 	/* check interleave, bottom+top fields */
-	dprintk("%d: overlay fields: %s format: %s  size: %dx%d\n",
+	dprintk("%d: overlay fields: %s format: 0x%08x  size: %dx%d\n",
 		btv->c.nr, v4l2_field_names[buf->vb.field],
-		fmt->name, ov->w.width, ov->w.height);
+		fmt->fourcc, ov->w.width, ov->w.height);
 
 	/* calculate geometry */
 	bttv_calc_geo(btv,&buf->geo,ov->w.width,ov->w.height,
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index b159d6ddbfcf..4abf43657846 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -99,7 +99,6 @@ struct bttv_tvnorm {
 extern const struct bttv_tvnorm bttv_tvnorms[];
 
 struct bttv_format {
-	char *name;
 	int  fourcc;          /* video4linux 2      */
 	int  btformat;        /* BT848_COLOR_FMT_*  */
 	int  btswap;          /* BT848_COLOR_CTL_*  */
diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index 39dabd4da60f..ea96f333ee2b 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -688,15 +688,12 @@ static int cobalt_enum_fmt_vid_cap(struct file *file, void *priv_fh,
 {
 	switch (f->index) {
 	case 0:
-		strscpy(f->description, "YUV 4:2:2", sizeof(f->description));
 		f->pixelformat = V4L2_PIX_FMT_YUYV;
 		break;
 	case 1:
-		strscpy(f->description, "RGB24", sizeof(f->description));
 		f->pixelformat = V4L2_PIX_FMT_RGB24;
 		break;
 	case 2:
-		strscpy(f->description, "RGB32", sizeof(f->description));
 		f->pixelformat = V4L2_PIX_FMT_BGR32;
 		break;
 	default:
@@ -893,11 +890,9 @@ static int cobalt_enum_fmt_vid_out(struct file *file, void *priv_fh,
 {
 	switch (f->index) {
 	case 0:
-		strscpy(f->description, "YUV 4:2:2", sizeof(f->description));
 		f->pixelformat = V4L2_PIX_FMT_YUYV;
 		break;
 	case 1:
-		strscpy(f->description, "RGB32", sizeof(f->description));
 		f->pixelformat = V4L2_PIX_FMT_BGR32;
 		break;
 	default:
diff --git a/drivers/media/pci/cx23885/cx23885-417.c b/drivers/media/pci/cx23885/cx23885-417.c
index 82f96a4091ac..2327fe612610 100644
--- a/drivers/media/pci/cx23885/cx23885-417.c
+++ b/drivers/media/pci/cx23885/cx23885-417.c
@@ -1339,7 +1339,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (f->index != 0)
 		return -EINVAL;
 
-	strscpy(f->description, "MPEG", sizeof(f->description));
 	f->pixelformat = V4L2_PIX_FMT_MPEG;
 
 	return 0;
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index b254473db9a3..8098b15493de 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -67,7 +67,6 @@ MODULE_PARM_DESC(vid_limit, "capture memory limit in megabytes");
 #define FORMAT_FLAGS_PACKED       0x01
 static struct cx23885_fmt formats[] = {
 	{
-		.name     = "4:2:2, packed, YUYV",
 		.fourcc   = V4L2_PIX_FMT_YUYV,
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
@@ -411,9 +410,9 @@ static int buffer_prepare(struct vb2_buffer *vb)
 	default:
 		BUG();
 	}
-	dprintk(2, "[%p/%d] buffer_init - %dx%d %dbpp \"%s\" - dma=0x%08lx\n",
+	dprintk(2, "[%p/%d] buffer_init - %dx%d %dbpp 0x%08x - dma=0x%08lx\n",
 		buf, buf->vb.vb2_buf.index,
-		dev->width, dev->height, dev->fmt->depth, dev->fmt->name,
+		dev->width, dev->height, dev->fmt->depth, dev->fmt->fourcc,
 		(unsigned long)buf->risc.dma);
 	return 0;
 }
@@ -647,8 +646,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (unlikely(f->index >= ARRAY_SIZE(formats)))
 		return -EINVAL;
 
-	strscpy(f->description, formats[f->index].name,
-		sizeof(f->description));
 	f->pixelformat = formats[f->index].fourcc;
 
 	return 0;
diff --git a/drivers/media/pci/cx23885/cx23885.h b/drivers/media/pci/cx23885/cx23885.h
index 9da66fdd5a0d..a95a2e4c6a0d 100644
--- a/drivers/media/pci/cx23885/cx23885.h
+++ b/drivers/media/pci/cx23885/cx23885.h
@@ -127,7 +127,6 @@
 	V4L2_STD_PAL_60 |  V4L2_STD_SECAM_L   |  V4L2_STD_SECAM_DK)
 
 struct cx23885_fmt {
-	char  *name;
 	u32   fourcc;          /* v4l2 format id */
 	int   depth;
 	int   flags;
diff --git a/drivers/media/pci/cx25821/cx25821-video.c b/drivers/media/pci/cx25821/cx25821-video.c
index de7641170478..a10261da0db6 100644
--- a/drivers/media/pci/cx25821/cx25821-video.c
+++ b/drivers/media/pci/cx25821/cx25821-video.c
@@ -35,12 +35,10 @@ MODULE_PARM_DESC(irq_debug, "enable debug messages [IRQ handler]");
 
 static const struct cx25821_fmt formats[] = {
 	{
-		.name = "4:1:1, packed, Y41P",
 		.fourcc = V4L2_PIX_FMT_Y41P,
 		.depth = 12,
 		.flags = FORMAT_FLAGS_PACKED,
 	}, {
-		.name = "4:2:2, packed, YUYV",
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.depth = 16,
 		.flags = FORMAT_FLAGS_PACKED,
@@ -215,9 +213,9 @@ static int cx25821_buffer_prepare(struct vb2_buffer *vb)
 		break;
 	}
 
-	dprintk(2, "[%p/%d] buffer_prep - %dx%d %dbpp \"%s\" - dma=0x%08lx\n",
+	dprintk(2, "[%p/%d] buffer_prep - %dx%d %dbpp 0x%08x - dma=0x%08lx\n",
 		buf, buf->vb.vb2_buf.index, chan->width, chan->height,
-		chan->fmt->depth, chan->fmt->name,
+		chan->fmt->depth, chan->fmt->fourcc,
 		(unsigned long)buf->risc.dma);
 
 	return ret;
@@ -311,7 +309,6 @@ static int cx25821_vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	if (unlikely(f->index >= ARRAY_SIZE(formats)))
 		return -EINVAL;
 
-	strscpy(f->description, formats[f->index].name, sizeof(f->description));
 	f->pixelformat = formats[f->index].fourcc;
 
 	return 0;
diff --git a/drivers/media/pci/cx25821/cx25821.h b/drivers/media/pci/cx25821/cx25821.h
index 47dbaae78509..017307984094 100644
--- a/drivers/media/pci/cx25821/cx25821.h
+++ b/drivers/media/pci/cx25821/cx25821.h
@@ -83,7 +83,6 @@
 #define VID_CHANNEL_NUM 8
 
 struct cx25821_fmt {
-	char *name;
 	u32 fourcc;		/* v4l2 format id */
 	int depth;
 	int flags;
diff --git a/drivers/media/pci/cx88/cx88-blackbird.c b/drivers/media/pci/cx88/cx88-blackbird.c
index 200d68827073..d3da7f4297af 100644
--- a/drivers/media/pci/cx88/cx88-blackbird.c
+++ b/drivers/media/pci/cx88/cx88-blackbird.c
@@ -805,9 +805,7 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (f->index != 0)
 		return -EINVAL;
 
-	strscpy(f->description, "MPEG", sizeof(f->description));
 	f->pixelformat = V4L2_PIX_FMT_MPEG;
-	f->flags = V4L2_FMT_FLAG_COMPRESSED;
 	return 0;
 }
 
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index e59a74514c7c..dcc0f02aeb70 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -69,62 +69,52 @@ MODULE_PARM_DESC(irq_debug, "enable debug messages [IRQ handler]");
 
 static const struct cx8800_fmt formats[] = {
 	{
-		.name     = "8 bpp, gray",
 		.fourcc   = V4L2_PIX_FMT_GREY,
 		.cxformat = ColorFormatY8,
 		.depth    = 8,
 		.flags    = FORMAT_FLAGS_PACKED,
 	}, {
-		.name     = "15 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_RGB555,
 		.cxformat = ColorFormatRGB15,
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	}, {
-		.name     = "15 bpp RGB, be",
 		.fourcc   = V4L2_PIX_FMT_RGB555X,
 		.cxformat = ColorFormatRGB15 | ColorFormatBSWAP,
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	}, {
-		.name     = "16 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_RGB565,
 		.cxformat = ColorFormatRGB16,
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	}, {
-		.name     = "16 bpp RGB, be",
 		.fourcc   = V4L2_PIX_FMT_RGB565X,
 		.cxformat = ColorFormatRGB16 | ColorFormatBSWAP,
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	}, {
-		.name     = "24 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_BGR24,
 		.cxformat = ColorFormatRGB24,
 		.depth    = 24,
 		.flags    = FORMAT_FLAGS_PACKED,
 	}, {
-		.name     = "32 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_BGR32,
 		.cxformat = ColorFormatRGB32,
 		.depth    = 32,
 		.flags    = FORMAT_FLAGS_PACKED,
 	}, {
-		.name     = "32 bpp RGB, be",
 		.fourcc   = V4L2_PIX_FMT_RGB32,
 		.cxformat = ColorFormatRGB32 | ColorFormatBSWAP |
 			    ColorFormatWSWAP,
 		.depth    = 32,
 		.flags    = FORMAT_FLAGS_PACKED,
 	}, {
-		.name     = "4:2:2, packed, YUYV",
 		.fourcc   = V4L2_PIX_FMT_YUYV,
 		.cxformat = ColorFormatYUY2,
 		.depth    = 16,
 		.flags    = FORMAT_FLAGS_PACKED,
 	}, {
-		.name     = "4:2:2, packed, UYVY",
 		.fourcc   = V4L2_PIX_FMT_UYVY,
 		.cxformat = ColorFormatYUY2 | ColorFormatBSWAP,
 		.depth    = 16,
@@ -489,9 +479,9 @@ static int buffer_prepare(struct vb2_buffer *vb)
 		break;
 	}
 	dprintk(2,
-		"[%p/%d] buffer_prepare - %dx%d %dbpp \"%s\" - dma=0x%08lx\n",
-		buf, buf->vb.vb2_buf.index,
-		core->width, core->height, dev->fmt->depth, dev->fmt->name,
+		"[%p/%d] %s - %dx%d %dbpp 0x%08x - dma=0x%08lx\n",
+		buf, buf->vb.vb2_buf.index, __func__,
+		core->width, core->height, dev->fmt->depth, dev->fmt->fourcc,
 		(unsigned long)buf->risc.dma);
 	return 0;
 }
@@ -829,7 +819,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (unlikely(f->index >= ARRAY_SIZE(formats)))
 		return -EINVAL;
 
-	strscpy(f->description, formats[f->index].name, sizeof(f->description));
 	f->pixelformat = formats[f->index].fourcc;
 
 	return 0;
diff --git a/drivers/media/pci/cx88/cx88.h b/drivers/media/pci/cx88/cx88.h
index a70a50dc3edf..744a22328ebc 100644
--- a/drivers/media/pci/cx88/cx88.h
+++ b/drivers/media/pci/cx88/cx88.h
@@ -99,7 +99,6 @@ static inline unsigned int norm_maxh(v4l2_std_id norm)
 /* static data                                                 */
 
 struct cx8800_fmt {
-	const char  *name;
 	u32   fourcc;          /* v4l2 format id */
 	int   depth;
 	int   flags;
diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index b4cdda50e742..7480f0d3ad0f 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -306,7 +306,6 @@ static int dt3155_enum_fmt_vid_cap(struct file *filp,
 	if (f->index)
 		return -EINVAL;
 	f->pixelformat = V4L2_PIX_FMT_GREY;
-	strscpy(f->description, "8-bit Greyscale", sizeof(f->description));
 	return 0;
 }
 
diff --git a/drivers/media/pci/meye/meye.c b/drivers/media/pci/meye/meye.c
index 8218810c899e..0e61c81356ef 100644
--- a/drivers/media/pci/meye/meye.c
+++ b/drivers/media/pci/meye/meye.c
@@ -1104,12 +1104,9 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *fh,
 	if (f->index == 0) {
 		/* standard YUV 422 capture */
 		f->flags = 0;
-		strscpy(f->description, "YUV422", sizeof(f->description));
 		f->pixelformat = V4L2_PIX_FMT_YUYV;
 	} else {
 		/* compressed MJPEG capture */
-		f->flags = V4L2_FMT_FLAG_COMPRESSED;
-		strscpy(f->description, "MJPEG", sizeof(f->description));
 		f->pixelformat = V4L2_PIX_FMT_MJPEG;
 	}
 
diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index 1a41a56afec6..cb65d345fd3e 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -91,9 +91,7 @@ static int empress_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (f->index != 0)
 		return -EINVAL;
 
-	strscpy(f->description, "MPEG TS", sizeof(f->description));
 	f->pixelformat = V4L2_PIX_FMT_MPEG;
-	f->flags = V4L2_FMT_FLAG_COMPRESSED;
 	return 0;
 }
 
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 606df51bb636..342cabf48064 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -90,70 +90,58 @@ static int video_out[][9] = {
 
 static struct saa7134_format formats[] = {
 	{
-		.name     = "8 bpp gray",
 		.fourcc   = V4L2_PIX_FMT_GREY,
 		.depth    = 8,
 		.pm       = 0x06,
 	},{
-		.name     = "15 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_RGB555,
 		.depth    = 16,
 		.pm       = 0x13 | 0x80,
 	},{
-		.name     = "15 bpp RGB, be",
 		.fourcc   = V4L2_PIX_FMT_RGB555X,
 		.depth    = 16,
 		.pm       = 0x13 | 0x80,
 		.bswap    = 1,
 	},{
-		.name     = "16 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_RGB565,
 		.depth    = 16,
 		.pm       = 0x10 | 0x80,
 	},{
-		.name     = "16 bpp RGB, be",
 		.fourcc   = V4L2_PIX_FMT_RGB565X,
 		.depth    = 16,
 		.pm       = 0x10 | 0x80,
 		.bswap    = 1,
 	},{
-		.name     = "24 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_BGR24,
 		.depth    = 24,
 		.pm       = 0x11,
 	},{
-		.name     = "24 bpp RGB, be",
 		.fourcc   = V4L2_PIX_FMT_RGB24,
 		.depth    = 24,
 		.pm       = 0x11,
 		.bswap    = 1,
 	},{
-		.name     = "32 bpp RGB, le",
 		.fourcc   = V4L2_PIX_FMT_BGR32,
 		.depth    = 32,
 		.pm       = 0x12,
 	},{
-		.name     = "32 bpp RGB, be",
 		.fourcc   = V4L2_PIX_FMT_RGB32,
 		.depth    = 32,
 		.pm       = 0x12,
 		.bswap    = 1,
 		.wswap    = 1,
 	},{
-		.name     = "4:2:2 packed, YUYV",
 		.fourcc   = V4L2_PIX_FMT_YUYV,
 		.depth    = 16,
 		.pm       = 0x00,
 		.bswap    = 1,
 		.yuv      = 1,
 	},{
-		.name     = "4:2:2 packed, UYVY",
 		.fourcc   = V4L2_PIX_FMT_UYVY,
 		.depth    = 16,
 		.pm       = 0x00,
 		.yuv      = 1,
 	},{
-		.name     = "4:2:2 planar, Y-Cb-Cr",
 		.fourcc   = V4L2_PIX_FMT_YUV422P,
 		.depth    = 16,
 		.pm       = 0x09,
@@ -162,7 +150,6 @@ static struct saa7134_format formats[] = {
 		.hshift   = 1,
 		.vshift   = 0,
 	},{
-		.name     = "4:2:0 planar, Y-Cb-Cr",
 		.fourcc   = V4L2_PIX_FMT_YUV420,
 		.depth    = 12,
 		.pm       = 0x0a,
@@ -171,7 +158,6 @@ static struct saa7134_format formats[] = {
 		.hshift   = 1,
 		.vshift   = 1,
 	},{
-		.name     = "4:2:0 planar, Y-Cb-Cr",
 		.fourcc   = V4L2_PIX_FMT_YVU420,
 		.depth    = 12,
 		.pm       = 0x0a,
@@ -720,10 +706,10 @@ static int start_preview(struct saa7134_dev *dev)
 		return err;
 
 	dev->ovfield = dev->win.field;
-	video_dbg("start_preview %dx%d+%d+%d %s field=%s\n",
-		dev->win.w.width, dev->win.w.height,
-		dev->win.w.left, dev->win.w.top,
-		dev->ovfmt->name, v4l2_field_names[dev->ovfield]);
+	video_dbg("%s %dx%d+%d+%d 0x%08x field=%s\n", __func__,
+		  dev->win.w.width, dev->win.w.height,
+		  dev->win.w.left, dev->win.w.top,
+		  dev->ovfmt->fourcc, v4l2_field_names[dev->ovfield]);
 
 	/* setup window + clipping */
 	set_size(dev, TASK_B, dev->win.w.width, dev->win.w.height,
@@ -1780,9 +1766,6 @@ static int saa7134_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (f->index >= FORMATS)
 		return -EINVAL;
 
-	strscpy(f->description, formats[f->index].name,
-		sizeof(f->description));
-
 	f->pixelformat = formats[f->index].fourcc;
 
 	return 0;
@@ -1799,9 +1782,6 @@ static int saa7134_enum_fmt_vid_overlay(struct file *file, void  *priv,
 	if ((f->index >= FORMATS) || formats[f->index].planar)
 		return -EINVAL;
 
-	strscpy(f->description, formats[f->index].name,
-		sizeof(f->description));
-
 	f->pixelformat = formats[f->index].fourcc;
 
 	return 0;
diff --git a/drivers/media/pci/saa7134/saa7134.h b/drivers/media/pci/saa7134/saa7134.h
index 6324f174c6f9..77c325e64a97 100644
--- a/drivers/media/pci/saa7134/saa7134.h
+++ b/drivers/media/pci/saa7134/saa7134.h
@@ -98,7 +98,6 @@ struct saa7134_tvaudio {
 };
 
 struct saa7134_format {
-	char           *name;
 	unsigned int   fourcc;
 	unsigned int   depth;
 	unsigned int   pm;
diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index 43fdaa2d32bd..3fca7257a720 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -503,7 +503,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (f->index != 0)
 		return -EINVAL;
 
-	strscpy(f->description, "MPEG", sizeof(f->description));
 	f->pixelformat = V4L2_PIX_FMT_MPEG;
 
 	return 0;
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 609100a46ff8..a02f08459e14 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -822,25 +822,18 @@ static int solo_enc_enum_fmt_cap(struct file *file, void *priv,
 		switch (dev_type) {
 		case SOLO_DEV_6010:
 			f->pixelformat = V4L2_PIX_FMT_MPEG4;
-			strscpy(f->description, "MPEG-4 part 2",
-				sizeof(f->description));
 			break;
 		case SOLO_DEV_6110:
 			f->pixelformat = V4L2_PIX_FMT_H264;
-			strscpy(f->description, "H.264", sizeof(f->description));
 			break;
 		}
 		break;
 	case 1:
 		f->pixelformat = V4L2_PIX_FMT_MJPEG;
-		strscpy(f->description, "MJPEG", sizeof(f->description));
 		break;
 	default:
 		return -EINVAL;
 	}
-
-	f->flags = V4L2_FMT_FLAG_COMPRESSED;
-
 	return 0;
 }
 
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
index a968f75920b5..2efa539d6075 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
@@ -458,8 +458,6 @@ static int solo_enum_fmt_cap(struct file *file, void *priv,
 		return -EINVAL;
 
 	f->pixelformat = V4L2_PIX_FMT_UYVY;
-	strscpy(f->description, "UYUV 4:2:2 Packed", sizeof(f->description));
-
 	return 0;
 }
 
diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index e52e29814378..fd3de3bb0c89 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -560,9 +560,7 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	if (f->index != 0)
 		return -EINVAL;
 
-	strscpy(f->description, "4:2:2, packed, UYVY", sizeof(f->description));
 	f->pixelformat = V4L2_PIX_FMT_UYVY;
-	f->flags = 0;
 	return 0;
 }
 
diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 8e0952d65ad4..99e74c22d3be 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -34,53 +34,43 @@
  */
 static const struct tw68_format formats[] = {
 	{
-		.name		= "15 bpp RGB, le",
 		.fourcc		= V4L2_PIX_FMT_RGB555,
 		.depth		= 16,
 		.twformat	= ColorFormatRGB15,
 	}, {
-		.name		= "15 bpp RGB, be",
 		.fourcc		= V4L2_PIX_FMT_RGB555X,
 		.depth		= 16,
 		.twformat	= ColorFormatRGB15 | ColorFormatBSWAP,
 	}, {
-		.name		= "16 bpp RGB, le",
 		.fourcc		= V4L2_PIX_FMT_RGB565,
 		.depth		= 16,
 		.twformat	= ColorFormatRGB16,
 	}, {
-		.name		= "16 bpp RGB, be",
 		.fourcc		= V4L2_PIX_FMT_RGB565X,
 		.depth		= 16,
 		.twformat	= ColorFormatRGB16 | ColorFormatBSWAP,
 	}, {
-		.name		= "24 bpp RGB, le",
 		.fourcc		= V4L2_PIX_FMT_BGR24,
 		.depth		= 24,
 		.twformat	= ColorFormatRGB24,
 	}, {
-		.name		= "24 bpp RGB, be",
 		.fourcc		= V4L2_PIX_FMT_RGB24,
 		.depth		= 24,
 		.twformat	= ColorFormatRGB24 | ColorFormatBSWAP,
 	}, {
-		.name		= "32 bpp RGB, le",
 		.fourcc		= V4L2_PIX_FMT_BGR32,
 		.depth		= 32,
 		.twformat	= ColorFormatRGB32,
 	}, {
-		.name		= "32 bpp RGB, be",
 		.fourcc		= V4L2_PIX_FMT_RGB32,
 		.depth		= 32,
 		.twformat	= ColorFormatRGB32 | ColorFormatBSWAP |
 				  ColorFormatWSWAP,
 	}, {
-		.name		= "4:2:2 packed, YUYV",
 		.fourcc		= V4L2_PIX_FMT_YUYV,
 		.depth		= 16,
 		.twformat	= ColorFormatYUY2,
 	}, {
-		.name		= "4:2:2 packed, UYVY",
 		.fourcc		= V4L2_PIX_FMT_UYVY,
 		.depth		= 16,
 		.twformat	= ColorFormatYUY2 | ColorFormatBSWAP,
@@ -774,9 +764,6 @@ static int tw68_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (f->index >= FORMATS)
 		return -EINVAL;
 
-	strscpy(f->description, formats[f->index].name,
-		sizeof(f->description));
-
 	f->pixelformat = formats[f->index].fourcc;
 
 	return 0;
diff --git a/drivers/media/pci/tw68/tw68.h b/drivers/media/pci/tw68/tw68.h
index 7021290d726a..a1f422d6e600 100644
--- a/drivers/media/pci/tw68/tw68.h
+++ b/drivers/media/pci/tw68/tw68.h
@@ -85,7 +85,6 @@ struct tw68_tvnorm {
 };
 
 struct tw68_format {
-	char	*name;
 	u32	fourcc;
 	u32	depth;
 	u32	twformat;
diff --git a/include/media/drv-intf/saa7146_vv.h b/include/media/drv-intf/saa7146_vv.h
index b34d86bb0664..635805fb35e8 100644
--- a/include/media/drv-intf/saa7146_vv.h
+++ b/include/media/drv-intf/saa7146_vv.h
@@ -32,7 +32,6 @@ struct	saa7146_video_dma {
 #define FORMAT_IS_PLANAR	0x2
 
 struct saa7146_format {
-	char	*name;
 	u32	pixelformat;
 	u32	trans;
 	u8	depth;
-- 
2.20.1

