Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA59C58EAAE
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 12:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbiHJKs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 06:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiHJKs4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 06:48:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4F185FAF
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 03:48:56 -0700 (PDT)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oLjGb-0005Kt-Fn; Wed, 10 Aug 2022 12:48:49 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] media: v4l2-async: fix binding async subdevs with multiple source ports
Date:   Wed, 10 Aug 2022 12:48:48 +0200
Message-Id: <20220810104848.846783-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Asynchronous subdevice probing on imx-media with imx6-mipi-csi2 is
broken since commit 1f391df44607 ("media: v4l2-async: Use endpoints in
__v4l2_async_nf_add_fwnode_remote()").

This is a side effect of imx6-mipi-csi2 having a single subdevice with
four separate source ports connected to different subdevices. Before,
the imx-media-csi and video-mux devices registered async sub-devices
via device fwnode that matched the imx6-mipi-csi2 device on their
respective notifiers. This caused the first asd to be put on the
notifier waiting list, and the other three to return -EEXIST and be
ignored.

With async subdev registration via endpoint fwnode, all four asds are
distinct and three of them keep dangling on their notifiers after the
first one is bound.

This patch modifies __v4l2_async_nf_has_async_subdev() to consider
asds matching different fwnode endpoints of the same sub-device equal
if the latter is already bound and matches via device fwnode. Further,
v4l2_async_register_subdev() is modified to remove dangling duplicate
asds that were registered before the sub-device was available to check
its fwnode.

Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-async.c | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 2f1b718a9189..b24220ed7077 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -452,6 +452,22 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 
 		if (asd_equal(asd, sd->asd))
 			return true;
+
+		/*
+		 * If the asd matches an endpoint fwnode, handle sub-devices
+		 * with device fwnode that were already matched by another asd
+		 * with a different endpoint fwnode on the same device.
+		 */
+		if (asd->match_type == V4L2_ASYNC_MATCH_FWNODE &&
+		    fwnode_graph_is_endpoint(asd->match.fwnode) &&
+		    sd->fwnode && !fwnode_graph_is_endpoint(sd->fwnode)) {
+			struct fwnode_handle *devnode;
+
+			devnode = fwnode_graph_get_port_parent(asd->match.fwnode);
+			fwnode_handle_put(devnode);
+			if (devnode == sd->fwnode)
+				return true;
+		}
 	}
 
 	return false;
@@ -749,6 +765,24 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
 }
 EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_i2c);
 
+static void v4l2_async_remove_duplicate_matches(struct v4l2_subdev *sd)
+{
+	struct v4l2_async_notifier *notifier;
+
+	lockdep_assert_held(&list_lock);
+
+	list_for_each_entry(notifier, &notifier_list, list) {
+		struct v4l2_async_subdev *asd;
+
+		asd = v4l2_async_find_match(notifier, sd);
+		if (!asd)
+			continue;
+
+		/* Remove from the waiting list */
+		list_del(&asd->list);
+	}
+}
+
 int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 {
 	struct v4l2_async_notifier *subdev_notifier;
@@ -783,6 +817,15 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 		if (ret)
 			goto err_unbind;
 
+		/*
+		 * At this point the asd is removed from the notifier wait list.
+		 * There might be other notifiers with asds matching different
+		 * fwnode endpoints of the same sd remaining. If the sd matches
+		 * by device fwnode, remove the dangling asds.
+		 */
+		if (sd->fwnode && !fwnode_graph_is_endpoint(sd->fwnode))
+			v4l2_async_remove_duplicate_matches(sd);
+
 		ret = v4l2_async_nf_try_complete(notifier);
 		if (ret)
 			goto err_unbind;
-- 
2.30.2

