Return-Path: <linux-media+bounces-27629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B68A50007
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668233B6A1E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA50F24EF7A;
	Wed,  5 Mar 2025 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZdwqqg5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B2D24EAA2
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180025; cv=none; b=fQsdjyp3Eqp/BLJsKBoWqR/93gc2nQtdI9zI1ZAkyWymYabG+07/tFjC74mz/0A909lVSmy5yCx9bm89zxHOWFgjPtuhUnd3BYpXRIwoG0gWd671Q3ef0/GBClkD7a/1+PahEou1hvdQAKwdSWEAa4/rH99M9e0TZwrMqVZfBiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180025; c=relaxed/simple;
	bh=xtIy4nqk8bQ82LCRFZ+Vle42J2TMgfuzcBaF8xFdVOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8rjodioK13zvVwjVjvhRdXM+DOq6SyjsLKfejWHgA7SmQAY34OOaCx34Qb8ZUg4dJTeEI05onv2w19FseQK0Cg7xv/m8lDcsZwsJvwjHl2yrwDRBSikz4WqVYyYXZ2562Ho4gmIreNcyk8jAknfhxUJLOrR4JDdNBNtj+GbmJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZdwqqg5; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so9365303a12.1
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180021; x=1741784821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GV+1CN9mTm6W0e8GwrPdwh4pOa9jooWXILMnvo8a19M=;
        b=yZdwqqg5r5VEegxab60WgM4HkEPGenHiOV0M2BMbnoPsy5ZH9DxObbLYNgS8OWQdvM
         6TYE+qgMGMd/Jr2KaX4pYpibRVzWphZzDoP8eKoY4jlttgHC3MO78Yq5IDmO/h1Nn77A
         2kbPkK50yH8Ck3Q9UnvV5HSdXWqiE0qbkMsp82W7thkXenBRkxjg87HyGQs6OIx+Bx3W
         XkIgJOpznyfMY+6P9bSkyaklBl3xF2NFO2a5rDNel87R/BCAjdVMyc2ETIl1UBL8RQhS
         1O6UIZXSAmRGxbdu1SrDYPrwe/zsRvqaalDwFYEt8yi4k5wP1UAxRngTUQeU72lZ1A7Y
         msJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180021; x=1741784821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GV+1CN9mTm6W0e8GwrPdwh4pOa9jooWXILMnvo8a19M=;
        b=qq/GaRoB/r+4A2I+EfLnED6Z+9Ymnf2QHv/ExnJk/8AQVxqPbBdZJbA+CfJ5p8ZyD/
         WtzMYEoF2yDOWsAwHo0qLBtEqze4rrtz3bMzPITmFygi+0scVTUbZ2XQaBFre+ZnxRNQ
         wt+t1A8RWSz4XeywHJqxu1+U/Hz+OPA72FhU+tLO8+XFzzb781tcwOVjaxxWIFZGFp3b
         hMmi11K35jzZx8UoJyTIK1NzuJ+NgWSKgS8XOzoBinfwxq0ICLmKKYDxQXy1hqY1skaI
         3yolfEan/f9tEqZUFjT7+AfiK/flcNemio4METKqhGaRTPA7sVWbuxGVstl8yP94H72n
         BM5A==
X-Forwarded-Encrypted: i=1; AJvYcCX+sdGbRJh5v8vnAswreIEBag2Z4ER9eztjqHAFTB5pb8FjRqWhcS0aGRUfg2YmztpcJk6tNEea2Eoj4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV+w960JCeMHXMxurlFPtlwchs0zUHxemLFz6WHcuZkKg0HrTs
	K5Fbx6TAqXMjPM/fdmhew5hAES25U3hucdwJRys3WjmJZwCqBIW6sNO2mnrc2wI=
