Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B3B6ED931
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbjDYAKz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbjDYAKw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:10:52 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4323093C1
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:10:50 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id F25946603299;
        Tue, 25 Apr 2023 01:10:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682381449;
        bh=sL+Z8gsHtM7JRySLveKR32vG69HiawUkTAMkrc4uTeQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EaTYHoeRioSXm+kQaiTIRGwzqCaTTL5xsCrA3z0PldHtOC6AzeLv3DlnmyJC471T/
         eDmVUCzAS3Zpk+m4uxXLLwJpYLB+j8l+NU2zI0mDe1CV+4XngQbj6NKx6DOeCutkLn
         BSLK9V6uWoyJJcLkANZQpreSqGvs7QyABgT6iQYLGIql/UX0aeR3OLIBngltEThtaz
         UkiANdA9WyiMEh7zwn6Yyre1/zi30bDa+i+kWMX5L0ui5w31XhimVPU5bMboaiAJzB
         YcN6g40zK2/Ex7ysO/G3dcx4IwojxVzEIfWqc0QcptbuZSiOVA5xHY169coEGC4V7y
         LOK95D2YngvlQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 08/13] media: bttv: remove tvnorm field from bttv_buffer
Date:   Mon, 24 Apr 2023 17:10:07 -0700
Message-Id: <49853a07cdcab64dd94ed6584382f530b429eb8d.1682379348.git.deborah.brouwer@collabora.com>
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

