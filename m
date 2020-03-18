Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB04018A40A
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 21:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgCRUsA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 16:48:00 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:50047 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727225AbgCRUsA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 16:48:00 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9E95E20004;
        Wed, 18 Mar 2020 20:47:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org, robh@kernel.org,
        devicetree@vger.kernel.org,
        Niklas Soderlund <niklas.soderlund@ragnatech.se>
Subject: [PATCH v7 03/11] dt-bindings: video-interface: Replace 'rotation' description
Date:   Wed, 18 Mar 2020 21:50:26 +0100
Message-Id: <20200318205034.949531-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318205034.949531-1-jacopo@jmondi.org>
References: <20200318205034.949531-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the 'rotation' property description by providing a definition
relative to the camera sensor pixel array coordinate system and the
captured scene.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Niklas Soderlund <niklas.soderlund@ragnatech.se>

---
 .../bindings/media/video-interfaces.txt       | 359 +++++++++++++++++-
 1 file changed, 356 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index 1211bdf80722..36e61d599f34 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -85,9 +85,362 @@ Optional properties

 - lens-focus: A phandle to the node of the focus lens controller.

-- rotation: The device, typically an image sensor, is not mounted upright,
-  but a number of degrees counter clockwise. Typical values are 0 and 180
-  (upside down).
+- rotation: The camera rotation is expressed as the angular difference in
+  degrees between two reference systems, one relative to the camera module, and
+  one defined on the external world scene to be captured when projected on the
+  image sensor pixel array.
+
+  A camera sensor has a 2-dimensional reference system 'Rc' defined by
+  its pixel array read-out order. The origin is set to the first pixel
+  being read out, the X-axis points along the column read-out direction
+  towards the last columns, and the Y-axis along the row read-out
+  direction towards the last row.
+
+  A typical example for a sensor with a 2592x1944 pixel array matrix
+  observed from the front is
+
+              2591       X-axis          0
+                <------------------------+ 0
+                .......... ... ..........!
+                .......... ... ..........! Y-axis
+                           ...           !
+                .......... ... ..........!
+                .......... ... ..........! 1943
+                                         V
+
+  The external world scene reference system 'Rs' is a 2-dimensional
+  reference system on the focal plane of the camera module. The origin is
+  placed on the top-left corner of the visible scene, the X-axis points
+  towards the right, and the Y-axis points towards the bottom of the
+  scene. The top, bottom, left and right directions are intentionally not
+  defined and depend on the environment in which the camera is used.
+
+  A typical example of a (very common) picture of a shark swimming from
+  left to right, as seen from the camera, is
+
+               0               X-axis
+             0 +------------------------------------->
+               !
+               !
+               !
+               !           |\____)\___
+               !           ) _____  __`<
+               !           |/     )/
+               !
+               !
+               !
+               V
+             Y-axis
+
+  With the reference system 'Rs' placed on the camera focal plane.
+
+                                  ¸.·˙!
+                              ¸.·˙    !
+                  _       ¸.·˙        !
+               +-/ \-+¸.·˙            !
+               | (o) |                ! Camera focal plane
+               +-----+˙·.¸            !
+                          ˙·.¸        !
+                              ˙·.¸    !
+                                  ˙·.¸!
+
+  When projected on the sensor's pixel array, the image and the associated
+  reference system 'Rs' are typically (but not always) inverted, due to
+  the camera module's lens optical inversion effect.
+
+  Assuming the above represented scene of the swimming shark, the lens
+  inversion projects the scene and its reference system onto the sensor
+  pixel array, seen from the front of the camera sensor, as follow
+
+            Y-axis
+               ^
+               !
+               !
+               !
+               !            |\_____)\__
+               !            ) ____  ___.<
+               !            |/    )/
+               !
+               !
+               !
+             0 +------------------------------------->
+               0               X-axis
+
+  Note the shark being upside-down.
+
+  The resulting projected reference system is named 'Rp'.
+
+  The camera rotation property is then defined as the angular difference
+  in the counter-clockwise direction between the camera reference system
+  'Rc' and the projected scene reference system 'Rp'. It is expressed in
+  degrees as a number in the range [0, 360[.
+
+  Examples
+
+  0 degrees camera rotation
+
+
+                    Y-Rp
+                     ^
+              Y-Rc   !
+               ^     !
+               !     !
+               !     !
+               !     !
+               !     !
+               !     !
+               !     !
+               !     !
+               !   0 +------------------------------------->
+               !     0               X-Rp
+             0 +------------------------------------->
+               0               X-Rc
+
+
+                                X-Rc                0
+               <------------------------------------+ 0
+                           X-Rp                 0   !
+           <------------------------------------+ 0 !
+                                                !   !
+                                                !   !
+                                                !   !
+                                                !   !
+                                                !   !
+                                                !   !
+                                                !   !
+                                                !   V
+                                                !  Y-Rc
+                                                V
+                                               Y-Rp
+
+  90 degrees camera rotation
+
+               0        Y-Rc
+             0 +-------------------->
+               !   Y-Rp
+               !    ^
+               !    !
+               !    !
+               !    !
+               !    !
+               !    !
+               !    !
+               !    !
+               !    !
+               !    !
+               !  0 +------------------------------------->
+               !    0              X-Rp
+               !
+               !
+               !
+               !
+               V
+              X-Rc
+
+  180 degrees camera rotation
+
+                                            0
+       <------------------------------------+ 0
+                        X-Rc                !
+              Y-Rp                          !
+               ^                            !
+               !                            !
+               !                            !
+               !                            !
+               !                            !
+               !                            !
+               !                            !
+               !                            V
+               !                           Y-Rc
+             0 +------------------------------------->
+               0              X-Rp
+
+  270 degrees camera rotation
+
+               0        Y-Rc
+             0 +-------------------->
+               !                                        0
+               !    <-----------------------------------+ 0
+               !                    X-Rp                !
+               !                                        !
+               !                                        !
+               !                                        !
+               !                                        !
+               !                                        !
+               !                                        !
+               !                                        !
+               !                                        !
+               !                                        V
+               !                                       Y-Rp
+               !
+               !
+               !
+               !
+               V
+              X-Rc
+
+
+  Example one - Webcam
+
+  A camera module installed on the user facing part of a laptop screen
+  casing used for video calls. The captured images are meant to be
+  displayed in landscape mode (width > height) on the laptop screen.
+
+  The camera is typically mounted upside-down to compensate the lens
+  optical inversion effect.
+
+                    Y-Rp
+              Y-Rc   ^
+               ^     !
+               !     !
+               !     !       |\_____)\__
+               !     !       ) ____  ___.<
+               !     !       |/    )/
+               !     !
+               !     !
+               !     !
+               !   0 +------------------------------------->
+               !     0           X-Rp
+             0 +------------------------------------->
+               0            X-Rc
+
+  The two reference systems are aligned, the resulting camera rotation is
+  0 degrees, no rotation correction needs to be applied to the resulting
+  image once captured to memory buffers to correctly display it to users.
+
+               +--------------------------------------+
+               !                                      !
+               !                                      !
+               !                                      !
+               !             |\____)\___              !
+               !             ) _____  __`<            !
+               !             |/     )/                !
+               !                                      !
+               !                                      !
+               !                                      !
+               +--------------------------------------+
+
+  If the camera sensor is not mounted upside-down to compensate for the
+  lens optical inversion, the two reference systems will not be aligned,
+  with 'Rp' being rotated 180 degrees relatively to 'Rc'.
+
+
+                        X-Rc                0
+       <------------------------------------+ 0
+                                            !
+              Y-Rp                          !
+               ^                            !
+               !                            !
+               !       |\_____)\__          !
+               !       ) ____  ___.<        !
+               !       |/    )/             !
+               !                            !
+               !                            !
+               !                            V
+               !                           Y-Rc
+             0 +------------------------------------->
+               0            X-Rp
+
+  The image once captured to memory will then be rotated by 180 degrees
+
+               +--------------------------------------+
+               !                                      !
+               !                                      !
+               !                                      !
+               !              __/(_____/|             !
+               !            >.___  ____ (             !
+               !                 \(    \|             !
+               !                                      !
+               !                                      !
+               !                                      !
+               +--------------------------------------+
+
+  A software rotation correction of 180 degrees should be applied to
+  correctly display the image.
+
+               +--------------------------------------+
+               !                                      !
+               !                                      !
+               !                                      !
+               !             |\____)\___              !
+               !             ) _____  __`<            !
+               !             |/     )/                !
+               !                                      !
+               !                                      !
+               !                                      !
+               +--------------------------------------+
+
+  Example two - Phone camera
+
+  A camera installed on the back side of a mobile device facing away from
+  the user. The captured images are meant to be displayed in portrait mode
+  (height > width) to match the device screen orientation and the device
+  usage orientation used when taking the picture.
+
+  The camera sensor is typically mounted with its pixel array longer side
+  aligned to the device longer side, upside-down mounted to compensate for
+  the lens optical inversion effect.
+
+               0        Y-Rc
+             0 +-------------------->
+               !   Y-Rp
+               !    ^
+               !    !
+               !    !
+               !    !
+               !    !            |\_____)\__
+               !    !            ) ____  ___.<
+               !    !            |/    )/
+               !    !
+               !    !
+               !    !
+               !  0 +------------------------------------->
+               !    0                X-Rp
+               !
+               !
+               !
+               !
+               V
+              X-Rc
+
+  The two reference systems are not aligned and the 'Rp' reference
+  system is rotated by 90 degrees in the counter-clockwise direction
+  relatively to the 'Rc' reference system.
+
+  The image once captured to memory will be rotated.
+
+               +-------------------------------------+
+               |                 _ _                 |
+               |                \   /                |
+               |                 | |                 |
+               |                 | |                 |
+               |                 |  >                |
+               |                <  |                 |
+               |                 | |                 |
+               |                   .                 |
+               |                  V                  |
+               +-------------------------------------+
+
+  A correction of 90 degrees in counter-clockwise direction has to be
+  applied to correctly display the image in portrait mode on the device
+  screen.
+
+                        +--------------------+
+                        |                    |
+                        |                    |
+                        |                    |
+                        |                    |
+                        |                    |
+                        |                    |
+                        |   |\____)\___      |
+                        |   ) _____  __`<    |
+                        |   |/     )/        |
+                        |                    |
+                        |                    |
+                        |                    |
+                        |                    |
+                        |                    |
+                        +--------------------+

 - location: The mount location of a device (typically an image sensor or a flash
   LED) expressed as a position relative to the usage orientation of the system
--
2.25.1