X-Gm-Gg: ASbGncthjRrAieTDuIkxUsY/vj8jqLPf7E/pz9/QPG/+jfYrhr0SzgH+35Hr53aQKC9
	HPWXZ/RTt3GKuRiDm5mAlZIHfR2bJPb4sIw556Ksm141xC5uddGVCyZF/Ax9Ydg4NON3HifTR4O
	+oyUW6d0UTdB5i6aLXNCqNw7crvsP3bRgKHbtSW+/BQnsE4qDrsWqG2MguXkz9Jycow+FaS4IUv
	9hryy5UBr64npqR/MoaAmivQre758xFxbcuV+wM2t32XyJ4cIZcn1LfxA7LGlxDwG8PzZJFU0Ku
	cRx9rfBUfHOTf0lRMW4fnA2u5VuOIspKGHRqS3167fdigfQbVPYoC6TgPGpvSbEwYkyeYG+yTjl
	csxkjobaJBS655P4FFaQ+uQ==
X-Google-Smtp-Source: AGHT+IFZCxWXYzGPaJ+Fpyr5pD44xJg3mO/vEGV3TFHnOgghMwA++b6wko/XdNnqusONUByGqiK4lg==
X-Received: by 2002:a05:6402:4302:b0:5de:dc08:9cc5 with SMTP id 4fb4d7f45d1cf-5e59f35eab4mr2661989a12.7.1741180021272;
        Wed, 05 Mar 2025 05:07:01 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:07:00 -0800 (PST)
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
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 08/10] optee: support restricted memory allocation
Date: Wed,  5 Mar 2025 14:04:14 +0100
Message-ID: <20250305130634.1850178-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support in the OP-TEE backend driver for restricted memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of restricted physical memory and a
memory pool allocator is initialized if OP-TEE have support for such
memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/core.c    |  1 +
 drivers/tee/optee/smc_abi.c | 44 +++++++++++++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index c75fddc83576..c7fd8040480e 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -181,6 +181,7 @@ void optee_remove_common(struct optee *optee)
 	tee_device_unregister(optee->supp_teedev);
 	tee_device_unregister(optee->teedev);
 
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 	tee_shm_pool_free(optee->pool);
 	optee_supp_uninit(&optee->supp);
 	mutex_destroy(&optee->call_queue.mutex);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index cfdae266548b..a14ff0b7d3b3 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_sdp_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_rstmem_pool *pool;
+	int rc;
+
+	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
+		union {
+			struct arm_smccc_res smccc;
+			struct optee_smc_get_sdp_config_result result;
+		} res;
+
+		optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0,
+				     0, &res.smccc);
+		if (res.result.status != OPTEE_SMC_RETURN_OK) {
+			pr_err("Secure Data Path service not available\n");
+			return 0;
+		}
+
+		pool = tee_rstmem_static_pool_alloc(res.result.start,
+						    res.result.size);
+		if (IS_ERR(pool))
+			return PTR_ERR(pool);
+
+		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
+		if (rc)
+			goto err;
+	}
+
+	return 0;
+err:
+	pool->ops->destroy_pool(pool);
+	return rc;
+}
+
 static int optee_probe(struct platform_device *pdev)
 {
 	optee_invoke_fn *invoke_fn;
@@ -1715,7 +1750,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1788,6 +1823,10 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	rc = optee_sdp_pool_init(optee);
+	if (rc)
+		goto err_notif_uninit;
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1823,6 +1862,7 @@ static int optee_probe(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 	optee_smc_notif_uninit_irq(optee);
 	optee_unregister_devices();
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 err_notif_uninit:
 	optee_notif_uninit(optee);
 err_close_ctx:
@@ -1839,7 +1879,7 @@ static int optee_probe(struct platform_device *pdev)
 	tee_device_unregister(optee->teedev);
 err_free_optee:
 	kfree(optee);
-err_free_pool:
+err_free_shm_pool:
 	tee_shm_pool_free(pool);
 	if (memremaped_shm)
 		memunmap(memremaped_shm);
-- 
2.43.0


