Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEF36F3C66
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbjEBD2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233460AbjEBD2G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:28:06 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8616B422C
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:28:04 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A93066032AB;
        Tue,  2 May 2023 04:28:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998083;
        bh=sL+Z8gsHtM7JRySLveKR32vG69HiawUkTAMkrc4uTeQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HDXqhcdUqa3drgDoaDpKhWXmq7LhnBpRVel+oX2DuqXmRgrTaMBYW2aJ6043dvei2
         6bOiBt9n6+xkfAkjVwgFcZRqpA8viMTkjcsM0RDMjbEmwuOsQ/p/8gyN7t6+fHE3+n
         7a6Tio6tJ8VV7djShmsPiN65FONzR2CYCawsr03Ae8JJVuzykuDUysMTF23mZNqvm3
         P3P7pakRjHpWtWEtPt0Soh5305B8Fp8TPiEO+52dgdodEc5YoexEvLp1APphLoKvG5
         H3a49mQlKaInzi5OjIX0P8JqRGsTj6ZdNtI9XicEWB26s5Kkt+cIE6Fr8nFm3/tl/4
         0jEGLiBbLhzwg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 08/13] media: bttv: remove tvnorm field from bttv_buffer
Date:   Mon,  1 May 2023 20:27:26 -0700
Message-Id: <7cff19bfbe0b7d6a584f766d1370f9485d88b8f6.1682995256.git.deborah.brouwer@collabora.com>
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
2.39.2

