Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEACF1CA7AA
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 11:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgEHJ7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 05:59:16 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:52311 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgEHJ7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 05:59:16 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 90DFBFF804;
        Fri,  8 May 2020 09:59:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz
Subject: [PATCH v10 05/13] media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
Date:   Fri,  8 May 2020 12:01:50 +0200
Message-Id: <20200508100158.3437161-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200508100158.3437161-1-jacopo@jmondi.org>
References: <20200508100158.3437161-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
control. The newly added read-only control reports the rotation
correction to be applied to images before displaying them to the user.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../media/v4l/ext-ctrls-camera.rst            | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index 01e104bab6b3d..6b618f3b51bf1 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -540,6 +540,127 @@ enum v4l2_scene_mode -
 
 
 
+``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
+    This read-only control describes the rotation correction in degrees in the
+    counter-clockwise direction to be applied to the captured images once
+    captured to memory to compensate for the camera sensor mounting rotation.
+
+    For a precise definition of the sensor mounting rotation refer to the
+    extensive description of the 'rotation' properties in the device tree
+    bindings file 'video-interfaces.txt'.
+
+    A few examples are below reported, using a shark swimming from left to
+    right in front of the user as the example scene to capture. ::
+
+                 0               X-axis
+               0 +------------------------------------->
+                 !
+                 !
+                 !
+                 !           |\____)\___
+                 !           ) _____  __`<
+                 !           |/     )/
+                 !
+                 !
+                 !
+                 V
+               Y-axis
+
+    Example one - Webcam
+
+    Assuming you can bring your laptop with you while swimming with sharks,
+    the camera module of the laptop is installed on the user facing part of a
+    laptop screen casing, and is typically used for video calls. The captured
+    images are meant to be displayed in landscape mode (width > height) on the
+    laptop screen.
+
+    The camera is typically mounted upside-down to compensate the lens optical
+    inversion effect. In this case the value of the
+    V4L2_CID_CAMERA_SENSOR_ROTATION control is 0, no rotation is required to
+    display images correctly to the user.
+
+    If the camera sensor is not mounted upside-down it is required to compensate
+    the lens optical inversion effect and the value of the
+    V4L2_CID_CAMERA_SENSOR_ROTATION control is 180 degrees, as images will
+    result rotated when captured to memory. ::
+
+                 +--------------------------------------+
+                 !                                      !
+                 !                                      !
+                 !                                      !
+                 !              __/(_____/|             !
+                 !            >.___  ____ (             !
+                 !                 \(    \|             !
+                 !                                      !
+                 !                                      !
+                 !                                      !
+                 +--------------------------------------+
+
+    A software rotation correction of 180 degrees has to be applied to correctly
+    display the image on the user screen. ::
+
+                 +--------------------------------------+
+                 !                                      !
+                 !                                      !
+                 !                                      !
+                 !             |\____)\___              !
+                 !             ) _____  __`<            !
+                 !             |/     )/                !
+                 !                                      !
+                 !                                      !
+                 !                                      !
+                 +--------------------------------------+
+
+    Example two - Phone camera
+
+    It is more handy to go and swim with sharks with only your mobile phone
+    with you and take pictures with the camera that is installed on the back
+    side of the device, facing away from the user. The captured images are meant
+    to be displayed in portrait mode (height > width) to match the device screen
+    orientation and the device usage orientation used when taking the picture.
+
+    The camera sensor is typically mounted with its pixel array longer side
+    aligned to the device longer side, upside-down mounted to compensate for
+    the lens optical inversion effect.
+
+    The images once captured to memory will be rotated and the value of the
+    V4L2_CID_CAMERA_SENSOR_ROTATION will report a 90 degree rotation. ::
+
+
+                 +-------------------------------------+
+                 |                 _ _                 |
+                 |                \   /                |
+                 |                 | |                 |
+                 |                 | |                 |
+                 |                 |  >                |
+                 |                <  |                 |
+                 |                 | |                 |
+                 |                   .                 |
+                 |                  V                  |
+                 +-------------------------------------+
+
+    A correction of 90 degrees in counter-clockwise direction has to be
+    applied to correctly display the image in portrait mode on the device
+    screen. ::
+
+                          +--------------------+
+                          |                    |
+                          |                    |
+                          |                    |
+                          |                    |
+                          |                    |
+                          |                    |
+                          |   |\____)\___      |
+                          |   ) _____  __`<    |
+                          |   |/     )/        |
+                          |                    |
+                          |                    |
+                          |                    |
+                          |                    |
+                          |                    |
+                          +--------------------+
+
+
 .. [#f1]
    This control may be changed to a menu control in the future, if more
    options are required.
-- 
2.26.1

