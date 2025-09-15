Return-Path: <linux-media+bounces-42556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C97B57C6A
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 15:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBEEB1639F1
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B04630CD95;
	Mon, 15 Sep 2025 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QQbqExzp"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479DB212548;
	Mon, 15 Sep 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757941761; cv=none; b=d0jAU8412V3DV3AWdAw6OoLT6Y+U8AWechYuepJB9NdBksfye1yPWC+atBTY/Y1S4MgjD/rvmK2lVVIpQbu0zSDiaqUFnWxitkc8amsQ+ivDzB7y7u1vMK4dec19vMvXGDyBEDZMx1+tEENvT/ci+c9yrN8LhwE5V5QqyERTDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757941761; c=relaxed/simple;
	bh=Lq5efmfHRLuv3ZzWqKfawWb/2DoKQhScquay3vNt2Y0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cDwIt9QM0SWAPJ7TRK2n2WW3qGPEU99vfFbZJTxCDxRgS32ztIG6yRpR1bJ9SUnNIPfzFPAgoAwOqAKDEdGcbxoU3uzhf6duqkquBM2Xa6jFDYns/KC3hW9cqECKZcRhyFHArG8ddWLF9iTEVpL3ROv7dYzSRpp085q5P+bSZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QQbqExzp; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fm
	f0OIsGMiE8P3J1F3N/Fn2ucYiqGWZO/N1K1kd83tw=; b=QQbqExzp1A7pb9QAsX
	IpzD3pqilcPrF125S81aF2DegBmtDgZM+rCIkBlYjExAMpOt3Ky2GkedRs2Kq8s8
	k76g0Ltwfdo9EiT4qlMaaFg+E4z+KTUzWJ/6gjr9Rc9pq0HBdL3Pjt1SeKuYEtIa
	IK02Cowx4OULX2ALe26hu2nKw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCHOtEhDMhoJPeJCw--.8722S4;
	Mon, 15 Sep 2025 20:52:51 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: minghsiu.tsai@mediatek.com,
	houlong.wei@mediatek.com,
	andrew-ct.chen@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hverkuil@kernel.org,
	eballetbo@kernel.org,
	eizan@chromium.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mtk-mdp: Fix a reference leak in mtk_mdp_probe()
Date: Mon, 15 Sep 2025 20:52:48 +0800
Message-Id: <20250915125248.181608-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgCHOtEhDMhoJPeJCw--.8722S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww15tryfJry8Jr1UtrWfGrg_yoW8Wr1rpF
	WDWayFkrWUuF4jgr4UGa1UZa45Aw1S9w48Wa1xAw4xu345WrWDJr10qFyIqrW8JF97Ca43
	Jr1IqFWxuFWrZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_MKuUUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiMwLJbmjIBhvCbwAAsG

vpu_get_plat_device() increases the reference count of the returned
platform device. Add platform_device_put() to prevent reference leak.

Fixes: ee18fc7b0b95 ("media: mtk-mdp: handle vpu_wdt_reg_handler() errors during probe")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0..6aedb6033010 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -198,7 +198,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 				  VPU_RST_MDP);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register reset handler\n");
-		goto err_m2m_register;
+		goto err_vpu_get_dev;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -206,7 +206,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
-		goto err_m2m_register;
+		goto err_vpu_get_dev;
 	}
 
 	pm_runtime_enable(dev);
@@ -214,6 +214,9 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_vpu_get_dev:
+	platform_device_put(mdp->vpu_dev);
+
 err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.25.1


