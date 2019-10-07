Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA92CE6C0
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbfJGPJ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:09:28 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37384 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbfJGPHl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:07:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97F7eNb066221;
        Mon, 7 Oct 2019 10:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570460860;
        bh=VmitdgajHHJkSVwVVJXNsT523zGlYCY363KbSQpWfJQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=YT1reUWlKGrELyV8v4mct+FVOE8+1f+6k7eA0StHD9VcRWlyAYky7IePXPZB7CD1e
         NQpuAs0+t4ct29yztMnpDZypOzYgNRS3w/Dt7KHUmR+/gq7GZ6bltcXVV4/IjPNMxL
         /f6KbozjV03kp8Jc3qCOPb+gsDX9s7zTDZDkh7Ko=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97F7eTO023671
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 10:07:40 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 10:07:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 10:07:40 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97F7aFA055156;
        Mon, 7 Oct 2019 10:07:40 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 04/21] media: ti-vpe: vpe: Remove unnecessary use of container_of
Date:   Mon, 7 Oct 2019 10:09:52 -0500
Message-ID: <20191007151009.22095-5-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007151009.22095-1-bparrot@ti.com>
References: <20191007151009.22095-1-bparrot@ti.com>
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

