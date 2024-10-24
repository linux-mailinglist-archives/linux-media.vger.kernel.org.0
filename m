Return-Path: <linux-media+bounces-20202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF19AE53F
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 14:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3F7DB24A0A
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2E41D966F;
	Thu, 24 Oct 2024 12:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2shf3VQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232A1D5AAC
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729773729; cv=none; b=ep3sLZ7FA1YE5uWHdqz8gP2jfLsEMcSKXQe9KEzl+MunnX7SY0fW9Pal1T1vlIay9JDZvdDsSIFWCtAew2vgKKMpTI7yI8JD6HEGb5Vwbn6jvzF2whaF5JARM8gbgp1J0kk1TH5RpYFbCf+v/aR/TpdjsqPYJ8XcELH/BU1J0wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729773729; c=relaxed/simple;
	bh=ZppK6OBnnboywFKdyzV4Lf2enYvk6U069pwJMsdvCU0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YVezH2d6S8z9S6O20Om+EXrmLuPlA9kvFKgYJ7kEs1YBRtPsNByHnThVN0uQFVS0Tkv8nEGpoRLAC9T7Oeu/r+GBDQKjs9jzC08zsDS6T/Uc4fsoXW76L4eRi0GveBuPqULYtzmA7hlEn6jFNpyey+B5DoLYMbDTqe/UFZQ1aZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2shf3VQ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c9552d02e6so1112461a12.2
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729773726; x=1730378526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6lgZ2s7gZvIQeVKB3cBzOcMl3XHl1CU+KIuW+CzuIA=;
        b=j2shf3VQwJM1QkXDRy/bbuospCB7j7lIeRCQQFp0fmeDioVYWukIP7nUSQEkz6c8CR
         S39d02QOsMj2hZu8JrVzpYfQPnhhyEZfkD9Je9UjFBsyj2ycEWJVYNrSsD6fKLdf9iuR
         rqgQfFY/DoWED2TprYoWDQiPGKDs/zjXQ8Nlko1JXndbUTZbzoh8a2jK0CgWAETH92e9
         5KEMhwSCAEs90dGfSgHFaOJfsPi2y64UusCTO6zpdeOl+0gFFi6pFdfoEOPWMNAGeH7J
         38kmPTqyWKypMbz1vus45dgFse2/+vIHDduOlSGKmO3DjHDAxjvAe3JGWY509GxSr+B5
         FHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729773726; x=1730378526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6lgZ2s7gZvIQeVKB3cBzOcMl3XHl1CU+KIuW+CzuIA=;
        b=UJRllVFi1KSLEbi6EJHQUAF3Lsb+3nBFNXcwNvt36EB73hpmSeQrEpfay/uf2dZ1UB
         aNG3kWMVsQ/5zpK31DTz5sdTAfq+5hauGevo7AcEdns6xFXM9zSEzTTpcMsm9H1Yz06W
         RJY1g1+u+un4Xsbhme2KUdeA+BQOaIF80W1cm3iqcV3nQKti1x6D9cNoj3EvtKAYFl98
         /q1IcrRDEh3OULyTmuMDFepmI8IiKErlhlp2nVqgbpb4rtzSQhnQSv8HY+Gg38MQVthl
         Mv8tcqh3FsE9u1M4vbEjD9akV9LZftm958htgpGoylQmXwGUKpWkFba+bgKdPAUS9D80
         RLyw==
X-Forwarded-Encrypted: i=1; AJvYcCVxSLuW+AcVr3LxuoM0+M3frVyKkPxGm5SgWeGLrS5yol6wGkmU71gU/ZzxA1j4iOrXTQGvBLQEZmtwSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBdgq6ZfaW4ulgH18Q0bZoKk62l4THEPfLv7uVN6ENs15d6s6
	4JZhdxeeqewnLtryWyXwAOp1rLFKY9NrF0nXEc9ZiYrirQafB8DfPa/PVOAPtEBYPQ==
X-Google-Smtp-Source: AGHT+IEUBGWWQn+Dk6Xzmic0E/nCMs656ZBtST4vy2Vu3op4POs8oDMCCCvVt/vWJpaFM6t/9QMhog==
X-Received: by 2002:a05:6402:13c9:b0:5c9:709c:24ab with SMTP id 4fb4d7f45d1cf-5cba242831cmr1565779a12.6.1729773725326;
        Thu, 24 Oct 2024 05:42:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1550:4200:da3c:7fbc:c60c:ca4b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a65419sm5623026a12.25.2024.10.24.05.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 05:42:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: friedrich.vock@gmx.de,
	Richardqi.Liang@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
Date: Thu, 24 Oct 2024 14:41:57 +0200
Message-Id: <20241024124159.4519-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024124159.4519-1-christian.koenig@amd.com>
References: <20241024124159.4519-1-christian.koenig@amd.com>
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


