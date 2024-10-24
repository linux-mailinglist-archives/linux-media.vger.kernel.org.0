Return-Path: <linux-media+bounces-20204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E49AE541
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 14:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B558A1F2347E
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0662B1D9A51;
	Thu, 24 Oct 2024 12:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzRjQATX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABE31D9684
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 12:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729773733; cv=none; b=koHzXVVbHVKSFoY6z0ZKXs99tFy1ilFYPDLsF3/cE1wNmCx1cdkAdXV/CnfEtAMR9UUWdfOcin6JsEVk5vwgQYcAjVXGpolGN/CTFiyKqMYoCkpDZ+byECoRfpaiRcE+JMHKiUnLeKeVUgQuZ8fe7d4LfJyFgvoP4gQEEFa2+58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729773733; c=relaxed/simple;
	bh=glrOjwJPU+FD0qrlK5cGD5YxLlMMrm1v5pt+32xp/b8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CyXkTaOFe7dF53ClbPeUKrc0hCUm6hX3ECAWJ6h3gJxsq7xxTpPDIafwvtgyeCs9mbXeTFp0qr2phaTVxEMcvNkGWQskdbx7E58ePwqmfa57bOG6ikyDULzXXj1XfTcvQ3ck8UWfDgS8M1HFJuDai8ZehML6AHQqbuREIqQrM5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzRjQATX; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a5f555cfbso53259666b.1
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 05:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729773729; x=1730378529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYQP74pAccaxp/bWVaRuhS0QTdY30Bf36SGERpSHwKs=;
        b=OzRjQATXwBhV4gE1DuonLAVnHOWX3+52umhDOD+Wkusdj5McExSYnUK642RmN2cUjm
         SGts7pyw14AKeqtJjucUrBVND1mmXfu1DYRgJ1qjyh7kTRVFE1mfXJTsdaSe0XdM+Bhd
         fFxFaN2NQUZvGo46QYyB/Dab5dfQMtsmnGpqDItB7aWDB0A+pOpQvTDsHJf4T1pKh9Gq
         yDuR1CZRzckpc3cKIljCU76OArxDO7MQKbNneAPj19vkS+0JVxysuNHM+ITd7KS/9M25
         GRIay8hFZGKRH2V28pHBJp1k3wrf41z7eewBBQTxRK5nUO5oQq2smsi+27imNUGuOnU5
         zg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729773729; x=1730378529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYQP74pAccaxp/bWVaRuhS0QTdY30Bf36SGERpSHwKs=;
        b=vL7ezo5z3tnGm88ePHSX9soTIeNmtWzhDHXm/6aTd2Rq63Jcn7CrTDPCQFWQCqlgcw
         BEeqQPaGIO2OrERaPfADhvI+uvDwFB2PyGvPtNoUnaj5nixes2+KTAGxhkeMEx4NYgP2
         wjVVKE2GWvTfDeNAlwWFRMmKLdDMyHCBj4Nd90VgNiAkKBXLqrMG4JKtkup11Ap2T4WC
         VYpts1/V5uonM96iuhAQP7L9NkbDKD7KXxorvm1+Z7N/NFBLV57hxUD4Zk6XFC+BpOfu
         XZruB4vrmCpUqAFfJ3ouFW8fInpG552Ml5/kGQ8ACYU5UIQqIDPSO4eH/QHogfAnvTvB
         U+KA==
X-Forwarded-Encrypted: i=1; AJvYcCX5tvqYAukUlzrJBuDXJywMLER0I/gu1S9oaJhK1yqsRphSMF88O2ygrzzHgrdCn0i7e64PIjLIFgeynw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG7NI/W7NT1XK/irJeV8V17gcG05WiR0dr2q9noflwd+8+/l6a
	R2atZYPEBHpTQZhq53j3hXR/oHDi9A1AB0cuy/xWG8MulD7d/5UMYmSDd4TunAWR0A==
