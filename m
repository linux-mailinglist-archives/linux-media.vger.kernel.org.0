Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FED6A6B97
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 12:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjCALTF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 06:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjCALTD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 06:19:03 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDB21A48A
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 03:18:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id BBD92CE0FB6
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F02AC4339C;
        Wed,  1 Mar 2023 11:18:55 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 3/9] bttv: drop overlay support
Date:   Wed,  1 Mar 2023 12:18:44 +0100
Message-Id: <20230301111850.607515-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
References: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/media/pci/bt8xx/Kconfig       |   2 +-
 drivers/media/pci/bt8xx/btcx-risc.c   | 153 ---------
 drivers/media/pci/bt8xx/bttv-cards.c  |  15 -
 drivers/media/pci/bt8xx/bttv-driver.c | 436 +-------------------------
 drivers/media/pci/bt8xx/bttv-risc.c   | 131 --------
 drivers/media/pci/bt8xx/bttvp.h       |  28 +-
 6 files changed, 11 insertions(+), 754 deletions(-)

diff --git a/drivers/media/pci/bt8xx/Kconfig b/drivers/media/pci/bt8xx/Kconfig
index 927190281bd5..2d674dc28cec 100644
--- a/drivers/media/pci/bt8xx/Kconfig
+++ b/drivers/media/pci/bt8xx/Kconfig
@@ -15,7 +15,7 @@ config VIDEO_BT848
 	select RADIO_ADAPTERS
 	select RADIO_TEA575X
 	help
-	  Support for BT848 based frame grabber/overlay boards. This includes
+	  Support for BT848 based frame grabber boards. This includes
 	  the Miro, Hauppauge and STB boards. Please read the material in
 	  <file:Documentation/admin-guide/media/bttv.rst> for more information.
 
diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
index b3179038b900..0adbf8233e1a 100644
--- a/drivers/media/pci/bt8xx/btcx-risc.c
+++ b/drivers/media/pci/bt8xx/btcx-risc.c
@@ -75,156 +75,3 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
 	}
 	return 0;
 }
-
-/* ---------------------------------------------------------- */
-/* screen overlay helpers                                     */
-
-int
-btcx_screen_clips(int swidth, int sheight, struct v4l2_rect *win,
-		  struct v4l2_clip *clips, unsigned int n)
-{
-	if (win->left < 0) {
-		/* left */
-		clips[n].c.left = 0;
-		clips[n].c.top = 0;
-		clips[n].c.width  = -win->left;
-		clips[n].c.height = win->height;
-		n++;
-	}
-	if (win->left + win->width > swidth) {
-		/* right */
-		clips[n].c.left   = swidth - win->left;
-		clips[n].c.top    = 0;
-		clips[n].c.width  = win->width - clips[n].c.left;
-		clips[n].c.height = win->height;
-		n++;
-	}
-	if (win->top < 0) {
-		/* top */
-		clips[n].c.left = 0;
-		clips[n].c.top = 0;
-		clips[n].c.width  = win->width;
-		clips[n].c.height = -win->top;
-		n++;
-	}
-	if (win->top + win->height > sheight) {
-		/* bottom */
-		clips[n].c.left = 0;
-		clips[n].c.top = sheight - win->top;
-		clips[n].c.width  = win->width;
-		clips[n].c.height = win->height - clips[n].c.top;
-		n++;
-	}
-	return n;
-}
-
-int
-btcx_align(struct v4l2_rect *win, struct v4l2_clip *clips, unsigned int n, int mask)
-{
-	s32 nx,nw,dx;
-	unsigned int i;
-
-	/* fixup window */
-	nx = (win->left + mask) & ~mask;
-	nw = (win->width) & ~mask;
-	if (nx + nw > win->left + win->width)
-		nw -= mask+1;
-	dx = nx - win->left;
-	win->left  = nx;
-	win->width = nw;
-	dprintk("btcx: window align %dx%d+%d+%d [dx=%d]\n",
-	       win->width, win->height, win->left, win->top, dx);
-
-	/* fixup clips */
-	for (i = 0; i < n; i++) {
-		nx = (clips[i].c.left-dx) & ~mask;
-		nw = (clips[i].c.width) & ~mask;
-		if (nx + nw < clips[i].c.left-dx + clips[i].c.width)
-			nw += mask+1;
-		clips[i].c.left  = nx;
-		clips[i].c.width = nw;
-		dprintk("btcx:   clip align %dx%d+%d+%d\n",
-		       clips[i].c.width, clips[i].c.height,
-		       clips[i].c.left, clips[i].c.top);
-	}
-	return 0;
-}
-
-void
-btcx_sort_clips(struct v4l2_clip *clips, unsigned int nclips)
-{
-	int i,j,n;
-
-	if (nclips < 2)
-		return;
-	for (i = nclips-2; i >= 0; i--) {
-		for (n = 0, j = 0; j <= i; j++) {
-			if (clips[j].c.left > clips[j+1].c.left) {
-				swap(clips[j], clips[j + 1]);
-				n++;
-			}
-		}
-		if (0 == n)
-			break;
-	}
-}
-
-void
-btcx_calc_skips(int line, int width, int *maxy,
-		struct btcx_skiplist *skips, unsigned int *nskips,
-		const struct v4l2_clip *clips, unsigned int nclips)
-{
-	unsigned int clip,skip;
-	int end, maxline;
-
-	skip=0;
-	maxline = 9999;
-	for (clip = 0; clip < nclips; clip++) {
-
-		/* sanity checks */
-		if (clips[clip].c.left + clips[clip].c.width <= 0)
-			continue;
-		if (clips[clip].c.left > (signed)width)
-			break;
-
-		/* vertical range */
-		if (line > clips[clip].c.top+clips[clip].c.height-1)
-			continue;
-		if (line < clips[clip].c.top) {
-			if (maxline > clips[clip].c.top-1)
-				maxline = clips[clip].c.top-1;
-			continue;
-		}
-		if (maxline > clips[clip].c.top+clips[clip].c.height-1)
-			maxline = clips[clip].c.top+clips[clip].c.height-1;
-
-		/* horizontal range */
-		if (0 == skip || clips[clip].c.left > skips[skip-1].end) {
-			/* new one */
-			skips[skip].start = clips[clip].c.left;
-			if (skips[skip].start < 0)
-				skips[skip].start = 0;
-			skips[skip].end = clips[clip].c.left + clips[clip].c.width;
-			if (skips[skip].end > width)
-				skips[skip].end = width;
-			skip++;
-		} else {
-			/* overlaps -- expand last one */
-			end = clips[clip].c.left + clips[clip].c.width;
-			if (skips[skip-1].end < end)
-				skips[skip-1].end = end;
-			if (skips[skip-1].end > width)
-				skips[skip-1].end = width;
-		}
-	}
-	*nskips = skip;
-	*maxy = maxline;
-
-	if (btcx_debug) {
-		dprintk("btcx: skips line %d-%d:", line, maxline);
-		for (skip = 0; skip < *nskips; skip++) {
-			pr_cont(" %d-%d", skips[skip].start, skips[skip].end);
-		}
-		pr_cont("\n");
-	}
-}
diff --git a/drivers/media/pci/bt8xx/bttv-cards.c b/drivers/media/pci/bt8xx/bttv-cards.c
index c2b5ab287dd7..ec78f7fc5e1b 100644
--- a/drivers/media/pci/bt8xx/bttv-cards.c
+++ b/drivers/media/pci/bt8xx/bttv-cards.c
@@ -81,7 +81,6 @@ static int pvr_boot(struct bttv *btv);
 static unsigned int triton1;
 static unsigned int vsfx;
 static unsigned int latency = UNSET;
