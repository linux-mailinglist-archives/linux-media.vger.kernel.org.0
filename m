Return-Path: <linux-media+bounces-39242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8843B1F6A4
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB8811888402
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D95627E06D;
	Sat,  9 Aug 2025 21:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rI7rT225"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBFA2C1798
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774320; cv=none; b=qCXm7P1HSwEjoNEWq5pyW/pU9vW8fjTPk8053LtQrpKHs60lFSehoWse3ahjq/pBDAGq3UXS8TJ5AfNmVh3u2MK/z1xcch27ug3DqRJOM2JN+jWTuLwFAaoJwzJ/eVqAlIfTPMQKUxtummvBCM6V6ayH5yz2mWotry1l9MpPB70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774320; c=relaxed/simple;
	bh=HTZp8FzCizbZixmMpQ5mh3x+tBjy9iDF0XgNaUJIZpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjfuq74VJw2QTJcuUXfPO58mvKRaW0sUj9MBWkHyzGLsiqa/3kVeGYXUfMwJF3cwC6adYAA2X+J1aOBTQgtRoXvKpSopwal726iX9xw0tDy0fQSzc3auDWPEO03aF+aL1MvmZ4auQjbOGKCg8x7CZwC07Uc0GLLuHv4lOJCeSJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rI7rT225; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 61C69111D;
	Sat,  9 Aug 2025 23:17:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774259;
	bh=HTZp8FzCizbZixmMpQ5mh3x+tBjy9iDF0XgNaUJIZpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rI7rT2259KuojfP9hGhfXdUDImzWODC1t/X4645cY5ZSXMrXkNr3L6oDLvqoRM4mb
	 aWm2qT/axOU7h0R04n87VFHru8G2Rz8bPPU99Y1xP1wW7qIeaBdmQFrpr/N+5gMhPe
	 CuAnIhzsu0WLDFiAlhQXlQtCOhWXTzURBXW+yH54=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 47/76] media: imx-isi: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:24 +0300
Message-ID: <20250809211654.28887-48-laurent.pinchart@ideasonboard.com>
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

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../media/platform/nxp/imx8-isi/imx8-isi-m2m.c  | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 31298307c672..5501214cc6c0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -74,14 +74,9 @@ to_isi_m2m_buffer(struct vb2_v4l2_buffer *buf)
 	return container_of(buf, struct mxc_isi_m2m_buffer, buf.vb);
 }
 
-static inline struct mxc_isi_m2m_ctx *to_isi_m2m_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mxc_isi_m2m_ctx, fh);
-}
-
 static inline struct mxc_isi_m2m_ctx *file_to_isi_m2m_ctx(struct file *filp)
 {
-	return to_isi_m2m_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct mxc_isi_m2m_ctx, fh);
 }
 
 static inline struct mxc_isi_m2m_ctx_queue_data *
@@ -432,7 +427,7 @@ static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
 	const enum mxc_isi_video_type type =
 		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
 		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 
 	__mxc_isi_m2m_try_fmt_vid(ctx, &f->fmt.pix_mp, type);
 
@@ -442,7 +437,7 @@ static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
 static int mxc_isi_m2m_g_fmt_vid(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	const struct mxc_isi_m2m_ctx_queue_data *qdata =
 		mxc_isi_m2m_ctx_qdata(ctx, f->type);
 
@@ -457,7 +452,7 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
 	const enum mxc_isi_video_type type =
 		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
 		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	const struct mxc_isi_format_info *info;
 	struct vb2_queue *vq;
@@ -489,7 +484,7 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
 static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
 	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
 	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
@@ -577,7 +572,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 				 enum v4l2_buf_type type)
 {
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
 	struct mxc_isi_m2m *m2m = ctx->m2m;
 
-- 
Regards,

Laurent Pinchart


