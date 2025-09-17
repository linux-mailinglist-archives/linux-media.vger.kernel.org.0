Return-Path: <linux-media+bounces-42653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 708B7B7CC34
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E629E1C04712
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 09:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2FA343D97;
	Wed, 17 Sep 2025 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Jm77f02G"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC872F9DB7;
	Wed, 17 Sep 2025 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758102092; cv=none; b=Av/KvfyPlyGQ3mWWcyVFB6/TY1kVr+0qw4C+CNxThkGwQ4HG353vG46xJhbmX/3qcLEN3U3RwY74N1N/dPG2t2AaKJuCWfj9BovFuVlwutMbGTyT5ylFL8M2I4/HwTxKcquTa2CKQds/lhckpDnDiMum7oAv/Kk0pushuPDNhrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758102092; c=relaxed/simple;
	bh=EzgT5uVZvbQGIN9UGL1/RHHGWl3JjFuxCL15z3aAxFo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KuI5JhZaDGsKKMUM+XV2O1JQI4RqN7R6R+Hm2Pe9JrWLSSprAt2qK0I0PoRbUsEAo0MC9ca4YOhhkYnLWqFdo5ao6wRkUdlARUzt4UIxO7/HgtDzvco6wLEAGCH2Zl0gsbKofix6EQm+WZ+fTeu+jk47SYaqvJ7HKo0O2pkV/OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Jm77f02G; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wc
	uuwU3W+I4CmXssHuzyWQWl3YczewIOBpW6e7iYBqg=; b=Jm77f02GAIvB2LtqOW
	eyHPd41Ec0t0483DCiJ2XtHBi8NLz8MYEjwovKtAtYfkNasuB8Fol++3ydbgwike
	Fr2gx4wPkUF6wTVo4OhpHISm3GKCHMYrEVtrFIUwEcCNc2p5SpRYBrWQxxZUZPg7
	51GcGObyoNoq73IdemJMjVaqA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDXe9UfgsporHBlDA--.28795S4;
	Wed, 17 Sep 2025 17:40:48 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: minghsiu.tsai@mediatek.com,
	houlong.wei@mediatek.com,
	andrew-ct.chen@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: mtk-mdp: Fix some issues in mtk_mdp_core.c
Date: Wed, 17 Sep 2025 17:40:45 +0800
Message-Id: <20250917094045.28789-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDXe9UfgsporHBlDA--.28795S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFWUGw48ZFyrtw1DWryxGrg_yoW5Xr18pr
	yUKayFkrWj9FW29w47Ja18Z3W5Cr1S9w48uw1xJw4xC345Wr95J34rJa4xt3y8tr97Ca43
	Jw4aqFWrCFWYvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piCD73UUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBEhrLbmjKfcCUUQAAs3

Add check for the return value of vpu_get_plat_device() to prevent null
pointer dereference. And vpu_get_plat_device() increases the reference
count of the returned platform device. Add platform_device_put() to
prevent reference leak. Also add platform_device_put() in mtk_mdp_remove().

Add mtk_mdp_unregister_m2m_device() on the error handling path.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v2:
- Add check for vpu_get_plat_device()
- Add platform_device_put() in mtk_mdp_remove()
- Add mtk_mdp_unregister_m2m_device() on the error handling path.
- Modify the patch title and description. I think you are right.
  Thanks, CJ!
---
 .../media/platform/mediatek/mdp/mtk_mdp_core.c  | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0..8432833814f3 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -194,11 +194,17 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	}
 
 	mdp->vpu_dev = vpu_get_plat_device(pdev);
+	if (!mdp->vpu_dev) {
+		dev_err(&pdev->dev, "Failed to get vpu device\n");
+		ret = -ENODEV;
+		goto err_vpu_get_dev;
+	}
+
 	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
 				  VPU_RST_MDP);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register reset handler\n");
-		goto err_m2m_register;
+		goto err_reg_handler;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -206,7 +212,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
-		goto err_m2m_register;
+		goto err_reg_handler;
 	}
 
 	pm_runtime_enable(dev);
@@ -214,6 +220,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_reg_handler:
+	platform_device_put(mdp->vpu_dev);
+
+err_vpu_get_dev:
+	mtk_mdp_unregister_m2m_device(mdp);
+
 err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
@@ -242,6 +254,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+	platform_device_put(mdp->vpu_dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.25.1


