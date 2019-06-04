Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7676D346F4
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 14:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbfFDMgd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 08:36:33 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36749 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726994AbfFDMgc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 08:36:32 -0400
Received: from [IPv6:2001:420:44c1:2579:8c28:9f60:8294:d97] ([IPv6:2001:420:44c1:2579:8c28:9f60:8294:d97])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Y8fzhSoQzsDWyY8g2hwmSJ; Tue, 04 Jun 2019 14:36:30 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/7 RESEND] touchscreen/sur40: set device_caps in struct
 video_device
To:     linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Florian Echtler <floe@butterbrot.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
Message-ID: <1e12bc3d-3cb3-1f3d-b3bc-b25e3bf95523@xs4all.nl>
Date:   Tue, 4 Jun 2019 14:36:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfACW8jiCHCVGPy0VIEJp4EIHOQQdTIrVceAlqbyc0lTRDZ0KOgHoX1n8nNAKWCm9lqUHq0MmTWZtRmxdpS6oJlHN7BvEnkyHbNCWkQK0C0zs2e9wAdA7
 R7QxWvOSZghRwe0UxD5RyEYK/4JteW0ImDeTfTYoIVhY8p7yBg881/xiiFvnUC00Dolw51kr+0H4bsUyatJVCTP9a22cjOiRetbsue8axsvS1tn5e8mRpSiF
 X1c2urc4KZFjAYDQIL/mPQmweBZLBhT4kX8nocAd3GKtRimdqNnHIJQ3dLfXLU13UIaRpjiqW90tX2lIAfez4lH/SYhI9pzEv1u8I9EFpC7ezv153OVwmXQu
 Sj5s7sGoUPb6IDKFITuvYEcH0mE131TJAGX1AzRnqPbiTeX0WV/yIpFxJvZkjsMoNf3otekisqWxmHTp8Ht9AXZMFwp+kstGo0Y2KHnqCOdrAh53h8SrLixe
 mhCp9PMeRWQyI9t3
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

But this only really works if all drivers use this, so convert
this touchscreen driver accordingly.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Florian Echtler <floe@butterbrot.org>
---
Resend, adding Dmitry and linux-input to the CC list.

Dmitry, if you want to take this through your tree, then that's OK by me.

Alternatively, it can go through the media tree, but then I need your Ack.

Regards,

	Hans
---
 drivers/input/touchscreen/sur40.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 894843a7ec7b..8b18d0acf5e0 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -933,10 +933,6 @@ static int sur40_vidioc_querycap(struct file *file, void *priv,
 	strlcpy(cap->driver, DRIVER_SHORT, sizeof(cap->driver));
 	strlcpy(cap->card, DRIVER_LONG, sizeof(cap->card));
 	usb_make_path(sur40->usbdev, cap->bus_info, sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TOUCH |
-		V4L2_CAP_READWRITE |
-		V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 @@ -1166,6 +1162,8 @@ static const struct video_device sur40_video_device = {
 	.fops = &sur40_video_fops,
 	.ioctl_ops = &sur40_video_ioctl_ops,
 	.release = video_device_release_empty,
+	.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TOUCH |
+		       V4L2_CAP_READWRITE | V4L2_CAP_STREAMING,
 };
  /* USB-specific object needed to register this driver with the USB subsystem. */
-- 
2.20.1

