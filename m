Return-Path: <linux-media+bounces-6887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF187922C
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89D472823EE
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E833179DBD;
	Tue, 12 Mar 2024 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdHhElFI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDCD79B98
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239681; cv=none; b=iA2INnlgQ94qBJwJYfj37kk1PS2KUbpLb2ONM+mpd0GO4KXPRGXUtB9ZH28dVRQi2klPA4fIOUDi3kNKXu1czODGC8J3d3HmZjQ1LFQk8OZ3D2vbu2737TUQAAz+y+7XFuXyyFqMUCgfZIgODy60Tw27kWptbIgsVF2ba02ievw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239681; c=relaxed/simple;
	bh=mjtyqLV3PD/0dNFTGCwDwuf08P3lvfWUEm6jcsOWoZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oaZEbnpIYK8+Rpsut3N/+RYl9DaV31+hI/uRIiezRmDMKNwkR4KFbULo8TTQa1Jo+aS9dY652q2yOcVklXfEL8EO+G2b0oOlD1lJ3ntvssuQJ55VMV22GlU2YRjHqRztVq34jSOY+9SNdUSnwzzAaCdV8uwSIyvYzZY5X+enZ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdHhElFI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239680; x=1741775680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mjtyqLV3PD/0dNFTGCwDwuf08P3lvfWUEm6jcsOWoZs=;
  b=bdHhElFIOJ3DmD2nsFeZg/kfek0oRTmI8c6KQEBFGBHWa4vzkqN3k2Sl
   CWhTSPFCExJ4Ux02f+BJkV8kGYx+dQ8lgDVnH9W4MfrdxABogkzW4XnSK
   ewxNjwzawJ9+muhEEf8pyX1NVLbTn9Z3uJ1OYmvsz7I/J2lMGKS38T9bp
   i1HjyPCgoAFn/VocAldJ2/ZIY49mHnwYrB4OjBkOxC5VD4OSPW/CtT/Zm
   gu1bUYHUYYsKPN/9Lcl1RNLrIiafGKyaQ7ryNVELqBmXocZS6vUxGFvja
   gVPyh7vQL6hNDF3mRN+XiiPX9phYR2dGVI9SgNQ257/hQHD6XjxSl2v9T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794325"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194101"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:38 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 52AC21206F9;
	Tue, 12 Mar 2024 12:34:35 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 18/26] media: ipu3-cio2: Release the cio2 device context by media device callback
Date: Tue, 12 Mar 2024 12:34:14 +0200
Message-Id: <20240312103422.216484-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
References: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
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
index 00090e7f5f9d..87eda435e37d 100644
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


