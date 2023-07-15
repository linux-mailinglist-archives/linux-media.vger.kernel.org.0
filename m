Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4278775463B
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 04:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjGOCQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 22:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjGOCQi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 22:16:38 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0695B30E5
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 19:16:37 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A52556607064;
        Sat, 15 Jul 2023 03:16:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689387395;
        bh=PXjTwzUKql4ABD0JOsSCDJTJ8OM9HmU7tIb/h8hZiQk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S8CAmxjOg1EaFj2DgLfiBdcrDl0/fCHqzJVK/dCFCToQVQxkMVx/sJJAFwHVY3TuB
         YkoOlMaqlVRg1Hvc3Rued+W47OLVEC+i9WoECDGWhRhHBBH5k7eW5+25wc1yGoyr3s
         1pw1cr81bsRLnjCpzdR5WAkUqOJd4Z4PeDnXMrJ/oAdlFWdI6fmg3XscwxiqajHNDn
         ADtc5IyleNpEfCso/YK1viRZ2VHjUPEfrEwHo2OvNSARqzs+a6hgbDtPLsl83IgiyR
         wchQ5NjQnWIv3k6riqqSPp8U0Bi5TCWfc6TyiitrJbT89zjgC2ax2oH0jxzemqiE/p
         +pDykPotUbHCw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 08/13] media: bttv: remove tvnorm field from bttv_buffer
Date:   Fri, 14 Jul 2023 19:16:04 -0700
Message-Id: <3a5ee1d1ae0434be2d3987d8190a340e0a06a6b4.1689379982.git.deborah.brouwer@collabora.com>
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

Instead of storing the tvnorm in each bttv buffer separately, just use the
global bttv tvnorm because the tvnorm does not change per buffer.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 4 ++--
 drivers/media/pci/bt8xx/bttv-risc.c   | 2 +-
 drivers/media/pci/bt8xx/bttvp.h       | 1 -
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 0032e1436111..f32050849691 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -1553,7 +1553,7 @@ static int bttv_prepare_buffer(struct videobuf_queue *q,struct bttv *btv,
 	/* alloc + fill struct bttv_buffer (if changed) */
 	if (buf->vb.width != width || buf->vb.height != height ||
 	    buf->vb.field != field ||
-	    buf->tvnorm != norm || btv->fmt != fmt ||
+	    btv->tvnorm != norm || btv->fmt != fmt ||
 	    buf->crop.top != c.rect.top ||
 	    buf->crop.left != c.rect.left ||
 	    buf->crop.width != c.rect.width ||
@@ -1561,7 +1561,7 @@ static int bttv_prepare_buffer(struct videobuf_queue *q,struct bttv *btv,
 		buf->vb.width  = width;
 		buf->vb.height = height;
 		buf->vb.field  = field;
-		buf->tvnorm    = norm;
+		btv->tvnorm    = norm;
 		buf->crop      = c.rect;
 		redo_dma_risc = 1;
 	}
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 67ea7ed42623..0a296dc1a7a5 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -606,7 +606,7 @@ bttv_buffer_activate_video(struct bttv *btv,
 int
 bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 {
-	const struct bttv_tvnorm *tvnorm = bttv_tvnorms + buf->tvnorm;
+	const struct bttv_tvnorm *tvnorm = bttv_tvnorms + btv->tvnorm;
 	struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
 
 	dprintk("%d: buffer field: %s  format: 0x%08x  size: %dx%d\n",
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index 402fe1f1846e..bbb5fc060fad 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -145,7 +145,6 @@ struct bttv_buffer {
 	struct videobuf_buffer     vb;
 
 	/* bttv specific */
-	unsigned int               tvnorm;
 	int                        btformat;
 	int                        btswap;
 	struct bttv_geometry       geo;
-- 
2.40.1

