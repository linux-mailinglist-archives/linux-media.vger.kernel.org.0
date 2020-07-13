Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE9621D4FD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbgGMLa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:30:58 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42141 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729252AbgGMLa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:30:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uwfYj6z2lGLmCuwfejB4u3; Mon, 13 Jul 2020 13:30:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594639854; bh=ULqkwBbBOT7Ntal1LMge8ts6mj0+ZeIpZBaWH5CBK+I=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=sKo0Xn8RwJlNFltggfVBD+Vvz16ZdBXxA6aOiBW2lB7oTVI4HLrM6Ngefbtvh3sar
         w6wCuuTaWdXUR6IXN91w5TipjKq8DsCZ2XUWabl0nJmzizgFRKFZ2mW3bb5lWU4WWk
         Lwv8YSaPxfZlXmLpg8Jn/iajOis0XGwleYiCg6CI0qWuaBeL1aCydMlZk8dorpBPC9
         QrNCvvuk4NWxOQ1wjSQytsbnz04nQ0OCGKTCPsYfR0TQl1kAd4IhO5BUBqWkr4pG4M
         yTLooXoyBu+yxArWnmXYLJbcJVXjZlP0yjBGS3Kdk0xNjt2W/o96S/Znha226L+c8p
         QIqoQ0jNtKzWA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCHv3 3/7] media/pci: use vb2_video_unregister_device()
Date:   Mon, 13 Jul 2020 13:30:44 +0200
Message-Id: <20200713113048.1150542-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMGjLj2W68T9S41ABpylCO2HeD9mOSfSufutuAV/LqHukRMFxZAdQilW2K+j5cHuErszXK3Vy/rfl2vXtGS72ttOjv34Pepbs3sxOAYygQVpJTu9tLGf
 jbXRQ/ghbRewly9ZO7ZHIkJenN8CCpQff9vGZXRxNlzCiPKWjwR4TdnZurHcA18daVdpDGtliJOxPnV6DfHeKCn8SZQ5LImCslbcSfxPkT14HGGpDOoeUR8j
 1lTtXiv8dK71U+uyoU2zoli7Vc9YsOgG70bmi+lRLVU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use vb2_video_unregister_device() to automatically stop streaming
at unregister time.

This avoids the use of vb2_queue_release() which should not be
called by drivers that set vdev->queue.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/dt3155/dt3155.c           | 3 +--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c    | 9 +++------
 drivers/media/pci/saa7134/saa7134-core.c    | 6 +++---
 drivers/media/pci/saa7134/saa7134-empress.c | 3 +--
 drivers/media/pci/saa7134/saa7134-go7007.c  | 2 +-
 drivers/media/pci/saa7134/saa7134-video.c   | 2 --
 drivers/media/pci/sta2x11/sta2x11_vip.c     | 6 ++----
 drivers/media/pci/tw5864/tw5864-video.c     | 4 +---
 8 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 82581aa5a2a3..45c61a12e451 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -575,9 +575,8 @@ static void dt3155_remove(struct pci_dev *pdev)
 	struct dt3155_priv *pd = container_of(v4l2_dev, struct dt3155_priv,
 					      v4l2_dev);
 
-	video_unregister_device(&pd->vdev);
+	vb2_video_unregister_device(&pd->vdev);
 	free_irq(pd->pdev->irq, pd);
-	vb2_queue_release(&pd->vidq);
 	v4l2_device_unregister(&pd->v4l2_dev);
 	pci_iounmap(pdev, pd->regs);
 	pci_release_region(pdev, 0);
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 92f5eadf2c99..4e9e34857e4c 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1633,7 +1633,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	if (r) {
 		dev_err(&cio2->pci_dev->dev,
 			"failed to initialize videobuf2 queue (%d)\n", r);
-		goto fail_vbq;
+		goto fail_subdev;
 	}
 
 	/* Initialize vdev */
@@ -1664,10 +1664,8 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	return 0;
 
 fail_link:
-	video_unregister_device(&q->vdev);
+	vb2_video_unregister_device(&q->vdev);
 fail_vdev:
-	vb2_queue_release(vbq);
-fail_vbq:
 	v4l2_device_unregister_subdev(subdev);
 fail_subdev:
 	media_entity_cleanup(&vdev->entity);
