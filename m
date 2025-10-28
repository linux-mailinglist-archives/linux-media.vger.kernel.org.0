Return-Path: <linux-media+bounces-45786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDC2C13FE6
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DF1D1884A58
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A78D304BC1;
	Tue, 28 Oct 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4x9RZLd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76A9302143;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645926; cv=none; b=bCYI8ybgqM9Gr0xmmWrYNpQb6D/xE+A+zCnVJQGLMFyfG3ShL7Y9ykfsGp6hivouHQI7enwiG6fyTxC2CHSeRen1axi62dcjhIUTIbZueZEPyivifkM+VFofCjnVw29RoNnWLn+IlpOYVq/jm5u2owzeRfi8SrOaGN3PFm+wkxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645926; c=relaxed/simple;
	bh=TfW/tywFiRgcc0zHJ++gyx/6TvQ8+E3j1OKY3czA0Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtJ7KcPnxiIxHcsIPWD0ZDYy+wFgEGoUYE1xVs+1bgogsdwBiDCdP7eXkU4AUrs1loZbIBP0TN2v2J6PIbG0QIV+l+6682eiYYsRNCE8cBPdXQn1Xzr4DK7+hicb5c7Jm4QznDSVUZLkr0FKDUgg45TA81R5PUWUblfmN/m1rrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4x9RZLd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509C2C116B1;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645925;
	bh=TfW/tywFiRgcc0zHJ++gyx/6TvQ8+E3j1OKY3czA0Jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V4x9RZLdIKkGYFssGzVS5imlOjLkTcnWQtzdWBnNcs1N8nT5SZnAkEmSeRUCv1IQi
	 Eu7Ps1wf/Kiyp22faeVDqi6FfUMG2xhSmvHPHqn3IQjN03KSSX4DrR0fYWxytA8bsz
	 Dhmlush1lyIjr/7DgEfdnjt74llmbN7HvLUXVnwKFHZ0A8l908+F871P3qdH/mscW5
	 A1YlFujrZrD9QaMv6ie25uFz/akUUUZrD5LDDRmJXKOByx4EP1gWqbPuoBT8M3to1Y
	 fqHfIAV37cBM5ySXxZNJS2Ndeq/1P8vg/NFebw43PyVzIjKlhRkutpXcVw+1pAXjB8
	 M+6k/nwvmTP1g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDga0-0000000014i-3i9z;
	Tue, 28 Oct 2025 11:05:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] media: mediatek: mdp: fix device leak on probe
Date: Tue, 28 Oct 2025 11:04:53 +0100
Message-ID: <20251028100454.4086-2-johan@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028100454.4086-1-johan@kernel.org>
References: <20251028100454.4086-1-johan@kernel.org>
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
2.51.0


