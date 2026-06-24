Return-Path: <linux-media+bounces-65548-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wfMYCp3OO2rtdQgAu9opvQ
	(envelope-from <linux-media+bounces-65548-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:33:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 772226BE279
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:33:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ki8Z58yi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65548-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65548-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72B243048933
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414E531352B;
	Wed, 24 Jun 2026 12:29:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3482C11FE
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304164; cv=none; b=RFvLYkjIUrYenPQYvFEGhp2j/OyEAn1C3efDksdncozIEW2PViEAUxvzi/Bx8hjpOrL1C69i+2HZ+Gb2rDwtQrgDJMovxyll1shwKBykvirwYk/Ow2i0B+jk6EfvY6mT8C7y/7EfMcrLtZhS8/NFgJwIka988jqXyMUhJX52r5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304164; c=relaxed/simple;
	bh=QJjZXZVY2F3NHvQLrRl6N4Ufcctkq1ry8N8XfMb+rTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kGTXm6P/eBXwB3R1lP1ct4BE9F5yunDlftulACnxzsRBCISnqIporBSvygeILFc/Mn1KYOUQjlSrdHkZv4r/lI0UrBEBRbSBYiHex7Tw68N/tcL6PbHLpfA0fnvSt/fso3faOg/pSfyvHztxL7zl5UWU71WI/oFR4O9di9TuLj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ki8Z58yi; arc=none smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so837623f8f.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304161; x=1782908961; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/fuObT/HN0KXLIz8YAcJyLLcFsVBKa7QtBjeRPyx2yQ=;
        b=ki8Z58yi1bJOTli/RELkaDv3kb83Gt4vYvolsu8qxvgfSMuEe6iQJKm4tzeDAgVlp5
         3LaBdRzBwD7sP5hr/Hithl/6dm4qdI5TB5eIuUtumwfRxrZPK1M9+XeTegODEwjRuB5i
         M4iHOPV7w/H0G34dQfdBbVzHgioI7pChcWXTGohpHEoqDJlaRw/CwlQA1Epr7UvQv6cZ
         nvmx38CW1HD1GLQUKhR0oqmaLzcFgjznOr47i5hLA/2nrg5CWMK8LMexE1ubcgDPtFS9
         PwW9OWO5cKca0SasAT7I1BFalJqD5dfCQnMttVIYGttXEkCDU1XkSNmpEbDogMkdX2ii
         jlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304161; x=1782908961;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fuObT/HN0KXLIz8YAcJyLLcFsVBKa7QtBjeRPyx2yQ=;
        b=KEOw0SaHStRpm6Wcb6CCmMLOUKJjUL+ACtQ8uNb6YPGwZ22NJLd2Fprc9lYOzBjBRp
         MoW30Nt94twjcgKwY1BGpnEXNwqZg1/OkMYfwOHC1ZVpkP5s0LgYOzOdkdrHnIHrMp7I
         U5xwwdIqnJrJXXLPLA9ahS7a+XTzGEVw9WnU4azSJrclWQLf9aUBDTp/EYYsUI8gjQvK
         yuEzR23S3qfgzXZUm3njdgsS/M6mR57Gbt/nQSf9g82eeBLai4KoUvmvbzVZN4xidFkz
         ORm1tfbOZomA7temh92ZClS/+lnRbLg+H9fAZHJ7dJUromilVmShdTSKju/SGFA6vtCz
         MWhg==
X-Forwarded-Encrypted: i=1; AHgh+RpOdWF1Fo+nj56qIY3HrhfcLAm9/9FrUfzEaX67afCV9THQLwuIB/q0j9dhgSxJXF3mb9HSTApcLBx+cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPxIiPZUAOEx2vQrePG1qODX0dMFP34974HxKgWT2z+QaBk0Hl
	qzc8ou3RsyZ+kgDEQ53Ntrnm3vx+fuAzBxN1N5e9ZkqtaSU7rkbJbDdM
X-Gm-Gg: AfdE7cmfDqSp10ovCTB96UTjlUy9LYlVaqnhp1F2YoY3UHpMVlScA9xniy/jAMD824W
	6PTTSr3jHGFckjNKJv2jMd08xEykbSlShbGiaKReeJ6f2sVVDGnAizFBBN3kfRuhaWjyt691iM8
	a06PddDjP4l9Uc5+/L6HVJipSLtr4B0mjTg63tfRtTV5DMLwOVPSqhLxHH4N5lcHzB/UHlFFs6X
	nkMYHuDoBo0jiNyVhxC0Ie1VBqudxLBoJMiMPg3+q/IEaHpo30bC+TQMG1SoSkoIV/J4FcOZ9VW
	41IbxLIIeoQcwFcB05l7vqwlO2NQoInoY3LYy8eFlPgY4JoA8YjQY9MzauFArFh27F/qkZ4CRRX
	uCMuo6zP5SfyJOhmNrp0KeDALa4X260DpLQ5xCJXoSJTMmyhD4bFqqvo+3U7BLAoUonc3DuxuOd
	FLtfRqRBdf63KEjThRB8M+RygnmYeTIblpsoXS
X-Received: by 2002:a05:6000:4b03:b0:461:dfe2:c7ed with SMTP id ffacd0b85a97d-46adabe377fmr11423896f8f.27.1782304160939;
        Wed, 24 Jun 2026 05:29:20 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@kernel.org,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	tvrtko.ursulin@igalia.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/10] dma-buf: rename dma_fence_enable_sw_signaling
