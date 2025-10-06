Return-Path: <linux-media+bounces-43789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 770CBBBE377
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 15:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC681893460
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 13:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FD32D29D9;
	Mon,  6 Oct 2025 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbNMaU6S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6572D0C7B
	for <linux-media@vger.kernel.org>; Mon,  6 Oct 2025 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758439; cv=none; b=Qb6HkCdQOp8gRw0fgv9Gce0kkgd1CWrAtQCwXAqQvdWfBy1NaSofooHCCq/OxrXAIZNWnWpugn9ZVrtTCrATOQPaZLVcXfnhcIBMLw7+dWBCKvu8Z0iZdrcpxiKe7PGOhmgl/PolAYgCHQFNyXFBfz7/4c/OskgUg2od1rELKpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758439; c=relaxed/simple;
	bh=Qqvm7wqhXhSg7CS1wtsPyJkYchj+aCuut8S1ZJ8L8WY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqzueXvoNpARzl+CeGLJNJYhoWJpcUkNq82VTJYd4Bud3409RLhUuO1UmG+X5Ay2KEViSV3LcnWlR7AWXrxmVDLrpdnN4Zxb0pXz2A1LqWceFgsHcaVxFEvvORv5jBs8nFotSlqipKY/amgK2z/2Vh1i4Ze1AUg2SDr5JiFsMQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbNMaU6S; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4256866958bso2016881f8f.1
        for <linux-media@vger.kernel.org>; Mon, 06 Oct 2025 06:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759758435; x=1760363235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUjSFz6fN2wSOyWGzwAwR2J1COdGWDGN7frdNiRq5kw=;
        b=CbNMaU6Sx6paXesv5JIZlvk4lpoB8DUdAqJ+DYPfJGDB1CaHM5kpnC6ec9jOtNmo7N
         BY1AhGZS1vh8SvTfaBp4E7b9lIS2kVQYs8wHMAvp0ijJj1WBfORsaLiS0E7pREilgZWt
         K11URYgRUHPfEB63HSUKlLp0Id8bXVe8o+FJCrcqxQIE8EeWsO/ZDoAppj00WlyJYGWl
         99hUBlnsr5yub+OvfR6cSq+D53ON87QBBVkXqPunbLn70B1hqTiGZggft2qW1ZmbV7Ra
         A9XFpV6A7kEW/qQZUIvrzTiBHzWUTfBm7j98w6YXYTZ93fcrsQz7tfPIidXTZYSQObXb
         XuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758435; x=1760363235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUjSFz6fN2wSOyWGzwAwR2J1COdGWDGN7frdNiRq5kw=;
        b=U0t4w3PYZN/6c1raYql+t5f5t7Vxsl8oCP66JdSw5S7ppTPPQZnQnvEa5FmKNmTzqX
         jjq3sPcy2yCJQuLXoempCVuBPhLe5J0XQDSngiwaTdeEK6plATx7NF+ZiMo1mveXnxxh
         F/MW6ISRak0S6bmy5t8UZ8ejbPjGTEy8AqGNMaPgfd3cAT5pCX7Kb/idcyGL+zIUe9ne
         zrXqHchyCGbJ9qLLEw2fGklr5KhVwgD5LlyJFSzrEYODK2dxHEnejwpJwiw9nDvK1Ydr
         tTpeOHMD4A5cn/Dx6uOG21yH/3Qu3XHSduKfM+alcUj8y1RHcKPBi5wR3/MmMzZnd1V8
         9+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXkzUTq63xfwJiVNUpUpKcTXQKLnWUIM8zMhk+ibrI0wx75fiDqf+5UaJ6ZAHqpX2C1yEqSeM7idTCXFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRdPVutTV+IEN+QetVMaWEJYQr4KJD8/OIszhsl1oYldv2k2Z8
	WCeZUX/Bt51vKRxISGuE2jfKMFQ1t4nFPMyRaXeC3bAxNYVnPAkSrzvPrWOx+xB9
