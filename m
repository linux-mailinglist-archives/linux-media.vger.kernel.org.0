Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334DC7CC125
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 12:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343489AbjJQKyg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 06:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343757AbjJQKy3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 06:54:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845A1F5
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 03:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697540067; x=1729076067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UOEcj39cZGrl7bSsx0TerIC5fl86aTzJT1zhyxdC7A8=;
  b=ZKKaHQMp/bxLcBtGz15fvBvPhN2OqTPS5nRNCZXvS6IEJJ9wwHMBBlhQ
   sVr7bMZwKHY5N7ArIFh0jMZa6jIVgsiMkfzwBWqt+QvqQF115f8420VmL
   8Nl6U7av1rXaf/1sVP3z9/Z6cx91TViItBox93caMnqIeAadDX+Krx3/D
   +y62frgqMf8YDtlRNBAUVhfMnl2x98O5k3kb6aQ99VyDtv9SZaDnlBQwg
   pjuhPzhQv6L64S7vp6Lz/DCKZL7i5rcB2k6GNCsFsASvL6YFmiJWfp/HP
   fSSBeNMuYbrTt74Y6KqeEnqQM0AQ+e4+SpFzh6SWwwczi0g7eLRwEeYZN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449973955"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="449973955"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929749728"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="929749728"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:54:25 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E55FC1207CA;
        Tue, 17 Oct 2023 13:54:21 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 3/3] media: Documentation: LP-11 and LP-111 are states, not modes
Date:   Tue, 17 Oct 2023 13:54:19 +0300
Message-Id: <20231017105419.557486-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017105419.557486-1-sakari.ailus@linux.intel.com>
References: <20231017105419.557486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
---
 Documentation/driver-api/media/tx-rx.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 7e115e3c4735..bc1b94cffdd9 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -89,13 +89,13 @@ where
 	pixel rate on the camera sensor's pixel array which is indicated by the
 	:ref:`V4L2_CID_PIXEL_RATE <v4l2-cid-pixel-rate>` control.
 
-LP-11 and LP-111 modes
-^^^^^^^^^^^^^^^^^^^^^^
+LP-11 and LP-111 states
+^^^^^^^^^^^^^^^^^^^^^^^
 
-As part of transitioning to high speed mode, a CSI-2 transmitter typically
+As part of transitioning to high speed state, a CSI-2 transmitter typically
 briefly sets the bus to LP-11 or LP-111 state, depending on the PHY. This period
 may be as short as 100 µs, during which the receiver observes this state and
-proceeds its own part of high speed mode transition.
+proceeds its own part of high speed state transition.
 
 Most receivers are capable of autonomously handling this once the software has
 configured them to do so, but there are receivers which require software
@@ -104,7 +104,7 @@ in software, especially when there is no interrupt telling something is
 happening.
 
 One way to address this is to configure the transmitter side explicitly to LP-11
-or LP-111 mode, which requires support from the transmitter hardware. This is
+or LP-111 state, which requires support from the transmitter hardware. This is
 not universally available. Many devices return to this state once streaming is
 stopped while the state after power-on is LP-00 or LP-000.
 
@@ -115,11 +115,11 @@ transitioning to streaming state, but not yet start streaming. Similarly, the
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

