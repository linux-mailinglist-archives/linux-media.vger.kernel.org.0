Return-Path: <linux-media+bounces-42347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F9B53486
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B562E5A3E72
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF64338F30;
	Thu, 11 Sep 2025 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TUvJxuM4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FC3341ADB
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598655; cv=none; b=IVQCXsaqNkWpEyJEXkf2DvqdRu0t2DMDshis7GJpj48xFr0l3Zg5fAn0JzkIYYT1kysirjvyzw+xXZRyskOxIm7P2pa3pcqqOPJa7Pj9bE4mQaQAkjeWrMZ4AL0Cz5QZdXcCAsjPGyCF0CDXgnn5zUsGktinqDMQtLKLtDH8zao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598655; c=relaxed/simple;
	bh=sQ/l2bP0mTeojthGX/AWBBFSxz1LKDRMF9Unjz3DfpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ij6/ih5Vt8ro3PHunfpr04GvmwPZNBtHdJuBfrU1Vr0KdHgRMmYXVqHJm7zK6PocyJuMlmMcqMI2F0oGsMT06NrS/4xupe5oee3xzoWMcFbr2MBldUaacYJ7tJSu7+MUiNBNs3a9g9uwLZMGb3wa3t6YJyUGUKsMi+XHen5SJUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TUvJxuM4; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6045eb3848eso430642d50.0
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598653; x=1758203453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vA8l0L1pnbhQj/VVM6tv+d6BLx7uJN5MQdkMqAYWy2o=;
        b=TUvJxuM4/SyQjYFPqJdMMx/QoYIFpgbU52MI0ksbmKIwwaGdY7HEWDhx3vbHcYOhj3
         +ZgCId5Hm6rLjVS65X0/yqu07cdpSBZ4iCqG/g4HlY2qBnq5Lxoi4D2/0UDHV95/ax8e
         pJ9+P+UK+mxBXSZ7kXxntatcO8XonfJBUdEhrmk6gH4mbDUpZFVwPgJdCcyIcY3EVhj0
         dc4ocCFHeO0v9yTdLO+s6IcpPaTI7jd2wLM6sQJRq57vOuSiMImcCXYX1XSDNsp2bCH0
         ymcnp+qxZG7Vq/mFy4HvKX9rdKmzKjg9rX6t0I7xws4N5Pys+NRC+qgGRYmsDq/w/ib4
         jPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598653; x=1758203453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vA8l0L1pnbhQj/VVM6tv+d6BLx7uJN5MQdkMqAYWy2o=;
        b=ZStnYuun/XO1BRV+ET67IXbi9wyFIzwQjXKJiwZlyV4F3fYUf9RxJiqNE4DkMEf8Hv
         6fE0N0w/kgscOxxetNG89As/HZDZJFZSo/G1CUjJ/TwCBDUIYRM+Ui5PhpjEPbxHnsqp
         XU+SBD4UbOCbleXCeedJX6Kega6AXo6yUfTDIVJurrQnyp9GRvVyQviaLEVk8p6K2AyQ
         22ChkabJPjJcXQpKh3SCiVqxbBsefMywS/3kT6qYtvGMXo9inUuzUcdBFoOdFhtMyfkG
         bkHUfEl/k6yS9P001h1Yup5x1AdVByHTiAxcuMIJQuFhXH0PLfqfiwO+oSgwTBjX5U7h
         rWlw==
X-Forwarded-Encrypted: i=1; AJvYcCUHHUNRtxaRjbGbmFE1Pys0X27TH/IuLPn1WPJZ1k2ZEqpIRM3lVzV3D3dtkhv/CawR+eSHLFkq/UnJ5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrskk2yeBTX8AKyOj1Iipfgw2xl6VAu/VpYK4vfbls/aHrSqSr
	lO+u29MLXmWgbMse6P/8zEeRqzOxpVpgbDR0aJICQj3Eyf5rlU1w9rBpS/IXBp2deXE=
X-Gm-Gg: ASbGnctFIJopAVUsjisU/FrOVCQpH5aj2RtvI0du3FKp3BlxdkfccwheaPlQXDVETXe
	vB0b0XH+NmirP7+L5IxlvJLtyyGh/zNDhWSIy20h8rudzFh5HCX95XWYqFdJ2QnkxoqLPfo2LSd
	t/2S5BKadByrV677e/PlHgBer/QFWDtDf1eLOZxvu3iyNMCEUUVcTA5ws/8m+HqSbQMnGpRJ/0r
	UVulhXZXiuB/C9i9MzQidj95U/5nfqi+qhZ58UauLoT7s1xKK83/8deOql/1+TZzgZ6+yMjaqQG
	L35i8FZ63zAKsiYgRu9Cdreq9QQqqjsX7I+Q2n3Ylgigf2dZ61xKtWqqhexKZ2vkbNzS9/q0DW/
	SQc+krgPR8y4FcwgcmjOrUKTt6grg3c4PNMSB/G8bMyy8fOOdwgHbTWZFdWVVT2TBMhAxCTvdgP
	g=
X-Google-Smtp-Source: AGHT+IFmdm+Po0P1++N5LtyQw+r4rWBFNbbkWpZkWUC8+P6AqlV0PH43L8/Dr0h9kNUYe7HQBV7meg==
X-Received: by 2002:a05:690c:9692:b0:724:bd2d:ac97 with SMTP id 00721157ae682-727f4d6270amr177781537b3.32.1757598652962;
        Thu, 11 Sep 2025 06:50:52 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:51 -0700 (PDT)
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
Subject: [PATCH v12 7/9] optee: support protected memory allocation
Date: Thu, 11 Sep 2025 15:49:48 +0200
Message-ID: <20250911135007.1275833-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
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

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
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


