Return-Path: <linux-media+bounces-29399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABEDA7BF60
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 16:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29E807A34A0
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 14:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AB31F462C;
	Fri,  4 Apr 2025 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkJKGOjU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BAC1F4173
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777152; cv=none; b=WPOtxRfMgw78iRBbEr5sasGhZOe2XoUaFCHJCgpT0nj1HGXfySnAA3Df+X/YKx3aGC4ySSggB9gDR8PI0fGFrEqK57GIvqeaOH5OSwyjquYc4hYXsvJc57XpvF8RaS0dWmFI67DgX4GGL0TCiQC75YBzduWjAV6TaHL04nfsm2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777152; c=relaxed/simple;
	bh=ClljJjvyTa+hIt59esq/vRhRnkjP2r10upW6mdBKOtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3PYx841MCB3xfkRhh8swjOwZ1xvQwpv9Gj0/plGuvQnubl+aTQJzeMZkPPcs0qackbmbJw/LsmdHSjs91Cuc5mHNVD2jUWedXcWgkMmudCvRezlkKxNfWuYG9Vki962U9V3OL18pg7ggqk+HfXJ8rxKJoa6saxFPwtvYBF+6ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkJKGOjU; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so2795149a12.1
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777148; x=1744381948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=hkJKGOjUH8FmaNaRqHIO++NhZGecEuF+oSre4s82U6omng+MowgS6q/I0lP7tWOQhi
         jPJEVNIVD35zcmtLLfPlLvC1COXGxjLPp1bJtSy5zI5A91n3R4mFpiuAeLhIyrjn+oyk
         iP2u8HCf4B94hRBc+az+hw1CfSJZ8+mF2P9egqBTUzh7Y5yxoWz8ktY/tqfjn1MuahDV
         ayynLxfdI7I085tMQXl+hNNWxLHPxZoHed+WM+xjK7JbsR0oIKv4TrN0GTQ+ED8PS/tc
         41rchPIevMIbASVElaE9NlNsBy8jTL7tCpqvCPEzIYdd3j3aWxOeZkMNZRO7JGfq1b5r
         JGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777148; x=1744381948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
        b=XN7CXORsewseR37aTWTh3x4WdfwdNOqM/rf3V5581VLDs4LrZCCWzL7p2Cwo4IhxF2
         qcKS/VePZ51GSup4PRaZbYxztgRcIN8BRg9YklVQ5o99CWV1oDcLH9GvnanDWY9+yD9F
         rO/tlpobhknh5rY4QH4vLUWisnNiwzo5CLwUvnjkylwZQDVVyPUPj+kNFQPn3mczuIZo
         4+h1+AFsx7Ywz9n3y5XFdW2ZujZGKtgJIYWimKs3eRbJpuXjKZY5gPLf4CcP19XK4GGA
         Zqp9+75KBWMMXCrJYISzJaV+2O8/FtmJa33YoQWeBxEi4kM2UAIl2yevxwdYKVgBM9Ea
         cODA==
X-Forwarded-Encrypted: i=1; AJvYcCVSCUkhmeGnLZO66rbfAQrRdRvyrDyLJQstvgp3oWUtv9Nyt1CYZt0GvcYWE8SYynwbDMbwpR5bKH+dZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRqfbL/ptrBW42g14LjvEFoQwqGC8zz7DM7lr0TwFkZq9Oyh2O
	FZ4t/bmK0tFIkkHJ3zSwvCSlUYoC9miFCHGaQ/un1C7coHUDTak3dHe3v/DOevA=
X-Gm-Gg: ASbGncuMIhRurv37oPhkt9MMTI/RNkneBYSOaEG3DfT1oRUZ0O4g4kmHvOXOoMsQkw0
	8eV6gHPO12/apA248bcfb62WX4ImU2JJcggk+UPENy6EcWqyr4rpdBZTHyiA9hThivT1bOUOLE5
	z+nve/9klZyxvEtkqRnIMUhAvVucQxlW/+1wx4XOQIAp6EnJUqM5ysCHBvr9k8hBu93aOc8pE6m
	nUQ5UBOOsZ0/yG0iMy1H5qeZk0RV8UhQAlKtQPu2NpGlG2ElpLkuAIvct3IoVGCsbMXMmOrBtKp
	7jyxXEno5rVe/j9eSg2jzhYOAeAfCRExKVygPg++DMBMK5CvZvMOo7Dn1pwfZqo+n5WOwOvELRh
	Pc31PtuEWgY2o/riTZncB5A==
X-Google-Smtp-Source: AGHT+IFkJLuZYKHkFqitQEQ3Yg1FLEq81E4C9if1/VM+Yaec4v2BrToG7RwujiSsE0q6nDmGLkPdOA==
X-Received: by 2002:a05:6402:4415:b0:5e5:e396:3f6e with SMTP id 4fb4d7f45d1cf-5f0b661aaebmr2120030a12.26.1743777148470;
        Fri, 04 Apr 2025 07:32:28 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:27 -0700 (PDT)
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
Subject: [PATCH v7 02/11] optee: pass parent device to tee_device_alloc()
Date: Fri,  4 Apr 2025 16:31:25 +0200
Message-ID: <20250404143215.2281034-3-jens.wiklander@linaro.org>
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


