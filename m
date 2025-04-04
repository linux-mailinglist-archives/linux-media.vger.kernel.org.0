Return-Path: <linux-media+bounces-29408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA4FA7BF7F
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 16:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AF2517CF70
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 14:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA031F91F3;
	Fri,  4 Apr 2025 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uriEuaJZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE381F8918
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777169; cv=none; b=ghF9QMsxJDlmY15Thr8KKZj78ry6z7qc+lOu7UXx9FToR+ZYx9/GwUlrVOgqg/V4YEu2cqP8QCofHU2Pnbs++6mZpBOaBOidCJWTKNscUIh19gKSYNIRVojvoaFJgH4Umj1ywxuOz6bnI90F9PSSol//0SgDtzJWytlZaVd7fb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777169; c=relaxed/simple;
	bh=xHB8JHjf/tOVUigrC/8AjwRmS/VCkvn1T1vcXrDlRsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V98XQ3KHPizzmW5BU2bIO5cZISXPgVjXW79x53BohAEBuuMMreQoZ2gc7yV3YqUlIXQUF96++mPHD9H/FVxZQh40s9JVlGDqdigqCIJ3VoMuVtjikEeO8xuScuF6TwAa3MPQSFW/KwfXuccwGrTlH8t9eG5MUsCFRnz29B6s6YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uriEuaJZ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso3323682a12.0
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777166; x=1744381966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPfYhkbEaDQyvItBPqD6f0Sef9tTAM/sN3gZBFbfI4Q=;
        b=uriEuaJZdUPLjwZtsi8S67HcDJT5KNCorcdh+Irh2AqfN3nQCxuvcwpQ4vv3XLWQwr
         olQu31GvYq2O2wOYfQuFfZcmcf88iGKcQAhnb2oq9hjOHHWgahWHnNDhLWvGgO0MeJ2r
         xQI7jwM6UPAoNXSNuus2OLHdx6kb5rb4exyjwySGEVfvm7F4mganKYgB5/xTLRJmJ3hP
         une0Rr3/6qbt6ad2FhVTv6M3HVhdZjIE7etVXJEyuuaO1GJ1XS+rKdb/E4zJpdsJT7OS
         a94nWa0o5vn7QsTeAuo6ao9uxIwVUa/qLuT+nbOZrdFhAlBRln+97JXAWoKh/Kj/orzz
         /rLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777166; x=1744381966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPfYhkbEaDQyvItBPqD6f0Sef9tTAM/sN3gZBFbfI4Q=;
        b=r/tUMP1QvQnV03bEcgyyHregK2/oE0O8cBkXwsOQ5/JfRMPtu30eeiJLVyGroj/RlN
         OWztNIQlxxDEaxKz9PAWZ8xfrkNZbAtYP4muEL70aLA7/Fl/4mJ+6vswQvQMnVHenH33
         Z1RT8k9pdplM/icHfIbgQuMETeQ35KdHfxL9ZNexnVAUyShIDi6IaozxYtpGvNDkfGEW
         +ofyrZrg+NEC0AZWAi7zxrj3L1UBLSZ8hREjKcdCymryBmoMzwYhq2+Q7P5VEdA60l3P
         hnflBYVlnem+SwZsotiY0Vn5O7pA3fFv3WeZARAaZ9zxDPNpoaHwdl5s4qoh98XvuzX0
         u+4A==
X-Forwarded-Encrypted: i=1; AJvYcCVM1YORMPTVZyTbGkjKxpQl8Hxl4nlR5q42FCtWHdzjCcGqzUPIzpdu0uljT6Mpihmp2xJYIZOXoz2osQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3ztBfj1aU6rIQ+IAxDuxEHwQU5nfGu7ekK/rmitEdOXn3gAA
	3ojWmnX9kJUCJKTEhyDTqXefSG0+WnGUM0NX4wfmOlwv3fxSq92DDM46lU4u0F4=
X-Gm-Gg: ASbGncstqDgoG2eDVw/deo+XbVJpzDvaOuQ/NgxfrfJyBmOuirehUOnstJsrVHzJK8d
	wlgV5YgPUJtqbH/Sys1fjdkmtUhc4LJrmfit4kcDJAP6+w7VefjULv1LA5fiSPFT8Ld6gM9S4D/
	J0mIs/ZGKyB5Vl3/jNlsiHzK/8F3ntpM45MGqxfgWFeH1jNkhaVBotGx9H7/PVGmvLs7K2kANn3
	LrHuWwHdV0/4DTAg4urUQ+7BEA8wasjlBI0NdPVmttXhpuZP7B0xPebSCsrvyeuu7TN/S0Axqq8
	JInjUIAj/E22tZnWe6msd4B2cygdgtBqiWOx3acPYEwldDdBFLJdjpAHJm5FdLyLrHSnvjcrKqD
	cx0Flou8sCwbJtkndZhJy3g==
X-Google-Smtp-Source: AGHT+IExyXHbOf2taNxw2yz+3CcX0NYoBCdJtwB6sr0Vv5nuFXnktNWKFMtHaLzI32Tb9SdvBjUavw==
X-Received: by 2002:a05:6402:380c:b0:5f0:8551:9790 with SMTP id 4fb4d7f45d1cf-5f0b3bcd2c0mr2481680a12.16.1743777165747;
        Fri, 04 Apr 2025 07:32:45 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:45 -0700 (PDT)
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
Subject: [PATCH v7 11/11] optee: smc abi: dynamic protected memory allocation
Date: Fri,  4 Apr 2025 16:31:34 +0200
Message-ID: <20250404143215.2281034-12-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 102 ++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 17 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index c10b38b23586..dd9887826590 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
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
@@ -1252,6 +1316,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_protmem = optee_smc_lend_protmem,
+	.reclaim_protmem = optee_smc_reclaim_protmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1620,13 +1686,16 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
-static int optee_rstmem_pool_init(struct optee *optee)
+static int optee_protmem_pool_init(struct optee *optee)
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
@@ -1634,25 +1703,24 @@ static int optee_rstmem_pool_init(struct optee *optee)
 
 		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
 				     0, 0, 0, &res.smccc);
-		if (res.result.status != OPTEE_SMC_RETURN_OK) {
-			pr_err("Secure Data Path service not available\n");
-			return 0;
-		}
+		if (res.result.status == OPTEE_SMC_RETURN_OK)
+			pool = tee_protmem_static_pool_alloc(res.result.start,
+							     res.result.size);
+	}
 
-		pool = tee_protmem_static_pool_alloc(res.result.start,
-						     res.result.size);
-		if (IS_ERR(pool))
-			return PTR_ERR(pool);
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_cma_pool(optee, heap_id);
 
+	if (!IS_ERR(pool)) {
 		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
 		if (rc)
-			goto err;
+			pool->ops->destroy_pool(pool);
 	}
 
+	if (rc && (protm || dyn_protm))
+		pr_info("Protected memory service not available\n");
+
 	return 0;
-err:
-	pool->ops->destroy_pool(pool);
-	return rc;
 }
 
 static int optee_probe(struct platform_device *pdev)
@@ -1823,7 +1891,7 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
-	rc = optee_rstmem_pool_init(optee);
+	rc = optee_protmem_pool_init(optee);
 	if (rc)
 		goto err_notif_uninit;
 
-- 
2.43.0