Date: Wed, 24 Jun 2026 13:13:25 +0200
Message-ID: <20260624122917.2483-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624122917.2483-1-christian.koenig@amd.com>
References: <20260624122917.2483-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65548-lists,linux-media=lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[christian.koenig@amd.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:replyto,amd.com:email,amd.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 772226BE279

Dropping the _sw_ part from the names was proposed multiple times now and
IIRC people generally agreed with the idea already.

The function requests a fence to signal and triggers some sort of HW
interaction on most backends.

So this is not really software related at all and the callback is already
just named enable_signaling as well.

Just streamline that and use a consistent name everywhere.

Assisted-by: Claude Sonet 4
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c                   |  8 ++--
 drivers/dma-buf/st-dma-fence-chain.c          |  4 +-
 drivers/dma-buf/st-dma-fence-unwrap.c         | 42 +++++++++----------
 drivers/dma-buf/st-dma-fence.c                | 16 +++----
 drivers/dma-buf/st-dma-resv.c                 | 10 ++---
 drivers/gpu/drm/i915/i915_active.c            |  2 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |  2 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  2 +-
 drivers/gpu/drm/xe/xe_userptr.c               |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  4 +-
 include/linux/dma-fence.h                     |  4 +-
 14 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index c7ea1e75d38a..0ec81a568bbd 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -534,7 +534,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
 	__dma_fence_might_wait();
 
-	dma_fence_enable_sw_signaling(fence);
+	dma_fence_enable_signaling(fence);
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
@@ -656,14 +656,14 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 }
 
 /**
- * dma_fence_enable_sw_signaling - enable signaling on fence
+ * dma_fence_enable_signaling - enable signaling on fence
  * @fence: the fence to enable
  *
  * This will request for sw signaling to be enabled, to make the fence
  * complete as soon as possible. This calls &dma_fence_ops.enable_signaling
  * internally.
  */
-void dma_fence_enable_sw_signaling(struct dma_fence *fence)
+void dma_fence_enable_signaling(struct dma_fence *fence)
 {
 	unsigned long flags;
 
@@ -671,7 +671,7 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 	__dma_fence_enable_signaling(fence);
 	dma_fence_unlock_irqrestore(fence, flags);
 }
-EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
+EXPORT_SYMBOL(dma_fence_enable_signaling);
 
 /**
  * dma_fence_add_callback - add a callback to be called when the fence
diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index a3023d3fedc9..e0d9b69bfa76 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -82,7 +82,7 @@ static void test_sanitycheck(struct kunit *test)
 
 	chain = mock_chain(NULL, f, 1);
 	if (chain)
-		dma_fence_enable_sw_signaling(chain);
+		dma_fence_enable_signaling(chain);
 	else
 		KUNIT_FAIL(test, "Failed to create chain");
 
@@ -139,7 +139,7 @@ static int fence_chains_init(struct fence_chains *fc, unsigned int count,
 
 		fc->tail = fc->chains[i];
 
-		dma_fence_enable_sw_signaling(fc->chains[i]);
+		dma_fence_enable_signaling(fc->chains[i]);
 	}
 
 	fc->chain_length = i;
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 4e7ee25372ba..4d9d313b460c 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -103,7 +103,7 @@ static void test_sanitycheck(struct kunit *test)
 	f = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	array = mock_array(1, f);
 	KUNIT_ASSERT_NOT_NULL(test, array);
@@ -122,7 +122,7 @@ static void test_unwrap_array(struct kunit *test)
 	f1 = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f1);
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
@@ -131,7 +131,7 @@ static void test_unwrap_array(struct kunit *test)
 		return;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	array = mock_array(2, f1, f2);
 	KUNIT_ASSERT_NOT_NULL(test, array);
@@ -160,7 +160,7 @@ static void test_unwrap_chain(struct kunit *test)
 	f1 = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f1);
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
@@ -169,7 +169,7 @@ static void test_unwrap_chain(struct kunit *test)
 		return;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	chain = mock_chain(f1, f2);
 	KUNIT_ASSERT_NOT_NULL(test, chain);
@@ -198,7 +198,7 @@ static void test_unwrap_chain_array(struct kunit *test)
 	f1 = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f1);
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
@@ -207,7 +207,7 @@ static void test_unwrap_chain_array(struct kunit *test)
 		return;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	array = mock_array(2, f1, f2);
 	KUNIT_ASSERT_NOT_NULL(test, array);
@@ -239,7 +239,7 @@ static void test_unwrap_merge(struct kunit *test)
 	f1 = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f1);
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
@@ -247,7 +247,7 @@ static void test_unwrap_merge(struct kunit *test)
 		goto error_put_f1;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3) {
@@ -285,7 +285,7 @@ static void test_unwrap_merge_duplicate(struct kunit *test)
 	f1 = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f1);
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = dma_fence_unwrap_merge(f1, f1);
 	if (!f2) {
@@ -322,7 +322,7 @@ static void test_unwrap_merge_seqno(struct kunit *test)
 	f1 = __mock_fence(ctx[1], 1);
 	KUNIT_ASSERT_NOT_NULL(test, f1);
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = __mock_fence(ctx[1], 2);
 	if (!f2) {
@@ -330,7 +330,7 @@ static void test_unwrap_merge_seqno(struct kunit *test)
 		goto error_put_f1;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	f3 = __mock_fence(ctx[0], 1);
 	if (!f3) {
@@ -338,7 +338,7 @@ static void test_unwrap_merge_seqno(struct kunit *test)
 		goto error_put_f2;
 	}
 
-	dma_fence_enable_sw_signaling(f3);
+	dma_fence_enable_signaling(f3);
 
 	f4 = dma_fence_unwrap_merge(f1, f2, f3);
 	if (!f4) {
@@ -378,7 +378,7 @@ static void test_unwrap_merge_order(struct kunit *test)
 	f1 = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f1);
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
@@ -387,7 +387,7 @@ static void test_unwrap_merge_order(struct kunit *test)
 		return;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	a1 = mock_array(2, f1, f2);
 	KUNIT_ASSERT_NOT_NULL(test, a1);
@@ -442,7 +442,7 @@ static void test_unwrap_merge_complex(struct kunit *test)
 	f1 = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f1);
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = mock_fence();
 	if (!f2) {
@@ -450,7 +450,7 @@ static void test_unwrap_merge_complex(struct kunit *test)
 		goto error_put_f1;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3) {
@@ -510,7 +510,7 @@ static void test_unwrap_merge_complex_seqno(struct kunit *test)
 	f1 = __mock_fence(ctx[0], 2);
 	KUNIT_ASSERT_NOT_NULL(test, f1);
 
-	dma_fence_enable_sw_signaling(f1);
+	dma_fence_enable_signaling(f1);
 
 	f2 = __mock_fence(ctx[1], 1);
 	if (!f2) {
@@ -518,7 +518,7 @@ static void test_unwrap_merge_complex_seqno(struct kunit *test)
 		goto error_put_f1;
 	}
 
-	dma_fence_enable_sw_signaling(f2);
+	dma_fence_enable_signaling(f2);
 
 	f3 = __mock_fence(ctx[0], 1);
 	if (!f3) {
@@ -526,7 +526,7 @@ static void test_unwrap_merge_complex_seqno(struct kunit *test)
 		goto error_put_f2;
 	}
 
-	dma_fence_enable_sw_signaling(f3);
+	dma_fence_enable_signaling(f3);
 
 	f4 = __mock_fence(ctx[1], 2);
 	if (!f4) {
@@ -534,7 +534,7 @@ static void test_unwrap_merge_complex_seqno(struct kunit *test)
 		goto error_put_f3;
 	}
 
-	dma_fence_enable_sw_signaling(f4);
+	dma_fence_enable_signaling(f4);
 
 	f5 = mock_array(2, dma_fence_get(f1), dma_fence_get(f2));
 	if (!f5) {
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 499272229696..856d0d302a5d 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -42,7 +42,7 @@ static void test_sanitycheck(struct kunit *test)
 	f = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_fence_signal(f);
 	dma_fence_put(f);
@@ -55,7 +55,7 @@ static void test_signaling(struct kunit *test)
 	f = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	if (dma_fence_is_signaled(f)) {
 		KUNIT_FAIL(test, "Fence unexpectedly signaled on creation");
@@ -127,7 +127,7 @@ static void test_late_add_callback(struct kunit *test)
 	f = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_fence_signal(f);
 
@@ -209,7 +209,7 @@ static void test_status(struct kunit *test)
 	f = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	if (dma_fence_get_status(f)) {
 		KUNIT_FAIL(test, "Fence unexpectedly has signaled status on creation");
@@ -233,7 +233,7 @@ static void test_error(struct kunit *test)
 	f = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_fence_set_error(f, -EIO);
 
@@ -260,7 +260,7 @@ static void test_wait(struct kunit *test)
 	f = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	if (dma_fence_wait_timeout(f, false, 0) != 0) {
 		KUNIT_FAIL(test, "Wait reported complete before being signaled");
@@ -300,7 +300,7 @@ static void test_wait_timeout(struct kunit *test)
 	wt.f = mock_fence();
 	KUNIT_ASSERT_NOT_NULL(test, wt.f);
 
-	dma_fence_enable_sw_signaling(wt.f);
+	dma_fence_enable_signaling(wt.f);
 
 	if (dma_fence_wait_timeout(wt.f, false, 1) != 0) {
 		KUNIT_FAIL(test, "Wait reported complete before being signaled");
@@ -379,7 +379,7 @@ static int thread_signal_callback(void *arg)
 			break;
 		}
 
-		dma_fence_enable_sw_signaling(f1);
+		dma_fence_enable_signaling(f1);
 
 		rcu_assign_pointer(t->fences[t->id], f1);
 		smp_wmb();
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 95a4becdb892..0b96136bbd54 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -48,7 +48,7 @@ static void test_sanitycheck(struct kunit *test)
 	f = alloc_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_fence_signal(f);
 	dma_fence_put(f);
@@ -73,7 +73,7 @@ static void test_signaling(struct kunit *test)
 	f = alloc_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
@@ -117,7 +117,7 @@ static void test_for_each(struct kunit *test)
 	f = alloc_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
@@ -176,7 +176,7 @@ static void test_for_each_unlocked(struct kunit *test)
 	f = alloc_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
@@ -246,7 +246,7 @@ static void test_get_fences(struct kunit *test)
 	f = alloc_fence();
 	KUNIT_ASSERT_NOT_NULL(test, f);
 
-	dma_fence_enable_sw_signaling(f);
+	dma_fence_enable_signaling(f);
 
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 5cb7a72774a0..e7632c1ff4be 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -543,7 +543,7 @@ static void enable_signaling(struct i915_active_fence *active)
 	if (!fence)
 		return;
 
-	dma_fence_enable_sw_signaling(fence);
+	dma_fence_enable_signaling(fence);
 	dma_fence_put(fence);
 }
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 2db221f6fc3a..56ad8ef32584 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -69,7 +69,7 @@ static void dma_resv_kunit_active_fence_init(struct kunit *test,
 	struct dma_fence *fence;
 
 	fence = alloc_mock_fence(test);
-	dma_fence_enable_sw_signaling(fence);
+	dma_fence_enable_signaling(fence);
 
 	dma_resv_lock(resv, NULL);
 	dma_resv_reserve_fences(resv, 1);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bcd76f6bb7f0..3980f376e3ba 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -224,7 +224,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 
 	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, fence)
-		dma_fence_enable_sw_signaling(fence);
+		dma_fence_enable_signaling(fence);
 	dma_resv_iter_end(&cursor);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4c80bac67622..85e6d9a0f575 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -670,7 +670,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 		dma_resv_iter_begin(&cursor, bo->ttm.base.resv,
 				    DMA_RESV_USAGE_BOOKKEEP);
 		dma_resv_for_each_fence_unlocked(&cursor, fence)
-			dma_fence_enable_sw_signaling(fence);
+			dma_fence_enable_signaling(fence);
 		dma_resv_iter_end(&cursor);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index ae5b38b2a884..a4fa00632a30 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -214,7 +214,7 @@ void xe_sched_job_set_error(struct xe_sched_job *job, int error)
 
 	trace_xe_sched_job_set_error(job);
 
-	dma_fence_enable_sw_signaling(job->fence);
+	dma_fence_enable_signaling(job->fence);
 	xe_hw_fence_irq_run(job->q->fence_irq);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e1651e70c8f0..dba73786d82a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1090,7 +1090,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
 						      false, MAX_SCHEDULE_TIMEOUT);
 			else if (pre_migrate_fence)
-				dma_fence_enable_sw_signaling(pre_migrate_fence);
+				dma_fence_enable_signaling(pre_migrate_fence);
 		}
 
 		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 6761005c0b90..2e45e42c648f 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -180,7 +180,7 @@ xe_vma_userptr_invalidate_pass1(struct xe_vm *vm, struct xe_userptr_vma *uvma)
 	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
 			    DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		dma_fence_enable_sw_signaling(fence);
+		dma_fence_enable_signaling(fence);
 		if (signaled && !dma_fence_is_signaled(fence))
 			signaled = false;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..73ac031ffb04 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -256,7 +256,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	 */
 	wait = __xe_vm_userptr_needs_repin(vm) || preempt_fences_waiting(vm);
 	if (wait)
