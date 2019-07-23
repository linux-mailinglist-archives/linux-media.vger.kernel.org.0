Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 350EA713D0
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 10:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733030AbfGWIVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 04:21:31 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45223 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731172AbfGWIVb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 04:21:31 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pq33httueLqASpq36hI2wE; Tue, 23 Jul 2019 10:21:30 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] v4l2-dev/ioctl: require non-zero device_caps, verify sane
 querycap results
Message-ID: <1025a223-5625-2776-4524-473590a664eb@xs4all.nl>
Date:   Tue, 23 Jul 2019 10:21:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHeTBaT2B74qdS7bG+b9odQJB9qlw2Q0cd1ns8tFv0CVRXf2AT6HtoGKlohR/vB98RCThjUjPlRJib/1As9yFmJ4oF7Yj792u3oXAOw4l7qAe7xLhZqv
 t/a1GriiZsER3QSfc/UpS0rAQQBTNlVfjUgnMvn2PPiyTxolPT8/cyqIzAZMJBqB3hciCyINpdD5Cw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that all V4L2 drivers set device_caps in struct video_device, we can add
a check for this to ensure all future drivers fill this in.

Also verify that when the querycap ioctl is called the driver didn't mess
with the device_caps value and that capabilities is a superset of device_caps.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index cbb74f748555..3af72e3bbd65 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -859,6 +859,9 @@ int __video_register_device(struct video_device *vdev,
 	/* the v4l2_dev pointer MUST be present */
 	if (WARN_ON(!vdev->v4l2_dev))
 		return -EINVAL;
+	/* the device_caps field MUST be set */
+	if (WARN_ON(!vdev->device_caps))
+		return -EINVAL;

 	/* v4l2_fh support */
 	spin_lock_init(&vdev->fh_lock);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index e36629ae2203..61846c355627 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1057,14 +1057,18 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,

 	ret = ops->vidioc_querycap(file, fh, cap);

-	cap->capabilities |= V4L2_CAP_EXT_PIX_FORMAT;
 	/*
-	 * Drivers MUST fill in device_caps, so check for this and
-	 * warn if it was forgotten.
+	 * Drivers must not change device_caps, so check for this and
+	 * warn if this happened.
+	 */
+	WARN_ON(cap->device_caps != vfd->device_caps);
+	/*
+	 * Check that capabilities is a superset of
+	 * vfd->device_caps | V4L2_CAP_DEVICE_CAPS
 	 */
-	WARN(!(cap->capabilities & V4L2_CAP_DEVICE_CAPS) ||
-		!cap->device_caps, "Bad caps for driver %s, %x %x",
-		cap->driver, cap->capabilities, cap->device_caps);
+	WARN_ON((cap->capabilities & (vfd->device_caps | V4L2_CAP_DEVICE_CAPS)) !=
+	        (vfd->device_caps | V4L2_CAP_DEVICE_CAPS));
+	cap->capabilities |= V4L2_CAP_EXT_PIX_FORMAT;
 	cap->device_caps |= V4L2_CAP_EXT_PIX_FORMAT;

 	return ret;
