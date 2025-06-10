Return-Path: <linux-media+bounces-34449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B39AD390A
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65AD21896BC7
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D522D028F;
	Tue, 10 Jun 2025 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRmXFIvy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9812BFC7F
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561386; cv=none; b=oyph7CW9XSvvMMOmRpS+mvodUqDsesqDlAl5as7rDVhYp6kvdthKGP3X2IgwDKGMq1l4IcncNugPYohSjCxdMGIenuS4dwrrrHv5sCMLcOoNf7BulovL2f1OYpEwZCxj8nAWq+udJYqf79tX+2SWUa4Uk2rYEuMRnsl+uL/i4G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561386; c=relaxed/simple;
	bh=5UwVZIJDxgCN+xBsOIv6QYV6z9KChYCgV/TMz/0vRds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDO2WEd+yjIWHaIn8RLG6c6F+VUFT0XWKn2g99JpLpWHOwWjaCQ+0N1Rp+4QmTFYxRbwnnsias0Q0D8POTXx/jtj/rV8KfeRV9zQKdcpOEJIuYBbeP+6FV0Baiwx/36WjmZMYhhRusB2DfE4/xJzAZMVeOykU1Jhq7PdEf0Sl6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRmXFIvy; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad89ee255easo981696166b.3
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561383; x=1750166183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLopRTDSnVY9U0JoSkY1CPfa4nNPv8DwxUkmGK1mPDY=;
        b=BRmXFIvyRyCqohouBDBLGTHL/Sv7/0Cu9HT3ZzyBVgWbRRPt8+4U2rF4NFN6xhkQLp
         hA0rXoMFsj1qpLymibHUjDvI9jBCuAuyOalKCMSV5Ornf91Jxc2/T67NoSZtTvaN+zpy
         pWaPEyauBwtrDZwmujNEaog1VvZlZONdXK2gBx9KfsAYBQxs049RZr2ZEertD1u/v+v+
         HpvqIPacwrrbLcV8wtJNeQuQ/jXzj5BAd0Z5jSW3v6khNahDnZIpHrm2Q1VYGnawzwKE
         1drUkPUndf0ined8JZZaYgE5isQJ3KTEYmZMvZZoMIexD4wvwmst7qXQ/+5LTWux9R50
         ek7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561383; x=1750166183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLopRTDSnVY9U0JoSkY1CPfa4nNPv8DwxUkmGK1mPDY=;
        b=JMrOh0eB6hvajjHbvvQzvDtpRW+vSaDUkxQxnwcUGNvsCBhTkOe11QI7L7RXXJ5csM
         EuWXwytFzRgu7APG5JCVC9t6j22t8u2R+f64BfjAVGV6xfiMleAMQccHLfNy+WCGLquC
         Wfa/CBV/tqOhoaCaGfAnx6gTUwGtfOWB+UZ0CZ4RqAq9b6R6xWynQohyVD257tTde64k
         c7yD+b1MJga1EDSNRUPVITBEW8ZzjMcb7rfHC2CfLbhVOtZJ/LbODoU/mbP0TGOE8qUW
         0V+pv99VwEWLOAEwBfrP7vU63uVUKNrb9CeiEegUPL+amP/8+ZYqk8TgwQqEjZJgMdkH
         jEtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC6NlkQovmemepSilKGB8MU8FFEQWt2G3HgxOR+yf23qM5M5SuhCd5PbfT8lebYSEQYXrDR/Sr72Tc7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3s8RRcEm8FY+k5E1nPT4S53zDlu8QaPwrVR+fhUrafmSAgo+V
	1XdVwW47w7TbHAdyqLNw0Clz4aTyPwY1hrkcN0CxBo2GGk+q5rmadxiOdUfRwkGdxHtoudyY8tN
	Rpmcl6Hg=
X-Gm-Gg: ASbGncvrCvWQlCnUpC8sof62Xval76oRhKgQ5hQizsgruR6Qc2Eij2JRukDKLEkA6LR
	zU/9Au2CjtrFI7ulxp5lqf3vr/bqVPI2w37xXFPfmsHawTF9hBxChdLbFElHhv7QRo2cnOM0gFl
	wgh3Cs06z79W2XxWlaVJ9bQj1ad/O1+l9u0ZIRYXXQ7bweqsxafG0qn06qo2TaVjhmDqL088xB1
	Z5IZUd/7NxRu2m0H8oZczsi6Qil5gLEOFCEy+YtSXwxRELP2eyvWMLa2kPpE++h1O3FQ73nAs41
	MNvVlP4O2QNejobOIQ3SHvHX9iEGSlXviRVRozmEK44b3onJ3acoHbdNR5c0fuctIADSnvm4PnP
	mFv0VX4lEpmtgnT7GqneGBhYl+VpK3sNiAtDUTjU=
