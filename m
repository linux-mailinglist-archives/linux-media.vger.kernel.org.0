Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0D62754640
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 04:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjGOCQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 22:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjGOCQv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 22:16:51 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A4030DF
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 19:16:46 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 43FEA660705F;
        Sat, 15 Jul 2023 03:16:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689387405;
        bh=X0d0bNZY8Ijpq4DVQ2SMZtWPw1oZHTpFu1FkfkiMm4Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CPdwJx6ZGRKcdTsy6TNCGFXe+ka5wkyzVG3sVrqRovu1+aBoBmWBx+Y64bGXgebPk
         EspFxH57zIu1fAXYecorVq6b2oNC035C7b9e483vsVjy19ZTQrfMJt1995T4O+pm1i
         o5UQTSFkQfLwIlqAZbfUiwtrR0qWkt3tTxkuhdfOSYcsVWrRI4TkmYZ4iBHxSsrBVM
         D7+YnwEL+DxFvGBrX9v8I38QRa8a7E0nyAdmfO/6yp6R14b7hcdh9u10B5atfERgzf
         r8GDarPPFRJGR/L4+FqzU+LbiYxJxsrDxABrMr+5N6eVmJj3D9oLnbsPJXDr0YEHfd
         tkbI+wsxafyYg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 13/13] media: bttv: convert to vb2
Date:   Fri, 14 Jul 2023 19:16:09 -0700
Message-Id: <d785cd8b0d8c19c05fcaa1536622e2fdd9f8ede3.1689379982.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1689379982.git.deborah.brouwer@collabora.com>
References: <cover.1689379982.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert this driver from the old videobuf framework to videobuf2.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/Kconfig       |   2 +-
 drivers/media/pci/bt8xx/bt848.h       |   8 +
 drivers/media/pci/bt8xx/bttv-driver.c | 829 ++++++++------------------
 drivers/media/pci/bt8xx/bttv-risc.c   | 284 ++++-----
 drivers/media/pci/bt8xx/bttv-vbi.c    | 254 +++-----
 drivers/media/pci/bt8xx/bttvp.h       |  61 +-
 6 files changed, 542 insertions(+), 896 deletions(-)

diff --git a/drivers/media/pci/bt8xx/Kconfig b/drivers/media/pci/bt8xx/Kconfig
index 2d674dc28cec..2f77628246e9 100644
--- a/drivers/media/pci/bt8xx/Kconfig
+++ b/drivers/media/pci/bt8xx/Kconfig
@@ -3,7 +3,7 @@ config VIDEO_BT848
 	tristate "BT848 Video For Linux"
 	depends on PCI && I2C && VIDEO_DEV
 	select I2C_ALGOBIT
-	select VIDEOBUF_DMA_SG
+	select VIDEOBUF2_DMA_SG
 	depends on RC_CORE
 	depends on MEDIA_RADIO_SUPPORT
 	select VIDEO_TUNER
diff --git a/drivers/media/pci/bt8xx/bt848.h b/drivers/media/pci/bt8xx/bt848.h
index 16999e717d18..c8a0e1ab001f 100644
--- a/drivers/media/pci/bt8xx/bt848.h
+++ b/drivers/media/pci/bt8xx/bt848.h
@@ -231,7 +231,15 @@
 
 #define BT848_INT_ETBF         (1<<23)
 
+#define BT848_RISC_VIDEO 1
+#define BT848_RISC_TOP 2
+#define BT848_RISC_VBI 4
+
 #define BT848_INT_RISCS   (0xf<<28)
+#define BT848_INT_RISCS_VIDEO   (BT848_RISC_VIDEO << 28)
+#define BT848_INT_RISCS_TOP   (BT848_RISC_TOP << 28)
+#define BT848_INT_RISCS_VBI   (BT848_RISC_VBI << 28)
+
 #define BT848_INT_RISC_EN (1<<27)
 #define BT848_INT_RACK    (1<<25)
 #define BT848_INT_FIELD   (1<<24)
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 4d1e0743f193..aa708a0e5eac 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -641,15 +641,10 @@ static const unsigned int FORMATS = ARRAY_SIZE(formats);
 #define VIDEO_RESOURCES (RESOURCE_VIDEO_READ | \
 			 RESOURCE_VIDEO_STREAM)
 
-static
-int check_alloc_btres_lock(struct bttv *btv, struct bttv_fh *fh, int bit)
+int check_alloc_btres_lock(struct bttv *btv, int bit)
 {
 	int xbits; /* mutual exclusive resources */
 
-	if (fh->resources & bit)
-		/* have it already allocated */
-		return 1;
-
 	xbits = bit;
 	if (bit & (RESOURCE_VIDEO_READ | RESOURCE_VIDEO_STREAM))
 		xbits |= RESOURCE_VIDEO_READ | RESOURCE_VIDEO_STREAM;
@@ -682,7 +677,6 @@ int check_alloc_btres_lock(struct bttv *btv, struct bttv_fh *fh, int bit)
 	}
 
 	/* it's free, grab it */
-	fh->resources  |= bit;
 	btv->resources |= bit;
 	return 1;
 
@@ -691,9 +685,9 @@ int check_alloc_btres_lock(struct bttv *btv, struct bttv_fh *fh, int bit)
 }
 
 static
-int check_btres(struct bttv_fh *fh, int bit)
+int check_btres(struct bttv *btv, int bit)
 {
-	return (fh->resources & bit);
+	return (btv->resources & bit);
 }
 
 static
@@ -731,14 +725,12 @@ disclaim_video_lines(struct bttv *btv)
 	btwrite(0xfe, BT848_O_VDELAY_LO);
 }
 
-static
-void free_btres_lock(struct bttv *btv, struct bttv_fh *fh, int bits)
+void free_btres_lock(struct bttv *btv, int bits)
 {
-	if ((fh->resources & bits) != bits) {
+	if ((btv->resources & bits) != bits) {
 		/* trying to free resources not allocated by us ... */
 		pr_err("BUG! (btres)\n");
 	}
-	fh->resources  &= ~bits;
 	btv->resources &= ~bits;
 
 	bits = btv->resources;
@@ -1174,7 +1166,7 @@ set_input(struct bttv *btv, unsigned int input, unsigned int norm)
 	set_tvnorm(btv, norm);
 }
 
-static void init_irqreg(struct bttv *btv)
+void init_irqreg(struct bttv *btv)
 {
 	/* clear status */
 	btwrite(0xfffffUL, BT848_INT_STAT);
@@ -1453,23 +1445,6 @@ void bttv_gpio_tracking(struct bttv *btv, char *comment)
 		 btv->c.nr, outbits, data & outbits, data & ~outbits, comment);
 }
 
-static void bttv_field_count(struct bttv *btv)
-{
-	int need_count = 0;
-
-	if (btv->users)
-		need_count++;
-
-	if (need_count) {
-		/* start field counter */
-		btor(BT848_INT_VSYNC,BT848_INT_MASK);
-	} else {
-		/* stop field counter */
-		btand(~BT848_INT_VSYNC,BT848_INT_MASK);
-		btv->field_count = 0;
-	}
-}
-
 static const struct bttv_format*
 format_by_fourcc(int fourcc)
 {
@@ -1487,156 +1462,132 @@ format_by_fourcc(int fourcc)
 /* ----------------------------------------------------------------------- */
 /* video4linux (1) interface                                               */
 
-static int bttv_prepare_buffer(struct videobuf_queue *q,struct bttv *btv,
-			       struct bttv_buffer *buf,
-			       const struct bttv_format *fmt,
-			       unsigned int width, unsigned int height,
-			       enum v4l2_field field)
+static int queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+		       unsigned int *num_planes, unsigned int sizes[],
+		       struct device *alloc_devs[])
 {
-	int redo_dma_risc = 0;
-	struct bttv_crop c;
-	int norm;
-	int rc;
+	struct bttv *btv = vb2_get_drv_priv(q);
+	unsigned int size = btv->fmt->depth * btv->width * btv->height >> 3;
 
-	/* check settings */
-	if (NULL == fmt)
-		return -EINVAL;
-	if (fmt->btformat == BT848_COLOR_FMT_RAW) {
-		width  = RAW_BPL;
-		height = RAW_LINES*2;
-		if (width*height > buf->vb.bsize)
-			return -EINVAL;
-		buf->vb.size = buf->vb.bsize;
-
-		/* Make sure tvnorm and vbi_end remain consistent
-		   until we're done. */
-
-		norm = btv->tvnorm;
-
-		/* In this mode capturing always starts at defrect.top
-		   (default VDELAY), ignoring cropping parameters. */
-		if (btv->vbi_end > bttv_tvnorms[norm].cropcap.defrect.top) {
-			return -EINVAL;
-		}
+	if (*num_planes)
+		return sizes[0] < size ? -EINVAL : 0;
+	*num_planes = 1;
+	sizes[0] = size;
 
-		c.rect = bttv_tvnorms[norm].cropcap.defrect;
-	} else {
-		norm = btv->tvnorm;
-		c = btv->crop[!!btv->do_crop];
-
-		if (width < c.min_scaled_width ||
-		    width > c.max_scaled_width ||
-		    height < c.min_scaled_height)
-			return -EINVAL;
-
-		switch (field) {
-		case V4L2_FIELD_TOP:
-		case V4L2_FIELD_BOTTOM:
-		case V4L2_FIELD_ALTERNATE:
-			/* btv->crop counts frame lines. Max. scale
-			   factor is 16:1 for frames, 8:1 for fields. */
-			if (height * 2 > c.max_scaled_height)
-				return -EINVAL;
-			break;
+	return 0;
+}
 
-		default:
-			if (height > c.max_scaled_height)
-				return -EINVAL;
-			break;
-		}
+static void buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct bttv *btv = vb2_get_drv_priv(vq);
+	struct bttv_buffer *buf = container_of(vbuf, struct bttv_buffer, vbuf);
+	unsigned long flags;
 
-		buf->vb.size = (width * height * fmt->depth) >> 3;
-		if (0 != buf->vb.baddr  &&  buf->vb.bsize < buf->vb.size)
-			return -EINVAL;
-	}
-
-	/* alloc + fill struct bttv_buffer (if changed) */
-	if (buf->vb.width != width || buf->vb.height != height ||
-	    buf->vb.field != field ||
-	    btv->tvnorm != norm || btv->fmt != fmt ||
-	    btv->crop[!!btv->do_crop].rect.top != c.rect.top ||
-	    btv->crop[!!btv->do_crop].rect.left != c.rect.left ||
-	    btv->crop[!!btv->do_crop].rect.width != c.rect.width ||
-	    btv->crop[!!btv->do_crop].rect.height != c.rect.height) {
-		buf->vb.width  = width;
-		buf->vb.height = height;
-		buf->vb.field  = field;
-		btv->tvnorm    = norm;
-		btv->crop[!!btv->do_crop].rect = c.rect;
-		redo_dma_risc = 1;
-	}
-
-	/* alloc risc memory */
-	if (VIDEOBUF_NEEDS_INIT == buf->vb.state) {
-		redo_dma_risc = 1;
-		if (0 != (rc = videobuf_iolock(q,&buf->vb,&btv->fbuf)))
-			goto fail;
+	spin_lock_irqsave(&btv->s_lock, flags);
+	if (list_empty(&btv->capture)) {
+		btv->loop_irq = BT848_RISC_VIDEO;
+		if (vb2_is_streaming(&btv->vbiq))
+			btv->loop_irq |= BT848_RISC_VBI;
+		bttv_set_dma(btv, BT848_CAP_CTL_CAPTURE_ODD |
+			     BT848_CAP_CTL_CAPTURE_EVEN);
 	}
-
-	if (redo_dma_risc)
-		if (0 != (rc = bttv_buffer_risc(btv,buf)))
-			goto fail;
-
-	buf->vb.state = VIDEOBUF_PREPARED;
-	return 0;
-
- fail:
-	bttv_dma_free(q,btv,buf);
-	return rc;
+	list_add_tail(&buf->list, &btv->capture);
+	spin_unlock_irqrestore(&btv->s_lock, flags);
 }
 
