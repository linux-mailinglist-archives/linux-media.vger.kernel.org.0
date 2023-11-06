Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF0F7E2130
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbjKFMSr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:18:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjKFMSU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:18:20 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CA310FB
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273097; x=1730809097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6QNKJ6LgnuYArE6WD4rQc3QrgfQE1Hzr23yiZ/1CNco=;
  b=aff40IdvDSvORZoMbaWsck7eZQahw2fGJNAqKRPSL2Q+EdYzv175rAzQ
   etOeNf/g1Bltonuw5wHJ8dGlRsTB4I53lt4LZ1f7/JSbCiw/FAjRmXt9s
   M61+gGRmNi9+lwfHJchSxFFg9tyk61kY4Ua3GD6PEPS5f4zyAWmccyvpW
   cPMo5q1tYV3YUSWzqeqdbwGdPOncX7zoK4QV9HFmNXCqoFMKqVbApt3Zx
   g4ncQ9i27h/43m/n+qoWlR8SNZuRfi9qbrYyJkg0SQUyxcJYvh40zJdNs
   PxhBC0iyp1B3eq97vEZkNOm+vg6nfpFa+ntbcr/RV2/tr2oPpc9UMdbOa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420375258"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="420375258"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="828192162"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="828192162"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:13 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6ED851203CE;
        Mon,  6 Nov 2023 14:18:10 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v6 4/8] media: v4l: subdev: v4l2_subdev_state_get_format always returns format now
Date:   Mon,  6 Nov 2023 14:18:01 +0200
Message-Id: <20231106121805.1266696-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106121805.1266696-1-sakari.ailus@linux.intel.com>
References: <20231106121805.1266696-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