X-Gm-Gg: ASbGncugPn1Q8Fu54A1UuVI92UBFnaCHvRi9GeIjW4/ph6bLevf18QihoI5p/11Y4dL
	u4BqDB/44HeInoVe7GnqCuw/KmHRFT8oUFSyUyiC5WPHTP9KaUXYHrD1DFZ34bd4dKkF3WZrgin
	2qSRN40SU5ZnqLnObCwCY5F+JXAYyVR/4b4O5joQySxvgd/hNTrL4KdpoErvEcnsQuQtr1131UZ
	d/6EugQQ62GzxEB8gq/vQ/XExdJu88O39Fx1LIv1MCMNCf3WnLjXVMIaamRp7Zhh9SI7Sfg7D0u
	8qrGnZZSmid5mfUKRXR9XNIM9LySr8H/oMGcJy9i0Ti7OEn6nbrrdRBZEqeCNlfpWw507kmyT2d
	nWzDEgBGwBNTErxNw/9ix/b8+dytX/TRt8zs7k0nKY1WOuGaC4wqXZoTXKgl/gtr+ZLa78g==
X-Google-Smtp-Source: AGHT+IHghnHYTHQMZ74bXvaml49IhX11dZtX5PjRksFkQP9ERbo3nu+xG5MfUzWuLRJts3bUM0z8Ew==
X-Received: by 2002:a05:6000:610:b0:3fe:d6df:c679 with SMTP id ffacd0b85a97d-425671c1c62mr8200162f8f.55.1759758435309;
        Mon, 06 Oct 2025 06:47:15 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1585:c600:2084:c9fe:598c:ebd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8b0068sm20966125f8f.26.2025.10.06.06.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:47:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	simona.vetter@ffwll.ch
Subject: [PATCH 2/2] dma-buf: improve sg_table debugging hack
Date: Mon,  6 Oct 2025 15:47:13 +0200
Message-ID: <20251006134713.1846-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006134713.1846-1-christian.koenig@amd.com>
References: <20251006134713.1846-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of just mangling the page link create a copy of the sg_table
but only copy over the DMA addresses and not the pages.

Still quite a hack but this at least allows the exporter to properly
keeps it's sg_table intact.

This is important for example for the system DMA-heap which needs it's
sg_table to sync CPU writes with device accesses.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 68 +++++++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2305bb2cc1f1..1fe5781d8862 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -828,21 +828,59 @@ void dma_buf_put(struct dma_buf *dmabuf)
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
+	struct sg_table *to, *from = *sg_table;
+	struct scatterlist *to_sg, *from_sg;
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
 
+	ret = sg_alloc_table(to, from->nents, GFP_KERNEL);
+	if (ret)
+		goto free_to;
+
+	to_sg = to->sgl;
+	for_each_sgtable_dma_sg(from, from_sg, i) {
+		sg_set_page(to_sg, NULL, 0, 0);
+                sg_dma_address(to_sg) = sg_dma_address(from_sg);
+                sg_dma_len(to_sg) = sg_dma_len(from_sg);
+		to_sg = sg_next(to_sg);
+	}
+
+	/*
+	 * Store the original sg_table in the first page_link of the copy so
+	 * that we can revert everything back again on unmap.
+	 */
+	to->sgl[0].page_link = (unsigned long)from;
+	*sg_table = to;
+	return 0;
+
+free_to:
+	kfree(to);
+	return ret;
+}
+
+static void dma_buf_demangle_sg_table(struct sg_table **sg_table)
+{
+	struct sg_table *copy = *sg_table;
+
+	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
+		return;
+
+	*sg_table = (void *)copy->sgl[0].page_link;
+	sg_free_table(copy);
+	kfree(copy);
 }
 
 static inline bool
@@ -1139,7 +1177,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		if (ret < 0)
 			goto error_unmap;
 	}
-	mangle_sg_table(sg_table);
+	ret = dma_buf_mangle_sg_table(&sg_table);
+	if (ret)
+		goto error_unmap;
 
 	if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
 		struct scatterlist *sg;
@@ -1220,7 +1260,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
-	mangle_sg_table(sg_table);
+	dma_buf_demangle_sg_table(&sg_table);
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_pin_on_map(attach))
-- 
2.43.0


