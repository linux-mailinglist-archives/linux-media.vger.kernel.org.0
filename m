Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29FD37D947B
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345702AbjJ0J73 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345679AbjJ0J7Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:59:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10CA192
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698400763; x=1729936763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6QNKJ6LgnuYArE6WD4rQc3QrgfQE1Hzr23yiZ/1CNco=;
  b=DFqqJ0OZnTbHUJZwKXeJVQ0yqWQIKj4KRlV9o25kiBZgAdzrwADYFa4A
   OLnj7++g6P0WC50Y1daCFJboiD9uXEipCEaVGC64MrESh5UTz5eT6+6Eu
   oBM3a4E2UI4fxmWvihbmlQqB/gvoh/Hm0kSy+Mt6Ix1VF4xvVATevJcAQ
   PzXNLCrkrF5XPC0oJ6ftftVmebPuViFEQyy9riQQUZWiWn0SGxja2zpZd
   adYqRHUdMKBYzA26Tn9tx/yxb7A1jwRRb5syq2pXWdEjBG06hWbGqqvl3
   ILtieiDuRIXjxPiNGYm3RgYgSpNK87DqdaFkqIS1PJ+P33qDMpbEd6Dk0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473986685"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="473986685"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="7179894"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:57:58 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A67F11F8DF;
        Fri, 27 Oct 2023 12:59:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v5 4/8] media: v4l: subdev: v4l2_subdev_state_get_format always returns format now
Date:   Fri, 27 Oct 2023 12:59:09 +0300
Message-Id: <20231027095913.1010187-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231027095913.1010187-1-sakari.ailus@linux.intel.com>
References: <20231027095913.1010187-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that v4l2_subdev_state_get_format() always returns format, don't call
alternative v4l2_subdev_get_pad_format() anymore.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 0d5e749d8f99..76e1a002fcdd 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1580,14 +1580,7 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 {
 	struct v4l2_mbus_framefmt *fmt;
 
-	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
-		fmt = v4l2_subdev_state_get_format(state, format->pad,
-						   format->stream);
-	else if (format->pad < sd->entity.num_pads && format->stream == 0)
-		fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
-	else
-		fmt = NULL;
-
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!fmt)
 		return -EINVAL;
 
-- 
2.39.2

