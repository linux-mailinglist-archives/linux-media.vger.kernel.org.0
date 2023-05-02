Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D23D6F3C63
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbjEBD2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233329AbjEBD2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:28:01 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC683C3E
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:27:59 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BA48A66032AB;
        Tue,  2 May 2023 04:27:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998078;
        bh=FlTrMxTlxNeCmNF1MvmaT3FBSJtxmYCkn2tg313QnFA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FusmJ4hyZd25cbFItYTZ6E2QioOrSQRNShooOQoAiYcFvUY0T+sHEupSmb5rYHNU0
         c4R8fsCKQvwj6isvMrxGUuLWZ0d6QKm/s0IsKUsALtjfGM7B/nHy+ywB+kdmcnHKMl
         wKP8XjBWVh2AFEj2PCP8FzqGNUCFJrr2qT/nASY0yMBtgm0KeRZhbhXW9CL+h7JCYX
         xbAOHRXKNuEqtEQTyGnyw0gn1gPs6kQxwSFd5ixHDEGRagIBew63H2eI+i275a1LXw
         jqCCyBJmxsSEYApcSSaNZorTYnmjU0T+7B2VDpUqeFic25cSMlVlUeEFPPKtWQja9S
         A8xdE0uA7aJTg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 05/13] media: bttv: copy vbi_fmt from bttv_fh
Date:   Mon,  1 May 2023 20:27:23 -0700
Message-Id: <407506f1e59fc6e0e059f8b90083338fae2c1f3b.1682995256.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682995256.git.deborah.brouwer@collabora.com>
References: <cover.1682995256.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for the vb2 conversion, copy the vbi format from struct
bttv_fh and add it to the main struct bttv. Use vbi format from struct
bttv wherever it will be needed after the vb2 conversion which stops using
separate bttv file handles altogether. To avoid changing more code than
necessary, just leave the vbi format in separate file handles wherever it
will be subsequently removed by vb2.

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

