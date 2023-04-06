Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2E56D9763
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 14:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237835AbjDFMyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 08:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237928AbjDFMyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 08:54:22 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5597EFE
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680785661; x=1712321661;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O+3sqlq2kDlD4YobXBFrwCJQ9HeDCmuLrh8QcRpeJOg=;
  b=YZZSeCBZaQhYY4YaW9Nlyrjbj04fHpzM3bWdZuYYu5MamsFvOn9TdZXE
   k6+zYqges7IVv3KSlv7obpQwZKS+hytaXJRWemRI1dBHIb11Go/8G/ql0
   c6c72QOlaxJcH8zNhzPz5bptJqfUhmSDdnr2qpEBg1x0LqvQL0B8+8zFE
   R4FK292TPhIjYfT+toU0px7+mYWl226D3z2X+BDw16T+ngHELcSRLYd7U
   J4BW7cZh3IeVut9jP0HOAtbuJEUCIqg5+M00G65Ok3VcBuYPeXREinfVW
   4s6eqTrF3ft/xEbnyo9hC9xvmzPxjHnBFymmbnlj+4sELXlUu7U7ftaJU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="340215107"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="340215107"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751637472"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="751637472"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:54:20 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BDBBA121387;
        Thu,  6 Apr 2023 15:54:17 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pkP6k-00Dm1S-Hs; Thu, 06 Apr 2023 15:52:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideaseonboard.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH v5 1/1] Documentation: v4l: Document rotation and orientation for sensor drivers
Date:   Thu,  6 Apr 2023 15:52:44 +0300
Message-Id: <20230406125244.3282817-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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

