Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABEA2C6286
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 11:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgK0KKL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 05:10:11 -0500
Received: from retiisi.eu ([95.216.213.190]:44568 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbgK0KKK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 05:10:10 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id F34BF634C24
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 12:09:17 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 1/1] v4l: subdev: Set sd->devnode before registering the subdev
Date:   Fri, 27 Nov 2020 12:05:26 +0200
Message-Id: <20201127100526.27652-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev's video device node was only assigned after registering the
device node in the system. While it is unlikely that a driver needed to
use this field in handling system calls to its file handle, there remains
a slim chance the devnode field remains NULL while the driver expects to
find a video node there.

Assign the devnode field before registering the device, and assign it back
to NULL if the registration failed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
I'm sending this separately from the rest of the serialisation set, after
a rebase, as it makes sense without it, too.

 drivers/media/v4l2-core/v4l2-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index de4287251a89..d2e58ae91f9b 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -218,13 +218,14 @@ int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
 		vdev->ctrl_handler = sd->ctrl_handler;
 		if (read_only)
 			set_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
+		sd->devnode = vdev;
 		err = __video_register_device(vdev, VFL_TYPE_SUBDEV, -1, 1,
 					      sd->owner);
 		if (err < 0) {
+			sd->devnode = NULL;
 			kfree(vdev);
 			goto clean_up;
 		}
-		sd->devnode = vdev;
 #if defined(CONFIG_MEDIA_CONTROLLER)
 		sd->entity.info.dev.major = VIDEO_MAJOR;
 		sd->entity.info.dev.minor = vdev->minor;
-- 
2.27.0

