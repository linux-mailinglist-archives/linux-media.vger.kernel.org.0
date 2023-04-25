Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61F56ED933
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbjDYAK5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbjDYAKy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:10:54 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECAD9ED1
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:10:52 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5517D6603298;
        Tue, 25 Apr 2023 01:10:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682381451;
        bh=G/mnDGt8/iXJzYAM4CvU6raAS/q/VpJkIaz/HN/98Ns=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ai2kmCOWyL3NqPiviq+1B8xzFtyFAJ8m/TdqvCKAY5qusqn4ywnHH2U0NKSP2aCNh
         4u1VeVk8Gk6AClO6tV+9iQvATVwBkLHj8ONypcMws9OOG2idJZnOqXiii/Um6X+UCx
         rUfEeCKsRHHHX+vLI40Efg3cvot4zxmDc2dFIcYPy0BSxV0VYthKFtD7pm5ZLbsVTM
         sk/WUSxExORzV9jFGe28xL4V4lA51Wcs2swTb+4ozhL6QevJzEDORcv8JLH52of+RG
         mU4fV1yQKtDyH8AUW0LNBUDLiq3wXfCLmripY0PAoOqI/rpux1Uj/UozBYwWTQexPb
         N/Y8xaAX/m8TQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 09/13] media: bttv: remove crop info from bttv_buffer
Date:   Mon, 24 Apr 2023 17:10:08 -0700
Message-Id: <b6136f4b4e1f0c67b498e4e6687f44649966ea92.1682379348.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682379348.git.deborah.brouwer@collabora.com>
References: <cover.1682379348.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
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

