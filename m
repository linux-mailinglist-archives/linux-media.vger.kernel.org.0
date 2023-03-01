Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DBA6A6B93
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 12:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjCALTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 06:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjCALTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 06:19:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB351E5FA
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 03:18:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 588CBB80FF0
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AF1C433EF;
        Wed,  1 Mar 2023 11:18:53 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 2/9] saa7134: drop overlay support
Date:   Wed,  1 Mar 2023 12:18:43 +0100
Message-Id: <20230301111850.607515-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
References: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Destructive overlay support (i.e. where the video frame is DMA-ed
straight into a framebuffer) is effectively dead. It was a
necessary evil in the early days when computers were not fast enough
to copy SDTV video frames around, but today that's no longer a problem.

It requires access to the framebuffer memory, which is a bad idea and
very hard to do safely. In addition, in drm it is today almost
impossible to get hold of the framebuffer address.

So drop support for this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/saa7134/saa7134-cards.c |   1 -
 drivers/media/pci/saa7134/saa7134-core.c  |  32 --
 drivers/media/pci/saa7134/saa7134-video.c | 411 +---------------------
 drivers/media/pci/saa7134/saa7134.h       |  13 -
 4 files changed, 4 insertions(+), 453 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
index 99be59af3560..1280696f65f2 100644
--- a/drivers/media/pci/saa7134/saa7134-cards.c
+++ b/drivers/media/pci/saa7134/saa7134-cards.c
@@ -2116,7 +2116,6 @@ struct saa7134_board saa7134_boards[] = {
 		- Remote control doesn't initialize properly.
 		- Audio volume starts muted,
 		then gradually increases after channel change.
-		- Overlay scaling problems (application error?)
 		- Composite S-Video untested.
 		From: Konrad Rzepecki <hannibal@megapolis.pl>
 		*/
diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index cf2871306987..ea0585e43abb 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -51,10 +51,6 @@ static unsigned int latency = UNSET;
 module_param(latency, int, 0444);
 MODULE_PARM_DESC(latency,"pci latency timer");
 
-int saa7134_no_overlay=-1;
-module_param_named(no_overlay, saa7134_no_overlay, int, 0444);
-MODULE_PARM_DESC(no_overlay, "allow override overlay default (0 disables, 1 enables) [some VIA/SIS chipsets are known to have problem with overlay]");
-
 bool saa7134_userptr;
 module_param(saa7134_userptr, bool, 0644);
 MODULE_PARM_DESC(saa7134_userptr, "enable page-aligned userptr support");
@@ -400,13 +396,6 @@ int saa7134_set_dmabits(struct saa7134_dev *dev)
 			SAA7134_MAIN_CTRL_TE5;
 	}
 
-	/* screen overlay -- dma 0 + video task B */
-	if (dev->ovenable) {
-		task |= 0x10;
-		ctrl |= SAA7134_MAIN_CTRL_TE1;
-		ov = dev->ovfield;
-	}
-
 	/* vbi capture -- dma 0 + vbi task A+B */
 	if (dev->vbi_q.curr) {
 		task |= 0x22;
@@ -1066,18 +1055,6 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 			latency = 0x0A;
 		}
 #endif
