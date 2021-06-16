Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8337F3A9A61
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbhFPMav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:49290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232358AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9260E613C2;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=Q1tDTioMTTZyxPq0ma5epEY3ATz4aAl7ortadL2eJ7A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mn87QQQH/cJ4jb1weI81ynCyYRgGJocYY3+nkO7OSkUTzN2Whg+jXMACEKxEXpf7N
         TwDZBSBBbm/G0sQTJe9QQZwaRQV82ey666VdlFmSU8kRHM/X7JvnzWhdpg8QgLUemr
         dm/WL69mTVvAVtu5qg2o1xary3LEMzgqIGt/uL/VikIltqpU2Ge+Q2xCSfaxtMm/Tg
         81yDN0FouronFeQPRI37VFvHxg/ZADwPaNStHpr42mEth1I5rtPZ9q2Cik3TYjnYF9
         /eb/FX79eRovv4yk9VJWf1FRYml0rAMo08NRz8HjJW660/EnZg1Io21wWOrg399mSz
         i8zUGUrIJjd/Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oif-BK; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tasos Sahanidis <tasos@tasossah.com>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 05/11] media: saa7134: use more meaninful goto labels
Date:   Wed, 16 Jun 2021 14:28:31 +0200
Message-Id: <92d976c1f716aaa632719ed089423487c80a57dc.1623846327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623846327.git.mchehab+huawei@kernel.org>
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of just numbering fail0 to fail4, use more meaninful
goto labels.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/saa7134/saa7134-core.c | 34 ++++++++++++------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index ec8dd41f9ebb..97b1767f1fff 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -1031,7 +1031,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	dev->media_dev = kzalloc(sizeof(*dev->media_dev), GFP_KERNEL);
 	if (!dev->media_dev) {
 		err = -ENOMEM;
-		goto fail0;
+		goto err_free_dev;
 	}
 	media_device_pci_init(dev->media_dev, pci_dev, dev->name);
 	dev->v4l2_dev.mdev = dev->media_dev;
@@ -1039,13 +1039,13 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 
 	err = v4l2_device_register(&pci_dev->dev, &dev->v4l2_dev);
 	if (err)
-		goto fail0;
+		goto err_free_dev;
 
 	/* pci init */
 	dev->pci = pci_dev;
 	if (pci_enable_device(pci_dev)) {
 		err = -EIO;
-		goto fail1;
+		goto err_v4l2_unregister;
 	}
 
 	/* pci quirks */
@@ -1095,7 +1095,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	err = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32));
 	if (err) {
 		pr_warn("%s: Oops: no 32bit PCI DMA ???\n", dev->name);
-		goto fail1;
+		goto err_v4l2_unregister;
 	}
 
 	/* board config */
@@ -1129,7 +1129,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 		err = -EBUSY;
 		pr_err("%s: can't get MMIO memory @ 0x%llx\n",
 		       dev->name,(unsigned long long)pci_resource_start(pci_dev,0));
-		goto fail1;
+		goto err_v4l2_unregister;
 	}
 	dev->lmmio = ioremap(pci_resource_start(pci_dev, 0),
 			     pci_resource_len(pci_dev, 0));
@@ -1138,7 +1138,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 		err = -EIO;
 		pr_err("%s: can't ioremap() MMIO memory\n",
 		       dev->name);
-		goto fail2;
+		goto err_release_mem_reg;
 	}
 
 	/* initialize hardware #1 */
@@ -1151,7 +1151,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	if (err < 0) {
 		pr_err("%s: can't get IRQ %d\n",
 		       dev->name,pci_dev->irq);
-		goto fail3;
+		goto err_iounmap;
 	}
 
 	/* wait a bit, register i2c bus */
@@ -1217,7 +1217,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	if (err < 0) {
 		pr_info("%s: can't register video device\n",
 		       dev->name);
-		goto fail4;
+		goto err_unregister_video;
 	}
 	pr_info("%s: registered device %s [v4l2]\n",
 	       dev->name, video_device_node_name(dev->video_dev));
@@ -1234,7 +1234,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	err = video_register_device(dev->vbi_dev,VFL_TYPE_VBI,
 				    vbi_nr[dev->nr]);
 	if (err < 0)
-		goto fail4;
+		goto err_unregister_video;
 	pr_info("%s: registered device %s\n",
 	       dev->name, video_device_node_name(dev->vbi_dev));
 
@@ -1248,7 +1248,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 		err = video_register_device(dev->radio_dev,VFL_TYPE_RADIO,
 					    radio_nr[dev->nr]);
 		if (err < 0)
-			goto fail4;
+			goto err_unregister_video;
 		pr_info("%s: registered device %s\n",
 		       dev->name, video_device_node_name(dev->radio_dev));
 	}
@@ -1259,7 +1259,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	err = v4l2_mc_create_media_graph(dev->media_dev);
 	if (err) {
 		pr_err("failed to create media graph\n");
-		goto fail4;
+		goto err_unregister_video;
 	}
 #endif
 	/* everything worked */
@@ -1278,24 +1278,24 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 #ifdef CONFIG_MEDIA_CONTROLLER
 	err = media_device_register(dev->media_dev);
 	if (err)
-		goto fail4;
+		goto err_unregister_video;
 #endif
 
 	return 0;
 
- fail4:
+err_unregister_video:
 	saa7134_unregister_video(dev);
 	saa7134_i2c_unregister(dev);
 	free_irq(pci_dev->irq, dev);
- fail3:
+err_iounmap:
 	saa7134_hwfini(dev);
 	iounmap(dev->lmmio);
- fail2:
+err_release_mem_reg:
 	release_mem_region(pci_resource_start(pci_dev,0),
 			   pci_resource_len(pci_dev,0));
- fail1:
+err_v4l2_unregister:
 	v4l2_device_unregister(&dev->v4l2_dev);
- fail0:
+err_free_dev:
 #ifdef CONFIG_MEDIA_CONTROLLER
 	kfree(dev->media_dev);
 #endif
-- 
2.31.1

