Return-Path: <linux-media+bounces-39336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E229B1F7E6
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2D243AF23D
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD1B1D6193;
	Sun, 10 Aug 2025 01:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SgozqHxp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AE820B812
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789588; cv=none; b=ssOm/pgvl39nsuhVyXPGn/hxqP4rZUQTLsEIJNbHssQHua37qG7V+EMyKaIkbAQI+mLXIvRfL1CXQtyaanp3deqmyQoTV0imWek71BinwWnWTg1yHjig4qwifLuQ1lUTYVX1XpSZ+Ocq8RH3GJEdTxrUZtUQC856uJZVc4WSu+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789588; c=relaxed/simple;
	bh=Su+q7ng2P4JCGvcH/Nbdvx3z1y3l0EvmA6GOvovBVF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0txYABEb4CzlvgBp7Y0uThQoFEp/OsBSGKgVTBholSHRTzS9fmKUmt7CneV9nAN2UaALlsy6rIolaFFkCRLuCArMTdMWt226aSPOSqcnNgMMZusrnxNE5IegyAQvegnLq0bOVebXOK8YBHVuq6Go26W9j5N+sGRyiVA2QLqswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SgozqHxp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8B0E67E6;
	Sun, 10 Aug 2025 03:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789534;
	bh=Su+q7ng2P4JCGvcH/Nbdvx3z1y3l0EvmA6GOvovBVF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SgozqHxpBNzz2MXpsWKpvLHnQpoGorLNM5DyZEIJpJbJ+e5bY4WdIYTiCjNIErp2F
	 UfJym/1VfKHBvZX4pwwdNMNArpfXxPRUiKkCwSSq5WSS73kKmOjnup3g2HAZ6lGexy
	 lTb9JTqbGTehfx+7Fp7bat3J731y1aYGZxf0YkOs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 63/76] media: omap3isp: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:45 +0300
Message-ID: <20250810013100.29776-64-laurent.pinchart+renesas@ideasonboard.com>
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

While at it remove the only left user of to_isp_video_fh() and remove
the macro completely.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 22 +++++++++----------
 drivers/media/platform/ti/omap3isp/ispvideo.h |  4 +---
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 2c0008444b7e..0e7f0bf2b346 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -657,7 +657,7 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 static int
 isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 
 	if (format->type != video->type)
@@ -673,7 +673,7 @@ isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 static int
 isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	struct v4l2_mbus_framefmt fmt;
 
@@ -858,7 +858,7 @@ isp_video_set_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 static int
 isp_video_get_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 
 	if (video->type != V4L2_BUF_TYPE_VIDEO_OUTPUT ||
@@ -876,7 +876,7 @@ isp_video_get_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 static int
 isp_video_set_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 
 	if (video->type != V4L2_BUF_TYPE_VIDEO_OUTPUT ||
@@ -894,7 +894,7 @@ isp_video_set_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 static int
 isp_video_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *rb)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	int ret;
 
@@ -908,7 +908,7 @@ isp_video_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *rb)
 static int
 isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	int ret;
 
@@ -922,7 +922,7 @@ isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
 static int
 isp_video_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	int ret;
 
@@ -936,7 +936,7 @@ isp_video_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 static int
 isp_video_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	int ret;
 
@@ -1074,7 +1074,7 @@ static int isp_video_check_external_subdevs(struct isp_video *video,
 static int
 isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	enum isp_pipeline_state state;
 	struct isp_pipeline *pipe;
@@ -1180,7 +1180,7 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 static int
 isp_video_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	struct isp_pipeline *pipe = to_isp_pipeline(&video->video.entity);
 	enum isp_pipeline_state state;
@@ -1348,7 +1348,7 @@ static int isp_video_release(struct file *file)
 {
 	struct isp_video *video = video_drvdata(file);
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
-	struct isp_video_fh *handle = to_isp_video_fh(vfh);
+	struct isp_video_fh *handle = file_to_isp_video_fh(file);
 
 	/* Disable streaming and free the buffers queue resources. */
 	isp_video_streamoff(file, vfh, video->type);
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.h b/drivers/media/platform/ti/omap3isp/ispvideo.h
index 4364b4b14fb4..537da59cff62 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.h
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.h
@@ -194,11 +194,9 @@ struct isp_video_fh {
 	struct v4l2_fract timeperframe;
 };
 
-#define to_isp_video_fh(fh)	container_of(fh, struct isp_video_fh, vfh)
-
 static inline struct isp_video_fh *file_to_isp_video_fh(struct file *filp)
 {
-	return to_isp_video_fh(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct isp_video_fh, vfh);
 }
 
 #define isp_video_queue_to_isp_video_fh(q) \
-- 
Regards,

Laurent Pinchart