-int no_overlay=-1;
 
 static unsigned int card[BTTV_MAX]   = { [ 0 ... (BTTV_MAX-1) ] = UNSET };
 static unsigned int pll[BTTV_MAX]    = { [ 0 ... (BTTV_MAX-1) ] = UNSET };
@@ -99,7 +98,6 @@ static unsigned int audiomux[5] = { [ 0 ... 4 ] = UNSET };
 /* insmod options */
 module_param(triton1,    int, 0444);
 module_param(vsfx,       int, 0444);
-module_param(no_overlay, int, 0444);
 module_param(latency,    int, 0444);
 module_param(gpiomask,   int, 0444);
 module_param(audioall,   int, 0444);
@@ -127,7 +125,6 @@ MODULE_PARM_DESC(audiodev, "specify audio device:\n"
 		"\t\t 2 = tda7432\n"
 		"\t\t 3 = tvaudio");
 MODULE_PARM_DESC(saa6588, "if 1, then load the saa6588 RDS module, default (0) is to use the card definition.");
-MODULE_PARM_DESC(no_overlay, "allow override overlay default (0 disables, 1 enables) [some VIA/SIS chipsets are known to have problem with overlay]");
 
 
 /* I2C addresses list */
@@ -4869,11 +4866,8 @@ static void gv800s_init(struct bttv *btv)
 
 void __init bttv_check_chipset(void)
 {
-	int pcipci_fail = 0;
 	struct pci_dev *dev = NULL;
 
-	if (pci_pci_problems & (PCIPCI_FAIL|PCIAGP_FAIL))	/* should check if target is AGP */
-		pcipci_fail = 1;
 	if (pci_pci_problems & (PCIPCI_TRITON|PCIPCI_NATOMA|PCIPCI_VIAETBF))
 		triton1 = 1;
 	if (pci_pci_problems & PCIPCI_VSFX)
@@ -4889,15 +4883,6 @@ void __init bttv_check_chipset(void)
 		pr_info("Host bridge needs ETBF enabled\n");
 	if (vsfx)
 		pr_info("Host bridge needs VSFX enabled\n");
-	if (pcipci_fail) {
-		pr_info("bttv and your chipset may not work together\n");
-		if (!no_overlay) {
-			pr_info("overlay will be disabled\n");
-			no_overlay = 1;
-		} else {
-			pr_info("overlay forced. Use this option at your own risk.\n");
-		}
-	}
 	if (UNSET != latency)
 		pr_info("pci latency fixup [%d]\n", latency);
 	while ((dev = pci_get_device(PCI_VENDOR_ID_INTEL,
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index d40b537f4e98..d9aed8111d59 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -624,20 +624,14 @@ static const unsigned int FORMATS = ARRAY_SIZE(formats);
 		 VIDIOC_QBUF 1)              bttv_release
 		 VIDIOCMCAPTURE 1)
 
-   OVERLAY	 VIDIOCCAPTURE on            VIDIOCCAPTURE off
-		 VIDIOC_OVERLAY on           VIDIOC_OVERLAY off
-		 3)                          bttv_release
-
    VBI		 VIDIOC_STREAMON             VIDIOC_STREAMOFF
 		 VIDIOC_QBUF 1)              bttv_release