-static int
-buffer_setup(struct videobuf_queue *q, unsigned int *count, unsigned int *size)
+static int buf_prepare(struct vb2_buffer *vb)
 {
-	struct bttv_fh *fh = q->priv_data;
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct bttv *btv = vb2_get_drv_priv(vq);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct bttv_buffer *buf = container_of(vbuf, struct bttv_buffer, vbuf);
+	unsigned int size = (btv->fmt->depth * btv->width * btv->height) >> 3;
 
-	*size = fh->fmt->depth*fh->width*fh->height >> 3;
-	if (0 == *count)
-		*count = gbuffers;
-	if (*size * *count > gbuffers * gbufsize)
-		*count = (gbuffers * gbufsize) / *size;
-	return 0;
+	if (vb2_plane_size(vb, 0) < size)
+		return -EINVAL;
+	vb2_set_plane_payload(vb, 0, size);
+
+	if (btv->field != V4L2_FIELD_ALTERNATE) {
+		buf->vbuf.field = btv->field;
+	} else if (btv->field_last == V4L2_FIELD_TOP) {
+		buf->vbuf.field = V4L2_FIELD_BOTTOM;
+		btv->field_last = V4L2_FIELD_BOTTOM;
+	} else {
+		buf->vbuf.field = V4L2_FIELD_TOP;
+		btv->field_last = V4L2_FIELD_TOP;
+	}
+
+	/* Allocate memory for risc struct and create the risc program. */
+	return bttv_buffer_risc(btv, buf);
 }
 
-static int
-buffer_prepare(struct videobuf_queue *q, struct videobuf_buffer *vb,
-	       enum v4l2_field field)
+static void buf_cleanup(struct vb2_buffer *vb)
 {
-	struct bttv_buffer *buf = container_of(vb,struct bttv_buffer,vb);
-	struct bttv_fh *fh = q->priv_data;
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct bttv *btv = vb2_get_drv_priv(vq);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct bttv_buffer *buf = container_of(vbuf, struct bttv_buffer, vbuf);
 
-	return bttv_prepare_buffer(q,fh->btv, buf, fh->fmt,
-				   fh->width, fh->height, field);
+	btcx_riscmem_free(btv->c.pci, &buf->top);
+	btcx_riscmem_free(btv->c.pci, &buf->bottom);
 }
 
