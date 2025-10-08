Return-Path: <linux-media+bounces-43939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F57BC4032
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 10:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A02E4F7306
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 08:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0B92F5301;
	Wed,  8 Oct 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VqzCtDDG"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07272F3632;
	Wed,  8 Oct 2025 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759913776; cv=none; b=nYYCPtHJepk7hxe1uOebv9uwV0W8H0ZLjJtsvS3lsKIVmzvM5/wzyptEql94hvvgGVF7h7ojRdLdAhI1rN4QNq+D9MlUTQXgPLNGFN4paLn8bAyyYQAvSNTWcD9koYvZ6X7upXqay0Qlq/4t8uuEIyg6ntYMrqnkH5e3YJ4eW/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759913776; c=relaxed/simple;
	bh=H/ik4pU3HkalHVwzw773zJ63OWJtWJ8qrNm4n1O+v/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PIowZPuDCTPBK4WAAwGfB8QgCXEzgYEcNcnJBeE61dFujmTxuOySSnKHp2hxiDbQMbkuq+SsMoXFmiViDZW5iwnwC/vH29n9quXZ4kFdOHSLMgOd0b+/nVrSHp3T53Ep5/TfgXW4hV5s9HMIJnzuiE2iH/OI4Cs4pBDja1mi4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VqzCtDDG; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=si
	54P4hhGgXr8g3ksCyz7KRzFUMFtbJhWpk8XEnsyFU=; b=VqzCtDDGa1swIt+8DM
	IVv4UNWYMMzRkAASqV2FsH6sbCNweGBu2oCG5skunIEd70DlCwH4uibNVeNENFoQ
	bu4x1fA8DI9H67N8eBmMI7xpS8Sld4TCOmIgByUiF5LYpKw815EsMDfUzg5mmLXu
	cTpFN69Fc6oGcYu8Y4MqRyUxA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXL7fpJuZoLo0ZCw--.24071S4;
	Wed, 08 Oct 2025 16:55:06 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: minghsiu.tsai@mediatek.com,
	houlong.wei@mediatek.com,
	andrew-ct.chen@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hans.verkuil@cisco.com,
	christophe.jaillet@wanadoo.fr,
	nicolas@ndufresne.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] media: mtk-mdp: Fix error handling in probe function
Date: Wed,  8 Oct 2025 16:55:03 +0800
Message-Id: <20251008085503.12434-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXL7fpJuZoLo0ZCw--.24071S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4xZF13Kr15ArWDtFyrWFg_yoW5Jw48pF
	yDKayFkrWUCFW29r47Ja18A3Z8Cw1S9w48Ww4xJw4xC345WrWrJryrta48t3yxtr97Ca43
	Jw1avFWrCFWYvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_oGHUUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBEhXbbmjf66NFhwACsN

Add mtk_mdp_unregister_m2m_device() on the error handling path to prevent
resource leak.

Add check for the return value of vpu_get_plat_device() to prevent null
pointer dereference. And vpu_get_plat_device() increases the reference
count of the returned platform device. Add platform_device_put() to
prevent reference leak.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v3:
- Modify the patch subject and description.
- Patch v2 is a little bit verbose and trivial, so I changed the
  subject and moved the fixes of mtk_mdp_remove to a separate patch.
  Thanks, Nicolas!
Changes in v2:
- Add check for vpu_get_plat_device()
- Add platform_device_put() in mtk_mdp_remove()
- Add mtk_mdp_unregister_m2m_device() on the error handling path.
- Modify the patch title and description. I think you are right.
  Thanks, CJ!
---
 .../media/platform/mediatek/mdp/mtk_mdp_core.c   | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0..f78fa30f1864 100644
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
 
-- 
2.25.1


