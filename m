Return-Path: <linux-media+bounces-39731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BE3B24104
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 889501887EA8
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 06:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CED2C178D;
	Wed, 13 Aug 2025 06:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VI25Ov28"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4938A2C15BF
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 06:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065041; cv=none; b=tEn6cuKCiYLQ1YL9Rt9adqK+xTciDTJuIyxXSaXwPvplQZRRBLDWC4nZzXQvz6BXVFV+Jq4jS5ry10IJskPvMQMsCvmdz7VdoebYqKzM66GmuFlgBmX/uhaQKmXaws9Grqkdc2BWSABSL/EkUbm1OxgvEtmFLfX8pqpXSVJOFwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065041; c=relaxed/simple;
	bh=BUl5/6+a2Cb4I+qj31mG7se4S51jFiOFoJudTBIklSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJJETfJw+cq4tCyZXfdLyIIT91QWCE9aD1OECU+BcJOz/k2WqusdZ3n3PD436m14J8mF9lcsavxlr0yjDR5domuA+B/8pmDLs0C/l8v5t6MKYuNcvZClgv2Rd38xMEzOe6R2kUt1biUQPtwGNlroq6C9sqwPH4JvNwPf2PM44+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VI25Ov28; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso11390352a12.1
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 23:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065037; x=1755669837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSuLcRnSGeJ3xtP5yz3Dg/9JsLri62mj/cqN0HfNB3I=;
        b=VI25Ov280tNBapW3erRmkXV/k23CwV9u5l1rc8wecUlCPtuMaSQMajhDuzeGQvrJWd
         CpaT6H0rSChaxDaggK/xpNTBDKVygsIOFL79Ne5RjPakMkKV8H/avjyp+SUYL/gp/bQO
         GXLeYgZrAfTrMdBchyOWxgrBaPATzND6DwEnJtxzbpZ7nAAlq3UiP0iJgFC+weFU7Tvj
         0XaqMBqPp7awBrqB/vuJHdp8qbe47FBHIrDg2420aaOn61T79n/Fwr2RVIiavIngDfQL
         yxaFRxYI3dp1zeyZH1KfRf9dbzWZGnvu1G9BRr708hu4CVdf59cS8HEwum1gEHGsDZK3
         98Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065037; x=1755669837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSuLcRnSGeJ3xtP5yz3Dg/9JsLri62mj/cqN0HfNB3I=;
        b=dgJiRnqf4lKVZsd1AMbSKXTs67pafpgd+94Ts/v10d0U/FEstWwShxP7CuwiB7dWaz
         TpVjOBC0cPl2zSaIcEzZTFpeWZ81AssR/8FF84V1dg+EaSD4ntJFk1n1T6tw8xe3aPgI
         85d0v+gll4F4YPNKTlNCyuQ8xImCGXioxBWYFQb/Dt1/9TgzlLd87x8xDU1k0sAijdf0
         /dK20eGu/C905GulMbjoLgu4gMXbqnyauVDgsJiSpT/83czASmISzHQhJv8FEtvNijhI
         BUXNqc0e6gS/LjE0vOLiZigycQKl4qpUUwYRFxxLv6hmLoeMsU6nvqzvoe/3mq1tf2fT
         dJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5AjdZ/TA9NA/KlpRSp62iUCJAHy/VWHwvhWRIg/Z8JxwEGZLmCTibOe4uSm6uCAclGo2H9E4SGiptMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3ffd1k08qeCY8qXcLI/xB8IHkFf3iCINcqzgVuchU0bxbiry
	qH2zIKHxD4Iju+PWOyhmze2bffgz0PLwdCW13jMYHbeQr61QGMr13XduJKlwWuAhZZKjRCc4qMC
	6M/U9qJA=
X-Gm-Gg: ASbGncv2Vc23UH0GsfH6QlSuaJG3Xck3d7RTuatGGqaikAyz5CQ5jAGftfHBbcxT/Ho
	OzHG8SkbtdiNn0qSXYLfA/jqvWJrSAZDawkwB482MCphMY6ZqQMKZdkGVGJnRojRhf7RCsHxUyf
	jFGWEyjkqU4ZxHph2I3nCS8zMXux/kh89o+kcsxzkBEg3vdhX6//XUsYurvL4s5Otue85YEeX3k
	XRCMlst5ee7XfXlqzYXt9+FH3Cn2uchK0mL9O5RSLZkc/KyElaFbyo7BwooeVcghUtduvKhcb4/
	L62VlHtZcH8MFDMWmasosCM2bW1n1HJbEPi0mISgObP/e22/Da0ANDe3IW2JHOY24zYk3I1pM3V
	2BridUS7ykQW5mUAfHSQ9ISzWkcxR/SbeDKoSGOdC5JQQcJr1GEQo8955O0aEcEtAoh0Mciz4Yl
	M=
X-Google-Smtp-Source: AGHT+IGqtQuV3o9beFdm8AV0OFCgrlJsYi4d+51H/4Z6scb5xUCOU4GITJt7DlZEnnM5yYTlW/+1Mg==
X-Received: by 2002:a05:6402:3509:b0:615:a60a:38a7 with SMTP id 4fb4d7f45d1cf-6186b758722mr1521502a12.7.1755065037200;
        Tue, 12 Aug 2025 23:03:57 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:03:56 -0700 (PDT)
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
Subject: [PATCH v11 4/9] tee: refactor params_from_user()
Date: Wed, 13 Aug 2025 08:02:53 +0200
Message-ID: <20250813060339.2977604-5-jens.wiklander@linaro.org>
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

Break out the memref handling into a separate helper function.
No change in behavior.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 52f5806ed314..b89f93b1f8f2 100644
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


