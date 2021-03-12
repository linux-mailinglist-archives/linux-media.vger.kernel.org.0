Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3027F33901E
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 15:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhCLOfM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 09:35:12 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:26419 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhCLOeg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 09:34:36 -0500
X-Halon-ID: 0d1314d2-8340-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 0d1314d2-8340-11eb-b73f-0050569116f7;
        Fri, 12 Mar 2021 15:34:31 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] media: v4l2-fwnode: Simplify v4l2_async_nf_parse_fwnode_endpoints()
Date:   Fri, 12 Mar 2021 15:34:27 +0100
Message-Id: <20210312143427.1927095-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are only one user left of __v4l2_async_nf_parse_fwnode_ep()
since [1], v4l2_async_nf_parse_fwnode_endpoints(). Merge the two
and remove some dead code.

1. commit 0ae426ebd0dcef81 ("media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()")

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Rebased on Sakari's branch which renames
  v4l2_async_notifier_parse_fwnode_endpoints() to
  v4l2_async_nf_parse_fwnode_endpoints).
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 33 ++++-----------------------
 1 file changed, 5 insertions(+), 28 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 18a281a8196db394..5c0d12d2ca9b2dde 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -839,13 +839,11 @@ v4l2_async_nf_fwnode_parse_endpoint(struct device *dev,
 	return ret == -ENOTCONN ? 0 : ret;
 }
 
-static int
-__v4l2_async_nf_parse_fwnode_ep(struct device *dev,
-				      struct v4l2_async_notifier *notifier,
-				      size_t asd_struct_size,
-				      unsigned int port,
-				      bool has_port,
-				      parse_endpoint_func parse_endpoint)
+int
+v4l2_async_nf_parse_fwnode_endpoints(struct device *dev,
+					   struct v4l2_async_notifier *notifier,
+					   size_t asd_struct_size,
+					   parse_endpoint_func parse_endpoint)
 {
 	struct fwnode_handle *fwnode;
 	int ret = 0;
@@ -863,16 +861,6 @@ __v4l2_async_nf_parse_fwnode_ep(struct device *dev,
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
 
 		ret = v4l2_async_nf_fwnode_parse_endpoint(dev,
 								notifier,
@@ -887,17 +875,6 @@ __v4l2_async_nf_parse_fwnode_ep(struct device *dev,
 
 	return ret;
 }
-
-int
-v4l2_async_nf_parse_fwnode_endpoints(struct device *dev,
-					   struct v4l2_async_notifier *notifier,
-					   size_t asd_struct_size,
-					   parse_endpoint_func parse_endpoint)
-{
-	return __v4l2_async_nf_parse_fwnode_ep(dev, notifier,
-						     asd_struct_size, 0,
-						     false, parse_endpoint);
-}
 EXPORT_SYMBOL_GPL(v4l2_async_nf_parse_fwnode_endpoints);
 
 /*
-- 
2.30.1

