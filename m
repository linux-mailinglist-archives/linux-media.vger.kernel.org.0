Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7A0112692
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 10:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfLDJJJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 04:09:09 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:44187 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfLDJJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 04:09:09 -0500
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1A9C910000C;
        Wed,  4 Dec 2019 09:09:05 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v6 04/11] media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
Date:   Wed,  4 Dec 2019 10:10:49 +0100
Message-Id: <20191204091056.4842-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204091056.4842-1-jacopo@jmondi.org>
References: <20191204091056.4842-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
control. The newly added read-only control reports the camera device
mounting rotation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
index b151c016256c..3528d6a3e1c7 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
@@ -542,6 +542,122 @@ enum v4l2_scene_mode -
 
 
 
+``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
+    This read-only control describes the sensor orientation expressed as
+    rotation in counterclockwise degrees along the axis perpendicular to the
+    device mounting plane, and directed away from the sensor lens. Possible
+    values for the control are 90, 180 and 270 degrees. To compensate for the
+    device mounting rotation on the captured images, a rotation of the same
+    amount of degrees, in the same counterclockwise rotation direction should be
+    applied along the axis directed from the observer to the captured image when
+    displayed on a screen.
+
+    To better understand the effect of the sensor rotation on the acquired
+    images when displayed on a screen, it is helpful to consider a fictional
+    scan-out sequence of the sensor's pixels, assuming the pixel array having
+    its top-left pixel at position (0, 0) with values on the 'x' axis increasing
+    towards the right direction, and values on the 'y' axis increasing towards
+    the bottom. The effect of sensor rotation could be easily visualized
+    considering the sequence of captured pixels.
+
+    Assuming the following scene has to be captured::
+
+                o
+               -|-
+               / \
+
+    An upright mounted sensor has its pixel array displaced as follow::
+
+                                   x
+            (0,0)------------------->
+              ! 0,0 0,1 0,2 ... (0,max-col)
+              ! 1,0 1,1 1,2 ...
+              ! ...
+              ! ...
+              ! (max-row,0) ... (max-col,max-row)
+            y V
+
+
+    Assuming pixels are scanned out from (0,0) to (max-row,max-col)
+    progressively::
+
+             (0,0) ---->------------->   (0,max-col)
+             (1,0) ---->------------->   (1,max-col)
+             ( .... )-->------------->   (   ....   )
+             (max-row,0)----------->   (max-row,max-col)
+
+
+    If a rotation of 90 degrees counterclockwise along the axis perpendicular to
+    the sensor's lens and directed towards the scene to be captured is applied
+    to the sensor, the pixel array would then be rotated as follows::
+
+            x ^ (0,max-col) ...   ...   (max-row,max-col)
+              !  ....
+              !  0,2        1,2   ...          ...
+              !  0,1        1,1   ...          ...
+              !  0,0        1,0   ...      (max-row,0)
+             (0,0)------------------------------------>
+                                                    y
+
+    And the pixel scan-out sequence would then proceed as follows starting
+    from pixel (0,0)::
+
+           (0,max-col)         (max-row,max-col)
+                ^    ^   ^   ^     ^
+                !    !   !   !     !
+                !    !   !   !     !
+                !    !   !   !     !
+                !    !   !   !     !
+              (0,0) (1,0)....  (max-row,0)
+
+    Which when applied to the capture scene gives::
+
+           (0,max-col)         (max-row,max-col)
+                ^    ^   ^   ^     ^
+                !    !   0   !     !
+                !    !  -|-  !     !
+                !    !  /!\  !     !
+                !    !   !   !     !
+              (0,0) (1,0)....  (max-row,0)
+
+    Producing the following image once captured to memory and
+    displayed to the user::
+
+             \ !
+               --0
+             / !
+
+    Which has a rotation of the same amount of degrees applied on the opposite
+    rotation direction along the axis that goes from the observer to the
+    image when displayed on the screen.
+
+    In order to compensate the sensor mounting rotation, when expressed
+    as counterclockwise rotation along the axis directed from the sensor to
+    the captured scene, a rotation of the same amount of degrees in the
+    same counterclockwise rotation direction but applied along the axis
+    directed from the observer to the captured image, has to be applied::
+
+                +------+  90 degree counterclockwise
+                |   o  |  mounting rotation applied
+                |  -|- |  along the axis directed
+                |  / \ |  away from the sensor lens
+                +------+
+                    |
+                    V
+                +------+
+                | \ !  |  Resulting captured
+                |  --0 |  image when displayed
+                | / !  |  on screen
+                +------+
+                    |
+                    V
+                +------+
+                |   o  |  Rotation compensation
+                |  -|- |  is 90 degrees counterclockwise
+                |  / \ |  along the axis directed to the
+                +------+  displayed image
+
+
 .. [#f1]
    This control may be changed to a menu control in the future, if more
    options are required.
-- 
2.23.0

