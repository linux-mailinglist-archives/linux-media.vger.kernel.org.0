Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E04576870A0
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbjBAVqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjBAVqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:09 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA0A68AC5
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287966; x=1706823966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V1h83OUcJIWIRBLzf2YZvY4c2hnZblcP9eeYXGsmjtk=;
  b=cczpY/eAbcWIGQV2lqhKSNIOlCKk25XdVx319JufaOQUzTEEhgO4LaMC
   xdirsWbkQX6vZhpNOxU91mOJFEiYmJzo4j5WIqU354MS6M4K7YQkbPv7l
   BloJueMGAVG0SDX1knjq5m1h5XVQPSttiJDBSjXvk3ma9t+ryiKUs4Hko
   oNyFdYndhOsTdHnLAulgY0Iz04mJg5pyS98B4YbAs/iOCFjLaZWERpumU
   GfgyIkZj+Z9Gvh3hvkr8PHjkySlJUt+/VfWCHfdrvTqtI1JiB/yIN/ISK
   3EWqQQBZqfY44VcSlvd3NhcYy1TtiSdCfl+UgDeOkUsa0Enqx9OJ2/SLO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415685"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415685"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527327"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527327"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:55 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A4A94122774;
        Wed,  1 Feb 2023 23:45:52 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 22/26] media: ipu3-cio2: Release the cio2 device context by media device callback
Date:   Wed,  1 Feb 2023 23:45:31 +0200
Message-Id: <20230201214535.347075-23-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the media device release callback to release the cio2 device's data
structure. This approach has the benefit of not releasing memory which may
still be accessed through open file handles whilst the ipu3-cio2 driver is
being unbound.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 55 ++++++++++++++-----
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 9fdfb2a794db..78bef16b2152 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -236,9 +236,15 @@ static int cio2_fbpt_init(struct cio2_device *cio2, struct cio2_queue *q)
 	return 0;
 }
 
-static void cio2_fbpt_exit(struct cio2_queue *q, struct device *dev)
+static int cio2_fbpt_exit(struct cio2_queue *q, struct device *dev)
 {
+	if (!q->fbpt)
+		return -ENOENT;
+
 	dma_free_coherent(dev, CIO2_FBPT_SIZE, q->fbpt, q->fbpt_bus_addr);
+	q->fbpt = NULL;
+
+	return 0;
 }
 
 /**************** CSI2 hardware setup ****************/
@@ -1652,13 +1658,13 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 
 static void cio2_queue_exit(struct cio2_device *cio2, struct cio2_queue *q)
 {
-	vb2_video_unregister_device(&q->vdev);
 	media_entity_cleanup(&q->vdev.entity);
 	v4l2_device_unregister_subdev(&q->subdev);
 	media_entity_cleanup(&q->subdev.entity);
-	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
-	mutex_destroy(&q->subdev_lock);
-	mutex_destroy(&q->lock);
+	if (!cio2_fbpt_exit(q, &cio2->pci_dev->dev)) {
+		mutex_destroy(&q->subdev_lock);
+		mutex_destroy(&q->lock);
+	}
 }
 
 static int cio2_queues_init(struct cio2_device *cio2)
@@ -1704,6 +1710,23 @@ static int cio2_check_fwnode_graph(struct fwnode_handle *fwnode)
 	return cio2_check_fwnode_graph(fwnode->secondary);
 }
 
+static void cio2_media_release(struct media_device *mdev)
+{
+	struct cio2_device *cio2 =
+		container_of(mdev, struct cio2_device, media_dev);
+
+	v4l2_async_nf_cleanup(&cio2->notifier);
+	cio2_queues_exit(cio2);
+	cio2_fbpt_exit_dummy(cio2);
+	mutex_destroy(&cio2->lock);
+
+	kfree(cio2);
+}
+
+static struct media_device_ops cio2_mdev_ops = {
+	.release = cio2_media_release,
+};
+
 /**************** PCI interface ****************/
 
 static int cio2_pci_probe(struct pci_dev *pci_dev,
@@ -1731,7 +1754,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 			return r;
 	}
 
-	cio2 = devm_kzalloc(dev, sizeof(*cio2), GFP_KERNEL);
+	cio2 = kzalloc(sizeof(*cio2), GFP_KERNEL);
 	if (!cio2)
 		return -ENOMEM;
 	cio2->pci_dev = pci_dev;
@@ -1782,6 +1805,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	mutex_init(&cio2->lock);
 
 	cio2->media_dev.dev = dev;
+	cio2->media_dev.ops = &cio2_mdev_ops;
 	strscpy(cio2->media_dev.model, CIO2_DEVICE_NAME,
 		sizeof(cio2->media_dev.model));
 	cio2->media_dev.hw_revision = 0;
@@ -1816,15 +1840,18 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 
 fail_clean_notifier:
 	v4l2_async_nf_unregister(&cio2->notifier);
-	v4l2_async_nf_cleanup(&cio2->notifier);
-	cio2_queues_exit(cio2);
+
 fail_v4l2_device_unregister:
 	v4l2_device_unregister(&cio2->v4l2_dev);
+
 fail_media_device_unregister:
 	media_device_unregister(&cio2->media_dev);
-	media_device_cleanup(&cio2->media_dev);
+
 fail_free_irq:
 	free_irq(pci_dev->irq, cio2);
+	media_device_put(&cio2->media_dev);
+	return r;
+
 fail_mutex_destroy:
 	mutex_destroy(&cio2->lock);
 	cio2_fbpt_exit_dummy(cio2);
@@ -1835,19 +1862,19 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 static void cio2_pci_remove(struct pci_dev *pci_dev)
 {
 	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
+	unsigned int i;
 
 	media_device_unregister(&cio2->media_dev);
+	for (i = 0; i < CIO2_QUEUES; i++)
+		vb2_video_unregister_device(&cio2->queue[i].vdev);
 	v4l2_device_unregister(&cio2->v4l2_dev);
 	free_irq(pci_dev->irq, cio2);
 	v4l2_async_nf_unregister(&cio2->notifier);
-	v4l2_async_nf_cleanup(&cio2->notifier);
-	cio2_queues_exit(cio2);
-	cio2_fbpt_exit_dummy(cio2);
-	media_device_cleanup(&cio2->media_dev);
-	mutex_destroy(&cio2->lock);
 
 	pm_runtime_forbid(&pci_dev->dev);
 	pm_runtime_get_noresume(&pci_dev->dev);
+
+	media_device_put(&cio2->media_dev);
 }
 
 static int __maybe_unused cio2_runtime_suspend(struct device *dev)
-- 
2.30.2

