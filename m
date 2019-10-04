Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888EECC0AC
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 18:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbfJDQ3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 12:29:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37136 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbfJDQ1t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 12:27:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GRmFj059494;
        Fri, 4 Oct 2019 11:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570206468;
        bh=VmitdgajHHJkSVwVVJXNsT523zGlYCY363KbSQpWfJQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=SC+42KQ6Vb100Qd+aVAebh7MztrE6MedjY8YhfVQQ/T9MEsNTKHTy0B3kw5xoYTWb
         x+J1sQ0YiVL4Fm/DVSFmIMLpUdWxotpnTSKQuork6sE+rv80pEcQsGnlxWBnJg27nk
         gqzwlfaG2j6WA9LowbwfbMNxCaSqBWY8QYMdXt2Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GRmvh067335;
        Fri, 4 Oct 2019 11:27:48 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:27:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:27:48 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GRgA6028904;
        Fri, 4 Oct 2019 11:27:48 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 04/21] media: ti-vpe: vpe: Remove unnecessary use of container_of
Date:   Fri, 4 Oct 2019 11:29:35 -0500
Message-ID: <20191004162952.4963-5-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of saving a pointer to the 'fh' member of struct vpe_ctx to
later have to use container_of to retrieve the actual pointer to the
context structure, which seems to confuse static code analysis tool
anyways, just save the pointer to the actual structure and then retrieve
it directly.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 56f60dbea15c..0e9cb0319a92 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -900,14 +900,6 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
 	return 0;
 }
 
-/*
- * Return the vpe_ctx structure for a given struct file
- */
-static struct vpe_ctx *file2ctx(struct file *file)
-{
-	return container_of(file->private_data, struct vpe_ctx, fh);
-}
-
 /*
  * mem2mem callbacks
  */
@@ -1527,7 +1519,7 @@ static int vpe_enum_fmt(struct file *file, void *priv,
 static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 	struct vb2_queue *vq;
 	struct vpe_q_data *q_data;
 	int i;
@@ -1689,7 +1681,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 
 static int vpe_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 	struct vpe_fmt *fmt = find_format(f);
 
 	if (V4L2_TYPE_IS_OUTPUT(f->type))
@@ -1762,7 +1754,7 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 static int vpe_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	int ret;
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 
 	ret = vpe_try_fmt(file, priv, f);
 	if (ret)
@@ -1847,7 +1839,7 @@ static int __vpe_try_selection(struct vpe_ctx *ctx, struct v4l2_selection *s)
 static int vpe_g_selection(struct file *file, void *fh,
 		struct v4l2_selection *s)
 {
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 	struct vpe_q_data *q_data;
 	bool use_c_rect = false;
 
@@ -1908,7 +1900,7 @@ static int vpe_g_selection(struct file *file, void *fh,
 static int vpe_s_selection(struct file *file, void *fh,
 		struct v4l2_selection *s)
 {
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 	struct vpe_q_data *q_data;
 	struct v4l2_selection sel = *s;
 	int ret;
@@ -2275,7 +2267,7 @@ static int vpe_open(struct file *file)
 	init_adb_hdrs(ctx);
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
+	file->private_data = ctx;
 
 	hdl = &ctx->hdl;
 	v4l2_ctrl_handler_init(hdl, 1);
@@ -2360,7 +2352,7 @@ static int vpe_open(struct file *file)
 static int vpe_release(struct file *file)
 {
 	struct vpe_dev *dev = video_drvdata(file);
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 
 	vpe_dbg(dev, "releasing instance %p\n", ctx);
 
-- 
2.17.1

