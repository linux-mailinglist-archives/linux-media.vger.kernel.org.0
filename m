Return-Path: <linux-media+bounces-20701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3F89B93D5
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 15:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B61421F21C37
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 14:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FD61AA7A3;
	Fri,  1 Nov 2024 14:59:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E977819DF53;
	Fri,  1 Nov 2024 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473175; cv=none; b=NPZXrUUYREKw/6e3O4X61N9eWkppDNkgpUeVbq1ipuhEBDyDe0tnHsgaGswcLGN/u2rrf5EM77Kk08qM9CSUhwnCl7v8RtDNo4nCACLBfEIBBdubXgiMjOkDVGM/xeVe6arhbt8gcaSVDXPhKEXlTswrxwSPv2b0MzmhSksroLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473175; c=relaxed/simple;
	bh=xL+GqfftCmenl96Zh89R5xUH+YGIzti3inJQEhu3r2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OvHfebA/3gEICKN8J0MjUFfEI7RbJkPhJq4LIFXR03J4znnu1XDXBHFYMLlIsYHlvAT/VkQmdax0HrNP8WVIPPqHyqgKWyYWdvMXy9LPwwZGogQ2os69/kPKuqHlZV+u76LVwmqZ4+c/J8yZg+H8znVAHYwxHDMqaPvbHZ4T9/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id E60F2746A5;
	Fri, 01 Nov 2024 15:59:22 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v2] media: mgb4: Fix inconsistent input/output alignment in loopback mode
Date: Fri,  1 Nov 2024 15:59:11 +0100
Message-ID: <20241101145911.3168-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Fixes broken output due to different input/output alignment in loopback
mode when the (last) input device is closed. Instead of on device close,
do the alignment synchronisation when starting the stream (and clear
it when streaming is stopped).

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 185fb28226b6..9375a4b5d6a7 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -260,6 +260,7 @@ static void buffer_queue(struct vb2_buffer *vb)
 static void stop_streaming(struct vb2_queue *vq)
 {
 	struct mgb4_vin_dev *vindev = vb2_get_drv_priv(vq);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
 	const struct mgb4_vin_config *config = vindev->config;
 	int irq = xdma_get_user_irq(vindev->mgbdev->xdev, config->vin_irq);
 
@@ -273,6 +274,9 @@ static void stop_streaming(struct vb2_queue *vq)
 		mgb4_mask_reg(&vindev->mgbdev->video, config->regs.config, 0x2,
 			      0x0);
 
+	mgb4_write_reg(video, vindev->config->regs.padding, 0);
+	set_loopback_padding(vindev, 0);
+
 	cancel_work_sync(&vindev->dma_work);
 	return_all_buffers(vindev, VB2_BUF_STATE_ERROR);
 }
@@ -280,6 +284,7 @@ static void stop_streaming(struct vb2_queue *vq)
 static int start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct mgb4_vin_dev *vindev = vb2_get_drv_priv(vq);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
 	const struct mgb4_vin_config *config = vindev->config;
 	int irq = xdma_get_user_irq(vindev->mgbdev->xdev, config->vin_irq);
 
@@ -292,6 +297,9 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 		mgb4_mask_reg(&vindev->mgbdev->video, config->regs.config, 0x2,
 			      0x2);
 
+	mgb4_write_reg(video, vindev->config->regs.padding, vindev->padding);
+	set_loopback_padding(vindev, vindev->padding);
+
 	xdma_enable_user_irq(vindev->mgbdev->xdev, irq);
 
 	return 0;
@@ -324,34 +332,16 @@ static int fh_open(struct file *file)
 
 	if (get_timings(vindev, &vindev->timings) < 0)
 		vindev->timings = cea1080p60;
-	set_loopback_padding(vindev, vindev->padding);
 
 out:
 	mutex_unlock(&vindev->lock);
 	return rv;
 }
 
-static int fh_release(struct file *file)
-{
-	struct mgb4_vin_dev *vindev = video_drvdata(file);
-	int rv;
-
-	mutex_lock(&vindev->lock);
-
-	if (v4l2_fh_is_singular_file(file))
-		set_loopback_padding(vindev, 0);
-
-	rv = _vb2_fop_release(file, NULL);
-
-	mutex_unlock(&vindev->lock);
-
-	return rv;
-}
-
 static const struct v4l2_file_operations video_fops = {
 	.owner = THIS_MODULE,
 	.open = fh_open,
-	.release = fh_release,
+	.release = vb2_fop_release,
 	.unlocked_ioctl = video_ioctl2,
 	.read = vb2_fop_read,
 	.mmap = vb2_fop_mmap,
@@ -507,8 +497,6 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 
 	vindev->padding = (f->fmt.pix.bytesperline - (f->fmt.pix.width
 			   * pixelsize)) / pixelsize;
-	mgb4_write_reg(video, vindev->config->regs.padding, vindev->padding);
-	set_loopback_padding(vindev, vindev->padding);
 
 	return 0;
 }

base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
-- 
2.46.2


