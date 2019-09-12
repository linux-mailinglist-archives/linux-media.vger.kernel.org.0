Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3878B152D
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbfILUJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 16:09:48 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55691 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfILUJs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:09:48 -0400
X-Originating-IP: 85.243.204.24
Received: from uno.lan (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5DEED2000F;
        Thu, 12 Sep 2019 20:09:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v3 04/11] media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
Date:   Thu, 12 Sep 2019 22:10:48 +0200
Message-Id: <20190912201055.13964-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912201055.13964-1-jacopo@jmondi.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
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
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
index f879dcc9409c..74991522ca3a 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
@@ -542,6 +542,123 @@ enum v4l2_scene_mode -
 
 
 
+``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
+    This read-only control describes the sensor orientation expressed as
+    rotation in counterclockwise degrees along the axis perpendicular to the
+    device mounting plane, and directed away from the sensor lens. Possible
+    values for the control are 90, 180 and 270 degrees. To compensate the device
+    mounting rotation on the captured images, a rotation of the same amount of
+    degrees, in the same counterclockwise rotation direction should be applied
+    along the axis directed from the observer to the captured image when
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
+                                      x
+            (0,0)---------------------->
+              ! 0,0 0,1 0,2 ... 0,line-len
+              ! 1,0 1,1 1,2 ...
+              ! ...
+              ! ...
+              ! (num-col,0)...  (num-col,line-len)
+            y V
+
+
+    Assuming pixels are scanned out from (0,0) to (num-col,line-len)
+    progressively::
+
+             (0,0) ---->-------------> (0,line-len)---!
+             !------------------------------------<a--!
+             V
+             (1,0) ---->-------------> (1,line-len)---!
+             !------------------------------------<---!
+             V
+             (...) .-->--------------> ( ,,,, )    ---!
+             !------------------------------------<---!
+             V
+             (num-col,0)------------->(num-col,line-len)
+
+
+    If a rotation of 90 degrees counterclockwise along the axis perpendicular to
+    the sensor's lens and directed towards the scene to be captured is applied
+    to the sensor, the pixel array would then be rotated as follows::
+
+            x ^  0,line-len,,,(num-col,line-len
+              !  ....
+              !  0,2 1,2      ...
+              !  0,1 1,1      ...
+              !  0,0 1,0 ... num-col,0
+             (0,0)------------------------>
+                                   y
+
+    And the pixel scan-out sequence would then proceed as follows::
+
+            (0,line-len)            (num-cols,line-len)
+                 ^\    ^\    ^\    ^\    ^
+                 ! \   ! \   ! \   ! \   !
+                 !  \  !  \  !  \  !  \  !
+                 !   \ !   \ !   \ !   \ !
+                 !    \!    \!    \!    \!
+               (0,0)  (1,0) ....      (num-cols,0)
+
+    Which when applied to the capture scene gives::
+
+            (0,line-len)            (num-cols,line-len)
+                ^\    ^\    ^\    ^\    ^
+                ! \   ! \   0 \   ! \   !
+                !  \  !  \ -|- \  !  \  !
+                !   \ !    / \  \ !   \ !
+                !    \!    \!    \!    \!
+              (0,0)  (1,0) ....      (num-cols,0)
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
+    displayed image.
+
+    In order to compensate the sensor mounting rotation, when expressed
+    as counterclockwise rotation along the axis directed from the sensor to
+    the captured scene, a rotation of the same amount of degrees in the
+    same counterclockwise rotation direction but applied along the axis
+    directed from the observer to the captured image, has to be applied.::
+
+                -------   90 degree counterclockwise
+                |   o  |  mounting rotation applied
+                |  -|- |  along the axis directed
+                |  / \ |  away from the sensor lens
+                -------
+                -------
+                | \ !  |  Resulting captured
+                |  --0 |  image when displayed
+                | / !  |  on screen
+                -------
+                -------
+                |   o  |  Rotation compensation
+                |  -|- |  is 90 degrees counterclockwise
+                |  / \ |  along the axis directed to the
+                -------   displayed image
+
+
 .. [#f1]
    This control may be changed to a menu control in the future, if more
    options are required.
-- 
2.23.0

