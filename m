Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B85B7B0A6F
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbjI0Qft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjI0Qfs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:35:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A697E4
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832547; x=1727368547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=arXNYG/ECUwMl5Pg60n2hCKRDtenMSoSi8QL+LfWOmg=;
  b=l4HnmWNnAZOikXRjZ0w1KaEIlmjufcF6R4LgmqF4WmQmnasTDBaXjSsv
   mY0rkmmhmBQYR+jWaepImIhSPr4Ax4SW78klzOERRewwrhYxIcYM3cBCa
   mGF1Di0yiBCTixVA98yQj/X1s0mkX/xyaOVlpwBTZE0AQIT/NlEQwQLmF
   QrkrPKJA1LeXXNvg0EKOjRIx+zjX5mMC4fbnICQ2BGlkqRFMJfX9ajhI7
   GtV0TbL5N1KXEaXoX+FyYJ+ovYlb78OLKxuNboLTbw6Kuj5V85+cCv23c
   S1uU/OP/0Qj1a69a7pPBGzb19liO3rVVUW8rdGXgpvhiwBV5aMM8DNTwC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448363192"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="448363192"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="872955359"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="872955359"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:22 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id EF05A11FBCE;
        Wed, 27 Sep 2023 19:33:16 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 19/26] media: v4l: subdev: Add trivial set_routing support
Date:   Wed, 27 Sep 2023 19:32:05 +0300
Message-Id: <20230927163212.402025-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
References: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
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

Add trivial S_ROUTING IOCTL support for drivers where routing is static.
Essentially this means returning the same information G_ROUTING call would
have done.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index dd48e7e549fb..7d7028de581a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -894,6 +894,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_krouting krouting = {};
 		unsigned int i;
 
+		if (!v4l2_subdev_has_op(sd, pad, set_routing))
+			goto do_vidioc_subdev_g_routing;
+
 		if (!v4l2_subdev_enable_streams_api)
 			return -ENOIOCTLCMD;
 
@@ -939,6 +942,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 					routing->which, &krouting);
 		if (rval < 0)
 			return rval;
+do_vidioc_subdev_g_routing:
+		;
 	}
 		fallthrough;
 
-- 
2.39.2

