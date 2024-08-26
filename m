Return-Path: <linux-media+bounces-16815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 031EC95F2E6
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7973E1F2557B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BFD186603;
	Mon, 26 Aug 2024 13:26:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDBD184525;
	Mon, 26 Aug 2024 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678784; cv=none; b=ZDfHo9Ey2mxILsP+ns9cI6ns36ljtRK6dgP8KQzqqdibSrd+26/q5uy+Yegxz8z0Lxolm8GEWQtjv4MAKAstGruOfrMmQoThYOYatU9V7ghH7EcPaJYdu680hbvNfk/ZqQUnqg5zJRMqibX0AhXoMrbRqp21+PnXfhElQ4ZMmnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678784; c=relaxed/simple;
	bh=wbeoBoQsdq28eBmWQ0zZx3b/6EObq1fEm6EEGxfZrnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ovQ8kvXqbxnHVC8bv9dCtT1Ubaru5JMkn/Ew9pFZaWocRIkKipir1/G7op5mOxLSMw67IBBcpBl9vhUm6ZCeXg503Tuf10tGCGP3tY3c+mlDnXrKolx0FzuOONjmtAjBEnT5CUxC3bOPT/zUhRK4XbzfpngdCyyi5tSodPv/R5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id D9DF22B581;
	Mon, 26 Aug 2024 15:26:13 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	11162571@vivo.com,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 1/1] media: mgb4: Fix debugfs error handling
Date: Mon, 26 Aug 2024 15:26:04 +0200
Message-ID: <20240826132604.3240-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826132604.3240-1-tumic@gpxsee.org>
References: <20240826132604.3240-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Fix broken handling of debugfs_create_dir() errors including errors creating
the parent mgb4(PCIe) device's debugfs directory.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_core.c |  8 ++------
 drivers/media/pci/mgb4/mgb4_core.h |  2 --
 drivers/media/pci/mgb4/mgb4_vin.c  | 25 ++++++++++---------------
 drivers/media/pci/mgb4/mgb4_vin.h  |  1 -
 drivers/media/pci/mgb4/mgb4_vout.c | 25 ++++++++++---------------
 drivers/media/pci/mgb4/mgb4_vout.h |  1 -
 6 files changed, 22 insertions(+), 40 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index 2819bbdab484..bc63dc81bcae 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -582,9 +582,7 @@ static int mgb4_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 							    NULL);
 #endif
 
-#ifdef CONFIG_DEBUG_FS
 	mgbdev->debugfs = debugfs_create_dir(dev_name(&pdev->dev), NULL);
