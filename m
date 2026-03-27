Return-Path: <linux-media+bounces-57313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GHsNebQxmkCPAUAu9opvQ
	(envelope-from <linux-media+bounces-57313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:48:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F821349210
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5822A304EF4E
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D312D839B;
	Fri, 27 Mar 2026 18:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=ming.li@zohomail.com header.b="TrdolQ4+"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81933256C6C;
	Fri, 27 Mar 2026 18:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637273; cv=pass; b=q7dJk/neluHbchTqZUFTLkt3c4dkp/8ZSR/GMyEP1503XXyda5DdUK6ByEKiFlFKYNq2BiPZe5saxxcNbgKdJQzviuDzY5+qYD/nSWTSZ1V+cZFqvPnvclWr6GJhrM4JXmWUw+N72UXA4sVBl8xWOf3GjbAElEglSkH6r6Juu2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637273; c=relaxed/simple;
	bh=+zLhFjmQDcbbt7AWjLmj5y51IOac2tCxLouPPcLnI8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YCwkRXhihr+1S6hUCah2gARQ00eKuCfp1ORXe0NNQqWaoSIKwymPbYbKGKYq2/mFR0dt6THwH4G91hsTGvnT/8T/JskvfeHwLp8c2q/Sh5Um1aH0YyEV6K6lpI+NGPkjq1k2X/WJC8KjSj7WRqtMscyCNb3+08O2npFDLSEHamE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=ming.li@zohomail.com header.b=TrdolQ4+; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1774637264; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wa0Z53itwQFqASrzKx8rouFn/yL36+kjWbjuYLxvYg15Ec0p/u7DRq+EXAI8A1Fs4oCA267gwiZyfK7vuOAvGmTVdGumQbM17ythpYXPd4nEc1sBI7Zt/YHCoM3Cj6VEccYu/v8ZOnNT+5OUdRR/nvGFgLhc0tb+3Xe9H/28VoE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774637264; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y7oh+a8faCMP0nn2EAP8q8UOeOBQTSgBhDx/Ls2KJr4=; 
	b=mFu5RJfqmq8TW6AP01Jkd3/fYIzSKEqEv2aotQIzFEci0/6RPYRqO1INbwb+zGqkSk4HeeIUxXltJ7MmG/BrK0Oe+NxHMhOyFuqmjvn2Os+49LWaUxZIzasGtynoIfVjOhsdB53lUIWlIcSYNy7xNodp9D5theO/DMbBkiCpE6g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=ming.li@zohomail.com;
	dmarc=pass header.from=<ming.li@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774637264;
	s=zm2022; d=zohomail.com; i=ming.li@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=Y7oh+a8faCMP0nn2EAP8q8UOeOBQTSgBhDx/Ls2KJr4=;
	b=TrdolQ4+1rO+JaByD0f/IPjIlmPfiouYzZCe/we3b/YH3rcNmJnb4b47PrV2INB4
	T4u9GlEacILLaMlo+porIHSCdZ/S6+h6hHYbQHXwSxn7nXcSEMz6t9ajNsvb0ZCO5m+
	V5St6yxmPuhoD96nPCwe8YKf2w7aw5yRuxKslb2Q=
Received: by mx.zohomail.com with SMTPS id 1774637262091797.4127866298093;
	Fri, 27 Mar 2026 11:47:42 -0700 (PDT)
From: Li Ming <ming.li@zohomail.com>
Date: Sat, 28 Mar 2026 02:47:24 +0800
Subject: [PATCH RESEND] dma-fence: Dereference correct dma_fence in
 dma_fence_chain_find_seqno()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-fix_dma_fence_chain_find_seqno-v1-1-3847c8ef0292@zohomail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Li Ming <ming.li@zohomail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774637259; l=1233;
 i=ming.li@zohomail.com; s=20260210; h=from:subject:message-id;
 bh=+zLhFjmQDcbbt7AWjLmj5y51IOac2tCxLouPPcLnI8s=;
 b=HFIUy3+KdDFXVMti/Ga/SxpCMQOaEDfvxnCIt8Wj8X+yVkCUbfSkpmZieZXXc00RDhKtIUJFF
 AK+F53ygqNLCK2Y1OKwgzSKCdvD+AAwqB3RUtIDzRal2eXT4qjI8hew
X-Developer-Key: i=ming.li@zohomail.com; a=ed25519;
 pk=JfhrdHjyYJMXt47Hy8d/fsqZuhGPD4Z3whV5lTfVvhE=
Feedback-ID: rr08011228b211dd271431ffbf402eaf1e0000b83e2267d51a1f7e34f210ea5ac143badbbdb7ca67a49d823375:zu0801122773f2ec82482f97e6caa0fb030000c3261d8540fa7ed02b3199d1d6543ffa4200911cde1f047276:rf0801122d2538852d2bc1da22113372b30000278184736ab56759343bdfb987b5b1873b0691eb11ba36abdbe3fcf81e8b24:ZohoMail
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[zohomail.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[zohomail.com:s=zm2022];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57313-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,zohomail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.li@zohomail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[zohomail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zohomail.com:dkim,zohomail.com:email,zohomail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F821349210
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dma_fence_chain_find_seqno() uses dma_fence_chain_for_each() to walk a
given dma_fence_chain. dma_fence_chain_for_each() always holds a
reference for the current fence during iteration. The reference must
be dropped after breaking out. Instead of dereferencing the last fence
as intended, dma_fence_chain_find_seqno() incorrectly dereferences the
first fence in the chain.

Fixes: 7bf60c52e093 ("dma-buf: add new dma_fence_chain container v7")
Signed-off-by: Li Ming <ming.li@zohomail.com>
---
 drivers/dma-buf/dma-fence-chain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a8a90acf4f34..71fa173aef13 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -103,7 +103,7 @@ int dma_fence_chain_find_seqno(struct dma_fence **pfence, uint64_t seqno)
 		    to_dma_fence_chain(*pfence)->prev_seqno < seqno)
 			break;
 	}
-	dma_fence_put(&chain->base);
+	dma_fence_put(*pfence);
 
 	return 0;
 }

---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260327-fix_dma_fence_chain_find_seqno-7adea64efe01

Best regards,
-- 
Li Ming <ming.li@zohomail.com>


