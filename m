Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCC834543
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfFDLUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:20:06 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:41067 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727344AbfFDLUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 07:20:05 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Y7TyhSHLnsDWyY7U3hwRoI; Tue, 04 Jun 2019 13:20:04 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 4/7] usb/gadget/f_uvc: set device_caps in struct video_device
Date:   Tue,  4 Jun 2019 13:19:55 +0200
Message-Id: <20190604111958.22331-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMhGJp3qtgoFBYGDmruWg72seUtdMq9tIKCLysFeCzoMe2VNEmVWyTIOyHH27BwCG573JzmPDuZoCGCZcLHT8nCzgasWFZMp8EAsq9DcZPG44y02NUaI
 30fQgEHDBj4z/uKROcMQNOo9GeU1CaFRSPf65+HeVZ1MZ21AHtTh8RqORoGyVXhOqcM68Ow9/xgjzGmdYpo4IDzquRlm8nyGeZpM1jkWCauTO4yLsQS4hiFO
 Bnp5RyYcKW7yhep8FM2lKSrC6ZYqijqUV4WGKVhutJWwOa06KME43X5vZsC4tSL2109Qnduf15YLsTWOn2LjlA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

But this only really works if all drivers use this, so convert
this UVC gadget driver.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/usb/gadget/function/f_uvc.c    | 1 +
 drivers/usb/gadget/function/uvc_v4l2.c | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 8c99392df593..fb0a892687c0 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -423,6 +423,7 @@ uvc_register_video(struct uvc_device *uvc)
 	uvc->vdev.release = video_device_release_empty;
 	uvc->vdev.vfl_dir = VFL_DIR_TX;
 	uvc->vdev.lock = &uvc->video.mutex;
+	uvc->vdev.device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
 	strlcpy(uvc->vdev.name, cdev->gadget->name, sizeof(uvc->vdev.name));
 
 	video_set_drvdata(&uvc->vdev, uvc);
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index a1183eccee22..495f0ec663ea 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -71,10 +71,6 @@ uvc_v4l2_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	strlcpy(cap->card, cdev->gadget->name, sizeof(cap->card));
 	strlcpy(cap->bus_info, dev_name(&cdev->gadget->dev),
 		sizeof(cap->bus_info));
-
-	cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
-- 
2.20.1

