Return-Path: <linux-media+bounces-39736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 379B4B24118
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 977261BC1778
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 06:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD19F2D1F72;
	Wed, 13 Aug 2025 06:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZgnsEeS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452002C1593
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 06:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065054; cv=none; b=IslazjPkGIGjXTHPVx2Wd9auApkH/GVFe+K4UAlReVhV8rI1R9WRXICB4RfWuwCJBEcaiaEfdzpCZgc82xHEHW8g3qwKWaOI7QvQWpggyeLDXsic+TbcbIaBjt8WkqzPYGGH/Ma3LAy0UJ2YZ/r/elu8rq8VBmK/cQ826XkQUOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065054; c=relaxed/simple;
	bh=RREeFH4FApT8BsWG6hYwTdwXNy+z8q66uH2RuunAKOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cIZJpKBHnPpeGYJZI9A0fe6ynRgpCUaBZ68U0OaqZvIDSv7WrZwFvYacH0YQmERtxllCRdW04uWsXR75sV326cAwrqGxsonCyKZMd46gcW0NyonNvgOWvpp3qLRELWFNxW8+dlpvRpOcvvwc00+UM8Qz9T+rllGUWdCCi1vxxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZgnsEeS; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61592ff5df8so7819452a12.1
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 23:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065049; x=1755669849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMyd1M5LZgFUuwfgUjsWaWr5cxJRx+F31yZrIJB0d8c=;
        b=MZgnsEeSsuWCIyIuBRl6oXO+vcBuE51wRKfdmjdXHVAnHG2YhQkK2NgbHcuPsxklNY
         OP/f7ZaVxRbp+fXo9DfB5Xcz57D1+0lJb6Yjx1hJxTSFHcN7XXJ3Gt43iTBaR1HyXaN9
         jC+T6Ky8muEFHBkXA/LtghSa/6cNYnxUyk3t5AJ0h5J/ahYoowIIL+9PYFNylbp+g5bw
         6i2+LqutekArGQGiwOy286HmBfowMM7hszN/pKGFRPulomNDL54gcOdW92QGrDoDxwO0
         FbnEcDAgqMn8oipBefvuqHU9K1MsE1J5L3W5LjOOL8G8gsyjUwplaGndP2depz6RannD
         C9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065050; x=1755669850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMyd1M5LZgFUuwfgUjsWaWr5cxJRx+F31yZrIJB0d8c=;
        b=BodwmRrKpIq75eqGzyiRXUsCrvUJUeKQkM0LiNXGn4I13xa83V6T0fo7EECGodGuT9
         xRK1ep4mHpZKVWWKNIupVJHxq9Ruyb/gJ0KQHC+7C69k+WkhFrYXjsfzuBZEA+/0HG1M
         TGIvJwMJDw24XjeeS1Z0w1+GtZIc2qyjX0XImsMLvcUHpTCdEbzHbyBv8XQ5lb4EEcLf
         zFXyHvSAdj7QVR5AINwYWlxeiMKVgGcM21C5VPlOFiVziIDGqgsFUzLIsb6ylypk2gMp
         Yz+bntmBWjUkNY4YsbcLwi0H1vnexKHNTJEqq4qAvn+GA30mBchldoz8dCg4Cin4zuix
         sFFw==
X-Forwarded-Encrypted: i=1; AJvYcCUAi1H9vQJRaH1SW6radsZk+hB454Gk8yVK9vXGzj8+AugeDeBzlpFYe5cIVUQm9uzeWwplFAcfkATrTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVG5poKH19FquW/l0jX0XUCLu5QLiOmReeWTIvEeauQHU3XF1I
	L5A/Lkh1j2KE0cH4kD2qoHe08pP0jiciXK9AQNjUtnAwKkhz+C1Ikcp0hTwBdLzPrbs=
X-Gm-Gg: ASbGnctKXrza8O0LkMBYIJ22/e0AlQveAiITrNlkyfIRBW2krNH5go89bV9x+w9WbVQ
	OzX5Xn9U7mNIOLw2M2b2YP0/pQe6d0M329z8JU3Zuy73RaDLlx35srKUI5HaLquHwonPU/V7QZC
	E7Vm+TgQJTH1k/2aCPNhY6uTEACpBOTpzNHx9QvP3/NW0RacyuwhMNJtVaBYIXwig4uBUfOA6br
	+YKyt6LyHJZ40fMKFU8LftBF0SliKIyj5kvrOqgBxNctkOxI0ebUdeH8XjaUyBBoi2nidnEKGaw
	2eCzxpZ028WBdO8/UWOa+/j2DsxcZRrk7222JMPUl0Znps7Mud+H+N3inmX/QtSO18b5/zpzgEs
	kWJ7w0kNcoLIrVliarh3WU9hbd2/jYLp+t30+lQa9E5vPdELnW5TuUaDDwUzyl2/5hid/ISPxQj
	A=
X-Google-Smtp-Source: AGHT+IGl+zk2kZ7dGtXoXvUAogPksLb/KD4WUBLmDCFuz3Yjsb2gUsdZ4PxNJjaVjkahgiQaR0qEBw==
X-Received: by 2002:a05:6402:2753:b0:615:38e6:b739 with SMTP id 4fb4d7f45d1cf-6186bb8e5damr1297264a12.10.1755065049472;
        Tue, 12 Aug 2025 23:04:09 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:04:08 -0700 (PDT)
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
Subject: [PATCH v11 9/9] optee: smc abi: dynamic protected memory allocation
Date: Wed, 13 Aug 2025 08:02:58 +0200
Message-ID: <20250813060339.2977604-10-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/tee/optee/smc_abi.c | 78 +++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index b4c007ed3b94..0be663fcd52b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm *protmem,
+				  u32 *mem_attrs, unsigned int ma_count,
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
@@ -1627,14 +1693,20 @@ static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
 
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


