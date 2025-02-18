Return-Path: <linux-media+bounces-26292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B7BA3A02A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 15:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36C18177A63
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9385226AA8F;
	Tue, 18 Feb 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkL9TSMr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF22C26B972
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739889356; cv=none; b=c6eFhNEylo3LbUIIXfpmkh86v28orccgy560LxTrj1o9c21kS23H4QSvcNra2ndK+bieBvZmiEaMHR8YWe6qwHpYqGymxpP8b89u/5SzAU66R8qHfSlUaefzaqp4VdiwpbB+3OK90EVw0UZ+pR/hO3Bj1h+oG+tYmld0l724dug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739889356; c=relaxed/simple;
	bh=0Yu6+P6W0B6ua0qPwtDQtme+SvUsI4cLl5nyAPSU1As=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOibDYYXU0e2ljMiPFEfx1a8Dn4zzaLfQ4r6ktUzRxzmbwYjpKCVYXVsqjTOAPyi2X5fDAQpvhHcg+l6SoGtJ6TdP+LEwKiNw2qFO7AyxRfbuXeCvpNA7yLw0Ss6repzYQen6r6BkO9fTiopVMiX2dmubht3quLcktdZ1XsW4bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WkL9TSMr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so5517462e87.1
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 06:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739889352; x=1740494152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8kowqzBNNR30VBKvjQTsvLxpaN4SxkdbGASJgFBpcA=;
        b=WkL9TSMrX1z9I1yEDAQMFk0h2P6A26KBz6ZeiRdhl6nZBhvHqlmf5mzCymZLVvKej/
         F8D2lCso8KF3pX6m2MotsBZKe74qWcUMbrOwkyqvootCCGTpE0z87cx0fSSVlC4C5BNS
         lU0+GztECI5zPVPMv10huZXlWlTKZA23ZZN4Hoc6dcGQSElQiteAbqaLqpZN291kcf+3
         IkPxwurkw6x7yzzrqn2QnNvAFN/UcYBuNi23croj5ZL9CVorq3AioResvqqq/XGJF1GZ
         BOcGAIXPWSGabQBskjk+c80X/YrGC+1EXAOUjG9Q1rTXrz74iWwbDyB7U87/nATHIENR
         3hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889352; x=1740494152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8kowqzBNNR30VBKvjQTsvLxpaN4SxkdbGASJgFBpcA=;
        b=dGemQkmDZDM9Ie/Bwpcn53rNIr5xTffFGB62Rwr/2MNhfE1ibGKT8LTyodJePQQZRf
         MSU/JU5mguReATIxacqbGpfPpQxOr57Dcwje0tQSLYYZJwKFVUK5sRPnGqVi2qcdBNeN
         J4txadY4EkhFOMD9EVokCRTKnnOdLhz7MdKI/9kBK6fcessepTebzS7JNJhBEQgQfotH
         uAWM4tgGhkmFxx8pwsr3AiPQ4dr/1oTIIrjrQYftjAbnygY4AtDwxCXLLo+CicrRzbB7
         uCNoRe+LYMeo5WxErA0SCxVLFCe98U9s7c2Gy3EHWUr2VYepGNkHS39IHEWrg6wYr2rf
         3K2A==
X-Forwarded-Encrypted: i=1; AJvYcCWx1h43u5ti0gt9hjthvB/fofnRqmzDaUsBhsDHpJY/derkvdow59a43D4JIEco/pUFIPP0ormiV+RuTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEc9GvlbDWZg0LFflXhrtn6jXfDSB+gW+CZLBMgl31e7efyXut
	+xioWITbLg38GPR2L1NsOfmidh83eEamtWDsde213p8QfdeeZhTqctPHUmlCrUg=
