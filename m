Return-Path: <linux-media+bounces-31562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B197AA6EA8
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98DE44677FD
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 10:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F64023C4E9;
	Fri,  2 May 2025 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwXxWk/C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDD921FF56
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180060; cv=none; b=OECBW9UyAKC0d1OxiXMQYbiufpFj4zv6C8l7jw86kdvjYhKE1EDPY42pL4Q5YAM1bTFC1IklbhyxQWDkXJF8XKwAFieGP51LKzB9iQ82mElKyzD1HqiZlEXXMBjuW2lLUnFMXqgYCCzWiXY+k39ZG/9itfomCFxlpa9VQuWvkXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180060; c=relaxed/simple;
	bh=ClljJjvyTa+hIt59esq/vRhRnkjP2r10upW6mdBKOtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNfDZi/sAvMJcjlmzsqQBW/Kg+68ngKQytfgegD2c8hxMtPo5APypzy3EBBAYk2WOuq8FLNXActHIiVQrZ00qDQBvVdTMFamCaXhCPAT4bOLz6xptbVl86LS6S4lNOCVppt4N486F1Q1J8Xt0aAWHa4/rg6RyJtaLQVoOjt55Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwXxWk/C; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac29fd22163so312097066b.3
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180056; x=1746784856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=QwXxWk/C7ctR0XXAawQ2/OH4u8VX7Iudnsh62++BVJHzaUxM5UVU0h1oZ1Ubgu+nsx
         8aWk3m/mQChfqEq0k52fSDrgy8pViDBbfzi9m11A3FJjM86WSOJSa7CAR7TWQ6vcJ+i/
         rgPevFNZK5u9CMcOl6w+1FTNAFJvItCiK5eNPhqo4zvqrbO+2xANSGcaOMEwgFr1VlzQ
         4nTK092QWCQJeBUZa3qWSeaiA9dJaWDffcez3M/2rON1bV711+oRP0LOgmW1vU2fXnU3
         1pJYvENF0zJZUtD53E1MJnISi2uggjPuhwclNHIsfiYxHUXNfIWgovsKkf2lAB3zTUsG
         dTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180056; x=1746784856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=gMRikvGscJvYYJMCbzcBSLuK9/t+eVOXcrZLPQMnykIK8huWCZyJTmIWgP1/k0msdP
         FXGypp2ivS82a9vSwmCpggE52F8k8C/6UkCKnsOXCm7RVMPTXwn1sFO8vC6D3Nzzs4iy
         I+w5YDC8SLZFq0ZICH7QB5Im3WWvve+QFCFhYSzszlJqnBUNlL1+Z6YIaygdPC6BeBRA
         mhJmP8onpvbKJnJQNRHvDKn2MVreTWBYRcxwWIw3thLnRqNftTQJIGApdi+MvM5SeP9u
         DNE5XEMKfhpPGeS302ULOcPLo0ASfNsNrsyfzeKH6hdV6zNgPrLb/3162KZB6r+5xE5D
         BvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWroCwYuddzK5kjODWX4z0z4zX2W7tMWK0RxCGcY41y0YlW0MmH8grD9kICltGrXUkUdcGI7u/YuZ7F3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcCmR7EHxPu5WUeA46TQVyX7/X+jXKI4zL5zkYtHzGnHxbW9F8
	7QqF4olStdp9VqyyfXmCV6eOY1DZi7GKO2SJjO7Trr7vFYHpEkmfDZA+HTISIw0=
X-Gm-Gg: ASbGncu3G1Chew60OfistRTVHqiBsc3Dt+yAsDxhvCUintosbRh+0DFffJ/C+Cgv41w
	Z7iQNtNhiFtbqLsE4yV1S3DG7g65jMWoucB/7RHfaK7xI5hVAgEuOkPfVjV7/3K9YeFXCS9cYwG
	PyKr+bI0rA4vT7itlLxjb5eHvXHwA9tMiYxD0pKBqM/r1td3hUEI8tM5W6m/82FwGxrQcRaurKR
	dauNyUeT+Yx0FzTyDsfKIgrwsbtsur88mXczURzkNA3wsUtNp+axFGtPGS1OA4Jq4qH6PlaDE+H
	2wd5V+QNOqb9tkV3V3bCGedxotsQJsYqIUYJY3xcOHHm/VaAGfZOE4uVxnZRAbYtF7WHR3GyNM2
	Ohchk9s/XySZodQCB0A==
X-Google-Smtp-Source: AGHT+IExOoNljerMnP1yPtzh01rTrQJbnwgTFzxXZMgDFfUCD64SgckGTYoDWopJzNJPBPdV4tUdDA==
X-Received: by 2002:a17:906:6a23:b0:ace:ed3b:285e with SMTP id a640c23a62f3a-ad17af80380mr236112866b.56.1746180056392;
        Fri, 02 May 2025 03:00:56 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:00:55 -0700 (PDT)
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
Subject: [PATCH v8 02/14] optee: pass parent device to tee_device_alloc()
Date: Fri,  2 May 2025 11:59:16 +0200
Message-ID: <20250502100049.1746335-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During probing of the OP-TEE driver, pass the parent device to
tee_device_alloc() so the dma_mask of the new devices can be updated
accordingly.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
---
 drivers/tee/optee/ffa_abi.c | 8 ++++----
 drivers/tee/optee/smc_abi.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index f3af5666bb11..4ca1d5161b82 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -914,16 +914,16 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 	    (sec_caps & OPTEE_FFA_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
-				  optee);
+	teedev = tee_device_alloc(&optee_ffa_clnt_desc, &ffa_dev->dev,
+				  optee->pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_pool;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_ffa_supp_desc, NULL, optee->pool,
-				  optee);
+	teedev = tee_device_alloc(&optee_ffa_supp_desc, &ffa_dev->dev,
+				  optee->pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f0c3ac1103bb..165fadd9abc9 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1691,14 +1691,14 @@ static int optee_probe(struct platform_device *pdev)
 	    (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_clnt_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_optee;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_supp_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
-- 
2.43.0


