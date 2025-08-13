Return-Path: <linux-media+bounces-39735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C8B24107
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322193BC500
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 06:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD05F2D1309;
	Wed, 13 Aug 2025 06:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JB+Cl/7w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ED02C08A8
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 06:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065050; cv=none; b=Itq+YZU6leYqeibARjKHK7ThtgxM027A3cvj7Tbf44mu1tNG87+lc1hrc/u96WZCqPxhmlvfsGsh9MlW7xV8nsN+D66pTlBP1VQYQPBorM85BFo3XSORspGg4dU+ol9SbXgxw8T728rA32gYbZ87AwCOj5u9eRSFtbreL50Q+00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065050; c=relaxed/simple;
	bh=72qRpvLDAQVQ4ZZVrcYQV46VhyUyJLs6grjzr6r3i2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ck4LOpE83v1IRUu4bPxF5QWXhv755iSE2z/WtGj3F1dj6M2L70Wgf9MQPyFn5QZFBGCBezSHJ+zhMKraiux3PLBkZF+xuHpakAnyQ3ANr3WEBbELJrE8HuQAUMCQNicN0+lfWZ8XOkiMmky6nMaR3SuTKi7Br/CtduOPCITMi84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JB+Cl/7w; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61571192c3aso7365379a12.2
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 23:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065046; x=1755669846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtHmu57rTTaTDV1QBcMfjB04WNzBM5+uJeova27sa60=;
        b=JB+Cl/7wuLhDbfqxpv0z5/PKaYy4bRfhdy0yZwL+ZdJpYVBeyZgabLbgiYI2jssM97
         5IfGngA3VEn+DzKk6fPyvTZxjRdQI3ETdUv2xzz18QbkTn3pgY48Ro+FPhQpDoxiQN3W
         VgZWckkCd/fJKHAUFxdqSHuNLeqQGOshTzgsY7KnGz1dWjt9r8wUkIoYqlX5CUERORYY
         2yr4osfLDgqMOxvRnleVxCRxdHMMbVjHZLA3qkTuX9fKAQ+j/6n8dkOSpk1TuJXwTcg9
         oz9bba117UOFjhPhofbkyBqqkeEntCL8tp+h9cDdwMd4pN5cpSBnNqMZaSucyq9ADUuD
         DKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065046; x=1755669846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtHmu57rTTaTDV1QBcMfjB04WNzBM5+uJeova27sa60=;
        b=urCzH8/LCM0UNvzicuVZjkYd6jvURBFHDAHSUdA44KakCqOJxyvtDYaX97KX/M0fzA
         F0Tz/wHbeCigwSlfoUOMY7TFlK3b54B71jGv8tZMd+UiJcZYr7M93rFBDHYfDkctFgID
         U875WR9pJAZE118nnuQhOPYXATYyuVsEwvjJoka+yGmCf2LAuyxU5NzFWKUJQm4aH9OD
         6IwbZOhHXOarWdHZlt2pM1mzt3OgXh9GQ9b5zCgwk8RUGBJKg5pcjfqJ6AS1qHnzfYCm
         64S5Gsj6Il5CbYIoL755kIN6C9lU9XX4iIy8bOP2t+oa4PVrFdILWRiP1u+8f50GZ+UF
         ue9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUsPzHsvBcjb+cKCsXvSmrbvwc6oLkRp9xRUQ9lTnEZop3ANsIqoWHsk5Tlz0JLAYACjCG+cKoHtRlJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrbB4XRnd9YjR9JZAxEDr/RrPeFL0RQAQ+CM0sUIYr28SXEnwn
	HxLiyL8j9HHeNY0NADlYmqn9Qyulzjbpcc4OreICA6HLL3LAyAhdCdUzUXdV0m06K98=
X-Gm-Gg: ASbGncsNPeXrB6zQW51fKN7tTy/weFuNF/FdTe6jE5vhu8uGiGJkCQGNEqax69s0Xqp
	D+KHKwlBix+7PeRh5PcF9NFW/Ym8cVjU0kxTw+lY1GkZrIy0W1Us3rzhSHZmewYjpoKg5EHEnOe
	r/VjWnN92atLmDAFsUC30S2MZsXGDRis8VeXOCRY333bney0BV+JTywQnkSmkAPt0mqdKsFtiwH
	DPm638pRDBrUIQLT/eMQ0FRQRH90Yvbwsd4zWpjn65wyHKX7FGu/Ki0fqnEeXZniTaJteWVs63e
	zICkC5BT0GQld257VBT+Xjkaw3IAMDAGJT26sJrhNM/zfBa4O+mVKX6k+CLdhl6blPsI06qW2aN
	6xNabVKGN5vhRWzizgsdpY5B5J548TbwlAE+irNHkHsffqtSTKmj9gmhVBX4P1bv0eYpNMCLY0p
	8=
