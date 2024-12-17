Return-Path: <linux-media+bounces-23566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCC89F488F
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E41F216BFE5
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9721DFDBB;
	Tue, 17 Dec 2024 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuJzgY4Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79591EC4D6
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734430115; cv=none; b=Hvcej2eQadW5XUgzrAujnDhaCI3yzCxvKFI/0riw/RSP3yxOlUMoihPs7wCkB3PzoTRBBgXNqK5QPliyApO4inPA/mkOCV5wEfxnogxyM41ZL+KJ/HhwcArqRrMINY6QPH7DZlYMe/iFoshQ2PFDFgzAiMTxV+sOYuIGyDFh32A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734430115; c=relaxed/simple;
	bh=4KxUi4p1DATCF1nyixe6Uc20IjjJk8/zJCMWNhf7eDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttI5FCKAbiVlzSDMJPLCLYbqTQGutSPZIL7QddTKefNjpKrxdz1jibfacWhCuqL+Q8npm+y3k1+oClkL2roshAfo0DEPWZv3NAelezvsJGS7UgXKVkwG00aaohNJmR7sdGzCoYSm4dIwxcHKQAjxc2yBakPl89FO3zAExv6L3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TuJzgY4Z; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3002c324e7eso57760291fa.3
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 02:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734430112; x=1735034912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pvK2dryYlnCmix3/yimTZ2hrNh+UDq3X0M3uPxCWwA=;
        b=TuJzgY4Z+iS4w2iH8vFOtBwuxukbHCu3dDE1MEuFqU37iJ3GutOo5uYcX3nBxbbU6B
         ePe3v3Eqz6ynbOEj3ytsEsTFTpDzu6d6R+GMEdm8dzL/az5biwkbUlW+TNrRYL9Pg8Eu
         hX6hhQszqfFO3A0mp93SCzd7x/yGCWYsv4RjB/UzCl4pk63ekD6SizhNNB5HXhlhN3og
         KetTaHdjaHtdYfsA4qsCCbsugOcFLzXAJIxOzUo/ZESl9TNQA5fHldjhadqkH2F/HYeW
         yO7pOsEz9GYBVhGvQkYXhJapVmGQ3YqLZRHMtLkUsHebjDPZ0g/bIT4hDUi6ceNSfD0Z
         4lWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734430112; x=1735034912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pvK2dryYlnCmix3/yimTZ2hrNh+UDq3X0M3uPxCWwA=;
        b=HO/jgRfTXwWe2Lv1dEhyhuL9A/UKpNzoVVTbiIxjXEM4Umxe2J8dt2w+ZCbXGLgfjm
         9iNZ2N3vKfWOKzM7UqKn7eH/utx9dnlxcafTChO2rgW3p9pOqKREYVof78LaF/hnNLzy
         VWZVEZVC3s4Atmd4lEJcw+QBOqWXbYnVWCpiZcenmsDOYNZBjyDDgweu9YiSYU/xp1VN
         FvAJY24RXP4a6ZZCRui8x69dPTU0Z+1tm7sYWNblfZy5OKTgnIXF2+Q+t1JNIG5tDe5b
         su7E0ocjjHjvItJCe+F7GNtBE7klnojISR4BSOLK3AzbPPBNJu6QiIGKA1xc1r+UQIsW
         KLdg==
X-Forwarded-Encrypted: i=1; AJvYcCXKKRgAvItklhrRV+9XL1mDaYGGSpRSHgPsIQbbXs4o/juaOvA8xSs4c1GBfG95j7lSdcaKJA1BeT5u1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcT17QaMDiLjLm6FzDFxFDl9SDgeZBi5W/lzk6AiYjYFy86sMa
	7XVa7yq8aFI190+8cQ3/hb4w026kBffqaE8+i7BcGRKlgTSyZ0THqEG0hBzC+r0=
X-Gm-Gg: ASbGncvq/zy/mIkkDct6aPR2/b9aXuAgTSkTu6BB6126yppKK7+DFrVwH7Ibi81FDEI
	DzC/P0UfR1qKixzVS3vKxI89lA3SdSeCW86Tcyk0n8DUAHu3pDRVdEkLSn06mz22V/+VrORGRqI
	lIy913ypnRCGoS8DzLE2YfuDcpQBW2QQ8MRFU8IXS+cafN8soYnx7QpGT6qPGk6BfYILCF/Oi1c
	M0ABcKDMpHRUhQK65rbpVLZgfPdvVnzT9CT3GNawZBwU2Y9RS963kppOiXiEKMceQtklQfjV6cs
	FcOlEMe67euuXIZOlK+A2uAmHPAATKtBTA==
X-Google-Smtp-Source: AGHT+IFUOf8R3oSz8XVmOSk4m+OqhuOXE2suAkhuB1hb+UqdPUyHZKSAPIv6wONSSMTF4nNdh4CWRw==
X-Received: by 2002:a05:651c:1a0a:b0:303:41ea:7910 with SMTP id 38308e7fff4ca-30341ea798bmr37947871fa.34.1734430111988;
        Tue, 17 Dec 2024 02:08:31 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a69ecsm12122681fa.111.2024.12.17.02.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:08:31 -0800 (PST)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v4 6/6] optee: smc abi: dynamic restricted memory allocation
Date: Tue, 17 Dec 2024 11:07:42 +0100
Message-ID: <20241217100809.3962439-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217100809.3962439-1-jens.wiklander@linaro.org>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
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
 drivers/tee/optee/smc_abi.c | 74 +++++++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f5fd5f1d9a6b..25b02dbbc76e 100644
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
@@ -1627,6 +1690,7 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_sdp_pool_init(struct optee *optee)
 {
+	bool dyn_sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM;
 	bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
 	struct tee_shm_pool *pool;
 	int rc;
@@ -1634,9 +1698,11 @@ static int optee_sdp_pool_init(struct optee *optee)
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
@@ -1653,7 +1719,9 @@ static int optee_sdp_pool_init(struct optee *optee)
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


