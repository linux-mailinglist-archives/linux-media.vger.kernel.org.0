Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A7528E3E2
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 18:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730416AbgJNQB6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 12:01:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:46802 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727034AbgJNQB6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 12:01:58 -0400
IronPort-SDR: e1JXhhVj4/hQOKGI0RdC5TmvF9PVx+P9fM50a3+AjtNcjzcr5Bit72U8tuo7IyKnX8pH4/nYWm
 n3qfTTroMpgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="145443294"
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; 
   d="scan'208";a="145443294"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 09:01:57 -0700
IronPort-SDR: DfBAFi75yC9OryKz1lKBNdATthFLHS9uxKfYZOyLJVz0Fi8UM8WCwYyLuCMwP7KMdqzn4AhFHj
 NVNW30PqycEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; 
   d="scan'208";a="345711986"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
  by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2020 09:01:57 -0700
From:   Jianxin Xiong <jianxin.xiong@intel.com>
To:     linux-rdma@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc:     Jianxin Xiong <jianxin.xiong@intel.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH v4 5/5] dma-buf: Clarify that dma-buf sg lists are page aligned
Date:   Wed, 14 Oct 2020 09:16:01 -0700
Message-Id: <1602692161-107096-1-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dma-buf API have been used under the assumption that the sg lists
returned from dma_buf_map_attachment() are fully page aligned. Lots of
stuff can break otherwise all over the place. Clarify this in the
documentation and add a check when DMA API debug is enabled.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 drivers/dma-buf/dma-buf.c | 21 +++++++++++++++++++++
 include/linux/dma-buf.h   |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 844967f..7309c83 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -851,6 +851,9 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
  * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
  * on error. May return -EINTR if it is interrupted by a signal.
  *
+ * On success, the DMA addresses and lengths in the returned scatterlist are
+ * PAGE_SIZE aligned.
+ *
  * A mapping must be unmapped by using dma_buf_unmap_attachment(). Note that
  * the underlying backing storage is pinned for as long as a mapping exists,
  * therefore users/importers should not hold onto a mapping for undue amounts of
@@ -904,6 +907,24 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		attach->dir = direction;
 	}
 
+#ifdef CONFIG_DMA_API_DEBUG
+	{
+		struct scatterlist *sg;
+		u64 addr;
+		int len;
+		int i;
+
+		for_each_sgtable_dma_sg(sg_table, sg, i) {
+			addr = sg_dma_address(sg);
+			len = sg_dma_len(sg);
+			if (!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(len)) {
+				pr_debug("%s: addr %llx or len %x is not page aligned!\n",
+					 __func__, addr, len);
+			}
+		}
+	}
+#endif /* CONFIG_DMA_API_DEBUG */
+
 	return sg_table;
 }
 EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index a2ca294e..4a5fa70 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -145,7 +145,8 @@ struct dma_buf_ops {
 	 *
 	 * A &sg_table scatter list of or the backing storage of the DMA buffer,
 	 * already mapped into the device address space of the &device attached
-	 * with the provided &dma_buf_attachment.
+	 * with the provided &dma_buf_attachment. The addresses and lengths in
+	 * the scatter list are PAGE_SIZE aligned.
 	 *
 	 * On failure, returns a negative error value wrapped into a pointer.
 	 * May also return -EINTR when a signal was received while being
-- 
1.8.3.1

