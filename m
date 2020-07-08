Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE85218F02
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 19:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgGHRsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 13:48:47 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:37865 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726765AbgGHRsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jul 2020 13:48:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id tEBQjfEVAJcNHtEBUjod7l; Wed, 08 Jul 2020 19:48:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594230520; bh=VNwuhZD6QuESO3kUDggweSEhkH/zAl7+wAd91LTL0oE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tHHPORn1MQqZcsOjeGb3nSxHAbUCLAJCNzKuKhT92bLMsntgKOXHX1/EY5RZ8wOE+
         yIPWQDsFKnrPT26Ng2oWiKYG+VoxV0AA40VhSNmkFlsj6VJGIYok/C5I4I9mHr7U+1
         AV8UaStL6m2WBy50AK1WE7tEo8qe383SMwUqR3eUSOdHMu7cmpQhh3vtPky17iZ780
         pDEKJRx8lzoGfrg5ulJpQRa0GmZItqW4xmg0bSsmmBkcy/GKEpOYV2sxYcU9Jl8zvN
         /ZnrEiqLnWvtSrYXj4q0tw2ihu1qAkaAGRp1rNkfrST7VoH9/7JlBRDJcHncE3OL0V
         8k/OWCYwLmW1g==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-dev: call vb2_queue_release in video_unregister_device()
Message-ID: <a96fe39d-9b0e-a644-fc5c-e4945b8a0609@xs4all.nl>
Date:   Wed, 8 Jul 2020 19:48:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP81GdLZobtgg1ZiQI5BhuJJFB0fPUdh4/KaYXt/5VrwpPzuIvkuV2cQ3hAYShva/E6aaFsR23MXkNf2LIVkHyMbXg6LDpYezVLXmVZ7V6jgYVfKxjtt
 3mcReykUQK8O18YJvQYoQgm9tNiY24RpDXz8Jm9M2UlJuhm5QIKM1Ed50c6ow464GWm+hhw0hkSEHCVYYr+P8cVHuN3z6FwraDk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a video device is unregistered the video device node may still be
open (this is the case if the driver is unbound).

Normally vb2_queue_release() is called from vb2_fop_release() which in
turn is called when the filehandle that 'owns' the queue is closed.

But that might happen quite a long time afterwards when sensor drivers
etc. have already been unbound as well. This causes problems in the more
complex drivers, but it makes sense to just release the queue when the
device is unregistered instead of waiting for the filehandle to be closed.

Drivers that do not use vb2_fop_release() will still have to do this
manually when they call video_unregister_device() if necessary.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index a593ea0598b5..ebe1a1647816 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -28,6 +28,7 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
+#include <media/videobuf2-v4l2.h>

 #define VIDEO_NUM_DEVICES	256
 #define VIDEO_NAME              "video4linux"
@@ -1086,6 +1087,17 @@ void video_unregister_device(struct video_device *vdev)
 	 */
 	clear_bit(V4L2_FL_REGISTERED, &vdev->flags);
 	mutex_unlock(&videodev_lock);
+	if (vdev->queue && vdev->queue->owner) {
+		struct mutex *lock = vdev->queue->lock ?
+			vdev->queue->lock : vdev->lock;
+
+		if (lock)
+			mutex_lock(lock);
+		vb2_queue_release(vdev->queue);
+		vdev->queue->owner = NULL;
+		if (lock)
+			mutex_unlock(lock);
+	}
 	device_unregister(&vdev->dev);
 }
 EXPORT_SYMBOL(video_unregister_device);
