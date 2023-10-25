Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF0CC7D667A
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 11:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbjJYJPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 05:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233987AbjJYJPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 05:15:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B04186
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698225340; x=1729761340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZfptIkWvw/lv5ltmBXraIklzRS5CubmuSS03XM+fzbE=;
  b=nKWfyquI7OMfrovEM5itxNagOSJaSPN9tPSUBDcMBJLgjnYIsVq3yfKe
   L5ukp7OvuRHoYIfPVVAti4Q9mxW1Sv9jxHX5gZFdh47StNXrFr2+EsaBE
   TJHwQpF8IaIxENUgR/HwpfV8gGvuK7SR6sw91uI9g0pUKVTS64urelI5U
   Mv+TzdgrjmXmJk9TJXiMKPeGK8xyYnu/YFwImNiaSlW7mtCYEU4A8VOQp
   E71UbQO3+iadyINA9MdmW8YY5TkcVcC8Ig9XJwpMQzNCfgbHGKKAr0CCV
   PsQ7WVZVb8XZejB04rRhfNy8TdHP6kNrnnCDu6XlWJkcIcG9r46uptPxh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="384480080"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="384480080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="788063657"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="788063657"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:15:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B0169120AB3;
        Wed, 25 Oct 2023 12:15:34 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v3 2/2] media: Documentation: LP-11 and LP-111 are states, not modes
Date:   Wed, 25 Oct 2023 12:15:31 +0300
Message-Id: <20231025091531.893366-3-sakari.ailus@linux.intel.com>
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

LP-11 and LP-111 are CSI-2 bus states, not modes. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/driver-api/media/tx-rx.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index b86088cc614e..9af9fa7d5197 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -91,8 +91,8 @@ where
 	pixel rate on the camera sensor's pixel array which is indicated by the
 	:ref:`V4L2_CID_PIXEL_RATE <v4l2-cid-pixel-rate>` control.
 
-LP-11 and LP-111 modes
-^^^^^^^^^^^^^^^^^^^^^^
+LP-11 and LP-111 states
+^^^^^^^^^^^^^^^^^^^^^^^
 
 As part of transitioning to high speed mode, a CSI-2 transmitter typically
 briefly sets the bus to LP-11 or LP-111 state, depending on the PHY. This period
@@ -106,7 +106,7 @@ in software, especially when there is no interrupt telling something is
 happening.
 
 One way to address this is to configure the transmitter side explicitly to LP-11
-or LP-111 mode, which requires support from the transmitter hardware. This is
+or LP-111 state, which requires support from the transmitter hardware. This is
 not universally available. Many devices return to this state once streaming is
 stopped while the state after power-on is LP-00 or LP-000.
 
@@ -117,11 +117,11 @@ transitioning to streaming state, but not yet start streaming. Similarly, the
 to call ``.post_streamoff()`` for each successful call of ``.pre_streamon()``.
 
 In the context of CSI-2, the ``.pre_streamon()`` callback is used to transition
-the transmitter to the LP-11 or LP-111 mode. This also requires powering on the
+the transmitter to the LP-11 or LP-111 state. This also requires powering on the
 device, so this should be only done when it is needed.
 
-Receiver drivers that do not need explicit LP-11 or LP-111 mode setup are waived
-from calling the two callbacks.
+Receiver drivers that do not need explicit LP-11 or LP-111 state setup are
+waived from calling the two callbacks.
 
 Stopping the transmitter
 ^^^^^^^^^^^^^^^^^^^^^^^^
-- 
2.39.2

