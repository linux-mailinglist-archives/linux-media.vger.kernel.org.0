Return-Path: <linux-media+bounces-37098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E3DAFC8CB
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 742D216CB9D
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DED62D660D;
	Tue,  8 Jul 2025 10:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6A1iklw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368926D4C6
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971593; cv=none; b=ikEIIaA/eLr9tkRdL+HjhW6LYKw574OU5OyxBF8o/P3xdAMAZQq35K0oYF/LkkFh+r+2HObXxhs21c9LbLCHTbYeLOLZAPEFJXTAHyAR2TIEJ5/B9Cg8ZYyxBc8wnu4n0Y8ADJUqaUTm+Lj4GEfWdyq0vbqja4fWj5CgVih9ReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971593; c=relaxed/simple;
	bh=b8US0zCmVz3y29NqQCZ1dXsXCQXIMOn2mcCr/DRcuVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuAYSFUz4luQUqt7CB7SP+OCT97e/CXCKL+BMBCCHLqm6n92Kho+m9+yKKjAwnxgrRkb0R3avXpm7ZTi7SfHiRyLtWNhK3bBFCoVxn+RzZOCe04scjpmvcfXzrrSsoLWeHU+aHi4BtTC+FBf1sRcmnra6dTAWbE+jsa7n9Kf4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6A1iklw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BC2C4CEF0;
	Tue,  8 Jul 2025 10:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751971592;
	bh=b8US0zCmVz3y29NqQCZ1dXsXCQXIMOn2mcCr/DRcuVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6A1iklwwbyPBGjTmla+mTF4FONCY9QfMBvHwB8uuM2lHrCKQP4Epnl35Ys/CQC/j
	 aF5xDX+yR5x5Pdp3y6EMkR8EV6rEq1GbtZLvKzoEXAFm9Ty7n/NRueR5ng2RU1eGHC
	 4hStXnvWCtou0MlIYhexlLhNy5yhgGTiN7RYtZFUbLn6hpcLcabJqLE4y9+vpSERyj
	 L6b53yhzFKk1ivTvt+6nvnyMfjeTAZzinq0syMHHBrfEuORkRJTgTjadd3UoWn6ahu
	 NpzmCZbxdCbs9NLH4U1fdRd6py3QR4BjfS8JIO3umYPFQdgQSJFPgglMhQLXKRrPE/
	 vinIc1ijCdyrA==
From: Hans de Goede <hansg@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Use a count variable for meta_formats instead of 0 terminating
Date: Tue,  8 Jul 2025 12:46:22 +0200
Message-ID: <20250708104622.73237-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708104622.73237-1-hansg@kernel.org>
References: <20250708104622.73237-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code dealing with the 0 terminated meta_formats array is a bit klunky
especially for the uvc_meta_v4l2_enum_formats() case.

Instead of 0 terminating add an unsigned int nmeta_formats member to struct
uvc_device and use that. This leads to slightly cleaner code.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 21 +++++++++------------
 drivers/media/usb/uvc/uvcvideo.h     |  4 ++--
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 12972527ab8d..229e08ff323e 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -64,17 +64,16 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
-	u32 fmeta = fmt->dataformat;
-	u32 i;
+	u32 fmeta = V4L2_META_FMT_UVC;
 
 	if (format->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
-	for (i = 0; (fmeta != dev->meta_formats[i]) && dev->meta_formats[i];
-	     i++)
-		;
-	if (!dev->meta_formats[i])
-		fmeta = V4L2_META_FMT_UVC;
+	for (unsigned int i = 0; i < dev->nmeta_formats; i++)
+		if (dev->meta_formats[i] == fmt->dataformat) {
+			fmeta = fmt->dataformat;
+			break;
+		}
 
 	memset(fmt, 0, sizeof(*fmt));
 
@@ -119,14 +118,12 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 	struct v4l2_fh *vfh = file->private_data;
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
-	u32 i;
+	u32 i = fdesc->index;
 
 	if (fdesc->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
-	for (i = 0; (i < fdesc->index) && dev->meta_formats[i]; i++)
-		;
-	if (!dev->meta_formats[i])
+	if (i >= dev->nmeta_formats)
 		return -EINVAL;
 
 	memset(fdesc, 0, sizeof(*fdesc));
@@ -265,7 +262,7 @@ int uvc_meta_init(struct uvc_device *dev)
 		dev->meta_formats[i++] = V4L2_META_FMT_UVC_MSXU_1_5;
 
 	 /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
-	dev->meta_formats[i++] = 0;
+	dev->nmeta_formats = i;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b34c1914ff39..757254fc4fe9 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -588,8 +588,8 @@ struct uvc_device {
 
 	const struct uvc_device_info *info;
 
-	/* Zero-ended list of meta formats */
-	u32 meta_formats[UVC_MAX_META_DATA_FORMATS + 1];
+	u32 meta_formats[UVC_MAX_META_DATA_FORMATS];
+	unsigned int nmeta_formats;
 
 	atomic_t nmappings;
 
-- 
2.49.0


