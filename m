Return-Path: <linux-media+bounces-42344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BB5B53473
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692D33B209B
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5CE340DB8;
	Thu, 11 Sep 2025 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="klE5AKnw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F33375D0
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598639; cv=none; b=OwcB5Jjruey4rUzapV0bTSWCnPVZIQUk09cdGot9H6pa10bj61rbTdUdfsAPcR9CltR3eoVM4kW+IIDlDAhOcJRywxAtBK7bO6dG/Pqxu6LAIS1pZpt2+Lfl5DecSeaMk9dNki3pXciCyCPXPxawfg86JUO92jRS17Poaf9qWDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598639; c=relaxed/simple;
	bh=k5Jww2JK2ae51rsOpo5VdeRKiDm+DOy3GENCcdCVfVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZbJb3Ohj+0nY6JBgMfUjl+FMMb6Sn7g1DPPonYpFVf6X8/eOLwTS5sPUJUplSsZQeEt5CsDOFlpmiMyTNMa3n433tpGAC5e+9V6v94ZGro9T++nNeV+9B1ce+av44n4wlsQtaQtDVFVe/mdxTqWseGBgax9wDw/YG6nSX+vv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=klE5AKnw; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d60504788so5303877b3.2
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598637; x=1758203437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi0r5nq64oj31QVOjln422OWaHa6DWnYy7B2T1z3rUg=;
        b=klE5AKnwrX8+utdXHXiA/AkI7a/T/OWsh9BQxvyR5kL6lAQOp5BNU6+zSmm1XyYNpm
         YVuEMTmHTdLAy1xx1lWKCL8Emjs672WyPHsKIjaVckQTGb+9eJvloi/KboUIZwGmDv8z
         Dgajkj461QdJ6l7AepJR5n99eAFv5qWDnt23t9Fm8U/W/sxqWN1ks0Ug5QczO/VM6yFm
         ckOryi6LrS9GR7eeY6OSai2Ogj7Abawszlyeg5afPu41CPgsdXsUDV0vp/q7P5HfqVv2
         Y8qXV27knPGN76S0KQUBvlCG3yaG/nmngN8G/sX28eOOM18lEj28hRSm1/FeHh9mcikq
         tSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598637; x=1758203437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi0r5nq64oj31QVOjln422OWaHa6DWnYy7B2T1z3rUg=;
        b=DixcMLMr5vbgd2+biBkaZS0wCZwJOislvdvB41hT2QrmmI3MXhgnc0zIEmBuNaixzg
         +NcZ4RHI8grDT7xQV4lqivVBsjHbEqkBgwearLxfP3ezpjzCoOJ3I5m9J1FxAvAJWtsL
         mdAxMluJUJlzggDpTslSz2tGVnw7CvMJ18crtrkksx8iNdsYmiyLn1J3FwC6WGeZZcVa
         wV477ahNfwCDmqmUgbYfkkdo/tMFP84k6VI7hfaKz3es044WVgfp9fxk3u1jm3XkRuFB
         9ahfssQyktrrb8bL441IfhHwtB5DlawJl0XgiXjjMl32FMR4fnABYbX1RPZQpIMni81f
         N1zw==
X-Forwarded-Encrypted: i=1; AJvYcCV06Sdzpyif5XPlAL4m+65VxBDc5IMRW4xE4IPpjFbzFXE8ne6rV7G1EYINRrBMxSZcSSmvC4LwGuPByw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV9y5ffyCcEKtBh0jaZWFeiYs6CmAAhf0N5Y0iOOQ3LiF9IYl+
	DJK0z9vKevsSYZqVQwCWhtyuvuvADS4hCekQiAFTvyft7m6eSQCgoJ/AU6xoLek8yI8=
X-Gm-Gg: ASbGncvtosRB6uxeUQyXWGxL/2iB+BHF3t30wRi6Es/SOtWZm6mYewSBjAUeSu42zJ9
	CgjbDCPL2FHcTj22p3bPplqrn6jrE9s+5UbEe12kQGau6kaM+zYXzKP1qinc05hK/LCl7bnw8Eo
	iKVxeQIoIelJZt5uNQyH6ILj9ZyO/Yv7rsG6G8rwyGJdSYkmFRWu/fEYiLiOlbZwUnWYOMgQ8Nz
	HtemCq6GM2mMVdZYAe31b+EATQ/bvgXeHXzkXzLd5mAsEtk+5RPy5yQVtuELMbANJ9Xra3M174d
	LAS7Zk1fmK8KoC7ju+PwfSLG7JUTFOqT1UW/h/ssggpTzH9ljHuUnJ/B0o0iF1VdT373yMWJDPH
	QOyIjDvkKsN3JN202Dhm1+qJ63tDgmqDNpR8lZrTzw8oc/vw2XH2Ff0T1S/htRIelaiz1no/JGf
	8U7QdWXmYySg==
X-Google-Smtp-Source: AGHT+IFhFq5K/L+li5E/fnG6u0IEPzqvQNG67ywCbR49sqE1DlYxZ0kS6UjsMtnPo2ezjd7bDqomGA==
X-Received: by 2002:a05:690c:62c1:b0:726:76f0:4b89 with SMTP id 00721157ae682-727f505434fmr181457897b3.22.1757598636586;
        Thu, 11 Sep 2025 06:50:36 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:35 -0700 (PDT)
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
Subject: [PATCH v12 4/9] tee: refactor params_from_user()
Date: Thu, 11 Sep 2025 15:49:45 +0200
Message-ID: <20250911135007.1275833-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Break out the memref handling into a separate helper function.
No change in behavior.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 2411d1e2aa7a..4996f194cd9e 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -354,6 +354,55 @@ tee_ioctl_shm_register(struct tee_context *ctx,
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
@@ -361,8 +410,8 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 	size_t n;
 
 	for (n = 0; n < num_params; n++) {
-		struct tee_shm *shm;
 		struct tee_ioctl_param ip;
+		int rc;
 
 		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
 			return -EFAULT;
@@ -385,45 +434,10 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
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


