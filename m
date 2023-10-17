Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7AB7CC121
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 12:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343755AbjJQKy3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 06:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343752AbjJQKy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 06:54:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E4DF7
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 03:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697540066; x=1729076066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KK+/ngxS1QlO1CIYeGaHUFVbor7X7a5HzfPlewRZSPo=;
  b=gCsAwOvblge+iN8oXeqzKNi2aB8lRhRGujmIx4ILoFA9OaFJWZWSvW6L
   jN4RfggkYJABRpz48Uar5AK9dk+JIwvBky/jaOf5W1WSXmsRaCmYdgVWx
   EQ1m0afCOpwH26JaJypy7MMOUdoePL9Fu59FD/0bQrYnWVCl9vO/K6Coz
   lIi7yJqeLgUqKAWZX256fs0m4BuPLMf7f+DFCrHv+fgoghY8sGW56ouxx
   b2ggKGmCOWFaTAOjmTG/H3cj9akdQ61jCLI/8gLQ0pER7JBKrPcJSKHaf
   TnNTUbfrcQf9izEJK8fFyn5aMyUzTDG0bz+Tj2ft4fh3ksAS1mn2e4kxq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449973946"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="449973946"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929749718"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="929749718"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:54:23 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1DCB11207A3;
        Tue, 17 Oct 2023 13:54:21 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 2/3] media: Documentation: BT.601 is not a bus
Date:   Tue, 17 Oct 2023 13:54:18 +0300
Message-Id: <20231017105419.557486-3-sakari.ailus@linux.intel.com>
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

BT.601 is not actually a bus specification, leaving parallel bus without a
specification to refer to. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/camera-sensor.rst | 4 ++--
 Documentation/driver-api/media/tx-rx.rst         | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 0de5c86cbd1f..19f2feeecc91 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -9,8 +9,8 @@ This document covers the in-kernel APIs only. For the best practices on
 userspace API implementation in camera sensor drivers, please see
 :ref:`media_using_camera_sensor_drivers`.
 
-CSI-2 and parallel (BT.601 and BT.656) busses
----------------------------------------------
+CSI-2 and parallel and BT.656 buses
+-----------------------------------
 
 Please see :ref:`transmitter-receiver`.
 
diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index e1e9258dd862..7e115e3c4735 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -25,9 +25,8 @@ the host SoC. It is defined by the `MIPI alliance`_.
 Parallel
 ^^^^^^^^
 
-`BT.601`_ and `BT.656`_ are the most common parallel busses.
+The parallel bus and its `BT.656`_ variant are the most common parallel busses.
 
-.. _`BT.601`: https://en.wikipedia.org/wiki/Rec._601
 .. _`BT.656`: https://en.wikipedia.org/wiki/ITU-R_BT.656
 
 Transmitter drivers
-- 
2.39.2

