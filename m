Return-Path: <linux-media+bounces-11885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4558CF2CA
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 10:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EC381F21246
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 08:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE858F54;
	Sun, 26 May 2024 08:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dD1rjx9l"
X-Original-To: linux-media@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FEEB640;
	Sun, 26 May 2024 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716710989; cv=none; b=g0oJvFsP+WV24rPORFJ9Z43l1ymmP0e+pq8wNjKPmCJI27R10mQ8dT2nBvH0h5YH/el12U0EMJ47BM1J1BIMG/QQ9HsLeqOr08otPS/dnQlQT89w+Rd+vD6YcRgGupGL+FSlJBpSGWCqoncssoNeee6SxhMo7DpuGG17d9KRwkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716710989; c=relaxed/simple;
	bh=9mL+pOz+vQ8U+AQZywT6y8vUmRELxvG7EkDXJCpb10o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfFgSbWQ+0haeD3PmV6hDEzh90pBNClJ6iZEoKydWL1qIe7y1ORiLvc9uZ//vDSzmbKPAfLF/NhMJv+vaSex4QmYsJ5rf7XkyILKmbstwaMMWdd2hMH6mcBmPOASAMp/2JXhR5mvS3oHSNXR+g6Ed/Ddk5CDimcClMSR9N7A35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dD1rjx9l; arc=none smtp.client-ip=80.12.242.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id B8nVshp7epUD1B8nhsPLd9; Sun, 26 May 2024 10:00:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1716710440;
	bh=IgEDtJfaNI1iWwOQr1DJGweCIYES2brPtEIEBcUvbBo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dD1rjx9ljJHof3mvVsNUW2GUHVNARNQhhWGp1hXRBDkHehpCp1jhIZu0E4bjSmKRB
	 no1GajJcY9WORHZrhH3FxT00XWc/BiSnN+2qqPJDG6ZHNAgzO2dwgGcQX/SjyRzZ0O
	 bvDDh/33CFFYaoCuHgD/NxUGB+yKq+8LnrDaHCwEDX/AkFIyypYzBc0qLUFNFPR//M
	 cyJuYerH9/S76t6nCeTDTKNDalA8GLpvPZWQuhDl2mcLIQhYlm7BSJs07Pg3I06q4g
	 khoWa2KHH/oQDupulLNCIg/uOdbop9ERh8koekQy6MOi3AFw8dHgFs7GWal5JQUW26
	 Fdb+A4EkRYUOw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 May 2024 10:00:40 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	hdegoede@redhat.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/2] media: intel/ipu6: Fix an error handling path in isys_probe()
Date: Sun, 26 May 2024 09:59:57 +0200
Message-ID: <69c6a062959077414af05c44116e2351b0600977.1716710255.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <15a056198775689cb533a7b0ea7e100559a2465d.1716710255.git.christophe.jaillet@wanadoo.fr>
References: <15a056198775689cb533a7b0ea7e100559a2465d.1716710255.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful alloc_fw_msg_bufs() call, some
resources should be released as already done in the remove function.

Add a new free_fw_msg_bufs() function that releases what has been allocated
by alloc_fw_msg_bufs().

Also use this new function in isys_remove() to avoid some code duplication.

Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

I'm slightly puzzled by the use of the _safe version of
list_for_each_entry(). Is it really needed here.

Also, should isys->listlock be used?
The code looks racy to me.

Changes in v2:
  - Introduce and use free_fw_msg_bufs()   [Sakari Ailus]

v1: https://lore.kernel.org/all/545315bcaac0a897c25cfa20a603be2af2a40aa9.1716201136.git.christophe.jaillet@wanadoo.fr/
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 27 ++++++++++++++++--------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 7ce2047a09b5..1998b72ac07d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -925,6 +925,20 @@ static const struct dev_pm_ops isys_pm_ops = {
 	.resume = isys_resume,
 };
 
+static void free_fw_msg_bufs(struct ipu6_isys *isys)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct isys_fw_msgs *fwmsg, *safe;
+
+	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
+		dma_free_attrs(dev, sizeof(struct isys_fw_msgs), fwmsg,
+			       fwmsg->dma_addr, 0);
+
+	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
+		dma_free_attrs(dev, sizeof(struct isys_fw_msgs), fwmsg,
+			       fwmsg->dma_addr, 0);
+}
+
 static int alloc_fw_msg_bufs(struct ipu6_isys *isys, int amount)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -1105,12 +1119,14 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	ret = isys_register_devices(isys);
 	if (ret)
-		goto out_remove_pkg_dir_shared_buffer;
+		goto free_fw_msg_bufs;
 
 	ipu6_mmu_hw_cleanup(adev->mmu);
 
 	return 0;
 
+free_fw_msg_bufs:
+	free_fw_msg_bufs(isys);
 out_remove_pkg_dir_shared_buffer:
 	if (!isp->secure_mode)
 		ipu6_cpd_free_pkg_dir(adev);
@@ -1137,16 +1153,9 @@ static void isys_remove(struct auxiliary_device *auxdev)
 	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
 	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
 	struct ipu6_device *isp = adev->isp;
-	struct isys_fw_msgs *fwmsg, *safe;
 	unsigned int i;
 
-	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
-		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
-			       fwmsg, fwmsg->dma_addr, 0);
-
-	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
-		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
-			       fwmsg, fwmsg->dma_addr, 0);
+	free_fw_msg_bufs(isys);
 
 	isys_unregister_devices(isys);
 	isys_notifier_cleanup(isys);
-- 
2.45.1


