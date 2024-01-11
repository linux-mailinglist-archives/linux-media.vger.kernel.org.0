Return-Path: <linux-media+bounces-3490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 748AA82A6E8
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 05:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D7511F22934
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 04:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A2C1879;
	Thu, 11 Jan 2024 04:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PFDKEvoT"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E45320F5;
	Thu, 11 Jan 2024 04:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=b4pQ8hJoVvzvXHxUFM9uPj+P7m+YblKumbV4h+B9NcU=; b=PFDKEvoTOU181sWOpwAIf5OQUB
	ZQ0uvHyPcQwHyzHkDJ/m7iKzNfZ2g5v3opb0x+PgfHdcHYeiud4irhPlCD5aXj9KUPDaItC0Hs5ON
	Y6kYhMHlBBO0btZZQctB+iKRcKpAT5S7lPMpGEqNki6RLxl7VziCAhlL+pIkp31GrdnEiZS5GqnSe
	8sM8ShMh9oSC1L/1wUhk2jP/tfAZmkhJBVgC7XKAPqW+5ASZyTvdyLX6HSZVJlXGy+f3Dg+nAIuga
	bPZ0oDK6J4OHyi9hNIUksffc3Ypzmpwwkm9fKkWL4lenLOY4aRncqsDONyjwKt9ICSHJao/Mdnb6E
	DEz4MQyQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rNmPr-00FjzT-1i;
	Thu, 11 Jan 2024 04:11:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	linux-media@vger.kernel.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf/dma-fence: fix spelling
Date: Wed, 10 Jan 2024 20:11:36 -0800
Message-ID: <20240111041138.30278-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix spelling mistakes as reported by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Christian König <christian.koenig@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-fence.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -- a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -102,7 +102,7 @@ static atomic64_t dma_fence_context_coun
  *
  * * Drivers are allowed to call dma_fence_wait() from their &mmu_notifier
  *   respectively &mmu_interval_notifier callbacks. This means any code required
- *   for fence completeion cannot allocate memory with GFP_NOFS or GFP_NOIO.
+ *   for fence completion cannot allocate memory with GFP_NOFS or GFP_NOIO.
  *   Only GFP_ATOMIC is permissible, which might fail.
  *
  * Note that only GPU drivers have a reasonable excuse for both requiring
@@ -522,7 +522,7 @@ dma_fence_wait_timeout(struct dma_fence
 EXPORT_SYMBOL(dma_fence_wait_timeout);
 
 /**
- * dma_fence_release - default relese function for fences
+ * dma_fence_release - default release function for fences
  * @kref: &dma_fence.recfount
  *
  * This is the default release functions for &dma_fence. Drivers shouldn't call
@@ -974,8 +974,8 @@ void dma_fence_set_deadline(struct dma_f
 EXPORT_SYMBOL(dma_fence_set_deadline);
 
 /**
- * dma_fence_describe - Dump fence describtion into seq_file
- * @fence: the 6fence to describe
+ * dma_fence_describe - Dump fence description into seq_file
+ * @fence: the fence to describe
  * @seq: the seq_file to put the textual description into
  *
  * Dump a textual description of the fence and it's state into the seq_file.

