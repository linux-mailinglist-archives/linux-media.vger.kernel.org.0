Return-Path: <linux-media+bounces-39332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3401B1F7E3
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D27DA18995A4
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82443205ABF;
	Sun, 10 Aug 2025 01:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cs5w0al7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E33D1FFC45
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789582; cv=none; b=OCGNa92NtBM9h7KMQc8JKFozhPRTxJC0vlwFvNgdZPjQ/S1mCowvIPE1ILPC5iq8N6CK9MmjL18p9G/4cayRc4Oeb8m7dSQmo8X2tLv6CPccislzwESQKqiAYOP34voUsAVOQKWj/c0U5Odhfvst7nDfp4JnJeoViZow891e5qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789582; c=relaxed/simple;
	bh=erll0VPwNpx6BykWGEBfeHqX1k6d5Fc2VYRUllM6f84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmlmRSJk+zvTRGzxmospnlXRrf1YRcUicUPX2h9Zw8h0Wvd/6l9aLQ+fBOHws2GrFFqNOGMLVLkA0rPzIZa0gglS3cfWqO2DkNifzGJmrC8xEJNQR0vdlzVI4fOlPx00UnxB/yvpJNFVGndXX/bdiEyq5ua2zV5fJiZljR7ulzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cs5w0al7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 02D8B99F;
	Sun, 10 Aug 2025 03:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789528;
	bh=erll0VPwNpx6BykWGEBfeHqX1k6d5Fc2VYRUllM6f84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cs5w0al7u5ultCq+RTvE8auK89/G8ZTrfEnFej9RgPUlrhy/xisEoZBgDdd08JLwY
	 P+VmA4JkesnaZLY3Jk4k4HVh06NBkBuTVvLFJwDlLyUl/uE3jr2owISZFkPzZokmWo
	 VbZkMtweIut+vmVNM4O1+Rlly+AvpDAVEJ8SUe2k=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: [PATCH v3 59/76] media: bdisp: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:41 +0300
Message-ID: <20250810013100.29776-60-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


