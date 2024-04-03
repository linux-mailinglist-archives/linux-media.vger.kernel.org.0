Return-Path: <linux-media+bounces-8591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2714897BBB
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 00:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3E5F1C210A4
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 22:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6C61509BD;
	Wed,  3 Apr 2024 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QWCF4kpp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CA7692FC
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 22:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712184168; cv=none; b=X0YER7jQlJ4pdtFM182Cwjx5Pjqb1eisVqR8sIucXeZY8A3ATM1N4XCbYelzxCFgQpxK2OZlcVQF8MVS7rGx7Oox+/79smUDNIePkBF3wCuHRr7aWm+2NPikTOc9mTrC9L2UMFALmp3ZaFf8WUJ4gomaGkNMh7R5E1BzIObLxdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712184168; c=relaxed/simple;
	bh=10FWHxTDSOJROfv9ImdOl0LlGuj9qFmfN/B9VjdrZ7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tpo0fab3gz4E78sTsV0m5/eIHn3gBt+vz3stbglzvSJ80NqfLgf/Qlu5kiq7WbpzMskxbQ2RIzrJGkL+rcqn8ny6kN5Q6Rguz60y7Np9qea4Ea/OM9nYSKrbTNa2NQQ91QBcRLvuYEDvcPt4zRM1X9Qm/Z2uApXmfoPGTgcuolE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QWCF4kpp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E48243A3;
	Thu,  4 Apr 2024 00:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712184127;
	bh=10FWHxTDSOJROfv9ImdOl0LlGuj9qFmfN/B9VjdrZ7I=;
	h=From:To:Cc:Subject:Date:From;
	b=QWCF4kppf86HaHTXbty0bQjBY4TQXasd+ETXU0HcYFx+w6qWh8fwyY1MIwA9ooMQS
	 BU9Zyp5QX6u9qvrQW92HHrJ69jecDszu+bCJ6q2kTyjLPUuzLK14OBUB9I1BqTygq2
	 9SROD4E4jqQM+P33h4IVqvhAtxKZJANRKFWXW1eE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] media: v4l2-subdev: Remove stream support for the crop API
Date: Thu,  4 Apr 2024 01:42:33 +0300
Message-ID: <20240403224233.18224-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When support for streams was added to the V4L2 subdev API, the
v4l2_subdev_crop structure was extended with a stream field, but the
field was not handled in the core code that translates the
VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. This could be
fixed, but the crop API is deprecated and shouldn't be used by new
userspace code. It's therefore best to avoid extending it with new
features. Drop the stream field from the v4l2_subdev_crop structure, and
update the documentation and kernel code accordingly.

Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This supersedes the "[PATCH] media: v4l2-subdev: Fix stream handling for
crop API" patch ([1]). I'll submit matching patches for v4l2-compliance.

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20240401233725.2401-1-laurent.pinchart@ideasonboard.com/
---
 .../userspace-api/media/v4l/vidioc-subdev-g-crop.rst        | 5 +----
 drivers/media/v4l2-core/v4l2-subdev.c                       | 6 ------
 include/uapi/linux/v4l2-subdev.h                            | 4 +---
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
index 92d933631fda..7eeb7b553abf 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
@@ -96,10 +96,7 @@ modified format should be as close as possible to the original request.
       - ``rect``
       - Crop rectangle boundaries, in pixels.
     * - __u32
-      - ``stream``
-      - Stream identifier.
-    * - __u32
-      - ``reserved``\ [7]
+      - ``reserved``\ [8]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4c6198c48dd6..02c2a2b472df 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -725,9 +725,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_crop *crop = arg;
 		struct v4l2_subdev_selection sel;
 
-		if (!client_supports_streams)
-			crop->stream = 0;
-
 		memset(crop->reserved, 0, sizeof(crop->reserved));
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
@@ -749,9 +746,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
 			return -EPERM;
 
-		if (!client_supports_streams)
-			crop->stream = 0;
-
 		memset(crop->reserved, 0, sizeof(crop->reserved));
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 7048c51581c6..f7eea12d8a2c 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -48,15 +48,13 @@ struct v4l2_subdev_format {
  * @which: format type (from enum v4l2_subdev_format_whence)
  * @pad: pad number, as reported by the media API
  * @rect: pad crop rectangle boundaries
- * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_crop {
 	__u32 which;
 	__u32 pad;
 	struct v4l2_rect rect;
-	__u32 stream;
-	__u32 reserved[7];
+	__u32 reserved[8];
 };
 
 #define V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE	0x00000001

base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
-- 
Regards,

Laurent Pinchart


