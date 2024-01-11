Return-Path: <linux-media+bounces-3491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FCC82A6E9
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 05:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6F3F28BF51
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 04:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EAD2106;
	Thu, 11 Jan 2024 04:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DYubyUnN"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F03F20F5;
	Thu, 11 Jan 2024 04:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Vab4e2aBGIW5uTr9Tpos6UuO9ZTChmMGyb6A0nM+R3w=; b=DYubyUnN3TD3Db/aAufPtB3Z70
	ggOeu8AQXAhBVmCI0h4najc8kAspagDGmXjqLUliOeVES5/f+WNAvP0fNiT3LleowgDIaKPBmXaBE
	7NRqcz1UhmDK7BrfYLQamQsJc0x2sf43SgD6SSph/DvVEd9+H7WvRK9sopbFD8sjMajrA8tptuuxO
	lNHKPHI2TXVc5304Kqp1QvsH9Ea/6YNOXxRS586mhdoI7X7X8kkqrJtZZ7AACji02sNVtQINWfHKQ
	r9kx5mzmpC+FAjOlxUPkYRGoOY76Me2Eqsh6W7EVhScODeHo+crS/2+f6ZJ7jgLs1Cj+jB8bCqbbw
	zJPfvvpg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rNmQE-00Fk8Z-2S;
	Thu, 11 Jan 2024 04:12:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf/dma-resv: fix spelling
Date: Wed, 10 Jan 2024 20:11:55 -0800
Message-ID: <20240111041202.32011-1-rdunlap@infradead.org>
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
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Christian König <christian.koenig@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-resv.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -405,7 +405,7 @@ static void dma_resv_iter_walk_unlocked(
  *
  * Beware that the iterator can be restarted.  Code which accumulates statistics
  * or similar needs to check for this with dma_resv_iter_is_restarted(). For
- * this reason prefer the locked dma_resv_iter_first() whenver possible.
+ * this reason prefer the locked dma_resv_iter_first() whenever possible.
  *
  * Returns the first fence from an unlocked dma_resv obj.
  */
@@ -428,7 +428,7 @@ EXPORT_SYMBOL(dma_resv_iter_first_unlock
  *
  * Beware that the iterator can be restarted.  Code which accumulates statistics
  * or similar needs to check for this with dma_resv_iter_is_restarted(). For
- * this reason prefer the locked dma_resv_iter_next() whenver possible.
+ * this reason prefer the locked dma_resv_iter_next() whenever possible.
  *
  * Returns the next fence from an unlocked dma_resv obj.
  */

