Return-Path: <linux-media+bounces-27462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2280A4DC2A
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B75963B087F
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE88B202C22;
	Tue,  4 Mar 2025 11:11:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417B202996
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086687; cv=none; b=LqyAFFH85Vl+5sVjd3Z/mLvLA93tBjv+neJP476doaKH7qLugz0W7YvX+Y3Nydj/3zFTC7XOKATha4UJNb9bHJ9pJoDFSvm6uI/6zlLBZJZh0bZ2QBaJ1Q6rJtqBjUB1fWZgZQXuUCsNnrzXD23+y2GIXdDJiE7IfymJij7x8ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086687; c=relaxed/simple;
	bh=uthtNg3ISZev1+2mkf+PQsAUE4UGki9AQYr/R0PS9jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9spEmiEdy48p+nQuhyglcK9NLGtob1E1/oLOlgvjRFIMZX7HO7aSUEsV6EM3Eikxyp4uFi90iw4JOdc4uzLA0XNdpiDR9Gz65D9fO9okDaLjr06aGLs1hPlaPHHoTVjQzMsViwJEtMgZzD1dfXcyjhZxJEPduFOCFdjTbKSPyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B81C4CEEB;
	Tue,  4 Mar 2025 11:11:26 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 2/8] media: v4l2-core: use (t,l)/wxh format for rectangle
Date: Tue,  4 Mar 2025 12:08:08 +0100
Message-ID: <38b9ca4fd607b4616e1fa450c594347d2e0bbf9d.1741086494.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1741086494.git.hverkuil@xs4all.nl>
References: <cover.1741086494.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize reporting of rectangles to (t,l)/wxh.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c |  6 +++---
 drivers/media/v4l2-core/v4l2-ioctl.c      | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 711b8ea934c9..90d25329661e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -437,9 +437,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 		pr_cont("AV1_FILM_GRAIN");
 		break;
 	case V4L2_CTRL_TYPE_RECT:
-		pr_cont("%ux%u@%dx%d",
-			ptr.p_rect->width, ptr.p_rect->height,
-			ptr.p_rect->left, ptr.p_rect->top);
+		pr_cont("(%d,%d)/%ux%u",
+			ptr.p_rect->left, ptr.p_rect->top,
+			ptr.p_rect->width, ptr.p_rect->height);
 		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index bfdba96e938c..34bde1f4c526 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -310,8 +310,8 @@ static void v4l_print_format(const void *arg, bool write_only)
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
 		win = &p->fmt.win;
-		pr_cont(", wxh=%dx%d, x,y=%d,%d, field=%s, chromakey=0x%08x, global_alpha=0x%02x\n",
-			win->w.width, win->w.height, win->w.left, win->w.top,
+		pr_cont(", (%d,%d)/%ux%u, field=%s, chromakey=0x%08x, global_alpha=0x%02x\n",
+			win->w.left, win->w.top, win->w.width, win->w.height,
 			prt_names(win->field, v4l2_field_names),
 			win->chromakey, win->global_alpha);
 		break;
@@ -589,12 +589,12 @@ static void v4l_print_cropcap(const void *arg, bool write_only)
 {
 	const struct v4l2_cropcap *p = arg;
 
-	pr_cont("type=%s, bounds wxh=%dx%d, x,y=%d,%d, defrect wxh=%dx%d, x,y=%d,%d, pixelaspect %d/%d\n",
+	pr_cont("type=%s, bounds (%d,%d)/%ux%u, defrect (%d,%d)/%ux%u, pixelaspect %d/%d\n",
 		prt_names(p->type, v4l2_type_names),
-		p->bounds.width, p->bounds.height,
 		p->bounds.left, p->bounds.top,
-		p->defrect.width, p->defrect.height,
+		p->bounds.width, p->bounds.height,
 		p->defrect.left, p->defrect.top,
+		p->defrect.width, p->defrect.height,
 		p->pixelaspect.numerator, p->pixelaspect.denominator);
 }
 
@@ -602,20 +602,20 @@ static void v4l_print_crop(const void *arg, bool write_only)
 {
 	const struct v4l2_crop *p = arg;
 
-	pr_cont("type=%s, wxh=%dx%d, x,y=%d,%d\n",
+	pr_cont("type=%s, crop=(%d,%d)/%ux%u\n",
 		prt_names(p->type, v4l2_type_names),
-		p->c.width, p->c.height,
-		p->c.left, p->c.top);
+		p->c.left, p->c.top,
+		p->c.width, p->c.height);
 }
 
 static void v4l_print_selection(const void *arg, bool write_only)
 {
 	const struct v4l2_selection *p = arg;
 
-	pr_cont("type=%s, target=%d, flags=0x%x, wxh=%dx%d, x,y=%d,%d\n",
+	pr_cont("type=%s, target=%d, flags=0x%x, rect=(%d,%d)/%ux%u\n",
 		prt_names(p->type, v4l2_type_names),
 		p->target, p->flags,
-		p->r.width, p->r.height, p->r.left, p->r.top);
+		p->r.left, p->r.top, p->r.width, p->r.height);
 }
 
 static void v4l_print_jpegcompression(const void *arg, bool write_only)
-- 
2.47.2


