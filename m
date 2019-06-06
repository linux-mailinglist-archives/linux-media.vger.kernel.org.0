Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52421374C6
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbfFFNCc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:02:32 -0400
Received: from retiisi.org.uk ([95.216.213.190]:49886 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727087AbfFFNCa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 09:02:30 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id CCF31634C88;
        Thu,  6 Jun 2019 16:02:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, niklas.soderlund@ragnatech.se
Subject: [PATCH v2 9/9] ipu3-cio2: Parse information from firmware without using callbacks
Date:   Thu,  6 Jun 2019 16:02:25 +0300
Message-Id: <20190606130225.10751-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using the convenience function
v4l2_async_notifier_parse_fwnode_endpoints(), parse the endpoints and set
up the async sub-devices without using callbacks. While this adds a little
bit of code, it makes parsing the endpoints quite a bit more simple and
gives more control to the driver over the process. The parsing assumes
D-PHY instead of letting the V4L2 fwnode framework guess it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 92 +++++++++++++++++---------------
 1 file changed, 49 insertions(+), 43 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 690d3bd08ddd..40e8b8617f55 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1475,36 +1475,51 @@ static const struct v4l2_async_notifier_operations cio2_async_ops = {
 	.complete = cio2_notifier_complete,
 };
 
-static int cio2_fwnode_parse(struct device *dev,
-			     struct v4l2_fwnode_endpoint *vep,
-			     struct v4l2_async_subdev *asd)
+static int cio2_parse_firmware(struct cio2_device *cio2)
 {
-	struct sensor_async_subdev *s_asd =
-			container_of(asd, struct sensor_async_subdev, asd);
+	unsigned int i;
+	int ret;
 
-	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(dev, "Only CSI2 bus type is currently supported\n");
-		return -EINVAL;
-	}
+	for (i = 0; i < CIO2_NUM_PORTS; i++) {
+		struct v4l2_fwnode_endpoint vep = {
+			.bus_type = V4L2_MBUS_CSI2_DPHY
+		};
+		struct sensor_async_subdev *s_asd = NULL;
+		struct fwnode_handle *ep;
 
-	s_asd->csi2.port = vep->base.port;
-	s_asd->csi2.lanes = vep->bus.mipi_csi2.num_data_lanes;
+		ep = fwnode_graph_get_endpoint_by_id(
+			dev_fwnode(&cio2->pci_dev->dev), i, 0,
+			FWNODE_GRAPH_ENDPOINT_NEXT);
 
-	return 0;
-}
+		if (!ep)
+			continue;
 
-static int cio2_notifier_init(struct cio2_device *cio2)
-{
-	int ret;
+		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		if (ret)
+			goto err_parse;
 
-	v4l2_async_notifier_init(&cio2->notifier);
+		s_asd = kzalloc(sizeof(*s_asd), GFP_KERNEL);
+		if (!s_asd) {
+			ret = -ENOMEM;
+			goto err_parse;
+		}
 
-	ret = v4l2_async_notifier_parse_fwnode_endpoints(
-		&cio2->pci_dev->dev, &cio2->notifier,
-		sizeof(struct sensor_async_subdev),
-		cio2_fwnode_parse);
-	if (ret < 0)
-		goto out;
+		s_asd->csi2.port = vep.base.port;
+		s_asd->csi2.lanes = vep.bus.mipi_csi2.num_data_lanes;
+
+		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
+			&cio2->notifier, ep, &s_asd->asd);
+		fwnode_handle_put(ep);
+		if (ret)
+			goto err_parse;
+
+		continue;
+
+err_parse:
+		fwnode_handle_put(ep);
+		kfree(s_asd);
+		return ret;
+	}
 
 	/*
 	 * Proceed even without sensors connected to allow the device to
@@ -1512,25 +1527,13 @@ static int cio2_notifier_init(struct cio2_device *cio2)
 	 */
 	cio2->notifier.ops = &cio2_async_ops;
 	ret = v4l2_async_notifier_register(&cio2->v4l2_dev, &cio2->notifier);
-	if (ret) {
+	if (ret)
 		dev_err(&cio2->pci_dev->dev,
 			"failed to register async notifier : %d\n", ret);
-		goto out;
-	}
-
-out:
-	if (ret)
-		v4l2_async_notifier_cleanup(&cio2->notifier);
 
 	return ret;
 }
 
-static void cio2_notifier_exit(struct cio2_device *cio2)
-{
-	v4l2_async_notifier_unregister(&cio2->notifier);
-	v4l2_async_notifier_cleanup(&cio2->notifier);
-}
-
 /**************** Queue initialization ****************/
 static const struct media_entity_operations cio2_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
@@ -1814,16 +1817,18 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	if (r)
 		goto fail_v4l2_device_unregister;
 
+	v4l2_async_notifier_init(&cio2->notifier);
+
 	/* Register notifier for subdevices we care */
-	r = cio2_notifier_init(cio2);
+	r = cio2_parse_firmware(cio2);
 	if (r)
-		goto fail_cio2_queue_exit;
+		goto fail_clean_notifier;
 
 	r = devm_request_irq(&pci_dev->dev, pci_dev->irq, cio2_irq,
 			     IRQF_SHARED, CIO2_NAME, cio2);
 	if (r) {
 		dev_err(&pci_dev->dev, "failed to request IRQ (%d)\n", r);
-		goto fail;
+		goto fail_clean_notifier;
 	}
 
 	pm_runtime_put_noidle(&pci_dev->dev);
@@ -1831,9 +1836,9 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 
 	return 0;
 
-fail:
-	cio2_notifier_exit(cio2);
-fail_cio2_queue_exit:
+fail_clean_notifier:
+	v4l2_async_notifier_unregister(&cio2->notifier);
+	v4l2_async_notifier_cleanup(&cio2->notifier);
 	cio2_queues_exit(cio2);
 fail_v4l2_device_unregister:
 	v4l2_device_unregister(&cio2->v4l2_dev);
@@ -1852,7 +1857,8 @@ static void cio2_pci_remove(struct pci_dev *pci_dev)
 	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
 
 	media_device_unregister(&cio2->media_dev);
-	cio2_notifier_exit(cio2);
+	v4l2_async_notifier_unregister(&cio2->notifier);
+	v4l2_async_notifier_cleanup(&cio2->notifier);
 	cio2_queues_exit(cio2);
 	cio2_fbpt_exit_dummy(cio2);
 	v4l2_device_unregister(&cio2->v4l2_dev);
-- 
2.11.0

