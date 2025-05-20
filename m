Return-Path: <linux-media+bounces-32929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790CABDEE2
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 17:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD501BA6EE4
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893F32676DC;
	Tue, 20 May 2025 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GLT/u2yA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21876263F44
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754687; cv=none; b=oAaBOa7fxWug9IoZO3CJ9i1H8uAFidaIP6jUjTMrodRJrKl3wPtsuasiFWRSOEg/dU8st39UjozM2lBg42IS+119krbA7icimRauk+ogRy/MYAtS93509lB8lH3ljwzQKCTb6ZDT4WJU/scVP/l1wCLjOpVOeHTJR1jsnEThgyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754687; c=relaxed/simple;
	bh=UxN93SvSHVTP+m+eEEKFbkfsohK3RhjYDOa6gbczcdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYJv6JuU3PxEICwBF/KgkfBlIQNcdgMP35VQdamxnI56nwt8dYog4xx9O4D90RgIiWWueTLKtVIzcMz5K6AUpY5JuxtD4rwPrRI0ER6ik9dLpnq66+YrLplGIdkfARgkrcT0YBhgkEY+6koCOOBE7sFtAFaIBo+jyudk/By0oNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GLT/u2yA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6019b564d0bso6595804a12.2
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754684; x=1748359484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
        b=GLT/u2yAQTo/Ui8guh77KTHRiumuBadbJgCGyBqpWXbduuTGoOGH/QDB8UmRLOFAj2
         5L1QQQ1yFxZWNJDwDyoaYkbBEQp8tbFrBTtQVxZcHhunYrUIZ+N7DZ0LwBVr5lbtra1a
         gfdC9h9sGF3i1BVXn0KaAvGSkHmnMF4yfIwa8VvGPBPvzCHTkScxuBrIFwa9x+Oq3K+P
         mYbKTmcj++umzLhBtCyLeaBN80m7kf5AmTjft7UXgktOdPwQDqAyJCMjyhuJ9zP395/d
         bAQzM4R0+RvY1JuXb2B32/3UP9Wh6xou/GiwCd2H6pXmv4kYsOJdwMacY8rII3lhhd6f
         lZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754684; x=1748359484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
        b=kSI+NtJ+7BFdbsLh/wLW3RtjoGQrnuBdyjAwUSOkbflfh273e281Y5zyGtkb8Wzu3V
         JSeYO1aJUfx1lbtKunbQLcP0tREgmvT6wSS5UHBaBQ/xPPHH0bTMu7BIuMzpB6Gu8Jol
         T/LKTaBuEOc49G6JguqJh71RPCMXC5zip518ZSGMdMZqwga5eRHVvERIdulCCfwqmBgY
         1tEf2SeJYGb5TlryPl80Q2bey50bnCNrguPR+n3dYVIzBXzGa+G1FHL7pfcqnzxz9y/Z
         PYabZ1golgKD0+vFMMVjbovPbOPP3NqFjySTAs9kEm2OPVWLg6zJSP5hQ9L5GW2GkqSr
         NGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhEXnWmfcGOqhuG5kJMeUcdW2nxN+EjLR85K5OEffjdBzN/KEYAoNuLh/tzINgndZXOLKGLuKnhe9Sag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaRbaaCl3kv4gi3rGK6XVD7ibex/sxFyRiNcKa49G7JRiYQy/a
	3MH+0Jw6V8tzF1QBlDi6Tfl2tjlYUBltK5rvWlMuU/auq8fTG/LvFkr4xHxIsbFO/2U=
X-Gm-Gg: ASbGncvPXNXUMsWqO7AS1SN6089QhNlQoWmZrY0D4WsgQ8+pc/yzwYDqUnOnmsCs6ed
	oHWN+LYEtjzWrBZGg0yY4EfIV9XpbvGoZp3CXoZO81pjYZJ0eVJ1t/IGdgOt9iS9NGW/H5M4Zeh
	paD1E0Yg5Wb8qCQ5K7rVvfJEueYKEkZj+n25zbFd93IlZJFyexNkV4DZHQ2G/R2CNR8c9UUPpTN
	E4OkY00bXYyJlRWBoVn2gJ2JJR0jO87OeEIY1xcIMmlD9YG9hWxpHT0VRup143oPsPwkapFFwBR
	U/wMvJM/q3izEFccH8HqDueab8Ap5BjfAwM0tPYzhhGU92+eOugCy6DqFbBm3DLpl7d3nSuHSB8
	iK+n0gdOqdeHvF/SwEHVQne5pai63
X-Google-Smtp-Source: AGHT+IHJnNS8PsiFV8EVtrc16G9fq8ki6tRPk/s/IIABC/OTj/P3BcTFh9xpStaXrxgzCYdbyyVt2g==
X-Received: by 2002:a17:906:22d1:b0:ad5:3055:784d with SMTP id a640c23a62f3a-ad53055f81cmr1041003666b.34.1747754684274;
        Tue, 20 May 2025 08:24:44 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:43 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
Date: Tue, 20 May 2025 17:16:45 +0200
Message-ID: <20250520152436.474778-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the dma-buf heap functions declared in <linux/dma-heap.h>.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/dma-buf/dma-heap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..cdddf0e24dce 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL(dma_heap_get_drvdata);
 
 /**
  * dma_heap_get_name - get heap name
@@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL(dma_heap_get_name);
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL(dma_heap_add);
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
-- 
2.43.0


