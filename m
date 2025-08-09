Return-Path: <linux-media+bounces-39254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 227BAB1F6B4
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4550E17F6DD
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10FF2D0267;
	Sat,  9 Aug 2025 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gxYj5ROw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE9E2BF3DB
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774338; cv=none; b=S02G4NZfUVoyxnObsEExQxUI9VoOPutUYal5lLWcmUzMNBppKAQxmXrQsaKMq8yS1mfk4SNAxsysjXAF3KNVz7j8+XxmfYnehNATg14QY7KmQdAKADGod+m/NGlLb08rJciRFkfaNjuO1eqkKHHPYyY+0XbTV15zl1yCQ7usaIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774338; c=relaxed/simple;
	bh=sdx3KwXGMXI4tv+r2WKQI9tIUwbSXDoS/Lz4JzHkau4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Snm9i6vf2knQm7CZT1g2Y28LA+3H4EJM2bS5THi9aTRXdOB9z4CFn/PC4jaIiIWdjPKP1kudmihjbjAJXlZMC4J4gaUBWXtYl1gh4c5jrIXVvFqad0lar6UHpHKEp1TzDFkF9aLpBHAQWudeShI2cU1wYtvj2eWJ2lWanvtrFmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gxYj5ROw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CBFA4156F;
	Sat,  9 Aug 2025 23:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774279;
	bh=sdx3KwXGMXI4tv+r2WKQI9tIUwbSXDoS/Lz4JzHkau4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gxYj5ROwcuiRuti4ajOeWL7ok7pN7WcaE/utp3UO3wPX48qIllofdsZQxxV97fjQ/
	 8JItsxCVdUsCrBBYs16aXJJhKLAO0ZT2EPhpmyYoRQtPXYJYqnB7LOUZ5kCRMajCkp
	 9EkjLtsHhMhNT8FNg9TjBQG35z1XIJDZ5BE+kvCc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: [PATCH v2 59/76] media: bdisp: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:36 +0300
Message-ID: <20250809211654.28887-60-laurent.pinchart@ideasonboard.com>
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
 .../media/platform/st/sti/bdisp/bdisp-v4l2.c  | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index 38b2a2924443..56169b70652d 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -33,11 +33,9 @@
 #define BDISP_MIN_H             1
 #define BDISP_MAX_H             8191
 
-#define fh_to_ctx(__fh) container_of(__fh, struct bdisp_ctx, fh)
-
 static inline struct bdisp_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct bdisp_ctx, fh);
 }
 
 enum bdisp_dev_flags {
@@ -686,7 +684,7 @@ static const struct v4l2_file_operations bdisp_fops = {
 static int bdisp_querycap(struct file *file, void *fh,
 			  struct v4l2_capability *cap)
 {
-	struct bdisp_ctx *ctx = fh_to_ctx(fh);
+	struct bdisp_ctx *ctx = file_to_ctx(file);
 	struct bdisp_dev *bdisp = ctx->bdisp_dev;
 
 	strscpy(cap->driver, bdisp->pdev->name, sizeof(cap->driver));
@@ -698,7 +696,7 @@ static int bdisp_querycap(struct file *file, void *fh,
 
 static int bdisp_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
-	struct bdisp_ctx *ctx = fh_to_ctx(fh);
+	struct bdisp_ctx *ctx = file_to_ctx(file);
 	const struct bdisp_fmt *fmt;
 
 	if (f->index >= ARRAY_SIZE(bdisp_formats))
@@ -718,7 +716,7 @@ static int bdisp_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 
 static int bdisp_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct bdisp_ctx *ctx = fh_to_ctx(fh);
+	struct bdisp_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format *pix;
 	struct bdisp_frame *frame  = ctx_get_frame(ctx, f->type);
 
@@ -742,7 +740,7 @@ static int bdisp_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 static int bdisp_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct bdisp_ctx *ctx = fh_to_ctx(fh);
+	struct bdisp_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	const struct bdisp_fmt *format;
 	u32 in_w, in_h;
@@ -792,7 +790,7 @@ static int bdisp_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 static int bdisp_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct bdisp_ctx *ctx = fh_to_ctx(fh);
+	struct bdisp_ctx *ctx = file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct bdisp_frame *frame;
 	struct v4l2_pix_format *pix;
@@ -845,8 +843,8 @@ static int bdisp_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 static int bdisp_g_selection(struct file *file, void *fh,
 			     struct v4l2_selection *s)
 {
+	struct bdisp_ctx *ctx = file_to_ctx(file);
 	struct bdisp_frame *frame;
-	struct bdisp_ctx *ctx = fh_to_ctx(fh);
 
 	frame = ctx_get_frame(ctx, s->type);
 	if (IS_ERR(frame)) {
@@ -923,8 +921,8 @@ static int is_rect_enclosed(struct v4l2_rect *a, struct v4l2_rect *b)
 static int bdisp_s_selection(struct file *file, void *fh,
 			     struct v4l2_selection *s)
 {
+	struct bdisp_ctx *ctx = file_to_ctx(file);
 	struct bdisp_frame *frame;
-	struct bdisp_ctx *ctx = fh_to_ctx(fh);
 	struct v4l2_rect *in, out;
 	bool valid = false;
 
@@ -1001,7 +999,7 @@ static int bdisp_s_selection(struct file *file, void *fh,
 
 static int bdisp_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 {
-	struct bdisp_ctx *ctx = fh_to_ctx(fh);
+	struct bdisp_ctx *ctx = file_to_ctx(file);
 
 	if ((type == V4L2_BUF_TYPE_VIDEO_OUTPUT) &&
 	    !bdisp_ctx_state_is_set(BDISP_SRC_FMT, ctx)) {
-- 
Regards,

Laurent Pinchart


