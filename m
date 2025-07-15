Return-Path: <linux-media+bounces-37804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4850EB0664F
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C94D7B27CC
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 18:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85062BE7A0;
	Tue, 15 Jul 2025 18:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="onqNBnrq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67F22BE634
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 18:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752605581; cv=none; b=OQiLixPKGzzaq39fVfYklBIPw9dZQV5jsAajxHca4exFC6c7Dj4nb3458z0JQqvrU4syk40dpSDPtUDY5Arhh/61m3Wyhc3Ujg2UycCI4V6DB9Thc90c9T+ugdzdcjDc+wrSrmizsPStDHWgy4s/th4obMcJ9AEJZqVf2Komd7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752605581; c=relaxed/simple;
	bh=2Vndx4FRdqEtOwQMOXITJtW+D0TeyjIPgheRPLJOtMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PD05YpfSknZW1pJHVlB0uPqy+/kSu/8NqEILtV+jt2C89YQxTUow9wvJeOWM0OwaPWNQCuf6YLdahzVnAZZA52eSwExQdeVfhk1c+ZbiI1FDVNYvbmLsQ4APtwxUtvk7NX1NcM1rgGq8ly4+0YYJWXq9K8kt3BoKIyM25TSgt7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=onqNBnrq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A480C735;
	Tue, 15 Jul 2025 20:52:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752605545;
	bh=2Vndx4FRdqEtOwQMOXITJtW+D0TeyjIPgheRPLJOtMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=onqNBnrqqLjDlCkyMLLveqQPqsBakeUOzdlOfOn2ZTbFzL6GoF4li/KDNAkzHNtzQ
	 w5Id1Q3xYhU5pQ3y/GvJfBgVQ8MUKYZS8JbmDAi+fbmhtnvBcDTeRX/SE7zsfzWihw
	 Z/Ftq3xX8vCB84j/yjfiJ1fUvQcPIudUzvCUVbZ0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 1/3] media: uvcvideo: Drop unneeded memset() in meta device ioctl handlers
Date: Tue, 15 Jul 2025 21:52:52 +0300
Message-ID: <20250715185254.6592-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The .vidioc_g_fmt_meta_cap() and .vidioc_enum_fmt_meta_cap() ioctl
handlers for meta capture devices memset the ioctl argument structure to
zero. This is unnecessary as the memory is already zeroed by the V4L2
ioctl core. Drop the memset(), which, in uvc_meta_v4l2_enum_formats(),
also allows further simplification as structure fields don't need to be
saved and restored.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_metadata.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 229e08ff323e..b68bfb2d47df 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -49,8 +49,6 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *fh,
 	if (format->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
-	memset(fmt, 0, sizeof(*fmt));
-
 	fmt->dataformat = stream->meta.format;
 	fmt->buffersize = UVC_METADATA_BUF_SIZE;
 
@@ -118,19 +116,14 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 	struct v4l2_fh *vfh = file->private_data;
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
-	u32 i = fdesc->index;
 
 	if (fdesc->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
-	if (i >= dev->nmeta_formats)
+	if (fdesc->index >= dev->nmeta_formats)
 		return -EINVAL;
 
-	memset(fdesc, 0, sizeof(*fdesc));
-
-	fdesc->type = vfh->vdev->queue->type;
-	fdesc->index = i;
-	fdesc->pixelformat = dev->meta_formats[i];
+	fdesc->pixelformat = dev->meta_formats[fdesc->index];
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart


