Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20EB7374BF
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfFFNC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:02:28 -0400
Received: from retiisi.org.uk ([95.216.213.190]:49818 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727135AbfFFNC1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 09:02:27 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id A7384634C7D;
        Thu,  6 Jun 2019 16:02:16 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, niklas.soderlund@ragnatech.se
Subject: [PATCH v2 1/9] davinci-vpif: Don't dereference endpoint after putting it, fix refcounting
Date:   Thu,  6 Jun 2019 16:02:17 +0300
Message-Id: <20190606130225.10751-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The davinci-vpif driver dereferences its local endpoints after releasing
the reference to them.

The driver also puts its endpoints explicitly while the
of_graph_get_next_endpoint() does that, too, leading to obtaining a
reference once and releasing it twice.

Both are fixed by this patch.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/davinci/vpif_capture.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index b5aacb0fb96b..72bdb3c10962 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1555,7 +1555,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 		if (!rem) {
 			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
 				endpoint);
-			of_node_put(endpoint);
 			goto done;
 		}
 
@@ -1567,7 +1566,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 					    GFP_KERNEL);
 		if (!chan->inputs) {
 			of_node_put(rem);
-			of_node_put(endpoint);
 			goto err_cleanup;
 		}
 
@@ -1578,7 +1576,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 
 		err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
 						 &bus_cfg);
-		of_node_put(endpoint);
 		if (err) {
 			dev_err(&pdev->dev, "Could not parse the endpoint\n");
 			of_node_put(rem);
@@ -1609,6 +1606,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 	}
 
 done:
+	of_node_put(endpoint);
 	pdata->asd_sizes[0] = i;
 	pdata->subdev_count = i;
 	pdata->card_name = "DA850/OMAP-L138 Video Capture";
@@ -1616,6 +1614,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 	return pdata;
 
 err_cleanup:
+	of_node_put(endpoint);
 	v4l2_async_notifier_cleanup(&vpif_obj.notifier);
 
 	return NULL;
-- 
2.11.0

