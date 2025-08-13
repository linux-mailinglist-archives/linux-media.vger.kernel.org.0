Return-Path: <linux-media+bounces-39729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B107DB240F7
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D4A37271CD
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 06:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426772C1599;
	Wed, 13 Aug 2025 06:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bspXHo5I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D3B2C08D0
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 06:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065036; cv=none; b=axjH7W21W/7Ek9qHxJj2lxQhUP4uK2YaUToKEKZ5WaaObCY+PAOsKnxZfkawOkvakTg2DZwK8uunbNnl1Uq7tWBxtpQfifuVLyOKKlC8SHbochqtZICS35dJbABIfyjw8pO8iC4/KmU757beKy9O+DTC4lsQXtj2vZ1MXoTJXfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065036; c=relaxed/simple;
	bh=UeXlHfCjEZZ+zffjGmSWvLo/6vWoWI8Rd0/rywmOTyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzPXyzPZyKqG8UkVaMjXpONx/tUItsfuoGhCi2/u/aRXyJv5CTjdWWEZePH4ZId3vssb7DQM+1lasmZUj7VJcfiQjNHDI9LCunDEvlBrUORn0tUAz642oiucDrH9r5MD51Ldo8BpelFbJNd3uyLxGpFt6LxqZ7TTd2sNwbTfe0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bspXHo5I; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61592ff5df8so7819229a12.1
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 23:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065033; x=1755669833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9RDpqZGncYw4GV9WsRoAupSSI2K1DVKB1tocQmYgMc=;
        b=bspXHo5Izbg4C60wgzVQQzZWiBHDbhKv1N7B25bPYfuVwO0t2qQk/WvDVU+zkT43KG
         7GP6wy587o3Rf9jCFFpvIX0ZROE3XJnrG4rrY0tgVAXk0q7WtEDBhLUEKU21HtyJ399F
         4eHNRGVMQSJekRNqNGNDu2PbB6lkh4dG+e3i686HLuwQHtB0LD6r7zFFG3AavkQCZwco
         8DnZUn5yFazLKJW9fE26qz/IjhVsO5gLzYUogLv6T9TMAtG+lSEH8R9/SuruUOdTq4LZ
         Zl2TpPiHF9HCLqiMElwxV5AqJ9le11dyvVSw2QIn7e7T0k0n1OP8vD2Fvxx32p3zf84v
         cD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065033; x=1755669833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9RDpqZGncYw4GV9WsRoAupSSI2K1DVKB1tocQmYgMc=;
        b=YSc5JBodxXNWwIN5aIKZtnV5VCZwrHlquJVL1Jnzr4LmBHuFg7VJOpq6CFlg54MlHh
         SfDrGW3duXtkd5SxtJ2s7y2DPk2FDe8Cj2frQLaGAaBjiVIivisa0FzWa7KhWC3l/Nb/
         nBKWZW3qWESay+G0Er3xwEwSjv5DtBPEQWthtbHl7qIredn5BpVipuk49oba9BhWFsDt
         8xCul7W9pbJNUxIMqWRQREgi7IEnAsRppj5FNjFKeokohsB87SLGkQndJQIBMoucmbAe
         f2oIeSWbE3yH/84Dzv38vpoYYudaP3DKsktNQGHbyP1aizr5O8dQfjC/PjSfNoSUukb+
         c7vA==
X-Forwarded-Encrypted: i=1; AJvYcCX9prgwhlcdnVwcjB7VodCM8KZhgZMa/wHVze30moKVflRBg9hKSmDOMStAPuFqHeNF+/frricxWnSJcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgcxsaVD8o66k5HjxQ0tySD/KiKnWnw8rzz9tEC0nV2Dr1wkEv
	8HavaIdJ+DqU2auxhZkNUVOXdxfwWVuhHcLD20KIRnEuoMeTcmYJpBbvAK+/fhvInFo=
X-Gm-Gg: ASbGncvJwo0opkoIclq3/RfW33oiwye1SzlcZPFOlvIHF6yhvtLd0TFxQG+qb9xtr+l
	lxuxSPnfUv9QenvG9Yb7+cjTan6QUx7w9Pxmi2Lfq2yvYwDm7QnxJR/Vcuwg3sgnwxVpSwCjyly
	JDyP5dxtndzOd9L5Y1Yi5KeR0qZlTx2+2Mle4nWxLbCzp6RMnZKo7N6YzeTz483PP+jBk4qNwK5
	2TfaxiYzbM4wpWItfaOtAoPsd8YLZeC1YV2cuKcI2cqEh3BEw+SbONdsxedrVVwG5djBAnAAeBd
	MBykYJSIKUiBOMRHqyuWCDSa9xT+ZNZyQ/eBMS1MvVwNAbqImywra13Q5LJytQZU5SfS19l+Ob5
	mD+eSX784nX8ZODbpqDKBd/BMf2gkf6Cu2M1/n0hwX+4E0zysbO5GXafu+FA07rX314cd6VHjiS
	U=
X-Google-Smtp-Source: AGHT+IHPDW4Qxib/c3fl/QvNCJB64Z5YGN/d1oTyw+2Hx0fudTx9zXp/j1zq+pONC9zrU1nldBcONA==
X-Received: by 2002:a05:6402:22cc:b0:618:534:550a with SMTP id 4fb4d7f45d1cf-6186c000f03mr916573a12.24.1755065033114;
        Tue, 12 Aug 2025 23:03:53 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:03:52 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
Date: Wed, 13 Aug 2025 08:02:51 +0200
Message-ID: <20250813060339.2977604-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813060339.2977604-1-jens.wiklander@linaro.org>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
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
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
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