X-Gm-Gg: ASbGnctz3SENva4mWDdYsikRLv5tj6uheuMYqWN3MyD/Yewg25/4VRP6MSk5JsM+n60
	58h0yfwGB5pXOHEBgwouHgqLwXKH5KCDaYx6VjxbZdzgaVaJg2jvckCmXs4FN2imoHNgsc5g/Cb
	P0YKnsOVaM+G78TRsyy/RExSdsRz3pkkDlY81otMpxQyOHn/B2ZDNP2SFgjkcN1b3Ei+yZa0c0i
	guP55PfVEA8+AYTMs2DZcfKGege4y7oBwnjWkLwc/wVU9G2yi42Ry1k9YE6TNTa6ZfrQbHrdMqZ
	yNVYDPL5yPioX+Foy8ildVbPASiqXMUVKhPcxTp80P7h/+nVPrevc84FGaMqDZAWEdqw
X-Google-Smtp-Source: AGHT+IG2QSia+pqq7pQb/RgZH7dPW4LfCNk4j/lwNSmjg+mmOj+PY1NlVhF5Eyeo9wfiKu01ckwckA==
X-Received: by 2002:a05:6512:ba6:b0:545:2fa7:5a8b with SMTP id 2adb3069b0e04-5452fe3aaafmr5144347e87.27.1739889351902;
        Tue, 18 Feb 2025 06:35:51 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309311777a8sm12360831fa.25.2025.02.18.06.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:35:50 -0800 (PST)
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
Subject: [PATCH v5 7/7] optee: smc abi: dynamic restricted memory allocation
Date: Tue, 18 Feb 2025 15:34:56 +0100
Message-ID: <20250218143527.1236668-8-jens.wiklander@linaro.org>
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

Add support in the OP-TEE backend driver for dynamic restricted memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 76 +++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 11589e5120c9..ca0cb5045f5b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,67 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
+				 u16 *end_points, unsigned int ep_count)
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
+	msg_arg->cmd = OPTEE_MSG_CMD_LEND_RSTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY;
+	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+	msg_arg->params[1].u.tmem.buf_ptr = rstmem->paddr;
+	msg_arg->params[1].u.tmem.size = rstmem->size;
+	msg_arg->params[1].u.tmem.shm_ref = (u_long)rstmem;
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
+static int optee_smc_reclaim_rstmem(struct optee *optee, struct tee_shm *rstmem)
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
+	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_RSTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+	msg_arg->params[0].u.rmem.shm_ref = (u_long)rstmem;
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
@@ -1258,6 +1319,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_rstmem = optee_smc_lend_rstmem,
+	.reclaim_rstmem = optee_smc_reclaim_rstmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1628,6 +1691,9 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_sdp_pool_init(struct optee *optee)
 {
+	bool dyn_sdp = (optee->smc.sec_caps &
+			OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM) &&
+		       IS_ENABLED(CONFIG_CMA) && !IS_MODULE(CONFIG_OPTEE);
 	bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
 	struct tee_shm_pool *pool;
 	int rc;
@@ -1635,9 +1701,11 @@ static int optee_sdp_pool_init(struct optee *optee)
 	/*
 	 * optee_sdp_pools_init() must be called if secure world has any
 	 * SDP capability. If the static carvout is available initialize
-	 * and add a pool for that.
+	 * and add a pool for that. If there's an error from secure world
+	 * we complain but don't call optee_sdp_pools_uninit() unless we
+	 * know that there is no SDP capability left.
 	 */
-	if (!sdp)
+	if (!dyn_sdp && !sdp)
 		return 0;
 
 	rc = optee_rstmem_pools_init(optee);
@@ -1654,7 +1722,9 @@ static int optee_sdp_pool_init(struct optee *optee)
 				     0, &res.smccc);
 		if (res.result.status != OPTEE_SMC_RETURN_OK) {
 			pr_err("Secure Data Path service not available\n");
-			goto err;
+			if (!dyn_sdp)
+				goto err;
+			return 0;
 		}
 
 		pool = tee_rstmem_gen_pool_alloc(res.result.start,
-- 
2.43.0


