Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0286ED934
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbjDYAK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232845AbjDYAKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:10:55 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB3759C5
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:10:54 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 60CC06603299;
        Tue, 25 Apr 2023 01:10:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682381453;
        bh=9WZsPFlylwNRpBEUoer7NblJzonev87cFIJAj44ZLKQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LWE0RjnanOe2y4u84DCJzyUemYf4SBck2Z06bICx/pSd27fh9vP6ffDHvdDMLjV//
         8lDkDvguahVMD3zNgvMO4wY6NSd+2/XOkd6+oMjBgZTmCtcjM/akC0b91NjH+tsGRN
         R2ogIIJOH7aQaVfqXIwX1ysMAm9/z9c28Or6Ti/zLUIYk99NgEhfmSHzHphaBxfzMS
         5XvNuNYGok2bD5wHiTCeaVLpXVAKouJ6HQMQOvNtF/+9vYk+6+Bg6KYEPKw71UCH3f
         wv9zYGLLzgc93z3x6USAt/NrxKYM5TNDDrRBKyC7tNX9nsp9vnCABLcLAPsqqmOiJy
         1/sKpu9uUZUlA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 10/13] media: bttv: move vbi_skip/vbi_count out of buffer
Date:   Mon, 24 Apr 2023 17:10:09 -0700
Message-Id: <fc597cf3d0c94fe294ffb6c05f114b15e1f6a533.1682379348.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682379348.git.deborah.brouwer@collabora.com>
References: <cover.1682379348.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of storing vbi_skip and vbi_count in each bttv buffer separately,
move them to the main bttv struct as they won't change per buffer.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c |  2 ++
 drivers/media/pci/bt8xx/bttv-risc.c   |  4 ++--
 drivers/media/pci/bt8xx/bttv-vbi.c    | 16 ++++++++--------
 drivers/media/pci/bt8xx/bttvp.h       |  7 +++++--
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 15825fedb4e0..4d1e0743f193 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -3631,6 +3631,8 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	btv->input = 0;
 	btv->tvnorm = 0; /* Index into bttv_tvnorms[] i.e. PAL. */
 	bttv_vbi_fmt_reset(&btv->vbi_fmt, btv->tvnorm);
+	btv->vbi_count[0] = VBI_DEFLINES;
+	btv->vbi_count[1] = VBI_DEFLINES;
 	btv->do_crop = 0;
 
 	v4l2_ctrl_new_std(hdl, &bttv_ctrl_ops,
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index e9bc6bcc7333..97248e340a28 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -525,12 +525,12 @@ bttv_buffer_activate_vbi(struct bttv *btv,
 			btwrite(crop,	BT848_O_CROP);
 		}
 
-		if (vbi->vbi_count[0] > 0) {
+		if (btv->vbi_count[0] > 0) {
 			top = &vbi->top;
 			top_irq_flags = 4;
 		}
 
-		if (vbi->vbi_count[1] > 0) {
+		if (btv->vbi_count[1] > 0) {
 			top_irq_flags = 0;
 			bottom = &vbi->bottom;
 			bottom_irq_flags = 4;
diff --git a/drivers/media/pci/bt8xx/bttv-vbi.c b/drivers/media/pci/bt8xx/bttv-vbi.c
index 4e7fd9a78ace..2fd990039adf 100644
--- a/drivers/media/pci/bt8xx/bttv-vbi.c
+++ b/drivers/media/pci/bt8xx/bttv-vbi.c
@@ -125,14 +125,14 @@ static int vbi_buffer_prepare(struct videobuf_queue *q,
 
 	redo_dma_risc = 0;
 
-	if (buf->vbi_skip[0] != skip_lines0 ||
-	    buf->vbi_skip[1] != skip_lines1 ||
-	    buf->vbi_count[0] != fh->vbi_fmt.fmt.count[0] ||
-	    buf->vbi_count[1] != fh->vbi_fmt.fmt.count[1]) {
-		buf->vbi_skip[0] = skip_lines0;
-		buf->vbi_skip[1] = skip_lines1;
-		buf->vbi_count[0] = fh->vbi_fmt.fmt.count[0];
-		buf->vbi_count[1] = fh->vbi_fmt.fmt.count[1];
+	if (btv->vbi_skip[0] != skip_lines0 ||
+	    btv->vbi_skip[1] != skip_lines1 ||
+	    btv->vbi_count[0] != fh->vbi_fmt.fmt.count[0] ||
+	    btv->vbi_count[1] != fh->vbi_fmt.fmt.count[1]) {
+		btv->vbi_skip[0] = skip_lines0;
+		btv->vbi_skip[1] = skip_lines1;
+		btv->vbi_count[0] = fh->vbi_fmt.fmt.count[0];
+		btv->vbi_count[1] = fh->vbi_fmt.fmt.count[1];
 		redo_dma_risc = 1;
 	}
 
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index b5bb69ab8ab0..bce2401de9bd 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -150,8 +150,6 @@ struct bttv_buffer {
 	struct bttv_geometry       geo;
 	struct btcx_riscmem        top;
 	struct btcx_riscmem        bottom;
-	unsigned int               vbi_skip[2];
-	unsigned int               vbi_count[2];
 };
 
 struct bttv_buffer_set {
@@ -239,6 +237,8 @@ void bttv_dma_free(struct videobuf_queue *q, struct bttv *btv,
 /* ---------------------------------------------------------- */
 /* bttv-vbi.c                                                 */
 
+#define VBI_DEFLINES 16
+
 int bttv_try_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f);
 int bttv_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f);
 int bttv_s_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f);
@@ -447,6 +447,9 @@ struct bttv {
 	int width;
 	int height;
 	struct bttv_vbi_fmt vbi_fmt;
+	unsigned int vbi_skip[2];
+	unsigned int vbi_count[2];
+
 	/* Application called VIDIOC_S_SELECTION. */
 	int do_crop;
 
-- 
2.39.2

