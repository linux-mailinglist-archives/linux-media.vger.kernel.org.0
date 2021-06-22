Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64DA33B02BF
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 13:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhFVLbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 07:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhFVLbL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 07:31:11 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90436C061756
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 04:28:54 -0700 (PDT)
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D9A4F634C8D;
        Tue, 22 Jun 2021 14:21:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 4/6] media: v4l2-fwnode: Simplify v4l2_async_nf_parse_fwnode_endpoints()
Date:   Tue, 22 Jun 2021 14:21:58 +0300
Message-Id: <20210622112200.13914-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
References: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

There are only one user left of __v4l2_async_nf_parse_fwnode_ep()
since [1], v4l2_async_nf_parse_fwnode_endpoints(). The two
functions can be merged.

The merge of the two highlights a dead code block conditioned by the
argument 'has_port' that always is false and can therefor be removed.

1. commit 0ae426ebd0dcef81 ("media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()")

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[Sakari Ailus: Aligned some lines to opening parentheses.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 31 +++++----------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index e5507501b0f3..00457e1e93f6 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -839,12 +839,11 @@ v4l2_async_nf_fwnode_parse_endpoint(struct device *dev,
 	return ret == -ENOTCONN ? 0 : ret;
 }
 
-static int
-__v4l2_async_nf_parse_fwnode_ep(struct device *dev,
-				struct v4l2_async_notifier *notifier,
-				size_t asd_struct_size, unsigned int port,
-				bool has_port,
-				parse_endpoint_func parse_endpoint)
+int
+v4l2_async_nf_parse_fwnode_endpoints(struct device *dev,
+				     struct v4l2_async_notifier *notifier,
+				     size_t asd_struct_size,
+				     parse_endpoint_func parse_endpoint)
 {
 	struct fwnode_handle *fwnode;
 	int ret = 0;
@@ -862,16 +861,6 @@ __v4l2_async_nf_parse_fwnode_ep(struct device *dev,
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
 
 		ret = v4l2_async_nf_fwnode_parse_endpoint(dev, notifier,
 							  fwnode,
@@ -885,16 +874,6 @@ __v4l2_async_nf_parse_fwnode_ep(struct device *dev,
 
 	return ret;
 }
-
-int
-v4l2_async_nf_parse_fwnode_endpoints(struct device *dev,
-				     struct v4l2_async_notifier *notifier,
-				     size_t asd_struct_size,
-				     parse_endpoint_func parse_endpoint)
-{
-	return __v4l2_async_nf_parse_fwnode_ep(dev, notifier, asd_struct_size,
-					       0, false, parse_endpoint);
-}
 EXPORT_SYMBOL_GPL(v4l2_async_nf_parse_fwnode_endpoints);
 
 /*
-- 
2.30.2