@@ -1683,9 +1681,8 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 
 static void cio2_queue_exit(struct cio2_device *cio2, struct cio2_queue *q)
 {
-	video_unregister_device(&q->vdev);
+	vb2_video_unregister_device(&q->vdev);
 	media_entity_cleanup(&q->vdev.entity);
-	vb2_queue_release(&q->vbq);
 	v4l2_device_unregister_subdev(&q->subdev);
 	media_entity_cleanup(&q->subdev.entity);
 	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index e4623ed2f831..e3ccb464c044 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -965,21 +965,21 @@ static void saa7134_unregister_video(struct saa7134_dev *dev)
 
 	if (dev->video_dev) {
 		if (video_is_registered(dev->video_dev))
-			video_unregister_device(dev->video_dev);
+			vb2_video_unregister_device(dev->video_dev);
 		else
 			video_device_release(dev->video_dev);
 		dev->video_dev = NULL;
 	}
 	if (dev->vbi_dev) {
 		if (video_is_registered(dev->vbi_dev))
-			video_unregister_device(dev->vbi_dev);
+			vb2_video_unregister_device(dev->vbi_dev);
 		else
 			video_device_release(dev->vbi_dev);
 		dev->vbi_dev = NULL;
 	}
 	if (dev->radio_dev) {
 		if (video_is_registered(dev->radio_dev))
-			video_unregister_device(dev->radio_dev);
+			vb2_video_unregister_device(dev->radio_dev);
 		else
 			video_device_release(dev->radio_dev);
 		dev->radio_dev = NULL;
diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index 8ad7879bd840..39e3c7f8c5b4 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -314,8 +314,7 @@ static int empress_fini(struct saa7134_dev *dev)
 	if (NULL == dev->empress_dev)
 		return 0;
 	flush_work(&dev->empress_workqueue);
-	video_unregister_device(dev->empress_dev);
-	vb2_queue_release(&dev->empress_vbq);
+	vb2_video_unregister_device(dev->empress_dev);
 	v4l2_ctrl_handler_free(&dev->empress_ctrl_handler);
 	dev->empress_dev = NULL;
 	return 0;
diff --git a/drivers/media/pci/saa7134/saa7134-go7007.c b/drivers/media/pci/saa7134/saa7134-go7007.c
index e1b034663958..f319edb39c0e 100644
--- a/drivers/media/pci/saa7134/saa7134-go7007.c
+++ b/drivers/media/pci/saa7134/saa7134-go7007.c
@@ -493,7 +493,7 @@ static int saa7134_go7007_fini(struct saa7134_dev *dev)
 	free_page((unsigned long)saa->bottom);
 	v4l2_device_unregister_subdev(&saa->sd);
 	kfree(saa);
-	video_unregister_device(&go->vdev);
+	vb2_video_unregister_device(&go->vdev);
 
 	v4l2_device_put(&go->v4l2_dev);
 	dev->empress_dev = NULL;
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index a8ac94fadc14..9a6a6b68f8e3 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -2154,9 +2154,7 @@ int saa7134_video_init1(struct saa7134_dev *dev)
 void saa7134_video_fini(struct saa7134_dev *dev)
 {
 	/* free stuff */
-	vb2_queue_release(&dev->video_vbq);
 	saa7134_pgtable_free(dev->pci, &dev->video_q.pt);
-	vb2_queue_release(&dev->vbi_vbq);
 	saa7134_pgtable_free(dev->pci, &dev->vbi_q.pt);
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 	if (card_has_radio(dev))
diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index 798574cfad35..a8ab1598dc83 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -1101,12 +1101,11 @@ static int sta2x11_vip_init_one(struct pci_dev *pdev,
 vunreg:
 	video_set_drvdata(&vip->video_dev, NULL);
 vrelease:
-	video_unregister_device(&vip->video_dev);
+	vb2_video_unregister_device(&vip->video_dev);
 	free_irq(pdev->irq, vip);
 release_buf:
 	pci_disable_msi(pdev);
 unmap:
-	vb2_queue_release(&vip->vb_vidq);
 	pci_iounmap(pdev, vip->iomem);
 release:
 	pci_release_regions(pdev);
@@ -1146,10 +1145,9 @@ static void sta2x11_vip_remove_one(struct pci_dev *pdev)
 	sta2x11_vip_clear_register(vip);
 
 	video_set_drvdata(&vip->video_dev, NULL);
-	video_unregister_device(&vip->video_dev);
+	vb2_video_unregister_device(&vip->video_dev);
 	free_irq(pdev->irq, vip);
 	pci_disable_msi(pdev);
-	vb2_queue_release(&vip->vb_vidq);
 	pci_iounmap(pdev, vip->iomem);
 	pci_release_regions(pdev);
 
diff --git a/drivers/media/pci/tw5864/tw5864-video.c b/drivers/media/pci/tw5864/tw5864-video.c
index ec1e06da7e4f..943f692024af 100644
--- a/drivers/media/pci/tw5864/tw5864-video.c
+++ b/drivers/media/pci/tw5864/tw5864-video.c
@@ -1178,7 +1178,6 @@ static int tw5864_video_input_init(struct tw5864_input *input, int video_nr)
 
 free_v4l2_hdl:
 	v4l2_ctrl_handler_free(hdl);
-	vb2_queue_release(&input->vidq);
 free_mutex:
 	mutex_destroy(&input->lock);
 
@@ -1187,9 +1186,8 @@ static int tw5864_video_input_init(struct tw5864_input *input, int video_nr)
 
 static void tw5864_video_input_fini(struct tw5864_input *dev)
 {
-	video_unregister_device(&dev->vdev);
+	vb2_video_unregister_device(&dev->vdev);
 	v4l2_ctrl_handler_free(&dev->hdl);
-	vb2_queue_release(&dev->vidq);
 }
 
 void tw5864_video_fini(struct tw5864_dev *dev)
-- 
2.27.0

