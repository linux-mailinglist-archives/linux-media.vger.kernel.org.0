Return-Path: <linux-media+bounces-31571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4636AAA6EC8
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A3323AF59C
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 10:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2612254AE5;
	Fri,  2 May 2025 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YrBsu8dj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6699A22688C
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180079; cv=none; b=MP++AIvWsG+VcsofkM9fLmZoSy5BCei/XbYalNHHNVJItCssoq2l38JeJZDclX0nSZkcSz9yoEj9/LYXqNesHhR7nWpD6Rwl203k6iVR1lxInZ5SnD6pZDDP3Ay4Jec1zGPGNr83l4olketsL6IINVFklTbNd14W+nkfgRY8Gjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180079; c=relaxed/simple;
	bh=qWKjVCqV0w+dT8t2+rlJ6OZyMHmR7QzWxO1E0IapEGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFyMaKDYa6B90uGvnq8ZYnnKU5WJFEZnQQrDSW8jSosNFb0GYrKtvUuRJBLrP97a8cbkdtkdZQcaGbFG72d9kRaBn9XCZwnfxYegUwwGgJWHfjpc6VYNlFOnOa08uAaW1gRFRnUM/y4hG3dEtRINHU2HDKWrDOSWYWcSnxDdMvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YrBsu8dj; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb2faa9f55so228645566b.3
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180076; x=1746784876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeQOjVkq3EBC9GxZGgQiApE4KnUvSm/cM8uXSgvbEb0=;
        b=YrBsu8dj60THQ/lLgnbDxxj0ytkW+IB699DwzR4kwPi7K32LRQvG3Mt+UruelwfMDb
         KQa0boXjpXFUsqFezckawUTcGnrTSOhxWtSaYPvCAlfGKv3LSsvFfNb0ixrmqymAem+P
         V0CfDS5sg1oE3e0gPtzRR0aBlZD5FWem2yzvcTcwtN/95W8JVe3fvb4B/aPt3lUpUiYQ
         CkrxI2plcVNMz+5FkcZReP+6FoP5V7j7Pa04mir71WOGOjHr4JwOi6ydPQ9JAnKMdBXz
         t9A6AroV329bAcSyqF5kQ0a2dntQuAuanwwdSsHt/oX6/XLjGPjIGe5biEstzbDVo1KU
         CMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180076; x=1746784876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeQOjVkq3EBC9GxZGgQiApE4KnUvSm/cM8uXSgvbEb0=;
        b=QmcyYD7aSFd60KQZtDJBG0/C33ah2aUM+8pZFk2fGrZotRCua/To35pmSKUTYE1Sus
         xRs2XkUCkReg/9B0YXz9gmTbK33MOMlAPehfBH0kmXnGiV3GBNt3GfYnxV/JJIxAmgDx
         ESP39Rdj0nt28qeaECmNLSVgfZWh7JJtvSzEtPSWWbPRvbPrfYM/VqHnTj/cpmSjgd/K
         aa/JyEb62YRUKR4sbyWelEwa/4Nhon8C0eqfLMGzsxeji5G5Myc/InVwBHnuJJsseowp
         X3R+P8YYemhuFxwhHh9SmlAHlRt+hGiGcWeOPHaxFOXhFkgLL+YnR4x4Rm9gQTmSww5g
         h2OA==
X-Forwarded-Encrypted: i=1; AJvYcCW6qfp53/42Qigx9Cxmg7x0Yi1pWljBrXnbek6js6LNICEdk+RduPS7b16kTZG/hZVuAbu4tRhV+gShFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGs5bX7Bt8CV6Z+s14QlrWfuKVnfCxmnIekORKocoDTPLSFnaw
	ZafmK6WEmtXwKoHjHuMbEslEoRxqofgnqia/ilhASs7d7piAmkopQEiCHSWR5YA=
X-Gm-Gg: ASbGncsHKhTUQ8/DwasFrmlmMUyxURBIOM0BMvOeWr86uaQAxrOXyb0tfJh6d3voCUQ
	ywLblpHS8FoWjD9voUrGHzbJQqHq8W85ZLj164z/piVWx91PUO+1N55DQk0/ThXh2xaz+UGIBeS
	nRI42rcVmrHYpEfJxhX5gvl980j6tnKHu69HvilJ29C60gT5+n3v6ETdd61dbKziGARKkREG8w0
	sWtPNkuhCThoFVt+TVt3HNxYtyOmmpBQn50LAGfdvx3prrsheJEPKLcehBfrmvktmS3HccJ/hpH
	MjbA9xn4D0GceMXpUQufKImt3eCgmi2Uv/w21saocct+tz+D0VMiK61Fh6gyw8f5LIgKmxBFmB9
	BzetxOfYHiuFCdTEOMg==
X-Google-Smtp-Source: AGHT+IFF9zknIP+dqaL1V+FMTT0LVPgHDeyr+aipRO30IcpUVrj2BVxgOIBN2MQg2BYB/rbfAelPxg==
X-Received: by 2002:a17:907:96a2:b0:ace:3c0b:1947 with SMTP id a640c23a62f3a-ad17ad39db1mr215652166b.4.1746180075654;
        Fri, 02 May 2025 03:01:15 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:15 -0700 (PDT)
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
Subject: [PATCH v8 12/14] optee: support protected memory allocation
Date: Fri,  2 May 2025 11:59:26 +0200
Message-ID: <20250502100049.1746335-13-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
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
index cfdae266548b..7acb43852c4b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_protmem_pool_init(struct optee *optee)
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
 
+	rc = optee_protmem_pool_init(optee);
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


