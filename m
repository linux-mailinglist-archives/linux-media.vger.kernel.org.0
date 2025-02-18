Return-Path: <linux-media+bounces-26291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0139A3A029
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 15:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E3E417726B
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D7026BD97;
	Tue, 18 Feb 2025 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwHQtGgm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE526B948
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739889354; cv=none; b=AtJE7MrOCTK2W3+weX8C3diO+nvJrBEqp5uDgOpvg4pyNWYjwFiNu9riylzHrUW4EQuNbnyy4yLJz8cvwKY3cJfaPx1x9qi1tzEEQak5bRBiXtEzINvl53x5+Fn9UcnbCHiJfY9SPTtTaOfAAj3IrIWwj00JF9pWx2pJJ3eXnKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739889354; c=relaxed/simple;
	bh=kp4CJfwNx8pIKAjGdsGLcGp0gGX66DomMPrMb3K7otY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7w3hj6inF0pm3iUMN8FdSKG6N0URL7JD/Aqlz5e0koCKkuApFipSErxu+VXiElT43GGAqRqqgJwsi9gzJfkHSaBA5tR0TlSpSEL61hNxezUvhpitSoVJ7m5sJ0r92EbGA8FIa9SK1V07LgPh8TbJHfVcHqeXnr15+CRb/3WyYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwHQtGgm; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30795988ebeso57845161fa.3
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 06:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739889350; x=1740494150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5jLGLhQmVC0qlHfueXl6HBhrQHoLB9yNWzNwwQeqEk=;
        b=IwHQtGgmD7OL8AcFTJV/N25mNPHyOUkYkCxyreXSgPfTUkc3ARY7n7qSfh8f5r+56s
         tsLSpPQZLUJ4L+dqojD7zTvRL5wmvabnuwbSKjkboguzHZKDv3g/mnCR/awJ/P4GwGLy
         MsnjOdZQaGGEOlMUhcxxx+PH4sZTUjaZUDFhFkw+KrDLx69Y1t4VBybUNUhWis18aLUC
         4k/lLDRGX8C22cVs2t+qBO7ZSV8m0fTkyKfhEA8BYNGW5sjIT7xJM1awMHH6DZqTGlrb
         UOC5V8DRYVwQ3P2ZL+dIPELOZT99r7A0O5z76cKcqBtlD2gIPbgtp/cdGAHSAsXdiYgv
         aSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889350; x=1740494150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5jLGLhQmVC0qlHfueXl6HBhrQHoLB9yNWzNwwQeqEk=;
        b=ZxzmSdayfTGmrv2TGVZP4GLyO2PvG5qAQBqbANa5LDiyNbQcwYEue6rukxyMU1y5lN
         Hq2S3l5rqTQ/3oXsSPQhvPphGJPjCpV6I/fBr8LQ3S0lKQSYsvJ3EbNxCa4FnafT+eLM
         vlj3y/kUABbVdmXPHkn4P3ah8+CRFQW8nA44Re+Vesm5z0QM91JeG8RKZ7AAHc/YAOBb
         B+8OcC76gPsLpmkeQ+muTCGQUPQFsRzhPF1Cf8tYW+tVHgdJ6tdErep09FoPjbgvGQIw
         WT2Roi05E9jm2jFvC9uzQwaZRWjKSpKqoyyOn+3HGx5uA8OHBjxTyqwemYK8MOK8z6wS
         +Urg==
X-Forwarded-Encrypted: i=1; AJvYcCUT9ts5/nTB9vlCbOrfiZJTy3pqkeEpV1gfTKEnbMD+SWwsUsF3WK4f1Mt39GwoW3MrOC7+iQ89jriT/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnpeRJXjpbNgdR3O+MMwpplFtvm38mdF+i3YC+T0KMDvc7Hq4S
	uAK6AzlVgTnprv4n6igrkmqEAk6xAWd5c35VTT6FFqVO+4Scu2uCBZgYZ8sQ20A=
