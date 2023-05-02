Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352D76F3C64
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbjEBD2H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbjEBD2C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:28:02 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77767359A
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:28:01 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 48F3F660321C;
        Tue,  2 May 2023 04:27:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998080;
        bh=eR6jW2JSmMVRZxbsWD77VeJkh+ae+Pc55AedIfNbTUo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ipYC9C83LFRASRk6SyY0sOf779eGeJ3UG23KDW3i7mE5QoXTTAOKxqmXQrn14e3Fo
         Sgl8JQyY7Y2MkciOErtPWaVtVE5uYLNtCVza8cpbm5CDRDnOC2wB8HJYvq9KfwbNoC
         APbNoBqgIlwgiakrWH4dE1TEz1T/QRjmLYVbU+NR1DVyJBg7XOkVutSyvIM21UGmQS
         abxqZrVvS3qPmVy1uonpm3qgWTZrkVFcYx2esfJFIrGsgpgYA0INSe9huKha3GnRKe
         Mfnnkk0Yvs6eBj0kXRo0flQjOIqWutRwXJ6szEKXATqqj4Xx/BWSxGPQ9JfC6kuHQc
         /T3OiEoN3Bx1g==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 06/13] media: bttv: move do_crop flag out of bttv_fh
Date:   Mon,  1 May 2023 20:27:24 -0700
Message-Id: <a28eb01e41dd34ba8c5a742b1d05e329b302f222.1682995256.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682995256.git.deborah.brouwer@collabora.com>
References: <cover.1682995256.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The do_crop flag indicates whether a cropping rectangle has been set.
Instead of storing this flag separately in each file handle, move do_crop
to struct bttv in preparation for vb2 conversion which stops using
separate bttv file handles.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 24 +++++++++---------------
 drivers/media/pci/bt8xx/bttvp.h       |  5 ++---
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index f9a6f671277f..af295ce3e9f0 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -663,7 +663,7 @@ int check_alloc_btres_lock(struct bttv *btv, struct bttv_fh *fh, int bit)
 	if ((bit & VIDEO_RESOURCES)
 	    && 0 == (btv->resources & VIDEO_RESOURCES)) {
 		/* Do crop - use current, don't - use default parameters. */
-		__s32 top = btv->crop[!!fh->do_crop].rect.top;
+		__s32 top = btv->crop[!!btv->do_crop].rect.top;
 
 		if (btv->vbi_end > top)
 			goto fail;
@@ -1493,7 +1493,6 @@ static int bttv_prepare_buffer(struct videobuf_queue *q,struct bttv *btv,
 			       unsigned int width, unsigned int height,
 			       enum v4l2_field field)
 {
-	struct bttv_fh *fh = q->priv_data;
 	int redo_dma_risc = 0;
 	struct bttv_crop c;
 	int norm;
@@ -1523,7 +1522,7 @@ static int bttv_prepare_buffer(struct videobuf_queue *q,struct bttv *btv,
 		c.rect = bttv_tvnorms[norm].cropcap.defrect;
 	} else {
 		norm = btv->tvnorm;
-		c = btv->crop[!!fh->do_crop];
+		c = btv->crop[!!btv->do_crop];
 
 		if (width < c.min_scaled_width ||
 		    width > c.max_scaled_width ||
@@ -1919,9 +1918,9 @@ limit_scaled_size_lock       (struct bttv_fh *               fh,
 	b = &bttv_tvnorms[btv->tvnorm].cropcap.bounds;
 
 	/* Do crop - use current, don't - use default parameters. */
-	c = &btv->crop[!!fh->do_crop];
+	c = &btv->crop[!!btv->do_crop];
 
-	if (fh->do_crop
+	if (btv->do_crop
 	    && adjust_size
 	    && adjust_crop
 	    && !locked_btres(btv, VIDEO_RESOURCES)) {
@@ -2121,7 +2120,7 @@ static int bttv_try_fmt_vid_cap(struct file *file, void *priv,
 		}
 		fallthrough;
 	default: /* FIELD_ANY case */
-		height2 = btv->crop[!!fh->do_crop].rect.height >> 1;
+		height2 = btv->crop[!!btv->do_crop].rect.height >> 1;
 		field = (f->fmt.pix.height > height2)
 			? V4L2_FIELD_INTERLACED
 			: V4L2_FIELD_BOTTOM;
@@ -2360,7 +2359,6 @@ static int bttv_g_pixelaspect(struct file *file, void *priv,
 
 static int bttv_g_selection(struct file *file, void *f, struct v4l2_selection *sel)
 {
-	struct bttv_fh *fh = f;
 	struct bttv *btv = video_drvdata(file);
 
 	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -2368,12 +2366,7 @@ static int bttv_g_selection(struct file *file, void *f, struct v4l2_selection *s
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		/*
-		 * No fh->do_crop = 1; because btv->crop[1] may be
-		 * inconsistent with fh->width or fh->height and apps
-		 * do not expect a change here.
-		 */
-		sel->r = btv->crop[!!fh->do_crop].rect;
+		sel->r = btv->crop[!!btv->do_crop].rect;
 		break;
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 		sel->r = bttv_tvnorms[btv->tvnorm].cropcap.defrect;
@@ -2447,7 +2440,7 @@ static int bttv_s_selection(struct file *file, void *f, struct v4l2_selection *s
 
 	btv->crop[1] = c;
 
-	fh->do_crop = 1;
+	btv->do_crop = 1;
 
 	if (btv->width < c.min_scaled_width)
 		btv->width = c.min_scaled_width;
@@ -2610,7 +2603,7 @@ static int bttv_open(struct file *file)
 	   current video standard, and VIDIOC_S_FMT will not implicitly
 	   change the cropping parameters until VIDIOC_S_SELECTION has been
 	   called. */
-	fh->do_crop = !reset_crop; /* module parameter */
+	btv->do_crop = !reset_crop; /* module parameter */
 
 	/* Likewise there should be one global set of VBI capture
 	   parameters, but for compatibility with V4L apps and earlier
@@ -3639,6 +3632,7 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	btv->input = 0;
 	btv->tvnorm = 0; /* Index into bttv_tvnorms[] i.e. PAL. */
 	bttv_vbi_fmt_reset(&btv->vbi_fmt, btv->tvnorm);
+	btv->do_crop = 0;
 
 	v4l2_ctrl_new_std(hdl, &bttv_ctrl_ops,
 			V4L2_CID_BRIGHTNESS, 0, 0xff00, 0x100, 32768);
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index a36817dfaaec..48317c5935d1 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -206,9 +206,6 @@ struct bttv_fh {
 	int                      width;
 	int                      height;
 
-	/* Application called VIDIOC_S_SELECTION. */
-	int                      do_crop;
-
 	/* vbi capture */
 	struct videobuf_queue    vbi;
 	/* Current VBI capture window as seen through this fh (cannot
@@ -453,6 +450,8 @@ struct bttv {
 	int width;
 	int height;
 	struct bttv_vbi_fmt vbi_fmt;
+	/* Application called VIDIOC_S_SELECTION. */
+	int do_crop;
 
 	/* used to make dvb-bt8xx autoloadable */
 	struct work_struct request_module_wk;
-- 
2.39.2