-		 bttv_read, bttv_poll 1) 4)
+		 bttv_read, bttv_poll 1) 3)
 
    1) The resource must be allocated when we enter buffer prepare functions
       and remain allocated while buffers are in the DMA queue.
    2) This is a single frame read.
-   3) VIDIOC_S_FBUF and VIDIOC_S_FMT (OVERLAY) still work when
-      RESOURCE_OVERLAY is allocated.
-   4) This is a continuous read, implies VIDIOC_STREAMON.
+   3) This is a continuous read, implies VIDIOC_STREAMON.
 
    Note this driver permits video input and standard changes regardless if
    resources are allocated.
@@ -645,8 +639,7 @@ static const unsigned int FORMATS = ARRAY_SIZE(formats);
 
 #define VBI_RESOURCES (RESOURCE_VBI)
 #define VIDEO_RESOURCES (RESOURCE_VIDEO_READ | \
-			 RESOURCE_VIDEO_STREAM | \
-			 RESOURCE_OVERLAY)
+			 RESOURCE_VIDEO_STREAM)
 
 static
 int check_alloc_btres_lock(struct bttv *btv, struct bttv_fh *fh, int bit)
@@ -1491,37 +1484,6 @@ format_by_fourcc(int fourcc)
 	return NULL;
 }
 
-/* ----------------------------------------------------------------------- */
-/* misc helpers                                                            */
-
-static int
-bttv_switch_overlay(struct bttv *btv, struct bttv_fh *fh,
-		    struct bttv_buffer *new)
-{
-	struct bttv_buffer *old;
-	unsigned long flags;
-
-	dprintk("switch_overlay: enter [new=%p]\n", new);
-	if (new)
-		new->vb.state = VIDEOBUF_DONE;
-	spin_lock_irqsave(&btv->s_lock,flags);
-	old = btv->screen;
-	btv->screen = new;
-	btv->loop_irq |= 1;
-	bttv_set_dma(btv, 0x03);
-	spin_unlock_irqrestore(&btv->s_lock,flags);
-	if (NULL != old) {
-		dprintk("switch_overlay: old=%p state is %d\n",
-			old, old->vb.state);
-		bttv_dma_free(&fh->cap,btv, old);
-		kfree(old);
-	}
-	if (NULL == new)
-		free_btres_lock(btv,fh,RESOURCE_OVERLAY);
-	dprintk("switch_overlay: done\n");
-	return 0;
-}
-
 /* ----------------------------------------------------------------------- */
 /* video4linux (1) interface                                               */
 
@@ -2045,150 +2007,6 @@ limit_scaled_size_lock       (struct bttv_fh *               fh,
 	return rc;
 }
 
