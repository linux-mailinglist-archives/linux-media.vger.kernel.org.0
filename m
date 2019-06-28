Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD0659874
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 12:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfF1Kd4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 06:33:56 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60340 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726514AbfF1Kd4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 06:33:56 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id BE9AB634C7D;
        Fri, 28 Jun 2019 13:33:39 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, niklas.soderlund@ragnatech.se
Subject: [PATCH v3 1/8] davinci-vpif: Don't dereference endpoint after putting it, fix refcounting
Date:   Fri, 28 Jun 2019 13:33:47 +0300
Message-Id: <20190628103354.5340-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190628103354.5340-1-sakari.ailus@linux.intel.com>
References: <20190628103354.5340-1-sakari.ailus@linux.intel.com>
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
index f0f7ef638c56..394202c28b1a 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1554,7 +1554,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 		if (!rem) {
 			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
 				endpoint);
-			of_node_put(endpoint);
 			goto done;
 		}
 
@@ -1566,7 +1565,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 					    GFP_KERNEL);
 		if (!chan->inputs) {
 			of_node_put(rem);
-			of_node_put(endpoint);
 			goto err_cleanup;
 		}
 
@@ -1577,7 +1575,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 
 		err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
 						 &bus_cfg);
-		of_node_put(endpoint);
 		if (err) {
 			dev_err(&pdev->dev, "Could not parse the endpoint\n");
 			of_node_put(rem);
@@ -1608,6 +1605,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 	}
 
 done:
+	of_node_put(endpoint);
 	pdata->asd_sizes[0] = i;
 	pdata->subdev_count = i;
 	pdata->card_name = "DA850/OMAP-L138 Video Capture";
@@ -1615,6 +1613,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 	return pdata;
 
 err_cleanup:
+	of_node_put(endpoint);
 	v4l2_async_notifier_cleanup(&vpif_obj.notifier);
 
 	return NULL;
-- 
2.11.0

