Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7606F3C62
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbjEBD2D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233297AbjEBD17 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:27:59 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F511358B
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:27:58 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 505BF660562E;
        Tue,  2 May 2023 04:27:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998077;
        bh=QMU7fHQueaqtPwOUq5eJb2/tzLNz7dwStvZcp9Ib5ts=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nNvdymhwW7xHcXu1EO3Hs2mTN9WPwY+XDhypK/MtfY002xJzPj1dvF1Yht9bQWSJ8
         v1N6BSANb02zRfEGqEbOCtZulTdqjBeevokrR+hgfSNfIVsODRNMOisCVK7KZopnPK
         B+lFEBHf+IIYmugGEcmXEBfrE0TrJJzeiSxr9fTRHRnv/P2eh+mzIMs8mxe3lk0c5T
         B6hqVWGKiXMXyWwfpO+QWnoIFFQ5Uzzl92PqNBcS7XhAdnmdj+Ay5gLtdKM8urGZyn
         5b9u5nb1QydFHagJc85Y5r0MLEDLUazp4ERDmVdTdTmTosTxyLvcukDSXkppDRXqzd
         oVe28Qs83ihwA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 04/13] media: bttv: copy vid fmt/width/height from fh
Date:   Mon,  1 May 2023 20:27:22 -0700
Message-Id: <b2b419786fd25dbc4a71f49058c054208955d949.1682995256.git.deborah.brouwer@collabora.com>
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

In preparation for the vb2 conversion, copy the video format, width and
height fields from struct bttv_fh and add them to the main struct bttv.
Use these fields from struct bttv wherever they will be needed after the
vb2 conversion which stops using separate bttv file handles altogether. To
avoid changing more code than necessary, just leave the video format,
width and height fields in separate file handles wherever the code will be
subsequently removed by vb2.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 34 +++++++++++++--------------
 drivers/media/pci/bt8xx/bttvp.h       |  3 +++
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index e59f40dfccc3..7e7658a7ed40 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2066,11 +2066,11 @@ static int bttv_g_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_format *f)
 {
 	struct bttv_fh *fh  = priv;
+	struct bttv *btv = video_drvdata(file);
 
-	pix_format_set_size(&f->fmt.pix, fh->fmt,
-				fh->width, fh->height);
+	pix_format_set_size(&f->fmt.pix, btv->fmt, btv->width, btv->height);
 	f->fmt.pix.field        = fh->cap.field;
-	f->fmt.pix.pixelformat  = fh->fmt->fourcc;
+	f->fmt.pix.pixelformat  = btv->fmt->fourcc;
 	f->fmt.pix.colorspace   = V4L2_COLORSPACE_SMPTE170M;
 
 	return 0;
@@ -2190,6 +2190,9 @@ static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
 	btv->init.fmt        = fmt;
 	btv->init.width      = f->fmt.pix.width;
 	btv->init.height     = f->fmt.pix.height;
+	btv->fmt = fmt;
+	btv->width = f->fmt.pix.width;
+	btv->height = f->fmt.pix.height;
 
 	return 0;
 }
@@ -2446,21 +2449,15 @@ static int bttv_s_selection(struct file *file, void *f, struct v4l2_selection *s
 
 	fh->do_crop = 1;
 
-	if (fh->width < c.min_scaled_width) {
-		fh->width = c.min_scaled_width;
-		btv->init.width = c.min_scaled_width;
-	} else if (fh->width > c.max_scaled_width) {
-		fh->width = c.max_scaled_width;
-		btv->init.width = c.max_scaled_width;
-	}
+	if (btv->width < c.min_scaled_width)
+		btv->width = c.min_scaled_width;
+	else if (btv->width > c.max_scaled_width)
+		btv->width = c.max_scaled_width;
 
-	if (fh->height < c.min_scaled_height) {
-		fh->height = c.min_scaled_height;
-		btv->init.height = c.min_scaled_height;
-	} else if (fh->height > c.max_scaled_height) {
-		fh->height = c.max_scaled_height;
-		btv->init.height = c.max_scaled_height;
-	}
+	if (btv->height < c.min_scaled_height)
+		btv->height = c.min_scaled_height;
+	else if (btv->height > c.max_scaled_height)
+		btv->height = c.max_scaled_height;
 
 	return 0;
 }
@@ -3636,6 +3633,9 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	btv->init.fmt         = format_by_fourcc(V4L2_PIX_FMT_BGR24);
 	btv->init.width       = 320;
 	btv->init.height      = 240;
+	btv->fmt = format_by_fourcc(V4L2_PIX_FMT_BGR24);
+	btv->width = 320;
+	btv->height = 240;
 	btv->input = 0;
 
 	v4l2_ctrl_new_std(hdl, &bttv_ctrl_ops,
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index 717f002a41df..7f02dd5866d7 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -449,6 +449,9 @@ struct bttv {
 
 	unsigned int users;
 	struct bttv_fh init;
+	const struct bttv_format *fmt;
+	int width;
+	int height;
 
 	/* used to make dvb-bt8xx autoloadable */
 	struct work_struct request_module_wk;
-- 
2.39.2

