Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C513775463A
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 04:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjGOCQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 22:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjGOCQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 22:16:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BEA2D68
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 19:16:35 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E4B01660705F;
        Sat, 15 Jul 2023 03:16:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689387394;
        bh=u36ewo2XovhKw4CnteI0K59shJBdi9rIMW7Pa29QWDQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h0nNuJ7SO1jYLyl01y1BNXkEhk5JckYckDJCubhumTagbKcZrW6PgsdkPuBxtBGs6
         y4r3lXQCbB9LMZ/g+qVQKPpaULrSSXRnBfVq+RAzW7jBkVqVXX2Vo2prpqy5wAqhSv
         ryQiKx+jfrR3BBvgwYHmW9EAewdSQVOJuygfUBP1ekiNXQyLZbCI9Wp0qsu9amm7XZ
         xPexZeb4T4MjNOO2niybzAuDpyjJ0g0oI2WDvLLG0RKEfXGsJTXFIejZLwXJk6a8n1
         1E5s4iU7IWTcS2zLgCVY5wNyQBCEvs3+ev1FAclnbqzw8JP7qjoFATc0tzldG07sT9
         egFMH+DtUxx3A==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 07/13] media: bttv: remove format field from bttv_buffer
Date:   Fri, 14 Jul 2023 19:16:03 -0700
Message-Id: <e1dc82e176ae18038dd3b8919422961d630325dd.1689379982.git.deborah.brouwer@collabora.com>
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
2.40.1

