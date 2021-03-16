Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7087033D310
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 12:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbhCPL36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 07:29:58 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45651 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234636AbhCPL3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 07:29:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M7tJl1XkZ4ywlM7tNlAko9; Tue, 16 Mar 2021 12:29:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615894181; bh=jKrzBut6DNXk6+ZmMihSkMyQ7s1INSFwS5dGdAbNyU4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=THmDfPkFI4c6vEpv22okVMy7WRImNsdTGGbuhHQCs48/sDDG6RcOKSPUJHPaI/z4Y
         NZLdVN7Quo+HH35JIp0WocIWtX2rIHgce+Jme7HF6f7ey9GFxImYBDdKcZDDGwcOot
         opiUQ3zTMT7fcWflEOd+pmLwYGaG8x8Cj7J7+uaIHvsPMzaCWqxdWjaAERDGEZxr/K
         cwhNRSE+JH1tbT0RUv9fYzPlsIS4joSHtaonBupXTT0sGv9jra605D02asdCkYEbBq
         Bp1DvT9SiOQFmqa5TYnVToQOeaYOwuSLo5TAsicB5Y3/NfUHbclLBTSXxZ7pvvZ/Qw
         xUQ7Ukt8I2UdA==
Subject: Re: [PATCH v4 11/11] uvc: use vb2 ioctl and fop helpers
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
References: <20210315173609.1547857-1-ribalda@chromium.org>
 <20210315173609.1547857-12-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <286aaafa-549a-6728-dc76-8ab2b1e6c581@xs4all.nl>
Date:   Tue, 16 Mar 2021 12:29:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210315173609.1547857-12-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLCqxChpxEFxZqVLYcP49M+6q1yKHlAHKFXV4CWShQ7RxRuoqlVPYv+G3Hi25GJ9p0KtW7paRL/eEs6+iwJ4liT0nJJTWtF0j9FL1Wp+0qK9RN35+nAh
 5G/TPB8Ws5VFLAYagdmf5IBkNs7Anx0fm/XCCmu/JwG12SharXsI2gD5Hqf36e7S6lvdiPx7sToVus/bglS7+95QyJUylTTC9rJ9xQi2hHQbg0kXxgmzHIRG
 +P3uzbDGvjXsTPMN7Jj4cwjkGTaYSTCaY2Vceg9fozq2tmZw82UdPCJFuzP39mwVALcygXfu67PixjYcI8PiaKrwoT9/T6hU1w6d2vxDgMxuXBBOy9rSqkSq
 oIbRITlxpvpECc/qyiNFCaapuMZryy9ZpwnY9c/nZpZ9aCIHKNamUHmH8p5NPzKhQXkwOjpa
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On 15/03/2021 18:36, Ricardo Ribalda wrote:
> From: Hans Verkuil <hverkuil@xs4all.nl>
> 
> When uvc was written the vb2 ioctl and file operation helpers didn't exist.
> 
> This patch switches uvc over to those helpers, which removes a lot of boilerplate
> code and simplifies VIDIOC_G/S_PRIORITY handling and allows us to drop the
> 'privileges' scheme, since that's now handled inside the vb2 helpers.
> 
> This makes it possible for uvc to pass the v4l2-compliance streaming tests.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>


You can merge this patch into 11/11. I analyzed the uvc get_unmapped_area
implementation and it is 100% identical to the vb2_fop_get_unmapped_area
implementation, so let's use that one instead.

Regards.

	Hans

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index fba9646c8ba5..437e48b32480 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -247,18 +247,6 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
 	return 0;
 }

-/* -----------------------------------------------------------------------------
- * V4L2 queue operations
- */
-
-#ifndef CONFIG_MMU
-unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
-		unsigned long pgoff)
-{
-	return vb2_get_unmapped_area(&queue->queue, 0, 0, pgoff, 0);
-}
-#endif
-
 /* -----------------------------------------------------------------------------
  *
  */
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 348a46637852..172336d6018c 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1260,20 +1260,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 }
 #endif

-#ifndef CONFIG_MMU
-static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
-		unsigned long addr, unsigned long len, unsigned long pgoff,
-		unsigned long flags)
-{
-	struct uvc_fh *handle = file->private_data;
-	struct uvc_streaming *stream = handle->stream;
-
-	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
-
-	return uvc_queue_get_unmapped_area(&stream->queue, pgoff);
-}
-#endif
-
 const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_querycap = uvc_ioctl_querycap,
 	.vidioc_enum_fmt_vid_cap = uvc_ioctl_enum_fmt_vid_cap,
@@ -1325,7 +1311,7 @@ const struct v4l2_file_operations uvc_fops = {
 	.mmap		= vb2_fop_mmap,
 	.poll		= vb2_fop_poll,
 #ifndef CONFIG_MMU
-	.get_unmapped_area = uvc_v4l2_get_unmapped_area,
+	.get_unmapped_area = vb2_fop_get_unmapped_area,
 #endif
 };

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 4e6f0a25b940..a83b16ba6e6a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -787,10 +787,7 @@ struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
 					 struct uvc_buffer *buf);
 struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue);
 void uvc_queue_buffer_release(struct uvc_buffer *buf);
-#ifndef CONFIG_MMU
-unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
-					  unsigned long pgoff);
-#endif
+
 static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
 {
 	return vb2_is_streaming(&queue->queue);
