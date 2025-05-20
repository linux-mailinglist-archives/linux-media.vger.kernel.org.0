Return-Path: <linux-media+bounces-32937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D54ABDF28
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 17:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A62ED4E2C56
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0577F2609C8;
	Tue, 20 May 2025 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfXFU4PG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DAF27F73A
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754701; cv=none; b=RCLWNOP8S9UklMBMteNuvSUU5o2NZY5embjBuGBpFWWef4cxwPq8GxTVjsAQbSXtGs1z0/qNWnr4DpTkinBZgKG7HGixsJFVjg3pJZVQ9oxGNc1iK0sLziaKgwubXoBFgrXwUqriYHwYiCxAIzDObbP78v1D1NcQrMMzly5/i+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754701; c=relaxed/simple;
	bh=HrWAkjXzo1cwOQkzp5D5PLjihxqiuqVqgMCi74TCylM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=As7E2OrjS0Fr+cq/lah5/1b7gprkfT1SUvxqNp8NsOJFVgN5dx6ZHpUYzq8XvuB+oBv5Tt2AKeDXJ/SQMWFBHNcSJdBmT+whXje6rgUY7NwuEn1xG+ZVirtk1wZBLYiALapSl3sV+ntP1RpXS12uZMCiw6dRTIgJoKrqnEFftUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfXFU4PG; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad216a5a59cso808143566b.3
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754697; x=1748359497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sws8LggPb3Nr4WEIwk49/i4GQcd2qsiJjDBUK0g1c0s=;
        b=gfXFU4PGCj+JV99lZR6A1oIf0EDlGCRXtA28zlGjNR0sRtrTG91gmKlcoGC6+Z2voy
         PPtx+UOtskL9zX8R2Ldr8ih+VS1ErUFk61EqHorpTAihOc6YUmXgRpVZfZqjcpv9MRQd
         sAfRvtCjDMYBKV/jpFAKpo7/f4p7nNgJFkWnegmZBfTEH+VIw0nAqtq29AxuoWVGBTN3
         Qstpz25KOrjBjX6fSyeARTzQAIXN9yrdgrKUfnCQgnKbCslsxya8H0hrLZXOGUAUwClX
         4YO/GhKegTdO6JDUOHgHFMPGY6mAgX0uiz3cExqCIUYrtbDZLF7PzRXsuAh22cs6TUFD
         mi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754697; x=1748359497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sws8LggPb3Nr4WEIwk49/i4GQcd2qsiJjDBUK0g1c0s=;
        b=OUJkmhVFdELRrVInxdJ2JfVx11uotE7Yew7AUrIAfK0R73IEEUsag/vgoY3i2OveHu
         6X4p1ZkFaIBs0dhc0peR/DqxberU8YMbQlFDY2O4pDZaV0cTJjK+697t44sIz0IgDG4l
         Wr8e6ZiLdZIxalcY3Gbi7zkwqbZOfoRXeQadLacdADqv4CR4RULKyvioN+c8vaWoO4oH
         ceo5IYeIQK0PxHH7vK/mMCgvXW+wEBJN8cYG67mFzvD8IcIDR+aXoL7wTI2oZ5PrZyma
         rOYTPvIm9Mehgq3ddlUavwV5IoV7dTirBQpD3cCDVY44cxFtbilmPg0INadFHu1GNh6j
         KNnA==
X-Forwarded-Encrypted: i=1; AJvYcCWRO8p4+XLJiU9y4x9cWE5dtL2Sk0UQXv/18KxANht6Ms6OfQUnzbbl07McpVrib3bQRukioc+i5YpnaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3bti+qYjI8e3eLlqMdHont9Qhn7CCcQrIflSBa+yjZe93pL1l
	FPkGZTVIDrS9OmXeLw9qakG0YwaKMD7j08tNh6kF175m1gdyGGCIVkV6lDOnd3iB/QA=
