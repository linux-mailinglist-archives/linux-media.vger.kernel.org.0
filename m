Return-Path: <linux-media+bounces-39734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6703B240FD
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46FFA2A6768
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 06:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75B32D12E7;
	Wed, 13 Aug 2025 06:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WRcDyVjh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF43A2D0C7C
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 06:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065049; cv=none; b=ut8VTXfevr5m3AAzjLrwyAc07OC0ozmHstx7Gc5XMdnXdDndDFlhD62zYMw/RFbKrY/4WI0LYAc2dRRbfLElNE/kjMAKXUH4NwK18ExWsVT2CS9zeenUVu6US82dIpdt8G2gVDqu6m/rmpZ5HsVMwOPZdBmolYHbNozNu6QBH0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065049; c=relaxed/simple;
	bh=AIJlgFk7fUjfn21LDq4M47dl0OPLcCvx0c6kQCRqWw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GswUatx/jbm38AWV+8Tz7R6GXPkPYqmX9jIU8UF6XUT6cSL+TV4geV3f5dwACdRSJtHi7byv0v8Y8DFevV+pDHhib3pLUt2axX2aG67RuoquFz1zA65bhg0Xu+oNHTUm9w8IGTTKqKc1DJYqhMAQgZFE2Q+EBwxbaDEfk14VsGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WRcDyVjh; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso8684518a12.3
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 23:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065044; x=1755669844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mlsk/bAk7ySrKDp6zbKeV5kpDxvVSbwlV8t4Q8Bml4k=;
        b=WRcDyVjh9hn+O2un6eYqge0WRHZepwsW9Q6T4HD/PNp2r8d8fgAp19ehYj72zEkxu0
         jUOgMxaxAj4rOrtiVZKj+vgcQyds1famOY26vTfJDWlssxyKUJIkbAk7VZqcfiTTP61v
         5W4GmowyXCN68a5C+RDYU7DasbkmWngzqQdiPQqeAq1vs/usjj/hVRyFUyi69TJ12yKv
         Bq+T+Hp/Fg7kxwVqej86rAghzSRkRi80ZRHvASpMFdt7t8XOI7msR13C6XdaCMwMvl7v
         32LJ2Te/cy5LSShhypUFQ6wThL3kBaC0CKfO9d71qqAwjO0bqgnjRmewOiLZJC3nxjgM
         09bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065044; x=1755669844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mlsk/bAk7ySrKDp6zbKeV5kpDxvVSbwlV8t4Q8Bml4k=;
        b=OKgsI/KBEKRMVvGuxEXNsUS5+mZHAanK2U0HN/bPHMwOAMQdFcsJ4pCDVyd2RzYUTt
         abxjhNFo5RPYpIf223aBGtmKGuKYA93/DU04g5VSmO7d06A0YY7+keYM6oAMe8AmaViy
         mESade2k3TlVsANDFXgu0OS1kkguIEbZ2ryCW10lVqW1GyzW06Fs3prQ7XQf3pYMDOz/
         jdYozvmK4Ju/3p121wuP1yIQpGMApWI5Pip8HJeDXOit/MNQqy0asK3xtJ43Y0elUWdU
         7rN8+UN2uyns1MLc86yyzAY6/VLfxwCVB4cihD4u9blxYgdalo1l8173Yr6NNGdGLWvf
         BVpA==
X-Forwarded-Encrypted: i=1; AJvYcCUNSub7c+nFLzo2salhbH+W+Y7PHQCxd+NRVqsSHMoRZI7yJ3S34apzb1nxFuN1V96JimxA/RC7Gl006Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy18hGLHFjMmZirB9sqzozymzYV559HyrHhVV4PlseYOiFXwqL1
	1/hqpLQi3oMDGF7bOLMLQFRinGe0gQnacz06WZ4C/4H9PLFK52UDzk3eJcE44O+vBDs4uFNLQw8
	HyxstRWs=
X-Gm-Gg: ASbGncvrZ87SncHJDHQ7HbZOtoGYpz2Xopvwd1L4m/jYdcrLmihh8cZ+zUEykuDovRs
	R8ltmaLHxQIooUcxYdkgOCkymsy9OEzyjne8GSesy//kResHS9HnNDAUU24M++wmQOZvX4KN9FH
	mR86AAgOxYzmoKQNg3NRCQ+mmfsG6L/+MxM4RaH4/ff6T5Cmyl9alDaFL8Qpur4mRBWSW6J4O2o
	M4Tvxu77VV8sAzNsxofYn54T/2LQsP/JJUfD7HgHHSGXjVV0ZP0r1HgXIbpumYo2/w63mvMaZrT
	nom50KqjlmivECYoRn+nSDMeiM7XCnuWGryjFb9qb9GlkfCnT6VpbiEv4e1DrLSMeqhYlIdCo8c
	Ltxn+z2LgxW/XfJVK/sYvwnf+xK9mE45I7gOQtAX0nLpzz1cBoEi0lx0fFY/8lNwuxzAn5pfZxz
	8=
X-Google-Smtp-Source: AGHT+IGPP3R6N4Dt8iwgkksibZ5tUqdsMY5R2I3knc3e7zzNRFbaVSRs5R96bdCj/pA/8Zc73+XZ0w==
X-Received: by 2002:a50:8710:0:b0:608:50ab:7e38 with SMTP id 4fb4d7f45d1cf-6186bf92a89mr984962a12.14.1755065043966;
        Tue, 12 Aug 2025 23:04:03 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:04:03 -0700 (PDT)
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
Subject: [PATCH v11 7/9] optee: support protected memory allocation
Date: Wed, 13 Aug 2025 08:02:56 +0200
Message-ID: <20250813060339.2977604-8-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for protected memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of protected physical memory and a
memory pool allocator is initialized if OP-TEE have support for such
memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/tee/optee/Kconfig         |  5 +++
 drivers/tee/optee/core.c          |  7 ++++
 drivers/tee/optee/optee_private.h |  2 +
 drivers/tee/optee/smc_abi.c       | 69 ++++++++++++++++++++++++++++++-
 4 files changed, 81 insertions(+), 2 deletions(-)

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
index c75fddc83576..49ccfe6f6583 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -56,6 +56,13 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf, unsigned long action,
 	return 0;
 }
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width)
+{
+	u64 mask = DMA_BIT_MASK(min(64, pa_width));
+
+	return dma_coerce_mask_and_coherent(&optee->teedev->dev, mask);
+}
+
 static void optee_bus_scan(struct work_struct *work)
 {
 	WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 9526087f0e68..4969b83a9851 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -274,6 +274,8 @@ struct optee_call_ctx {
 
 extern struct blocking_notifier_head optee_rpmb_intf_added;
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width);
+
 int optee_notif_init(struct optee *optee, u_int max_key);
 void optee_notif_uninit(struct optee *optee);
 int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 26f8f7bbbe56..b4c007ed3b94 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1583,6 +1583,68 @@ static inline int optee_load_fw(struct platform_device *pdev,
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
@@ -1678,7 +1740,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1751,6 +1813,9 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	if (optee_protmem_pool_init(optee))
+		pr_info("Protected memory service not available\n");
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1802,7 +1867,7 @@ static int optee_probe(struct platform_device *pdev)
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