-static void
-buffer_queue(struct videobuf_queue *q, struct videobuf_buffer *vb)
+static int start_streaming(struct vb2_queue *q, unsigned int count)
 {
-	struct bttv_buffer *buf = container_of(vb,struct bttv_buffer,vb);
-	struct bttv_fh *fh = q->priv_data;
-	struct bttv    *btv = fh->btv;
-
-	buf->vb.state = VIDEOBUF_QUEUED;
-	list_add_tail(&buf->vb.queue,&btv->capture);
-	if (!btv->curr.frame_irq) {
-		btv->loop_irq |= 1;
-		bttv_set_dma(btv, 0x03);
+	int ret = 1;
+	int seqnr = 0;
+	struct bttv_buffer *buf;
+	struct bttv *btv = vb2_get_drv_priv(q);
+
+	ret = check_alloc_btres_lock(btv, RESOURCE_VIDEO_STREAM);
+	if (ret == 0) {
+		if (btv->field_count)
+			seqnr++;
+		while (!list_empty(&btv->capture)) {
+			buf = list_entry(btv->capture.next,
+					 struct bttv_buffer, list);
+			list_del(&buf->list);
+			buf->vbuf.sequence = (btv->field_count >> 1) + seqnr++;
+			vb2_buffer_done(&buf->vbuf.vb2_buf,
+					VB2_BUF_STATE_QUEUED);
+		}
+		return !ret;
 	}
+	if (!vb2_is_streaming(&btv->vbiq)) {
+		init_irqreg(btv);
+		btv->field_count = 0;
+	}
+	btv->framedrop = 0;
+
+	return 0;
 }
 
-static void buffer_release(struct videobuf_queue *q, struct videobuf_buffer *vb)
+static void stop_streaming(struct vb2_queue *q)
 {
-	struct bttv_buffer *buf = container_of(vb,struct bttv_buffer,vb);
-	struct bttv_fh *fh = q->priv_data;
+	unsigned long flags;
+	struct bttv *btv = vb2_get_drv_priv(q);
 
-	bttv_dma_free(q,fh->btv,buf);
+	vb2_wait_for_all_buffers(q);
+	spin_lock_irqsave(&btv->s_lock, flags);
+	free_btres_lock(btv, RESOURCE_VIDEO_STREAM);
+	if (!vb2_is_streaming(&btv->vbiq)) {
+		/* stop field counter */
+		btand(~BT848_INT_VSYNC, BT848_INT_MASK);
+	}
+	spin_unlock_irqrestore(&btv->s_lock, flags);
 }
 
-static const struct videobuf_queue_ops bttv_video_qops = {
-	.buf_setup    = buffer_setup,
-	.buf_prepare  = buffer_prepare,
-	.buf_queue    = buffer_queue,
-	.buf_release  = buffer_release,
+static const struct vb2_ops bttv_video_qops = {
+	.queue_setup    = queue_setup,
+	.buf_queue      = buf_queue,
+	.buf_prepare    = buf_prepare,
+	.buf_cleanup    = buf_cleanup,
+	.start_streaming = start_streaming,
+	.stop_streaming = stop_streaming,
+	.wait_prepare   = vb2_ops_wait_prepare,
+	.wait_finish    = vb2_ops_wait_finish,
 };
 
 static void radio_enable(struct bttv *btv)
@@ -1890,16 +1841,11 @@ bttv_crop_adjust	(struct bttv_crop *             c,
    also adjust the current cropping parameters to get closer to the
    desired image size. */
 static int
-limit_scaled_size_lock       (struct bttv_fh *               fh,
-			 __s32 *                        width,
-			 __s32 *                        height,
-			 enum v4l2_field                field,
-			 unsigned int			width_mask,
-			 unsigned int			width_bias,
-			 int                            adjust_size,
-			 int                            adjust_crop)
-{
-	struct bttv *btv = fh->btv;
+limit_scaled_size_lock(struct bttv *btv, __s32 *width, __s32 *height,
+		       enum v4l2_field field, unsigned int width_mask,
+		       unsigned int width_bias, int adjust_size,
+		       int adjust_crop)
+{
 	const struct v4l2_rect *b;
 	struct bttv_crop *c;
 	__s32 min_width;
@@ -1993,52 +1939,31 @@ limit_scaled_size_lock       (struct bttv_fh *               fh,
 	return rc;
 }
 
-/* ----------------------------------------------------------------------- */
-
-static struct videobuf_queue* bttv_queue(struct bttv_fh *fh)
+static int bttv_switch_type(struct bttv *btv, enum v4l2_buf_type type)
 {
-	struct videobuf_queue* q = NULL;
+	int res;
+	struct vb2_queue *q;
 
-	switch (fh->type) {
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
-		q = &fh->cap;
-		break;
-	case V4L2_BUF_TYPE_VBI_CAPTURE:
-		q = &fh->vbi;
-		break;
-	default:
-		BUG();
-	}
-	return q;
-}
-
-static int bttv_resource(struct bttv_fh *fh)
-{
-	int res = 0;
-
-	switch (fh->type) {
+	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+		q = &btv->capq;
 		res = RESOURCE_VIDEO_STREAM;
 		break;
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
+		q = &btv->vbiq;
 		res = RESOURCE_VBI;
 		break;
 	default:
 		WARN_ON(1);
+		return -EINVAL;
 	}
-	return res;
-}
 
-static int bttv_switch_type(struct bttv_fh *fh, enum v4l2_buf_type type)
-{
-	struct videobuf_queue *q = bttv_queue(fh);
-	int res = bttv_resource(fh);
-
-	if (check_btres(fh,res))
+	if (check_btres(btv, res))
 		return -EBUSY;
-	if (videobuf_queue_is_busy(q))
+	if (vb2_is_busy(q))
 		return -EBUSY;
-	fh->type = type;
+	btv->type = type;
+
 	return 0;
 }
 
@@ -2063,11 +1988,10 @@ pix_format_set_size     (struct v4l2_pix_format *       f,
 static int bttv_g_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_format *f)
 {
-	struct bttv_fh *fh  = priv;
 	struct bttv *btv = video_drvdata(file);
 
 	pix_format_set_size(&f->fmt.pix, btv->fmt, btv->width, btv->height);
-	f->fmt.pix.field        = fh->cap.field;
+	f->fmt.pix.field = btv->field;
 	f->fmt.pix.pixelformat  = btv->fmt->fourcc;
 	f->fmt.pix.colorspace   = V4L2_COLORSPACE_SMPTE170M;
 
@@ -2091,7 +2015,6 @@ static int bttv_try_fmt_vid_cap(struct file *file, void *priv,
 						struct v4l2_format *f)
 {
 	const struct bttv_format *fmt;
-	struct bttv_fh *fh = priv;
 	struct bttv *btv = video_drvdata(file);
 	enum v4l2_field field;
 	__s32 width, height;
@@ -2130,10 +2053,8 @@ static int bttv_try_fmt_vid_cap(struct file *file, void *priv,
 	height = f->fmt.pix.height;
 
 	bttv_get_width_mask_vid_cap(fmt, &width_mask, &width_bias);
-	rc = limit_scaled_size_lock(fh, &width, &height, field,
-			       width_mask, width_bias,
-			       /* adjust_size */ 1,
-			       /* adjust_crop */ 0);
+	rc = limit_scaled_size_lock(btv, &width, &height, field, width_mask,
+				    width_bias, 1, 0);
 	if (0 != rc)
 		return rc;
 
@@ -2146,17 +2067,16 @@ static int bttv_try_fmt_vid_cap(struct file *file, void *priv,
 }
 
 static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
-				struct v4l2_format *f)
+			      struct v4l2_format *f)
 {
 	int retval;
 	const struct bttv_format *fmt;
-	struct bttv_fh *fh = priv;
 	struct bttv *btv = video_drvdata(file);
 	__s32 width, height;
 	unsigned int width_mask, width_bias;
 	enum v4l2_field field;
 
-	retval = bttv_switch_type(fh, f->type);
+	retval = bttv_switch_type(btv, f->type);
 	if (0 != retval)
 		return retval;
 
@@ -2170,27 +2090,25 @@ static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
 
 	fmt = format_by_fourcc(f->fmt.pix.pixelformat);
 	bttv_get_width_mask_vid_cap(fmt, &width_mask, &width_bias);
-	retval = limit_scaled_size_lock(fh, &width, &height, f->fmt.pix.field,
-			       width_mask, width_bias,
-			       /* adjust_size */ 1,
-			       /* adjust_crop */ 1);
+	retval = limit_scaled_size_lock(btv, &width, &height, f->fmt.pix.field,
+					width_mask, width_bias, 1, 1);
 	if (0 != retval)
 		return retval;
 
 	f->fmt.pix.field = field;
 
 	/* update our state information */
-	fh->fmt              = fmt;
-	fh->cap.field        = f->fmt.pix.field;
-	fh->cap.last         = V4L2_FIELD_NONE;
-	fh->width            = f->fmt.pix.width;
-	fh->height           = f->fmt.pix.height;
-	btv->init.fmt        = fmt;
-	btv->init.width      = f->fmt.pix.width;
-	btv->init.height     = f->fmt.pix.height;
 	btv->fmt = fmt;
 	btv->width = f->fmt.pix.width;
 	btv->height = f->fmt.pix.height;
+	btv->field = f->fmt.pix.field;
+	/*
+	 * When field is V4L2_FIELD_ALTERNATE, buffers will be either
+	 * V4L2_FIELD_TOP or V4L2_FIELD_BOTTOM depending on the value of
+	 * field_last. Initialize field_last to V4L2_FIELD_BOTTOM so that
+	 * streaming starts with a V4L2_FIELD_TOP buffer.
+	 */
+	btv->field_last = V4L2_FIELD_BOTTOM;
 
 	return 0;
 }
@@ -2245,68 +2163,6 @@ static int bttv_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int bttv_reqbufs(struct file *file, void *priv,
-				struct v4l2_requestbuffers *p)
-{
-	struct bttv_fh *fh = priv;
-	return videobuf_reqbufs(bttv_queue(fh), p);
-}
-
-static int bttv_querybuf(struct file *file, void *priv,
-				struct v4l2_buffer *b)
-{
-	struct bttv_fh *fh = priv;
-	return videobuf_querybuf(bttv_queue(fh), b);
-}
-
-static int bttv_qbuf(struct file *file, void *priv, struct v4l2_buffer *b)
-{
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = video_drvdata(file);
-	int res = bttv_resource(fh);
-
-	if (!check_alloc_btres_lock(btv, fh, res))
-		return -EBUSY;
-
-	return videobuf_qbuf(bttv_queue(fh), b);
-}
-
-static int bttv_dqbuf(struct file *file, void *priv, struct v4l2_buffer *b)
-{
-	struct bttv_fh *fh = priv;
-	return videobuf_dqbuf(bttv_queue(fh), b,
-			file->f_flags & O_NONBLOCK);
-}
-
-static int bttv_streamon(struct file *file, void *priv,
-					enum v4l2_buf_type type)
-{
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
-	int res = bttv_resource(fh);
-
-	if (!check_alloc_btres_lock(btv, fh, res))
-		return -EBUSY;
-	return videobuf_streamon(bttv_queue(fh));
-}
-
-
-static int bttv_streamoff(struct file *file, void *priv,
-					enum v4l2_buf_type type)
-{
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
-	int retval;
-	int res = bttv_resource(fh);
-
-
-	retval = videobuf_streamoff(bttv_queue(fh));
-	if (retval < 0)
-		return retval;
-	free_btres_lock(btv, fh, res);
-	return 0;
-}
-
 static int bttv_g_parm(struct file *file, void *f,
 				struct v4l2_streamparm *parm)
 {
@@ -2382,7 +2238,6 @@ static int bttv_g_selection(struct file *file, void *f, struct v4l2_selection *s
 
 static int bttv_s_selection(struct file *file, void *f, struct v4l2_selection *sel)
 {
-	struct bttv_fh *fh = f;
 	struct bttv *btv = video_drvdata(file);
 	const struct v4l2_rect *b;
 	int retval;
@@ -2403,9 +2258,8 @@ static int bttv_s_selection(struct file *file, void *f, struct v4l2_selection *s
 	   read() may change vbi_end in check_alloc_btres_lock(). */
 	retval = -EBUSY;
 
-	if (locked_btres(fh->btv, VIDEO_RESOURCES)) {
+	if (locked_btres(btv, VIDEO_RESOURCES))
 		return retval;
-	}
 
 	b = &bttv_tvnorms[btv->tvnorm].cropcap.bounds;
 
@@ -2454,228 +2308,15 @@ static int bttv_s_selection(struct file *file, void *f, struct v4l2_selection *s
 	return 0;
 }
 
-static ssize_t bttv_read(struct file *file, char __user *data,
-			 size_t count, loff_t *ppos)
-{
-	struct bttv_fh *fh = file->private_data;
-	int retval = 0;
-
-	if (fh->btv->errors)
-		bttv_reinit_bt848(fh->btv);
-	dprintk("%d: read count=%d type=%s\n",
-		fh->btv->c.nr, (int)count, v4l2_type_names[fh->type]);
-
-	switch (fh->type) {
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
-		if (!check_alloc_btres_lock(fh->btv, fh, RESOURCE_VIDEO_READ)) {
-			/* VIDEO_READ in use by another fh,
-			   or VIDEO_STREAM by any fh. */
-			return -EBUSY;
-		}
-		retval = videobuf_read_one(&fh->cap, data, count, ppos,
-					   file->f_flags & O_NONBLOCK);
-		free_btres_lock(fh->btv, fh, RESOURCE_VIDEO_READ);
-		break;
-	case V4L2_BUF_TYPE_VBI_CAPTURE:
-		if (!check_alloc_btres_lock(fh->btv,fh,RESOURCE_VBI))
-			return -EBUSY;
-		retval = videobuf_read_stream(&fh->vbi, data, count, ppos, 1,
-					      file->f_flags & O_NONBLOCK);
-		break;
-	default:
-		BUG();
-	}
-	return retval;
-}
-
-static __poll_t bttv_poll(struct file *file, poll_table *wait)
-{
-	struct bttv_fh *fh = file->private_data;
-	struct bttv_buffer *buf;
-	enum v4l2_field field;
-	__poll_t rc = 0;
-	__poll_t req_events = poll_requested_events(wait);
-
-	if (v4l2_event_pending(&fh->fh))
-		rc = EPOLLPRI;
-	else if (req_events & EPOLLPRI)
-		poll_wait(file, &fh->fh.wait, wait);
-
-	if (!(req_events & (EPOLLIN | EPOLLRDNORM)))
-		return rc;
-
-	if (V4L2_BUF_TYPE_VBI_CAPTURE == fh->type) {
-		if (!check_alloc_btres_lock(fh->btv,fh,RESOURCE_VBI))
-			return rc | EPOLLERR;
-		return rc | videobuf_poll_stream(file, &fh->vbi, wait);
-	}
-
-	if (check_btres(fh,RESOURCE_VIDEO_STREAM)) {
-		/* streaming capture */
-		if (list_empty(&fh->cap.stream))
-			return rc | EPOLLERR;
-		buf = list_entry(fh->cap.stream.next,struct bttv_buffer,vb.stream);
-	} else {
-		/* read() capture */
-		if (NULL == fh->cap.read_buf) {
-			/* need to capture a new frame */
-			if (locked_btres(fh->btv,RESOURCE_VIDEO_STREAM))
-				return rc | EPOLLERR;
-			fh->cap.read_buf = videobuf_sg_alloc(fh->cap.msize);
-			if (NULL == fh->cap.read_buf)
-				return rc | EPOLLERR;
-			fh->cap.read_buf->memory = V4L2_MEMORY_USERPTR;
-			field = videobuf_next_field(&fh->cap);
-			if (0 != fh->cap.ops->buf_prepare(&fh->cap,fh->cap.read_buf,field)) {
-				kfree (fh->cap.read_buf);
-				fh->cap.read_buf = NULL;
-				return rc | EPOLLERR;
-			}
-			fh->cap.ops->buf_queue(&fh->cap,fh->cap.read_buf);
-			fh->cap.read_off = 0;
-		}
-		buf = (struct bttv_buffer*)fh->cap.read_buf;
-	}
-
-	poll_wait(file, &buf->vb.done, wait);
-	if (buf->vb.state == VIDEOBUF_DONE ||
-	    buf->vb.state == VIDEOBUF_ERROR)
-		rc = rc | EPOLLIN|EPOLLRDNORM;
-	return rc;
-}
-
-static int bttv_open(struct file *file)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct bttv *btv = video_drvdata(file);
-	struct bttv_fh *fh;
-	enum v4l2_buf_type type = 0;
-
-	dprintk("open dev=%s\n", video_device_node_name(vdev));
-
-	if (vdev->vfl_type == VFL_TYPE_VIDEO) {
-		type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	} else if (vdev->vfl_type == VFL_TYPE_VBI) {
-		type = V4L2_BUF_TYPE_VBI_CAPTURE;
-	} else {
-		WARN_ON(1);
-		return -ENODEV;
-	}
-
-	dprintk("%d: open called (type=%s)\n",
-		btv->c.nr, v4l2_type_names[type]);
-
-	/* allocate per filehandle data */
-	fh = kmalloc(sizeof(*fh), GFP_KERNEL);
-	if (unlikely(!fh))
-		return -ENOMEM;
-	btv->users++;
-	file->private_data = fh;
-
-	*fh = btv->init;
-	v4l2_fh_init(&fh->fh, vdev);
-
-	fh->type = type;
-
-	videobuf_queue_sg_init(&fh->cap, &bttv_video_qops,
-			    &btv->c.pci->dev, &btv->s_lock,
-			    V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			    V4L2_FIELD_INTERLACED,
-			    sizeof(struct bttv_buffer),
-			    fh, &btv->lock);
-	videobuf_queue_sg_init(&fh->vbi, &bttv_vbi_qops,
-			    &btv->c.pci->dev, &btv->s_lock,
-			    V4L2_BUF_TYPE_VBI_CAPTURE,
-			    V4L2_FIELD_SEQ_TB,
-			    sizeof(struct bttv_buffer),
-			    fh, &btv->lock);
-	set_tvnorm(btv,btv->tvnorm);
-	set_input(btv, btv->input, btv->tvnorm);
-	audio_mute(btv, btv->mute);
-
-	/* The V4L2 spec requires one global set of cropping parameters
-	   which only change on request. These are stored in btv->crop[1].
-	   However for compatibility with V4L apps and cropping unaware
-	   V4L2 apps we now reset the cropping parameters as seen through
-	   this fh, which is to say VIDIOC_G_SELECTION and scaling limit checks
-	   will use btv->crop[0], the default cropping parameters for the
-	   current video standard, and VIDIOC_S_FMT will not implicitly
-	   change the cropping parameters until VIDIOC_S_SELECTION has been
-	   called. */
-	btv->do_crop = !reset_crop; /* module parameter */
-
-	/* Likewise there should be one global set of VBI capture
-	   parameters, but for compatibility with V4L apps and earlier
-	   driver versions each fh has its own parameters. */
-	bttv_vbi_fmt_reset(&fh->vbi_fmt, btv->tvnorm);
-
-	bttv_field_count(btv);
-	v4l2_fh_add(&fh->fh);
-	return 0;
-}
-
-static int bttv_release(struct file *file)
-{
-	struct bttv_fh *fh = file->private_data;
-	struct bttv *btv = fh->btv;
-
-	/* stop video capture */
-	if (check_btres(fh, RESOURCE_VIDEO_STREAM)) {
-		videobuf_streamoff(&fh->cap);
-		free_btres_lock(btv,fh,RESOURCE_VIDEO_STREAM);
-	}
-	if (fh->cap.read_buf) {
-		buffer_release(&fh->cap,fh->cap.read_buf);
-		kfree(fh->cap.read_buf);
-	}
-	if (check_btres(fh, RESOURCE_VIDEO_READ)) {
-		free_btres_lock(btv, fh, RESOURCE_VIDEO_READ);
-	}
-
-	/* stop vbi capture */
-	if (check_btres(fh, RESOURCE_VBI)) {
-		videobuf_stop(&fh->vbi);
-		free_btres_lock(btv,fh,RESOURCE_VBI);
-	}
-
-	/* free stuff */
-
-	videobuf_mmap_free(&fh->cap);
-	videobuf_mmap_free(&fh->vbi);
-	file->private_data = NULL;
-
-	btv->users--;
-	bttv_field_count(btv);
-
-	if (!btv->users)
-		audio_mute(btv, btv->mute);
-
-	v4l2_fh_del(&fh->fh);
-	v4l2_fh_exit(&fh->fh);
-	kfree(fh);
-	return 0;
-}
-
-static int
-bttv_mmap(struct file *file, struct vm_area_struct *vma)
-{
-	struct bttv_fh *fh = file->private_data;
-
-	dprintk("%d: mmap type=%s 0x%lx+%ld\n",
-		fh->btv->c.nr, v4l2_type_names[fh->type],
-		vma->vm_start, vma->vm_end - vma->vm_start);
-	return videobuf_mmap_mapper(bttv_queue(fh),vma);
-}
-
 static const struct v4l2_file_operations bttv_fops =
 {
 	.owner		  = THIS_MODULE,
-	.open		  = bttv_open,
-	.release	  = bttv_release,
+	.open		  = v4l2_fh_open,
+	.release	  = vb2_fop_release,
 	.unlocked_ioctl	  = video_ioctl2,
-	.read		  = bttv_read,
-	.mmap		  = bttv_mmap,
-	.poll		  = bttv_poll,
+	.read		  = vb2_fop_read,
+	.mmap		  = vb2_fop_mmap,
+	.poll		  = vb2_fop_poll,
 };
 
 static const struct v4l2_ioctl_ops bttv_ioctl_ops = {
@@ -2688,17 +2329,18 @@ static const struct v4l2_ioctl_ops bttv_ioctl_ops = {
 	.vidioc_try_fmt_vbi_cap         = bttv_try_fmt_vbi_cap,
 	.vidioc_s_fmt_vbi_cap           = bttv_s_fmt_vbi_cap,
 	.vidioc_g_pixelaspect           = bttv_g_pixelaspect,
-	.vidioc_reqbufs                 = bttv_reqbufs,
-	.vidioc_querybuf                = bttv_querybuf,
-	.vidioc_qbuf                    = bttv_qbuf,
-	.vidioc_dqbuf                   = bttv_dqbuf,
+	.vidioc_reqbufs                 = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs             = vb2_ioctl_create_bufs,
+	.vidioc_querybuf                = vb2_ioctl_querybuf,
+	.vidioc_qbuf                    = vb2_ioctl_qbuf,
+	.vidioc_dqbuf                   = vb2_ioctl_dqbuf,
+	.vidioc_streamon                = vb2_ioctl_streamon,
+	.vidioc_streamoff               = vb2_ioctl_streamoff,
 	.vidioc_s_std                   = bttv_s_std,
 	.vidioc_g_std                   = bttv_g_std,
 	.vidioc_enum_input              = bttv_enum_input,
 	.vidioc_g_input                 = bttv_g_input,
 	.vidioc_s_input                 = bttv_s_input,
-	.vidioc_streamon                = bttv_streamon,
-	.vidioc_streamoff               = bttv_streamoff,
 	.vidioc_g_tuner                 = bttv_g_tuner,
 	.vidioc_s_tuner                 = bttv_s_tuner,
 	.vidioc_g_selection             = bttv_g_selection,
@@ -3021,17 +2663,19 @@ bttv_irq_next_video(struct bttv *btv, struct bttv_buffer_set *set)
 
 	/* capture request ? */
 	if (!list_empty(&btv->capture)) {
-		set->frame_irq = 1;
-		item = list_entry(btv->capture.next, struct bttv_buffer, vb.queue);
-		if (V4L2_FIELD_HAS_TOP(item->vb.field))
+		set->frame_irq = BT848_RISC_VIDEO;
+		item = list_entry(btv->capture.next, struct bttv_buffer, list);
+
+		if (V4L2_FIELD_HAS_TOP(item->vbuf.field))
 			set->top    = item;
-		if (V4L2_FIELD_HAS_BOTTOM(item->vb.field))
+		if (V4L2_FIELD_HAS_BOTTOM(item->vbuf.field))
 			set->bottom = item;
 
 		/* capture request for other field ? */
-		if (!V4L2_FIELD_HAS_BOTH(item->vb.field) &&
-		    (item->vb.queue.next != &btv->capture)) {
-			item = list_entry(item->vb.queue.next, struct bttv_buffer, vb.queue);
+		if (!V4L2_FIELD_HAS_BOTH(item->vbuf.field) &&
+		    item->list.next != &btv->capture) {
+			item = list_entry(item->list.next,
+					  struct bttv_buffer, list);
 			/* Mike Isely <isely@pobox.com> - Only check
 			 * and set up the bottom field in the logic
 			 * below.  Don't ever do the top field.  This
@@ -3059,13 +2703,18 @@ bttv_irq_next_video(struct bttv *btv, struct bttv_buffer_set *set)
 			 * sync within a single frame time.  (Out of
 			 * order fields can screw up deinterlacing
 			 * algorithms.) */
-			if (!V4L2_FIELD_HAS_BOTH(item->vb.field)) {
-				if (NULL == set->bottom &&
-				    V4L2_FIELD_BOTTOM == item->vb.field) {
+			if (!V4L2_FIELD_HAS_BOTH(item->vbuf.field)) {
+				if (!set->bottom &&
+				    item->vbuf.field == V4L2_FIELD_BOTTOM)
 					set->bottom = item;
+				if (set->top && set->bottom) {
+					/*
+					 * The buffer set has a top buffer and
+					 * a bottom buffer and they are not
+					 * copies of each other.
+					 */
+					set->top_irq = BT848_RISC_TOP;
 				}
-				if (NULL != set->top  &&  NULL != set->bottom)
-					set->top_irq = 2;
 			}
 		}
 	}
@@ -3087,44 +2736,47 @@ bttv_irq_wakeup_video(struct bttv *btv, struct bttv_buffer_set *wakeup,
 			if (irq_debug > 1)
 				pr_debug("%d: wakeup: both=%p\n",
 					 btv->c.nr, wakeup->top);
-			wakeup->top->vb.ts = ts;
-			wakeup->top->vb.field_count = btv->field_count;
-			wakeup->top->vb.state = state;
-			wake_up(&wakeup->top->vb.done);
+			wakeup->top->vbuf.vb2_buf.timestamp = ts;
+			wakeup->top->vbuf.sequence = btv->field_count >> 1;
+			vb2_buffer_done(&wakeup->top->vbuf.vb2_buf, state);
+			if (btv->field_count == 0)
+				btor(BT848_INT_VSYNC, BT848_INT_MASK);
 		}
 	} else {
 		if (NULL != wakeup->top && curr->top != wakeup->top) {
 			if (irq_debug > 1)
 				pr_debug("%d: wakeup: top=%p\n",
 					 btv->c.nr, wakeup->top);
-			wakeup->top->vb.ts = ts;
-			wakeup->top->vb.field_count = btv->field_count;
-			wakeup->top->vb.state = state;
-			wake_up(&wakeup->top->vb.done);
+			wakeup->top->vbuf.vb2_buf.timestamp = ts;
+			wakeup->top->vbuf.sequence = btv->field_count >> 1;
+			vb2_buffer_done(&wakeup->top->vbuf.vb2_buf, state);
+			if (btv->field_count == 0)
+				btor(BT848_INT_VSYNC, BT848_INT_MASK);
 		}
 		if (NULL != wakeup->bottom && curr->bottom != wakeup->bottom) {
 			if (irq_debug > 1)
 				pr_debug("%d: wakeup: bottom=%p\n",
 					 btv->c.nr, wakeup->bottom);
-			wakeup->bottom->vb.ts = ts;
-			wakeup->bottom->vb.field_count = btv->field_count;
-			wakeup->bottom->vb.state = state;
-			wake_up(&wakeup->bottom->vb.done);
+			wakeup->bottom->vbuf.vb2_buf.timestamp = ts;
+			wakeup->bottom->vbuf.sequence = btv->field_count >> 1;
+			vb2_buffer_done(&wakeup->bottom->vbuf.vb2_buf, state);
+			if (btv->field_count == 0)
+				btor(BT848_INT_VSYNC, BT848_INT_MASK);
 		}
 	}
 }
 
 static void
 bttv_irq_wakeup_vbi(struct bttv *btv, struct bttv_buffer *wakeup,
-		    unsigned int state)
+				unsigned int state)
 {
 	if (NULL == wakeup)
 		return;
-
-	wakeup->vb.ts = ktime_get_ns();
-	wakeup->vb.field_count = btv->field_count;
-	wakeup->vb.state = state;
-	wake_up(&wakeup->vb.done);
+	wakeup->vbuf.vb2_buf.timestamp = ktime_get_ns();
+	wakeup->vbuf.sequence = btv->field_count >> 1;
+	vb2_buffer_done(&wakeup->vbuf.vb2_buf, state);
+	if (btv->field_count == 0)
+		btor(BT848_INT_VSYNC, BT848_INT_MASK);
 }
 
 static void bttv_irq_timeout(struct timer_list *t)
@@ -3134,6 +2786,7 @@ static void bttv_irq_timeout(struct timer_list *t)
 	struct bttv_buffer *ovbi;
 	struct bttv_buffer *item;
 	unsigned long flags;
+	int seqnr = 0;
 
 	if (bttv_verbose) {
 		pr_info("%d: timeout: drop=%d irq=%d/%d, risc=%08x, ",
@@ -3157,21 +2810,25 @@ static void bttv_irq_timeout(struct timer_list *t)
 	bttv_set_dma(btv, 0);
 
 	/* wake up */
-	bttv_irq_wakeup_video(btv, &old, &new, VIDEOBUF_ERROR);
-	bttv_irq_wakeup_vbi(btv, ovbi, VIDEOBUF_ERROR);
+	bttv_irq_wakeup_video(btv, &old, &new, VB2_BUF_STATE_DONE);
+	bttv_irq_wakeup_vbi(btv, ovbi, VB2_BUF_STATE_DONE);
 
 	/* cancel all outstanding capture / vbi requests */
+	if (btv->field_count)
+		seqnr++;
 	while (!list_empty(&btv->capture)) {
-		item = list_entry(btv->capture.next, struct bttv_buffer, vb.queue);
-		list_del(&item->vb.queue);
-		item->vb.state = VIDEOBUF_ERROR;
-		wake_up(&item->vb.done);
+		item = list_entry(btv->capture.next, struct bttv_buffer, list);
+		list_del(&item->list);
+		item->vbuf.vb2_buf.timestamp = ktime_get_ns();
+		item->vbuf.sequence = (btv->field_count >> 1) + seqnr++;
+		vb2_buffer_done(&item->vbuf.vb2_buf, VB2_BUF_STATE_ERROR);
 	}
 	while (!list_empty(&btv->vcapture)) {
-		item = list_entry(btv->vcapture.next, struct bttv_buffer, vb.queue);
-		list_del(&item->vb.queue);
-		item->vb.state = VIDEOBUF_ERROR;
-		wake_up(&item->vb.done);
+		item = list_entry(btv->vcapture.next, struct bttv_buffer, list);
+		list_del(&item->list);
+		item->vbuf.vb2_buf.timestamp = ktime_get_ns();
+		item->vbuf.sequence = (btv->field_count >> 1) + seqnr++;
+		vb2_buffer_done(&item->vbuf.vb2_buf, VB2_BUF_STATE_ERROR);
 	}
 
 	btv->errors++;
@@ -3190,11 +2847,11 @@ bttv_irq_wakeup_top(struct bttv *btv)
 	btv->curr.top_irq = 0;
 	btv->curr.top = NULL;
 	bttv_risc_hook(btv, RISC_SLOT_O_FIELD, NULL, 0);
-
-	wakeup->vb.ts = ktime_get_ns();
-	wakeup->vb.field_count = btv->field_count;
-	wakeup->vb.state = VIDEOBUF_DONE;
-	wake_up(&wakeup->vb.done);
+	wakeup->vbuf.vb2_buf.timestamp = ktime_get_ns();
+	wakeup->vbuf.sequence = btv->field_count >> 1;
+	vb2_buffer_done(&wakeup->vbuf.vb2_buf, VB2_BUF_STATE_DONE);
+	if (btv->field_count == 0)
+		btor(BT848_INT_VSYNC, BT848_INT_MASK);
 	spin_unlock(&btv->s_lock);
 }
 
@@ -3231,7 +2888,7 @@ bttv_irq_switch_video(struct bttv *btv)
 	/* switch over */
 	old = btv->curr;
 	btv->curr = new;
-	btv->loop_irq &= ~1;
+	btv->loop_irq &= ~BT848_RISC_VIDEO;
 	bttv_buffer_activate_video(btv, &new);
 	bttv_set_dma(btv, 0);
 
@@ -3242,7 +2899,7 @@ bttv_irq_switch_video(struct bttv *btv)
 	}
 
 	/* wake up finished buffers */
-	bttv_irq_wakeup_video(btv, &old, &new, VIDEOBUF_DONE);
+	bttv_irq_wakeup_video(btv, &old, &new, VB2_BUF_STATE_DONE);
 	spin_unlock(&btv->s_lock);
 }
 
@@ -3256,7 +2913,7 @@ bttv_irq_switch_vbi(struct bttv *btv)
 	spin_lock(&btv->s_lock);
 
 	if (!list_empty(&btv->vcapture))
-		new = list_entry(btv->vcapture.next, struct bttv_buffer, vb.queue);
+		new = list_entry(btv->vcapture.next, struct bttv_buffer, list);
 	old = btv->cvbi;
 
 	rc = btread(BT848_RISC_COUNT);
@@ -3271,11 +2928,11 @@ bttv_irq_switch_vbi(struct bttv *btv)
 
 	/* switch */
 	btv->cvbi = new;
-	btv->loop_irq &= ~4;
+	btv->loop_irq &= ~BT848_RISC_VBI;
 	bttv_buffer_activate_vbi(btv, new);
 	bttv_set_dma(btv, 0);
 
-	bttv_irq_wakeup_vbi(btv, old, VIDEOBUF_DONE);
+	bttv_irq_wakeup_vbi(btv, old, VB2_BUF_STATE_DONE);
 	spin_unlock(&btv->s_lock);
 }
 
@@ -3334,13 +2991,13 @@ static irqreturn_t bttv_irq(int irq, void *dev_id)
 			wake_up(&btv->i2c_queue);
 		}
 
-		if ((astat & BT848_INT_RISCI)  &&  (stat & (4<<28)))
+		if ((astat & BT848_INT_RISCI) && (stat & BT848_INT_RISCS_VBI))
 			bttv_irq_switch_vbi(btv);
 
-		if ((astat & BT848_INT_RISCI)  &&  (stat & (2<<28)))
+		if ((astat & BT848_INT_RISCI) && (stat & BT848_INT_RISCS_TOP))
 			bttv_irq_wakeup_top(btv);
 
-		if ((astat & BT848_INT_RISCI)  &&  (stat & (1<<28)))
+		if ((astat & BT848_INT_RISCI) && (stat & BT848_INT_RISCS_VIDEO))
 			bttv_irq_switch_video(btv);
 
 		if ((astat & BT848_INT_HLOCK)  &&  btv->opt_automute)
@@ -3396,11 +3053,12 @@ static irqreturn_t bttv_irq(int irq, void *dev_id)
 /* ----------------------------------------------------------------------- */
 /* initialization                                                          */
 
-static void vdev_init(struct bttv *btv,
-		      struct video_device *vfd,
-		      const struct video_device *template,
-		      const char *type_name)
+static int vdev_init(struct bttv *btv, struct video_device *vfd,
+		     const struct video_device *template,
+		     const char *type_name)
 {
+	int err;
+	struct vb2_queue *q;
 	*vfd = *template;
 	vfd->v4l2_dev = &btv->c.v4l2_dev;
 	vfd->release = video_device_release_empty;
@@ -3414,6 +3072,36 @@ static void vdev_init(struct bttv *btv,
 		v4l2_disable_ioctl(vfd, VIDIOC_G_TUNER);
 		v4l2_disable_ioctl(vfd, VIDIOC_S_TUNER);
 	}
+
+	if (strcmp(type_name, "radio") == 0)
+		return 0;
+
+	if (strcmp(type_name, "video") == 0) {
+		q = &btv->capq;
+		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+		q->ops = &bttv_video_qops;
+	} else if (strcmp(type_name, "vbi") == 0) {
+		q = &btv->vbiq;
+		q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
+		q->ops = &bttv_vbi_qops;
+	} else {
+		return -EINVAL;
+	}
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
+	q->mem_ops = &vb2_dma_sg_memops;
+	q->drv_priv = btv;
+	q->gfp_flags = __GFP_DMA32;
+	q->buf_struct_size = sizeof(struct bttv_buffer);
+	q->lock = &btv->lock;
+	q->min_buffers_needed = 2;
+	q->dev = &btv->c.pci->dev;
+	err = vb2_queue_init(q);
+	if (err)
+		return err;
+	vfd->queue = q;
+
+	return 0;
 }
 
 static void bttv_unregister_video(struct bttv *btv)
@@ -3621,13 +3309,10 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	bttv_ctrl_coring.def = coring;
 
 	/* fill struct bttv with some useful defaults */
-	btv->init.btv         = btv;
-	btv->init.fmt         = format_by_fourcc(V4L2_PIX_FMT_BGR24);
-	btv->init.width       = 320;
-	btv->init.height      = 240;
 	btv->fmt = format_by_fourcc(V4L2_PIX_FMT_BGR24);
 	btv->width = 320;
 	btv->height = 240;
+	btv->field = V4L2_FIELD_INTERLACED;
 	btv->input = 0;
 	btv->tvnorm = 0; /* Index into bttv_tvnorms[] i.e. PAL. */
 	bttv_vbi_fmt_reset(&btv->vbi_fmt, btv->tvnorm);
@@ -3708,7 +3393,7 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 			result = btv->radio_ctrl_handler.error;
 			goto fail2;
 		}
-		set_input(btv, 0, btv->tvnorm);
+		set_input(btv, btv->input, btv->tvnorm);
 		bttv_crop_reset(&btv->crop[0], btv->tvnorm);
 		btv->crop[1] = btv->crop[0]; /* current = default */
 		disclaim_vbi_lines(btv);
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 3e0dac56de54..436baf6c8b08 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -67,8 +67,10 @@ bttv_risc_packed(struct bttv *btv, struct btcx_riscmem *risc,
 	/* scan lines */
 	sg = sglist;
 	for (line = 0; line < store_lines; line++) {
-		if ((btv->opt_vcr_hack) &&
-		    (line >= (store_lines - VCR_HACK_LINES)))
+		if ((line >= (store_lines - VCR_HACK_LINES)) &&
+		    (btv->opt_vcr_hack ||
+		    (V4L2_FIELD_HAS_BOTH(btv->field) ||
+		     btv->field == V4L2_FIELD_ALTERNATE)))
 			continue;
 		while (offset && offset >= sg_dma_len(sg)) {
 			offset -= sg_dma_len(sg);
@@ -363,13 +365,6 @@ bttv_apply_geo(struct bttv *btv, struct bttv_geometry *geo, int odd)
 static void bttv_set_risc_status(struct bttv *btv)
 {
 	unsigned long cmd = BT848_RISC_JUMP;
-	/*
-	 * The value of btv->loop_irq sets or resets the RISC_STATUS for video
-	 * and/or vbi by setting the value of bits [23:16] in the first dword
-	 * of the JUMP instruction:
-	 * video risc: set (1) and reset (~1)
-	 * vbi risc: set(4) and reset (~4)
-	 */
 	if (btv->loop_irq) {
 		cmd |= BT848_RISC_IRQ;
 		cmd |= (btv->loop_irq  & 0x0f) << 16;
@@ -410,7 +405,8 @@ static void bttv_start_dma(struct bttv *btv)
 	if (btv->dma_on)
 		return;
 	btwrite(btv->main.dma, BT848_RISC_STRT_ADD);
-	btor(0x3, BT848_GPIO_DMA_CTL);
+	btor(BT848_GPIO_DMA_CTL_RISC_ENABLE | BT848_GPIO_DMA_CTL_FIFO_ENABLE,
+	     BT848_GPIO_DMA_CTL);
 	btv->dma_on = 1;
 }
 
@@ -418,7 +414,8 @@ static void bttv_stop_dma(struct bttv *btv)
 {
 	if (!btv->dma_on)
 		return;
-	btand(~0x3, BT848_GPIO_DMA_CTL);
+	btand(~(BT848_GPIO_DMA_CTL_RISC_ENABLE |
+		BT848_GPIO_DMA_CTL_FIFO_ENABLE), BT848_GPIO_DMA_CTL);
 	btv->dma_on = 0;
 }
 
@@ -509,17 +506,50 @@ bttv_risc_hook(struct bttv *btv, int slot, struct btcx_riscmem *risc,
 	return 0;
 }
 
-void
-bttv_dma_free(struct videobuf_queue *q,struct bttv *btv, struct bttv_buffer *buf)
+int bttv_buffer_risc_vbi(struct bttv *btv, struct bttv_buffer *buf)
 {
-	struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
-
-	videobuf_waiton(q, &buf->vb, 0, 0);
-	videobuf_dma_unmap(q->dev, dma);
-	videobuf_dma_free(dma);
-	btcx_riscmem_free(btv->c.pci,&buf->bottom);
-	btcx_riscmem_free(btv->c.pci,&buf->top);
-	buf->vb.state = VIDEOBUF_NEEDS_INIT;
+	int r = 0;
+	unsigned int offset;
+	unsigned int bpl = 2044; /* max. vbipack */
+	unsigned int padding = VBI_BPL - bpl;
+	unsigned int skip_lines0 = 0;
+	unsigned int skip_lines1 = 0;
+	unsigned int min_vdelay = MIN_VDELAY;
+
+	const struct bttv_tvnorm *tvnorm = btv->vbi_fmt.tvnorm;
+	struct sg_table *sgt = vb2_dma_sg_plane_desc(&buf->vbuf.vb2_buf, 0);
+	struct scatterlist *list = sgt->sgl;
+
+	if (btv->vbi_fmt.fmt.count[0] > 0)
+		skip_lines0 = max(0, (btv->vbi_fmt.fmt.start[0] -
+					tvnorm->vbistart[0]));
+	if (btv->vbi_fmt.fmt.count[1] > 0)
+		skip_lines1 = max(0, (btv->vbi_fmt.fmt.start[1] -
+					tvnorm->vbistart[1]));
+
+	if (btv->vbi_fmt.fmt.count[0] > 0) {
+		r = bttv_risc_packed(btv, &buf->top, list, 0, bpl, padding,
+				     skip_lines0, btv->vbi_fmt.fmt.count[0]);
+		if (r)
+			return r;
+	}
+
+	if (btv->vbi_fmt.fmt.count[1] > 0) {
+		offset = btv->vbi_fmt.fmt.count[0] * VBI_BPL;
+		r = bttv_risc_packed(btv, &buf->bottom, list, offset, bpl,
+				     padding, skip_lines1,
+				     btv->vbi_fmt.fmt.count[1]);
+		if (r)
+			return r;
+	}
+
+	if (btv->vbi_fmt.end >= tvnorm->cropcap.bounds.top)
+		min_vdelay += btv->vbi_fmt.end - tvnorm->cropcap.bounds.top;
+
+	/* For bttv_buffer_activate_vbi(). */
+	buf->geo.vdelay = min_vdelay;
+
+	return r;
 }
 
 int
@@ -539,8 +569,7 @@ bttv_buffer_activate_vbi(struct bttv *btv,
 	if (vbi) {
 		unsigned int crop, vdelay;
 
-		vbi->vb.state = VIDEOBUF_ACTIVE;
-		list_del(&vbi->vb.queue);
+		list_del(&vbi->list);
 
 		/* VDELAY is start of video, end of VBI capturing. */
 		crop = btread(BT848_E_CROP);
@@ -581,16 +610,13 @@ bttv_buffer_activate_video(struct bttv *btv,
 	/* video capture */
 	if (NULL != set->top  &&  NULL != set->bottom) {
 		if (set->top == set->bottom) {
-			set->top->vb.state    = VIDEOBUF_ACTIVE;
-			if (set->top->vb.queue.next)
-				list_del(&set->top->vb.queue);
+			if (set->top->list.next)
+				list_del(&set->top->list);
 		} else {
-			set->top->vb.state    = VIDEOBUF_ACTIVE;
-			set->bottom->vb.state = VIDEOBUF_ACTIVE;
-			if (set->top->vb.queue.next)
-				list_del(&set->top->vb.queue);
-			if (set->bottom->vb.queue.next)
-				list_del(&set->bottom->vb.queue);
+			if (set->top->list.next)
+				list_del(&set->top->list);
+			if (set->bottom->list.next)
+				list_del(&set->bottom->list);
 		}
 		bttv_apply_geo(btv, &set->top->geo, 1);
 		bttv_apply_geo(btv, &set->bottom->geo,0);
@@ -603,9 +629,8 @@ bttv_buffer_activate_video(struct bttv *btv,
 		btaor((set->top->btswap & 0x0a) | (set->bottom->btswap & 0x05),
 		      ~0x0f, BT848_COLOR_CTL);
 	} else if (NULL != set->top) {
-		set->top->vb.state  = VIDEOBUF_ACTIVE;
-		if (set->top->vb.queue.next)
-			list_del(&set->top->vb.queue);
+		if (set->top->list.next)
+			list_del(&set->top->list);
 		bttv_apply_geo(btv, &set->top->geo,1);
 		bttv_apply_geo(btv, &set->top->geo,0);
 		bttv_risc_hook(btv, RISC_SLOT_O_FIELD, &set->top->top,
@@ -614,9 +639,8 @@ bttv_buffer_activate_video(struct bttv *btv,
 		btaor(set->top->btformat & 0xff, ~0xff, BT848_COLOR_FMT);
 		btaor(set->top->btswap & 0x0f,   ~0x0f, BT848_COLOR_CTL);
 	} else if (NULL != set->bottom) {
-		set->bottom->vb.state = VIDEOBUF_ACTIVE;
-		if (set->bottom->vb.queue.next)
-			list_del(&set->bottom->vb.queue);
+		if (set->bottom->list.next)
+			list_del(&set->bottom->list);
 		bttv_apply_geo(btv, &set->bottom->geo,1);
 		bttv_apply_geo(btv, &set->bottom->geo,0);
 		bttv_risc_hook(btv, RISC_SLOT_O_FIELD, NULL, 0);
@@ -637,58 +661,54 @@ bttv_buffer_activate_video(struct bttv *btv,
 int
 bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 {
+	int r = 0;
 	const struct bttv_tvnorm *tvnorm = bttv_tvnorms + btv->tvnorm;
-	struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
-
-	dprintk("%d: buffer field: %s  format: 0x%08x  size: %dx%d\n",
-		btv->c.nr, v4l2_field_names[buf->vb.field],
-		btv->fmt->fourcc, buf->vb.width, buf->vb.height);
+	struct sg_table *sgt = vb2_dma_sg_plane_desc(&buf->vbuf.vb2_buf, 0);
+	struct scatterlist *list = sgt->sgl;
+	unsigned long size = (btv->fmt->depth * btv->width * btv->height) >> 3;
 
 	/* packed pixel modes */
 	if (btv->fmt->flags & FORMAT_FLAGS_PACKED) {
-		int bpl = (btv->fmt->depth >> 3) * buf->vb.width;
-		int bpf = bpl * (buf->vb.height >> 1);
-
-		bttv_calc_geo(btv,&buf->geo,buf->vb.width,buf->vb.height,
-			      V4L2_FIELD_HAS_BOTH(buf->vb.field),
-			      tvnorm, &btv->crop[!!btv->do_crop].rect);
+		int bpl = (btv->fmt->depth >> 3) * btv->width;
+		int bpf = bpl * (btv->height >> 1);
 
-		switch (buf->vb.field) {
+		bttv_calc_geo(btv, &buf->geo, btv->width, btv->height,
+			      V4L2_FIELD_HAS_BOTH(buf->vbuf.field), tvnorm,
+			      &btv->crop[!!btv->do_crop].rect);
+		switch (buf->vbuf.field) {
 		case V4L2_FIELD_TOP:
-			bttv_risc_packed(btv,&buf->top,dma->sglist,
-					 /* offset */ 0,bpl,
-					 /* padding */ 0,/* skip_lines */ 0,
-					 buf->vb.height);
+			r = bttv_risc_packed(btv, &buf->top, list, 0, bpl, 0,
+					     0, btv->height);
 			break;
 		case V4L2_FIELD_BOTTOM:
-			bttv_risc_packed(btv,&buf->bottom,dma->sglist,
-					 0,bpl,0,0,buf->vb.height);
+			r = bttv_risc_packed(btv, &buf->bottom, list, 0, bpl,
+					     0, 0, btv->height);
 			break;
 		case V4L2_FIELD_INTERLACED:
-			bttv_risc_packed(btv,&buf->top,dma->sglist,
-					 0,bpl,bpl,0,buf->vb.height >> 1);
-			bttv_risc_packed(btv,&buf->bottom,dma->sglist,
-					 bpl,bpl,bpl,0,buf->vb.height >> 1);
+			r = bttv_risc_packed(btv, &buf->top, list, 0, bpl,
+					     bpl, 0, btv->height >> 1);
+			r = bttv_risc_packed(btv, &buf->bottom, list, bpl,
+					     bpl, bpl, 0, btv->height >> 1);
 			break;
 		case V4L2_FIELD_SEQ_TB:
-			bttv_risc_packed(btv,&buf->top,dma->sglist,
-					 0,bpl,0,0,buf->vb.height >> 1);
-			bttv_risc_packed(btv,&buf->bottom,dma->sglist,
-					 bpf,bpl,0,0,buf->vb.height >> 1);
+			r = bttv_risc_packed(btv, &buf->top, list, 0, bpl, 0,
+					     0, btv->height >> 1);
+			r = bttv_risc_packed(btv, &buf->bottom, list, bpf,
+					     bpl, 0, 0, btv->height >> 1);
 			break;
 		default:
 			WARN_ON(1);
+			return -EINVAL;
 		}
 	}
-
 	/* planar modes */
 	if (btv->fmt->flags & FORMAT_FLAGS_PLANAR) {
 		int uoffset, voffset;
 		int ypadding, cpadding, lines;
 
 		/* calculate chroma offsets */
-		uoffset = buf->vb.width * buf->vb.height;
-		voffset = buf->vb.width * buf->vb.height;
+		uoffset = btv->width * btv->height;
+		voffset = btv->width * btv->height;
 		if (btv->fmt->flags & FORMAT_FLAGS_CrCb) {
 			/* Y-Cr-Cb plane order */
 			uoffset >>= btv->fmt->hshift;
@@ -700,93 +720,87 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 			voffset >>= btv->fmt->vshift;
 			voffset  += uoffset;
 		}
-
-		switch (buf->vb.field) {
+		switch (buf->vbuf.field) {
 		case V4L2_FIELD_TOP:
-			bttv_calc_geo(btv,&buf->geo,buf->vb.width,
-				      buf->vb.height,/* both_fields */ 0,
-				      tvnorm, &btv->crop[!!btv->do_crop].rect);
-			bttv_risc_planar(btv, &buf->top, dma->sglist,
-					 0,buf->vb.width,0,buf->vb.height,
-					 uoffset, voffset, btv->fmt->hshift,
-					 btv->fmt->vshift, 0);
+			bttv_calc_geo(btv, &buf->geo, btv->width, btv->height,
+				      0, tvnorm,
+				      &btv->crop[!!btv->do_crop].rect);
+			r = bttv_risc_planar(btv, &buf->top, list, 0,
+					     btv->width, 0, btv->height,
+					     uoffset, voffset,
+					     btv->fmt->hshift,
+					     btv->fmt->vshift, 0);
 			break;
 		case V4L2_FIELD_BOTTOM:
-			bttv_calc_geo(btv,&buf->geo,buf->vb.width,
-				      buf->vb.height,0,
-				      tvnorm, &btv->crop[!!btv->do_crop].rect);
-			bttv_risc_planar(btv, &buf->bottom, dma->sglist,
-					 0,buf->vb.width,0,buf->vb.height,
-					 uoffset, voffset, btv->fmt->hshift,
-					 btv->fmt->vshift, 0);
+			bttv_calc_geo(btv, &buf->geo, btv->width, btv->height,
+				      0, tvnorm,
+				      &btv->crop[!!btv->do_crop].rect);
+			r = bttv_risc_planar(btv, &buf->bottom, list, 0,
+					     btv->width, 0, btv->height,
+					     uoffset, voffset,
+					     btv->fmt->hshift,
+					     btv->fmt->vshift, 0);
 			break;
 		case V4L2_FIELD_INTERLACED:
-			bttv_calc_geo(btv,&buf->geo,buf->vb.width,
-				      buf->vb.height,1,
-				      tvnorm, &btv->crop[!!btv->do_crop].rect);
-			lines    = buf->vb.height >> 1;
-			ypadding = buf->vb.width;
-			cpadding = buf->vb.width >> btv->fmt->hshift;
-			bttv_risc_planar(btv,&buf->top,
-					 dma->sglist,
-					 0,buf->vb.width,ypadding,lines,
-					 uoffset,voffset,
-					 btv->fmt->hshift,
-					 btv->fmt->vshift,
-					 cpadding);
-			bttv_risc_planar(btv,&buf->bottom,
-					 dma->sglist,
-					 ypadding,buf->vb.width,ypadding,lines,
-					 uoffset+cpadding,
-					 voffset+cpadding,
-					 btv->fmt->hshift,
-					 btv->fmt->vshift,
-					 cpadding);
+			bttv_calc_geo(btv, &buf->geo, btv->width, btv->height,
+				      1, tvnorm,
+				      &btv->crop[!!btv->do_crop].rect);
+			lines = btv->height >> 1;
+			ypadding = btv->width;
+			cpadding = btv->width >> btv->fmt->hshift;
+			r = bttv_risc_planar(btv, &buf->top, list, 0,
+					     btv->width, ypadding, lines,
+					     uoffset, voffset,
+					     btv->fmt->hshift,
+					     btv->fmt->vshift, cpadding);
+
+			r = bttv_risc_planar(btv, &buf->bottom, list,
+					     ypadding, btv->width, ypadding,
+					     lines,  uoffset + cpadding,
+					     voffset + cpadding,
+					     btv->fmt->hshift,
+					     btv->fmt->vshift, cpadding);
 			break;
 		case V4L2_FIELD_SEQ_TB:
-			bttv_calc_geo(btv,&buf->geo,buf->vb.width,
-				      buf->vb.height,1,
-				      tvnorm, &btv->crop[!!btv->do_crop].rect);
-			lines    = buf->vb.height >> 1;
-			ypadding = buf->vb.width;
-			cpadding = buf->vb.width >> btv->fmt->hshift;
-			bttv_risc_planar(btv,&buf->top,
-					 dma->sglist,
-					 0,buf->vb.width,0,lines,
-					 uoffset >> 1,
-					 voffset >> 1,
-					 btv->fmt->hshift,
-					 btv->fmt->vshift,
-					 0);
-			bttv_risc_planar(btv,&buf->bottom,
-					 dma->sglist,
-					 lines * ypadding,buf->vb.width,0,lines,
-					 lines * ypadding + (uoffset >> 1),
-					 lines * ypadding + (voffset >> 1),
-					 btv->fmt->hshift,
-					 btv->fmt->vshift,
-					 0);
+			bttv_calc_geo(btv, &buf->geo, btv->width, btv->height,
+				      1, tvnorm,
+				      &btv->crop[!!btv->do_crop].rect);
+			lines = btv->height >> 1;
+			ypadding = btv->width;
+			cpadding = btv->width >> btv->fmt->hshift;
+			r = bttv_risc_planar(btv, &buf->top, list, 0,
+					     btv->width, 0, lines,
+					     uoffset >> 1, voffset >> 1,
+					     btv->fmt->hshift,
+					     btv->fmt->vshift, 0);
+			r = bttv_risc_planar(btv, &buf->bottom, list,
+					     lines * ypadding,
+					     btv->width, 0, lines,
+					     lines * ypadding + (uoffset >> 1),
+					     lines * ypadding + (voffset >> 1),
+					     btv->fmt->hshift,
+					     btv->fmt->vshift, 0);
 			break;
 		default:
 			WARN_ON(1);
+			return -EINVAL;
 		}
 	}
-
 	/* raw data */
 	if (btv->fmt->flags & FORMAT_FLAGS_RAW) {
 		/* build risc code */
-		buf->vb.field = V4L2_FIELD_SEQ_TB;
-		bttv_calc_geo(btv,&buf->geo,tvnorm->swidth,tvnorm->sheight,
+		buf->vbuf.field = V4L2_FIELD_SEQ_TB;
+		bttv_calc_geo(btv, &buf->geo, tvnorm->swidth, tvnorm->sheight,
 			      1, tvnorm, &btv->crop[!!btv->do_crop].rect);
-		bttv_risc_packed(btv, &buf->top,  dma->sglist,
-				 /* offset */ 0, RAW_BPL, /* padding */ 0,
-				 /* skip_lines */ 0, RAW_LINES);
-		bttv_risc_packed(btv, &buf->bottom, dma->sglist,
-				 buf->vb.size/2 , RAW_BPL, 0, 0, RAW_LINES);
+		r = bttv_risc_packed(btv, &buf->top, list, 0, RAW_BPL, 0, 0,
+				     RAW_LINES);
+		r = bttv_risc_packed(btv, &buf->bottom, list, size / 2,
+				     RAW_BPL, 0, 0, RAW_LINES);
 	}
 
 	/* copy format info */
 	buf->btformat = btv->fmt->btformat;
 	buf->btswap   = btv->fmt->btswap;
-	return 0;
+
+	return r;
 }
diff --git a/drivers/media/pci/bt8xx/bttv-vbi.c b/drivers/media/pci/bt8xx/bttv-vbi.c
index 2fd990039adf..ab213e51ec95 100644
--- a/drivers/media/pci/bt8xx/bttv-vbi.c
+++ b/drivers/media/pci/bt8xx/bttv-vbi.c
@@ -34,16 +34,6 @@
    to be about 244.  */
 #define VBI_OFFSET 244
 
-/* 2048 for compatibility with earlier driver versions. The driver
-   really stores 1024 + tvnorm->vbipack * 4 samples per line in the
-   buffer. Note tvnorm->vbipack is <= 0xFF (limit of VBIPACK_LO + HI
-   is 0x1FF DWORDs) and VBI read()s store a frame counter in the last
-   four bytes of the VBI image. */
-#define VBI_BPL 2048
-
-/* Compatibility. */
-#define VBI_DEFLINES 16
-
 static unsigned int vbibufs = 4;
 static unsigned int vbi_debug;
 
@@ -67,165 +57,123 @@ do {									\
 /* ----------------------------------------------------------------------- */
 /* vbi risc code + mm                                                      */
 
-static int vbi_buffer_setup(struct videobuf_queue *q,
-			    unsigned int *count, unsigned int *size)
+static int queue_setup_vbi(struct vb2_queue *q, unsigned int *num_buffers,
+			   unsigned int *num_planes, unsigned int sizes[],
+			   struct device *alloc_devs[])
 {
-	struct bttv_fh *fh = q->priv_data;
-	struct bttv *btv = fh->btv;
-
-	if (0 == *count)
-		*count = vbibufs;
-
-	*size = IMAGE_SIZE(&fh->vbi_fmt.fmt);
+	struct bttv *btv = vb2_get_drv_priv(q);
+	unsigned int size = IMAGE_SIZE(&btv->vbi_fmt.fmt);
 
-	dprintk("setup: samples=%u start=%d,%d count=%u,%u\n",
-		fh->vbi_fmt.fmt.samples_per_line,
-		fh->vbi_fmt.fmt.start[0],
-		fh->vbi_fmt.fmt.start[1],
-		fh->vbi_fmt.fmt.count[0],
-		fh->vbi_fmt.fmt.count[1]);
+	if (*num_planes)
+		return sizes[0] < size ? -EINVAL : 0;
+	*num_planes = 1;
+	sizes[0] = size;
 
 	return 0;
 }
 
-static int vbi_buffer_prepare(struct videobuf_queue *q,
-			      struct videobuf_buffer *vb,
-			      enum v4l2_field field)
+static void buf_queue_vbi(struct vb2_buffer *vb)
 {
-	struct bttv_fh *fh = q->priv_data;
-	struct bttv *btv = fh->btv;
-	struct bttv_buffer *buf = container_of(vb,struct bttv_buffer,vb);
-	const struct bttv_tvnorm *tvnorm;
-	unsigned int skip_lines0, skip_lines1, min_vdelay;
-	int redo_dma_risc;
-	int rc;
-
-	buf->vb.size = IMAGE_SIZE(&fh->vbi_fmt.fmt);
-	if (0 != buf->vb.baddr  &&  buf->vb.bsize < buf->vb.size)
-		return -EINVAL;
-
-	tvnorm = fh->vbi_fmt.tvnorm;
-
-	/* There's no VBI_VDELAY register, RISC must skip the lines
-	   we don't want. With default parameters we skip zero lines
-	   as earlier driver versions did. The driver permits video
-	   standard changes while capturing, so we use vbi_fmt.tvnorm
-	   instead of btv->tvnorm to skip zero lines after video
-	   standard changes as well. */
-
-	skip_lines0 = 0;
-	skip_lines1 = 0;
-
-	if (fh->vbi_fmt.fmt.count[0] > 0)
-		skip_lines0 = max(0, (fh->vbi_fmt.fmt.start[0]
-				      - tvnorm->vbistart[0]));
-	if (fh->vbi_fmt.fmt.count[1] > 0)
-		skip_lines1 = max(0, (fh->vbi_fmt.fmt.start[1]
-				      - tvnorm->vbistart[1]));
-
-	redo_dma_risc = 0;
-
-	if (btv->vbi_skip[0] != skip_lines0 ||
-	    btv->vbi_skip[1] != skip_lines1 ||
-	    btv->vbi_count[0] != fh->vbi_fmt.fmt.count[0] ||
-	    btv->vbi_count[1] != fh->vbi_fmt.fmt.count[1]) {
-		btv->vbi_skip[0] = skip_lines0;
-		btv->vbi_skip[1] = skip_lines1;
-		btv->vbi_count[0] = fh->vbi_fmt.fmt.count[0];
-		btv->vbi_count[1] = fh->vbi_fmt.fmt.count[1];
-		redo_dma_risc = 1;
-	}
-
-	if (VIDEOBUF_NEEDS_INIT == buf->vb.state) {
-		redo_dma_risc = 1;
-		if (0 != (rc = videobuf_iolock(q, &buf->vb, NULL)))
-			goto fail;
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct bttv *btv = vb2_get_drv_priv(vq);
+	struct bttv_buffer *buf = container_of(vbuf, struct bttv_buffer, vbuf);
+	unsigned long flags;
+
+	spin_lock_irqsave(&btv->s_lock, flags);
+	if (list_empty(&btv->vcapture)) {
+		btv->loop_irq = BT848_RISC_VBI;
+		if (vb2_is_streaming(&btv->capq))
+			btv->loop_irq |= BT848_RISC_VIDEO;
+		bttv_set_dma(btv, BT848_CAP_CTL_CAPTURE_VBI_ODD |
+			     BT848_CAP_CTL_CAPTURE_VBI_EVEN);
 	}
+	list_add_tail(&buf->list, &btv->vcapture);
+	spin_unlock_irqrestore(&btv->s_lock, flags);
+}
 
-	if (redo_dma_risc) {
-		unsigned int bpl, padding, offset;
-		struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
-
-		bpl = 2044; /* max. vbipack */
-		padding = VBI_BPL - bpl;
-
-		if (fh->vbi_fmt.fmt.count[0] > 0) {
-			rc = bttv_risc_packed(btv, &buf->top,
-					      dma->sglist,
-					      /* offset */ 0, bpl,
-					      padding, skip_lines0,
-					      fh->vbi_fmt.fmt.count[0]);
-			if (0 != rc)
-				goto fail;
-		}
-
-		if (fh->vbi_fmt.fmt.count[1] > 0) {
-			offset = fh->vbi_fmt.fmt.count[0] * VBI_BPL;
+static int buf_prepare_vbi(struct vb2_buffer *vb)
+{
+	int ret = 0;
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct bttv *btv = vb2_get_drv_priv(vq);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct bttv_buffer *buf = container_of(vbuf, struct bttv_buffer, vbuf);
+	unsigned int size = IMAGE_SIZE(&btv->vbi_fmt.fmt);
+
+	if (vb2_plane_size(vb, 0) < size)
+		return -EINVAL;
+	vb2_set_plane_payload(vb, 0, size);
+	buf->vbuf.field = V4L2_FIELD_NONE;
+	ret = bttv_buffer_risc_vbi(btv, buf);
 
-			rc = bttv_risc_packed(btv, &buf->bottom,
-					      dma->sglist,
-					      offset, bpl,
-					      padding, skip_lines1,
-					      fh->vbi_fmt.fmt.count[1]);
-			if (0 != rc)
-				goto fail;
-		}
-	}
+	return ret;
+}
 
-	/* VBI capturing ends at VDELAY, start of video capturing,
-	   no matter where the RISC program ends. VDELAY minimum is 2,
-	   bounds.top is the corresponding first field line number
-	   times two. VDELAY counts half field lines. */
-	min_vdelay = MIN_VDELAY;
-	if (fh->vbi_fmt.end >= tvnorm->cropcap.bounds.top)
-		min_vdelay += fh->vbi_fmt.end - tvnorm->cropcap.bounds.top;
-
-	/* For bttv_buffer_activate_vbi(). */
-	buf->geo.vdelay = min_vdelay;
-
-	buf->vb.state = VIDEOBUF_PREPARED;
-	buf->vb.field = field;
-	dprintk("buf prepare %p: top=%p bottom=%p field=%s\n",
-		vb, &buf->top, &buf->bottom,
-		v4l2_field_names[buf->vb.field]);
-	return 0;
+static void buf_cleanup_vbi(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct bttv_buffer *buf = container_of(vbuf, struct bttv_buffer, vbuf);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct bttv *btv = vb2_get_drv_priv(vq);
 
- fail:
-	bttv_dma_free(q,btv,buf);
-	return rc;
+	btcx_riscmem_free(btv->c.pci, &buf->top);
+	btcx_riscmem_free(btv->c.pci, &buf->bottom);
 }
 
-static void
-vbi_buffer_queue(struct videobuf_queue *q, struct videobuf_buffer *vb)
+static int start_streaming_vbi(struct vb2_queue *q, unsigned int count)
 {
-	struct bttv_fh *fh = q->priv_data;
-	struct bttv *btv = fh->btv;
-	struct bttv_buffer *buf = container_of(vb,struct bttv_buffer,vb);
-
-	dprintk("queue %p\n",vb);
-	buf->vb.state = VIDEOBUF_QUEUED;
-	list_add_tail(&buf->vb.queue,&btv->vcapture);
-	if (NULL == btv->cvbi) {
-		fh->btv->loop_irq |= 4;
-		bttv_set_dma(btv,0x0c);
+	int ret;
+	int seqnr = 0;
+	struct bttv_buffer *buf;
+	struct bttv *btv = vb2_get_drv_priv(q);
+
+	btv->framedrop = 0;
+	ret = check_alloc_btres_lock(btv, RESOURCE_VBI);
+	if (ret == 0) {
+		if (btv->field_count)
+			seqnr++;
+		while (!list_empty(&btv->vcapture)) {
+			buf = list_entry(btv->vcapture.next,
+					 struct bttv_buffer, list);
+			list_del(&buf->list);
+			buf->vbuf.sequence = (btv->field_count >> 1) + seqnr++;
+			vb2_buffer_done(&buf->vbuf.vb2_buf,
+					VB2_BUF_STATE_QUEUED);
+		}
+		return !ret;
 	}
+	if (!vb2_is_streaming(&btv->capq)) {
+		init_irqreg(btv);
+		btv->field_count = 0;
+	}
+	return !ret;
 }
 
-static void vbi_buffer_release(struct videobuf_queue *q, struct videobuf_buffer *vb)
+static void stop_streaming_vbi(struct vb2_queue *q)
 {
-	struct bttv_fh *fh = q->priv_data;
-	struct bttv *btv = fh->btv;
-	struct bttv_buffer *buf = container_of(vb,struct bttv_buffer,vb);
-
-	dprintk("free %p\n",vb);
-	bttv_dma_free(q,fh->btv,buf);
+	struct bttv *btv = vb2_get_drv_priv(q);
+	unsigned long flags;
+
+	vb2_wait_for_all_buffers(q);
+	spin_lock_irqsave(&btv->s_lock, flags);
+	free_btres_lock(btv, RESOURCE_VBI);
+	if (!vb2_is_streaming(&btv->capq)) {
+		/* stop field counter */
+		btand(~BT848_INT_VSYNC, BT848_INT_MASK);
+	}
+	spin_unlock_irqrestore(&btv->s_lock, flags);
 }
 
-const struct videobuf_queue_ops bttv_vbi_qops = {
-	.buf_setup    = vbi_buffer_setup,
-	.buf_prepare  = vbi_buffer_prepare,
-	.buf_queue    = vbi_buffer_queue,
-	.buf_release  = vbi_buffer_release,
+const struct vb2_ops bttv_vbi_qops = {
+	.queue_setup    = queue_setup_vbi,
+	.buf_queue      = buf_queue_vbi,
+	.buf_prepare    = buf_prepare_vbi,
+	.buf_cleanup	= buf_cleanup_vbi,
+	.start_streaming = start_streaming_vbi,
+	.stop_streaming = stop_streaming_vbi,
+	.wait_prepare   = vb2_ops_wait_prepare,
+	.wait_finish    = vb2_ops_wait_finish,
 };
 
 /* ----------------------------------------------------------------------- */
@@ -316,7 +264,6 @@ int bttv_try_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 
 int bttv_s_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 {
-	struct bttv_fh *fh = f;
 	struct bttv *btv = video_drvdata(file);
 	const struct bttv_tvnorm *tvnorm;
 	__s32 start1, end;
@@ -325,7 +272,7 @@ int bttv_s_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 	mutex_lock(&btv->lock);
 
 	rc = -EBUSY;
-	if (fh->resources & RESOURCE_VBI)
+	if (btv->resources & RESOURCE_VBI)
 		goto fail;
 
 	tvnorm = &bttv_tvnorms[btv->tvnorm];
@@ -345,17 +292,10 @@ int bttv_s_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 	   because vbi_fmt.end counts field lines times two. */
 	end = max(frt->fmt.vbi.start[0], start1) * 2 + 2;
 
-	mutex_lock(&fh->vbi.vb_lock);
-
-	fh->vbi_fmt.fmt    = frt->fmt.vbi;
-	fh->vbi_fmt.tvnorm = tvnorm;
-	fh->vbi_fmt.end    = end;
 	btv->vbi_fmt.fmt = frt->fmt.vbi;
 	btv->vbi_fmt.tvnorm = tvnorm;
 	btv->vbi_fmt.end = end;
 
-	mutex_unlock(&fh->vbi.vb_lock);
-
 	rc = 0;
 
  fail:
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index b750dfbc75cc..0368a583cf07 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -26,7 +26,7 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fh.h>
-#include <media/videobuf-dma-sg.h>
+#include <media/videobuf2-dma-sg.h>
 #include <media/tveeprom.h>
 #include <media/rc-core.h>
 #include <media/i2c/ir-kbd-i2c.h>
@@ -142,7 +142,8 @@ struct bttv_geometry {
 
 struct bttv_buffer {
 	/* common v4l buffer stuff -- must be first */
-	struct videobuf_buffer     vb;
+	struct vb2_v4l2_buffer vbuf;
+	struct list_head list;
 
 	/* bttv specific */
 	int                        btformat;
@@ -171,6 +172,8 @@ struct bttv_vbi_fmt {
 };
 
 /* bttv-vbi.c */
+extern const struct vb2_ops bttv_vbi_qops;
+
 void bttv_vbi_fmt_reset(struct bttv_vbi_fmt *f, unsigned int norm);
 
 struct bttv_crop {
@@ -187,28 +190,6 @@ struct bttv_crop {
 	__s32                  max_scaled_height;
 };
 
-struct bttv_fh {
-	/* This must be the first field in this struct */
-	struct v4l2_fh		 fh;
-
-	struct bttv              *btv;
-	int resources;
-	enum v4l2_buf_type       type;
-
-	/* video capture */
-	struct videobuf_queue    cap;
-	const struct bttv_format *fmt;
-	int                      width;
-	int                      height;
-
-	/* vbi capture */
-	struct videobuf_queue    vbi;
-	/* Current VBI capture window as seen through this fh (cannot
-	   be global for compatibility with earlier drivers). Protected
-	   by struct bttv.lock and struct bttv_fh.vbi.lock. */
-	struct bttv_vbi_fmt      vbi_fmt;
-};
-
 /* ---------------------------------------------------------- */
 /* bttv-risc.c                                                */
 
@@ -229,22 +210,27 @@ int bttv_risc_hook(struct bttv *btv, int slot, struct btcx_riscmem *risc,
 int bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf);
 int bttv_buffer_activate_video(struct bttv *btv,
 			       struct bttv_buffer_set *set);
+int bttv_buffer_risc_vbi(struct bttv *btv, struct bttv_buffer *buf);
 int bttv_buffer_activate_vbi(struct bttv *btv,
 			     struct bttv_buffer *vbi);
-void bttv_dma_free(struct videobuf_queue *q, struct bttv *btv,
-		   struct bttv_buffer *buf);
 
 /* ---------------------------------------------------------- */
 /* bttv-vbi.c                                                 */
 
+/*
+ * 2048 for compatibility with earlier driver versions. The driver really
+ * stores 1024 + tvnorm->vbipack * 4 samples per line in the buffer. Note
+ * tvnorm->vbipack is <= 0xFF (limit of VBIPACK_LO + HI is 0x1FF DWORDs) and
+ * VBI read()s store a frame counter in the last four bytes of the VBI image.
+ */
+#define VBI_BPL 2048
+
 #define VBI_DEFLINES 16
 
 int bttv_try_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f);
 int bttv_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f);
 int bttv_s_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f);
 
-extern const struct videobuf_queue_ops bttv_vbi_qops;
-
 /* ---------------------------------------------------------- */
 /* bttv-gpio.c */
 
@@ -269,6 +255,8 @@ extern int fini_bttv_i2c(struct bttv *btv);
 extern unsigned int bttv_verbose;
 extern unsigned int bttv_debug;
 extern unsigned int bttv_gpio;
+int check_alloc_btres_lock(struct bttv *btv, int bit);
+void free_btres_lock(struct bttv *btv, int bits);
 extern void bttv_gpio_tracking(struct bttv *btv, char *comment);
 
 #define dprintk(fmt, ...)			\
@@ -390,7 +378,7 @@ struct bttv {
 	v4l2_std_id std;
 	int hue, contrast, bright, saturation;
 	struct v4l2_framebuffer fbuf;
-	unsigned int field_count;
+	__u32 field_count;
 
 	/* various options */
 	int opt_combfilter;
@@ -441,12 +429,21 @@ struct bttv {
 	unsigned int irq_me;
 
 	unsigned int users;
-	struct bttv_fh init;
+	struct v4l2_fh fh;
+	enum v4l2_buf_type type;
+
+	enum v4l2_field field;
+	int field_last;
+
+	/* video capture */
+	struct vb2_queue capq;
 	const struct bttv_format *fmt;
 	int width;
 	int height;
+
+	/* vbi capture */
+	struct vb2_queue vbiq;
 	struct bttv_vbi_fmt vbi_fmt;
-	unsigned int vbi_skip[2];
 	unsigned int vbi_count[2];
 
 	/* Application called VIDIOC_S_SELECTION. */
@@ -489,6 +486,8 @@ static inline unsigned int bttv_muxsel(const struct bttv *btv,
 
 #endif
 
+void init_irqreg(struct bttv *btv);
+
 #define btwrite(dat,adr)    writel((dat), btv->bt848_mmio+(adr))
 #define btread(adr)         readl(btv->bt848_mmio+(adr))
 
-- 
2.40.1

