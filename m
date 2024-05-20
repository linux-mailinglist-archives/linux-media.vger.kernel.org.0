Return-Path: <linux-media+bounces-11648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A968C9B5A
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 12:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A388AB21E6F
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 10:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E8E51C36;
	Mon, 20 May 2024 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="GoDgnQyV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94805337E;
	Mon, 20 May 2024 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716201173; cv=none; b=T1rF6bNP6xefUsshQzsz3PQuIW31ESA5Ys6kHN6tWVieiO1lbShGwB6tqM5wVCpID+lDcKlwWJcMfxlAI512ETiKI0WWcZgo2n8lh895oZziKSbAV8QayEAFP3KNW8GK9Hxz/cQkOunq9KAhM46McSP9GOKWJqA69CSXrduojVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716201173; c=relaxed/simple;
	bh=yppvaVyHc8AMdaEFI5sTpzu6tQKpvsN6JlKqYM7j/Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uE1+sZwVIFG8LWTAUorifywtknX0iPcv7I3pifEprR1/XR8uuMULKELskAgHmckqOMXq2+cPx02w3K2yI/pcKuUBL0rtwU0cXkZAofxZyTG8LUies86RNFbIbtmV8gixTFxaeP96XPOelo1bskwC/xn+uc4eFq88S7IID85sJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=GoDgnQyV; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 90JssdheHXiTd90JtsborX; Mon, 20 May 2024 12:32:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1716201163;
	bh=jH83Xw81RQUDduCSpRwSEidVirNBcipY2p4iiDsaCOg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GoDgnQyVwyw5HcubtP7hwSD8xBT3OkQ7aE6lRjee+3948nWnm9x9Haa80z7EHexGv
	 gjHKeZRc0uZNLEEjTr6C203h7Xhea2aqWkBvpCCp7KOpl2dmlEXIl8/HRxTiu8Bncj
	 RMZtGGB5+VUUZFNTM1rLblBIm3i+1DNV8v3A/EFXmqv13ZZXTQIlzk+rdpvDshATcK
	 9/vM3iUGdH3E1CCB71Jhey4B0LTpjRYjLx8Qy6sNxkfSt916D+LXzBxz2Urs1UkhEM
	 3xJohXc79a3eRroiVnI5CTw3MD3QG4Q5qkJb4DO4A473N1vULaxKrKesXXOReGGR0b
	 BMj3iMTATt0sg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 20 May 2024 12:32:43 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: intel/ipu6: Fix an error handling path in isys_probe()
Date: Mon, 20 May 2024 12:32:30 +0200
Message-ID: <545315bcaac0a897c25cfa20a603be2af2a40aa9.1716201136.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful alloc_fw_msg_bufs() call, some
resources should be released as already done in the remove function.

Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 5992138c7290..d9e1e1a135b9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1062,6 +1062,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata;
 	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
 	struct ipu6_device *isp = adev->isp;
+	struct isys_fw_msgs *fwmsg, *safe;
 	const struct firmware *fw;
 	struct ipu6_isys *isys;
 	unsigned int i;
@@ -1140,12 +1141,17 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	ret = isys_register_devices(isys);
 	if (ret)
-		goto out_remove_pkg_dir_shared_buffer;
+		goto free_fw_msg_bufs;
 
 	ipu6_mmu_hw_cleanup(adev->mmu);
 
 	return 0;
 
+free_fw_msg_bufs:
+	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
+		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
+			       fwmsg, fwmsg->dma_addr, 0);
+
 out_remove_pkg_dir_shared_buffer:
 	if (!isp->secure_mode)
 		ipu6_cpd_free_pkg_dir(adev);
-- 
2.45.1