-#endif
 
 	/* Get card serial number. On systems without MTD flash support we may
 	 * get an error thus ignore the return value. An invalid serial number
@@ -646,6 +644,8 @@ static void mgb4_remove(struct pci_dev *pdev)
 	hwmon_device_unregister(mgbdev->hwmon_dev);
 #endif
 
+	debugfs_remove_recursive(mgbdev->debugfs);
+
 	if (mgbdev->indio_dev)
 		mgb4_trigger_free(mgbdev->indio_dev);
 
@@ -656,10 +656,6 @@ static void mgb4_remove(struct pci_dev *pdev)
 		if (mgbdev->vin[i])
 			mgb4_vin_free(mgbdev->vin[i]);
 
-#ifdef CONFIG_DEBUG_FS
-	debugfs_remove_recursive(mgbdev->debugfs);
-#endif
-
 	device_remove_groups(&mgbdev->pdev->dev, mgb4_pci_groups);
 	free_spi(mgbdev);
 	free_i2c(mgbdev);
diff --git a/drivers/media/pci/mgb4/mgb4_core.h b/drivers/media/pci/mgb4/mgb4_core.h
index b52cd67270b5..9aec62514c0b 100644
--- a/drivers/media/pci/mgb4/mgb4_core.h
+++ b/drivers/media/pci/mgb4/mgb4_core.h
@@ -68,9 +68,7 @@ struct mgb4_dev {
 	u8 module_version;
 	u32 serial_number;
 
-#ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
-#endif
 };
 
 #endif
diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index e9332abb3172..185fb28226b6 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -853,14 +853,16 @@ static void fpga_init(struct mgb4_vin_dev *vindev)
 	mgb4_write_reg(video, regs->config, 1U << 9);
 }
 
-#ifdef CONFIG_DEBUG_FS
-static void debugfs_init(struct mgb4_vin_dev *vindev)
+static void create_debugfs(struct mgb4_vin_dev *vindev)
 {
+#ifdef CONFIG_DEBUG_FS
 	struct mgb4_regs *video = &vindev->mgbdev->video;
+	struct dentry *entry;
 
-	vindev->debugfs = debugfs_create_dir(vindev->vdev.name,
-					     vindev->mgbdev->debugfs);
-	if (!vindev->debugfs)
+	if (IS_ERR_OR_NULL(vindev->mgbdev->debugfs))
+		return;
+	entry = debugfs_create_dir(vindev->vdev.name, vindev->mgbdev->debugfs);
+	if (IS_ERR(entry))
 		return;
 
 	vindev->regs[0].name = "CONFIG";
@@ -892,10 +894,9 @@ static void debugfs_init(struct mgb4_vin_dev *vindev)
 	vindev->regset.base = video->membase;
 	vindev->regset.regs = vindev->regs;
 
-	debugfs_create_regset32("registers", 0444, vindev->debugfs,
-				&vindev->regset);
-}
+	debugfs_create_regset32("registers", 0444, entry, &vindev->regset);
 #endif
+}
 
 struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id)
 {
@@ -1001,9 +1002,7 @@ struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id)
 		goto err_video_dev;
 	}
 
-#ifdef CONFIG_DEBUG_FS
-	debugfs_init(vindev);
-#endif
+	create_debugfs(vindev);
 
 	return vindev;
 
@@ -1034,10 +1033,6 @@ void mgb4_vin_free(struct mgb4_vin_dev *vindev)
 	free_irq(vin_irq, vindev);
 	free_irq(err_irq, vindev);
 
-#ifdef CONFIG_DEBUG_FS
-	debugfs_remove_recursive(vindev->debugfs);
-#endif
-
 	groups = MGB4_IS_GMSL(vindev->mgbdev)
 	  ? mgb4_gmsl_in_groups : mgb4_fpdl3_in_groups;
 	device_remove_groups(&vindev->vdev.dev, groups);
diff --git a/drivers/media/pci/mgb4/mgb4_vin.h b/drivers/media/pci/mgb4/mgb4_vin.h
index 9693bd0ce180..8fd10c0a5554 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.h
+++ b/drivers/media/pci/mgb4/mgb4_vin.h
@@ -58,7 +58,6 @@ struct mgb4_vin_dev {
 	const struct mgb4_vin_config *config;
 
 #ifdef CONFIG_DEBUG_FS
-	struct dentry *debugfs;
 	struct debugfs_regset32 regset;
 	struct debugfs_reg32 regs[sizeof(struct mgb4_vin_regs) / 4];
 #endif
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 998edcbd9723..133110aac688 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -676,14 +676,16 @@ static void fpga_init(struct mgb4_vout_dev *voutdev)
 		       (voutdev->config->id + MGB4_VIN_DEVICES) << 2 | 1 << 4);
 }
 
-#ifdef CONFIG_DEBUG_FS
-static void debugfs_init(struct mgb4_vout_dev *voutdev)
+static void create_debugfs(struct mgb4_vout_dev *voutdev)
 {
+#ifdef CONFIG_DEBUG_FS
 	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	struct dentry *entry;
 
-	voutdev->debugfs = debugfs_create_dir(voutdev->vdev.name,
-					      voutdev->mgbdev->debugfs);
-	if (!voutdev->debugfs)
+	if (IS_ERR_OR_NULL(voutdev->mgbdev->debugfs))
+		return;
+	entry = debugfs_create_dir(voutdev->vdev.name, voutdev->mgbdev->debugfs);
+	if (IS_ERR(entry))
 		return;
 
 	voutdev->regs[0].name = "CONFIG";
@@ -711,10 +713,9 @@ static void debugfs_init(struct mgb4_vout_dev *voutdev)
 	voutdev->regset.base = video->membase;
 	voutdev->regset.regs = voutdev->regs;
 
-	debugfs_create_regset32("registers", 0444, voutdev->debugfs,
-				&voutdev->regset);
-}
+	debugfs_create_regset32("registers", 0444, entry, &voutdev->regset);
 #endif
+}
 
 struct mgb4_vout_dev *mgb4_vout_create(struct mgb4_dev *mgbdev, int id)
 {
@@ -808,9 +809,7 @@ struct mgb4_vout_dev *mgb4_vout_create(struct mgb4_dev *mgbdev, int id)
 		goto err_video_dev;
 	}
 
-#ifdef CONFIG_DEBUG_FS
-	debugfs_init(voutdev);
-#endif
+	create_debugfs(voutdev);
 
 	return voutdev;
 
@@ -833,10 +832,6 @@ void mgb4_vout_free(struct mgb4_vout_dev *voutdev)
 
 	free_irq(irq, voutdev);
 
-#ifdef CONFIG_DEBUG_FS
-	debugfs_remove_recursive(voutdev->debugfs);
-#endif
-
 	groups = MGB4_IS_GMSL(voutdev->mgbdev)
 	  ? mgb4_gmsl_out_groups : mgb4_fpdl3_out_groups;
 	device_remove_groups(&voutdev->vdev.dev, groups);
diff --git a/drivers/media/pci/mgb4/mgb4_vout.h b/drivers/media/pci/mgb4/mgb4_vout.h
index adc8fe1e7ae6..a07eeabdcf34 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.h
+++ b/drivers/media/pci/mgb4/mgb4_vout.h
@@ -54,7 +54,6 @@ struct mgb4_vout_dev {
 	const struct mgb4_vout_config *config;
 
 #ifdef CONFIG_DEBUG_FS
-	struct dentry *debugfs;
 	struct debugfs_regset32 regset;
 	struct debugfs_reg32 regs[sizeof(struct mgb4_vout_regs) / 4];
 #endif
-- 
2.46.0


