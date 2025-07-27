Return-Path: <linux-media+bounces-38510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 203FDB12F1F
	for <lists+linux-media@lfdr.de>; Sun, 27 Jul 2025 12:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E97189C23E
	for <lists+linux-media@lfdr.de>; Sun, 27 Jul 2025 10:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98B6213E94;
	Sun, 27 Jul 2025 10:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="lg1guOok"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8291F7575;
	Sun, 27 Jul 2025 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753610631; cv=none; b=H3oafoxgUxeTuQOj316u5il1APW5CVXaE+GYyB22kXMhLGu7aCWdnxAueEameEgx1wlnPn6k4sE3ntMgUlq/Htj0Sgzh5agIJH29zyDbadFNNONiZDo43bEPRadYgImq2uZFjzTG8JHIPkVXPE5Wf8K4D8bLGAMM5fAaA85H0Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753610631; c=relaxed/simple;
	bh=nIyiASwoNikBaVQJ7F4QDZY0tQenudpt7x9V2nTwvh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sErPqlzoNZPImrtEz6F5okgzPPQTGu3ThuoR9Jmz5lckAxvMR9uZwLNx8L9cTDayKNpPeaQHvLTGvGj8PTrb9U5c1MZCpXCouJm9sD3GKiUsqc+Y3tnriaqfujU4ED48tX3eGwG6G4Ac+gfhtSopkuzhBfivRyvBYsvNeDO0b64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=lg1guOok; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id fyD9uBnh5hOKjfyD9uuogC; Sun, 27 Jul 2025 12:02:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753610552;
	bh=ycw+FwEwMNFwepsTT4M/3aAYYVR3er1gB6c9vBitnyw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lg1guOokmw5lhfHrRRpWCP0dJeZtL6mXaidGHd/V/nZamffVp842m+eWMZoh95c3w
	 hs14scpjDjfaXy1sw5B1j61aojWkm0NpkQ1JpxWvYdZXBD+TklBedyxlXxHU8Y98Ll
	 uunPw5SyFo+uBKaLmgJZIlwPvZ2jwUC/MvENklEdw0kYleHw5PL7N3ZhJ2lsSMT+CG
	 EdYp5dJLOiBktvX1WextfW02JqoRp7vc4KHHJOS0H1jALq3gh5gmF+OZ7zzTIWfSIt
	 NY7Y6FRdpYU9y34t4VDOkfrQ253gM42AZvCLAGHO0mcpZy3BuwGEESx/OgHqgmOmLi
	 CbrpjNfY63IgA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 27 Jul 2025 12:02:32 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: rkvdec: Fix an error handling path in rkvdec_probe()
Date: Sun, 27 Jul 2025 12:02:21 +0200
Message-ID: <b69c20783a7b6f7964ab636679d3da80fc48372e.1753610517.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful iommu_paging_domain_alloc() call, it
should be undone by a corresponding iommu_domain_free() call, as already
done in the remove function.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d707088ec0dc..eb0d41f85d89 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1169,15 +1169,17 @@ static int rkvdec_probe(struct platform_device *pdev)
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return -ENXIO;
+	if (irq <= 0) {
+		ret = -ENXIO;
+		goto err_free_domain;
+	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					rkvdec_irq_handler, IRQF_ONESHOT,
 					dev_name(&pdev->dev), rkvdec);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
-		return ret;
+		goto err_free_domain;
 	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
@@ -1193,6 +1195,9 @@ static int rkvdec_probe(struct platform_device *pdev)
 err_disable_runtime_pm:
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+err_free_domain:
+	if (rkvdec->empty_domain)
+		iommu_domain_free(rkvdec->empty_domain);
 	return ret;
 }
 
-- 
2.50.1


