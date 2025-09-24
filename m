Return-Path: <linux-media+bounces-43066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D0BB9A0DF
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 15:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0F5219C6047
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 13:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0508305053;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mi+30k1D"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3614922069E;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758720987; cv=none; b=Vo4QoZhPX3Pra5JgNkNUAekR9ywOT7JCtyZH0rJ0Tmx3ahwmooqwYI7vKr9u0kTperhoH4jF0Vdy2ORfDYDtFTWCC+rYP4p7AIyuairIzoXqYH1W4QkhVrLzcyqywvjaJe+UEbJthOIndCxLZeyGI9GhmZDqC98duhkGAuK1Y2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758720987; c=relaxed/simple;
	bh=jve90eHMG69ekIGAvr0Md+ax6KbA5syj0SlM96b60/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PCEtozymqAFRHF2qMft4ZHSrx0puKaapvupBHcRrvzUu9xuqKhzD2Ak0NrlTOcK3nSlL1c7QfwJTvfi6WmLvySRmdnBPgTI784oZjZorwqH8rEZdXuTp6DliNluBZjJJHzU7wmSkuBGoxtfVgQUlcnSikFliYqbb96EYQtLN0fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mi+30k1D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3F0C4CEF7;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720987;
	bh=jve90eHMG69ekIGAvr0Md+ax6KbA5syj0SlM96b60/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mi+30k1DkGgqBZiZ2g9YAK8lQEYfznZP5K4oDTe9bcqcWdhPf/txdVEcddMKjrS/K
	 xb6MCF9RClKfZ90EKAGsdjR/BHFj3jdHRlO5UL41+CmHl61yGSCzfL0rzxtLEzGvnM
	 RNVjj2T+t12wJszTio2LOTkp2t+aTvSO2ay8guk3oryaS8X38Etmov1RCQsVp9AUr8
	 buJHdb3DVbZ1+EyjoR5bQ/t81eUJy7Z3+xxtWSKcNQ1gTmri6Lgbtz76IPb8/oasUr
	 Zw1dmf+TMzfFxmP8bt025woGBs/vhhvKK9MebM+OybDu3PBpGE4eldnGYyXccW5/YX
	 PE/Wr6THzyM/w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v1PfR-000000007Vq-25q0;
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
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/3] media: mediatek: amend vpu_get_plat_device() documentation
Date: Wed, 24 Sep 2025 15:35:52 +0200
Message-ID: <20250924133552.28841-4-johan@kernel.org>
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

Add a comment to the vpu_get_plat_device() documentation to make it
clear that the VPU platform device is returned with an incremented
reference count (which needs to be dropped after use).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
index da05f3e74081..5808311d2b15 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
@@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
  *		device for using VPU API.
  *
  * Return: Return NULL if it is failed.
- * otherwise it is VPU's platform device
+ * otherwise it is VPU's platform device with incremented reference count
  **/
 struct platform_device *vpu_get_plat_device(struct platform_device *pdev);
 
-- 
2.49.1


