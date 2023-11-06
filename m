Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 647147E2174
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbjKFM0j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbjKFM0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:37 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E3BDF
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273593; x=1730809593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NkrNgGIH27hLQ6PiLClQrPOaVTmJmGPqyyAhZar01Is=;
  b=RAiDnxN0QI6oZRr/qOfcw+cvNAhKuzQxTWvenMQYOWNVrq2v6dKhzd4N
   lXT2Ir5mS1yZKtCMlDXRYpURmuPsceyLSph6IaM+JCA53NRz4nbImCvUh
   3NfuhAL88clRvjHuXAYKNNjPFzDYXZi9HdAaq0a0lLJzzC+toY+atvNm2
   IoPPYRrZRBAm8CMuiduV4DavXoGD/d7Hwfa0ungoiTvdKnjYfmtNJqt9e
   TGrIx41wFOregxR+Hn+k4YG8bdjWiN3Z4cjMY1dosGIki0feTv/FdGoLM
   l7BRDe0iOGbJ5I18oe5jSARyD9zTHC+cEanppEDwmglgYYDk6oxhfdPrC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="475498665"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="475498665"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755836344"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="755836344"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:30 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6147211FBBC;
        Mon,  6 Nov 2023 14:26:26 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 31/31] media: uapi: v4l: subdev: Enable streams API
Date:   Mon,  6 Nov 2023 14:25:39 +0200
Message-Id: <20231106122539.1268265-32-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove v4l2_subdev_enable_streams_api variable that was used to easily
enable streams API for development, and conditions that use the variable.

This patch enables the streams API for V4L2 sub-device interface which
allows transporting multiple streams on a single MC link.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c32d62414bab..982565058e49 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -26,15 +26,6 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-/*
- * The Streams API is an experimental feature. To use the Streams API, set
- * 'v4l2_subdev_enable_streams_api' to 1 below.
- */
-
-static bool v4l2_subdev_enable_streams_api;
-#endif
-
 /*
  * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
  * of streams.
@@ -894,9 +885,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_krouting krouting = {};
 		unsigned int i;
 
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
@@ -967,9 +955,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_routing *routing = arg;
 		struct v4l2_subdev_krouting *krouting;
 
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
@@ -997,14 +982,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_S_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
-		/*
-		 * Clear V4L2_SUBDEV_CLIENT_CAP_STREAMS if streams API is not
-		 * enabled. Remove this when streams API is no longer
-		 * experimental.
-		 */
-		if (!v4l2_subdev_enable_streams_api)
-			client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
-
 		/* Filter out unsupported capabilities */
 		client_cap->capabilities &= V4L2_SUBDEV_CLIENT_CAP_STREAMS;
 
-- 
2.39.2

