Return-Path: <linux-media+bounces-32935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C117ABDF25
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 17:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1A454E2846
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C3A27B4F2;
	Tue, 20 May 2025 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6GI5l4s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A0A26F45F
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754697; cv=none; b=bJ4HPA8LLcATHSN6qFh/AUu/1HTzeCUE+4KrGozBGTxSVgrIoR8T1TS1v45IS0Hb7zB6mV4LU1a4CescBijQcG7TcTR7hoT2bA5YtAhITEnjrD2Fb3UJUam5XzVv1QEqFQfBp3/4GlK58Sd3zhirxrK6AshwpoOJcCogucBxY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754697; c=relaxed/simple;
	bh=QSxT3XOERXLFCoM+NCGjky7MuvldTHq1E3lqJiBK6rM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oApvTjrQ8yA25y7Tvi8rC5VZ29u6Au+tSeQUyIaRb8MvWbkTKqGboPj2y0VyMoz2X6BBPKbl5NCDmeVuIrZNxwbk4Z16Jze6wbVaQIndpa0u2aULJgCB3LFalXdzP10cIODGmdRTHdC0UiYs1kNymRQ4yfm02eLWxMd5/eUtunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6GI5l4s; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad564b7aea9so492557766b.1
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754694; x=1748359494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bld2F8yZ54kGs1+iy6D0HdLuVG17oYynXY/XfJVpzy4=;
        b=I6GI5l4sU7cE01SA7rvfnPHwShDVotteWSKnOwlUIRPiOeF4AMjox98VKXuX4fEb6T
         OmPpBA9sRsDhqRg82MuONpbKa91H/NPVmmMxBWjLEcX7C79UPDAAbHsacKPklbCFn7xK
         naW74iCofyrpMLWvXaa9KW/G8unxV+5T2Z8aSqRE78cwQvdl+3QOdI/IwEr4YW9V/dLv
         OG8sSDIxNzEYOZVp4cVdamGGZvK0C6QB+bCDqy5QsY72hGKDpOuwNjS8WKV9RY91i1UT
         aVixDxIyb3yom40zKBRb4Ggl02h9RGV3gxlSNZ+09KPrvP4u7G6i6x/gaaXRMew2JhWz
         r70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754694; x=1748359494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bld2F8yZ54kGs1+iy6D0HdLuVG17oYynXY/XfJVpzy4=;
        b=IE3jlsj70/Yy2JNrr+zX0EoZii8zpFhwTn877Fyh3gJLIuYwqyZ0GkMcHbPY3OaT1b
         lLHq5eKuIwNv+PmvjssE2T2W4whcxERkQp4pTf8pXIdAhBCOs9GtT7658vbKZqtFQt4j
         RVbCWjjKLQmlapjTjvj7RsxjK0ATbbZKtQPNsJ6yOig5VQPwwym7oRmc9PVVux0bOmf8
         oAYZURoN3i/aKYcNc8drShT0X3Cxw48o9847YqJMHbVzx2vGOm7VlVs8nEWyTkIdfWwn
         48G0YSnhaHLz1kAzhKZnQ1IzlFpt1EO598ndkEfkHU5kn8DdIHLBPMZXYh2SMuMWx1YX
         UUkA==
X-Forwarded-Encrypted: i=1; AJvYcCXRFu5Gczov3EdMjaYa+vTlVupkcmHZyzQXfAR/WhefDOegAifqi9cVOkwRnUVey7RwwU0VLSiBNU/3Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBwKq8hRURnQkY58rlwGZsEWjnwF/um7ZHPJ0e4Y/FhG8+37Mh
	re/MjLiar+wY3X99XdixzDhIFabdZlnLd2QPGb/XAPnKMTJyfyKSpveWUmQW0eRAIVc=
