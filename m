Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC64D74436B
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 22:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbjF3Unw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 16:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbjF3Unv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 16:43:51 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE523C02
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 13:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688157830; x=1719693830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kJd8KnHGQhFKx0lw/mrsMv6ORjD8mulHwgk+qIF3LoQ=;
  b=hFUFGY/heFJvm+qVEoWXceo0snCx/VLrmn0/kVJjBgNONIC1KpTlP3/6
   +njVl8tWPwzNcJ2J8nf+fKR389/Ke7dHKYL4gf4qS0NXDjx3h9OcRuVnR
   oSaod/untRm6QmAIcHl6kiSmHWwzW9QSBfuscrwMATzcXAjW8NAMntglL
   SK5w7wUHQQ5SuD4ELj0D2TQOA431y2ITWsR7NiFK4qLNyUQJczZXRhZax
   02+BjkFsWVYKN91o1kQYkvBXPi9SqEoEPJhWS2Pn+Oq9mxtg/H6krzLjx
   ZPFUBX1bHfr+N2Q4CqihgCMXRDnkElRm5Lix+RIQHwW7g2n5GFPfQ7EfU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="448866698"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="448866698"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841987182"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="841987182"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:49 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DF6801207EB;
        Fri, 30 Jun 2023 23:43:44 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: [PATCH 3/7] media: v4l: subdev: Support INTERNAL pads in routing IOCTLs
Date:   Fri, 30 Jun 2023 23:43:34 +0300
Message-Id: <20230630204338.126583-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Take the new INTERNAL pad flag into account in validating routing IOCTL
argument. Effectively this is a SINK pad in this respect. Due to the union
there's no need to check for the particular name.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 2ec179cd1264..36886a9047c4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1787,7 +1787,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 
 		/* Validate the sink and source pad numbers. */
 		if (route->sink_pad >= sd->entity.num_pads ||
-		    !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
+		    !(sd->entity.pads[route->sink_pad].flags &
+		      MEDIA_PAD_FL_SINK)) {
 			dev_dbg(sd->dev, "route %u sink (%u) is not a sink pad\n",
 				i, route->sink_pad);
 			goto out;
-- 
2.39.2

