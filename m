Return-Path: <linux-media+bounces-59475-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDKsFzwE62m2HQAAu9opvQ
	(envelope-from <linux-media+bounces-59475-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:48:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F20EA45A0A7
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA26630074A1
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F96C33ADAD;
	Fri, 24 Apr 2026 05:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br9qK58S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710134403F
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 05:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009701; cv=none; b=jrU68A/wU+PQsrsdJQNTmRTUKEyz3cC6B4A698plhehRf8NBinE7iWWUwPw1Iz3sQuyjwNhP5PiimrK/2EBReFW+mWqX+Ql6Ko9W8TY6tmVuD8KEp7R8ivaE9dyTosOJ+RZzzXNIBzfY205gFTz4a3L1gP2cBGiMfSjK3hsdesw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009701; c=relaxed/simple;
	bh=5AskzqVicAC9flZ1LjZUxvbxlBf3jPZH4cwWbVOrA3s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QR5bbBKXiF6IwhhDClLloWY02o5GnT5HTTmtSNAAZl1AWrf+ATIhUU7Lkux5jr2ZIHmj4XmHYe+tIvwRX5XCWzG8gK/USzMEtzOTV62gL6m+b9yxEuZX+zCF/oh4CvN/M6dZST9ps0iTUyya5DSN3yRyOnmmI9E6StKXHP58WkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br9qK58S; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad21f437eeso48824845ad.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 22:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009700; x=1777614500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox8HNk2ehgX4u9MIzrQAUilnp/6GJtQsHeC9tfe3Lv8=;
        b=Br9qK58SWnsBu7BIAJLSRmrjvqPYYW2+OfLYSWVgF99RTfSwF4DoLZ+ApFFJiAJ1Mt
         nZwQXTHywuXUfqybCOdKlJzKcKENPibUt+5edwXlQq3K+754iw1fjRy1cjXqmVUdSAAh
         8t4iRSs2JOPeCMaLG77+KlTUa77ysey9/4O3jJBaaP40pl9HmuGmJ69IK/oytT6ZXulC
         bg9ygfBlPEjj2owRVXFx83Crwf48TnQao7Ai5XEYtIyJS+M00GdVJI8XjLbcbPgqMIEt
         n/RcuwQlIoZ17G4TcK/DqV4m5fponGpSDepTt0c9c7DeV/yrfqNjF5SFKR0ltoJlNWYE
         uPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009700; x=1777614500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ox8HNk2ehgX4u9MIzrQAUilnp/6GJtQsHeC9tfe3Lv8=;
        b=Mj1zt9xcRQJkLjAoDDfbl3RarnL0mPBX3FuJuQRhawzMmljRsECcYrAZalMzNFIZ1l
         qu5I/nByA5GSE+DPYnRqqkWhfzTwhOHKMZVnyyFEDp4cDexPjIc0Us/I8F0CCW2DVgM5
         jJbld6kCMibAJjPXQYxea/rRaOqqWKbYTiJFAEp6EGW2CBlclkl6y04dOU648OvpnAGO
         yN0OG/0+NmUSk2xBePHkIsbCJwoBOVdv6gGDXeGdDn/v7Eqntrl+wRm1xsOyj3h14eqW
         U0QVcyvt7hRR2Lq6wWpwdlrn+clEWzTUOJFfPWvs9qOrk6pczCaytYQJqoTMNcgeSJ0j
         gBZg==
X-Forwarded-Encrypted: i=1; AFNElJ81G3/bprl6G6M2wdWHthtziCfi/a3DPqNgGBJUiKF/k+YWteUpZ3jO26MIwWtTIneJ9Bed7c74OknIcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyURo4qfG3XQ/PAUO7Dd3r03e1L+TyaTowXGjNLMJL2hw0ympMM
	YoWaXLOEPrj4R6DmRqLBTDwoDIEAmVhfaK/KH0teJBbd8qhQjTxHfNKR
X-Gm-Gg: AeBDiesSDQRMGqELlXgHTG0Qav2gateEIvy6RWWkWHJEyG9mSEsVSx7oJLxQFIml5F2
	79YF2ICwuDWXj7LT3N2HIiwhtdChLTtrdhOShk6n3A4InO1ZsvKc6dorbfNNJmUdUV0z8nLUReN
	n+tE/EIn8kFI0QIayTBYdhG4dvMQMfzaPF2WCJ4sfx4rQabwGcHRhBrZ7pO9O9xqx1/VE8bTGDE
	w1ON0vAO7ngSAQmI3GeeN1oJvm88e55ivi6PpfYj3S6PsvyfrhYMqoPszPurOcvw2bNxNJfu4ck
	RhgePF1fkqufb2SRll+MCsw8r/2wri6P36/AWrShwvN9XvZUVx2TBMmwbXTJbrdZl7lqMmEtUKv
	eQdjSbC1ruoSGpVf4rxLvzSIiE4KCdv6IxhgxalsogBn859cLWmIn7AMDHGwuYjmkRFWxmb2OCQ
	XTXCIyDE29vKuW8ruI/lqcyEt4dTArWKb4xnvYLvzaCI9dvTcT7V/pl7y8TAjp1Gzqr2aJ0KktQ
	wSapWh1khsZTUU=
X-Received: by 2002:a17:902:d591:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2b5f9e18812mr226513645ad.13.1777009699637;
        Thu, 23 Apr 2026 22:48:19 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:19 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Fri, 24 Apr 2026 11:17:37 +0530
Message-ID: <20260424054742.45832-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F20EA45A0A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59475-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

When building with LLVM=1 for architectures like powerpc where
CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:

  ld.lld: error: undefined symbol: dma_resv_reset_max_fences
  >>> referenced by helpers.c
  >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)

The issue occurs because:
1. CONFIG_DEBUG_MUTEXES=y is enabled
2. CONFIG_DMA_SHARED_BUFFER is not enabled
3. dma_resv_reset_max_fences() is declared in the header when
   CONFIG_DEBUG_MUTEXES is set
4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
   which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
5. Rust helpers call dma_resv_unlock() which calls
   dma_resv_reset_max_fences(), causing an undefined symbol

Fix this by making the function declaration conditional on both
CONFIG_DEBUG_MUTEXES and CONFIG_DMA_SHARED_BUFFER. When either is
disabled, use a static inline stub instead.

Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 include/linux/dma-resv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c5ab6fd9ebe8..23c8db0b5214 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -311,7 +311,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-#ifdef CONFIG_DEBUG_MUTEXES
+#if IS_ENABLED(CONFIG_DEBUG_MUTEXES) && IS_ENABLED(CONFIG_DMA_SHARED_BUFFER)
 void dma_resv_reset_max_fences(struct dma_resv *obj);
 #else
 static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
-- 
2.53.0


