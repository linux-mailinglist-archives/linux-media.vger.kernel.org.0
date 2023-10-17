Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 224617CC146
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 12:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234899AbjJQK4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 06:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234961AbjJQK4j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 06:56:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03420109
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 03:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697540196; x=1729076196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KK+/ngxS1QlO1CIYeGaHUFVbor7X7a5HzfPlewRZSPo=;
  b=LAgtO1iqWUd0rpIES3nHYiImXgQj9hkJkOz4YOsqYZ+GZEzo12lIXKpl
   Y482kEvXS1ptW2Sks9BpaqbEBVdMa230O/VY/WalDTstqmMBcyzt3VLdz
   drMm25iBqXZ4iK+vRNN2CQ1gbKA/KhCZBfC5qkcDUpX9wkKYbgumq8k91
   PDYNjDyewJOap7hp5fj7EWv5mPYmcITppoZ061UhyG/CGqUXDGtMvyUHk
   Yi9CLi+nazmS4/AtqljRmQuRWp9nkzuHc726VCFwuXVOc1ycwfGz1xoNZ
   YFVdUihc10WhzninpOFSFAnEgaMolyiQyg+GJMdNg8FptomoF6Fa5NiFI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452231799"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="452231799"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821936559"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="821936559"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:56:34 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E90201207A3;
        Tue, 17 Oct 2023 13:56:31 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v2 2/3] media: Documentation: BT.601 is not a bus
Date:   Tue, 17 Oct 2023 13:56:29 +0300
Message-Id: <20231017105630.558089-3-sakari.ailus@linux.intel.com>
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