-/* Returns an error if the given overlay window dimensions are not
-   possible with the current cropping parameters. If adjust_size is
-   TRUE the function may adjust the window width and/or height
-   instead, however it always rounds the horizontal position and
-   width as btcx_align() does. If adjust_crop is TRUE the function
-   may also adjust the current cropping parameters to get closer
-   to the desired window size. */
-static int
-verify_window_lock(struct bttv_fh *fh, struct v4l2_window *win,
-			 int adjust_size, int adjust_crop)
-{
-	enum v4l2_field field;
-	unsigned int width_mask;
-
-	if (win->w.width < 48)
-		win->w.width = 48;
-	if (win->w.height < 32)
-		win->w.height = 32;
-	if (win->clipcount > 2048)
-		win->clipcount = 2048;
-
-	win->chromakey = 0;
-	win->global_alpha = 0;
-	field = win->field;
-
-	switch (field) {
-	case V4L2_FIELD_TOP:
-	case V4L2_FIELD_BOTTOM:
-	case V4L2_FIELD_INTERLACED:
-		break;
-	default:
-		field = V4L2_FIELD_ANY;
-		break;
-	}
-	if (V4L2_FIELD_ANY == field) {
-		__s32 height2;
-
-		height2 = fh->btv->crop[!!fh->do_crop].rect.height >> 1;
-		field = (win->w.height > height2)
-			? V4L2_FIELD_INTERLACED
-			: V4L2_FIELD_TOP;
-	}
-	win->field = field;
-
-	if (NULL == fh->ovfmt)
-		return -EINVAL;
-	/* 4-byte alignment. */
-	width_mask = ~0;
-	switch (fh->ovfmt->depth) {
-	case 8:
-	case 24:
-		width_mask = ~3;
-		break;
-	case 16:
-		width_mask = ~1;
-		break;
-	case 32:
-		break;
-	default:
-		BUG();
-	}
-
-	win->w.width -= win->w.left & ~width_mask;
-	win->w.left = (win->w.left - width_mask - 1) & width_mask;
-
-	return limit_scaled_size_lock(fh, &win->w.width, &win->w.height,
-				      field, width_mask,
-				      /* width_bias: round down */ 0,
-				      adjust_size, adjust_crop);
-}
-
-static int setup_window_lock(struct bttv_fh *fh, struct bttv *btv,
-			struct v4l2_window *win, int fixup)
-{
-	struct v4l2_clip *clips = NULL;
-	int n,size,retval = 0;
-
-	if (NULL == fh->ovfmt)
-		return -EINVAL;
-	if (!(fh->ovfmt->flags & FORMAT_FLAGS_PACKED))
-		return -EINVAL;
-	retval = verify_window_lock(fh, win,
-			       /* adjust_size */ fixup,
-			       /* adjust_crop */ fixup);
-	if (0 != retval)
-		return retval;
-
-	/* copy clips  --  luckily v4l1 + v4l2 are binary
-	   compatible here ...*/
-	n = win->clipcount;
-	size = sizeof(*clips)*(n+4);
-	clips = kmalloc(size,GFP_KERNEL);
-	if (NULL == clips)
-		return -ENOMEM;
-	if (n > 0)
-		memcpy(clips, win->clips, sizeof(struct v4l2_clip) * n);
-
-	/* clip against screen */
-	if (NULL != btv->fbuf.base)
-		n = btcx_screen_clips(btv->fbuf.fmt.width, btv->fbuf.fmt.height,
-				      &win->w, clips, n);
-	btcx_sort_clips(clips,n);
-
-	/* 4-byte alignments */
-	switch (fh->ovfmt->depth) {
-	case 8:
-	case 24:
-		btcx_align(&win->w, clips, n, 3);
-		break;
-	case 16:
-		btcx_align(&win->w, clips, n, 1);
-		break;
-	case 32:
-		/* no alignment fixups needed */
-		break;
-	default:
-		BUG();
-	}
-
-	kfree(fh->ov.clips);
-	fh->ov.clips    = clips;
-	fh->ov.nclips   = n;
-
-	fh->ov.w        = win->w;
-	fh->ov.field    = win->field;
-	fh->ov.setup_ok = 1;
-
-	btv->init.ov.w.width   = win->w.width;
-	btv->init.ov.w.height  = win->w.height;
-	btv->init.ov.field     = win->field;
-
-	/* update overlay if needed */
-	retval = 0;
-	if (check_btres(fh, RESOURCE_OVERLAY)) {
-		struct bttv_buffer *new;
-
-		new = videobuf_sg_alloc(sizeof(*new));
-		new->crop = btv->crop[!!fh->do_crop].rect;
-		bttv_overlay_risc(btv, &fh->ov, fh->ovfmt, new);
-		retval = bttv_switch_overlay(btv,fh,new);
-	}
-	return retval;
-}
-
 /* ----------------------------------------------------------------------- */
 
 static struct videobuf_queue* bttv_queue(struct bttv_fh *fh)
@@ -2270,17 +2088,6 @@ static int bttv_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_g_fmt_vid_overlay(struct file *file, void *priv,
-					struct v4l2_format *f)
-{
-	struct bttv_fh *fh  = priv;
-
-	f->fmt.win.w     = fh->ov.w;
-	f->fmt.win.field = fh->ov.field;
-
-	return 0;
-}
-
 static void bttv_get_width_mask_vid_cap(const struct bttv_format *fmt,
 					unsigned int *width_mask,
 					unsigned int *width_bias)
@@ -2352,17 +2159,6 @@ static int bttv_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_try_fmt_vid_overlay(struct file *file, void *priv,
-						struct v4l2_format *f)
-{
-	struct bttv_fh *fh = priv;
-
-	verify_window_lock(fh, &f->fmt.win,
-			/* adjust_size */ 1,
-			/* adjust_crop */ 0);
-	return 0;
-}
-
 static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
