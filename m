Return-Path: <linux-media+bounces-39261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE08BB1F6BB
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97A5F3B35B1
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345B12C08AF;
	Sat,  9 Aug 2025 21:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HJs3CUMx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFDB2D0C73
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774351; cv=none; b=q+QmvgdCEMisfw4RjHffaD5aYcTeqOaUwcCF3TUrfoLfaOFfZiGahbJWQJqQryKpU3p5e0KnBQtStcTu+dvAE/zMG9ruL0LJW7cCuXPNp6Y0A/oIwgdEAKws1gwbZ2QHYM9DyBbz9VdKgsIKV2c4GtNgabmtF9TN/NEyFJw290M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774351; c=relaxed/simple;
	bh=rYXhx3LXbyHgUackuzfV/xSqv9vkoe5nxgwTAzY6xTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHetO8FKqBnCL5ccLTK/zybRTMD8u+hd2uZeGFV/rbiYUFoLQoQ+rfAW1DCksOcMfna1htuTQapC66ZEMXYAcoovgN7bjciCYwFbZAvHIQ8DKqTes9bj/dbM86viYBxap9/2PgZrU9ehwwCi7RS8FFiborfMTSr0i10d9iGT/ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HJs3CUMx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F3B74111D;
	Sat,  9 Aug 2025 23:18:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774291;
	bh=rYXhx3LXbyHgUackuzfV/xSqv9vkoe5nxgwTAzY6xTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HJs3CUMx4cPrdlSBZbRjdh7JgX8emdbmde/e3lm68VD8z18EhAMmFCPQNYNBoFw8o
	 EEx6cBCRg56zaRr8soiYP1gk3cAtmbJLLc8n/573tmtcf20K5r1w9ClLoT99Ylz0pr
	 OYkkgbmIhqKwrF78HT3NQFFWAMz9IfV/nax/OlIY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 66/76] media: usb: hdpvr: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:43 +0300
Message-ID: <20250809211654.28887-67-laurent.pinchart@ideasonboard.com>
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

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/usb/hdpvr/hdpvr-video.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 6c6e467f8554..8a5c2c5227eb 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -52,6 +52,11 @@ struct hdpvr_fh {
 	bool legacy_mode;
 };
 
+static inline struct hdpvr_fh *file_to_hdpvr_fh(struct file *file)
+{
+	return container_of(file_to_v4l2_fh(file), struct hdpvr_fh, fh);
+}
+
 static uint list_size(struct list_head *list)
 {
 	struct list_head *tmp;
@@ -589,7 +594,7 @@ static int vidioc_s_std(struct file *file, void *_fh,
 			v4l2_std_id std)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 	u8 std_type = 1;
 
 	if (!fh->legacy_mode && dev->options.video_input == HDPVR_COMPONENT)
@@ -609,7 +614,8 @@ static int vidioc_g_std(struct file *file, void *_fh,
 			v4l2_std_id *std)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
+
 
 	if (!fh->legacy_mode && dev->options.video_input == HDPVR_COMPONENT)
 		return -ENODATA;
@@ -620,8 +626,8 @@ static int vidioc_g_std(struct file *file, void *_fh,
 static int vidioc_querystd(struct file *file, void *_fh, v4l2_std_id *a)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 	struct hdpvr_video_info vid_info;
-	struct hdpvr_fh *fh = _fh;
 	int ret;
 
 	*a = V4L2_STD_UNKNOWN;
@@ -640,7 +646,7 @@ static int vidioc_s_dv_timings(struct file *file, void *_fh,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 	int i;
 
 	fh->legacy_mode = false;
@@ -663,7 +669,7 @@ static int vidioc_g_dv_timings(struct file *file, void *_fh,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 
 	fh->legacy_mode = false;
 	if (dev->options.video_input)
@@ -676,7 +682,7 @@ static int vidioc_query_dv_timings(struct file *file, void *_fh,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 	struct hdpvr_video_info vid_info;
 	bool interlaced;
 	int ret = 0;
@@ -718,7 +724,7 @@ static int vidioc_enum_dv_timings(struct file *file, void *_fh,
 				    struct v4l2_enum_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 
 	fh->legacy_mode = false;
 	memset(timings->reserved, 0, sizeof(timings->reserved));
@@ -734,7 +740,7 @@ static int vidioc_dv_timings_cap(struct file *file, void *_fh,
 				    struct v4l2_dv_timings_cap *cap)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 
 	fh->legacy_mode = false;
 	if (dev->options.video_input)
@@ -994,7 +1000,7 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *_fh,
 				struct v4l2_format *f)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-	struct hdpvr_fh *fh = _fh;
+	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
 	int ret;
 
 	/*
-- 
Regards,

Laurent Pinchart


