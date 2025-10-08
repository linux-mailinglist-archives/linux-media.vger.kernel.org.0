Return-Path: <linux-media+bounces-43940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C9934BC4103
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 11:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 37F5A4F8291
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 09:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E704213236;
	Wed,  8 Oct 2025 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="C8+wn5Y0"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A612F1FF1;
	Wed,  8 Oct 2025 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759914182; cv=none; b=Owu6JcJZisc2me9oEPnuX+eDGwOFuR7CHKZPRMIWpOiWyVHq421y38LmdN65CD8fYhTo3tTJ+MFjen63ZK17wGC0cIiT55THovzI0J67XbG19cmk50yMpI0AvIYP1pz/VQPIYS/pExDP30oUsgLbVWJt/0BssAm+QhExD6FfzAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759914182; c=relaxed/simple;
	bh=+nkPQZUQSb0PgsQ5xOnJztmLwWFjLlTCcnmJL/iTJnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AdJlxFVBgVI61MfUa2PRclL1Dh1+R6pAcYiw9jQ+VpeXEW4ViO6AOBs/B+6T+WkjzTV/DqkHCVLG2c+hbWzuNtNvbXSChvh8JnX3rGiSQkhtEilMv+ANbS2fuV0vpjA2+YQa4C4WiEZnyU/VpfPt/W8LnjaL8BjE5PS7pAeABoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=C8+wn5Y0; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=xA
	UvOUV3gFHnesCfh2XcNr/cWherRMTVqtwTY/kK+k0=; b=C8+wn5Y0YY+GdfcPMh
	YfUzG8+cedQbz8nRkNLrv7avUJChkPFhhX59OJzm2dKyWjpOXTue4PLLKxyAOCRB
	J79JYBuIMTuwOya/+qeXZLSwXmcent9n7vnBQT9lAFCJV/eBh8Vmi5X2r0wsi95b
	uISMKKHtBrhcoblUHoynfcMo4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDXz2+GKOZozDEcCw--.44898S4;
	Wed, 08 Oct 2025 17:01:59 +0800 (CST)
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
Subject: [PATCH] media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()
Date: Wed,  8 Oct 2025 17:01:56 +0800
Message-Id: <20251008090156.14224-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXz2+GKOZozDEcCw--.44898S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF4kXF1fuF4rtFy5Gw4fuFg_yoWDurX_Jw
	1v9FZ3Xr1fCFnYkr18trna9ry7tFZ3Kr4FyF1fKrsxX3yruF1jgrnFvFZ8Wr4DXanFvFyU
	JFWDWFWxurZxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRGtCcUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiOxDgbmjmIYqTMwAAsg

In mtk_mdp_probe(), vpu_get_plat_device() increases the reference
count of the returned platform device. Add platform_device_put()
to prevent reference leak.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0..eb212ca1a083 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -242,6 +242,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+	platform_device_put(mdp->vpu_dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.25.1


