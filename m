Return-Path: <linux-media+bounces-38386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0032DB10CDA
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0DCA3AB64E
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA1D2E0B6E;
	Thu, 24 Jul 2025 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CPY1KMtG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABDA2D5418;
	Thu, 24 Jul 2025 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366235; cv=none; b=U1lgUdsLMCzTO54jWbWsO1HczK1YRrCtmcA4Wl7BRYPoAYEItbR0367bl9VGNz+EnJtkVyUS7T9VJmrvvXTGCHH+Gsef0/ThMRrpQceoyo1vRd3zZ87bXafVdkSc7tbmj3TYvmyvdo9wk2fIjWoy9sSBkOrEn4ILCfQB5BSrmRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366235; c=relaxed/simple;
	bh=zDLiKpcarRebLqHSrXV+LHH8PWDYb0+SfoPVzO8Rjbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SONVz94XLcKscXZZ9mGBhO0Q5OYlnzEcN2H/o6/QwLsfEoNLybrSjxyNZhtLxGDUb/JLHOK2k1Q+YrQCNWNmkX7gyAIlrkgk/2eJudN0s9uJ2Ky+mV/zLoLVCSN1E5p/QCjKe2jmXTCho4nKegRCOjw+IvqT+Agtz//lLECgPgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CPY1KMtG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DF17190D;
	Thu, 24 Jul 2025 16:09:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366190;
	bh=zDLiKpcarRebLqHSrXV+LHH8PWDYb0+SfoPVzO8Rjbg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CPY1KMtGLCOdP9TXQ0RqC350lFyac3obxfU6ySAP1MSXGMVHFV1KXmD1nWBn7Sj86
	 GcrrlBUno3vW4ws4Ul6n9aOXK82mh3h47P9cOwkQLnvIdema0S34Jv+eqFnckyXeW2
	 dUuKfNiE2KqEhwqZU5MRyCFNsRbH+cswobBEYBGw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:09 +0200
Subject: [PATCH v2 02/27] media: mc: Maintain a list of open file handles
 in a media device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-2-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3849;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=/rqN2PeYLVGrC1gEE4q9OmKFqZ01RUXwuvcLLsZvWlg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7Ox96cpEe5xXWsnzWGaSEqnjMmgCxy9aH+k
 AExdRPrDUOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zgAKCRByNAaPFqFW
 PGARD/9IgoHSHjubJ8wckLbGKEcTrRCALPQOrJ7z58zOdGADWX8VyXQzCbLyueW5viFbsSkw2r+
 xy6DYTl45p7NrA2zXYKWzNAmVZ1aGWwOd48e1UNJfB2hJHA+xLhq6ilAOhKIrYBwOQdXdeOlfG/
 rk/TEo9azmYM70sVDjfIj8g+yjwywjeWx/WknjrfgfyrGfMeb3LZbXQ9mg3ujW88vYX/uAZyRMT
 HO0xsK0oT4rlI9FkBQMinnwqP8ERr+ux/GPvDz4fZnpQ2oCId6yD3RUGPPW+l7jNx5nA4d7ch6y
 qnsTrr4+KT7VamhKd7TzLVNYSt02Pu0AZFBLI6ZNe378He7HnyiqQ7wqW0y38XtTViJEcN/cwX3
 7V0lBIN37VwfLQL2fC5Ll735DgmCjmhlg72deXC2x11UDN69ArR0ma67y6hNb3h5DaslQ+Y3uxQ
 1rLsJjlxmKRtkmvKW488i2fwSsc7ok2tYmOSN5IYKIZW9CMnGI+0i8Ra11f5KDq802rrXl//wtA
 NZ9Wfu5PfIl6n+9C8f2ifEBdGGMLS9Epz8wNO/Zi1D2jaMdPlDpilAg1zqI9ZjHLblGoB5Iz1f0
 JJmFiUopCdq5RFXV4Rx7J3e+Th8LPXAlkyEOvylQdISsGQbRrDTCeTPkNioYRavPBefYX30PE1Q
 zwnMcz8n5rcp2/g==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Sakari Ailus <sakari.ailus@linux.intel.com>

