Return-Path: <linux-media+bounces-48233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892FCA4259
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 16:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C50C3091CF6
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 15:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43C6284674;
	Thu,  4 Dec 2025 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eM8lUImr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA59233707
	for <linux-media@vger.kernel.org>; Thu,  4 Dec 2025 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860398; cv=none; b=AiDDjyRt545Kl/7BUlIF9uD+qgzh0BQOkK1CTDNEx3MRis0wx9nDWs0+dSAyRU7+gBPJQhO81kMw6PBstgMsyOa1wtoA3cLgPr1ienTQvnBNiMUHArn1qz0rFquDNXUyoaszsXxikA8rOVcKdS20tntgsxfK/WfUu5J/K9ByuLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860398; c=relaxed/simple;
	bh=23CUdHSqwZrdcCD9gS3do6I3nTXEJpBlLM9jRZrvpjQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dly0hRHqR1peqJcGN8KVO+AzJwO1dYyQG9F2ZvUkkFLVffhA2ZILJFasamevbyoevlFDvfSyuXjSZNc3qP0xsgfdawwBvqzhmGhOh5UsGeqvnvTQQ9XMbw0gjw+Zfb5MwE7ydCc137yTlpzT/RAeepxJ6Dl1SQPJvL3+1Yy0f4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eM8lUImr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2e6aa22fso543985f8f.2
        for <linux-media@vger.kernel.org>; Thu, 04 Dec 2025 06:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764860395; x=1765465195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQkEoJ9MFKVqqKXaYJBrPLqj/enkBTJ1LhHId5TSfKc=;
        b=eM8lUImrMLUkvmbzYNpN8dRKeg+ivgZkB/WLwNQ9Q0iJAD8jK1JkA4bGklCgx1mONL
         BLilmZpZCiKPurcsL6l+tOmXjznifcEka7m0gfRGpKjc0KnatcwjD6pzI8wlMtfTUQ0j
         N+9BBeYROQByhaPnXhxVOe+5rD5lAT/agxsaq6oUxpaH0lxSgOg0MxvmicpHi3pudaL+
         d4e5wU+rb0rbl9ZX2R+Z8LTR7G07o5VB5OjWXA5XzUM7Q7XOGgc9zaG1quUzwAn+7PdM
         lXHPGwp5EpZUvK73BqGar3xQ8QKAUh8C4d0PGdtpRcsd+fzr7Av+w9bhtInpiHS9LZt6
         vG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764860395; x=1765465195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQkEoJ9MFKVqqKXaYJBrPLqj/enkBTJ1LhHId5TSfKc=;
        b=ET8SDrEhEmHGvs9ymYvy6lQ8PDR4gixA5D7yIaYglEVCN0gqRCOrKyep3zykHaZfd6
         VSowwEKsxoJo/iZs8ackzW28FtGsUIYPyTvqqJnMo6DKH+fGwLiJGOBlbvhEzf7bBU6h
         vi1GYIoCWrM027V/U43JbY3Zqm8D/sA8d22Wsu8iCHLpw514OwBHPrSMmVUY31nSJGt0
         C/kALrZZGXgdd3zxmySZc8ZxHXPKiSNtybEAdqDKUYWTyNMALpWhRPX45GEYTRJIq0zC
         VrcsABnCl/9E9Pf+dQX3QD94mEDGIIgAXe7iIg+Xlaeg2TTuL9TU/Ey72WY7CPTsfRY2
         myCw==
X-Forwarded-Encrypted: i=1; AJvYcCULJGyzGTknvJ0SKt4lNdK8GD0SsS6i7b27OPJugavPh90h5GXky4/QZ9FSSIISa0+ZvtwA8wYyrj1wcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh/HVWFkk/OjQcM+2Ym7HFoS/Qd91HVdPlMlGsC16uy6ejmwOn
	vP2i5PyhWr2g0rYsLH/sBIFvSP1cTd2w400zLoexhXj1hPcI37VbmjE2
X-Gm-Gg: ASbGncuKQRfkAZyPmZEbu6SfttPpX6pZhTHlZdD9kBUFNPC7jGkOYlaNtmJbi2LwpkE
	nRQZzQRzlWYYmBZJEXcCcoP/Sn7wIdcNF3e6oG/SDTy3FnMI9OzdvgJgwDiO6KPKUwrUuyzb2nK
	xMXcjnMTik37fqFQlYBJGI7TiRFY/Yc9gt4dpc3j/lxbKvWVRfJFWLxODwCHW2IEK9k54z9mVLr
	4D12+fJq5MhqQrKl+zgXm0PeEQk/TGSi5gpV0FsFW0uOv17BEG/LWa9+H6/Wac8zn0ephauuIXW
	FCJVKE3P39aI0jVEFEDDwHq7aIswMHcFt4+zvNnpik6ABPhyZImDMnx1HN4O7YjDKWszxtCbYah
	APPnNJWl3KjLL8hkvHsLdiLsYe27ZfxlHHmdPEkE+DScYxOQbeTj0hCdSr2Fs5KRWYfEnm6f+ok
	PTCkqP22cnLS1vTNYigKJ3WQQ=