X-Google-Smtp-Source: AGHT+IFqidhskDlaHJgNRIX22KVWXY2sCg3jNSI9Rc9uFKDKbLGm8gsWSa6DmckslUcaXx9VGF3TWQ==
X-Received: by 2002:a05:6402:1ed5:b0:615:9d94:2934 with SMTP id 4fb4d7f45d1cf-6186b77438bmr1469054a12.10.1755065045951;
        Tue, 12 Aug 2025 23:04:05 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:04:05 -0700 (PDT)
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
Subject: [PATCH v11 8/9] optee: FF-A: dynamic protected memory allocation
Date: Wed, 13 Aug 2025 08:02:57 +0200
Message-ID: <20250813060339.2977604-9-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver dynamic protected memory
allocation with FF-A.

The protected memory pools for dynamically allocated protected memory
are instantiated when requested by user-space. This instantiation can
fail if OP-TEE doesn't support the requested use-case of protected
memory.

Restricted memory pools based on a static carveout or dynamic allocation
can coexist for different use-cases. We use only dynamic allocation with
FF-A.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/ffa_abi.c       | 146 ++++++++++++-
 drivers/tee/optee/optee_private.h |  13 +-
 drivers/tee/optee/protmem.c       | 335 ++++++++++++++++++++++++++++++
 4 files changed, 492 insertions(+), 3 deletions(-)
 create mode 100644 drivers/tee/optee/protmem.c

diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
index a6eff388d300..ad7049c1c107 100644
--- a/drivers/tee/optee/Makefile
+++ b/drivers/tee/optee/Makefile
@@ -4,6 +4,7 @@ optee-objs += core.o
 optee-objs += call.o
 optee-objs += notif.o
 optee-objs += rpc.o
+optee-objs += protmem.o
 optee-objs += supp.o
 optee-objs += device.o
 optee-objs += smc_abi.o
diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index f9ef7d94cebd..11c543ac65c6 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -649,6 +649,124 @@ static int optee_ffa_do_call_with_arg(struct tee_context *ctx,
 	return optee_ffa_yielding_call(ctx, &data, rpc_arg, system_thread);
 }
 
