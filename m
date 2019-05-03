Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFEA12CC3
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 13:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfECLra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 07:47:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46340 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbfECLra (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 07:47:30 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DA2D228362D;
        Fri,  3 May 2019 12:47:27 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 09/15] rockchip/vpu: Provide a helper to reset both src and dst formats
Date:   Fri,  3 May 2019 13:47:13 +0200
Message-Id: <20190503114719.28784-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503114719.28784-1-boris.brezillon@collabora.com>
References: <20190503114719.28784-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When initializing a context, the core wants to reset both src and dst
formats. Right now the order doesn't matter, but if we want to have a
valid default width/height on the non-coded/raw format side (src in
case of encoders, dst in case of decoders), we need to reset those
formats in the right order: first the coded-format side, then the other,
such that width and height on the raw format side can be taken from
the coded format.

Let's provide a helper that will reset both formats and make sure this
is done in the right order.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes from v2:
* None

Changes from v2:
* New patch
---
 .../staging/media/rockchip/vpu/rockchip_vpu_drv.c  |  3 +--
 .../staging/media/rockchip/vpu/rockchip_vpu_v4l2.c | 14 ++++++++++----
 .../staging/media/rockchip/vpu/rockchip_vpu_v4l2.h |  5 +----
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
index ec18578d55d7..d85b88067b03 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
@@ -273,8 +273,7 @@ static int rockchip_vpu_open(struct file *filp)
 	filp->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
 
-	rockchip_vpu_reset_dst_fmt(vpu, ctx);
-	rockchip_vpu_reset_src_fmt(vpu, ctx);
+	rockchip_vpu_reset_fmts(ctx);
 
 	ret = rockchip_vpu_ctrls_setup(vpu, ctx);
 	if (ret) {
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
index 3e8f6256e0ed..e30056dc6758 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
@@ -250,8 +250,8 @@ vidioc_try_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-void rockchip_vpu_reset_dst_fmt(struct rockchip_vpu_dev *vpu,
-				struct rockchip_vpu_ctx *ctx)
+static void rockchip_vpu_reset_dst_fmt(struct rockchip_vpu_dev *vpu,
+				       struct rockchip_vpu_ctx *ctx)
 {
 	struct v4l2_pix_format_mplane *fmt = &ctx->dst_fmt;
 
@@ -273,8 +273,8 @@ void rockchip_vpu_reset_dst_fmt(struct rockchip_vpu_dev *vpu,
 		fmt->width * fmt->height * ctx->vpu_dst_fmt->max_depth;
 }
 
-void rockchip_vpu_reset_src_fmt(struct rockchip_vpu_dev *vpu,
-				struct rockchip_vpu_ctx *ctx)
+static void rockchip_vpu_reset_src_fmt(struct rockchip_vpu_dev *vpu,
+				       struct rockchip_vpu_ctx *ctx)
 {
 	struct v4l2_pix_format_mplane *fmt = &ctx->src_fmt;
 
@@ -294,6 +294,12 @@ void rockchip_vpu_reset_src_fmt(struct rockchip_vpu_dev *vpu,
 			    fmt->height);
 }
 
+void rockchip_vpu_reset_fmts(struct rockchip_vpu_ctx *ctx)
+{
+	rockchip_vpu_reset_dst_fmt(ctx->dev, ctx);
+	rockchip_vpu_reset_src_fmt(ctx->dev, ctx);
+}
+
 static int
 vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 {
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.h
index 816bd3988218..493e8751d22d 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.h
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.h
@@ -21,9 +21,6 @@
 extern const struct v4l2_ioctl_ops rockchip_vpu_ioctl_ops;
 extern const struct vb2_ops rockchip_vpu_queue_ops;
 
-void rockchip_vpu_reset_src_fmt(struct rockchip_vpu_dev *vpu,
-				struct rockchip_vpu_ctx *ctx);
-void rockchip_vpu_reset_dst_fmt(struct rockchip_vpu_dev *vpu,
-				struct rockchip_vpu_ctx *ctx);
+void rockchip_vpu_reset_fmts(struct rockchip_vpu_ctx *ctx);
 
 #endif /* ROCKCHIP_VPU_V4L2_H_ */
-- 
2.20.1

