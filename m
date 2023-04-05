Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52EFE6D84D9
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 19:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232832AbjDER12 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 13:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjDER11 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 13:27:27 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B27455A2
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 10:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680715646; x=1712251646;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=40GRTlBYH0HTiTBrB00S5hv2xrYHKERqGZClThkYZ8A=;
  b=jF3lptjLaKxeKFMmHswrKLwXeRMM4l23+cIXhx6BrY20TaMZbusS0vK8
   ydNGoEddlnGysKG/yX7+dtD9lCDULDylRt8wJna1djfjVhwTvrvWZG80v
   z1J9QJtwZMNJ4fZX5q8fv1dczKRkXpZirhFpnHYuSGu5gIKOzw+rrMiJr
   uN6HenBdViOMeCathMGAGHCbvJlfWa+FHAA4aHh9iBQz7mHU2xHfuRvmA
   4GLmOJ179/RcZoxck2fzE1rq6yTRDj18eR7sFwdveGNCHih4+pqyp6GUR
   XAYdG3qBSlwOCnoDLx5/TmaCKEryhpVfJy+DnmpH7hEmSJUA4NuqD3eXI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326554216"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="326554216"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 10:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="798005757"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="798005757"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 10:27:24 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A9ED122457;
        Wed,  5 Apr 2023 20:27:21 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 1/1] Documentation: v4l: Document rotation and orientation for sensor drivers
Date:   Wed,  5 Apr 2023 20:27:20 +0300
Message-Id: <20230405172720.1842738-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how rotation and orientation should be taken into account in
writing camera sensor drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v3:

- Add a missing paragraph on the ORIENTATION control. Use shall.

 .../driver-api/media/camera-sensor.rst        | 19 +++++++++++++++++++
 .../media/v4l/ext-ctrls-camera.rst            |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index c7d4891bd24e..ad9accb3fd40 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -151,3 +151,22 @@ used to obtain device's power state after the power state transition:
 The function returns a non-zero value if it succeeded getting the power count or
 runtime PM was disabled, in either of which cases the driver may proceed to
 access the device.
+
+Rotation and orientation
+------------------------
+
+Some systems have the camera sensor mounted upside down compared to its natural
+mounting rotation. In such cases, drivers shall expose the information to
+userspace with the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
+<v4l2-camera-sensor-rotation>` control.
+
+Sensor drivers that have any vertical or horizontal flips embedded in the
+register programming sequences shall initialize the V4L2_CID_HFLIP and
+V4L2_CID_VFLIP controls with the values programmed by the register sequences.
+
+Sensor drivers shall also report the sensor's mounting orientation with the
+:ref:`V4L2_CID_CAMERA_SENSOR_ORIENTATION <v4l2-camera-sensor-orientation>`.
+
+Use ``v4l2_fwnode_device_parse()`` to obtain rotation and orientation
+information from system firmware and ``v4l2_ctrl_new_fwnode_properties()`` to
+register the appropriate controls.
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index daa4f40869f8..cdc515c60468 100644
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

