Return-Path: <linux-media+bounces-66462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SKAMOXLJR2oxfQAAu9opvQ
	(envelope-from <linux-media+bounces-66462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 16:38:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 410777037CD
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 16:38:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Cnz4CBjq;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66462-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66462-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95D14305D822
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 14:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30CE3E4C95;
	Fri,  3 Jul 2026 14:28:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADAB34FF79
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 14:28:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088890; cv=none; b=Bdg2k2t5ZU3gLYjgWC5B3hSvMk0Gufx3Q/n+4HHTIiGIuXBSgoqoV4VFGAMutpEIsmx6Nm2I3k3hia2dofOQ+m9BY19RLG/BG+2M1YOtJgwnFFjfy2T2pDDtopK4RUTfKqF3sDCDZWXsE3Mrti2yi76mVTzWOMbSbwATTSJa7Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088890; c=relaxed/simple;
	bh=0I76ZwMoPjiSrdzlVPbCXsgffgqRX/g8PDFQj/MqraI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tA80qOZfjPStu6jDNExz3yXBCVj4OBUkttO0R5sRMH60xtVLzdJrd5WoZvZRzxwkDUc57Rg0WJrS6fXGcrxxh/W8qHJDn4r+DYS8jfpHB+uWSl/7k57hko8J+RsbmOhfqgNYiEoe2VKc66zRaZWlQgKu4WCFon1KPkb0VIEvGkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cnz4CBjq; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so4450465e9.1
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783088883; x=1783693683; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfzjlva7uTRp2nrRC1IpEggKvDc4norG+B7c1mS+L3Q=;
        b=Cnz4CBjq/lNnuqImQ+if7BW1kxVcn4QPIZlCLzwAyy+oHKayeN5xynQtv1oS69MrqH
         xCdVSMhyQjSnKn+OQO2uBjRXeo0eaJ4cuQXu4YX4+viU6/up1GLentmpW0b6zoil9cnl
         zqTiEUTR5o6zY9XMugeJrS38dRLOBHiiFcyEFg86i7oDX3V8IACs8dEoJEwd/MTA1o4J
         zxaiIbv91OYAgE8VJ+NOb2TKsoSD6YCMPcxWol5H2RNGZx8ga63P4/kfy6/tyhntAX05
         78D9ayO8XK3UOAiAcFnDGZBxOAV6LAO8HyP079hZDg+4fSw7R8CjqIIRSXI7uhj1E4JB
         E+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783088883; x=1783693683;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfzjlva7uTRp2nrRC1IpEggKvDc4norG+B7c1mS+L3Q=;
        b=I55vb0Cclmfo6QElMzZsokX19b83355aS/b+XQppZe3cNpwon3TtOnrzSJeuickYTa
         Fit84AElhUUBKNMa4mrhyNVGqHMxcC1/UEx8TA+NQ2N4h0ZzH514UPGk7kbjCyteS5xd
         qcykeJwS4OQlkZbyKkR65EKsp2VwVr1MUV2DGQh+P1ygtJgIknBv6xKIoU2QGpi2oJID
         FT2oBCbmE43/tH2giXmss0quTRdGMklNZVXg6htb3QvX1l1UZO1g1swpVMS5tY9vS9e0
         QZEC5ijSnD713Dp2Ay6G9Som3pONoW2wXY0W9ju2c3vbBsHmOaobC7LvbOWdo2fumP75
         2LXA==
X-Forwarded-Encrypted: i=1; AFNElJ+67HFTDx745gJOZB5qa13hx8Y+oYWjLSBfpBoSs37SKK7TFdZ/mBk+uPM5rvcDgTa594hQg2ZzPL5pJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB5y/9pIRh89EKPC0GqVO7FTylxuM1YwU5sYO0zPElU00k7kP8
	ZqVTHazrDJHVPFPPf3KlwKHgHeJNZX1yVfRjDsSxondBLIk6ngbe0rt9FCFcGmeYMSE=
X-Gm-Gg: AfdE7clgQLWa0XzSxEFqmvkQmplddDNsd+a6l0KVSkrZ0NCsxSYbmKfAa9gCWzZOmot
	0bvLhjYhP1qt+izTXBeKJoDaOJkEdaHaoZvBB8VnULvEwg9uknWPjJBWCjX6j3kbUt+ADyHjZCK
	SmN74r7kik2f9CxjQLXxu4WUiMDSKmBNeUjGhJ75fHN5iiW3BgqYXF60myvtn0IUpp4BuB4jpiw
	m5sO0H12k5z8HVd0UZeAaSFa4LTBt4yiX7qWnrRl6UJSrMMIslnZbJxMM/Fz1AzhieVe9igB2sl
	4fDC2dSOkmZTNc3CMAEle/25C2aHPSApWMIuDdo7dbrG9kRr0pbZOscIKxLeT6xTotknmqEJ5no
	HNAD9+nfymFW6L6PYc92zubPpKLy7fe7KexA+9qoZ1wEK4FFFRFpnwtI+2LlfFbSlv3I8h3wEMo
	BsAxu8bG2k+9FXgQcOXCLeqcreVirdnbg2Z9xP1GXaZCtRcHIFvTkKwOuUB+lVpLM=
X-Received: by 2002:a05:600c:8718:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-493d0b2fe36mr4072985e9.0.1783088883062;
        Fri, 03 Jul 2026 07:28:03 -0700 (PDT)
Received: from ta2.c.googlers.com (214.8.78.34.bc.googleusercontent.com. [34.78.8.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm73048945e9.2.2026.07.03.07.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:28:02 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 03 Jul 2026 14:28:01 +0000
Subject: [PATCH v2] dma-buf: remove unused dma-fence-unwrap.c
 (stable/linux-5.15.y only)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260703-5-15-dma-fence-unwrap-v2-1-43d58ee68c6b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPDGR2oC/4WNSw7CMAwFr1J5jZGTfpBYcQ/URUid1hIkyIECq
 np3Qi/AckZ68xbIrMIZjtUCyrNkSbGA3VXgJxdHRhkKgyXb0YFqbNG0ONwcBo6e8Rlf6u5IoXG
 dp3pwwULZ3pWDvLfuuS88SX4k/Ww3s/nZf8XZoEHyoWuai2/JhNNVotO0TzpCv67rFyJEdd27A
 AAA
X-Change-ID: 20260703-5-15-dma-fence-unwrap-0f4a6c03daf2
To: stable@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sasha Levin <sashal@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783088882; l=6389;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=0I76ZwMoPjiSrdzlVPbCXsgffgqRX/g8PDFQj/MqraI=;
 b=MUC/mZrIiaFHeZ3I4K94wWDobfdb8G1nLQh5/QGPiyaNX/jdcVM7J7Id9ZpF/FWyi0B5qXo/3
 6/uHcV8aGcQC06CtW95kCzjuXQTe1hwcRsJQAUBgmsuaYfkYWLuKFE3
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66462-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:sumit.semwal@linaro.org,m:gustavo@padovan.org,m:christian.koenig@amd.com,m:sashal@kernel.org,m:alexander.deucher@amd.com,m:Yunxiang.Li@amd.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:andre.draszik@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,m:tudor.ambarus@linaro.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,amd.com:email,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 410777037CD

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
Changes in v2:
- add To: stable@vger.kernel.org
- Link to v1: https://lore.kernel.org/r/20260703-5-15-dma-fence-unwrap-v1-1-0cf644bc501f@linaro.org
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


