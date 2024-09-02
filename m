Return-Path: <linux-media+bounces-17356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7DE968879
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06B51B2335E
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 13:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683621D61B7;
	Mon,  2 Sep 2024 13:07:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3AF1DAC47
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725282451; cv=none; b=XMtY3WcaIqtDhndHPNXARN2GQFsfAHN1Pv0PnixL2rlwS022QlqoCB+MmrPayVS8KnsDD7d0FQvR87iZH7B599giyrNnZeQjLsdZGTxxOaBR99oiIwS9cTGfU1kADjXVIUALHNtLvHt8u8z6a40FV42mDJrFOgjKI2f4W5p5Hd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725282451; c=relaxed/simple;
	bh=E9h47cMNOxWfFO6UXtJRyi4VqPhkdcZD7OFRa/PFIk0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BmLhTCpdCBCKlXhj5MfUDDXwDpkKEPXrAEM3Hiy68ErGkg1aYXUxojiRtZwkHKDnjWlVJjvXbPnaL+BFZmCZG1wPIPdzdOpuz/uGI88GjMdax3zKbVgzHJLV3ysDNojHZCC0EgCNgFAK8EUoCq7El41pP1teB97ys3Z5vNscbKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wy8DD6KwYz2DbhF;
	Mon,  2 Sep 2024 21:07:08 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id C46561400D4;
	Mon,  2 Sep 2024 21:07:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 2 Sep
 2024 21:07:26 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <sakari.ailus@linux.intel.com>, <bingbu.cao@intel.com>,
	<tian.shu.qiu@intel.com>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <lihongbo22@huawe.com>
Subject: [PATCH -next] media: intel/ipu6: make use of dev_err_cast_probe()
Date: Mon, 2 Sep 2024 21:15:53 +0800
Message-ID: <20240902131553.3088122-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)

Using dev_err_cast_probe() to simplify the code.
No functional changes.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index bbd646378ab3..d10cbdd088ab 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -390,20 +390,18 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 	isys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
 					       IPU6_ISYS_NAME);
 	if (IS_ERR(isys_adev)) {
-		dev_err_probe(dev, PTR_ERR(isys_adev),
-			      "ipu6_bus_initialize_device isys failed\n");
 		kfree(pdata);
-		return ERR_CAST(isys_adev);
+		return dev_err_cast_probe(dev, isys_adev,
+				"ipu6_bus_initialize_device isys failed\n");
 	}
 
 	isys_adev->mmu = ipu6_mmu_init(dev, base, ISYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(isys_adev->mmu)) {
-		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
-			      "ipu6_mmu_init(isys_adev->mmu) failed\n");
 		put_device(&isys_adev->auxdev.dev);
 		kfree(pdata);
-		return ERR_CAST(isys_adev->mmu);
+		return dev_err_cast_probe(dev, isys_adev->mmu,
+				"ipu6_mmu_init(isys_adev->mmu) failed\n");
 	}
 
 	isys_adev->mmu->dev = &isys_adev->auxdev.dev;
@@ -436,20 +434,18 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 	psys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
 					       IPU6_PSYS_NAME);
 	if (IS_ERR(psys_adev)) {
-		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev),
-			      "ipu6_bus_initialize_device psys failed\n");
 		kfree(pdata);
-		return ERR_CAST(psys_adev);
+		return dev_err_cast_probe(&pdev->dev, psys_adev,
+				"ipu6_bus_initialize_device psys failed\n");
 	}
 
 	psys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, PSYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(psys_adev->mmu)) {
-		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
-			      "ipu6_mmu_init(psys_adev->mmu) failed\n");
 		put_device(&psys_adev->auxdev.dev);
 		kfree(pdata);
-		return ERR_CAST(psys_adev->mmu);
+		return dev_err_cast_probe(&pdev->dev, psys_adev->mmu,
+				"ipu6_mmu_init(psys_adev->mmu) failed\n");
 	}
 
 	psys_adev->mmu->dev = &psys_adev->auxdev.dev;
-- 
2.34.1


