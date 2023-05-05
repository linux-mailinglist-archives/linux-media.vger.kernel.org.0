Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C84D36F8BA4
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 23:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233184AbjEEVxH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 17:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjEEVxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 17:53:05 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229954C2B
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683323585; x=1714859585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yUogmbGdY1chA+JB40wTsn4Xaw+wDBpW7L652XZeqHE=;
  b=hI/LL2INHtHLyz8z+mySy/PZ4GyC/5oP/okqtn/yqavWatbwqdbPaeNG
   2Ii3B9wHCk23Y7JC8jUQNVqInpmEBarj6cTg8YC7WlaDjp8xh47bqnlAL
   GzIayhaUL6d8663aI6F6HxMao8nvkNFKAqY2zAg/zoxbSb+u878OOSriz
   4RL0QulxUEjeqOeZSw0ZacIal2abl3fY90dyP+XjJMxZun9+H0ABuiXfS
   N90tO8sqPSAWJ28tTgzkh7dMy0FU/aDuCPMUiI1axqhc62e23tBVWs2MN
   rqt8vq1AGLz55b0zy4y6C8qDRsG2UZsfguHkdPEWj9IV2Psf00J9k2s8x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="328925837"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="328925837"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="700626134"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="700626134"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:03 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B615E12245D;
        Sat,  6 May 2023 00:53:00 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [RFC 2/7] media: v4l: subdev: Support INTERNAL_SOURCE pads in routing IOCTLs
Date:   Sat,  6 May 2023 00:52:52 +0300
Message-Id: <20230505215257.60704-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Take the new INTERNAL_SOURCE pad flag into account in validating routing
IOCTL argument. Effectively this is a SINK pad in this respect. Due to the
union there's no need to check for the particular name.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 2ec179cd1264..6312fc2bf1f0 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -906,7 +906,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 				return -EINVAL;
 
 			if (!(pads[route->sink_pad].flags &
-			      MEDIA_PAD_FL_SINK))
+			      (MEDIA_PAD_FL_SINK |
+			       MEDIA_PAD_FL_INTERNAL_SOURCE)))
 				return -EINVAL;
 
 			if (route->source_pad >= sd->entity.num_pads)
@@ -1787,7 +1788,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 
 		/* Validate the sink and source pad numbers. */
 		if (route->sink_pad >= sd->entity.num_pads ||
-		    !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
+		    !(sd->entity.pads[route->sink_pad].flags &
+		      (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL_SOURCE))) {
 			dev_dbg(sd->dev, "route %u sink (%u) is not a sink pad\n",
 				i, route->sink_pad);
 			goto out;
-- 
2.30.2

