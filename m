Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90347458C92
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 11:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238864AbhKVKrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 05:47:31 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32924 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239112AbhKVKr3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 05:47:29 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 9ACCA1F44822
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637577862; bh=BZwKyzVx4ruuAqlnDN1dIueQvzsa4RZzFJANK5WOaYE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eZEc8ECeOmsw4ezw2hpNmvicqyp8cDuBNRLXFHOI2d19wIHaibjoEtA5Yv2PqKAjV
         YKZ/CbZsVsqJ6w/5VeW06fsPymIpCst9vxkAARiQpPKdjiabtO4oR9PYSM6HoCKvJB
         GjYyAoKdv3XDQ+B9SvA4/4JCVZfRRLgMGoJBpGB8sp0PQ1/TPM22EFIz8Qd6Cl2Icx
         S0LxEdhn4hV2jBYPlXnYC4/Ues5/XExzqaCx8liG7pUQIvC//aonPhpuhlLwC21iaM
         8lZjy+3kwbNn45qUk+Rk1NJmNSWkJB5WjZjlPjNNycq/4lpHA24O65A6UBKmj5padv
         Q9CDSLcHfaLZg==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     iommu@lists.linux-foundation.org
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        dafna.hirschfeld@collabora.com, kernel@collabora.com,
        Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU
        DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support), linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org
Subject: [PATCH 2/2] iommu/mediatek: always check runtime PM status in tlb flush range callback
Date:   Mon, 22 Nov 2021 12:44:00 +0200
Message-Id: <20211122104400.4160-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
References: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sebastian Reichel <sebastian.reichel@collabora.com>

In case of v4l2_reqbufs() it is possible, that a TLB flush is done
without runtime PM being enabled. In that case the "Partial TLB flush
timed out, falling back to full flush" warning is printed.

Commit c0b57581b73b ("iommu/mediatek: Add power-domain operation")
introduced has_pm as optimization to avoid checking runtime PM
when there is no power domain attached. But without the PM domain
there is still the device driver's runtime PM suspend handler, which
disables the clock. Thus flushing should also be avoided when there
is no PM domain involved.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 28dc4b95b6d9..b0535fcfd1d7 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -227,16 +227,13 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 					   size_t granule,
 					   struct mtk_iommu_data *data)
 {
-	bool has_pm = !!data->dev->pm_domain;
 	unsigned long flags;
 	int ret;
 	u32 tmp;
 
 	for_each_m4u(data) {
-		if (has_pm) {
-			if (pm_runtime_get_if_in_use(data->dev) <= 0)
-				continue;
-		}
+		if (pm_runtime_get_if_in_use(data->dev) <= 0)
+			continue;
 
 		spin_lock_irqsave(&data->tlb_lock, flags);
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
@@ -261,8 +258,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
 		spin_unlock_irqrestore(&data->tlb_lock, flags);
 
-		if (has_pm)
-			pm_runtime_put(data->dev);
+		pm_runtime_put(data->dev);
 	}
 }
 
-- 
2.17.1