X-Google-Smtp-Source: AGHT+IFwu7JW/Xgfu086XVAKU85p92ZgvuSF9cmbHbDPgEySuByIW32VzQBsGlUWUivmDHHBV2Jk7A==
X-Received: by 2002:a05:6000:220b:b0:429:cbba:b246 with SMTP id ffacd0b85a97d-42f794b35a0mr3950582f8f.0.1764860394438;
        Thu, 04 Dec 2025 06:59:54 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1591:1600:c95:ff70:a9ae:a00c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331af5sm3473291f8f.31.2025.12.04.06.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 06:59:53 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	simona.vetter@ffwll.ch
Subject: [PATCH 1/2] dma-buf: improve sg_table debugging hack v2
Date: Thu,  4 Dec 2025 15:59:51 +0100
Message-ID: <20251204145952.7052-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This debugging hack is important to enforce the rule that importers
should *never* touch the underlying struct page of the exporter.

Instead of just mangling the page link create a copy of the sg_table
but only copy over the DMA addresses and not the pages.

This will cause a NULL pointer de-reference if the importer tries to
touch the struct page. Still quite a hack but this at least allows the
exporter to properly keeps it's sg_table intact while allowing the
DMA-buf maintainer to find and fix misbehaving importers and finally
switch over to using a different data structure in the future.

v2: improve the hack further by using a wrapper structure and explaining
the background a bit more in the commit message.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> (v1)
---
 drivers/dma-buf/dma-buf.c | 72 +++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2305bb2cc1f1..8c4afd360b72 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,6 +35,12 @@
 
 #include "dma-buf-sysfs-stats.h"
 
+/* Wrapper to hide the sg_table page link from the importer */
+struct dma_buf_sg_table_wrapper {
+	struct sg_table *original;
+	struct sg_table wrapper;
+};
+
 static inline int is_dma_buf_file(struct file *);
 
 static DEFINE_MUTEX(dmabuf_list_mutex);
@@ -828,21 +834,57 @@ void dma_buf_put(struct dma_buf *dmabuf)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
-static void mangle_sg_table(struct sg_table *sg_table)
+static int dma_buf_mangle_sg_table(struct sg_table **sg_table)
 {
-#ifdef CONFIG_DMABUF_DEBUG
-	int i;
-	struct scatterlist *sg;
-
-	/* To catch abuse of the underlying struct page by importers mix
-	 * up the bits, but take care to preserve the low SG_ bits to
-	 * not corrupt the sgt. The mixing is undone on unmap
-	 * before passing the sgt back to the exporter.
+	struct scatterlist *to_sg, *from_sg;
+	struct sg_table *from = *sg_table;
+	struct dma_buf_sg_table_wrapper *to;
+	int i, ret;
+
+	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
+		return 0;
+
+	/*
+	 * To catch abuse of the underlying struct page by importers copy the
+	 * sg_table without copying the page_link and give only the copy back to
+	 * the importer.
 	 */
-	for_each_sgtable_sg(sg_table, sg, i)
-		sg->page_link ^= ~0xffUL;
-#endif
+	to = kzalloc(sizeof(*to), GFP_KERNEL);
+	if (!to)
+		return -ENOMEM;
+
+	ret = sg_alloc_table(&to->wrapper, from->nents, GFP_KERNEL);
+	if (ret)
+		goto free_to;
+
+	to_sg = to->wrapper.sgl;
+	for_each_sgtable_dma_sg(from, from_sg, i) {
+		sg_set_page(to_sg, NULL, 0, 0);
+                sg_dma_address(to_sg) = sg_dma_address(from_sg);
+                sg_dma_len(to_sg) = sg_dma_len(from_sg);
+		to_sg = sg_next(to_sg);
+	}
 
+	to->original = from;
+	*sg_table = &to->wrapper;
+	return 0;
+
+free_to:
+	kfree(to);
+	return ret;
+}
+
+static void dma_buf_demangle_sg_table(struct sg_table **sg_table)
+{
+	struct dma_buf_sg_table_wrapper *copy;
+
+	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
+		return;
+
+	copy = container_of(*sg_table, typeof(*copy), wrapper);
+	*sg_table = copy->original;
+	sg_free_table(&copy->wrapper);
+	kfree(copy);
 }
 
 static inline bool
@@ -1139,7 +1181,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		if (ret < 0)
 			goto error_unmap;
 	}
-	mangle_sg_table(sg_table);
+	ret = dma_buf_mangle_sg_table(&sg_table);
+	if (ret)
+		goto error_unmap;
 
 	if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
 		struct scatterlist *sg;
@@ -1220,7 +1264,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
-	mangle_sg_table(sg_table);
+	dma_buf_demangle_sg_table(&sg_table);
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_pin_on_map(attach))
-- 
2.43.0


