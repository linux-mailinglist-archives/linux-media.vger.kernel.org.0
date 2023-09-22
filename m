Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 518077AB377
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234289AbjIVOXb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234297AbjIVOX2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:23:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B94C100
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392603; x=1726928603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c/NxBW4TRKf0c0VgDJSgwKDbpi95NIi+YJv1ekhOfI0=;
  b=d2p5VVAiJoho0bMyODLoHadbqWUIUVwjcoZ0MKRSRglgAUNaqWj4yPBL
   XGyz0Ipel9s4buc46pfpc5CXu00PL0zVKG71sWmOY6gjFL3s8hg0G3fXc
   Dl7EBWmP+/GoYTDQdstLvZG/qeddxZxcyYLjYJrAH7JbknDjeJyB19SsI
   OoZ05jENKboMaIbUu8kCXhSfd7rjhIa1hdAc0NOHNOd3keJSPSBbcbhLI
   vSsmxg7mrzbNr3K9UyXsMZhaJeeE3iALNukEGpDytAd6aza6be542AOek
   3hV7UwWrGni1uQAXpItDIgbT9NAtxFWWY8GwNB2irSG0ScEXiRVjMv1iK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360219045"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360219045"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750862656"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="750862656"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:20 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A7A3D1208F8;
        Fri, 22 Sep 2023 17:23:16 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 22/23] media: v4l: subdev: Add trivial set_routing support
Date:   Fri, 22 Sep 2023 17:22:38 +0300
Message-Id: <20230922142239.259425-23-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
 drivers/media/v4l2-core/v4l2-subdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7871ec8a66d1..2b3bfc4bc1e1 100644
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
 
@@ -941,6 +944,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			return rval;
 	}
 		fallthrough;
+do_vidioc_subdev_g_routing:
 
 	case VIDIOC_SUBDEV_G_ROUTING: {
 		struct v4l2_subdev_routing *routing = arg;
-- 
2.39.2

