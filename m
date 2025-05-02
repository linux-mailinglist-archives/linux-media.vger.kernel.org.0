Return-Path: <linux-media+bounces-31567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0394AA6EB9
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D88F9C22E4
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 10:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C792244682;
	Fri,  2 May 2025 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAZA1dDr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A48242907
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180070; cv=none; b=YpBYcNR5X/RCmADVfE65R/n1OtkaEnlJ0EFrkTjCV/z7xtVYRIWWXRxGAzoiUfuq8U5d3TIR2uKP0I3dMWbzF7m86k/ZU/62sqWlrAOZZ73RWYl0+/qqQwUpoSJZzhI69Apk3bHevHYQ/TodBhqf3JX4DOEKkuns4Bg+QChMmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180070; c=relaxed/simple;
	bh=J9LDfo6gNpW71xs4AHsdLctBmBSEcjpZaBz793nPpSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnenVMY6/5z2np0zCYvH87jsZ27G8ENN/2kLMTFo8px5zPaZ6lKFSpKcrWoV0mDFKL539L0xJQgjJ1g1DQw5HM3MhE3QYVC6RvDpGCpz3AqJCFpdmyOBozCOFt6pNuvUrpGkNOSS4lGaX26vAEojeb0DQyW4Uxyf4+JvOkaLM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAZA1dDr; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so2720353a12.2
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 03:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180066; x=1746784866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
        b=MAZA1dDrN8G5ff4J+3gdJ9c4nV31aUNt525Hdl4ks5aoyUEHcMuY2zhUeAEeQWfx78
         BZlzTnJnaLV3Lo5kwciXlwWKwWPwxcMkJZArYPStb4WlvK7MG2AESWwwUxvktSxugGBK
         9f0j7Pq2pSu5Mh+bzSS29P06idzfwy3Vp+zCxNqyxkRPY36RnOw1hyBOp9GKnv29CwQ1
         wYOROa67pm7ob32eOwUSzqrMR6MpicakRAN+qSvDzGYosls3iPGnBiV2ZqZgcjqIA4Ty
         JGi0j+JBeH+yKMvEB+P3mvXhWpQWhU10GPT2WpKPbY1i4InD6JjZZOq5lBKkO1Fng0o+
         oDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180066; x=1746784866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
        b=q08O1HjnUK6jVg1aOFvYWA587wSldpDZcIC8Sb1TDwCQz9wcQm+FRsB+6RdZqhcZ5U
         Jn1MkD8MftWaFCtA9z5xxBvoV3TUeVPZBHJ4LXuO9DkCoSvhqcO1blVf8alSdzfFn8v0
         3UA50LVZGuGwBB9LDNHVl3An9cDCjGXU+uJRoMIFJOO82o0xKBzLVfODfjzX9ejJx6N8
         CEuqMA4SuBx2KY97nve1V7Xq4wtSjABjmVc3h5hjPkw1sJPY5bsN5N/R0UE3brG+/D7z
         32pEwiEWh1vO/N6FZ0ZlSsmj+1hxS+CBuTS/wlreL/1KyHClfIbzaS6UppvAwPV8dAnX
         +tuA==
X-Forwarded-Encrypted: i=1; AJvYcCXYZFJFGTgy0PWk8AVe19YM1xKGUcwq3t8EyY5jVmD0B6FA6DFtmkcrV04zkmQabaNSvWi5J/HNYgq2+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh2nMGD4Rslqm33yTuCDz/RcSz1OKS2Xm5YSS5I+hCURRX9Mmo
	znoHNnLHypWsF6tj7zd03eaDTvoLLWduakEcDjnRYE5/DdNpXG0b7eAxQFPL6TImTarSnimNo/Q
	TM+w=
X-Gm-Gg: ASbGncuqZJHNHKXECcROoEo0JEmI+IvvtjHvZkABw7eqYiLPmjUXeN/squBT3SNFEwA
	xEvSS9ZkHSLcsHxS8kSye4hyWXuW2XwKNK8xL+p5OvFTMEvFtXMehkBV+RdA8FS29jtVElmwL8m
	I6T6HCVvZyXCC4NOnSofLeTbiBBUfsOpGWBMjeAFY+I6WmPYzU0CijwHI8yoo2SOfQDrdMoHk/T
	w7RTX2hrCq64Q7fAoBQAfFNbc4ZshV7ig4ZlyJ1V94CgKQSg7zWaxKWTyCKgIL+oAPom9BFucio
	olbDaFU3ECokIgEMa/NsPfU/zapxmBuKjWCQqh/4mC4wikgD/nnITm+4ApLZ+ULWFXBnJpi/SR4
	dk4vrDOBe5noEnLJn7Q==
