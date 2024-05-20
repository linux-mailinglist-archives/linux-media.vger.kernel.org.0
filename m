Return-Path: <linux-media+bounces-11641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19A28C9ACC
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 11:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2174A1C2074B
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 09:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6500487AE;
	Mon, 20 May 2024 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="p5pk6DQb"
X-Original-To: linux-media@vger.kernel.org
Received: from msa.smtpout.orange.fr (out-71.smtpout.orange.fr [193.252.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C8481AA;
	Mon, 20 May 2024 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198973; cv=none; b=swlmgUDTckhAEiQMuduBurrTOzi/HULsp6SeCdF9kEVS4ZyqgL/S/+SaD0TWO94ETQBQLp717x95efQZC2rJEzhf64SmLdXxSG9JtSxcSMf91zbE5GGTyG2XIXfmocYryGiFXoziZDSMz/vxiDSX3EZLGtFSIy5fyY+VDAaZng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198973; c=relaxed/simple;
	bh=8pN9+dZPsIe+Zp9h68CLnh+ugMClUzOnDxV9mWnTvS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QW649owKu7xNVInGuDif8TN3CkPG/5w4v+5xiyylF2Nrq8zlavKL6IzkxDktmg+DbWjYznKp0pVR0WKdX8Q2DMzzDp8/yPa2/CnP3ZlDQR9VEDxQa0Ro6Kk1C3o6J9gnvn8C+HXsy55ZU1K7bgomEXiwVVyXWd3/8MGzDgIiJcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=p5pk6DQb; arc=none smtp.client-ip=193.252.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 8zkSsPtMlFWfB8zkTs2sLr; Mon, 20 May 2024 11:56:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1716198966;
	bh=grLk96lCrEC21k00xQkJtYdNWTj170Ht3ul8K1nz6dA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=p5pk6DQbYbKbK3DM+7H1QiHCOS28wb2JGj6lff//z844isqef6EJcGjnQ0t9OKShd
	 8msdT59fxLoKPBRA8xeU3iSKYqVeMLKPgIbPZXdFu7C4ftw6ug6ki68z0T6CJROUh+
	 DJf3mBEm2wqDhyEGHp01XyCUtbw9ku0UwsjFnNYNlQdw2wNsRMhiu9ywgumgV70QzU
	 SW3MHVLXqv938UswKDuZshl/HAK0mBdqXlQfGT08d9bryPe5PaVI+coluoi39Z4LE6
	 kaKj8KhIufPeR/wsr6jV+XSC5rs1d522olCsf9Xzwoiurynf0meQjNdMf3q3kXL3dj
	 Xbs5IkTGAMNDg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 20 May 2024 11:56:06 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: intel/ipu6: Fix some redundant resources freeing in ipu6_pci_remove()
Date: Mon, 20 May 2024 11:55:54 +0200
Message-ID: <33dbf7b5c1b1b94d64a13441b69e1ff976caaa62.1716198935.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_regions() and pcim_enable_device() are used in the probe. So
the corresponding managed resources don't need to be freed explicitly in
the remove function.

Remove the incorrect pci_release_regions() and pci_disable_device() calls.

Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/media/pci/intel/ipu6/ipu6.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index d2bebd208461..f587f609259d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -727,9 +727,6 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 	pm_runtime_forbid(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 
-	pci_release_regions(pdev);
-	pci_disable_device(pdev);
-
 	release_firmware(isp->cpd_fw);
 
 	ipu6_mmu_cleanup(psys_mmu);
-- 
2.45.1


