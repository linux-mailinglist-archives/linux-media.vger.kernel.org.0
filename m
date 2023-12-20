Return-Path: <linux-media+bounces-2783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E858819CFE
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32A6C1C22888
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F4D2208C;
	Wed, 20 Dec 2023 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyZB2tKK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7A219EF
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068652; x=1734604652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+M6yyO46Xtu1fwW0RMGaWr7x2lDqmtvQjpWHYItP3FY=;
  b=WyZB2tKK2PgenDKA3m8OkGxgmjLADSYDo4v9d9qspK7WVoqwvKtSobAt
   YSqReeBRCdE+Lw0jNsJH3CY2yqx8Qb3JbyHH8jZV5FjWgWkj3ZZOZ/81u
   VqV2Yj49daa8a/XjEP6wf+AjtiqkGEd7owewXr0HzMJ9PVb15SJ5/7caF
   gCpuBAQkCUhz+MhsRqN8XmmeuRUrEXjX1fIS8V9QDgjpMvY4YK2uZ5De8
   75YD+oZwGrFteu6dQ1GRdWosQBK+Lc5SYvn18wBFZuE980waZrZ1JaseX
   RadqELlB9bIQ6a19sxVXVW+e9esMwWZI4ywfqAbItO8nDVSxvEX8fe1zk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174387"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174387"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544273"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544273"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:30 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DB5E9120A70;
	Wed, 20 Dec 2023 12:37:27 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 22/29] media: ipu3-cio2: Release the cio2 device context by media device callback
Date: Wed, 20 Dec 2023 12:37:06 +0200
Message-Id: <20231220103713.113386-23-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the media device release callback to release the cio2 device's data
structure. This approach has the benefit of not releasing memory which may
still be accessed through open file handles whilst the ipu3-cio2 driver is
being unbound.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 58 ++++++++++++++++--------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 3222ec5b8345..bff66e6d3b1e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -238,9 +238,15 @@ static int cio2_fbpt_init(struct cio2_device *cio2, struct cio2_queue *q)
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
@@ -1643,13 +1649,13 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 
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
@@ -1695,6 +1701,23 @@ static int cio2_check_fwnode_graph(struct fwnode_handle *fwnode)
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
+static const struct media_device_ops cio2_mdev_ops = {
+	.release = cio2_media_release,
+};
+
 /**************** PCI interface ****************/
 
 static int cio2_pci_probe(struct pci_dev *pci_dev,
@@ -1722,7 +1745,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 			return r;
 	}
 
-	cio2 = devm_kzalloc(dev, sizeof(*cio2), GFP_KERNEL);
+	cio2 = kzalloc(sizeof(*cio2), GFP_KERNEL);
 	if (!cio2)
 		return -ENOMEM;
 	cio2->pci_dev = pci_dev;
@@ -1767,6 +1790,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	mutex_init(&cio2->lock);
 
 	cio2->media_dev.dev = dev;
+	cio2->media_dev.ops = &cio2_mdev_ops;
 	strscpy(cio2->media_dev.model, CIO2_DEVICE_NAME,
 		sizeof(cio2->media_dev.model));
 	cio2->media_dev.hw_revision = 0;
@@ -1774,7 +1798,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	media_device_init(&cio2->media_dev);
 	r = media_device_register(&cio2->media_dev);
 	if (r < 0)
-		goto fail_mutex_destroy;
+		goto fail_media_device_put;
 
 	cio2->v4l2_dev.mdev = &cio2->media_dev;
 	r = v4l2_device_register(dev, &cio2->v4l2_dev);
@@ -1808,35 +1832,33 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 
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
-fail_mutex_destroy:
-	mutex_destroy(&cio2->lock);
-	cio2_fbpt_exit_dummy(cio2);
 
+fail_media_device_put:
+	media_device_put(&cio2->media_dev);
 	return r;
 }
 
 static void cio2_pci_remove(struct pci_dev *pci_dev)
 {
 	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
+	unsigned int i;
 
 	media_device_unregister(&cio2->media_dev);
+	for (i = 0; i < CIO2_QUEUES; i++)
+		vb2_video_unregister_device(&cio2->queue[i].vdev);
 	v4l2_device_unregister(&cio2->v4l2_dev);
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
2.39.2


