Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 519C26F3C65
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbjEBD2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbjEBD2E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:28:04 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A2740FC
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:28:02 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CBAB1660562D;
        Tue,  2 May 2023 04:28:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998081;
        bh=1QZpNrhm0JlPWP1nOATr6mcH3vjREUWeaSFzFIYGdVs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bCPfk6a9PRZd/2KMeFmigt/a7w/7AmphyPYYbjM4ncyQAm6graaeZldDvkJHxHzzC
         aylH4yr9HKwtFRRmk36YyzFdwpBMB3kVOBdoBUKfDQX7zRv3dX5objOhy+3TsY9HWP
         qtKHTF9e2KvCMIqNlqtgIYxsvWfKRIVCuT3cgzHni79URADMwQxdbk1HBk3REb94Au
         qW7HWTgpPKtUJ4SeY+18AqJa0uOmxxGFCqoTSLkuCwS3goFV9YQdUuBruootURz0eM
         Hc0b3f9/twfNxIIJ3/2u/ATcUNoTCRU5BaY/W3S/fKxFXvc2vttuYK4+s2c9QSXo8Z
         LjxD+gh0DZYpg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 07/13] media: bttv: remove format field from bttv_buffer
Date:   Mon,  1 May 2023 20:27:25 -0700
Message-Id: <58cf7f2168a597992c0816c54cfefa5d63c382cc.1682995256.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682995256.git.deborah.brouwer@collabora.com>
References: <cover.1682995256.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of storing the format (video or vbi) in each bttv buffer
separately, just use the global bttv format because the format does not
change per buffer.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c |  3 +-
 drivers/media/pci/bt8xx/bttv-risc.c   | 52 +++++++++++++--------------
 drivers/media/pci/bt8xx/bttvp.h       |  1 -
 3 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index af295ce3e9f0..0032e1436111 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -1553,7 +1553,7 @@ static int bttv_prepare_buffer(struct videobuf_queue *q,struct bttv *btv,
 	/* alloc + fill struct bttv_buffer (if changed) */
 	if (buf->vb.width != width || buf->vb.height != height ||
 	    buf->vb.field != field ||
-	    buf->tvnorm != norm || buf->fmt != fmt ||
+	    buf->tvnorm != norm || btv->fmt != fmt ||
 	    buf->crop.top != c.rect.top ||
 	    buf->crop.left != c.rect.left ||
 	    buf->crop.width != c.rect.width ||
@@ -1562,7 +1562,6 @@ static int bttv_prepare_buffer(struct videobuf_queue *q,struct bttv *btv,
 		buf->vb.height = height;
 		buf->vb.field  = field;
 		buf->tvnorm    = norm;
-		buf->fmt       = fmt;
 		buf->crop      = c.rect;
 		redo_dma_risc = 1;
 	}
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index fae8b10de7a9..67ea7ed42623 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -611,11 +611,11 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 
 	dprintk("%d: buffer field: %s  format: 0x%08x  size: %dx%d\n",
 		btv->c.nr, v4l2_field_names[buf->vb.field],
-		buf->fmt->fourcc, buf->vb.width, buf->vb.height);
+		btv->fmt->fourcc, buf->vb.width, buf->vb.height);
 
 	/* packed pixel modes */
-	if (buf->fmt->flags & FORMAT_FLAGS_PACKED) {
-		int bpl = (buf->fmt->depth >> 3) * buf->vb.width;
+	if (btv->fmt->flags & FORMAT_FLAGS_PACKED) {
+		int bpl = (btv->fmt->depth >> 3) * buf->vb.width;
 		int bpf = bpl * (buf->vb.height >> 1);
 
 		bttv_calc_geo(btv,&buf->geo,buf->vb.width,buf->vb.height,
@@ -651,22 +651,22 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 	}
 
 	/* planar modes */
-	if (buf->fmt->flags & FORMAT_FLAGS_PLANAR) {
+	if (btv->fmt->flags & FORMAT_FLAGS_PLANAR) {
 		int uoffset, voffset;
 		int ypadding, cpadding, lines;
 
 		/* calculate chroma offsets */
 		uoffset = buf->vb.width * buf->vb.height;
 		voffset = buf->vb.width * buf->vb.height;
-		if (buf->fmt->flags & FORMAT_FLAGS_CrCb) {
+		if (btv->fmt->flags & FORMAT_FLAGS_CrCb) {
 			/* Y-Cr-Cb plane order */
-			uoffset >>= buf->fmt->hshift;
-			uoffset >>= buf->fmt->vshift;
+			uoffset >>= btv->fmt->hshift;
+			uoffset >>= btv->fmt->vshift;
 			uoffset  += voffset;
 		} else {
 			/* Y-Cb-Cr plane order */
-			voffset >>= buf->fmt->hshift;
-			voffset >>= buf->fmt->vshift;
+			voffset >>= btv->fmt->hshift;
+			voffset >>= btv->fmt->vshift;
 			voffset  += uoffset;
 		}
 
@@ -677,8 +677,8 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 				      tvnorm,&buf->crop);
 			bttv_risc_planar(btv, &buf->top, dma->sglist,
 					 0,buf->vb.width,0,buf->vb.height,
-					 uoffset,voffset,buf->fmt->hshift,
-					 buf->fmt->vshift,0);
+					 uoffset, voffset, btv->fmt->hshift,
+					 btv->fmt->vshift, 0);
 			break;
 		case V4L2_FIELD_BOTTOM:
 			bttv_calc_geo(btv,&buf->geo,buf->vb.width,
@@ -686,8 +686,8 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 				      tvnorm,&buf->crop);
 			bttv_risc_planar(btv, &buf->bottom, dma->sglist,
 					 0,buf->vb.width,0,buf->vb.height,
-					 uoffset,voffset,buf->fmt->hshift,
-					 buf->fmt->vshift,0);
+					 uoffset, voffset, btv->fmt->hshift,
+					 btv->fmt->vshift, 0);
 			break;
 		case V4L2_FIELD_INTERLACED:
 			bttv_calc_geo(btv,&buf->geo,buf->vb.width,
@@ -695,21 +695,21 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 				      tvnorm,&buf->crop);
 			lines    = buf->vb.height >> 1;
 			ypadding = buf->vb.width;
-			cpadding = buf->vb.width >> buf->fmt->hshift;
+			cpadding = buf->vb.width >> btv->fmt->hshift;
 			bttv_risc_planar(btv,&buf->top,
 					 dma->sglist,
 					 0,buf->vb.width,ypadding,lines,
 					 uoffset,voffset,
-					 buf->fmt->hshift,
-					 buf->fmt->vshift,
+					 btv->fmt->hshift,
+					 btv->fmt->vshift,
 					 cpadding);
 			bttv_risc_planar(btv,&buf->bottom,
 					 dma->sglist,
 					 ypadding,buf->vb.width,ypadding,lines,
 					 uoffset+cpadding,
 					 voffset+cpadding,
-					 buf->fmt->hshift,
-					 buf->fmt->vshift,
+					 btv->fmt->hshift,
+					 btv->fmt->vshift,
 					 cpadding);
 			break;
 		case V4L2_FIELD_SEQ_TB:
@@ -718,22 +718,22 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 				      tvnorm,&buf->crop);
 			lines    = buf->vb.height >> 1;
 			ypadding = buf->vb.width;
-			cpadding = buf->vb.width >> buf->fmt->hshift;
+			cpadding = buf->vb.width >> btv->fmt->hshift;
 			bttv_risc_planar(btv,&buf->top,
 					 dma->sglist,
 					 0,buf->vb.width,0,lines,
 					 uoffset >> 1,
 					 voffset >> 1,
-					 buf->fmt->hshift,
-					 buf->fmt->vshift,
+					 btv->fmt->hshift,
+					 btv->fmt->vshift,
 					 0);
 			bttv_risc_planar(btv,&buf->bottom,
 					 dma->sglist,
 					 lines * ypadding,buf->vb.width,0,lines,
 					 lines * ypadding + (uoffset >> 1),
 					 lines * ypadding + (voffset >> 1),
-					 buf->fmt->hshift,
-					 buf->fmt->vshift,
+					 btv->fmt->hshift,
+					 btv->fmt->vshift,
 					 0);
 			break;
 		default:
@@ -742,7 +742,7 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 	}
 
 	/* raw data */
-	if (buf->fmt->flags & FORMAT_FLAGS_RAW) {
+	if (btv->fmt->flags & FORMAT_FLAGS_RAW) {
 		/* build risc code */
 		buf->vb.field = V4L2_FIELD_SEQ_TB;
 		bttv_calc_geo(btv,&buf->geo,tvnorm->swidth,tvnorm->sheight,
@@ -755,7 +755,7 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 	}
 
 	/* copy format info */
-	buf->btformat = buf->fmt->btformat;
-	buf->btswap   = buf->fmt->btswap;
+	buf->btformat = btv->fmt->btformat;
+	buf->btswap   = btv->fmt->btswap;
 	return 0;
 }
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index 48317c5935d1..402fe1f1846e 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -145,7 +145,6 @@ struct bttv_buffer {
 	struct videobuf_buffer     vb;
 
 	/* bttv specific */
-	const struct bttv_format   *fmt;
 	unsigned int               tvnorm;
 	int                        btformat;
 	int                        btswap;
-- 
2.39.2