X-Google-Smtp-Source: AGHT+IFyL5VC1uzluSvFg2VJoydHPgfSnA6phexiqPEMkd8jHiXUwY4vJhu2YNpEpylX50vqAtDFrQ==
X-Received: by 2002:a17:907:7fa2:b0:ad2:3f9a:649f with SMTP id a640c23a62f3a-ade1a9c8022mr1430120666b.42.1749561382805;
        Tue, 10 Jun 2025 06:16:22 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:22 -0700 (PDT)
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
Subject: [PATCH v10 7/9] optee: support protected memory allocation
Date: Tue, 10 Jun 2025 15:13:51 +0200
Message-ID: <20250610131600.2972232-8-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for protected memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of protected physical memory and a
memory pool allocator is initialized if OP-TEE have support for such
memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/Kconfig         |  5 +++
 drivers/tee/optee/core.c          | 10 +++++
 drivers/tee/optee/optee_private.h |  2 +
 drivers/tee/optee/smc_abi.c       | 70 ++++++++++++++++++++++++++++++-
 4 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
index 7bb7990d0b07..50d2051f7f20 100644
--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -25,3 +25,8 @@ config OPTEE_INSECURE_LOAD_IMAGE
 
 	  Additional documentation on kernel security risks are at
 	  Documentation/tee/op-tee.rst.
+
+config OPTEE_STATIC_PROTMEM_POOL
+	bool
+	depends on HAS_IOMEM && TEE_DMABUF_HEAPS
+	default y
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
index f0c3ac1103bb..cf106d15e64e 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1584,6 +1584,68 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
+{
+#if IS_ENABLED(CONFIG_OPTEE_STATIC_PROTMEM_POOL)
+	union {
+		struct arm_smccc_res smccc;
+		struct optee_smc_get_protmem_config_result result;
+	} res;
+	struct tee_protmem_pool *pool;
+	void *p;
+	int rc;
+
+	optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
+			     0, 0, 0, &res.smccc);
+	if (res.result.status != OPTEE_SMC_RETURN_OK)
+		return ERR_PTR(-EINVAL);
+
+	rc = optee_set_dma_mask(optee, res.result.pa_width);
+	if (rc)
+		return ERR_PTR(rc);
+
+	/*
+	 * Map the memory as uncached to make sure the kernel can work with
+	 * __pfn_to_page() and friends since that's needed when passing the
+	 * protected DMA-buf to a device. The memory should otherwise not
+	 * be touched by the kernel since it's likely to cause an external
+	 * abort due to the protection status.
+	 */
+	p = devm_memremap(&optee->teedev->dev, res.result.start,
+			  res.result.size, MEMREMAP_WC);
+	if (IS_ERR(p))
+		return p;
+
+	pool = tee_protmem_static_pool_alloc(res.result.start, res.result.size);
+	if (IS_ERR(pool))
+		devm_memunmap(&optee->teedev->dev, p);
+
+	return pool;
+#else
+	return ERR_PTR(-EINVAL);
+#endif
+}
+
+static int optee_protmem_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
+	int rc;
+
+	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
+		return 0;
+
+	pool = static_protmem_pool_init(optee);
+	if (IS_ERR(pool))
+		return PTR_ERR(pool);
+
+	rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
+	if (rc)
+		pool->ops->destroy_pool(pool);
+
+	return rc;
+}
+
 static int optee_probe(struct platform_device *pdev)
 {
 	optee_invoke_fn *invoke_fn;
@@ -1679,7 +1741,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1752,6 +1814,9 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	if (optee_protmem_pool_init(optee))
+		pr_info("Protected memory service not available\n");
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1787,6 +1852,7 @@ static int optee_probe(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 	optee_smc_notif_uninit_irq(optee);
 	optee_unregister_devices();
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 err_notif_uninit:
 	optee_notif_uninit(optee);
 err_close_ctx:
@@ -1803,7 +1869,7 @@ static int optee_probe(struct platform_device *pdev)
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


