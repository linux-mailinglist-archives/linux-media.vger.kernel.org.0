Return-Path: <linux-media+bounces-66034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iAIaFp9cQ2oxXQoAu9opvQ
	(envelope-from <linux-media+bounces-66034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 08:05:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F96E094E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 08:05:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rVT0syse;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66034-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66034-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C92133037BC3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 06:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C6F37AA81;
	Tue, 30 Jun 2026 06:04:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0118131F9BE
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 06:04:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782799487; cv=none; b=sSPXAee/WYflq8bYTDaJobyB3bT1+7xrprZGtQyw+6bLRdkdCwigptsZcvb4nIl9alWF2jbiLKPJQi209IP2eTsG0CGPj/WeOc2opFTS/xH1ip9nJZSSD02dtixXVxWwFiVRCfpDdL61BgL2vkGyLs/paDJy9InUBYedk9bl5Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782799487; c=relaxed/simple;
	bh=eAjdxIIyKRVNH3vLcpIEnz63z9/yeMG8JcSpNnE973c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XpuwTAFvV/N86+ob61rW0AxlO72ECLdE+XIgHhBV+b9+y3vHvYFiStqxKB6plkDXkW9UjzPtdTFkMKKKAdPAqgzg7yYo3lKaFUUzBb3m0b2GarGQWlYFO8HUTzNj0W6VOCD1ZIzSNRcF9Rmutd3CGWb+d3JI9y+naPsKvng2whI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVT0syse; arc=none smtp.client-ip=209.85.216.42
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37fb434c547so1920696a91.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 23:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782799485; x=1783404285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=10B4i4oL/7/zv30DqERWrYljWa6g0AJAQ99ZS+xoTjU=;
        b=rVT0syseLlfwwvf8IYMATL3bFIR7qjtsi0e2Uh2xiQlYhim4y8m5ml9nPD8jJ7q13m
         U4myLQXlgbRTN7KkJZsKLLzT3MjbW0FRckaKxC7DxcEA3a919A03nvUJAcbaVv3qaoNA
         0o4AoEvMf+TpZptU64spUSeYPZKFA5OUbwLetqpff0ZgTNxeMptNIOjls+u4GF0MsXgX
         crGuRr/RhAzyl8hCjwbyiD2RBR1yqprLRfiqLFYT9FurawuN21XInMslKKnul7my+KGk
         FyzMVX4BW4Yx81YsK80mKR81HLkoloAKJyY0s/hf7UEj4YlY6eQ1TVS6yPLtxnCBRRBb
         zA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782799485; x=1783404285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10B4i4oL/7/zv30DqERWrYljWa6g0AJAQ99ZS+xoTjU=;
        b=XrSCAELLu6B701u1hcT4YdBfNuBadNg2+3lH2odzBLSohbR7VICehvISmfn3n+DiK6
         tcyr1RjNkg+8qjnKEYngyElYFAa6G5CRIh2KTdC931aJ+gl7Tbsq2h/JIqv3o1KizEcG
         85EVGzZde58Y78GyMXn1UP/tVY8KtIENfGl1MX+M8wqzxtdyL1d7nDtry4ActEmZEkev
         R0IX6BPFQgB8UHoUDRHybtYRrmE5OnAUfhwOMpvvrKikL9KZHhtTnBEsM1+VKEJ7QhGX
         0g8mmGlCvfu/4iXatcfVasF1FSZJDTlcE6tyNDLkhvde34KS76IH81VK8mA4/tzPMDDJ
         U2XA==
X-Gm-Message-State: AOJu0Yx/pHQkWMgKC0WXEIVAVnHBZtEAshD5tZJHXFE18ReQEE10RwES
	T9wxrJ2FALuJQkeEy5K0Xfvq5fNJJ/8g8jQNMfm6tfLDmBcTgM6rEv1nu/Wd6MrNH26r/g==
X-Gm-Gg: AfdE7ckWOC+3844/2yl56qNUer6HDC0ytDCdAg2eUOEWitz2WWWgZrlA4oz0c/S2/Oh
	Md2l9qEIG9ijBLHiPemN6W6+HR1FQFcIfsNEnYcoI9RtwlSzxg+m57Ur/CxkWAMExIOMLHyUk2c
	LQ5NAQReja4Z7r/VwiS9JIx2hHR8GOAI4XSoES0ezfwitTV8/wj8dd60pOUmFbuSNyqogW0OBRo
	5L+106kiAq8AqaqLTwpIXlq/iB4HhwRMBvvlAywHQMO368NhsVi/AC1lnKh+6HEUOTyI7XzPicA
	wqCCXfcRjuXhVaBNgGobx+dFURWkRLuEe+r2RGdTJ0rw81EUaLcOBYjRN7WPCqjkQNPvzDjpkVU
	woHbLuNdP1Pv/C46MUmJAPlcT6ngNcZN8I29T880oYV0GjGYdp0fNrVAhwByFWDb6yuy3xvm9Wb
	mOL7/N0cDb6rlDLFMsCYCis+mOg/Q4mMTgx0tddBsuc+WCw56B6RLAXQ==
X-Received: by 2002:a17:90b:510b:b0:37f:eda5:5169 with SMTP id 98e67ed59e1d1-380526d0477mr1902250a91.13.1782799485253;
        Mon, 29 Jun 2026 23:04:45 -0700 (PDT)
Received: from localhost.localdomain ([45.67.201.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380532d4563sm988387a91.6.2026.06.29.23.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:04:44 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	phasta@kernel.org,
	tursulin@ursulin.net,
	akash.goel@arm.com,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH] dma-buf/test: add KUnit case for dma_fence_dedup_array() empty input
Date: Tue, 30 Jun 2026 14:04:36 +0800
Message-Id: <20260630060436.1527498-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.linaro.org,kernel.org,ursulin.net,arm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-66034-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:phasta@kernel.org,m:tursulin@ursulin.net,m:akash.goel@arm.com,m:shoubaineng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C29F96E094E

Add a KUnit case verifying that dma_fence_dedup_array() returns 0,
not 1, when called with num_fences == 0. This locks down the
contract documented in the kernel-doc and prevents a regression
of commit 77a9298741f8 ("dma-fence: Make dma_fence_dedup_array()
robust against 0-count input").

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 4e7ee25372ba..72dea6091d58 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -370,6 +370,15 @@ static void test_unwrap_merge_seqno(struct kunit *test)
 	dma_fence_put(f1);
 }
 
+static void test_dedup_empty(struct kunit *test)
+{
+	struct dma_fence *fence[1] = { NULL };
+	int ret;
+
+	ret = dma_fence_dedup_array(fence, 0);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
 static void test_unwrap_merge_order(struct kunit *test)
 {
 	struct dma_fence *fence, *f1, *f2, *a1, *a2, *c1, *c2;
@@ -595,6 +604,7 @@ static struct kunit_case dma_fence_unwrap_cases[] = {
 	KUNIT_CASE(test_unwrap_merge_order),
 	KUNIT_CASE(test_unwrap_merge_complex),
 	KUNIT_CASE(test_unwrap_merge_complex_seqno),
+	KUNIT_CASE(test_dedup_empty),
 	{}
 };
 
-- 
2.34.1


