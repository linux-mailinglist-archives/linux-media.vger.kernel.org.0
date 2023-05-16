Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3D47049CB
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbjEPJ4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232217AbjEPJ4N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:13 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34ED24C2E
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230970; x=1715766970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YY2B2i7oMDmshXR1fVJ9vWervX/QVHCAXnn1Qook3gE=;
  b=cQ5Yee1lQdRSmNUwvf3DfWm22XECEX0HM0b47AgZPFySVptoMSQk76MO
   BidqzplhgD+rZdaJt1xbycHrnKn4MFaXpx8+UtFYmfkEb8Nn9lfL/M3Kq
   u6T8Za04oxuJlqJoj7oog/RZCRynw+TQIHERREk6xBTCE+ux65OnICW57
   Hu8vKI7HDP2q29T5UwcnK55Ox39ywbBhB6CYNVXYkK0fwdLBqHiCsSAyb
   imsQ6G6r3TsqZThQ3oxOqKg6gxzDF0Plkq2+k8Bd+LpmVbvfGgpaV3qcQ
   3TKMjd8NepWWlLo3GOOqgSxJrVBaTJUDc8bUrllkfTC8wWrFcRkcV/VAB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601373"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601373"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931798"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931798"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3B51D122EDF;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZAN-8A; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 14/31] media: v4l: async: Clean up error handling in v4l2_async_match_notify
Date:   Tue, 16 May 2023 12:55:00 +0300
Message-Id: <20230516095517.611711-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
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

Add labels for error handling instead of doing it all in individual cases.
Prepare for more functionality in this function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 56f24a4cdba0e..efea2c4ba2974 100644
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

