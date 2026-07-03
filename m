Return-Path: <linux-media+bounces-66460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8A9pCGXER2rwewAAu9opvQ
	(envelope-from <linux-media+bounces-66460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 16:17:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0C70356F
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 16:17:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=g5OdvAYd;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66460-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66460-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F4D5300613F
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 14:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2CE3DEAD6;
	Fri,  3 Jul 2026 14:16:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99623DDDCB
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 14:16:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088206; cv=none; b=G9iwCmIlry9kqqwdbbFr5dy6ur7PfT/hSvOwk+JisozBMfHiyNFRsA3azRUT8O7TM1eddrgnGfXpzvP7g9mQ4bSSAajThn18vwPH1bt8iTdQqJk/41IqZMwT8fsk5E4NCQmOJe+sv8I2ApXGxS6BGDn/6vBtAM59wgLJnohWarU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088206; c=relaxed/simple;
	bh=IoBDA9RGNCrEvq0FVmsK4Z45OhW+Q/oVyDeW5CmzsEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fs/Rshx7Uz+xdVlTm4cNIehVHk6w0UXW+yfz4cl/p7BEVSmLkvyUzXggabENzJY4ZwiRFcIaepsRKzjUjjIOzR/15sAzpr3KemC6+YCmaNr9yjlbiIoIT7syp4hjPhEMLQeH9kT5ahW3RtSIjteipz65noblQ5ah/x5PJLIv3CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g5OdvAYd; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b7612475so5979775e9.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783088201; x=1783693001; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lskiCzL04/SeK1/iyp8dzWHm0r0N5RaxkUMlmtlc8uk=;
        b=g5OdvAYdsHTfg2tOC5dUHEJTucPQQjdvRYA0ACJolEnZRmK7X0ZibxwXACKrH3n6bu
         yBrYWa/14OuxdRsJ2f4Rb5zGAqxdwJ59oY1gjFwLksO18pdCs3USQxugth3zHzrbMxu9
         twQLx5zM0JKjxgZFjximnGmGnWoSX6mlNF1qv4cW80JoSAtXi4vj+sjESm5bCUrAewyy
         NJKt57r/biaLAGTYU6GLGLmjftuNyg58y9Sc+NOGAxquMbF7QEblzp1yjI5WZv8bqnr2
         wer48lvFjuce9I9SwAFEZYMo6tziV7nlR+MJ+FpuxrRnA10Q3OYxGWIFr8OggIA2KqtS
         n4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783088201; x=1783693001;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lskiCzL04/SeK1/iyp8dzWHm0r0N5RaxkUMlmtlc8uk=;
        b=r+KrS780hfBWifLF/PPxt5FFAiQu63mRdZTBuczrCaXyzpR/byxA/W6Y0QZzSiXg/B
         ORCC7D1AGV5GNn3ObWbNvHhhimwNgCACTjLaZdqWI94HusiMB9NW+GEeHVGe702gatBg
         Uznbv0d21APXB8xv/hK4/Y4OHOkBPl2vY59zzj+7W/6z6xFHtWx+PniInzrOpI/PFqFg
         Va5z3IsMog/+N7cFPLYeOQEU+mqxpyOAZl1q3SaeXuzZRRTtm60KANXKn4YE8rxLqbY+
         BZus7EzDnbc+2YoY7CRtMPzqUj/BO5P1jDPMqjNd10owl4K4xWTHEOE01kWMsb3/cvL3
         9YjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8amoSf4pA2NyZsB2Qp9iZsh2ZoXFn6KLo2l08ROrdi54I13Hu9iHWjmktglZ3FmVZedrnCFh5qgF6GsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkAaEcY1IQn+Ef2VOXNn68wAqYS8NT3ThQ8st3GijRH8E+FDKV
	QnCGleRrTHWnVBLsqVbUr5j+SkFsOMuAQUDFjI4mt4EnP9MfCxucEqZx8PAOj9fKRrA=
X-Gm-Gg: AfdE7ckYFibmkW4MwiANdVsmFFgFaX4S+hxiz+wuSv8I3DEKVg3AFDl+OEpuLqvXpZy
	En78p5r9rY2oI9gaOHS3pRsEniiYqL8EshGaEftomQWTVKzz7rViMqc3P1AFsk6BeWViP4YwwQM
	U0gMQg5A+D+2x1CyVGTxKsfN+rNeXVRYsPsRsrGY93mvbyTF987rVOUAfJ6ORYLpR0r74rWnkhB
	DB5a71+PCWiF/bj8CvUBmrQKBvQoIUbjRgxeicxvsEFKcYUlGMrISkV+r9Ap0hpubxau/a3etbE
	Rvs8gevbMOKn1PCqrYjctlX/snj1GuMlKzfVdcA1O4fgaPNzfUE3ddfc10O1Gfkem7O/D/Q3wqC
	kO8Ex7HH1HRQXobDURSSzyUFpcTxkAz6UCY+s/CSXawTXm/4oNmNTm7U01Wc409sRpIrprfoPQ0
	dsM09cLg3EAisn5pKSBYIrA6AcT/8urJaW5n1Lf4uV2chYQ9ZA9+u1q3uU7akl0tU=
X-Received: by 2002:a05:600c:4194:b0:493:b764:ff98 with SMTP id 5b1f17b1804b1-493d0f100c3mr517275e9.11.1783088200711;
        Fri, 03 Jul 2026 07:16:40 -0700 (PDT)
Received: from ta2.c.googlers.com (214.8.78.34.bc.googleusercontent.com. [34.78.8.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce11497sm56004595e9.12.2026.07.03.07.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:16:40 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 03 Jul 2026 14:16:36 +0000
Subject: [PATCH] dma-buf: remove unused dma-fence-unwrap.c
 (stable/linux-5.15.y only)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260703-5-15-dma-fence-unwrap-v1-1-0cf644bc501f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAETER2oC/x3MSQqAMAxA0atI1gZincCriIvQppqFVVocQLy7x
 eVb/P9AkqiSYCgeiHJq0i1kVGUBduEwC6rLBkOmo55qbLFq0a2MXoIVPMIVeUfyDXeWasfeQG7
 3KF7v/ztO7/sB/HMeWmcAAAA=
X-Change-ID: 20260703-5-15-dma-fence-unwrap-0f4a6c03daf2
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sasha Levin <sashal@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783088200; l=6233;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=IoBDA9RGNCrEvq0FVmsK4Z45OhW+Q/oVyDeW5CmzsEk=;
 b=bXpjW/Wws+hGcp56bVJAO0VTeqV6NGPVaFHSi0ulYSZHMsW6kJiBJ8BRP6pFh3jm63Qunv+yE
 F57tc7/d0YOA6VZ/8RTBQP80J9o3N22CnarbId+FauxgboFRvWFStiO
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66460-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:gustavo@padovan.org,m:christian.koenig@amd.com,m:sashal@kernel.org,m:alexander.deucher@amd.com,m:Yunxiang.Li@amd.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:andre.draszik@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,m:tudor.ambarus@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tudor.ambarus@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tudor.ambarus@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:email,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9B0C70356F

The file drivers/dma-buf/dma-fence-unwrap.c was incorrectly added to
the 5.15.y stable branch in commit 4e82b9c11d3c ("dma-buf: add
dma_fence_timestamp helper") as a new file, but it was never enabled in
the Makefile, and its header include/linux/dma-fence-unwrap.h was not
present, making it uncompilable.

A full revert of commit 4e82b9c11d3c ("dma-buf: add dma_fence_timestamp
helper") is not desirable because that commit also introduced the valid
dma_fence_timestamp() helper and fixed legitimate timestamp race
windows in drivers/dma-buf/sync_file.c and
drivers/gpu/drm/scheduler/sched_main.c.

Since there are no users of dma-fence-unwrap in the 5.15.y branch,
remove the unused file to clean up the tree and avoid confusion.

Fixes: 4e82b9c11d3c ("dma-buf: add dma_fence_timestamp helper")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/dma-buf/dma-fence-unwrap.c | 176 -------------------------------------
 1 file changed, 176 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
deleted file mode 100644
index 628af51c81af..000000000000
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ /dev/null
@@ -1,176 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * dma-fence-util: misc functions for dma_fence objects
- *
- * Copyright (C) 2022 Advanced Micro Devices, Inc.
- * Authors:
- *	Christian König <christian.koenig@amd.com>
- */
-
-#include <linux/dma-fence.h>
-#include <linux/dma-fence-array.h>
-#include <linux/dma-fence-chain.h>
-#include <linux/dma-fence-unwrap.h>
-#include <linux/slab.h>
-
-/* Internal helper to start new array iteration, don't use directly */
-static struct dma_fence *
-__dma_fence_unwrap_array(struct dma_fence_unwrap *cursor)
-{
-	cursor->array = dma_fence_chain_contained(cursor->chain);
-	cursor->index = 0;
-	return dma_fence_array_first(cursor->array);
-}
-
-/**
- * dma_fence_unwrap_first - return the first fence from fence containers
- * @head: the entrypoint into the containers
- * @cursor: current position inside the containers
- *
- * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
- * first fence.
- */
-struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
-					 struct dma_fence_unwrap *cursor)
-{
-	cursor->chain = dma_fence_get(head);
-	return __dma_fence_unwrap_array(cursor);
-}
-EXPORT_SYMBOL_GPL(dma_fence_unwrap_first);
-
-/**
- * dma_fence_unwrap_next - return the next fence from a fence containers
- * @cursor: current position inside the containers
- *
- * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
- * the next fence from them.
- */
-struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
-{
-	struct dma_fence *tmp;
-
-	++cursor->index;
-	tmp = dma_fence_array_next(cursor->array, cursor->index);
-	if (tmp)
-		return tmp;
-
-	cursor->chain = dma_fence_chain_walk(cursor->chain);
-	return __dma_fence_unwrap_array(cursor);
-}
-EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
-
-/* Implementation for the dma_fence_merge() marco, don't use directly */
-struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
-					   struct dma_fence **fences,
-					   struct dma_fence_unwrap *iter)
-{
-	struct dma_fence_array *result;
-	struct dma_fence *tmp, **array;
-	ktime_t timestamp;
-	unsigned int i;
-	size_t count;
-
-	count = 0;
-	timestamp = ns_to_ktime(0);
-	for (i = 0; i < num_fences; ++i) {
-		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
-			if (!dma_fence_is_signaled(tmp)) {
-				++count;
-			} else {
-				ktime_t t = dma_fence_timestamp(tmp);
-
-				if (ktime_after(t, timestamp))
-					timestamp = t;
-			}
-		}
-	}
-
-	/*
-	 * If we couldn't find a pending fence just return a private signaled
-	 * fence with the timestamp of the last signaled one.
-	 */
-	if (count == 0)
-		return dma_fence_allocate_private_stub(timestamp);
-
-	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
-	if (!array)
-		return NULL;
-
-	/*
-	 * This trashes the input fence array and uses it as position for the
-	 * following merge loop. This works because the dma_fence_merge()
-	 * wrapper macro is creating this temporary array on the stack together
-	 * with the iterators.
-	 */
-	for (i = 0; i < num_fences; ++i)
-		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
-
-	count = 0;
-	do {
-		unsigned int sel;
-
-restart:
-		tmp = NULL;
-		for (i = 0; i < num_fences; ++i) {
-			struct dma_fence *next;
-
-			while (fences[i] && dma_fence_is_signaled(fences[i]))
-				fences[i] = dma_fence_unwrap_next(&iter[i]);
-
-			next = fences[i];
-			if (!next)
-				continue;
-
-			/*
-			 * We can't guarantee that inpute fences are ordered by
-			 * context, but it is still quite likely when this
-			 * function is used multiple times. So attempt to order
-			 * the fences by context as we pass over them and merge
-			 * fences with the same context.
-			 */
-			if (!tmp || tmp->context > next->context) {
-				tmp = next;
-				sel = i;
-
-			} else if (tmp->context < next->context) {
-				continue;
-
-			} else if (dma_fence_is_later(tmp, next)) {
-				fences[i] = dma_fence_unwrap_next(&iter[i]);
-				goto restart;
-			} else {
-				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
-				goto restart;
-			}
-		}
-
-		if (tmp) {
-			array[count++] = dma_fence_get(tmp);
-			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
-		}
-	} while (tmp);
-
-	if (count == 0) {
-		tmp = dma_fence_allocate_private_stub(ktime_get());
-		goto return_tmp;
-	}
-
-	if (count == 1) {
-		tmp = array[0];
-		goto return_tmp;
-	}
-
-	result = dma_fence_array_create(count, array,
-					dma_fence_context_alloc(1),
-					1, false);
-	if (!result) {
-		tmp = NULL;
-		goto return_tmp;
-	}
-	return &result->base;
-
-return_tmp:
-	kfree(array);
-	return tmp;
-}
-EXPORT_SYMBOL_GPL(__dma_fence_unwrap_merge);

---
base-commit: eceeec79dbc646d6dace49ed1ba2f656683d5537
change-id: 20260703-5-15-dma-fence-unwrap-0f4a6c03daf2

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


