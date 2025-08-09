Return-Path: <linux-media+bounces-39201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE8B1F65A
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0A417DB82
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCEB27E04F;
	Sat,  9 Aug 2025 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="crjEO9t3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C70226D1F
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774253; cv=none; b=b1cAVE9Qv5zvhtNbAzvcMdapyrGduRmlK0N5aBdcGkgMIHCkVglfZeykJFicliOPlRzLYG1n8upHHGfWNctUSAVnE/AqpUFLp2cPT3/zKHVU1RcA72M0v8KtjJZvnmKCv7Hs1IzHv0VXJrVvT8TdqPIZuGXU3L7MzS2BtWbDvPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774253; c=relaxed/simple;
	bh=JgLQsJwyUxcumS5GsLqLRNxVcVm9bHoIqRetBEGtlGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CawfHE6iAl7eNablHT8Sd34tVlyAj9aRwlTtHQQ3J92hfqZvgJh4ysTBkafqvw3Vmp8WSrZe97BoUxg0gWBixLXKCpcAjXypGC7ET4Wwg0khD8ATorxJ+Plla59D4TmVzR5x9yLAhmWbQXiQT+mn8LJswClHoSKPEGLfZtcU2cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=crjEO9t3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6614215B5;
	Sat,  9 Aug 2025 23:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774189;
	bh=JgLQsJwyUxcumS5GsLqLRNxVcVm9bHoIqRetBEGtlGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=crjEO9t3P7q0tFPjGUy8oYQi066nLt3H/hRUt42vtRD73/pUKqYBeycLzzuTWXizG
	 SIdKBpW3DtZVyQ66GGxMimz/jd8i2in8mhJ2BPzb7VrJr2PkSWBe/Cc4IqgD+jJFuq
	 dvKyFYti4s/V5C7xVLrYbZsU9sVHjyI+m/d3N9h4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 06/76] media: usb: uvcvideo: Store v4l2_fh pointer in file->private_data
Date: Sun, 10 Aug 2025 00:15:43 +0300
Message-ID: <20250809211654.28887-7-laurent.pinchart@ideasonboard.com>
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
uvcvideo driver instead stores the pointer to the driver-specific
structure that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer
itself to standardize behaviour across drivers. This also prepares for
future refactoring that depends on v4l2_fh being stored in private_data.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 10 +++++-----
 drivers/media/usb/uvc/uvcvideo.h |  5 +++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 160f9cf6e6db..6dd329a972fd 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -603,14 +603,14 @@ static int uvc_v4l2_open(struct file *file)
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
 	handle->stream = stream;
-	file->private_data = handle;
+	file->private_data = &handle->vfh;
 
 	return 0;
 }
 
 static int uvc_v4l2_release(struct file *file)
 {
-	struct uvc_fh *handle = file->private_data;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
@@ -626,7 +626,7 @@ static int uvc_v4l2_release(struct file *file)
 static int uvc_ioctl_querycap(struct file *file, void *fh,
 			      struct v4l2_capability *cap)
 {
-	struct uvc_fh *handle = file->private_data;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	struct uvc_streaming *stream = handle->stream;
 
@@ -1170,7 +1170,7 @@ static int uvc_v4l2_put_xu_query(const struct uvc_xu_control_query *kp,
 static long uvc_v4l2_compat_ioctl32(struct file *file,
 		     unsigned int cmd, unsigned long arg)
 {
-	struct uvc_fh *handle = file->private_data;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	union {
 		struct uvc_xu_control_mapping xmap;
 		struct uvc_xu_control_query xqry;
@@ -1221,7 +1221,7 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 static long uvc_v4l2_unlocked_ioctl(struct file *file,
 				    unsigned int cmd, unsigned long arg)
 {
-	struct uvc_fh *handle = file->private_data;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	unsigned int converted_cmd = v4l2_translate_cmd(cmd);
 	int ret;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 757254fc4fe9..8b5625203048 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -637,6 +637,11 @@ struct uvc_fh {
 	unsigned int pending_async_ctrls;
 };
 
+static inline struct uvc_fh *to_uvc_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct uvc_fh, vfh);
+}
+
 /* ------------------------------------------------------------------------
  * Debugging, printing and logging
  */
-- 
Regards,

Laurent Pinchart


