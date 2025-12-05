Return-Path: <linux-media+bounces-48329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE9FCA7AEA
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 14:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1ECDD301A22F
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 13:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BBC33F380;
	Fri,  5 Dec 2025 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWIZ0Ppq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3C32D8365
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764939971; cv=none; b=qrWscpdor0PG0BdakV7K+Y5Aa22exdUn5mg48oo1k8Pzr0zicJgZNWPGNGl25CHWEzrSdQpxwLt7UqhT9nd7vad6kdMbbz0Vtbuvx9WAZLkaMRmqrHz429/t33JFrzXkonaVK1+HXQQ6oh5i8x/cqVx4v1DfJxUYk3wWeameIqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764939971; c=relaxed/simple;
	bh=4aTYJ59441AWMXPYhG2aRZfpg0YhAsisYptke1zTGk8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JdfjT/NDUC0pIzlyVgdvyw7QfShYytXezTCZxKN7aixa2j67nJUYni7VhGrBUVTxfuLYlkmN5Ww8/U/wvl//vjfIVugg2E/yKZFqWFCz02UmIsgZ30fSsRsGHVyC8C1FZKjvbH0qwE1EE7CML5Q7mgIGhxeOgxm+rd8kCOWKmeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWIZ0Ppq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so1026145f8f.0
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 05:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764939966; x=1765544766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVfNsN7bh3iXgq3RxSUScjij5i+aMl+hRz9FbAuxQEw=;
        b=NWIZ0Ppqvv3XbA6aZRRcXUpmmnja3YydS7xTAwd+BpO/8sIcvGMAmpTC5cEB2jN95e
         RaxmncrQQ5L/B5VgsuT9tagukqxj8jyD6CHLy8O0fKue8J5zMrFxLW+iWhulTPv32drv
         DpQ5cjJSIKa1p3i4dIOZi67GNmYyk116wjAt8oT2sw7a6hxL85G6JwpUiDjdBlMs4NjU
         XX2DoTJyIlYkK5gcKvK1rnryuu4SMlnsi6+lfpgdO8/VNj53WEqJtXO8TQRCfn+vO8/P
         jncXMZo3WLbd546egKKftsSzFqGa0gquxIfeJ9yMdDouymnVR3uIl245yS68EFDKDTgX
         pFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764939966; x=1765544766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVfNsN7bh3iXgq3RxSUScjij5i+aMl+hRz9FbAuxQEw=;
        b=pnfeqObrO0ixF5ssqpSVNLegIxW7GN1/0o04VwF2DouJoBpHy8D6ZrDhwYaj9+clbF
         D1ykz3zsKlJ4Xea0hfIF4/ijNwd8bKlgUOWCA/Ez3sNauJ0ppAgC3DXwfuvSWQc4iC7K
         wj9+0CbUKM4RnlR1mkNJdbTr3XhT8wMGo1o2mziUn642cvVrKoKUdRcnDAEpcoacvyWy
         GaXf39EiQupBXXOz4LAvC6Gd3geqDqkbyttQ/NTV5gXDOtBYjnQB5/AsvTgjnwrHhOz9
         op8UiQj/W51Lkofqxsyf7hUgma1bQEDJnb1lmsO74ZsLss586rVI+0irrWgrE5zMJpGg
         mN2A==
X-Forwarded-Encrypted: i=1; AJvYcCV5nMAWgWamgvHCeYUcbmYbgHWq8AZ9lauxImiHDzRKvV4P/w9CMEsc3N8hMQpDtQIIfO1DsOx42M2cxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlelLsPQ1MLzFdcZSENGQCSqqfMLgXhw6r/RgraeZ3uwhgX11Q
	tojHKQ8LfT7r4/djZjZRG30Qp6AvaRjV0siwdWax9uS4y7n2tCjkz2D9
X-Gm-Gg: ASbGncv2N8XYtfFf6ic3X/Mn7M0mMtmmarQj9RVHNLKjUz72Lsr5oHLmM+1opk2sJZ2
	FhJknLumNPF6ZkjyxCxikxm9410ACO9NRm/Bqa55RHiZsVRcwjpW8z+Cd7RliAiKjjWlK1/2roQ
	A9suHJF+9NZTN8EfWXzc2tbqPnkv10eUQ4qs2U2Y80jdySMOUgRpJmZzJqASzohmSpfTsLoccyc
	EylJjTJ+InJhPyIO4mZxiwHBBbNUKWRxYndfalxV4HFSyImD7Qzq9RyGiPIsjzllVIAj5BxV3XQ
	BXWpRkqMHG/xLBurG0VkZYNv5k8rg/RXocr8YSZpwq5C98obCy/Rjzjfi/vX8F4iUaxCzbcbVLT
	/LPN5YfA4e2eokDgx6cXThABMEtROMP0K029nNzkyaV071KgGDj1DjtK8z7A/uG6xFdU9XJp4ju
	Uv3Tpmh0upibkZ7v9hbIfQnI5L
X-Google-Smtp-Source: AGHT+IFtBVw4148B28ROMfiQyJ3if3zDxlmObifagEb/T3wEwB3hhJuIh0e0cx/amEPTzjkSpqoyJg==
X-Received: by 2002:a05:6000:2283:b0:42b:3455:e4a1 with SMTP id ffacd0b85a97d-42f78875c06mr8126338f8f.15.1764939965931;
        Fri, 05 Dec 2025 05:06:05 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15a5:6d00:a241:8e44:3926:5306])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f8bsm8914491f8f.43.2025.12.05.05.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 05:06:05 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: matthew.auld@intel.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	simona.vetter@ffwll.ch,
	michael.j.ruhl@intel.com
Subject: [PATCH 1/2] dma-buf: improve sg_table debugging hack v3
Date: Fri,  5 Dec 2025 14:06:03 +0100
Message-ID: <20251205130604.1582-1-christian.koenig@amd.com>
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
v3: fix some whitespace issues, use sg_assign_page().

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> (v1)
---
 drivers/dma-buf/dma-buf.c | 74 +++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2305bb2cc1f1..944f4103b5cc 100644
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
@@ -828,21 +834,59 @@ void dma_buf_put(struct dma_buf *dmabuf)
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
+		to_sg->offset = 0;
+		to_sg->length = 0;
+		sg_assign_page(to_sg, NULL);
+		sg_dma_address(to_sg) = sg_dma_address(from_sg);
+		sg_dma_len(to_sg) = sg_dma_len(from_sg);
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
@@ -1139,7 +1183,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		if (ret < 0)
 			goto error_unmap;
 	}
-	mangle_sg_table(sg_table);
+	ret = dma_buf_mangle_sg_table(&sg_table);
+	if (ret)
+		goto error_unmap;
 
 	if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
 		struct scatterlist *sg;
@@ -1220,7 +1266,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
-	mangle_sg_table(sg_table);
+	dma_buf_demangle_sg_table(&sg_table);
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_pin_on_map(attach))
-- 
2.43.0