The list of file handles is needed to deliver media events as well as for
other purposes in the future.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[Access media_device with devnode->media_dev]
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-device.c  | 19 ++++++++++++++++++-
 drivers/media/mc/mc-devnode.c |  2 +-
 include/media/media-devnode.h |  3 ++-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index f298f8f67b8a84194d66126461e84228c0b20394..e0cad87087d3863bf14207049a54e5e4dea1cdd4 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -45,8 +45,9 @@ static inline void __user *media_get_uptr(__u64 arg)
 	return (void __user *)(uintptr_t)arg;
 }
 
-static int media_device_open(struct file *filp)
+static int media_device_open(struct media_devnode *devnode, struct file *filp)
 {
+	struct media_device *mdev = devnode->media_dev;
 	struct media_device_fh *fh;
 
 	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
@@ -55,13 +56,23 @@ static int media_device_open(struct file *filp)
 
 	filp->private_data = &fh->fh;
 
+	spin_lock_irq(&mdev->fh_list_lock);
+	list_add(&fh->mdev_list, &mdev->fh_list);
+	spin_unlock_irq(&mdev->fh_list_lock);
+
 	return 0;
 }
 
 static int media_device_close(struct file *filp)
 {
+	struct media_devnode *devnode = media_devnode_data(filp);
+	struct media_device *mdev = devnode->media_dev;
 	struct media_device_fh *fh = media_device_fh(filp);
 
+	spin_lock_irq(&mdev->fh_list_lock);
+	list_del(&fh->mdev_list);
+	spin_unlock_irq(&mdev->fh_list_lock);
+
 	kfree(fh);
 
 	return 0;
@@ -698,10 +709,12 @@ void media_device_init(struct media_device *mdev)
 	INIT_LIST_HEAD(&mdev->pads);
 	INIT_LIST_HEAD(&mdev->links);
 	INIT_LIST_HEAD(&mdev->entity_notify);
+	INIT_LIST_HEAD(&mdev->fh_list);
 
 	mutex_init(&mdev->req_queue_mutex);
 	mutex_init(&mdev->graph_mutex);
 	ida_init(&mdev->entity_internal_idx);
+	spin_lock_init(&mdev->fh_list_lock);
 
 	atomic_set(&mdev->request_id, 0);
 
@@ -809,6 +822,10 @@ void media_device_unregister(struct media_device *mdev)
 		return;
 	}
 
+	spin_lock_irq(&mdev->fh_list_lock);
+	list_del_init(&mdev->fh_list);
+	spin_unlock_irq(&mdev->fh_list_lock);
+
 	/* Clear the devnode register bit to avoid races with media dev open */
 	media_devnode_unregister_prepare(mdev->devnode);
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 312eb48ffc2f2a0c013e4744204995df0ff5b12c..50435f102aa7cd6a7cde759eeef73a99b9b80239 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -163,7 +163,7 @@ static int media_open(struct inode *inode, struct file *filp)
 	get_device(&devnode->dev);
 	mutex_unlock(&media_devnode_lock);
 
-	ret = devnode->fops->open(filp);
+	ret = devnode->fops->open(devnode, filp);
 	if (ret) {
 		put_device(&devnode->dev);
 		return ret;
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index 6c2e253dde498779dffd103dc5d00e50e14a0249..26b19373c6646bfd11cfded220c9e61c81130580 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -22,6 +22,7 @@
 #include <linux/cdev.h>
 
 struct media_device;
+struct media_devnode;
 
 /*
  * Flag to mark the media_devnode struct as registered. Drivers must not touch
@@ -51,7 +52,7 @@ struct media_file_operations {
 	__poll_t (*poll) (struct file *, struct poll_table_struct *);
 	long (*ioctl) (struct file *, unsigned int, unsigned long);
 	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
-	int (*open) (struct file *);
+	int (*open) (struct media_devnode *, struct file *);
 	int (*release) (struct file *);
 };
 

-- 
2.49.0


