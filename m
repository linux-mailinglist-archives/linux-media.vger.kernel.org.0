Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9343E4588
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 14:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235045AbhHIMX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 08:23:27 -0400
Received: from smtp-fw-80007.amazon.com ([99.78.197.218]:11666 "EHLO
        smtp-fw-80007.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234619AbhHIMX0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 08:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1628511787; x=1660047787;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cOMO+TjtDSXLd6IwINl4YBGHY7nTYJ6NSi74jdZdrH4=;
  b=WGxJ6nqqXNVK1Xv4gMKf03VeZd1MVLjGDDyofa4dUg+zEP+zdiQPE2CO
   ssywZ1u4glhs/NjpHwPxKwGlnnly07axRS1YC0XXalGpt7VLPGM+9eY0I
   PV68c5JuiEeBFTeCvJEVAbBUomEMJ+v4yt2lMSVhCGYKlEjeO5G+WRwW7
   w=;
X-IronPort-AV: E=Sophos;i="5.84,307,1620691200"; 
   d="scan'208";a="17955198"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP; 09 Aug 2021 12:23:00 +0000
Received: from EX13D19EUB004.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS id A7345A2128;
        Mon,  9 Aug 2021 12:22:58 +0000 (UTC)
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D19EUB004.ant.amazon.com (10.43.166.61) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Mon, 9 Aug 2021 12:22:56 +0000
Received: from 8c85908914bf.ant.amazon.com.com (10.218.69.139) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.23 via Frontend Transport; Mon, 9 Aug 2021 12:22:55 +0000
From:   Gal Pressman <galpress@amazon.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>, <christian.koenig@amd.com>
CC:     <linux-kernel@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
        Gal Pressman <galpress@amazon.com>
Subject: [PATCH] dma-buf: Fix a few typos in dma-buf documentation
Date:   Mon, 9 Aug 2021 15:22:46 +0300
Message-ID: <20210809122247.15869-1-galpress@amazon.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a few typos in the documentation:
- Remove an extraneous 'or'
- 'unpins' -> 'unpin'
- 'braket' -> 'bracket'
- 'mappinsg' -> 'mappings'
- 'fullfills' -> 'fulfills'

Signed-off-by: Gal Pressman <galpress@amazon.com>
---
 include/linux/dma-buf.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..772403352767 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -54,7 +54,7 @@ struct dma_buf_ops {
 	 * device), and otherwise need to fail the attach operation.
 	 *
 	 * The exporter should also in general check whether the current
-	 * allocation fullfills the DMA constraints of the new device. If this
+	 * allocation fulfills the DMA constraints of the new device. If this
 	 * is not the case, and the allocation cannot be moved, it should also
 	 * fail the attach operation.
 	 *
@@ -146,7 +146,7 @@ struct dma_buf_ops {
 	 *
 	 * Returns:
 	 *
-	 * A &sg_table scatter list of or the backing storage of the DMA buffer,
+	 * A &sg_table scatter list of the backing storage of the DMA buffer,
 	 * already mapped into the device address space of the &device attached
 	 * with the provided &dma_buf_attachment. The addresses and lengths in
 	 * the scatter list are PAGE_SIZE aligned.
@@ -168,7 +168,7 @@ struct dma_buf_ops {
 	 *
 	 * This is called by dma_buf_unmap_attachment() and should unmap and
 	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
-	 * For static dma_buf handling this might also unpins the backing
+	 * For static dma_buf handling this might also unpin the backing
 	 * storage if this is the last mapping of the DMA buffer.
 	 */
 	void (*unmap_dma_buf)(struct dma_buf_attachment *,
@@ -237,7 +237,7 @@ struct dma_buf_ops {
 	 * This callback is used by the dma_buf_mmap() function
 	 *
 	 * Note that the mapping needs to be incoherent, userspace is expected
-	 * to braket CPU access using the DMA_BUF_IOCTL_SYNC interface.
+	 * to bracket CPU access using the DMA_BUF_IOCTL_SYNC interface.
 	 *
 	 * Because dma-buf buffers have invariant size over their lifetime, the
 	 * dma-buf core checks whether a vma is too large and rejects such
@@ -464,7 +464,7 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 
 /**
  * dma_buf_attachment_is_dynamic - check if a DMA-buf attachment uses dynamic
- * mappinsg
+ * mappings
  * @attach: the DMA-buf attachment to check
  *
  * Returns true if a DMA-buf importer wants to call the map/unmap functions with
-- 
2.32.0

