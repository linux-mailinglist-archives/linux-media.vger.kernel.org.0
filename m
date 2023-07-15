Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 254DA75463C
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 04:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjGOCQl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 22:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjGOCQj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 22:16:39 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B574E30E7
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 19:16:38 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B392660702A;
        Sat, 15 Jul 2023 03:16:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689387397;
        bh=j82Lp7SbXUslIwAmmBvab9gMmC3w9B1I1wDCyhYQDEA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HK4Mo1fWbUVdFc0IxN63Y/KYYQhFg97eujPgd826zUMb9pWdVagg20lcs1GHg0Z6O
         Fcdw2MqfmfnvaWM1tr2IjTeSB3TmZyTqVySK7BjktaJeKnYq5fbyuTfcOxwo915DZN
         8hzkdD1rcutxTusKQq9y1+zzVIijp+F64UFtDfYG9DD/zckG9szD2gm6kZclC0TjFf
         W2ntUhlt2QDg8bWIqzg4PM9Z40nZhZ5m2UotO8kxzEiDkRiYLbTzo2OS30xDvUm7sH
         wrPUoeqm+I9idpLKjbDEDLHUZXH0d6u2tJKjX6otRX8wvyabQO8Zugc8kazP8YBo7v
         Qrt4k3HeugZZA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 09/13] media: bttv: remove crop info from bttv_buffer
Date:   Fri, 14 Jul 2023 19:16:05 -0700
Message-Id: <8df83bb7dfe7ac44bebd2c6fd68bf79482a2426f.1689379982.git.deborah.brouwer@collabora.com>
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
2.40.1

