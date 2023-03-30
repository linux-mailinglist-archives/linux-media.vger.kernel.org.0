Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D246D041C
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbjC3L7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjC3L7E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:04 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E15FA266
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177542; x=1711713542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TqDYsHc3wlHHE0sgOZGXezrElh8xe0mdWzlhC03wszM=;
  b=jo72p2lnwC4j90/7vKSWomKtFXigtdY+2p3OfYWwslyoW7xkcmpmzKma
   0UWESLBIP+6Vhc+z0F2IPdXtdzjCuliohZo70iU32mxLQ7IDBRHtPCGcU
   QNgTwErWdwDHTT88sY5nNUDQXG2qTwBmoYkAlj1g9koXtq1Ak9FRHohin
   uk65jRB21wp0x7oL4Q4RaRDsMOhXdBrF+Vf9C/TxI6i1c/nuGmHIUqeHH
   BvKHswQ5kxsSoX1BH4ZrokSpccLmD2L2ABh4pHhUom2lrb3G7ZgWkT0nD
   lwPVvBeiyKpByfc9GgUtgKPyEBTe+iaFJwyGKNICwz+qhfF1hk4XLwk73
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111335"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111335"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952900"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952900"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:58:58 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3D6201224B6;
        Thu, 30 Mar 2023 14:58:55 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 01/18] media: v4l: async: Return async sub-devices to subnotifier list
Date:   Thu, 30 Mar 2023 14:58:36 +0300
Message-Id: <20230330115853.1628216-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When an async notifier is unregistered, the async sub-devices in the
notifier's done list will disappear with the notifier. However this is
currently also done to the sub-notifiers that remain registered. Their
sub-devices only need to be unbound while the async sub-devices themselves
need to be returned to the sub-notifier's waiting list. Do this now.

Fixes: 2cab00bb076b ("media: v4l: async: Allow binding notifiers to sub-devices")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 2f1b718a9189..008a2a3e312e 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -414,7 +414,8 @@ static void v4l2_async_cleanup(struct v4l2_subdev *sd)
 
 /* Unbind all sub-devices in the notifier tree. */
 static void
-v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
+v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
+				 bool readd)
 {
 	struct v4l2_subdev *sd, *tmp;
 
@@ -423,9 +424,11 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
 			v4l2_async_find_subdev_notifier(sd);
 
 		if (subdev_notifier)
-			v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
+			v4l2_async_nf_unbind_all_subdevs(subdev_notifier, true);
 
 		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
+		if (readd)
+			list_add_tail(&sd->asd->list, &notifier->waiting);
 		v4l2_async_cleanup(sd);
 
 		list_move(&sd->async_list, &subdev_list);
@@ -557,7 +560,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	/*
 	 * On failure, unbind all sub-devices registered through this notifier.
 	 */
-	v4l2_async_nf_unbind_all_subdevs(notifier);
+	v4l2_async_nf_unbind_all_subdevs(notifier, false);
 
 err_unlock:
 	mutex_unlock(&list_lock);
@@ -607,7 +610,7 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 	if (!notifier || (!notifier->v4l2_dev && !notifier->sd))
 		return;
 
-	v4l2_async_nf_unbind_all_subdevs(notifier);
+	v4l2_async_nf_unbind_all_subdevs(notifier, false);
 
 	notifier->sd = NULL;
 	notifier->v4l2_dev = NULL;
@@ -805,7 +808,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 	 */
 	subdev_notifier = v4l2_async_find_subdev_notifier(sd);
 	if (subdev_notifier)
-		v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
+		v4l2_async_nf_unbind_all_subdevs(subdev_notifier, false);
 
 	if (sd->asd)
 		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
-- 
2.30.2