X-Gm-Gg: ASbGncs/HnSMNjpPhGs5UfDsdpGt5V3sAn7ew8awsfswGzGGHvO9/JtlFl0QSLcRU4r
	nEcRg1kbmR3GpfhZq6hAEH+tItdbp509ysPQ+nHo8UYfrWaZTMrkD7CAyZydBUJwSapf7wz5DrX
	/N6+1gC1nbNMw8xehzCdn1Gc4i33wqUVjoz3b+UBxelKJtKZYrBN2eZ3dzoE6p8l357Bkc6kGki
	asx3OiwakWO4UOiraBAaXwxCxYXjk+Vrt8ZknoUQkq9vUqHMzl+uIPm7oEtP2ECvs5xBXDtazJ+
	RfJNkmQM3+T6M1vZeOS+I6Cn7TiBV5dK7RlSBW6vn3CislHIaQgMPqZlN7xY8J12QB9o
X-Google-Smtp-Source: AGHT+IGKMoXiWkHP1au7kQ0fIR2cGUqkUdWE1Ncg5Ll+++2+F5j00PZxd4OGLR6XNOLpN4JZMPF8vg==
X-Received: by 2002:a2e:8a9a:0:b0:30a:2a9f:e7f0 with SMTP id 38308e7fff4ca-30a2a9feeb7mr22374781fa.28.1739889349433;
        Tue, 18 Feb 2025 06:35:49 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309311777a8sm12360831fa.25.2025.02.18.06.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:35:48 -0800 (PST)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 6/7] optee: FF-A: dynamic restricted memory allocation
Date: Tue, 18 Feb 2025 15:34:55 +0100
Message-ID: <20250218143527.1236668-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218143527.1236668-1-jens.wiklander@linaro.org>
References: <20250218143527.1236668-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support in the OP-TEE backend driver dynamic restricted memory
allocation with FF-A.

The restricted memory pools for dynamically allocated restrict memory
are instantiated when requested by user-space. This instantiation can
fail if OP-TEE doesn't support the requested use-case of restricted
memory.

Restricted memory pools based on a static carveout or dynamic allocation
can coexist for different use-cases. We use only dynamic allocation with
FF-A.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/ffa_abi.c       | 136 ++++++++++++-
 drivers/tee/optee/optee_private.h |  10 +-
 drivers/tee/optee/rstmem.c        | 317 +++++++++++++++++++++++++++++-
 3 files changed, 459 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 02e6175ac5f0..b933f12d096e 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -672,6 +672,122 @@ static int optee_ffa_do_call_with_arg(struct tee_context *ctx,
 	return optee_ffa_yielding_call(ctx, &data, rpc_arg, system_thread);
 }
 
