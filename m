Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2F8A7CC11F
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 12:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343754AbjJQKy2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 06:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234846AbjJQKy1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 06:54:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01A8F0
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 03:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697540065; x=1729076065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KwDff5sG1NRZj1g945uvs/MVhFJTv5pO+16/21zU7wo=;
  b=RKvoAjjRQWq5MU2ASxwOqWoId9w2+NZmpKncb+cEUUJZoSM76kLbRvs8
   Z9Lf1SreXb4CbcB2jaqCxAHKDwJxESl0pmHhCwbwKMC9q7nb+1kGiZpwK
   W5u9bCL5VbElOQXp31ZtPAG9YtKSKuauM+Q2X328KbC0FictQX6ZPx4WR
   Qczwa3m5uQcRrfQ81CagM/yQlh7Og92z9VnEZzc85xC7elg1MhWZg1OrG
   k2H7UcYQS7PDPOaIR6R2am332914h4BG0Dw4yUEZpaypqRwMt2OjNBpgQ
   edjqNSjIQ3nEIf7uD09LsGABO/A0mGe5Y4OL36cLEQkozEPW9yN/ZlCn2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449973941"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="449973941"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929749715"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="929749715"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:54:23 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 54FA612072F;
        Tue, 17 Oct 2023 13:54:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 1/3] media: Documentation: Document how link frequencies can be chosen
Date:   Tue, 17 Oct 2023 13:54:17 +0300
Message-Id: <20231017105419.557486-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017105419.557486-1-sakari.ailus@linux.intel.com>
References: <20231017105419.557486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
index 919a50e8b9d9..7ffed5c2338c 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -54,6 +54,8 @@ less all modern raw camera sensors.
 
 The frame interval is calculated using the following equation::
 
+.. _media_camera_raw_frame_interval:
+
 	frame interval = (analogue crop width + horizontal blanking) *
 			 (analogue crop height + vertical blanking) / pixel rate
 
-- 
2.39.2