X-Gm-Gg: ASbGncvKxfXHTVvWhMHPygYYUr9oJZLS98pcB3HHD/BQPQ8Y7A0wvTiEtKx40iFw70h
	hm60i+/AnVsxbNNquUQCKmKvAzDLJJdFaKWu6DHfDXMSIUiU4cLelSbY7mPna/CgyJlxL3mSnBh
	KsJAYI9D2/bOboE/aOJoTxGe7CH/3b4UeN+oGXWXaVXK2nWq0oPP2NCZZEZbeJWQCT57/flnhZN
	+fiS4qVFQYj7BohSug1Kda0Wf6zUSm6h/pXJqN/zK/PQ0v6/uMyDyMXSuJtZg1SxkOScqIJWKUl
	5W2oc3mc10TVqNgfap5m2cI0waSnas1WFMIK7PwG2r1CWIff5JmCETEMLctZPhb+cjNny8iDwXx
	Eolc1N838BpIAzxxmfNKzR/gEZOefUzBSs8xK2lo=
X-Google-Smtp-Source: AGHT+IFajjrVIsC7kJISaAObbiybAYfu3AaUSsn1KJ4AT03AxVtsB+czB4nAf85bGG6wnrUQQg0qnQ==
X-Received: by 2002:a17:907:7f08:b0:ac7:3817:d8da with SMTP id a640c23a62f3a-ad52d609170mr1346626366b.52.1747754697525;
        Tue, 20 May 2025 08:24:57 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:56 -0700 (PDT)
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
Subject: [PATCH v9 9/9] optee: smc abi: dynamic protected memory allocation
Date: Tue, 20 May 2025 17:16:52 +0200
Message-ID: <20250520152436.474778-10-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 102 ++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 17 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f3cae8243785..6b3fbe7f0909 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm *protmem,
+				  u16 *end_points, unsigned int ep_count,
+				  u32 use_case)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_LEND_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = use_case;
+	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+	msg_arg->params[1].u.tmem.buf_ptr = protmem->paddr;
+	msg_arg->params[1].u.tmem.size = protmem->size;
+	msg_arg->params[1].u.tmem.shm_ref = (u_long)protmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
+	}
+	protmem->sec_world_id = (u_long)protmem;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
+static int optee_smc_reclaim_protmem(struct optee *optee,
+				     struct tee_shm *protmem)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+	msg_arg->params[0].u.rmem.shm_ref = (u_long)protmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS)
+		rc = -EINVAL;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
 /*
  * 5. Asynchronous notification
  */
@@ -1216,6 +1280,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_protmem = optee_smc_lend_protmem,
+	.reclaim_protmem = optee_smc_reclaim_protmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1586,11 +1652,14 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_protmem_pool_init(struct optee *optee)
 {
+	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
+	bool dyn_protm = optee->smc.sec_caps &
+			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
 	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
-	struct tee_protmem_pool *pool;
-	int rc;
+	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
+	int rc = -EINVAL;
 
-	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
+	if (protm) {
 		union {
 			struct arm_smccc_res smccc;
 			struct optee_smc_get_protmem_config_result result;
@@ -1598,26 +1667,26 @@ static int optee_protmem_pool_init(struct optee *optee)
 
 		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
 				     0, 0, 0, &res.smccc);
-		if (res.result.status != OPTEE_SMC_RETURN_OK) {
-			pr_err("Secure Data Path service not available\n");
-			return 0;
-		}
-		rc = optee_set_dma_mask(optee, res.result.pa_width);
+		if (res.result.status == OPTEE_SMC_RETURN_OK)
+			rc = optee_set_dma_mask(optee, res.result.pa_width);
 		if (!rc)
 			pool = tee_protmem_static_pool_alloc(res.result.start,
 							     res.result.size);
-		if (IS_ERR(pool))
-			return PTR_ERR(pool);
+	}
 
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
+
+	if (!IS_ERR(pool)) {
 		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
 		if (rc)
-			goto err;
+			pool->ops->destroy_pool(pool);
 	}
 
+	if (protm || dyn_protm)
+		return rc;
+
 	return 0;
-err:
-	pool->ops->destroy_pool(pool);
-	return rc;
 }
 
 static int optee_probe(struct platform_device *pdev)
@@ -1788,9 +1857,8 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
-	rc = optee_protmem_pool_init(optee);
-	if (rc)
-		goto err_notif_uninit;
+	if (optee_protmem_pool_init(optee))
+		pr_info("Protected memory service not available\n");
 
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
-- 
2.43.0


