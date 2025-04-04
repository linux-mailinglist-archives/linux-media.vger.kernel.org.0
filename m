Return-Path: <linux-media+bounces-29406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C58A7BF77
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 16:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA24617B256
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 14:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086641F8738;
	Fri,  4 Apr 2025 14:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rrGQLYVa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810311F76B4
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777165; cv=none; b=gS3DSHji7rO5Dh/q8+wcqqXgX2udwBXFbjE2iam4BQWxTBI6uNJqhmBooPrRk0WScnyzZd3nV0cuw1jkGyE8VkU7FCOHSt0ZIlhLdxpDLqAf4E4MYpG5YyKyZ6E16vWTd7wmPcirxBf5E1F1sdpsjfWOmL2bwdk5yC7LRg/ZJSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777165; c=relaxed/simple;
	bh=zrFJZPMQUAiOjSEiHKHv7pGInMwAQy09WYmg9hEUSrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oq+ZD8nPDFx2ws9AngtXk44LArghUwN9vv6KGcTViHEuJjfRmPqAzEObLijE7nS/UPDqbdLz6r7hWT23QSTLXL4eElIxkYnMs/vb0KSsRf7X7AeWueLekww7CKsqmqV9sKOdxZmRlmQ/WAtXlMjldlMFVqwebP5qp1T1Rv17RUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rrGQLYVa; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so3974465a12.1
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777162; x=1744381962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqVUo9839x0Dz2BO0CX+S7eZwnYbMhFJhNNlz9OFNHU=;
        b=rrGQLYVa44eJrFGWp34Bq9/yY5Aa1Vob9zzUba4Qk7m6QzmnHj8vGcuckHqAtFLTnc
         WoBVEAxbos6KOTP9X0LxxR5Mhk5l+yM9CWs3KrcQBWeV5Ptf1kZuwTH4AFyHhEJjOGVM
         KaEb24xZTMvfBdez5ZTk8zIOdYZABJYr1h6YUcONlfOeNz2FXg1Qez/qaRh18An7p7JX
         wojOaWKHJ5fGuWeUna44dNDvrltENpyVxyku+pXiq6k4NNhk8Lfjx/9FUptRusbYRbHV
         tJSOphQgA+DQnpZZnZBJ5mqxhYq34cxZvwQYgd8KZ5LdFlKK8I9f1PKwNSs3hpJ9IJRj
         MwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777162; x=1744381962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqVUo9839x0Dz2BO0CX+S7eZwnYbMhFJhNNlz9OFNHU=;
        b=tzdnR/PYEV1b9t+k7DKhWs+qDFBp9mVy0dDgJ0aJGQW5pl5FmTaqMIuh5mjhaad00/
         Kg/PAEZ4q1YO3FdgxWJ/E0JdUDoQKNNoBbMGDvNYE/RdGyyufWPJ1vAOd3/8qXFKQS/F
         2gWznOdke/L4xBdj6RmyUfVKstW6krmzM9a5O7rUhknX8Kjw7zI3xy5tO3N92WbYX2cJ
         M2NEsiakB8h//5Aq6lNMwE1uOq2SF/IS0KSq8UWhWw+VdCnMmSzokMI9mz5mbcwDIkVd
         MyUG120Go8mpPtvXyR+cBfhDUQF3XtHvJDlG/2+yEA0RHUoWGKxGsVVT4hlwRo+zRWfl
         3Z1w==
X-Forwarded-Encrypted: i=1; AJvYcCUGsDxf60usERD6MFWvM31NIH4uHeDHVI5OHQkt2mwgsP0lnG0Djp5v0Csaqt/UcJv0qrrPpw2nrLjiDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0aQGnqdgbOS9QvT1XJXF+Jr73CPuL9V3GfCJlNiNOlyxrwt09
	xuG6aVSj6vyfrots78uezYrgTMeG2tmq1jBvd8lVZjLgbdw2g42i/C9QfZgr13s=
X-Gm-Gg: ASbGncsa1i2Nl3wpaW1yLnOlRZsNWhQ4EV3FeNPU9gH4bTILI0olHbzMHdD14sRjPkM
	zNSqFcWaTLNuZaFFDudsYft2EVRZzqJSCGWRC31FBmgmCTycXXZ9MP4w+H/Yw7hJic/eUTFXAQN
	4Wdx7uz8brUxicTn+kDR803afB6V1+GpTZyjNB9YHJ6zCVsC5nn/skrybmtX1jG44LbHPhWeJjn
	pcNtAVoiJhQvxq0jhg0AjT7LlZ/D7IKMkrpMj6NYS9zA4Exz1v0uXvjXrSou9Rq1SezE0FKxpZ8
	bDxfxoSkvbelnUlhtYgvUwdGxCEQRiu/63MiC8J4UdrUpW3zs7P49GwXU5gbwa/mH6sYcecG0C7
	PlDjyegv8RHa6tEK8g9/VcA==
X-Google-Smtp-Source: AGHT+IGI4VswEXbkr8wvPcpZqZzKqeC9kMo0saIbDftZfl+T9cBHd+BN83SFjwOfSSTztOoIdlkUdw==
X-Received: by 2002:a05:6402:5cb:b0:5ec:cc28:1a78 with SMTP id 4fb4d7f45d1cf-5f0b657a59dmr2556677a12.20.1743777161950;
        Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 09/11] optee: support protected memory allocation
Date: Fri,  4 Apr 2025 16:31:32 +0200
Message-ID: <20250404143215.2281034-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support in the OP-TEE backend driver for protected memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of protected physical memory and a
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
index cfdae266548b..c10b38b23586 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_rstmem_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_protmem_pool *pool;
+	int rc;
+
+	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
+		union {
+			struct arm_smccc_res smccc;
+			struct optee_smc_get_protmem_config_result result;
+		} res;
+
+		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
+				     0, 0, 0, &res.smccc);
+		if (res.result.status != OPTEE_SMC_RETURN_OK) {
+			pr_err("Secure Data Path service not available\n");
+			return 0;
+		}
+
+		pool = tee_protmem_static_pool_alloc(res.result.start,
+						     res.result.size);
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
 
+	rc = optee_rstmem_pool_init(optee);
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


