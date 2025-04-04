Return-Path: <linux-media+bounces-29393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF54A7BE74
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 15:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9279174BE7
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 13:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC04C1F4604;
	Fri,  4 Apr 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ComEo/g/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D291F2BA9;
	Fri,  4 Apr 2025 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774845; cv=none; b=ZGgR9a/tvk8arwq3DrZRypzYNpiqpuYXmWXYmHeG7vHSYmof+fSShJuDMQFXHdBdOBgjJOLIWG7zwsMNxgvtNc/eMKIG4C3j56/bi+Cgg2ng03sP/2yTjy566x5GTBOxsTZXMNAU2aADE9W3Fc5wwmSLixDAyyZdwZfHZ0gu0YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774845; c=relaxed/simple;
	bh=8Noe45DVxrCipOpWiqDqps479fMfVGGdmsz1KXnYi1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeeCiHYaoBB5GkPdbqDD9c0bNmC9M+2TVXbAW+SKaVJnqX7KEVd8WhnCjMcDxVdJVH+CjV44R1VePWzBE5pUCvc32pke5fMK5W9LsC1zaSnfmUrCdZ8U1BSDZlUb4XLr8wDuvkaLs0nOHR11e5axdEU7sfbwWgJ3VrKFKv7OEKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ComEo/g/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4F1C4CEE9;
	Fri,  4 Apr 2025 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743774844;
	bh=8Noe45DVxrCipOpWiqDqps479fMfVGGdmsz1KXnYi1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ComEo/g/HlOYpEctlr7fUCiADzIpWG+fu9oTfbePwlEKLX/03GddMzNQ4qOAgyRrQ
	 Ywh6xDqdHPqVLTy21pRYEZKMqMQq78/MXuPnMu1CCr4AXQa6mPtnRtvHZIsyWqDtBt
	 TMzwu2KXFsRKHrNysofiTGwYcfqJxTNQ40Bc2zMupolpJz8japBxW8O8m9Zjlarn20
	 NdDOR7A0hTRbRqtMZZ1pD01nydG7ugSrneVVVmaXTwJSNq+nNoHx6Z3jjqcP72O8Nv
	 bEehQuOiHFgt9c0G1OZfwLchTxm/3eBglWy0xEkRdIRi7buFOKR6OnCQupuo2vhmGz
	 aMboOjBGKPJfA==
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
Subject: [PATCH 2/5] media: pt3: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 15:53:42 +0200
Message-ID: <20250404135344.93241-4-phasta@kernel.org>
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
Replace them with pcim_iomap_region().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/media/pci/pt3/pt3.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/pt3/pt3.c b/drivers/media/pci/pt3/pt3.c
index 246f73b8a9e7..c55aa782b72c 100644
--- a/drivers/media/pci/pt3/pt3.c
+++ b/drivers/media/pci/pt3/pt3.c
@@ -692,6 +692,7 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	u8 rev;
 	u32 ver;
 	int i, ret;
+	void __iomem *iomem;
 	struct pt3_board *pt3;
 	struct i2c_adapter *i2c;
 
@@ -703,10 +704,6 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENODEV;
 	pci_set_master(pdev);
 
-	ret = pcim_iomap_regions(pdev, BIT(0) | BIT(2), DRV_NAME);
-	if (ret < 0)
-		return ret;
-
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set DMA mask\n");
@@ -719,8 +716,16 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, pt3);
 	pt3->pdev = pdev;
 	mutex_init(&pt3->lock);
-	pt3->regs[0] = pcim_iomap_table(pdev)[0];
-	pt3->regs[1] = pcim_iomap_table(pdev)[2];
+
+	iomem = pcim_iomap_region(pdev, 0, DRV_NAME);
+	if (IS_ERR(iomem))
+		return PTR_ERR(iomem);
+	pt3->regs[0] = iomem;
+
+	iomem = pcim_iomap_region(pdev, 2, DRV_NAME);
+	if (IS_ERR(iomem))
+		return PTR_ERR(iomem);
+	pt3->regs[1] = iomem;
 
 	ver = ioread32(pt3->regs[0] + REG_VERSION);
 	if ((ver >> 16) != 0x0301) {
-- 
2.48.1