X-Google-Smtp-Source: AGHT+IFFcCMXXLABaW9tvRZ1qpMWwe7p/TbtI+cL2YnquR0Nl0siV3BBf3ahUJ21DjrVNKWPwxmwtg==
X-Received: by 2002:a17:907:3f0f:b0:ace:9d35:6987 with SMTP id a640c23a62f3a-ad17ad24ac3mr199106166b.3.1746180066113;
        Fri, 02 May 2025 03:01:06 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:05 -0700 (PDT)
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
Subject: [PATCH v8 07/14] tee: refactor params_from_user()
Date: Fri,  2 May 2025 11:59:21 +0200
Message-ID: <20250502100049.1746335-8-jens.wiklander@linaro.org>
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

Break out the memref handling into a separate helper function.
No change in behavior.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 685afcaa3ea1..820e394b9054 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -353,6 +353,55 @@ tee_ioctl_shm_register(struct tee_context *ctx,
 	return ret;
 }
 
+static int param_from_user_memref(struct tee_context *ctx,
+				  struct tee_param_memref *memref,
+				  struct tee_ioctl_param *ip)
+{
+	struct tee_shm *shm;
+
+	/*
+	 * If a NULL pointer is passed to a TA in the TEE,
+	 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
+	 * indicating a NULL memory reference.
+	 */
+	if (ip->c != TEE_MEMREF_NULL) {
+		/*
+		 * If we fail to get a pointer to a shared
+		 * memory object (and increase the ref count)
+		 * from an identifier we return an error. All
+		 * pointers that has been added in params have
+		 * an increased ref count. It's the callers
+		 * responibility to do tee_shm_put() on all
+		 * resolved pointers.
+		 */
+		shm = tee_shm_get_from_id(ctx, ip->c);
+		if (IS_ERR(shm))
+			return PTR_ERR(shm);
+
+		/*
+		 * Ensure offset + size does not overflow
+		 * offset and does not overflow the size of
+		 * the referred shared memory object.
+		 */
+		if ((ip->a + ip->b) < ip->a ||
+		    (ip->a + ip->b) > shm->size) {
+			tee_shm_put(shm);
+			return -EINVAL;
+		}
+	} else if (ctx->cap_memref_null) {
+		/* Pass NULL pointer to OP-TEE */
+		shm = NULL;
+	} else {
+		return -EINVAL;
+	}
+
+	memref->shm_offs = ip->a;
+	memref->size = ip->b;
+	memref->shm = shm;
+
+	return 0;
+}
+
 static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 			    size_t num_params,
 			    struct tee_ioctl_param __user *uparams)
@@ -360,8 +409,8 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 	size_t n;
 
 	for (n = 0; n < num_params; n++) {
-		struct tee_shm *shm;
 		struct tee_ioctl_param ip;
+		int rc;
 
 		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
 			return -EFAULT;
@@ -384,45 +433,10 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
-			/*
-			 * If a NULL pointer is passed to a TA in the TEE,
-			 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
-			 * indicating a NULL memory reference.
-			 */
-			if (ip.c != TEE_MEMREF_NULL) {
-				/*
-				 * If we fail to get a pointer to a shared
-				 * memory object (and increase the ref count)
-				 * from an identifier we return an error. All
-				 * pointers that has been added in params have
-				 * an increased ref count. It's the callers
-				 * responibility to do tee_shm_put() on all
-				 * resolved pointers.
-				 */
-				shm = tee_shm_get_from_id(ctx, ip.c);
-				if (IS_ERR(shm))
-					return PTR_ERR(shm);
-
-				/*
-				 * Ensure offset + size does not overflow
-				 * offset and does not overflow the size of
-				 * the referred shared memory object.
-				 */
-				if ((ip.a + ip.b) < ip.a ||
-				    (ip.a + ip.b) > shm->size) {
-					tee_shm_put(shm);
-					return -EINVAL;
-				}
-			} else if (ctx->cap_memref_null) {
-				/* Pass NULL pointer to OP-TEE */
-				shm = NULL;
-			} else {
-				return -EINVAL;
-			}
-
-			params[n].u.memref.shm_offs = ip.a;
-			params[n].u.memref.size = ip.b;
-			params[n].u.memref.shm = shm;
+			rc = param_from_user_memref(ctx, &params[n].u.memref,
+						    &ip);
+			if (rc)
+				return rc;
 			break;
 		default:
 			/* Unknown attribute */
-- 
2.43.0


