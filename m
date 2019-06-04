Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3AA334546
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfFDLUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:20:09 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42707 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727323AbfFDLUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 07:20:08 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Y7TyhSHLnsDWyY7U6hwRpE; Tue, 04 Jun 2019 13:20:06 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Eric Anholt <eric@anholt.net>
Subject: [PATCH 6/7] vc04_services/bcm2835-camera: set device_caps in struct video_device
Date:   Tue,  4 Jun 2019 13:19:57 +0200
Message-Id: <20190604111958.22331-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPp8g3+lW2gA/Zz0IkS2OkqNsK8Ur7dRFiy1KyKV34PWDsvpH0vluqMkmZZkIiCmey+/d/ifYh9Mmmd/sSYyM/7ghhAR3HnIIN+f9AnkFK1cUZVUwGFk
 u7FBUmhmkhRVXWJufwZHrl5szrz0cKzGrP3ZU1qb0bp3PnB1Ej3XnjU9+tJ+KqYw06V4FcwHHxWJscGdZzPF6DERamy/4d0KL8FaXSmWa5m0kkTaAjplQkEh
 uQBe9SoN91yCYPUB7RTYiO2QLJpJs7TmjNt6wS3VhVTUBrOiFjERIZmwNM7FfmWNDodpf2T/Pe6WUkFf58CZ0jALRQjjn4aaZub+Ljkk8Lw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

But this only really works if all drivers use this, so convert
this driver accordingly.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Eric Anholt <eric@anholt.net>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 68f08dc18da9..49d0470f9a7e 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -864,10 +864,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 
 	snprintf((char *)cap->bus_info, sizeof(cap->bus_info),
 		 "platform:%s", dev->v4l2_dev.name);
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY |
-	    V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -1446,6 +1442,8 @@ static const struct video_device vdev_template = {
 	.fops = &camera0_fops,
 	.ioctl_ops = &camera0_ioctl_ops,
 	.release = video_device_release_empty,
+	.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY |
+		       V4L2_CAP_STREAMING | V4L2_CAP_READWRITE,
 };
 
 /* Returns the number of cameras, and also the max resolution supported
-- 
2.20.1