@@ -2410,20 +2206,6 @@ static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_s_fmt_vid_overlay(struct file *file, void *priv,
-				struct v4l2_format *f)
-{
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
-
-	if (no_overlay > 0) {
-		pr_err("V4L2_BUF_TYPE_VIDEO_OVERLAY: no_overlay\n");
-		return -EINVAL;
-	}
-
-	return setup_window_lock(fh, btv, &f->fmt.win, 1);
-}
-
 static int bttv_querycap(struct file *file, void  *priv,
 				struct v4l2_capability *cap)
 {
@@ -2437,8 +2219,6 @@ static int bttv_querycap(struct file *file, void  *priv,
 	strscpy(cap->card, btv->video_dev.name, sizeof(cap->card));
 	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 			    V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
-	if (no_overlay <= 0)
-		cap->capabilities |= V4L2_CAP_VIDEO_OVERLAY;
 	if (video_is_registered(&btv->vbi_dev))
 		cap->capabilities |= V4L2_CAP_VBI_CAPTURE;
 	if (video_is_registered(&btv->radio_dev)) {
@@ -2458,7 +2238,8 @@ static int bttv_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int bttv_enum_fmt_cap_ovr(struct v4l2_fmtdesc *f)
+static int bttv_enum_fmt_vid_cap(struct file *file, void  *priv,
+				struct v4l2_fmtdesc *f)
 {
 	int index = -1, i;
 
@@ -2476,159 +2257,6 @@ static int bttv_enum_fmt_cap_ovr(struct v4l2_fmtdesc *f)
 	return i;
 }
 
-static int bttv_enum_fmt_vid_cap(struct file *file, void  *priv,
-				struct v4l2_fmtdesc *f)
-{
-	int rc = bttv_enum_fmt_cap_ovr(f);
-
-	if (rc < 0)
-		return rc;
-
-	return 0;
-}
-
-static int bttv_enum_fmt_vid_overlay(struct file *file, void  *priv,
-					struct v4l2_fmtdesc *f)
-{
-	int rc;
-
-	if (no_overlay > 0) {
-		pr_err("V4L2_BUF_TYPE_VIDEO_OVERLAY: no_overlay\n");
-		return -EINVAL;
-	}
-
-	rc = bttv_enum_fmt_cap_ovr(f);
-
-	if (rc < 0)
-		return rc;
-
-	if (!(formats[rc].flags & FORMAT_FLAGS_PACKED))
-		return -EINVAL;
-
-	return 0;
-}
-
-static int bttv_g_fbuf(struct file *file, void *f,
-				struct v4l2_framebuffer *fb)
-{
-	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
-
-	*fb = btv->fbuf;
-	fb->capability = V4L2_FBUF_CAP_LIST_CLIPPING;
-	fb->flags = V4L2_FBUF_FLAG_PRIMARY;
-	if (fh->ovfmt)
-		fb->fmt.pixelformat  = fh->ovfmt->fourcc;
-	return 0;
-}
-
-static int bttv_overlay(struct file *file, void *f, unsigned int on)
-{
-	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
-	struct bttv_buffer *new;
-	int retval = 0;
-
-	if (on) {
-		/* verify args */
-		if (unlikely(!btv->fbuf.base)) {
-			return -EINVAL;
-		}
-		if (unlikely(!fh->ov.setup_ok)) {
-			dprintk("%d: overlay: !setup_ok\n", btv->c.nr);
-			retval = -EINVAL;
-		}
-		if (retval)
-			return retval;
-	}
-
-	if (!check_alloc_btres_lock(btv, fh, RESOURCE_OVERLAY))
-		return -EBUSY;
-
-	if (on) {
-		fh->ov.tvnorm = btv->tvnorm;
-		new = videobuf_sg_alloc(sizeof(*new));
-		new->crop = btv->crop[!!fh->do_crop].rect;
-		bttv_overlay_risc(btv, &fh->ov, fh->ovfmt, new);
-	} else {
-		new = NULL;
-	}
-
-	/* switch over */
-	retval = bttv_switch_overlay(btv, fh, new);
-	return retval;
-}
-
-static int bttv_s_fbuf(struct file *file, void *f,
-				const struct v4l2_framebuffer *fb)
-{
-	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
-	const struct bttv_format *fmt;
-	int retval;
-
-	if (!capable(CAP_SYS_ADMIN) &&
-		!capable(CAP_SYS_RAWIO))
-		return -EPERM;
-
-	/* check args */
-	fmt = format_by_fourcc(fb->fmt.pixelformat);
-	if (NULL == fmt)
-		return -EINVAL;
-	if (0 == (fmt->flags & FORMAT_FLAGS_PACKED))
-		return -EINVAL;
-
-	retval = -EINVAL;
-	if (fb->flags & V4L2_FBUF_FLAG_OVERLAY) {
-		__s32 width = fb->fmt.width;
-		__s32 height = fb->fmt.height;
-
-		retval = limit_scaled_size_lock(fh, &width, &height,
-					   V4L2_FIELD_INTERLACED,
-					   /* width_mask */ ~3,
-					   /* width_bias */ 2,
-					   /* adjust_size */ 0,
-					   /* adjust_crop */ 0);
-		if (0 != retval)
-			return retval;
-	}
-
-	/* ok, accept it */
-	btv->fbuf.base       = fb->base;
-	btv->fbuf.fmt.width  = fb->fmt.width;
-	btv->fbuf.fmt.height = fb->fmt.height;
-	if (0 != fb->fmt.bytesperline)
-		btv->fbuf.fmt.bytesperline = fb->fmt.bytesperline;
-	else
-		btv->fbuf.fmt.bytesperline = btv->fbuf.fmt.width*fmt->depth/8;
-
-	retval = 0;
-	fh->ovfmt = fmt;
-	btv->init.ovfmt = fmt;
-	if (fb->flags & V4L2_FBUF_FLAG_OVERLAY) {
-		fh->ov.w.left   = 0;
-		fh->ov.w.top    = 0;
-		fh->ov.w.width  = fb->fmt.width;
-		fh->ov.w.height = fb->fmt.height;
-		btv->init.ov.w.width  = fb->fmt.width;
-		btv->init.ov.w.height = fb->fmt.height;
-
-		kfree(fh->ov.clips);
-		fh->ov.clips = NULL;
-		fh->ov.nclips = 0;
-
-		if (check_btres(fh, RESOURCE_OVERLAY)) {
-			struct bttv_buffer *new;
-
-			new = videobuf_sg_alloc(sizeof(*new));
-			new->crop = btv->crop[!!fh->do_crop].rect;
-			bttv_overlay_risc(btv, &fh->ov, fh->ovfmt, new);
-			retval = bttv_switch_overlay(btv, fh, new);
-		}
-	}
-	return retval;
-}
-
 static int bttv_reqbufs(struct file *file, void *priv,
 				struct v4l2_requestbuffers *p)
 {
@@ -2748,8 +2376,7 @@ static int bttv_g_selection(struct file *file, void *f, struct v4l2_selection *s
 	struct bttv_fh *fh = f;
 	struct bttv *btv = fh->btv;
 
-	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
-	    sel->type != V4L2_BUF_TYPE_VIDEO_OVERLAY)
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
 	switch (sel->target) {
@@ -2786,8 +2413,7 @@ static int bttv_s_selection(struct file *file, void *f, struct v4l2_selection *s
 	__s32 b_right;
 	__s32 b_bottom;
 
-	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
-	    sel->type != V4L2_BUF_TYPE_VIDEO_OVERLAY)
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
@@ -2977,7 +2603,6 @@ static int bttv_open(struct file *file)
 	v4l2_fh_init(&fh->fh, vdev);
 
 	fh->type = type;
-	fh->ov.setup_ok = 0;
 
 	videobuf_queue_sg_init(&fh->cap, &bttv_video_qops,
 			    &btv->c.pci->dev, &btv->s_lock,
@@ -3021,10 +2646,6 @@ static int bttv_release(struct file *file)
 	struct bttv_fh *fh = file->private_data;
 	struct bttv *btv = fh->btv;
 
-	/* turn off overlay */
-	if (check_btres(fh, RESOURCE_OVERLAY))
-		bttv_switch_overlay(btv,fh,NULL);
-
 	/* stop video capture */
 	if (check_btres(fh, RESOURCE_VIDEO_STREAM)) {
 		videobuf_streamoff(&fh->cap);
@@ -3090,10 +2711,6 @@ static const struct v4l2_ioctl_ops bttv_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap           = bttv_g_fmt_vid_cap,
 	.vidioc_try_fmt_vid_cap         = bttv_try_fmt_vid_cap,
 	.vidioc_s_fmt_vid_cap           = bttv_s_fmt_vid_cap,
-	.vidioc_enum_fmt_vid_overlay    = bttv_enum_fmt_vid_overlay,
-	.vidioc_g_fmt_vid_overlay       = bttv_g_fmt_vid_overlay,
-	.vidioc_try_fmt_vid_overlay     = bttv_try_fmt_vid_overlay,
-	.vidioc_s_fmt_vid_overlay       = bttv_s_fmt_vid_overlay,
 	.vidioc_g_fmt_vbi_cap           = bttv_g_fmt_vbi_cap,
 	.vidioc_try_fmt_vbi_cap         = bttv_try_fmt_vbi_cap,
 	.vidioc_s_fmt_vbi_cap           = bttv_s_fmt_vbi_cap,
@@ -3113,9 +2730,6 @@ static const struct v4l2_ioctl_ops bttv_ioctl_ops = {
 	.vidioc_s_tuner                 = bttv_s_tuner,
 	.vidioc_g_selection             = bttv_g_selection,
 	.vidioc_s_selection             = bttv_s_selection,
-	.vidioc_g_fbuf                  = bttv_g_fbuf,
-	.vidioc_s_fbuf                  = bttv_s_fbuf,
-	.vidioc_overlay                 = bttv_overlay,
 	.vidioc_g_parm                  = bttv_g_parm,
 	.vidioc_g_frequency             = bttv_g_frequency,
 	.vidioc_s_frequency             = bttv_s_frequency,
@@ -3385,9 +2999,6 @@ static void bttv_print_riscaddr(struct bttv *btv)
 		? (unsigned long long)btv->curr.top->top.dma : 0,
 		btv->curr.bottom
 		? (unsigned long long)btv->curr.bottom->bottom.dma : 0);
-	pr_info("  scr : o=%08llx e=%08llx\n",
-		btv->screen ? (unsigned long long)btv->screen->top.dma : 0,
-		btv->screen ? (unsigned long long)btv->screen->bottom.dma : 0);
 	bttv_risc_disasm(btv, &btv->main);
 }
 
@@ -3508,28 +3119,9 @@ bttv_irq_next_video(struct bttv *btv, struct bttv_buffer_set *set)
 		}
 	}
 
-	/* screen overlay ? */
-	if (NULL != btv->screen) {
-		if (V4L2_FIELD_HAS_BOTH(btv->screen->vb.field)) {
-			if (NULL == set->top && NULL == set->bottom) {
-				set->top    = btv->screen;
-				set->bottom = btv->screen;
-			}
-		} else {
-			if (V4L2_FIELD_TOP == btv->screen->vb.field &&
-			    NULL == set->top) {
-				set->top = btv->screen;
-			}
-			if (V4L2_FIELD_BOTTOM == btv->screen->vb.field &&
-			    NULL == set->bottom) {
-				set->bottom = btv->screen;
-			}
-		}
-	}
-
-	dprintk("%d: next set: top=%p bottom=%p [screen=%p,irq=%d,%d]\n",
+	dprintk("%d: next set: top=%p bottom=%p [irq=%d,%d]\n",
 		btv->c.nr, set->top, set->bottom,
-		btv->screen, set->frame_irq, set->top_irq);
+		set->frame_irq, set->top_irq);
 	return 0;
 }
 
@@ -3883,17 +3475,12 @@ static void bttv_unregister_video(struct bttv *btv)
 /* register video4linux devices */
 static int bttv_register_video(struct bttv *btv)
 {
-	if (no_overlay > 0)
-		pr_notice("Overlay support disabled\n");
-
 	/* video */
 	vdev_init(btv, &btv->video_dev, &bttv_video_template, "video");
 	btv->video_dev.device_caps = V4L2_CAP_VIDEO_CAPTURE |
 				     V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
 	if (btv->tuner_type != TUNER_ABSENT)
 		btv->video_dev.device_caps |= V4L2_CAP_TUNER;
-	if (no_overlay <= 0)
-		btv->video_dev.device_caps |= V4L2_CAP_VIDEO_OVERLAY;
 
 	if (video_register_device(&btv->video_dev, VFL_TYPE_VIDEO,
 				  video_nr[btv->c.nr]) < 0)
@@ -4084,14 +3671,9 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 
 	/* fill struct bttv with some useful defaults */
 	btv->init.btv         = btv;
-	btv->init.ov.w.width  = 320;
-	btv->init.ov.w.height = 240;
 	btv->init.fmt         = format_by_fourcc(V4L2_PIX_FMT_BGR24);
 	btv->init.width       = 320;
 	btv->init.height      = 240;
-	btv->init.ov.w.width  = 320;
-	btv->init.ov.w.height = 240;
-	btv->init.ov.field    = V4L2_FIELD_INTERLACED;
 	btv->input = 0;
 
 	v4l2_ctrl_new_std(hdl, &bttv_ctrl_ops,
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 32fa4a7fe76f..4fa4b9da9634 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -231,95 +231,6 @@ bttv_risc_planar(struct bttv *btv, struct btcx_riscmem *risc,
 	return 0;
 }
 
-static int
-bttv_risc_overlay(struct bttv *btv, struct btcx_riscmem *risc,
-		  const struct bttv_format *fmt, struct bttv_overlay *ov,
-		  int skip_even, int skip_odd)
-{
-	int dwords, rc, line, maxy, start, end;
-	unsigned skip, nskips;
-	struct btcx_skiplist *skips;
-	__le32 *rp;
-	u32 ri,ra;
-	u32 addr;
-
-	/* skip list for window clipping */
-	skips = kmalloc_array(ov->nclips, sizeof(*skips),GFP_KERNEL);
-	if (NULL == skips)
-		return -ENOMEM;
-
-	/* estimate risc mem: worst case is (1.5*clip+1) * lines instructions
-	   + sync + jump (all 2 dwords) */
-	dwords  = (3 * ov->nclips + 2) *
-		((skip_even || skip_odd) ? (ov->w.height+1)>>1 :  ov->w.height);
-	dwords += 4;
-	if ((rc = btcx_riscmem_alloc(btv->c.pci,risc,dwords*4)) < 0) {
-		kfree(skips);
-		return rc;
-	}
-
-	/* sync instruction */
-	rp = risc->cpu;
-	*(rp++) = cpu_to_le32(BT848_RISC_SYNC|BT848_FIFO_STATUS_FM1);
-	*(rp++) = cpu_to_le32(0);
-
-	addr  = (unsigned long)btv->fbuf.base;
-	addr += btv->fbuf.fmt.bytesperline * ov->w.top;
-	addr += (fmt->depth >> 3)          * ov->w.left;
-
-	/* scan lines */
-	for (maxy = -1, line = 0; line < ov->w.height;
-	     line++, addr += btv->fbuf.fmt.bytesperline) {
-		if ((btv->opt_vcr_hack) &&
-		     (line >= (ov->w.height - VCR_HACK_LINES)))
-			continue;
-		if ((line%2) == 0  &&  skip_even)
-			continue;
-		if ((line%2) == 1  &&  skip_odd)
-			continue;
-
-		/* calculate clipping */
-		if (line > maxy)
-			btcx_calc_skips(line, ov->w.width, &maxy,
-					skips, &nskips, ov->clips, ov->nclips);
-
-		/* write out risc code */
-		for (start = 0, skip = 0; start < ov->w.width; start = end) {
-			if (skip >= nskips) {
-				ri  = BT848_RISC_WRITE;
-				end = ov->w.width;
-			} else if (start < skips[skip].start) {
-				ri  = BT848_RISC_WRITE;
-				end = skips[skip].start;
-			} else {
-				ri  = BT848_RISC_SKIP;
-				end = skips[skip].end;
-				skip++;
-			}
-			if (BT848_RISC_WRITE == ri)
-				ra = addr + (fmt->depth>>3)*start;
-			else
-				ra = 0;
-
-			if (0 == start)
-				ri |= BT848_RISC_SOL;
-			if (ov->w.width == end)
-				ri |= BT848_RISC_EOL;
-			ri |= (fmt->depth>>3) * (end-start);
-
-			*(rp++)=cpu_to_le32(ri);
-			if (0 != ra)
-				*(rp++)=cpu_to_le32(ra);
-		}
-	}
-
-	/* save pointer to jmp instruction address */
-	risc->jmp = rp;
-	BUG_ON((risc->jmp - risc->cpu + 2) * sizeof(*risc->cpu) > risc->size);
-	kfree(skips);
-	return 0;
-}
-
 /* ---------------------------------------------------------- */
 
 static void
@@ -848,45 +759,3 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 	buf->btswap   = buf->fmt->btswap;
 	return 0;
 }
-
-/* ---------------------------------------------------------- */
-
-/* calculate geometry, build risc code */
-int
-bttv_overlay_risc(struct bttv *btv,
-		  struct bttv_overlay *ov,
-		  const struct bttv_format *fmt,
-		  struct bttv_buffer *buf)
-{
-	/* check interleave, bottom+top fields */
-	dprintk("%d: overlay fields: %s format: 0x%08x  size: %dx%d\n",
-		btv->c.nr, v4l2_field_names[buf->vb.field],
-		fmt->fourcc, ov->w.width, ov->w.height);
-
-	/* calculate geometry */
-	bttv_calc_geo(btv,&buf->geo,ov->w.width,ov->w.height,
-		      V4L2_FIELD_HAS_BOTH(ov->field),
-		      &bttv_tvnorms[ov->tvnorm],&buf->crop);
-
-	/* build risc code */
-	switch (ov->field) {
-	case V4L2_FIELD_TOP:
-		bttv_risc_overlay(btv, &buf->top,    fmt, ov, 0, 0);
-		break;
-	case V4L2_FIELD_BOTTOM:
-		bttv_risc_overlay(btv, &buf->bottom, fmt, ov, 0, 0);
-		break;
-	case V4L2_FIELD_INTERLACED:
-		bttv_risc_overlay(btv, &buf->top,    fmt, ov, 0, 1);
-		bttv_risc_overlay(btv, &buf->bottom, fmt, ov, 1, 0);
-		break;
-	default:
-		BUG();
-	}
-
-	/* copy format info */
-	buf->btformat = fmt->btformat;
-	buf->btswap   = fmt->btswap;
-	buf->vb.field = ov->field;
-	return 0;
-}
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index 4abf43657846..717f002a41df 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -50,7 +50,6 @@
 #define RISC_SLOT_E_FIELD     12
 #define RISC_SLOT_LOOP        14
 
-#define RESOURCE_OVERLAY       1
 #define RESOURCE_VIDEO_STREAM  2
 #define RESOURCE_VBI           4
 #define RESOURCE_VIDEO_READ    8
@@ -165,15 +164,6 @@ struct bttv_buffer_set {
 	unsigned int           frame_irq;
 };
 
-struct bttv_overlay {
-	unsigned int           tvnorm;
-	struct v4l2_rect       w;
-	enum v4l2_field        field;
-	struct v4l2_clip       *clips;
-	int                    nclips;
-	int                    setup_ok;
-};
-
 struct bttv_vbi_fmt {
 	struct v4l2_vbi_format fmt;
 
@@ -216,10 +206,6 @@ struct bttv_fh {
 	int                      width;
 	int                      height;
 
-	/* video overlay */
-	const struct bttv_format *ovfmt;
-	struct bttv_overlay      ov;
-
 	/* Application called VIDIOC_S_SELECTION. */
 	int                      do_crop;
 
@@ -256,12 +242,6 @@ int bttv_buffer_activate_vbi(struct bttv *btv,
 void bttv_dma_free(struct videobuf_queue *q, struct bttv *btv,
 		   struct bttv_buffer *buf);
 
-/* overlay handling */
-int bttv_overlay_risc(struct bttv *btv, struct bttv_overlay *ov,
-		      const struct bttv_format *fmt,
-		      struct bttv_buffer *buf);
-
-
 /* ---------------------------------------------------------- */
 /* bttv-vbi.c                                                 */
 
@@ -278,11 +258,6 @@ extern struct bus_type bttv_sub_bus_type;
 int bttv_sub_add_device(struct bttv_core *core, char *name);
 int bttv_sub_del_devices(struct bttv_core *core);
 
-/* ---------------------------------------------------------- */
-/* bttv-cards.c                                               */
-
-extern int no_overlay;
-
 /* ---------------------------------------------------------- */
 /* bttv-input.c                                               */
 
@@ -454,7 +429,6 @@ struct bttv {
 	   - must acquire s_lock before changing these
 	   - only the irq handler is supported to touch top + bottom + vcurr */
 	struct btcx_riscmem     main;
-	struct bttv_buffer      *screen;    /* overlay             */
 	struct list_head        capture;    /* video capture queue */
 	struct list_head        vcapture;   /* vbi capture queue   */
 	struct bttv_buffer_set  curr;       /* active buffers      */
@@ -479,7 +453,7 @@ struct bttv {
 	/* used to make dvb-bt8xx autoloadable */
 	struct work_struct request_module_wk;
 
-	/* Default (0) and current (1) video capturing and overlay
+	/* Default (0) and current (1) video capturing
 	   cropping parameters in bttv_tvnorm.cropcap units. Protected
 	   by bttv.lock. */
 	struct bttv_crop crop[2];
-- 
2.39.1

