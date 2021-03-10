Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263563341D0
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 16:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhCJPpG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 10:45:06 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:54706 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232833AbhCJPpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 10:45:03 -0500
X-Greylist: delayed 363 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Mar 2021 10:45:03 EST
X-Halon-ID: 9e534042-81b6-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 9e534042-81b6-11eb-a542-005056917a89;
        Wed, 10 Mar 2021 16:38:51 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: v4l2-fwnode: Simplify v4l2_async_notifier_parse_fwnode_endpoints()
Date:   Wed, 10 Mar 2021 16:37:43 +0100
Message-Id: <20210310153743.3556385-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are only one user left of __v4l2_async_notifier_parse_fwnode_ep()
since [1], v4l2_async_notifier_parse_fwnode_endpoints(). Merge the two
and remove some dead code.

1. commit 0ae426ebd0dcef81 ("media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()")

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 34 ++++-----------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 2283ff3b8e1d8662..2abb1430da1e1cf5 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -839,13 +839,11 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 	return ret == -ENOTCONN ? 0 : ret;
 }
 
-static int
-__v4l2_async_notifier_parse_fwnode_ep(struct device *dev,
-				      struct v4l2_async_notifier *notifier,
-				      size_t asd_struct_size,
-				      unsigned int port,
-				      bool has_port,
-				      parse_endpoint_func parse_endpoint)
+int
+v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
+					   struct v4l2_async_notifier *notifier,
+					   size_t asd_struct_size,
+					   parse_endpoint_func parse_endpoint)
 {
 	struct fwnode_handle *fwnode;
 	int ret = 0;
@@ -863,17 +861,6 @@ __v4l2_async_notifier_parse_fwnode_ep(struct device *dev,
 		if (!is_available)
 			continue;
 
-		if (has_port) {
-			struct fwnode_endpoint ep;
-
-			ret = fwnode_graph_parse_endpoint(fwnode, &ep);
-			if (ret)
-				break;
-
-			if (ep.port != port)
-				continue;
-		}
-
 		ret = v4l2_async_notifier_fwnode_parse_endpoint(dev,
 								notifier,
 								fwnode,
@@ -887,17 +874,6 @@ __v4l2_async_notifier_parse_fwnode_ep(struct device *dev,
 
 	return ret;
 }
-
-int
-v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
-					   struct v4l2_async_notifier *notifier,
-					   size_t asd_struct_size,
-					   parse_endpoint_func parse_endpoint)
-{
-	return __v4l2_async_notifier_parse_fwnode_ep(dev, notifier,
-						     asd_struct_size, 0,
-						     false, parse_endpoint);
-}
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_endpoints);
 
 /*
-- 
2.30.1

