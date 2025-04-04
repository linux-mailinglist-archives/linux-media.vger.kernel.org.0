Return-Path: <linux-media+bounces-29396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3AA7BE7B
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 15:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 390D73BC0E2
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 13:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314751F542E;
	Fri,  4 Apr 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZsMaGUd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8491F3B92;
	Fri,  4 Apr 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774858; cv=none; b=hGYl32VidkZ9J1xyHVoocPljdHJiV6h8WtbZKR68misdQoGjRRIHyXFsvm8AY/omyKD1HBTH+YTKxey+U9ysrzX5cA/BCMS6YeOOJWQxr2Y1hx0NxJFFSi6lBZxjtrF1K2mDOnJFzNvyKFRuHkTAM9h+ZyBzuMiKTh6TiWhuDbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774858; c=relaxed/simple;
	bh=7ymnAIVE6QQ58E88Ri+jSO940Kj+C1uzuSwsIQri0B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwCwsnM3TZV61gnxHCE+yrbUScfrB84Zn+qhoApRjzvCuBw5I3j8E8x7S2PdOTVx1+FcsVy5AwNzi4xIx0sQaMjVQyuXs20CwCCfrMiOUBPNvwofiv8hOreuiCCvhSm4Xw2FjfB9blmjmNRwQikDi3uLlbsE0rWJtjpmD087BqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZsMaGUd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24EFC4CEE9;
	Fri,  4 Apr 2025 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743774854;
	bh=7ymnAIVE6QQ58E88Ri+jSO940Kj+C1uzuSwsIQri0B8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OZsMaGUd5QWZA5oJ2EI1WN97sxwdnYSojB6+d1NKdFQnvwSZ6ITyr1k7I+dqYbEaU
	 jXttcZ+2geUhOInPgc4eakcpc0dMgVQr7atYbwNq8OJwSYpYwWa0f6MnfoPtVWfLh3
	 GDH3P/XOHSaRDf3JX7Lz4wVozSSVLZGA9RPtUMeJk5N2rsjmy/kpAAilyLiKeIf372
	 JBMZGqJC6MgfLyecv5OVVv5WkoLMOjnLOY1wckhSWnDNegaE/wufsPv+AobicHpLs8
	 U16map6yLtvM47zBwnJBz6hoCzo9Ns8rKJlN7PWyEWM6z0oxgORKATqPxDDVdoZx2O
	 OibtoTNaZCEpw==
From: Philipp Stanner <phasta@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Ismael Luceno <ismael@iodev.co.uk>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 5/5] media: tw5864: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 15:53:45 +0200
Message-ID: <20250404135344.93241-7-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250404135344.93241-2-phasta@kernel.org>
References: <20250404135344.93241-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_table() and pcim_iomap_regions() have been deprecated.
pcim_iomap_regions(), furthermore, has so far wrongly been passed the
device's name instead of the driver's name, which makes that function's
debug prints useless.

Replace the deprecated function with pcim_iomap_region().

Define the driver name globally and use it where appropriate.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/media/pci/tw5864/tw5864-core.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/tw5864/tw5864-core.c b/drivers/media/pci/tw5864/tw5864-core.c
index 4d33caf83307..832788603f88 100644
--- a/drivers/media/pci/tw5864/tw5864-core.c
+++ b/drivers/media/pci/tw5864/tw5864-core.c
@@ -24,6 +24,8 @@
 #include "tw5864.h"
 #include "tw5864-reg.h"
 
+#define DRIVER_NAME "tw5864"
+
 MODULE_DESCRIPTION("V4L2 driver module for tw5864-based multimedia capture & encoding devices");
 MODULE_AUTHOR("Bluecherry Maintainers <maintainers@bluecherrydvr.com>");
 MODULE_AUTHOR("Andrey Utkin <andrey.utkin@corp.bluecherry.net>");
@@ -246,7 +248,8 @@ static int tw5864_initdev(struct pci_dev *pci_dev,
 	if (!dev)
 		return -ENOMEM;
 
-	snprintf(dev->name, sizeof(dev->name), "tw5864:%s", pci_name(pci_dev));
+	snprintf(dev->name, sizeof(dev->name), "%s:%s", DRIVER_NAME,
+		 pci_name(pci_dev));
 
 	err = v4l2_device_register(&pci_dev->dev, &dev->v4l2_dev);
 	if (err)
@@ -269,12 +272,12 @@ static int tw5864_initdev(struct pci_dev *pci_dev,
 	}
 
 	/* get mmio */
-	err = pcim_iomap_regions(pci_dev, BIT(0), dev->name);
+	dev->mmio = pcim_iomap_region(pci_dev, 0, DRIVER_NAME);
+	err = PTR_ERR_OR_ZERO(dev->mmio);
 	if (err) {
 		dev_err(&dev->pci->dev, "Cannot request regions for MMIO\n");
 		goto unreg_v4l2;
 	}
-	dev->mmio = pcim_iomap_table(pci_dev)[0];
 
 	spin_lock_init(&dev->slock);
 
@@ -290,7 +293,7 @@ static int tw5864_initdev(struct pci_dev *pci_dev,
 
 	/* get irq */
 	err = devm_request_irq(&pci_dev->dev, pci_dev->irq, tw5864_isr,
-			       IRQF_SHARED, "tw5864", dev);
+			       IRQF_SHARED, DRIVER_NAME, dev);
 	if (err < 0) {
 		dev_err(&dev->pci->dev, "can't get IRQ %d\n", pci_dev->irq);
 		goto fini_video;
@@ -324,7 +327,7 @@ static void tw5864_finidev(struct pci_dev *pci_dev)
 }
 
 static struct pci_driver tw5864_pci_driver = {
-	.name = "tw5864",
+	.name = DRIVER_NAME,
 	.id_table = tw5864_pci_tbl,
 	.probe = tw5864_initdev,
 	.remove = tw5864_finidev,
-- 
2.48.1


