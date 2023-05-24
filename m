Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7FC70F51A
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbjEXLY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbjEXLYw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:24:52 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7641B6
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927486; x=1716463486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6aMlAn0mXT9iOdyJQzZq5jHGx+gOFMzw/HjBF3CPNd4=;
  b=av2OGDGbiUUw+HvgbniiWXzDOudYT/nTejm6gxmY8Khq1sS0hK5DPG1+
   zihrgw9XePGB1tkK1sYaOSDrrDCXWukV+c9wSWMhHvJCULKZe6E0Fxmfh
   jrjLFJkUJ17w/2kw2WNCkTsEaU5naEKnXSgwqbUD6MEE+PX1I/8aWGTpi
   OlTVrNLxjLW4Uo8H052ahtpp+Quc7HBLXmwHugaSh3i9U4kdyaPpMxWd3
   wkUCgAR2b6h5m8VwQO06knPik1hh3jHBsY1UH6iTcbslu43PA/PElOr7C
   wnNOuM/1l7010xzUt9pFjA8AHwyU4/41iI+y+hInhEFQvBaMEf50oiU4E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758284"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758284"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540606"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540606"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:33 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 84C3D122FEA;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb1-008z6l-Uh; Wed, 24 May 2023 14:23:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 15/32] media: v4l: async: Clean up error handling in v4l2_async_match_notify
Date:   Wed, 24 May 2023 14:23:32 +0300
Message-Id: <20230524112349.2141396-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
References: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add labels for error handling instead of doing it all in individual cases.
Prepare for more functionality in this function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index b1025dfc27a92..f51f0c37210c9 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -320,10 +320,8 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 		return ret;
 
 	ret = v4l2_async_nf_call_bound(notifier, sd, asc);
-	if (ret < 0) {
-		v4l2_device_unregister_subdev(sd);
-		return ret;
-	}
+	if (ret < 0)
+		goto err_unregister_subdev;
 
 	/*
 	 * Depending of the function of the entities involved, we may want to
@@ -332,11 +330,8 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	 * pad).
 	 */
 	ret = v4l2_async_create_ancillary_links(notifier, sd);
-	if (ret) {
-		v4l2_async_nf_call_unbind(notifier, sd, asc);
-		v4l2_device_unregister_subdev(sd);
-		return ret;
-	}
+	if (ret)
+		goto err_call_unbind;
 
 	list_del(&asc->waiting_entry);
 	sd->asd = asc;
@@ -363,6 +358,14 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	subdev_notifier->parent = notifier;
 
 	return v4l2_async_nf_try_all_subdevs(subdev_notifier);
+
+err_call_unbind:
+	v4l2_async_nf_call_unbind(notifier, sd, asc);
+
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(sd);
+
+	return ret;
 }
 
 /* Test all async sub-devices in a notifier for a match. */
-- 
2.30.2

