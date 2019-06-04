Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45A7934545
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfFDLUH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:20:07 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:57489 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727344AbfFDLUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 07:20:07 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Y7TyhSHLnsDWyY7U4hwRoW; Tue, 04 Jun 2019 13:20:06 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Florian Echtler <floe@butterbrot.org>
Subject: [PATCH 5/7] touchscreen/sur40: set device_caps in struct video_device
Date:   Tue,  4 Jun 2019 13:19:56 +0200
Message-Id: <20190604111958.22331-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPp8g3+lW2gA/Zz0IkS2OkqNsK8Ur7dRFiy1KyKV34PWDsvpH0vluqMkmZZkIiCmey+/d/ifYh9Mmmd/sSYyM/7ghhAR3HnIIN+f9AnkFK1cUZVUwGFk
 u7FBUmhmkhRVXRf9WelrH8dcEbooI5HQPKkT/O+dTsrOiGh1o1lokNeFxV/ggKwWRd7UQpGx3lGqLjZK1yXWPVuAAFp+4bzq8dwYCGsMhTQuiH+s0z/6nQRE
 BXNq5LRb0fkG0r3WN1JBqcgJCJnC0Bu4NLaCz8EcMb6h9NdW/hI4nNZswhwwxeaX
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

