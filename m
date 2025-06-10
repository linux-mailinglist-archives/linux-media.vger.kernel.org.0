Return-Path: <linux-media+bounces-34445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A776AD38F0
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 572C21881B5F
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5AB29B22F;
	Tue, 10 Jun 2025 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oRcc2nn9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AB629A9ED
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561376; cv=none; b=IZ8Pe5q9hlo6mFP6UdzD2W12XiA7AnZhfJRg6V3hD4BlyYH9TilDG2qh3WJHM+SKy4WmHvzK1VHEOoYmqPwv0PCNwprp/osRCnlmFUX0PKbZaIDJYlCSN0f1s5hjSlQjWUunKH59InCg9tQD70zDfloOpd/2yf8qW3/RyEM6kwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561376; c=relaxed/simple;
	bh=pxIPSpWyE9E27lvmffeV8b8jWChCUi/tb5Gmgol8JtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLi6qK+09fCC4rQlVirdDjcxEgv/Lr/TFyzeLbXt2ihsB5ejQQDGDKVsAydP+cqkwPvRtVCv68CKIQDLADTBTYL0aDjbkkfp0DSvUP6yajRqDf+Mj/Kpd7arc3hyAzgtsCMCA71XxMDHAQf8UKQe3A6MM2NSS/gMq59wg7QJOXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oRcc2nn9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade4679fba7so486729666b.2
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561373; x=1750166173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BDcE4876d7+lQswV9isKuNGeIH7ZLPwvjK7CukY8ng=;
        b=oRcc2nn9IrZNk4wKN72VrCnVXFJEl+aTr32z2h1YGFKd5NWZdZKweFVsTHCrYA+qvD
         TiNgaq6bK0o2QUwWA1LUR/7quue4mT32ezeUVNpInksVYp4sj2AmNtT7+zWYQLKU4p8I
         7/jN5xFQVqECIB/mq8hucPs3YEH8XEtqJLxpkdfOZNLmPep/vyuRmA6i05L591Cq5vY3
         78ypjnddC/v2KlD+h0eIEvz5fowoj41kkTHCUK0o4e9ZjWXJ4EOCiMF1kngxteAxABIo
         tcv4q+Zt8xWPZYlr0RVNoInkJFDK6PjPj4H7DsKypJHYe5jon5cHdeM/nVP1lDt2vW8m
         JXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561373; x=1750166173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BDcE4876d7+lQswV9isKuNGeIH7ZLPwvjK7CukY8ng=;
        b=ojcH1xLjHnH6fOS7ZUvAs68X+47Ni5vOQ57gl533UeDPB+ldjBP88mVgbmMIUGbxLm
         4Im+mSfcBf0csZ4zNNgu3xUGY5BltjIaaQAdlBmQpz3N04JCQnZiwkA9PeYgstZq2jNi
         /OltvmtgVbxZv4KeO4svduP8N3BDug/DTQfus4DMrVeGJY0soQQNQujMMUJoJDCjkaPb
         pm6hFTU/IhTBtWS19R0S5Wgxw8Rpmke54sWm4JwAKBfwSANL2gElIH+oY0UyD98gp6my
         rEp8Kc0beb+wYFIKspBaT115YHtrmxKQ/hVtWGdAvsRvCzYHu6LzE1NXQybS/czLJx0S
         AXJg==
X-Forwarded-Encrypted: i=1; AJvYcCX3WesgLoKyHKAnXdV3tRVvT/FRWbNyW17xth8kAwjLp6RAjXqD1iSGbnvPkSMG45Sg0QRh6/rIGXPu/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXK86lyW1ENpeK+HxukZvc0qff0c/bsHxVoaRYpTy7IfQ/bhSB
	k4dAmBvBS5Hi8IiGKzZWeMlmL+YtqpjUbKKi40lUVk90X4twFdC+pxHjCSJYiVcwyow=
X-Gm-Gg: ASbGncvtIzxQma2vlH7kXvzk0NCmADEcEpQBcYfFxZBEqxu9Jy2vsAbVMNUmGU2Ru4A
	gkMZySVW61dPrCe87Dk4bNj2sBnty5G15iAvNJlNNp3AwlKcQz5QkWzAKU8EOkP0dkq0eeFQ+Px
	cXu9ZE9TSS2TKWReMpn/GYttHPfAS5Tv5E+AgKNnMxpxxRZPCZJTN0KxzujCJe3MOuNv4MPW1NF
	/8iH3NBVRfnT6Gp19Jph42iGgAcJOUhtWW3KrwgQ97quvgIqp+evucfmZuY9VbIrphgGjYmlLn7
	+XcaY0yO8Qn+nC5TgdcHyhWV0Mm3tgJNn+VH6Da9a0NUnF4tbKjp/ZBSjUT3mJRE16e7ODzQRpd
	V6rIre8qv5BTve9VfsKTmcvjwO/qo5ErM92G2tTc=
X-Google-Smtp-Source: AGHT+IFOBF4P1tAbssgL5dehUIWLuQRa8S7VHpp+Y5ehx9RZ7YktqSDlhzjcJArhhbW8+ISbCVgNJQ==
X-Received: by 2002:a17:907:9720:b0:adb:413e:2a2f with SMTP id a640c23a62f3a-ade1aa0fbdbmr1346195566b.9.1749561373268;
        Tue, 10 Jun 2025 06:16:13 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:12 -0700 (PDT)
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
	robin.murphy@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v10 2/9] dma-buf: dma-heap: export declared functions
Date: Tue, 10 Jun 2025 15:13:46 +0200
Message-ID: <20250610131600.2972232-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the dma-buf heap functions to allow them to be used by the OP-TEE
driver. The OP-TEE driver wants to register and manage specific secure
DMA heaps with it.

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


