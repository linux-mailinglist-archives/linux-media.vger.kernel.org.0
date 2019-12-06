Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB50114E01
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 10:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbfLFJFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 04:05:30 -0500
Received: from faui03.informatik.uni-erlangen.de ([131.188.30.103]:55550 "EHLO
        faui03.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726109AbfLFJFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Dec 2019 04:05:30 -0500
X-Greylist: delayed 606 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Dec 2019 04:05:29 EST
Received: from faui04l.informatik.uni-erlangen.de (faui04l.informatik.uni-erlangen.de [IPv6:2001:638:a000:4130:131:188:30:142])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 9B6AE241797;
        Fri,  6 Dec 2019 09:54:57 +0100 (CET)
Received: by faui04l.informatik.uni-erlangen.de (Postfix, from userid 66757)
        id 7997E620AD0; Fri,  6 Dec 2019 09:54:57 +0100 (CET)
From:   Michael Kupfer <michael.kupfer@fau.de>
To:     eric@anholt.net, wahrenst@gmx.net,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, mchehab+samsung@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        dave.stevenson@raspberrypi.org, daniela.mormocea@gmail.com,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-kernel@i4.cs.fau.de, Michael Kupfer <michael.kupfer@fau.de>,
        Kay Friedrich <kay.friedrich@fau.de>
Subject: [PATCH] staging/vc04_services/bcm2835-camera: distinct numeration and names for devices
Date:   Fri,  6 Dec 2019 09:54:32 +0100
Message-Id: <20191206085432.19962-1-michael.kupfer@fau.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create a static atomic counter for numerating cameras.
Use the Media Subsystem Kernel Internal API to create distinct
device-names, so that the camera-number (given by the counter)
matches the camera-name.

Co-developed-by: Kay Friedrich <kay.friedrich@fau.de>
Signed-off-by: Kay Friedrich <kay.friedrich@fau.de>
Signed-off-by: Michael Kupfer <michael.kupfer@fau.de>
---
 .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index beb6a0063bb8..be5f90a8b49d 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -60,6 +60,9 @@ MODULE_PARM_DESC(max_video_width, "Threshold for video mode");
 module_param(max_video_height, int, 0644);
 MODULE_PARM_DESC(max_video_height, "Threshold for video mode");
 
+/* camera instance counter */
+static atomic_t camera_instance = ATOMIC_INIT(0);
+
 /* global device data array */
 static struct bm2835_mmal_dev *gdev[MAX_BCM2835_CAMERAS];
 
@@ -1870,7 +1873,6 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
 
 		/* v4l2 core mutex used to protect all fops and v4l2 ioctls. */
 		mutex_init(&dev->mutex);
-		dev->camera_num = camera;
 		dev->max_width = resolutions[camera][0];
 		dev->max_height = resolutions[camera][1];
 
@@ -1886,8 +1888,9 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
 		dev->capture.fmt = &formats[3]; /* JPEG */
 
 		/* v4l device registration */
-		snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
-			 "%s", BM2835_MMAL_MODULE_NAME);
+		dev->camera_num = v4l2_device_set_name(&dev->v4l2_dev,
+						       BM2835_MMAL_MODULE_NAME,
+						       &camera_instance);
 		ret = v4l2_device_register(NULL, &dev->v4l2_dev);
 		if (ret) {
 			dev_err(&pdev->dev, "%s: could not register V4L2 device: %d\n",
-- 
2.20.1

