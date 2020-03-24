Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3850190434
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 05:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgCXENP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 00:13:15 -0400
Received: from mga12.intel.com ([192.55.52.136]:23494 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbgCXENP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 00:13:15 -0400
IronPort-SDR: S0gquy18EvT1uYxosde6rwaA5V9T7mOKkJVvBLpMSKDIu8jIeL6aXaicMwBUgNtaxjx+VzicKp
 WnnZWYwX8G6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 21:13:15 -0700
IronPort-SDR: 8u0iGy+DbbVwsl0gT858WcYYwFdGhut+rieVD6dErg1pDRCVTB4g+CsHx2ryPQuF23RRh7bQiF
 zC1v7NokZKVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,298,1580803200"; 
   d="scan'208";a="393151801"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga004.jf.intel.com with ESMTP; 23 Mar 2020 21:13:13 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, tfiga@chromium.org,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com
Subject: [PATCH v2] media: staging: imgu: do not hold spinlock during freeing mmu page table
Date:   Tue, 24 Mar 2020 12:16:48 +0800
Message-Id: <1585023408-31580-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ImgU need set the mmu page table in memory as uncached, and set back
to write-back when free the page table by set_memory_wb(),
set_memory_wb() can not do flushing without interrupt, so the spinlock
should not be hold during ImgU page alloc and free, the interrupt
should be enabled during memory cache flush.

This patch release spinlock before freeing pages table.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index 5f3ff964f3e7..cb9bf5fb29a5 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -174,8 +174,10 @@ static u32 *imgu_mmu_get_l2pt(struct imgu_mmu *mmu, u32 l1pt_idx)
 	spin_lock_irqsave(&mmu->lock, flags);
 
 	l2pt = mmu->l2pts[l1pt_idx];
-	if (l2pt)
-		goto done;
+	if (l2pt) {
+		spin_unlock_irqrestore(&mmu->lock, flags);
+		return l2pt;
+	}
 
 	spin_unlock_irqrestore(&mmu->lock, flags);
 
@@ -190,8 +192,9 @@ static u32 *imgu_mmu_get_l2pt(struct imgu_mmu *mmu, u32 l1pt_idx)
 
 	l2pt = mmu->l2pts[l1pt_idx];
 	if (l2pt) {
+		spin_unlock_irqrestore(&mmu->lock, flags);
 		imgu_mmu_free_page_table(new_l2pt);
-		goto done;
+		return l2pt;
 	}
 
 	l2pt = new_l2pt;
@@ -200,7 +203,6 @@ static u32 *imgu_mmu_get_l2pt(struct imgu_mmu *mmu, u32 l1pt_idx)
 	pteval = IPU3_ADDR2PTE(virt_to_phys(new_l2pt));
 	mmu->l1pt[l1pt_idx] = pteval;
 
-done:
 	spin_unlock_irqrestore(&mmu->lock, flags);
 	return l2pt;
 }
-- 
2.7.4