-		dma_fence_enable_sw_signaling(pfence);
+		dma_fence_enable_signaling(pfence);
 
 	xe_svm_notifier_unlock(vm);
 
@@ -287,7 +287,7 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		--vm->preempt.num_exec_queues;
 	}
 	if (q->lr.pfence) {
-		dma_fence_enable_sw_signaling(q->lr.pfence);
+		dma_fence_enable_signaling(q->lr.pfence);
 		dma_fence_put(q->lr.pfence);
 		q->lr.pfence = NULL;
 	}
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index b52ab692b22e..158cd609f103 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -448,7 +448,7 @@ int dma_fence_add_callback(struct dma_fence *fence,
 			   dma_fence_func_t func);
 bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
-void dma_fence_enable_sw_signaling(struct dma_fence *fence);
+void dma_fence_enable_signaling(struct dma_fence *fence);
 
 /**
  * DOC: Safe external access to driver provided object members
@@ -534,7 +534,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
  * Returns true if the fence was already signaled, false if not. Since this
  * function doesn't enable signaling, it is not guaranteed to ever return
  * true if dma_fence_add_callback(), dma_fence_wait() or
- * dma_fence_enable_sw_signaling() haven't been called before.
+ * dma_fence_enable_signaling() haven't been called before.
  *
  * It's recommended for seqno fences to call dma_fence_signal when the
  * operation is complete, it makes it possible to prevent issues from
-- 
2.43.0


