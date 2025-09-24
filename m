Return-Path: <linux-media+bounces-43065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBFBB9A0D9
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 15:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CF4316CF8E
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 13:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFBE304BDD;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtIHGdIn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B51B143C69;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758720987; cv=none; b=rsv+vpRygpK499SlDms7ExlVmzKA0ZqXPNRZ3y+CMTL9a00F8KeCsOEtQBv2y+BDVfGZ+cmBG8KdA5nvnyi9jR00HFMhOFI+EtCb5/V6YyZ/iMV+8LbYvyENaBAMJmkGq+3YdyLf8lu+wn6f8mzu4SuVzFWDNYWSzhSSVZ8Cn/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758720987; c=relaxed/simple;
	bh=OIe1RuE43WcLPQslx97SFCWinjb/HwQHW7IH+6ElOMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Huqf0a3MkehHX2IqHL+tH8/QWle1yYnImXHDW6nsoG2PZRkeIeamBb6FwsSh0sas7af16PeezR364bafy/9m/LwE1obXEuHbnUnms8bgpG2V0E3JHtlDcsO4WxyPT14ffEXAvwZK8uQ1c3+ii1zpLX6nvmGstbJDq95LNACNfk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtIHGdIn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE7EC4CEF0;
	Wed, 24 Sep 2025 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720987;
	bh=OIe1RuE43WcLPQslx97SFCWinjb/HwQHW7IH+6ElOMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TtIHGdInBRc3yBPYTTl8bd6Gw43MVEvPaahxJK4j6raLfkd6fZoluUh4cBWKxzNVp
	 xLSTQxJe4q+gSiulkb09xEqcVgJS8RVTPhaJR7Z3PTYRJQ79AHbaLZqn3n1HbhEoX8
	 goXBkui6d/aQ+Plq7E/V42ox3e62lpM73FqVJVw27a5vdZYs2EFN2/72ZmMe4W8XkN
	 Fv1LAuZeSiq0mhvH1ePZu4iMSH7f5K8MpRhVJCj1QJ3D3KKez9Lr8vshAm7/P4wxI9
	 iJZugM0vRtSkEfwZkIlNXmY4fAlMPm0JOLlywLHfVJ6q2jAVTw9o83dR9t9PfpSwdC
	 xeqajp8hQygpA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v1PfR-000000007Vo-1fqE;
	Wed, 24 Sep 2025 15:36:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] media: mediatek: mdp: fix device leak on probe
Date: Wed, 24 Sep 2025 15:35:51 +0200
Message-ID: <20250924133552.28841-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250924133552.28841-1-johan@kernel.org>
References: <20250924133552.28841-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to drop the reference taken when looking up the VPU firmware
device during probe on probe failure (e.g. probe deferral) and on driver
unbind.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org	# 4.10
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0..5c7dcf4090f4 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -198,7 +198,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 				  VPU_RST_MDP);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register reset handler\n");
-		goto err_m2m_register;
+		goto err_put_vpu;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -206,7 +206,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
-		goto err_m2m_register;
+		goto err_put_vpu;
 	}
 
 	pm_runtime_enable(dev);
@@ -214,6 +214,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_put_vpu:
+	put_device(&mdp->vpu_dev->dev);
 err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
@@ -241,6 +243,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 	struct mtk_mdp_comp *comp, *comp_temp;
 
 	pm_runtime_disable(&pdev->dev);
+	put_device(&mdp->vpu_dev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
-- 
2.49.1