X-Gm-Gg: ASbGnctUNnc9h1Q9yA2GpoLel23neIIxYWeSRUZGbjQNXQ0YW6YOwBgwDQrQyKMckI8
	4+QrnwwkGrw6TIZus3HDoVXe0ExWtMlVJkeQbLb8X4L+MRMcs4jm0X8fjR2J3g3F3Wb/5Qx7OGm
	YSNzDKfPvnMZaZM9WDTyUr/tGZj7tHw+lfGCe9rlysvxqSdRIPtKwLuVHqK49+Q+r+hSmPR/3p4
	yUOf5zwUWEobtnTmPZPO+9oKPtaP4o+5d9t9Wua7GQA30YmyQMay6fReEdA9u0MuS0ww/eheiPU
	OBAPgjMqW4/XIwSeYd9btVqzhH+5w1JrNA349yZKZlfNjRgU65Lt2LeJiyv9wtqNfdMKVh0FNDE
	dtjNxW/2B0ci/yo5e59bU3F/CVtAm
X-Google-Smtp-Source: AGHT+IE+oU//7EkaWaSVnBEAmENTiykO6EjOUBrIKYl9jX9zjcRr0m/0LP96+ZckH975FqdkGFgQKA==
X-Received: by 2002:a17:907:3e28:b0:ad5:2d5d:206f with SMTP id a640c23a62f3a-ad52fa567ccmr1750869866b.19.1747754693784;
        Tue, 20 May 2025 08:24:53 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:53 -0700 (PDT)
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
Subject: [PATCH v9 7/9] optee: support protected memory allocation
Date: Tue, 20 May 2025 17:16:50 +0200
Message-ID: <20250520152436.474778-8-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for protected memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of protected physical memory and a
memory pool allocator is initialized if OP-TEE have support for such
memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/core.c          | 10 +++++++
 drivers/tee/optee/optee_private.h |  2 ++
 drivers/tee/optee/smc_abi.c       | 45 +++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index c75fddc83576..4b14a7ac56f9 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -56,6 +56,15 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf, unsigned long action,
 	return 0;
 }
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width)
+{
+	u64 mask = DMA_BIT_MASK(min(64, pa_width));
+
+	optee->teedev->dev.dma_mask = &optee->teedev->dev.coherent_dma_mask;
+
+	return dma_set_mask_and_coherent(&optee->teedev->dev, mask);
+}
+
 static void optee_bus_scan(struct work_struct *work)
 {
 	WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
@@ -181,6 +190,7 @@ void optee_remove_common(struct optee *optee)
 	tee_device_unregister(optee->supp_teedev);
 	tee_device_unregister(optee->teedev);
 
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 	tee_shm_pool_free(optee->pool);
 	optee_supp_uninit(&optee->supp);
 	mutex_destroy(&optee->call_queue.mutex);
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index dc0f355ef72a..5e3c34802121 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -272,6 +272,8 @@ struct optee_call_ctx {
 
 extern struct blocking_notifier_head optee_rpmb_intf_added;
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width);
+
 int optee_notif_init(struct optee *optee, u_int max_key);
 void optee_notif_uninit(struct optee *optee);
 int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f0c3ac1103bb..f3cae8243785 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1584,6 +1584,42 @@ static inline int optee_load_fw(struct platform_device *pdev,
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
+		rc = optee_set_dma_mask(optee, res.result.pa_width);
+		if (!rc)
+			pool = tee_protmem_static_pool_alloc(res.result.start,
+							     res.result.size);
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
@@ -1679,7 +1715,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1752,6 +1788,10 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	rc = optee_protmem_pool_init(optee);
+	if (rc)
+		goto err_notif_uninit;
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1787,6 +1827,7 @@ static int optee_probe(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 	optee_smc_notif_uninit_irq(optee);
 	optee_unregister_devices();
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 err_notif_uninit:
 	optee_notif_uninit(optee);
 err_close_ctx:
@@ -1803,7 +1844,7 @@ static int optee_probe(struct platform_device *pdev)
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