+static int do_call_lend_protmem(struct optee *optee, u64 cookie, u32 use_case)
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
+	msg_arg->cmd = OPTEE_MSG_CMD_ASSIGN_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = cookie;
+	msg_arg->params[0].u.value.b = use_case;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
+	}
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
+static int optee_ffa_lend_protmem(struct optee *optee, struct tee_shm *protmem,
+				  u32 *mem_attrs, unsigned int ma_count,
+				  u32 use_case)
+{
+	struct ffa_device *ffa_dev = optee->ffa.ffa_dev;
+	const struct ffa_mem_ops *mem_ops = ffa_dev->ops->mem_ops;
+	const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
+	struct ffa_send_direct_data data;
+	struct ffa_mem_region_attributes *mem_attr;
+	struct ffa_mem_ops_args args = {
+		.use_txbuf = true,
+		.tag = use_case,
+	};
+	struct page *page;
+	struct scatterlist sgl;
+	unsigned int n;
+	int rc;
+
+	mem_attr = kcalloc(ma_count, sizeof(*mem_attr), GFP_KERNEL);
+	for (n = 0; n < ma_count; n++) {
+		mem_attr[n].receiver = mem_attrs[n] & U16_MAX;
+		mem_attr[n].attrs = mem_attrs[n] >> 16;
+	}
+	args.attrs = mem_attr;
+	args.nattrs = ma_count;
+
+	page = phys_to_page(protmem->paddr);
+	sg_init_table(&sgl, 1);
+	sg_set_page(&sgl, page, protmem->size, 0);
+
+	args.sg = &sgl;
+	rc = mem_ops->memory_lend(&args);
+	kfree(mem_attr);
+	if (rc)
+		return rc;
+
+	rc = do_call_lend_protmem(optee, args.g_handle, use_case);
+	if (rc)
+		goto err_reclaim;
+
+	rc = optee_shm_add_ffa_handle(optee, protmem, args.g_handle);
+	if (rc)
+		goto err_unreg;
+
+	protmem->sec_world_id = args.g_handle;
+
+	return 0;
+
+err_unreg:
+	data = (struct ffa_send_direct_data){
+		.data0 = OPTEE_FFA_RELEASE_PROTMEM,
+		.data1 = (u32)args.g_handle,
+		.data2 = (u32)(args.g_handle >> 32),
+	};
+	msg_ops->sync_send_receive(ffa_dev, &data);
+err_reclaim:
+	mem_ops->memory_reclaim(args.g_handle, 0);
+	return rc;
+}
+
+static int optee_ffa_reclaim_protmem(struct optee *optee,
+				     struct tee_shm *protmem)
+{
+	struct ffa_device *ffa_dev = optee->ffa.ffa_dev;
+	const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
+	const struct ffa_mem_ops *mem_ops = ffa_dev->ops->mem_ops;
+	u64 global_handle = protmem->sec_world_id;
+	struct ffa_send_direct_data data = {
+		.data0 = OPTEE_FFA_RELEASE_PROTMEM,
+		.data1 = (u32)global_handle,
+		.data2 = (u32)(global_handle >> 32)
+	};
+	int rc;
+
+	optee_shm_rem_ffa_handle(optee, global_handle);
+	protmem->sec_world_id = 0;
+
+	rc = msg_ops->sync_send_receive(ffa_dev, &data);
+	if (rc)
+		pr_err("Release SHM id 0x%llx rc %d\n", global_handle, rc);
+
+	rc = mem_ops->memory_reclaim(global_handle, 0);
+	if (rc)
+		pr_err("mem_reclaim: 0x%llx %d", global_handle, rc);
+
+	return rc;
+}
+
 /*
  * 6. Driver initialization
  *
@@ -819,6 +937,8 @@ static const struct optee_ops optee_ffa_ops = {
 	.do_call_with_arg = optee_ffa_do_call_with_arg,
 	.to_msg_param = optee_ffa_to_msg_param,
 	.from_msg_param = optee_ffa_from_msg_param,
+	.lend_protmem = optee_ffa_lend_protmem,
+	.reclaim_protmem = optee_ffa_reclaim_protmem,
 };
 
 static void optee_ffa_remove(struct ffa_device *ffa_dev)
@@ -891,6 +1011,25 @@ static int optee_ffa_async_notif_init(struct ffa_device *ffa_dev,
 	return rc;
 }
 
+static int optee_ffa_protmem_pool_init(struct optee *optee, u32 sec_caps)
+{
+	enum tee_dma_heap_id id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_protmem_pool *pool;
+	int rc = 0;
+
+	if (sec_caps & OPTEE_FFA_SEC_CAP_PROTMEM) {
+		pool = optee_protmem_alloc_dyn_pool(optee, id);
+		if (IS_ERR(pool))
+			return PTR_ERR(pool);
+
+		rc = tee_device_register_dma_heap(optee->teedev, id, pool);
+		if (rc)
+			pool->ops->destroy_pool(pool);
+	}
+
+	return rc;
+}
+
 static int optee_ffa_probe(struct ffa_device *ffa_dev)
 {
 	const struct ffa_notifier_ops *notif_ops;
@@ -941,7 +1080,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 				  optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 	optee->teedev = teedev;
 
@@ -988,6 +1127,9 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 			       rc);
 	}
 
+	if (optee_ffa_protmem_pool_init(optee, sec_caps))
+		pr_info("Protected memory service not available\n");
+
 	rc = optee_enumerate_devices(PTA_CMD_GET_DEVICES);
 	if (rc)
 		goto err_unregister_devices;
@@ -1018,7 +1160,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 	tee_device_unregister(optee->supp_teedev);
 err_unreg_teedev:
 	tee_device_unregister(optee->teedev);
-err_free_pool:
+err_free_shm_pool:
 	tee_shm_pool_free(pool);
 err_free_optee:
 	kfree(optee);
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 4969b83a9851..db9ea673fbca 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -176,9 +176,14 @@ struct optee;
  * @do_call_with_arg:	enters OP-TEE in secure world
  * @to_msg_param:	converts from struct tee_param to OPTEE_MSG parameters
  * @from_msg_param:	converts from OPTEE_MSG parameters to struct tee_param
+ * @lend_protmem:	lends physically contiguous memory as restricted
+ *			memory, inaccessible by the kernel
+ * @reclaim_protmem:	reclaims restricted memory previously lent with
+ *			@lend_protmem() and makes it accessible by the
+ *			kernel again
  *
  * These OPs are only supposed to be used internally in the OP-TEE driver
- * as a way of abstracting the different methogs of entering OP-TEE in
+ * as a way of abstracting the different methods of entering OP-TEE in
  * secure world.
  */
 struct optee_ops {
@@ -191,6 +196,10 @@ struct optee_ops {
 	int (*from_msg_param)(struct optee *optee, struct tee_param *params,
 			      size_t num_params,
 			      const struct optee_msg_param *msg_params);
+	int (*lend_protmem)(struct optee *optee, struct tee_shm *protmem,
+			    u32 *mem_attr, unsigned int ma_count,
+			    u32 use_case);
+	int (*reclaim_protmem)(struct optee *optee, struct tee_shm *protmem);
 };
 
 /**
@@ -287,6 +296,8 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 void optee_supp_init(struct optee_supp *supp);
 void optee_supp_uninit(struct optee_supp *supp);
 void optee_supp_release(struct optee_supp *supp);
+struct tee_protmem_pool *optee_protmem_alloc_dyn_pool(struct optee *optee,
+						      enum tee_dma_heap_id id);
 
 int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 		    struct tee_param *param);
diff --git a/drivers/tee/optee/protmem.c b/drivers/tee/optee/protmem.c
new file mode 100644
index 000000000000..2eba48d5ac73
--- /dev/null
+++ b/drivers/tee/optee/protmem.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Linaro Limited
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/errno.h>
+#include <linux/genalloc.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/tee_core.h>
+#include <linux/types.h>
+#include "optee_private.h"
+
+struct optee_protmem_dyn_pool {
+	struct tee_protmem_pool pool;
+	struct gen_pool *gen_pool;
+	struct optee *optee;
+	size_t page_count;
+	u32 *mem_attrs;
+	u_int mem_attr_count;
+	refcount_t refcount;
+	u32 use_case;
+	struct tee_shm *protmem;
+	/* Protects when initializing and tearing down this struct */
+	struct mutex mutex;
+};
+
+static struct optee_protmem_dyn_pool *
+to_protmem_dyn_pool(struct tee_protmem_pool *pool)
+{
+	return container_of(pool, struct optee_protmem_dyn_pool, pool);
+}
+
+static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
+{
+	int rc;
+
+	rp->protmem = tee_shm_alloc_dma_mem(rp->optee->ctx, rp->page_count);
+	if (IS_ERR(rp->protmem)) {
+		rc = PTR_ERR(rp->protmem);
+		goto err_null_protmem;
+	}
+
+	/*
+	 * TODO unmap the memory range since the physical memory will
+	 * become inaccesible after the lend_protmem() call.
+	 *
+	 * If the platform supports a hypervisor at EL2, it will unmap the
+	 * intermediate physical memory for us and stop cache pre-fetch of
+	 * the memory.
+	 */
+	rc = rp->optee->ops->lend_protmem(rp->optee, rp->protmem,
+					  rp->mem_attrs,
+					  rp->mem_attr_count, rp->use_case);
+	if (rc)
+		goto err_put_shm;
+	rp->protmem->flags |= TEE_SHM_DYNAMIC;
+
+	rp->gen_pool = gen_pool_create(PAGE_SHIFT, -1);
+	if (!rp->gen_pool) {
+		rc = -ENOMEM;
+		goto err_reclaim;
+	}
+
+	rc = gen_pool_add(rp->gen_pool, rp->protmem->paddr,
+			  rp->protmem->size, -1);
+	if (rc)
+		goto err_free_pool;
+
+	refcount_set(&rp->refcount, 1);
+	return 0;
+
+err_free_pool:
+	gen_pool_destroy(rp->gen_pool);
+	rp->gen_pool = NULL;
+err_reclaim:
+	rp->optee->ops->reclaim_protmem(rp->optee, rp->protmem);
+err_put_shm:
+	tee_shm_put(rp->protmem);
+err_null_protmem:
+	rp->protmem = NULL;
+	return rc;
+}
+
+static int get_dyn_protmem(struct optee_protmem_dyn_pool *rp)
+{
+	int rc = 0;
+
+	if (!refcount_inc_not_zero(&rp->refcount)) {
+		mutex_lock(&rp->mutex);
+		if (rp->gen_pool) {
+			/*
+			 * Another thread has already initialized the pool
+			 * before us, or the pool was just about to be torn
+			 * down. Either way we only need to increase the
+			 * refcount and we're done.
+			 */
+			refcount_inc(&rp->refcount);
+		} else {
+			rc = init_dyn_protmem(rp);
+		}
+		mutex_unlock(&rp->mutex);
+	}
+
+	return rc;
+}
+
+static void release_dyn_protmem(struct optee_protmem_dyn_pool *rp)
+{
+	gen_pool_destroy(rp->gen_pool);
+	rp->gen_pool = NULL;
+
+	rp->optee->ops->reclaim_protmem(rp->optee, rp->protmem);
+	rp->protmem->flags &= ~TEE_SHM_DYNAMIC;
+
+	WARN(refcount_read(&rp->protmem->refcount) != 1, "Unexpected refcount");
+	tee_shm_put(rp->protmem);
+	rp->protmem = NULL;
+}
+
+static void put_dyn_protmem(struct optee_protmem_dyn_pool *rp)
+{
+	if (refcount_dec_and_test(&rp->refcount)) {
+		mutex_lock(&rp->mutex);
+		if (rp->gen_pool)
+			release_dyn_protmem(rp);
+		mutex_unlock(&rp->mutex);
+	}
+}
+
+static int protmem_pool_op_dyn_alloc(struct tee_protmem_pool *pool,
+				     struct sg_table *sgt, size_t size,
+				     size_t *offs)
+{
+	struct optee_protmem_dyn_pool *rp = to_protmem_dyn_pool(pool);
+	size_t sz = ALIGN(size, PAGE_SIZE);
+	phys_addr_t pa;
+	int rc;
+
+	rc = get_dyn_protmem(rp);
+	if (rc)
+		return rc;
+
+	pa = gen_pool_alloc(rp->gen_pool, sz);
+	if (!pa) {
+		rc = -ENOMEM;
+		goto err_put;
+	}
+
+	rc = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (rc)
+		goto err_free;
+
+	sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
+	*offs = pa - rp->protmem->paddr;
+
+	return 0;
+err_free:
+	gen_pool_free(rp->gen_pool, pa, size);
+err_put:
+	put_dyn_protmem(rp);
+
+	return rc;
+}
+
+static void protmem_pool_op_dyn_free(struct tee_protmem_pool *pool,
+				     struct sg_table *sgt)
+{
+	struct optee_protmem_dyn_pool *rp = to_protmem_dyn_pool(pool);
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sgtable_sg(sgt, sg, i)
+		gen_pool_free(rp->gen_pool, sg_phys(sg), sg->length);
+	sg_free_table(sgt);
+	put_dyn_protmem(rp);
+}
+
+static int protmem_pool_op_dyn_update_shm(struct tee_protmem_pool *pool,
+					  struct sg_table *sgt, size_t offs,
+					  struct tee_shm *shm,
+					  struct tee_shm **parent_shm)
+{
+	struct optee_protmem_dyn_pool *rp = to_protmem_dyn_pool(pool);
+
+	*parent_shm = rp->protmem;
+
+	return 0;
+}
+
+static void pool_op_dyn_destroy_pool(struct tee_protmem_pool *pool)
+{
+	struct optee_protmem_dyn_pool *rp = to_protmem_dyn_pool(pool);
+
+	mutex_destroy(&rp->mutex);
+	kfree(rp);
+}
+
+static struct tee_protmem_pool_ops protmem_pool_ops_dyn = {
+	.alloc = protmem_pool_op_dyn_alloc,
+	.free = protmem_pool_op_dyn_free,
+	.update_shm = protmem_pool_op_dyn_update_shm,
+	.destroy_pool = pool_op_dyn_destroy_pool,
+};
+
+static int get_protmem_config(struct optee *optee, u32 use_case,
+			      size_t *min_size, u_int *pa_width,
+			      u32 *mem_attrs, u_int *ma_count)
+{
+	struct tee_param params[2] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT,
+			.u.value.a = use_case,
+		},
+		[1] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT,
+		},
+	};
+	struct optee_shm_arg_entry *entry;
+	struct tee_shm *shm_param = NULL;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	if (mem_attrs && *ma_count) {
+		params[1].u.memref.size = *ma_count * sizeof(*mem_attrs);
+		shm_param = tee_shm_alloc_priv_buf(optee->ctx,
+						   params[1].u.memref.size);
+		if (IS_ERR(shm_param))
+			return PTR_ERR(shm_param);
+		params[1].u.memref.shm = shm_param;
+	}
+
+	msg_arg = optee_get_msg_arg(optee->ctx, ARRAY_SIZE(params), &entry,
+				    &shm, &offs);
+	if (IS_ERR(msg_arg)) {
+		rc = PTR_ERR(msg_arg);
+		goto out_free_shm;
+	}
+	msg_arg->cmd = OPTEE_MSG_CMD_GET_PROTMEM_CONFIG;
+
+	rc = optee->ops->to_msg_param(optee, msg_arg->params,
+				      ARRAY_SIZE(params), params);
+	if (rc)
+		goto out_free_msg;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out_free_msg;
+	if (msg_arg->ret && msg_arg->ret != TEEC_ERROR_SHORT_BUFFER) {
+		rc = -EINVAL;
+		goto out_free_msg;
+	}
+
+	rc = optee->ops->from_msg_param(optee, params, ARRAY_SIZE(params),
+					msg_arg->params);
+	if (rc)
+		goto out_free_msg;
+
+	if (!msg_arg->ret && mem_attrs &&
+	    *ma_count < params[1].u.memref.size / sizeof(*mem_attrs)) {
+		rc = -EINVAL;
+		goto out_free_msg;
+	}
+
+	*min_size = params[0].u.value.a;
+	*pa_width = params[0].u.value.c;
+	*ma_count = params[1].u.memref.size / sizeof(*mem_attrs);
+
+	if (msg_arg->ret == TEEC_ERROR_SHORT_BUFFER) {
+		rc = -ENOSPC;
+		goto out_free_msg;
+	}
+
+	if (mem_attrs)
+		memcpy(mem_attrs, tee_shm_get_va(shm_param, 0),
+		       params[1].u.memref.size);
+
+out_free_msg:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+out_free_shm:
+	if (shm_param)
+		tee_shm_free(shm_param);
+	return rc;
+}
+
+struct tee_protmem_pool *optee_protmem_alloc_dyn_pool(struct optee *optee,
+						      enum tee_dma_heap_id id)
+{
+	struct optee_protmem_dyn_pool *rp;
+	size_t min_size;
+	u_int pa_width;
+	int rc;
+
+	rp = kzalloc(sizeof(*rp), GFP_KERNEL);
+	if (!rp)
+		return ERR_PTR(-ENOMEM);
+	rp->use_case = id;
+
+	rc = get_protmem_config(optee, id, &min_size, &pa_width, NULL,
+				&rp->mem_attr_count);
+	if (rc) {
+		if (rc != -ENOSPC)
+			goto err;
+		rp->mem_attrs = kcalloc(rp->mem_attr_count,
+					sizeof(*rp->mem_attrs), GFP_KERNEL);
+		if (!rp->mem_attrs) {
+			rc = -ENOMEM;
+			goto err;
+		}
+		rc = get_protmem_config(optee, id, &min_size, &pa_width,
+					rp->mem_attrs, &rp->mem_attr_count);
+		if (rc)
+			goto err_kfree_eps;
+	}
+
+	rc = optee_set_dma_mask(optee, pa_width);
+	if (rc)
+		goto err_kfree_eps;
+
+	rp->pool.ops = &protmem_pool_ops_dyn;
+	rp->optee = optee;
+	rp->page_count = min_size / PAGE_SIZE;
+	mutex_init(&rp->mutex);
+
+	return &rp->pool;
+
+err_kfree_eps:
+	kfree(rp->mem_attrs);
+err:
+	kfree(rp);
+	return ERR_PTR(rc);
+}
-- 
2.43.0


