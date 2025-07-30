Return-Path: <linux-media+bounces-38668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6DB16656
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 20:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34B975A77DB
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 18:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B9F2DFA25;
	Wed, 30 Jul 2025 18:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SM8TWMmv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-78.smtpout.orange.fr [80.12.242.78])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B3429A9F9;
	Wed, 30 Jul 2025 18:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753900461; cv=none; b=iSuBP+NkoQTRV3itdRbbu435GWPw+2fv4yD4o9edsUKoF5JB3VehlyJ7rRei3ZkI+LN7WmUTRrsNO/Hmo7yHnCihOXjSAGJrNc+C8M33Jbb+037gEHD9wVGKatLhs476ZAGOykF1OXOGfvHBsjBpq+kggEFZwgJ7mEu68xtzxjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753900461; c=relaxed/simple;
	bh=sZp0+q2msDXv7PtyHH+ek5wNvhUBQ1q8UFch023NJj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tkRsvZibdxsZfIYUf/QTZ3jDrTwzoIA9+UB1RsQhdc09FiaFiq4Z5m8oKksGZrPOs8k1K9u4wuJG/dxgx7FdaB9ZHP3VFrKQMCpHMB+0f/v0S2iV16OtdovyUkJjw3YhXpJNQi3uIPl3AlkDupeYa3r5N+skrpaYlnbLGnJIjwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=SM8TWMmv; arc=none smtp.client-ip=80.12.242.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id hBU1uXDqxjmWBhBU1uNSd5; Wed, 30 Jul 2025 20:24:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753899898;
	bh=K4L6S9AIfcJmSktpYUDEepH8hgI/JaLBu8Gt3usbxsU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SM8TWMmvKS/4qkzNc44dLKl7l3TO+THTVs7zsKsSAV6n1jAeZk4X3jiDrlQecbk2d
	 dIVqKLjbxjqYtRhKiZIIeaB2JOM3X1Z1yGFTOFn9p2Z0MaBsMkB9/d0ZfZlkCa+WTh
	 wrb8IDi4uASeiAazw44XGtPOfzjpDpw9b0LXD0izdP4+THJDLBwcbZkf+wUHcyB+GJ
	 hKXGgOnkPpn9lpDzoSokLTbkAnoBzdbpThTV572lBjBfXPYi5Fp13LgGZ+urmaoKC7
	 BvNhOnBvcWSE2uMo6hsaK/C/8BJO7Jw7uWqBckVVN6QkC1iUOikNI0U7Bm7iS6lu5l
	 LyJpKexqVM5SA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 30 Jul 2025 20:24:58 +0200
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
Subject: [PATCH v2] media: rkvdec: Fix an error handling path in rkvdec_probe()
Date: Wed, 30 Jul 2025 20:24:44 +0200
Message-ID: <00b13063525c2aee6a60a7f6810f69c12bf2a866.1753899866.git.christophe.jaillet@wanadoo.fr>
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

In order to fix the issue, move the corresponding call at the end of the
function, because it is safe to allocate 'empty_domain' later.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Compile tested only.

Changes in v2:
  - Move code instead of handling errors   [Nicolas Dufresne]
  - Add R-b tag

v1: https://lore.kernel.org/all/b69c20783a7b6f7964ab636679d3da80fc48372e.1753610517.git.christophe.jaillet@wanadoo.fr/
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d707088ec0dc..6eae10e16c73 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1159,13 +1159,6 @@ static int rkvdec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (iommu_get_domain_for_dev(&pdev->dev)) {
-		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
-
-		if (!rkvdec->empty_domain)
-			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
-	}
-
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	irq = platform_get_irq(pdev, 0);
@@ -1188,6 +1181,13 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_runtime_pm;
 
+	if (iommu_get_domain_for_dev(&pdev->dev)) {
+		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
+
+		if (!rkvdec->empty_domain)
+			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
+	}
+
 	return 0;
 
 err_disable_runtime_pm:
-- 
2.50.1