-		if (pci_pci_problems & (PCIPCI_FAIL|PCIAGP_FAIL)) {
-			pr_info("%s: quirk: this driver and your chipset may not work together in overlay mode.\n",
-				dev->name);
-			if (!saa7134_no_overlay) {
-				pr_info("%s: quirk: overlay mode will be disabled.\n",
-						dev->name);
-				saa7134_no_overlay = 1;
-			} else {
-				pr_info("%s: quirk: overlay mode will be forced. Use this option at your own risk.\n",
-						dev->name);
-			}
-		}
 	}
 	if (UNSET != latency) {
 		pr_info("%s: setting pci latency timer to %d\n",
@@ -1198,9 +1175,6 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 		saa_call_all(dev, core, s_power, 0);
 
 	/* register v4l devices */
-	if (saa7134_no_overlay > 0)
-		pr_info("%s: Overlay support disabled.\n", dev->name);
-
 	dev->video_dev = vdev_init(dev,&saa7134_video_template,"video");
 	dev->video_dev->ctrl_handler = &dev->ctrl_handler;
 	dev->video_dev->lock = &dev->lock;
@@ -1210,9 +1184,6 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	if (dev->tuner_type != TUNER_ABSENT && dev->tuner_type != UNSET)
 		dev->video_dev->device_caps |= V4L2_CAP_TUNER;
 
-	if (saa7134_no_overlay <= 0)
-		dev->video_dev->device_caps |= V4L2_CAP_VIDEO_OVERLAY;
-
 	err = video_register_device(dev->video_dev,VFL_TYPE_VIDEO,
 				    video_nr[dev->nr]);
 	if (err < 0) {
@@ -1403,9 +1374,6 @@ static int __maybe_unused saa7134_suspend(struct device *dev_d)
 	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
 	struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
 
-	/* disable overlay - apps should enable it explicitly on resume*/
-	dev->ovenable = 0;
-
 	/* Disable interrupts, DMA, and rest of the chip*/
 	saa_writel(SAA7134_IRQ1, 0);
 	saa_writel(SAA7134_IRQ2, 0);
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 4d8974c9fcc9..c5e68f33640f 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -571,193 +571,6 @@ static void set_size(struct saa7134_dev *dev, int task,
 
 /* ------------------------------------------------------------------ */
 
-struct cliplist {
-	__u16 position;
-	__u8  enable;
-	__u8  disable;
-};
-
-static void set_cliplist(struct saa7134_dev *dev, int reg,
-			struct cliplist *cl, int entries, char *name)
-{
-	__u8 winbits = 0;
-	int i;
-
-	for (i = 0; i < entries; i++) {
-		winbits |= cl[i].enable;
-		winbits &= ~cl[i].disable;
-		if (i < 15 && cl[i].position == cl[i+1].position)
-			continue;
-		saa_writeb(reg + 0, winbits);
-		saa_writeb(reg + 2, cl[i].position & 0xff);
-		saa_writeb(reg + 3, cl[i].position >> 8);
-		video_dbg("clip: %s winbits=%02x pos=%d\n",
-			name,winbits,cl[i].position);
-		reg += 8;
-	}
-	for (; reg < 0x400; reg += 8) {
-		saa_writeb(reg+ 0, 0);
-		saa_writeb(reg + 1, 0);
-		saa_writeb(reg + 2, 0);
-		saa_writeb(reg + 3, 0);
-	}
-}
-
-static int clip_range(int val)
-{
-	if (val < 0)
-		val = 0;
-	return val;
-}
-
-/* Sort into smallest position first order */
-static int cliplist_cmp(const void *a, const void *b)
-{
-	const struct cliplist *cla = a;
-	const struct cliplist *clb = b;
-	if (cla->position < clb->position)
-		return -1;
-	if (cla->position > clb->position)
-		return 1;
-	return 0;
-}
-
-static int setup_clipping(struct saa7134_dev *dev, struct v4l2_clip *clips,
-			  int nclips, int interlace)
-{
-	struct cliplist col[16], row[16];
-	int cols = 0, rows = 0, i;
-	int div = interlace ? 2 : 1;
-
-	memset(col, 0, sizeof(col));
-	memset(row, 0, sizeof(row));
-	for (i = 0; i < nclips && i < 8; i++) {
-		col[cols].position = clip_range(clips[i].c.left);
-		col[cols].enable   = (1 << i);
-		cols++;
-		col[cols].position = clip_range(clips[i].c.left+clips[i].c.width);
-		col[cols].disable  = (1 << i);
-		cols++;
-		row[rows].position = clip_range(clips[i].c.top / div);
-		row[rows].enable   = (1 << i);
-		rows++;
-		row[rows].position = clip_range((clips[i].c.top + clips[i].c.height)
-						/ div);
-		row[rows].disable  = (1 << i);
-		rows++;
-	}
-	sort(col, cols, sizeof col[0], cliplist_cmp, NULL);
-	sort(row, rows, sizeof row[0], cliplist_cmp, NULL);
-	set_cliplist(dev,0x380,col,cols,"cols");
-	set_cliplist(dev,0x384,row,rows,"rows");
-	return 0;
-}
-
-static int verify_preview(struct saa7134_dev *dev, struct v4l2_window *win, bool try)
-{
-	enum v4l2_field field;
-	int maxw, maxh;
-
-	if (!try && (dev->ovbuf.base == NULL || dev->ovfmt == NULL))
-		return -EINVAL;
-	if (win->w.width < 48)
-		win->w.width = 48;
-	if (win->w.height < 32)
-		win->w.height = 32;
-	if (win->clipcount > 8)
-		win->clipcount = 8;
-
-	win->chromakey = 0;
-	win->global_alpha = 0;
-	field = win->field;
-	maxw  = dev->crop_current.width;
-	maxh  = dev->crop_current.height;
-
-	if (V4L2_FIELD_ANY == field) {
-		field = (win->w.height > maxh/2)
-			? V4L2_FIELD_INTERLACED
-			: V4L2_FIELD_TOP;
-	}
-	switch (field) {
-	case V4L2_FIELD_TOP:
-	case V4L2_FIELD_BOTTOM:
-		maxh = maxh / 2;
-		break;
-	default:
-		field = V4L2_FIELD_INTERLACED;
-		break;
-	}
-
-	win->field = field;
-	if (win->w.width > maxw)
-		win->w.width = maxw;
-	if (win->w.height > maxh)
-		win->w.height = maxh;
-	return 0;
-}
-
-static int start_preview(struct saa7134_dev *dev)
-{
-	unsigned long base,control,bpl;
-	int err;
-
-	err = verify_preview(dev, &dev->win, false);
-	if (0 != err)
-		return err;
-
-	dev->ovfield = dev->win.field;
-	video_dbg("%s %dx%d+%d+%d 0x%08x field=%s\n", __func__,
-		  dev->win.w.width, dev->win.w.height,
-		  dev->win.w.left, dev->win.w.top,
-		  dev->ovfmt->fourcc, v4l2_field_names[dev->ovfield]);
-
-	/* setup window + clipping */
-	set_size(dev, TASK_B, dev->win.w.width, dev->win.w.height,
-		 V4L2_FIELD_HAS_BOTH(dev->ovfield));
-	setup_clipping(dev, dev->clips, dev->nclips,
-		       V4L2_FIELD_HAS_BOTH(dev->ovfield));
-	if (dev->ovfmt->yuv)
-		saa_andorb(SAA7134_DATA_PATH(TASK_B), 0x3f, 0x03);
-	else
-		saa_andorb(SAA7134_DATA_PATH(TASK_B), 0x3f, 0x01);
-	saa_writeb(SAA7134_OFMT_VIDEO_B, dev->ovfmt->pm | 0x20);
-
-	/* dma: setup channel 1 (= Video Task B) */
-	base  = (unsigned long)dev->ovbuf.base;
-	base += dev->ovbuf.fmt.bytesperline * dev->win.w.top;
-	base += dev->ovfmt->depth/8         * dev->win.w.left;
-	bpl   = dev->ovbuf.fmt.bytesperline;
-	control = SAA7134_RS_CONTROL_BURST_16;
-	if (dev->ovfmt->bswap)
-		control |= SAA7134_RS_CONTROL_BSWAP;
-	if (dev->ovfmt->wswap)
-		control |= SAA7134_RS_CONTROL_WSWAP;
-	if (V4L2_FIELD_HAS_BOTH(dev->ovfield)) {
-		saa_writel(SAA7134_RS_BA1(1),base);
-		saa_writel(SAA7134_RS_BA2(1),base+bpl);
-		saa_writel(SAA7134_RS_PITCH(1),bpl*2);
-		saa_writel(SAA7134_RS_CONTROL(1),control);
-	} else {
-		saa_writel(SAA7134_RS_BA1(1),base);
-		saa_writel(SAA7134_RS_BA2(1),base);
-		saa_writel(SAA7134_RS_PITCH(1),bpl);
-		saa_writel(SAA7134_RS_CONTROL(1),control);
-	}
-
-	/* start dma */
-	dev->ovenable = 1;
-	saa7134_set_dmabits(dev);
-
-	return 0;
-}
-
-static int stop_preview(struct saa7134_dev *dev)
-{
-	dev->ovenable = 0;
-	saa7134_set_dmabits(dev);
-	return 0;
-}
-
 /*
  * Media Controller helper functions
  */
@@ -1042,8 +855,6 @@ static const struct vb2_ops vb2_qops = {
 static int saa7134_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct saa7134_dev *dev = container_of(ctrl->handler, struct saa7134_dev, ctrl_handler);
-	unsigned long flags;
-	int restart_overlay = 0;
 
 	switch (ctrl->id) {
 	case V4L2_CID_BRIGHTNESS:
@@ -1081,15 +892,12 @@ static int saa7134_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_HFLIP:
 		dev->ctl_mirror = ctrl->val;
-		restart_overlay = 1;
 		break;
 	case V4L2_CID_PRIVATE_Y_EVEN:
 		dev->ctl_y_even = ctrl->val;
-		restart_overlay = 1;
 		break;
 	case V4L2_CID_PRIVATE_Y_ODD:
 		dev->ctl_y_odd = ctrl->val;
-		restart_overlay = 1;
 		break;
 	case V4L2_CID_PRIVATE_AUTOMUTE:
 	{
@@ -1112,12 +920,6 @@ static int saa7134_s_ctrl(struct v4l2_ctrl *ctrl)
 	default:
 		return -EINVAL;
 	}
-	if (restart_overlay && dev->overlay_owner) {
-		spin_lock_irqsave(&dev->slock, flags);
-		stop_preview(dev);
-		start_preview(dev);
-		spin_unlock_irqrestore(&dev->slock, flags);
-	}
 	return 0;
 }
 
@@ -1150,21 +952,11 @@ static int video_release(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct saa7134_dev *dev = video_drvdata(file);
-	struct v4l2_fh *fh = file->private_data;
 	struct saa6588_command cmd;
-	unsigned long flags;
 
 	mutex_lock(&dev->lock);
 	saa7134_tvaudio_close(dev);
 
-	/* turn off overlay */
-	if (fh == dev->overlay_owner) {
-		spin_lock_irqsave(&dev->slock,flags);
-		stop_preview(dev);
-		spin_unlock_irqrestore(&dev->slock,flags);
-		dev->overlay_owner = NULL;
-	}
-
 	if (vdev->vfl_type == VFL_TYPE_RADIO)
 		v4l2_fh_release(file);
 	else
@@ -1261,34 +1053,6 @@ static int saa7134_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int saa7134_g_fmt_vid_overlay(struct file *file, void *priv,
-				struct v4l2_format *f)
-{
-	struct saa7134_dev *dev = video_drvdata(file);
-	u32 clipcount = f->fmt.win.clipcount;
-	int i;
-
-	if (saa7134_no_overlay > 0) {
-		pr_err("V4L2_BUF_TYPE_VIDEO_OVERLAY: no_overlay\n");
-		return -EINVAL;
-	}
-	f->fmt.win = dev->win;
-	if (!f->fmt.win.clips) {
-		f->fmt.win.clipcount = 0;
-		return 0;
-	}
-	if (dev->nclips < clipcount)
-		clipcount = dev->nclips;
-	f->fmt.win.clipcount = clipcount;
-
-	for (i = 0; i < clipcount; i++) {
-		memcpy(&f->fmt.win.clips[i].c, &dev->clips[i].c,
-		       sizeof(struct v4l2_rect));
-	}
-
-	return 0;
-}
-
 static int saa7134_try_fmt_vid_cap(struct file *file, void *priv,
 						struct v4l2_format *f)
 {
@@ -1342,21 +1106,6 @@ static int saa7134_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int saa7134_try_fmt_vid_overlay(struct file *file, void *priv,
-						struct v4l2_format *f)
-{
-	struct saa7134_dev *dev = video_drvdata(file);
-
-	if (saa7134_no_overlay > 0) {
-		pr_err("V4L2_BUF_TYPE_VIDEO_OVERLAY: no_overlay\n");
-		return -EINVAL;
-	}
-
-	if (f->fmt.win.clips == NULL)
-		f->fmt.win.clipcount = 0;
-	return verify_preview(dev, &f->fmt.win, true);
-}
-
 static int saa7134_s_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_format *f)
 {
@@ -1374,39 +1123,6 @@ static int saa7134_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int saa7134_s_fmt_vid_overlay(struct file *file, void *priv,
-					struct v4l2_format *f)
-{
-	struct saa7134_dev *dev = video_drvdata(file);
-	int err;
-	unsigned long flags;
-
-	if (saa7134_no_overlay > 0) {
-		pr_err("V4L2_BUF_TYPE_VIDEO_OVERLAY: no_overlay\n");
-		return -EINVAL;
-	}
-	if (f->fmt.win.clips == NULL)
-		f->fmt.win.clipcount = 0;
-	err = verify_preview(dev, &f->fmt.win, true);
-	if (0 != err)
-		return err;
-
-	dev->win    = f->fmt.win;
-	dev->nclips = f->fmt.win.clipcount;
-
-	memcpy(dev->clips, f->fmt.win.clips,
-	       sizeof(struct v4l2_clip) * dev->nclips);
-
-	if (priv == dev->overlay_owner) {
-		spin_lock_irqsave(&dev->slock, flags);
-		stop_preview(dev);
-		start_preview(dev);
-		spin_unlock_irqrestore(&dev->slock, flags);
-	}
-
-	return 0;
-}
-
 int saa7134_enum_input(struct file *file, void *priv, struct v4l2_input *i)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
@@ -1482,8 +1198,6 @@ int saa7134_querycap(struct file *file, void *priv,
 		cap->capabilities |= V4L2_CAP_TUNER;
 	if (dev->has_rds)
 		cap->capabilities |= V4L2_CAP_RDS_CAPTURE;
-	if (saa7134_no_overlay <= 0)
-		cap->capabilities |= V4L2_CAP_VIDEO_OVERLAY;
 
 	return 0;
 }
@@ -1492,17 +1206,9 @@ EXPORT_SYMBOL_GPL(saa7134_querycap);
 int saa7134_s_std(struct file *file, void *priv, v4l2_std_id id)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
-	struct v4l2_fh *fh = priv;
-	unsigned long flags;
 	unsigned int i;
 	v4l2_std_id fixup;
 
-	if (is_empress(file) && dev->overlay_owner) {
-		/* Don't change the std from the mpeg device
-		   if overlay is active. */
-		return -EBUSY;
-	}
-
 	for (i = 0; i < TVNORMS; i++)
 		if (id == tvnorms[i].id)
 			break;
@@ -1534,18 +1240,7 @@ int saa7134_s_std(struct file *file, void *priv, v4l2_std_id id)
 			return -EINVAL;
 	}
 
-	if (!is_empress(file) && fh == dev->overlay_owner) {
-		spin_lock_irqsave(&dev->slock, flags);
-		stop_preview(dev);
-		spin_unlock_irqrestore(&dev->slock, flags);
-
-		set_tvnorm(dev, &tvnorms[i]);
-
-		spin_lock_irqsave(&dev->slock, flags);
-		start_preview(dev);
-		spin_unlock_irqrestore(&dev->slock, flags);
-	} else
-		set_tvnorm(dev, &tvnorms[i]);
+	set_tvnorm(dev, &tvnorms[i]);
 
 	saa7134_tvaudio_do_scan(dev);
 	return 0;
@@ -1595,8 +1290,7 @@ static int saa7134_g_pixelaspect(struct file *file, void *priv,
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
-	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
-	    type != V4L2_BUF_TYPE_VIDEO_OVERLAY)
+	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
 	if (dev->tvnorm->id & V4L2_STD_525_60) {
@@ -1614,8 +1308,7 @@ static int saa7134_g_selection(struct file *file, void *f, struct v4l2_selection
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
-	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
-	    sel->type != V4L2_BUF_TYPE_VIDEO_OVERLAY)
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
 	switch (sel->target) {
@@ -1640,15 +1333,12 @@ static int saa7134_s_selection(struct file *file, void *f, struct v4l2_selection
 	struct v4l2_rect *b = &dev->crop_bounds;
 	struct v4l2_rect *c = &dev->crop_current;
 
-	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
-	    sel->type != V4L2_BUF_TYPE_VIDEO_OVERLAY)
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	if (dev->overlay_owner)
-		return -EBUSY;
 	if (vb2_is_streaming(&dev->video_vbq))
 		return -EBUSY;
 
@@ -1764,85 +1454,6 @@ static int saa7134_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int saa7134_enum_fmt_vid_overlay(struct file *file, void  *priv,
-					struct v4l2_fmtdesc *f)
-{
-	if (saa7134_no_overlay > 0) {
-		pr_err("V4L2_BUF_TYPE_VIDEO_OVERLAY: no_overlay\n");
-		return -EINVAL;
-	}
-
-	if ((f->index >= FORMATS) || formats[f->index].planar)
-		return -EINVAL;
-
-	f->pixelformat = formats[f->index].fourcc;
-
-	return 0;
-}
-
-static int saa7134_g_fbuf(struct file *file, void *f,
-				struct v4l2_framebuffer *fb)
-{
-	struct saa7134_dev *dev = video_drvdata(file);
-
-	*fb = dev->ovbuf;
-	fb->capability = V4L2_FBUF_CAP_LIST_CLIPPING;
-
-	return 0;
-}
-
-static int saa7134_s_fbuf(struct file *file, void *f,
-					const struct v4l2_framebuffer *fb)
-{
-	struct saa7134_dev *dev = video_drvdata(file);
-	struct saa7134_format *fmt;
-
-	if (!capable(CAP_SYS_ADMIN) &&
-	   !capable(CAP_SYS_RAWIO))
-		return -EPERM;
-
-	/* check args */
-	fmt = format_by_fourcc(fb->fmt.pixelformat);
-	if (NULL == fmt)
-		return -EINVAL;
-
-	/* ok, accept it */
-	dev->ovbuf = *fb;
-	dev->ovfmt = fmt;
-	if (0 == dev->ovbuf.fmt.bytesperline)
-		dev->ovbuf.fmt.bytesperline =
-			dev->ovbuf.fmt.width*fmt->depth/8;
-	return 0;
-}
-
-static int saa7134_overlay(struct file *file, void *priv, unsigned int on)
-{
-	struct saa7134_dev *dev = video_drvdata(file);
-	unsigned long flags;
-
-	if (on) {
-		if (saa7134_no_overlay > 0) {
-			video_dbg("no_overlay\n");
-			return -EINVAL;
-		}
-
-		if (dev->overlay_owner && priv != dev->overlay_owner)
-			return -EBUSY;
-		dev->overlay_owner = priv;
-		spin_lock_irqsave(&dev->slock, flags);
-		start_preview(dev);
-		spin_unlock_irqrestore(&dev->slock, flags);
-	} else {
-		if (priv != dev->overlay_owner)
-			return -EINVAL;
-		spin_lock_irqsave(&dev->slock, flags);
-		stop_preview(dev);
-		spin_unlock_irqrestore(&dev->slock, flags);
-		dev->overlay_owner = NULL;
-	}
-	return 0;
-}
-
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 static int vidioc_g_register (struct file *file, void *priv,
 			      struct v4l2_dbg_register *reg)
@@ -1912,10 +1523,6 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap		= saa7134_g_fmt_vid_cap,
 	.vidioc_try_fmt_vid_cap		= saa7134_try_fmt_vid_cap,
 	.vidioc_s_fmt_vid_cap		= saa7134_s_fmt_vid_cap,
-	.vidioc_enum_fmt_vid_overlay	= saa7134_enum_fmt_vid_overlay,
-	.vidioc_g_fmt_vid_overlay	= saa7134_g_fmt_vid_overlay,
-	.vidioc_try_fmt_vid_overlay	= saa7134_try_fmt_vid_overlay,
-	.vidioc_s_fmt_vid_overlay	= saa7134_s_fmt_vid_overlay,
 	.vidioc_g_fmt_vbi_cap		= saa7134_try_get_set_fmt_vbi_cap,
 	.vidioc_try_fmt_vbi_cap		= saa7134_try_get_set_fmt_vbi_cap,
 	.vidioc_s_fmt_vbi_cap		= saa7134_try_get_set_fmt_vbi_cap,
@@ -1937,9 +1544,6 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
 	.vidioc_s_tuner			= saa7134_s_tuner,
 	.vidioc_g_selection		= saa7134_g_selection,
 	.vidioc_s_selection		= saa7134_s_selection,
-	.vidioc_g_fbuf			= saa7134_g_fbuf,
-	.vidioc_s_fbuf			= saa7134_s_fbuf,
-	.vidioc_overlay			= saa7134_overlay,
 	.vidioc_g_frequency		= saa7134_g_frequency,
 	.vidioc_s_frequency		= saa7134_s_frequency,
 #ifdef CONFIG_VIDEO_ADV_DEBUG
@@ -2086,13 +1690,6 @@ int saa7134_video_init1(struct saa7134_dev *dev)
 	dev->width    = 720;
 	dev->height   = 576;
 	dev->field = V4L2_FIELD_INTERLACED;
-	dev->win.w.width = dev->width;
-	dev->win.w.height = dev->height;
-	dev->win.field = V4L2_FIELD_INTERLACED;
-	dev->ovbuf.fmt.width = dev->width;
-	dev->ovbuf.fmt.height = dev->height;
-	dev->ovbuf.fmt.pixelformat = dev->fmt->fourcc;
-	dev->ovbuf.fmt.colorspace = V4L2_COLORSPACE_SMPTE170M;
 
 	if (saa7134_boards[dev->board].video_out)
 		saa7134_videoport_init(dev);
diff --git a/drivers/media/pci/saa7134/saa7134.h b/drivers/media/pci/saa7134/saa7134.h
index 5c9b2912a9d1..9f27e3775c27 100644
--- a/drivers/media/pci/saa7134/saa7134.h
+++ b/drivers/media/pci/saa7134/saa7134.h
@@ -429,7 +429,6 @@ struct saa7134_board {
 /* ----------------------------------------------------------- */
 /* device / file handle status                                 */
 
-#define RESOURCE_OVERLAY       1
 #define RESOURCE_VIDEO         2
 #define RESOURCE_VBI           4
 #define RESOURCE_EMPRESS       8
@@ -589,17 +588,6 @@ struct saa7134_dev {
 	unsigned char              eedata[256];
 	int			   has_rds;
 
-	/* video overlay */
-	struct v4l2_framebuffer    ovbuf;
-	struct saa7134_format      *ovfmt;
-	unsigned int               ovenable;
-	enum v4l2_field            ovfield;
-	struct v4l2_window         win;
-	struct v4l2_clip           clips[8];
-	unsigned int               nclips;
-	struct v4l2_fh		   *overlay_owner;
-
-
 	/* video+ts+vbi capture */
 	struct saa7134_dmaqueue    video_q;
 	struct vb2_queue           video_vbq;
@@ -745,7 +733,6 @@ static inline bool is_empress(struct file *file)
 
 extern struct list_head  saa7134_devlist;
 extern struct mutex saa7134_devlist_lock;
-extern int saa7134_no_overlay;
 extern bool saa7134_userptr;
 
 void saa7134_track_gpio(struct saa7134_dev *dev, const char *msg);
-- 
2.39.1

