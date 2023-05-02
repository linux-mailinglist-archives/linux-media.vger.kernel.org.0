Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F29F6F3C67
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233462AbjEBD2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbjEBD2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:28:07 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1350B3A93
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:28:06 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id DD6D6660321C;
        Tue,  2 May 2023 04:28:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998084;
        bh=G/mnDGt8/iXJzYAM4CvU6raAS/q/VpJkIaz/HN/98Ns=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DKXRjc9dnpw7/Bv1niHW28L+2iKI3bVg4sedKlvCblbFULSgcZjsHNNCN0ZoicXuF
         AgASbncHKMigvvUY2GnVfGff8Q3MIg1efAiBTxKkUEboMWsa9fs2N8mPBRTkqNK4Iu
         bUn6vw8FVmTJZFj8ziZl7V4BiMZ4nEobTYtXNNNnr1V708tuT3tEy9uLL5u4gaA8Vr
         qbP6wf0Cv3TgxdxJmt9WmL3PsjLUY3oVsU1zsv2KxKI7fZwmaR0SRuNcXEO8SSGGZ0
         zvyAqAlnBR+VAdMF+IKlxBKq0sSz6/M1jwcsJOMkKI+QYeIn2pTqofQBu+c7h6bosG
         bxuGXefDxbgPA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 09/13] media: bttv: remove crop info from bttv_buffer
Date:   Mon,  1 May 2023 20:27:27 -0700
Message-Id: <35c3dd77fb8f2efa2ceb37af50bc170cb9aa7301.1682995256.git.deborah.brouwer@collabora.com>
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

Instead of storing the cropping parameters in each bttv buffer separately,
just use the global bttv crop because it won't change per buffer.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 10 +++++-----
 drivers/media/pci/bt8xx/bttv-risc.c   | 12 ++++++------
 drivers/media/pci/bt8xx/bttvp.h       |  1 -
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index f32050849691..15825fedb4e0 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -1554,15 +1554,15 @@ static int bttv_prepare_buffer(struct videobuf_queue *q,struct bttv *btv,
 	if (buf->vb.width != width || buf->vb.height != height ||
 	    buf->vb.field != field ||
 	    btv->tvnorm != norm || btv->fmt != fmt ||
-	    buf->crop.top != c.rect.top ||
-	    buf->crop.left != c.rect.left ||
-	    buf->crop.width != c.rect.width ||
-	    buf->crop.height != c.rect.height) {
+	    btv->crop[!!btv->do_crop].rect.top != c.rect.top ||
+	    btv->crop[!!btv->do_crop].rect.left != c.rect.left ||
+	    btv->crop[!!btv->do_crop].rect.width != c.rect.width ||
+	    btv->crop[!!btv->do_crop].rect.height != c.rect.height) {
 		buf->vb.width  = width;
 		buf->vb.height = height;
 		buf->vb.field  = field;
 		btv->tvnorm    = norm;
-		buf->crop      = c.rect;
+		btv->crop[!!btv->do_crop].rect = c.rect;
 		redo_dma_risc = 1;
 	}
 
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 0a296dc1a7a5..e9bc6bcc7333 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -620,7 +620,7 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 
 		bttv_calc_geo(btv,&buf->geo,buf->vb.width,buf->vb.height,
 			      V4L2_FIELD_HAS_BOTH(buf->vb.field),
-			      tvnorm,&buf->crop);
+			      tvnorm, &btv->crop[!!btv->do_crop].rect);
 
 		switch (buf->vb.field) {
 		case V4L2_FIELD_TOP:
@@ -674,7 +674,7 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 		case V4L2_FIELD_TOP:
 			bttv_calc_geo(btv,&buf->geo,buf->vb.width,
 				      buf->vb.height,/* both_fields */ 0,
-				      tvnorm,&buf->crop);
+				      tvnorm, &btv->crop[!!btv->do_crop].rect);
 			bttv_risc_planar(btv, &buf->top, dma->sglist,
 					 0,buf->vb.width,0,buf->vb.height,
 					 uoffset, voffset, btv->fmt->hshift,
@@ -683,7 +683,7 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 		case V4L2_FIELD_BOTTOM:
 			bttv_calc_geo(btv,&buf->geo,buf->vb.width,
 				      buf->vb.height,0,
-				      tvnorm,&buf->crop);
+				      tvnorm, &btv->crop[!!btv->do_crop].rect);
 			bttv_risc_planar(btv, &buf->bottom, dma->sglist,
 					 0,buf->vb.width,0,buf->vb.height,
 					 uoffset, voffset, btv->fmt->hshift,
@@ -692,7 +692,7 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 		case V4L2_FIELD_INTERLACED:
 			bttv_calc_geo(btv,&buf->geo,buf->vb.width,
 				      buf->vb.height,1,
-				      tvnorm,&buf->crop);
+				      tvnorm, &btv->crop[!!btv->do_crop].rect);
 			lines    = buf->vb.height >> 1;
 			ypadding = buf->vb.width;
 			cpadding = buf->vb.width >> btv->fmt->hshift;
@@ -715,7 +715,7 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 		case V4L2_FIELD_SEQ_TB:
 			bttv_calc_geo(btv,&buf->geo,buf->vb.width,
 				      buf->vb.height,1,
-				      tvnorm,&buf->crop);
+				      tvnorm, &btv->crop[!!btv->do_crop].rect);
 			lines    = buf->vb.height >> 1;
 			ypadding = buf->vb.width;
 			cpadding = buf->vb.width >> btv->fmt->hshift;
@@ -746,7 +746,7 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 		/* build risc code */
 		buf->vb.field = V4L2_FIELD_SEQ_TB;
 		bttv_calc_geo(btv,&buf->geo,tvnorm->swidth,tvnorm->sheight,
-			      1,tvnorm,&buf->crop);
+			      1, tvnorm, &btv->crop[!!btv->do_crop].rect);
 		bttv_risc_packed(btv, &buf->top,  dma->sglist,
 				 /* offset */ 0, RAW_BPL, /* padding */ 0,
 				 /* skip_lines */ 0, RAW_LINES);
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index bbb5fc060fad..b5bb69ab8ab0 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -150,7 +150,6 @@ struct bttv_buffer {
 	struct bttv_geometry       geo;
 	struct btcx_riscmem        top;
 	struct btcx_riscmem        bottom;
-	struct v4l2_rect           crop;
 	unsigned int               vbi_skip[2];
 	unsigned int               vbi_count[2];
 };
-- 
2.39.2

