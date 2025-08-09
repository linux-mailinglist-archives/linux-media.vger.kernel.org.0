Return-Path: <linux-media+bounces-39197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D972B1F64F
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 848FB17D742
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE6A27A927;
	Sat,  9 Aug 2025 21:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bZ0F90Ba"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49DF1F5834
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774247; cv=none; b=fIXKwB32E7nti96Hk5xVYhKZc1lmkrYgXSm3WtgyzplWJhNHLviW+cz1oAEYSjFLiQqGx30ApzQzzWo1O/wI39xoL5kboF9uWWvUkUJ4W2Snu1/BSCmwl0YwaFK64rLHSt9tQbQwFUygAL7jh96gDt1l9CjDkT+LmCegDAnbosw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774247; c=relaxed/simple;
	bh=Fz8irgoDDzFfI7KMUoKPgYpema++L2vXDV2BRQiVFlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXSjo4cHecbeyFkpzoLRt7ApSUXE1vXdAbApC7Ru4pnNLQL38DoJ9RkbdGZlZktRNbzJRB+1m5hnpvGIhF/2gWFsUKY0RklG51wl0aey2UDKv130aetY+fMYYTGk4PuqocBKR1EiHJCzkzDyjGFbus03GlP38CvvvDwjbA1HUjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bZ0F90Ba; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 057311387;
	Sat,  9 Aug 2025 23:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774185;
	bh=Fz8irgoDDzFfI7KMUoKPgYpema++L2vXDV2BRQiVFlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bZ0F90Ba7xD4g1fBpe0797LtSce0FpLdXWYBaISAUNeWV0Hkam9eBhJIi88nXQeBA
	 xmJUfV448wbZzFcbTQ1RtEodT9bU32T2oz4aTBY2ulYAUVZoJRRnxbHChQuCuS+lIh
	 J0DUn29v4oWAMTVvxg5FFtraNLb1kUS5FvlC4QMU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 03/76] media: ti: vpe: Store v4l2_fh pointer in file->private_data
Date: Sun, 10 Aug 2025 00:15:40 +0300
Message-ID: <20250809211654.28887-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
ti-vpe driver instead stores the pointer to the driver-specific
structure that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer
itself to standardize behaviour across drivers. This also prepares for
future refactoring that depends on v4l2_fh being stored in private_data.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/ti/vpe/vpe.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index 636d76ecebcd..b76b5d18c963 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -422,6 +422,10 @@ struct vpe_ctx {
 	unsigned int		src_mv_buf_selector;
 };
 
+static inline struct vpe_ctx *to_vpe_ctx(struct file *filp)
+{
+	return container_of(filp->private_data, struct vpe_ctx, fh);
+}
 
 /*
  * M2M devices get 2 queues.
@@ -1562,7 +1566,7 @@ static int vpe_enum_fmt(struct file *file, void *priv,
 static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
-	struct vpe_ctx *ctx = file->private_data;
+	struct vpe_ctx *ctx = to_vpe_ctx(file);
 	struct vb2_queue *vq;
 	struct vpe_q_data *q_data;
 
@@ -1719,7 +1723,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 
 static int vpe_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct vpe_ctx *ctx = file->private_data;
+	struct vpe_ctx *ctx = to_vpe_ctx(file);
 	struct vpe_fmt *fmt = find_format(f);
 
 	if (V4L2_TYPE_IS_OUTPUT(f->type))
@@ -1783,7 +1787,7 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 static int vpe_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	int ret;
-	struct vpe_ctx *ctx = file->private_data;
+	struct vpe_ctx *ctx = to_vpe_ctx(file);
 
 	ret = vpe_try_fmt(file, priv, f);
 	if (ret)
@@ -1871,7 +1875,7 @@ static int __vpe_try_selection(struct vpe_ctx *ctx, struct v4l2_selection *s)
 static int vpe_g_selection(struct file *file, void *fh,
 		struct v4l2_selection *s)
 {
-	struct vpe_ctx *ctx = file->private_data;
+	struct vpe_ctx *ctx = to_vpe_ctx(file);
 	struct vpe_q_data *q_data;
 	struct v4l2_pix_format_mplane *pix;
 	bool use_c_rect = false;
@@ -1935,7 +1939,7 @@ static int vpe_g_selection(struct file *file, void *fh,
 static int vpe_s_selection(struct file *file, void *fh,
 		struct v4l2_selection *s)
 {
-	struct vpe_ctx *ctx = file->private_data;
+	struct vpe_ctx *ctx = to_vpe_ctx(file);
 	struct vpe_q_data *q_data;
 	struct v4l2_selection sel = *s;
 	int ret;
@@ -2306,7 +2310,7 @@ static int vpe_open(struct file *file)
 	init_adb_hdrs(ctx);
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = ctx;
+	file->private_data = &ctx->fh;
 
 	hdl = &ctx->hdl;
 	v4l2_ctrl_handler_init(hdl, 1);
@@ -2400,7 +2404,7 @@ static int vpe_open(struct file *file)
 static int vpe_release(struct file *file)
 {
 	struct vpe_dev *dev = video_drvdata(file);
-	struct vpe_ctx *ctx = file->private_data;
+	struct vpe_ctx *ctx = to_vpe_ctx(file);
 
 	vpe_dbg(dev, "releasing instance %p\n", ctx);
 
-- 
Regards,

Laurent Pinchart


