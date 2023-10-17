Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482AD7CC144
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 12:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234886AbjJQK4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 06:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234958AbjJQK4i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 06:56:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8699103
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 03:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697540196; x=1729076196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V+X8j3kqqLqtPKZsqpQhkXHk1cwZIcuLa6KxnFzPVj8=;
  b=h4o+D9kaoBjM54GQQh2syFO9/HSyOcggpDxH1zbMNrp4Jo1mwaUhlauE
   xJ4Yn6hn+bS9Vwmn+LoA/na4dH/p6g8Mpsw5Qf2390ckt9sb5IE/QQkca
   oe7tr+hvM2R/gcpVEfU6ALWPiQq85lXr7gPzc2Z9uLoIfv3a0TYEsRYs5
   DefemK1N0/sjRcGXPaXhpktEoCuwZKXkCvKARkrwioeUk8KpeAU7NdZA9
   zJfACSMD8gPIpWFcB/aRJFlaP8HdL38jOLotmyzL2AV+2Cm0Z+lzMMoKH
   dI1ujzilb5ev7LTIUUtEA2Qma3wECy2905fv8MlU9DcUHRduSL7KXNkC2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452231795"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="452231795"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821936558"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="821936558"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:56:34 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3CC7E12072F;
        Tue, 17 Oct 2023 13:56:31 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v2 1/3] media: Documentation: Document how link frequencies can be chosen
Date:   Tue, 17 Oct 2023 13:56:28 +0300
Message-Id: <20231017105630.558089-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017105630.558089-1-sakari.ailus@linux.intel.com>
References: <20231017105630.558089-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how link frequencies can be selected for the link-frequencies
property.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/camera-sensor.rst   | 14 ++++++++++++++
 .../userspace-api/media/drivers/camera-sensor.rst  |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 6456145f96ed..0de5c86cbd1f 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -29,6 +29,20 @@ used in the system. Using another frequency may cause harmful effects
 elsewhere. Therefore only the pre-determined frequencies are configurable by the
 user.
 
+On choosing link frequencies
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Choosing link frequencies for a board is generally a part of the hardware design
+process as one needs to ensure an EMC-safe frequency the sensor supports with
+the given external clock frequency exists. On development systems this may be
+less than an immediate concern, so more or less anything that sensor and the
+rest of the applicable hardware supports can be used.
+
+If the sensor's PLL tree is not documented and all that is available are
+register lists, even knowing the frequency a driver uses may be difficult. This
+could still be :ref:`calculated from the number of lanes, sensor's output image
+size, blanking values and frame rate <media_camera_raw_frame_interval>`.
+
 ACPI
 ~~~~
 
diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 919a50e8b9d9..e0596b85e7ec 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -44,6 +44,8 @@ There are two different methods for obtaining possibilities for different frame
 intervals as well as configuring the frame interval. Which one to implement
 depends on the type of the device.
 
+.. _media_camera_raw_frame_interval:
+
 Raw camera sensors
 ~~~~~~~~~~~~~~~~~~
 
-- 
2.39.2