X-Google-Smtp-Source: AGHT+IEilgT2WydO1IHCnafNNt39ENQJ3H3MKCDUHgc+VjYTRmF5GAqFBuV0eTODjlNsewSKNthecg==
X-Received: by 2002:a05:6402:43c9:b0:5c9:5928:970 with SMTP id 4fb4d7f45d1cf-5cb8b1c2410mr6786177a12.19.1729773729421;
        Thu, 24 Oct 2024 05:42:09 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1550:4200:da3c:7fbc:c60c:ca4b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a65419sm5623026a12.25.2024.10.24.05.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 05:42:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: friedrich.vock@gmx.de,
	Richardqi.Liang@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/3] dma-buf: add selftest for fence order after merge
Date: Thu, 24 Oct 2024 14:41:59 +0200
Message-Id: <20241024124159.4519-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024124159.4519-1-christian.koenig@amd.com>
References: <20241024124159.4519-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a test which double checks that fences are in the expected order
after a merge.

While at it also switch to using a mock array for the complex test
instead of a merge.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 69 ++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index f0cee984b6c7..876eabddb08f 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -304,6 +304,72 @@ static int unwrap_merge(void *arg)
 	return err;
 }
 
+static int unwrap_merge_order(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2, *a1, *a2, *c1, *c2;
+	struct dma_fence_unwrap iter;
+	int err = 0;
+
+	f1 = mock_fence();
+	if (!f1)
+		return -ENOMEM;
+
+	dma_fence_enable_sw_signaling(f1);
+
+	f2 = mock_fence();
+	if (!f2) {
+		dma_fence_put(f1);
+		return -ENOMEM;
+	}
+
+	dma_fence_enable_sw_signaling(f2);
+
+	a1 = mock_array(2, f1, f2);
+	if (!a1)
+		return -ENOMEM;
+
+	c1 = mock_chain(NULL, dma_fence_get(f1));
+	if (!c1)
+		goto error_put_a1;
+
+	c2 = mock_chain(c1, dma_fence_get(f2));
+	if (!c2)
+		goto error_put_a1;
+
+	/*
+	 * The fences in the chain are the same as in a1 but in oposite order,
+	 * the dma_fence_merge() function should be able to handle that.
+	 */
+	a2 = dma_fence_unwrap_merge(a1, c2);
+
+	dma_fence_unwrap_for_each(fence, &iter, a2) {
+		if (fence == f1) {
+			f1 = NULL;
+			if (!f2)
+				pr_err("Unexpected order!\n");
+		} else if (fence == f2) {
+			f2 = NULL;
+			if (f1)
+				pr_err("Unexpected order!\n");
+		} else {
+			pr_err("Unexpected fence!\n");
+			err = -EINVAL;
+		}
+	}
+
+	if (f1 || f2) {
+		pr_err("Not all fences seen!\n");
+		err = -EINVAL;
+	}
+
+	dma_fence_put(a2);
+	return err;
+
+error_put_a1:
+	dma_fence_put(a1);
+	return -ENOMEM;
+}
+
 static int unwrap_merge_complex(void *arg)
 {
 	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5;
@@ -327,7 +393,7 @@ static int unwrap_merge_complex(void *arg)
 		goto error_put_f2;
 
 	/* The resulting array has the fences in reverse */
-	f4 = dma_fence_unwrap_merge(f2, f1);
+	f4 = mock_array(2, dma_fence_get(f2), dma_fence_get(f1));
 	if (!f4)
 		goto error_put_f3;
 
@@ -375,6 +441,7 @@ int dma_fence_unwrap(void)
 		SUBTEST(unwrap_chain),
 		SUBTEST(unwrap_chain_array),
 		SUBTEST(unwrap_merge),
+		SUBTEST(unwrap_merge_order),
 		SUBTEST(unwrap_merge_complex),
 	};
 
-- 
2.34.1


