Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A07947DEEA5
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 10:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjKBJJZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 05:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjKBJJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 05:09:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B26FB
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 02:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698916158; x=1730452158;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Kohc8oqDRAhdSqishNSozKp8Sftm3Vwtqs3LvhY23Mc=;
  b=iKgQUZqVR0AMUZ+OnRp1C1owuIhtWO7cxSM1lO6z3p8tkUHJLGfCTBFR
   dLhHxkmCY4eAP8E2ua18g6eRZixkzSpdDBoYAVM30bOoVPmDrYcIHdi0y
   ludIHrjKqExUmJpGyaY4RRcydOXK97o4KvuDuf6I0T5xUB7/W89B+knEJ
   OLi1+Hv5MyjDaXdYjApzlwn5A49Us5RCu5x8m3+VazF8sDU8xc2EnKpV1
   +4QfCP050rhqRwl5KeladI4auQksj5k5+mfZ8RGjNsq+0QSTsDBfX/KX9
   N2fpBpUK0HTzfV+DzZUHy5hNbC37uLmEukdnjSy9eAsk1v/hpj2VXD9I7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="368013160"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="368013160"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 02:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="878170173"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="878170173"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 02:09:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id EB80B11F9E8;
        Thu,  2 Nov 2023 11:09:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qyTgI-005wvI-0e;
        Thu, 02 Nov 2023 11:08:02 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     "Cao, Bingbu" <bingbu.cao@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        hverkuil@xs4all.nl
Subject: [PATCH v2 1/1] media: Documentation: Initialisation finishes before subdev registration
Date:   Thu,  2 Nov 2023 11:07:52 +0200
Message-Id: <20231102090752.1418132-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document that sub-device initialisation needs to complete before the async
sub-device is registered as there is no further driver action needed
before the sensor becomes accessible via the UAPI.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Reword text discussing async sub-device registration and driver's
  responsibilities before it.

- Add a reference from camera sensor PM documentation to this section,
  replacing the text added there in v1.

 Documentation/driver-api/media/camera-sensor.rst | 3 ++-
 Documentation/driver-api/media/v4l2-subdev.rst   | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 6456145f96ed..7a3c610e4c7b 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -60,7 +60,8 @@ management over the pipeline.
 Camera sensor drivers are responsible for controlling the power state of the
 device they otherwise control as well. They shall use runtime PM to manage
 power states. Runtime PM shall be enabled at probe time and disabled at remove
-time. Drivers should enable runtime PM autosuspend.
+time. Drivers should enable runtime PM autosuspend. Also see
+:ref:`async sub-device registration <media-registering-async-subdevs>`.
 
 The runtime PM handlers shall handle clocks, regulators, GPIOs, and other
 system resources required to power the sensor up and down. For drivers that
diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index e56b50b3f203..13c664555067 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -181,6 +181,8 @@ You can unregister a sub-device using:
 Afterwards the subdev module can be unloaded and
 :c:type:`sd <v4l2_subdev>`->dev == ``NULL``.
 
+.. _media-registering-async-subdevs:
+
 Registering asynchronous sub-devices
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -195,6 +197,11 @@ performed using the :c:func:`v4l2_async_unregister_subdev` call. Subdevices
 registered this way are stored in a global list of subdevices, ready to be
 picked up by bridge drivers.
 
+Drivers must complete all initialization of the sub-device before
+registering it using :c:func:`v4l2_async_register_subdev`, including
+enabling runtime PM. This is because the sub-device becomes accessible
+as soon as it gets registered.
+
 Asynchronous sub-device notifiers
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.2