+static int do_call_lend_rstmem(struct optee *optee, u64 cookie, u32 use_case)
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
+	msg_arg->cmd = OPTEE_MSG_CMD_ASSIGN_RSTMEM;
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
+static int optee_ffa_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
+				 u16 *end_points, unsigned int ep_count)
+{
+	struct ffa_device *ffa_dev = optee->ffa.ffa_dev;
+	const struct ffa_mem_ops *mem_ops = ffa_dev->ops->mem_ops;
+	const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
+	struct ffa_send_direct_data data;
+	struct ffa_mem_region_attributes *mem_attr;
+	struct ffa_mem_ops_args args = {
+		.use_txbuf = true,
+		.tag = rstmem->use_case,
+	};
+	struct page *page;
+	struct scatterlist sgl;
+	unsigned int n;
+	int rc;
+
+	mem_attr = kcalloc(ep_count, sizeof(*mem_attr), GFP_KERNEL);
+	for (n = 0; n < ep_count; n++) {
+		mem_attr[n].receiver = end_points[n];
+		mem_attr[n].attrs = FFA_MEM_RW;
+	}
+	args.attrs = mem_attr;
+	args.nattrs = ep_count;
+
+	page = phys_to_page(rstmem->paddr);
+	sg_init_table(&sgl, 1);
+	sg_set_page(&sgl, page, rstmem->size, 0);
+
+	args.sg = &sgl;
+	rc = mem_ops->memory_lend(&args);
+	kfree(mem_attr);
+	if (rc)
+		return rc;
+
+	rc = do_call_lend_rstmem(optee, args.g_handle, rstmem->use_case);
+	if (rc)
+		goto err_reclaim;
+
+	rc = optee_shm_add_ffa_handle(optee, rstmem, args.g_handle);
+	if (rc)
+		goto err_unreg;
+
+	rstmem->sec_world_id = args.g_handle;
+
+	return 0;
+
+err_unreg:
+	data = (struct ffa_send_direct_data){
+		.data0 = OPTEE_FFA_RELEASE_RSTMEM,
+		.data1 = (u32)args.g_handle,
+		.data2 = (u32)(args.g_handle >> 32),
+	};
+	msg_ops->sync_send_receive(ffa_dev, &data);
+err_reclaim:
+	mem_ops->memory_reclaim(args.g_handle, 0);
+	return rc;
+}
+
+static int optee_ffa_reclaim_rstmem(struct optee *optee, struct tee_shm *rstmem)
+{
+	struct ffa_device *ffa_dev = optee->ffa.ffa_dev;
+	const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
+	const struct ffa_mem_ops *mem_ops = ffa_dev->ops->mem_ops;
+	u64 global_handle = rstmem->sec_world_id;
+	struct ffa_send_direct_data data = {
+		.data0 = OPTEE_FFA_RELEASE_RSTMEM,
+		.data1 = (u32)global_handle,
+		.data2 = (u32)(global_handle >> 32)
+	};
+	int rc;
+
+	optee_shm_rem_ffa_handle(optee, global_handle);
+	rstmem->sec_world_id = 0;
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
@@ -785,7 +901,10 @@ static void optee_ffa_get_version(struct tee_device *teedev,
 		.gen_caps = TEE_GEN_CAP_GP | TEE_GEN_CAP_REG_MEM |
 			    TEE_GEN_CAP_MEMREF_NULL,
 	};
+	struct optee *optee = tee_get_drvdata(teedev);
 
+	if (optee->rstmem_pools)
+		v.gen_caps |= TEE_GEN_CAP_RSTMEM;
 	*vers = v;
 }
 
