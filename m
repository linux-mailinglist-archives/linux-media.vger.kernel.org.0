Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0866ED92C
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbjDYAKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbjDYAKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:10:43 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5635585
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:10:42 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 333576603298;
        Tue, 25 Apr 2023 01:10:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682381441;
        bh=zzHbePysJFBW1ioll/eeza50zLmcNdE/YbbXU5ESgW8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IyP5eO+cN5SzTCiZxFb654BwoCb+jlMQMAA99a4V7NH7ZrB/3/fCIbYNU1qZkjoSa
         SI+C2EvQaxTIWFDDPA8cPd///ifrFbXSLSS860xHoYmUCcP1CNCV8fQq52OcyeRkL3
         gfW/85Q0ojd5ltcdoAWHcOYJWtoE+KKsQ3go33PMvq7zSFTgQg10ht1rw8BZYr8AX/
         VYUt/ZdMY9LaOlysozzzC05KMPntE555W9KaTYzZnVgzM88qb3aRorq9htM4wZ8+na
         9tB48iWDMoffAPLU4MvcYlwkj5xsXa1VqfL0/hZ6AjVeKLhS0s9MyZIiSku8k3V0EK
         f4+DaK7rE7m9Q==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 05/13] media: bttv: move vbi_fmt out of bttv_fh
Date:   Mon, 24 Apr 2023 17:10:04 -0700
Message-Id: <4fae9680304826ba67302e44bdc3cf2bd8da39e9.1682379348.git.deborah.brouwer@collabora.com>
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

Instead of storing vbi format separately in each file handle, move the vbi
format to the main struct bttv. Use it wherever possible in preparation
for vb2 conversion which stops using separate bttv file handles.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c |  6 ++++--
 drivers/media/pci/bt8xx/bttv-vbi.c    | 13 +++++++------
 drivers/media/pci/bt8xx/bttvp.h       |  1 +
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 7e7658a7ed40..f9a6f671277f 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -672,12 +672,12 @@ int check_alloc_btres_lock(struct bttv *btv, struct bttv_fh *fh, int bit)
 		   Claim scan lines crop[].rect.top to bottom. */
 		btv->crop_start = top;
 	} else if (bit & VBI_RESOURCES) {
-		__s32 end = fh->vbi_fmt.end;
+		__s32 end = btv->vbi_fmt.end;
 
 		if (end > btv->crop_start)
 			goto fail;
 
-		/* Claim scan lines above fh->vbi_fmt.end. */
+		/* Claim scan lines above btv->vbi_fmt.end. */
 		btv->vbi_end = end;
 	}
 
@@ -3637,6 +3637,8 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	btv->width = 320;
 	btv->height = 240;
 	btv->input = 0;
+	btv->tvnorm = 0; /* Index into bttv_tvnorms[] i.e. PAL. */
+	bttv_vbi_fmt_reset(&btv->vbi_fmt, btv->tvnorm);
 
 	v4l2_ctrl_new_std(hdl, &bttv_ctrl_ops,
 			V4L2_CID_BRIGHTNESS, 0, 0xff00, 0x100, 32768);
diff --git a/drivers/media/pci/bt8xx/bttv-vbi.c b/drivers/media/pci/bt8xx/bttv-vbi.c
index 0b05309d1fb7..4e7fd9a78ace 100644
--- a/drivers/media/pci/bt8xx/bttv-vbi.c
+++ b/drivers/media/pci/bt8xx/bttv-vbi.c
@@ -350,6 +350,9 @@ int bttv_s_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 	fh->vbi_fmt.fmt    = frt->fmt.vbi;
 	fh->vbi_fmt.tvnorm = tvnorm;
 	fh->vbi_fmt.end    = end;
+	btv->vbi_fmt.fmt = frt->fmt.vbi;
+	btv->vbi_fmt.tvnorm = tvnorm;
+	btv->vbi_fmt.end = end;
 
 	mutex_unlock(&fh->vbi.vb_lock);
 
@@ -364,15 +367,14 @@ int bttv_s_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 
 int bttv_g_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 {
-	struct bttv_fh *fh = f;
 	const struct bttv_tvnorm *tvnorm;
 	struct bttv *btv = video_drvdata(file);
 
-	frt->fmt.vbi = fh->vbi_fmt.fmt;
+	frt->fmt.vbi = btv->vbi_fmt.fmt;
 
 	tvnorm = &bttv_tvnorms[btv->tvnorm];
 
-	if (tvnorm != fh->vbi_fmt.tvnorm) {
+	if (tvnorm != btv->vbi_fmt.tvnorm) {
 		__s32 max_end;
 		unsigned int i;
 
@@ -388,9 +390,8 @@ int bttv_g_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 		for (i = 0; i < 2; ++i) {
 			__s32 new_start;
 
-			new_start = frt->fmt.vbi.start[i]
-				+ tvnorm->vbistart[i]
-				- fh->vbi_fmt.tvnorm->vbistart[i];
+			new_start = frt->fmt.vbi.start[i] + tvnorm->vbistart[i]
+				- btv->vbi_fmt.tvnorm->vbistart[i];
 
 			frt->fmt.vbi.start[i] = min(new_start, max_end - 1);
 			frt->fmt.vbi.count[i] =
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index 7f02dd5866d7..a36817dfaaec 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -452,6 +452,7 @@ struct bttv {
 	const struct bttv_format *fmt;
 	int width;
 	int height;
+	struct bttv_vbi_fmt vbi_fmt;
 
 	/* used to make dvb-bt8xx autoloadable */
 	struct work_struct request_module_wk;
-- 
2.39.2

