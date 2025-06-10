Return-Path: <linux-media+bounces-34451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3EFAD38FF
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8DE9174176
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3C42D29DF;
	Tue, 10 Jun 2025 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpack1H3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323B2D1925
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561390; cv=none; b=I1geOvIhcB3UEsvv1esLZqvrHwqIQXURotKWsrAwUIeQ5v2d2y0A8NS2uCmwRyGNPesd7nVZpnCHOMk6vi7jb5iy8r7+jMHDCPm2dK//ERyKGLAXCNAwWwXnr6BRGTgKGvwFUolPagB8tJOBPMpiY/hpe9WNwOqmrhFEAWbUwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561390; c=relaxed/simple;
	bh=y9Pvj2QG+UNV+8LvIFOB0h6iFTE4oVA8vOic57vEe2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1+9AViTVI+xTdKIfEZSh51y+JRO8IfCdZCW+Gu18hxZVe/LWBcj/sgjRKqUE3le1LzEUSSZpaqnVArRmzjZjXHervx3+bcS3wogyd6CzTTuIwJSnVLJqC8zz58NxqZJInoDiroN6l57t1LrgKzPke5S/QScjMG2SJmL64LdPR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpack1H3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad574992fcaso818946866b.1
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561387; x=1750166187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHIqhioRnhNt4aLsaniXn+7U4R/QZgWIuNSgSngcP8Y=;
        b=wpack1H3WTkG6tgO280HwHhHEcjvmAlA4PsDAu1acCibSEUGl5W9lwRfk5GAR76YHw
         nBLJGPzhwWEWEOPywiUX7yzVl4tWYNaLLLYzz/EMvDhhIjDoP6041jPTWLJ6qNLbN7kh
         YKAafME91Vv4GyBaz1psMmKuyU1IRZwINi/hRA5rWw8lTMJL/cNT3PwMcjbdFso2Z/m1
         T5CcuERrBZ73ftZWWx0R7KCUKL0uVspC+wEPTUhokflLXcvILqvcJyNkNSSupQTDoO71
         mlgGFVKX9MffgI2P5od+eF5pF4o+tvdava/XATZvFYXLL2SIkit7sUwhI+QizhtCfZMQ
         PV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561387; x=1750166187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHIqhioRnhNt4aLsaniXn+7U4R/QZgWIuNSgSngcP8Y=;
        b=DGykGH2GA9mBwV54ofsnVwS9gNJkIW3evqJw63j5GCQZj6wgUumYAowuDeZdKgpSm3
         aMpEweJTG4LP6M1mur0tRaMw47F7hK2KtQLJvRZtvCCKE77zLxryTpHlkdeH+5hNHEEW
         qMOXBA72J7xq5EdsdtmrmJABJYuEdHMPtAu6y/YZhxLw0WBV5tKTb7fzb26qvVMoAxJV
         DEJSTCJqlFYYJYWc/ddxJEk8d9ECi68TWZvcE30TK7rsK8yevC1qfLgNQAH7pfYoT1XS
         cUZnygzfaqdBlLNPBIZbLlw+Wk0KDik9RRODtA5mJuDFjssSCcHAm47SIw+RP3mUJzCO
         xPCw==
X-Forwarded-Encrypted: i=1; AJvYcCUD7di6SHxvzAeeDXmDRLfV5UauyANnrM1pjHIfJVnPoY1jniQslqhkoyUS2dqrS2v4GBz07aZFVq+Y1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCxU4Qk52n4Dj6Qc3QsoDHe6Ol3Q7yfnmzocbUCpZzAYawImtt
	sS1XlB1Brvk6OxVCAcwmBSS+fvCvXYHrHufB9iB6+DlcPvVAYVM7f8W99wEixiabGKg=
X-Gm-Gg: ASbGnct7stABKeLShdQYSSH2wJmZXhRW6gDuLh+p0ANT9gUu+PdluA60yq7nERajlpW
	2EGGeWytUfriqs/TOArB4KsDchP7NJlMeMouH3MhvRXLU0o/EOh2Tdw5kbCb+hChrJ0rDtitsr4
	nKbNiMECsn2X+ga1ND9Xbk3Fpr/rKsEcMpw4ZrOh3JRRjNraTDiMU0xioW9JKSKLi1Va9XjMYKx
	DqDW1MH8xGdiu/VahuY8mLLX/MgZgUtpVHDAHpzVOVGLEs21mM12qY7gsTQgUqk5R9PhSaIX1ft
	sl2LfVF3xqATnhVRaVTWQsd1LK43NcuHu0zo+RZjkMtauI4v8G97AmL+oaNdVIk84E1u6woz0kD
	NDAnOEpXw4RJigTFS8YNp+RY1S1ZQQqps2KHNuTI=
X-Google-Smtp-Source: AGHT+IFRIlvxt0K3SM6xhnBaF7S6vn8tyjGnih1oB83ay9sZPd3eAVoEgV9w1AjoIqTxnsVFcfN65g==
X-Received: by 2002:a17:907:8690:b0:ad8:9466:3348 with SMTP id a640c23a62f3a-ade1a978de5mr1630006366b.36.1749561386585;
        Tue, 10 Jun 2025 06:16:26 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:25 -0700 (PDT)
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
Subject: [PATCH v10 9/9] optee: smc abi: dynamic protected memory allocation
Date: Tue, 10 Jun 2025 15:13:53 +0200
Message-ID: <20250610131600.2972232-10-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 78 +++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index cf106d15e64e..fd1d873de941 100644
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
@@ -1628,14 +1694,20 @@ static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
 
 static int optee_protmem_pool_init(struct optee *optee)
 {
+	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
+	bool dyn_protm = optee->smc.sec_caps &
+			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
 	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
 	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
-	int rc;
+	int rc = -EINVAL;
 
-	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
+	if (!protm && !dyn_protm)
 		return 0;
 
-	pool = static_protmem_pool_init(optee);
+	if (protm)
+		pool = static_protmem_pool_init(optee);
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
 	if (IS_ERR(pool))
 		return PTR_ERR(pool);
 
-- 
2.43.0


