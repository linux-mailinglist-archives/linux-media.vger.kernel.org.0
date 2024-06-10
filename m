Return-Path: <linux-media+bounces-12846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 284E8901EE4
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CC331C21440
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7981D7EF10;
	Mon, 10 Jun 2024 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kne01HzS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2287E576
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013961; cv=none; b=f95NFJIyA+1qkIqCxGzWo3ACi+pymltVG2BqZIIqXcR6O6SVeBSLr4s1kG21x0dtl9vCfyvIJaKXsWZRw3QBzZZCM7vYJh0oOatAHUjWk2g7MRC8mr1EX7OfTDCbgktPmiV1rnhAaznvRx0heNk73lbWWkHS7zl/3hlm+5IKB/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013961; c=relaxed/simple;
	bh=IRrBAWnxkcXM2L7iJGKpsp/aRa4n01VsCbFazZLfmE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cJUbV4RQmeLar4nEv63oWBPEZ4YWB6RP8H/5j4XU6udLBj0R/Yg0Ec08KKM0ui7O1JMaYcj/wUjwwLP2VgXh+Ic3n8rOHUuaMRyYyIS0S/RLpRqP/W74nouNbynbIjDdY/eMPWBIi6FC7Li1PTE+d31UwrS4Vhim9JdaLFggmxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kne01HzS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013961; x=1749549961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IRrBAWnxkcXM2L7iJGKpsp/aRa4n01VsCbFazZLfmE4=;
  b=kne01HzSIMxmHqk4a0e+bqMrjl/tQ6Fu0rwpqRYMWPUUoyiV5+reU5os
   HMjAb3eDZ0MCC4dYMPbzuhsnCR15vZ9L0/pUmj/qB3Vo4C4wrVnZrDXbf
   dXOSKIVhk7kc42J3Nf8OxV8pkEMX37f8RYjidxuJOtMjKT3rUVIxrkFhM
   PNr3uvERNxfmEh7ZXT/HPpoiPT9rbTPLBgHb5ZDaTY1ZbpC+Xfv2R6ONk
   /ZHuMu0AI2Z/0g4TMG/WPsK/48Igd1kun5E/RATEJIrP5h7IQ6CEEDXFv
   wbVf3u66UUhAh5+O7tl6PMWXhak2yAwc2+43iwnX6M4+bRzm+Lw4vAfQl
   w==;
X-CSE-ConnectionGUID: tYJdYGUhTsu50VCzNe3o/Q==
X-CSE-MsgGUID: 7dp2Vgi3QBSEHyEZe/BbFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819959"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819959"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:53 -0700
X-CSE-ConnectionGUID: 81PGMa/vTcCDCWjkfaD4Sw==
X-CSE-MsgGUID: 2rYnWktoRACGUB95dDfInQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137366"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3708C120BCB;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eDl-0f;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 18/26] media: ipu3-cio2: Release the cio2 device context by media device callback
Date: Mon, 10 Jun 2024 13:05:22 +0300
Message-Id: <20240610100530.1107771-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
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
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 72 ++++++++++++++++--------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 81ec8630453b..2f1202b2bc77 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -239,9 +239,15 @@ static int cio2_fbpt_init(struct cio2_device *cio2, struct cio2_queue *q)
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
@@ -1631,13 +1637,16 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 
 static void cio2_queue_exit(struct cio2_device *cio2, struct cio2_queue *q)
 {
-	vb2_video_unregister_device(&q->vdev);
 	media_entity_cleanup(&q->vdev.entity);
-	v4l2_device_unregister_subdev(&q->subdev);
 	media_entity_cleanup(&q->subdev.entity);
-	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
-	mutex_destroy(&q->subdev_lock);
-	mutex_destroy(&q->lock);
+	/*
+	 * Note that not all mutexes may have been initialised, destroy only
+	 * those that have.
+	 */
+	if (!cio2_fbpt_exit(q, &cio2->pci_dev->dev)) {
+		mutex_destroy(&q->subdev_lock);
+		mutex_destroy(&q->lock);
+	}
 }
 
 static int cio2_queues_init(struct cio2_device *cio2)
@@ -1647,16 +1656,10 @@ static int cio2_queues_init(struct cio2_device *cio2)
 	for (i = 0; i < CIO2_QUEUES; i++) {
 		r = cio2_queue_init(cio2, &cio2->queue[i]);
 		if (r)
-			break;
+			return r;
 	}
 
-	if (i == CIO2_QUEUES)
-		return 0;
-
-	for (i--; i >= 0; i--)
-		cio2_queue_exit(cio2, &cio2->queue[i]);
-
-	return r;
+	return 0;
 }
 
 static void cio2_queues_exit(struct cio2_device *cio2)
@@ -1667,6 +1670,22 @@ static void cio2_queues_exit(struct cio2_device *cio2)
 		cio2_queue_exit(cio2, &cio2->queue[i]);
 }
 
+static void cio2_media_release(struct media_device *mdev)
+{
+	struct cio2_device *cio2 =
+		container_of(mdev, struct cio2_device, media_dev);
+
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
@@ -1685,7 +1704,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	if (r)
 		return r;
 
-	cio2 = devm_kzalloc(dev, sizeof(*cio2), GFP_KERNEL);
+	cio2 = kzalloc(sizeof(*cio2), GFP_KERNEL);
 	if (!cio2)
 		return -ENOMEM;
 	cio2->pci_dev = pci_dev;
@@ -1730,6 +1749,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	mutex_init(&cio2->lock);
 
 	cio2->media_dev.dev = dev;
+	cio2->media_dev.ops = &cio2_mdev_ops;
 	strscpy(cio2->media_dev.model, CIO2_DEVICE_NAME,
 		sizeof(cio2->media_dev.model));
 	cio2->media_dev.hw_revision = 0;
@@ -1737,7 +1757,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	media_device_init(&cio2->media_dev);
 	r = media_device_register(&cio2->media_dev);
 	if (r < 0)
-		goto fail_mutex_destroy;
+		goto fail_media_device_put;
 
 	cio2->v4l2_dev.mdev = &cio2->media_dev;
 	r = v4l2_device_register(dev, &cio2->v4l2_dev);
@@ -1772,34 +1792,36 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 fail_clean_notifier:
 	v4l2_async_nf_unregister(&cio2->notifier);
 	v4l2_async_nf_cleanup(&cio2->notifier);
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
 	v4l2_async_nf_unregister(&cio2->notifier);
 	v4l2_async_nf_cleanup(&cio2->notifier);
-	cio2_queues_exit(cio2);
-	cio2_fbpt_exit_dummy(cio2);
+	for (i = 0; i < CIO2_QUEUES; i++) {
+		vb2_video_unregister_device(&cio2->queue[i].vdev);
+		v4l2_device_unregister_subdev(&cio2->queue[i].subdev);
+	}
 	v4l2_device_unregister(&cio2->v4l2_dev);
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


