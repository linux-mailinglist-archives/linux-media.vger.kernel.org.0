Return-Path: <linux-media+bounces-19801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C690C9A25A8
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 16:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71F801F22AC9
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 14:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF661DE8A3;
	Thu, 17 Oct 2024 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klYTkeBd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7025FDA7
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176989; cv=none; b=p44Ck+8Itcaq30p4740OBdJY76XglD+yTgwsT8Yu9Zo8jkUPqKUVpl0GGQ9ddVd8HEmbeL3kRocWC6Jf5hqX1SJaxQs90rYP6fITsApuYtM1fQNE+zU9RI/pvfrdYBPIZjsvKoLvCHgd9Df/Fw5lb4TL7F1Xelq0TIiNeBoZWYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176989; c=relaxed/simple;
	bh=ZppK6OBnnboywFKdyzV4Lf2enYvk6U069pwJMsdvCU0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rFDbHl9afLdvhguaAsZFs6npYM9/uw+PtWb+kxSznC1JdILP9fbg/3TikCzsjWgmp8uqIOliFqjx27xUCPcnXZIk40ZhrASLdN6qWj6AJ6CLTUBjAkAHF2BHZDxMnpgt+LzsnHqK3DdNWGVcFtjrur1gi8xQmWA5ipo/C3sOlqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klYTkeBd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4314311959aso9555805e9.1
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729176983; x=1729781783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c6lgZ2s7gZvIQeVKB3cBzOcMl3XHl1CU+KIuW+CzuIA=;
        b=klYTkeBdaX4CAANfAz3uhdYd8xDdzL5pBsAS4LelAlrJP0V6PRcQI+BuPqoT6Mn1qG
         Ai81DNGbhs8fPwgTNgJQ9iMnpDMWuBmsYvwF2UWx+cCnsen8A30ckL2AQ5jSNXEjs4GU
         mpU/gIvYGwzLO4Z92qDQUMI6s61EKHTM4Eb9Kl9DdagOmmHAj2v5hc/+onR/OTKnIeC6
         9fjBpoOxLetTSBrMi/FUvAJtvH6Zi+98QxJ3DtkP0CeR9JBO7mVWkKqT0KdYV07oGJKV
         WhH4iMwayWJX9akEVr+6XsiR6JRMNdA0ss25lOolmnAITjQQFfsRZ+ozmoM2b7AkKK0J
         pgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729176983; x=1729781783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6lgZ2s7gZvIQeVKB3cBzOcMl3XHl1CU+KIuW+CzuIA=;
        b=gcnyS+PQ+jm5yS+XBgVBQmb3j41vvXMS1wVNC6FPw5egLu7GIeaIc5TH/WvjbCpx44
         eWtfPnhwxRszK8BCkz6/TP24MsOaU/YwOiCoeD0MUyf1dPiKwjPfkTZwIQ8jy++7KujO
         zp+59D/p8Miev/Mzqxl/MA/trxXAYEUnLVCYbBNMx0PhZfU15P5npKhP7j941pCLZ1yK
         w8k0Ah7Jouu7tC5xu//dPMwQdVhTiWIMt6FuilaKS/M6lULqTEX00wvxGGSyN3A51Niw
         UgJXuX7x7S1ovRGA5oWgGqr6Vctm9BiLlE1Spbd8Hm1ZTjf3Yd5379wONHcF6OhUwsZD
         +cVA==
X-Forwarded-Encrypted: i=1; AJvYcCURQCtDcd0AfnwOUqbgmY8RM4uRBCFi7uxRYmrGG8TjzFnMd0SKb5iv4MeoI5vCFNIsImPYlbJtM9wiKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSuYXlXwNPDCkjvuC0eg6t44cylilbrZXml+GgRZZrYhq2J9Py
	IqC22aiUeFHYj0LVxN/UyBWeYAsFV+0KDTzJQne/vflBTNhBjbXHmEindQ==
X-Google-Smtp-Source: AGHT+IHpmJLXV8xpXHikQQwDgsMns3py4eeEyAuR4qodjetWJLTKwogwGJrPxlwEahxuEo9YZRu/CQ==
X-Received: by 2002:a05:600c:511a:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-4315aea0c65mr20192865e9.16.1729176982326;
        Thu, 17 Oct 2024 07:56:22 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15bb:6500:de04:97f8:9651:925b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c37f36sm28670365e9.7.2024.10.17.07.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 07:56:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: Richardqi.Liang@amd.com,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf/dma-fence_array: use kvzalloc
Date: Thu, 17 Oct 2024 16:56:21 +0200
Message-Id: <20241017145621.3045-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reports indicates that some userspace applications try to merge more than
80k of fences into a single dma_fence_array leading to a warning from
kzalloc() that the requested size becomes to big.

While that is clearly an userspace bug we should probably handle that case
gracefully in the kernel.

So we can either reject requests to merge more than a reasonable amount of
fences (64k maybe?) or we can start to use kvzalloc() instead of kzalloc().
This patch here does the later.

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: stable@vger.kernel.org
---
 drivers/dma-buf/dma-fence-array.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 8a08ffde31e7..46ac42bcfac0 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -119,8 +119,8 @@ static void dma_fence_array_release(struct dma_fence *fence)
 	for (i = 0; i < array->num_fences; ++i)
 		dma_fence_put(array->fences[i]);
 
-	kfree(array->fences);
-	dma_fence_free(fence);
+	kvfree(array->fences);
+	kvfree_rcu(fence, rcu);
 }
 
 static void dma_fence_array_set_deadline(struct dma_fence *fence,
@@ -153,7 +153,7 @@ struct dma_fence_array *dma_fence_array_alloc(int num_fences)
 {
 	struct dma_fence_array *array;
 
-	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
+	return kvzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
 }
 EXPORT_SYMBOL(dma_fence_array_alloc);
 
-- 
2.34.1


