Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 335016D97E7
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 15:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238199AbjDFNU6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 09:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbjDFNUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 09:20:50 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C41A5C7
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680787218; x=1712323218;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O+3sqlq2kDlD4YobXBFrwCJQ9HeDCmuLrh8QcRpeJOg=;
  b=N/Vyxhy8cZiCyYqS2utIBkGWzY0tyHLEtrDXGISANRP4UWEdYnd7EbdW
   y8aCiybnjX5MjoItD+4V1Xx0pBOl7Pc8QzSMJXX30o7+Xk9qc91ncePT0
   bp1AtpTUwEQ5UIhFuMWWip2MlhOQSO5thrl8YGBzsdTBn6CWybWOf4Rk2
   v8s/q8wkxtz53OymzI7pZ8V3SSt1WUR0bWAvvJSTVNRsu4DSC54/k2Y9I
   2gyhWCVIx0nPt9aOYLNiHt3AobhQm/PRbftZ6CN8Qnl5MJGF9bZZN9R+F
   L3ldRIHZ14XEFnxp/Fql0pN1y2v59IGziF4m1xxo2Z0ImSqrcrmEDuYBV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344479225"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="344479225"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717439568"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="717439568"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:55:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 06670121387;
        Thu,  6 Apr 2023 15:55:14 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pkP7e-00Dm2L-RI; Thu, 06 Apr 2023 15:53:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com
Subject: [RESEND PATCH v5 1/1] Documentation: v4l: Document rotation and orientation for sensor drivers
Date:   Thu,  6 Apr 2023 15:53:40 +0300
Message-Id: <20230406125340.3282872-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how rotation and orientation should be taken into account in
writing camera sensor drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
since v4:

- Add "flipping" to the section name.

- Add a note on flipping controls not being inverted.

- Move the flipping related paragraph to the end of the section.

 .../driver-api/media/camera-sensor.rst        | 22 +++++++++++++++++++
 .../media/v4l/ext-ctrls-camera.rst            |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index c7d4891bd24e7..93f4f2536c250 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -151,3 +151,25 @@ used to obtain device's power state after the power state transition:
 The function returns a non-zero value if it succeeded getting the power count or
 runtime PM was disabled, in either of which cases the driver may proceed to
 access the device.
+
+Rotation, orientation and flipping
+----------------------------------
+
+Some systems have the camera sensor mounted upside down compared to its natural
+mounting rotation. In such cases, drivers shall expose the information to
+userspace with the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
+<v4l2-camera-sensor-rotation>` control.
+
+Sensor drivers shall also report the sensor's mounting orientation with the
+:ref:`V4L2_CID_CAMERA_SENSOR_ORIENTATION <v4l2-camera-sensor-orientation>`.
+
+Use ``v4l2_fwnode_device_parse()`` to obtain rotation and orientation
+information from system firmware and ``v4l2_ctrl_new_fwnode_properties()`` to
+register the appropriate controls.
+
+Sensor drivers that have any vertical or horizontal flips embedded in the
+register programming sequences shall initialize the V4L2_CID_HFLIP and
+V4L2_CID_VFLIP controls with the values programmed by the register sequences.
+The default values of these controls shall be 0 (disabled). Especially these
+controls shall not be inverted, independently of the sensor's mounting
+rotation.
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index daa4f40869f8f..cdc515c604683 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -506,6 +506,8 @@ enum v4l2_scene_mode -
     value down. A value of zero stops the motion if one is in progress
     and has no effect otherwise.
 
+.. _v4l2-camera-sensor-orientation:
+
 ``V4L2_CID_CAMERA_ORIENTATION (menu)``
     This read-only control describes the camera orientation by reporting its
     mounting position on the device where the camera is installed. The control
@@ -536,6 +538,7 @@ enum v4l2_scene_mode -
       - The camera is not directly attached to the device and is freely movable.
 
 
+.. _v4l2-camera-sensor-rotation:
 
 ``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
     This read-only control describes the rotation correction in degrees in the
-- 
2.30.2

