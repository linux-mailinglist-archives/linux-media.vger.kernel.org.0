Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF477D667B
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 11:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbjJYJPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 05:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbjJYJPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 05:15:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B53185
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698225340; x=1729761340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9RFx89lYmr9whnW4eRTZwYa9zAk6hBBRxt2OTY7KJNY=;
  b=XoV1Fbggaapg+vsDLT1G3GaoLhYO+P1/bLc0SSn1Zg7cgnEhCoB5l9+O
   jLIelHkviaPKf1of59kutgxRmAqQerskGzb6rGfJXlIV1AHPWoxyvUZXs
   bL5i+Kn2Q35c9Y88C6lde5dFJz06+om3oovbQ7mHdMLTBzaBnkPOC3Jv4
   0qg5ufcy7mGBn1irT0lALUGLboDQ8e8kPlTtbnoM2jPwxBd9f0fK/XBaj
   2StwAMsJeBVNtXE2zisnj+Hm3iw163NgFahA23dRlt7PIu5oWgspZn+SA
   FWvoS0ZmKcnkXo3SsUfLwxs0diSwLSftSOXct4DJOxPiFh94U+/DfrPxn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="384480074"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="384480074"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="788063656"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="788063656"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:15:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E49D411FAF5;
        Wed, 25 Oct 2023 12:15:33 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v3 1/2] media: Documentation: BT.601 is not a bus
Date:   Wed, 25 Oct 2023 12:15:30 +0300
Message-Id: <20231025091531.893366-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025091531.893366-1-sakari.ailus@linux.intel.com>
References: <20231025091531.893366-1-sakari.ailus@linux.intel.com>
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

BT.601 is not actually a bus specification, leaving parallel bus without a
specification to refer to. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/camera-sensor.rst | 4 ++--
 Documentation/driver-api/media/tx-rx.rst         | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 0de5c86cbd1f..4b5cbb20357f 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -9,8 +9,8 @@ This document covers the in-kernel APIs only. For the best practices on
 userspace API implementation in camera sensor drivers, please see
 :ref:`media_using_camera_sensor_drivers`.
 
-CSI-2 and parallel (BT.601 and BT.656) busses
----------------------------------------------
+CSI-2, parallel and BT.656 buses
+--------------------------------
 
 Please see :ref:`transmitter-receiver`.
 
diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index e1e9258dd862..b86088cc614e 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -22,12 +22,13 @@ the host SoC. It is defined by the `MIPI alliance`_.
 
 .. _`MIPI alliance`: https://www.mipi.org/
 
-Parallel
-^^^^^^^^
+Parallel and BT.656
+^^^^^^^^^^^^^^^^^^^
 
-`BT.601`_ and `BT.656`_ are the most common parallel busses.
+Besides CSI-2, the `parallel`_ and `BT.656`_ buses are the two other bus types
+used commonly by camera sensors. Many camera sensors support both bus types.
 
-.. _`BT.601`: https://en.wikipedia.org/wiki/Rec._601
+.. _`parallel`: https://en.wikipedia.org/wiki/Parallel_communication
 .. _`BT.656`: https://en.wikipedia.org/wiki/ITU-R_BT.656
 
 Transmitter drivers
-- 
2.39.2