@@ -804,6 +923,8 @@ static const struct tee_driver_ops optee_ffa_clnt_ops = {
 	.cancel_req = optee_cancel_req,
 	.shm_register = optee_ffa_shm_register,
 	.shm_unregister = optee_ffa_shm_unregister,
+	.rstmem_alloc = optee_rstmem_alloc,
+	.rstmem_free = optee_rstmem_free,
 };
 
 static const struct tee_desc optee_ffa_clnt_desc = {
@@ -820,6 +941,8 @@ static const struct tee_driver_ops optee_ffa_supp_ops = {
 	.supp_send = optee_supp_send,
 	.shm_register = optee_ffa_shm_register, /* same as for clnt ops */
 	.shm_unregister = optee_ffa_shm_unregister_supp,
+	.rstmem_alloc = optee_rstmem_alloc,
+	.rstmem_free = optee_rstmem_free,
 };
 
 static const struct tee_desc optee_ffa_supp_desc = {
@@ -833,6 +956,8 @@ static const struct optee_ops optee_ffa_ops = {
 	.do_call_with_arg = optee_ffa_do_call_with_arg,
 	.to_msg_param = optee_ffa_to_msg_param,
 	.from_msg_param = optee_ffa_from_msg_param,
+	.lend_rstmem = optee_ffa_lend_rstmem,
+	.reclaim_rstmem = optee_ffa_reclaim_rstmem,
 };
 
 static void optee_ffa_remove(struct ffa_device *ffa_dev)
@@ -937,11 +1062,18 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 	    (sec_caps & OPTEE_FFA_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
+	if (IS_ENABLED(CONFIG_CMA) && !IS_MODULE(CONFIG_OPTEE) &&
+	    (sec_caps & OPTEE_FFA_SEC_CAP_RSTMEM)) {
+		rc = optee_rstmem_pools_init(optee);
+		if (rc)
+			goto err_free_pool;
+	}
+
 	teedev = tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
 				  optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
-		goto err_free_pool;
+		goto err_free_rstmem_pools;
 	}
 	optee->teedev = teedev;
 
@@ -1020,6 +1152,8 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 	tee_device_unregister(optee->teedev);
 err_free_pool:
 	tee_shm_pool_free(pool);
+err_free_rstmem_pools:
+	optee_rstmem_pools_uninit(optee);
 err_free_optee:
 	kfree(optee);
 	return rc;
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 0491889e5b0e..dd2a3a2224bc 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -174,9 +174,14 @@ struct optee;
  * @do_call_with_arg:	enters OP-TEE in secure world
  * @to_msg_param:	converts from struct tee_param to OPTEE_MSG parameters
  * @from_msg_param:	converts from OPTEE_MSG parameters to struct tee_param
+ * @lend_rstmem:	lends physically contiguous memory as restricted
+ *			memory, inaccessible by the kernel
+ * @reclaim_rstmem:	reclaims restricted memory previously lent with
+ *			@lend_rstmem() and makes it accessible by the
+ *			kernel again
  *
  * These OPs are only supposed to be used internally in the OP-TEE driver
- * as a way of abstracting the different methogs of entering OP-TEE in
+ * as a way of abstracting the different methods of entering OP-TEE in
  * secure world.
  */
 struct optee_ops {
@@ -191,6 +196,9 @@ struct optee_ops {
 			      size_t num_params,
 			      const struct optee_msg_param *msg_params,
 			      bool update_out);
+	int (*lend_rstmem)(struct optee *optee, struct tee_shm *rstmem,
+			   u16 *end_points, unsigned int ep_count);
+	int (*reclaim_rstmem)(struct optee *optee, struct tee_shm *rstmem);
 };
 
 /**
diff --git a/drivers/tee/optee/rstmem.c b/drivers/tee/optee/rstmem.c
index 01456bc3e2f6..9a5013e3cc5f 100644
--- a/drivers/tee/optee/rstmem.c
+++ b/drivers/tee/optee/rstmem.c
@@ -4,6 +4,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cma.h>
 #include <linux/dma-map-ops.h>
 #include <linux/errno.h>
 #include <linux/genalloc.h>
@@ -13,11 +14,314 @@
 #include <linux/types.h>
 #include "optee_private.h"
 
+#if IS_ENABLED(CONFIG_CMA) && !IS_MODULE(CONFIG_OPTEE)
+struct optee_rstmem_cma_pool {
+	struct tee_shm_pool pool;
+	struct page *page;
+	struct optee *optee;
+	size_t page_count;
+	u16 *end_points;
+	u_int end_point_count;
+	u_int align;
+	refcount_t refcount;
+	struct tee_shm rstmem;
+	/* Protects when initializing and tearing down this struct */
+	struct mutex mutex;
+};
+
+static struct optee_rstmem_cma_pool *
+to_rstmem_cma_pool(struct tee_shm_pool *pool)
+{
+	return container_of(pool, struct optee_rstmem_cma_pool, pool);
+}
+
+static int init_cma_rstmem(struct optee_rstmem_cma_pool *rp)
+{
+	struct cma *cma = dev_get_cma_area(&rp->optee->teedev->dev);
+	int rc;
+
+	rp->page = cma_alloc(cma, rp->page_count, rp->align, true/*no_warn*/);
+	if (!rp->page)
+		return -ENOMEM;
+
+	/*
+	 * TODO unmap the memory range since the physical memory will
+	 * become inaccesible after the lend_rstmem() call.
+	 */
+
+	rp->rstmem.paddr = page_to_phys(rp->page);
+	rp->rstmem.size = rp->page_count * PAGE_SIZE;
+	rc = rp->optee->ops->lend_rstmem(rp->optee, &rp->rstmem,
+					 rp->end_points, rp->end_point_count);
+	if (rc)
+		goto err_release;
+
+	rp->pool.private_data = gen_pool_create(PAGE_SHIFT, -1);
+	if (!rp->pool.private_data) {
+		rc = -ENOMEM;
+		goto err_reclaim;
+	}
+
+	rc = gen_pool_add(rp->pool.private_data, rp->rstmem.paddr,
+			  rp->rstmem.size, -1);
+	if (rc)
+		goto err_free_pool;
+
+	refcount_set(&rp->refcount, 1);
+	return 0;
+
+err_free_pool:
+	gen_pool_destroy(rp->pool.private_data);
+err_reclaim:
+	rp->optee->ops->reclaim_rstmem(rp->optee, &rp->rstmem);
+err_release:
+	cma_release(cma, rp->page, rp->page_count);
+	rp->rstmem.paddr = 0;
+	rp->rstmem.size = 0;
+	rp->rstmem.sec_world_id = 0;
+	return rc;
+}
+
+static int get_cma_rstmem(struct optee_rstmem_cma_pool *rp)
+{
+	int rc = 0;
+
+	if (!refcount_inc_not_zero(&rp->refcount)) {
+		mutex_lock(&rp->mutex);
+		if (rp->pool.private_data) {
+			/*
+			 * Another thread has already initialized the pool
+			 * before us, or the pool was just about to be torn
+			 * down. Either way we only need to increase the
+			 * refcount and we're done.
+			 */
+			refcount_inc(&rp->refcount);
+		} else {
+			rc = init_cma_rstmem(rp);
+		}
+		mutex_unlock(&rp->mutex);
+	}
+
+	return rc;
+}
+
+static void release_cma_rstmem(struct optee_rstmem_cma_pool *rp)
+{
+	gen_pool_destroy(rp->pool.private_data);
+	rp->optee->ops->reclaim_rstmem(rp->optee, &rp->rstmem);
+	cma_release(dev_get_cma_area(&rp->optee->teedev->dev), rp->page,
+		    rp->page_count);
+
+	rp->pool.private_data = NULL;
+	rp->page = NULL;
+	rp->rstmem.paddr = 0;
+	rp->rstmem.size = 0;
+	rp->rstmem.sec_world_id = 0;
+}
+
+static void put_cma_rstmem(struct optee_rstmem_cma_pool *rp)
+{
+	if (refcount_dec_and_test(&rp->refcount)) {
+		mutex_lock(&rp->mutex);
+		if (rp->pool.private_data)
+			release_cma_rstmem(rp);
+		mutex_unlock(&rp->mutex);
+	}
+}
+
+static int rstmem_pool_op_cma_alloc(struct tee_shm_pool *pool,
+				    struct tee_shm *shm, size_t size,
+				    size_t align)
+{
+	struct optee_rstmem_cma_pool *rp = to_rstmem_cma_pool(pool);
+	size_t sz = ALIGN(size, PAGE_SIZE);
+	phys_addr_t pa;
+	int rc;
+
+	rc = get_cma_rstmem(rp);
+	if (rc)
+		return rc;
+
+	pa = gen_pool_alloc(rp->pool.private_data, sz);
+	if (!pa) {
+		put_cma_rstmem(rp);
+		return -ENOMEM;
+	}
+
+	shm->size = sz;
+	shm->paddr = pa;
+	shm->offset = pa - page_to_phys(rp->page);
+	shm->sec_world_id = rp->rstmem.sec_world_id;
+
+	return 0;
+}
+
+static void rstmem_pool_op_cma_free(struct tee_shm_pool *pool,
+				    struct tee_shm *shm)
+{
+	struct optee_rstmem_cma_pool *rp = to_rstmem_cma_pool(pool);
+
+	gen_pool_free(rp->pool.private_data, shm->paddr, shm->size);
+	shm->size = 0;
+	shm->paddr = 0;
+	shm->offset = 0;
+	shm->sec_world_id = 0;
+	put_cma_rstmem(rp);
+}
+
+static void pool_op_cma_destroy_pool(struct tee_shm_pool *pool)
+{
+	struct optee_rstmem_cma_pool *rp = to_rstmem_cma_pool(pool);
+
+	mutex_destroy(&rp->mutex);
+	kfree(rp);
+}
+
+static struct tee_shm_pool_ops rstmem_pool_ops_cma = {
+	.alloc = rstmem_pool_op_cma_alloc,
+	.free = rstmem_pool_op_cma_free,
+	.destroy_pool = pool_op_cma_destroy_pool,
+};
+
+static int get_rstmem_config(struct optee *optee, u32 use_case,
+			     size_t *min_size, u_int *min_align,
+			     u16 *end_points, u_int *ep_count)
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
+	if (end_points && *ep_count) {
+		params[1].u.memref.size = *ep_count * sizeof(*end_points);
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
+	msg_arg->cmd = OPTEE_MSG_CMD_GET_RSTMEM_CONFIG;
+
+	rc = optee->ops->to_msg_param(optee, msg_arg->params,
+				      ARRAY_SIZE(params), params,
+				      false /*!update_out*/);
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
+					msg_arg->params, true /*update_out*/);
+	if (rc)
+		goto out_free_msg;
+
+	if (!msg_arg->ret && end_points &&
+	    *ep_count < params[1].u.memref.size / sizeof(u16)) {
+		rc = -EINVAL;
+		goto out_free_msg;
+	}
+
+	*min_size = params[0].u.value.a;
+	*min_align = params[0].u.value.b;
+	*ep_count = params[1].u.memref.size / sizeof(u16);
+
+	if (msg_arg->ret == TEEC_ERROR_SHORT_BUFFER) {
+		rc = -ENOSPC;
+		goto out_free_msg;
+	}
+
+	if (end_points)
+		memcpy(end_points, tee_shm_get_va(shm_param, 0),
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
+static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee, u32 use_case)
+{
+	struct optee_rstmem_cma_pool *rp;
+	size_t min_size;
+	int rc;
+
+	rp = kzalloc(sizeof(*rp), GFP_KERNEL);
+	if (!rp)
+		return ERR_PTR(-ENOMEM);
+	rp->rstmem.use_case = use_case;
+
+	rc = get_rstmem_config(optee, use_case, &min_size, &rp->align, NULL,
+			       &rp->end_point_count);
+	if (rc) {
+		if (rc != -ENOSPC)
+			goto err;
+		rp->end_points = kcalloc(rp->end_point_count,
+					 sizeof(*rp->end_points), GFP_KERNEL);
+		if (!rp->end_points) {
+			rc = -ENOMEM;
+			goto err;
+		}
+		rc = get_rstmem_config(optee, use_case, &min_size, &rp->align,
+				       rp->end_points, &rp->end_point_count);
+		if (rc)
+			goto err_kfree_eps;
+	}
+
+	rp->pool.ops = &rstmem_pool_ops_cma;
+	rp->optee = optee;
+	rp->page_count = min_size / PAGE_SIZE;
+	mutex_init(&rp->mutex);
+
+	return &rp->pool;
+
+err_kfree_eps:
+	kfree(rp->end_points);
+err:
+	kfree(rp);
+	return ERR_PTR(rc);
+}
+#else /*CONFIG_CMA*/
+static struct tee_shm_pool *
+alloc_rstmem_pool(struct optee *optee __always_unused,
+		  u32 use_case __always_unused)
+{
+	return ERR_PTR(-EINVAL);
+}
+#endif /*CONFIG_CMA*/
+
 int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
 		       u32 flags, u32 use_case, size_t size)
 {
 	struct optee *optee = tee_get_drvdata(ctx->teedev);
 	struct tee_shm_pool *pool;
+	int rc;
 
 	if (!optee->rstmem_pools)
 		return -EINVAL;
@@ -25,8 +329,17 @@ int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
 		return -EINVAL;
 
 	pool = xa_load(&optee->rstmem_pools->xa, use_case);
-	if (!pool)
-		return -EINVAL;
+	if (!pool) {
+		pool = alloc_rstmem_pool(optee, use_case);
+		if (IS_ERR(pool))
+			return PTR_ERR(pool);
+		rc = xa_insert(&optee->rstmem_pools->xa, use_case, pool,
+			       GFP_KERNEL);
+		if (rc) {
+			pool->ops->destroy_pool(pool);
+			return rc;
+		}
+	}
 
 	return pool->ops->alloc(pool, shm, size, 0);
 }
-- 
2.43.0


