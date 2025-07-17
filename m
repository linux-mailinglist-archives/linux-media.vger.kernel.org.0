Return-Path: <linux-media+bounces-37967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD64CB08B03
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B30C5A48734
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8048E29B761;
	Thu, 17 Jul 2025 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N3JWhyUJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571B429ACC0;
	Thu, 17 Jul 2025 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749149; cv=none; b=qnNpvs9Xw5pTPavLZTne3E6oU+Qs3y+CshvGWiNVge4MQnPKzeRxMyYvuHALQxQ5DWxrhcG1aRqEQr7teCDh2xy969VGX8ZXHdYd7sXwiaipaBiMSgARGQXB6OaCb7Mvxw994HPbL/P945lgDZiJMaz2wEQUkiExC7sF8RMRYK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749149; c=relaxed/simple;
	bh=zDLiKpcarRebLqHSrXV+LHH8PWDYb0+SfoPVzO8Rjbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIOjCXfgi103HBNMtYG+9phKyDeGm6elncwLTMZrlGVRHoWQxFbtrsHMivTbbSGAG9rO8ZwiIKIirXLeilX8t3yJAOLNRcMRi76vbAog1lZ4wa6RL2Jb7Om782NuLhzGxNztTmVNAHVxQ/9bFTE2RswE4j4hn5QnZlO6tysdgnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N3JWhyUJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A729221F2;
	Thu, 17 Jul 2025 12:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749108;
	bh=zDLiKpcarRebLqHSrXV+LHH8PWDYb0+SfoPVzO8Rjbg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N3JWhyUJPHkJFR6fywQTP3lfTnJe2j3ASCC7Qf+2GRr7QmUmuLjDgFQH4HRtmXf8r
	 zdoRQ4BwUz/8YodGiayWyswz35rIdCagMvd2YsXqJadFd1BelvJULilRvLywc3CJ5j
	 V0LQzqEdi7FmnDbAmDQaSOOW1dncTZ+an6/BS7w8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:28 +0200
Subject: [PATCH 02/26] media: mc: Maintain a list of open file handles in a
 media device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-2-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRODvjJd3XMj2tWRmbA5TTdq+0kdqmzKby+D
 FpwmIcXgoeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUTgAKCRByNAaPFqFW
 PN9kEADHAaupDlJBw4zoO05gDJC4g+2dUdVBtaKJ2IjklJUtSyewhQLVvyCIeIZ06l6FiAGmRxt
 vNWuVUDBpzFcvC3mM0AnlCf0CLyuOM7VOS5Vor0if88GN/Hj0TGxfHplOsFx7itbYITAsFliNJD
 U/dOb/2y1+Kgq8cn+zVIoI6uExDm66LOtEkCSotlBV/M0VKuLYIDMaA0Gqt/dd/odef91JtAHkN
 M5SFhvCGByUDqyf23dVkVHhI8nz0S9fvPuwhMcJlY6C9qrSRJFBSynISdRtf34mhdHk1Xh/CoYt
 nCISqlU6WAIwf+EXs7LQeTJe8pNaRw2dwsGNxgtdI6r/DmqcvBm0xczMQpXmAZ9uHe8ryOym+Fh
 yRHhdlywq//+IwXTUwTD/IcMe9k6qnKn+uIb1ofjkz1czqKWD57zAR2mSLkVb0zhdXYO/L75zmI
 ol8VsoiVKdA3FfvanFGSsLhCOmkpA8ikYbOgJk9TB625InFA9nL7JmFW+p0eYXFt+bop2odETIQ
 jOXFxDBowgbL3mpI+Ro3NNUSQXV2oeScvhEzN2UksG2NU4EY4aZ17bAfWg1gVayRt1QEBUjOaCR
 rvr6PcZbAAMQc0/82aZTUZEtQ/S8E7b+nhkzJyVnjCJuK+fmF120eet7jkQSqhLeTdwJfeTKvNN
 8rQjm6Voijtk1Fw==
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


