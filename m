Return-Path: <linux-media+bounces-58145-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mETCEPCJ1GkrvAcAu9opvQ
	(envelope-from <linux-media+bounces-58145-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 06:37:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE493A9B71
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 06:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D908B301C6EF
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 04:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D675A1A9F88;
	Tue,  7 Apr 2026 04:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mdsJdW6h"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3A41E505
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 04:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775536618; cv=none; b=lI9l25jPuGbylviz9KaRSNZkaxotCfSMzJyjspGhzsoBfo5gxtNpTTGLc2wpob8pV0jzmEthrf9mmnWhqYfXi+WHw7ajRwLUHZG8I4L0dMRK0UbyEwIHusxhkgz427wu6JlNfVZpbOQ9vc1ls02t/XZ58hFjtx0qvCv/b5Kbg4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775536618; c=relaxed/simple;
	bh=yiZQlMpKmH4qIx+xwj7WH8RyJf9EBRY0irW9kF3wXrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q2A91OzBJ13PbM/1hyrWuiWvRXiV093QZE8/AgjThMjindygfHIBwVCAgeRuXEhfhaANxENvbnBdX9ndeIYbCiPBdPEX+hGpha/J5XmUva/bbnZQl+TxBKtnQMyIYPSEiA2fQNxuJGhmBkbTtT9T2Z9JL+Rx7Ti5LrmYKYpD8i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mdsJdW6h; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=AZdryoEjym1dfrc8csNMBSh/pD6+gVbxgUBr+ZfMCMA=; b=mdsJdW6hBj4+4e6enWTyx6vv0L
	nWX/ZO1Q37CzQXmdqbssr4bMckGKz/ZsEdHTesiAlfbpMfvufanvVxWDKI+SN4iaeW6g8LB/tmJhR
	ea2SojoO0DQv9Wn6XrG2Ot4MEmptBZYvik95FcUj5X/fOVS5J5KMN9fOH4K57mlA3/YJqxumshadq
	rd2/WKN0j/Ekzg8QnVzE3dBuPBas68DBtjzO+1DRy2Pe1rZ7YXHVD/71OvlS6QD7569QB24Ae+ICO
	7lIGy3xPbPJ4G62D2afLts4Vy73WpZxlEDTn73bfwX3L88oLrRgoi/nl+YcT2FKbPhIPe0YWk4ol4
	Zws0gmug==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yBF-00000005soa-3IbK;
	Tue, 07 Apr 2026 04:36:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] dma-fence: correct kernel-doc function parameter @flags
Date: Mon,  6 Apr 2026 21:36:48 -0700
Message-ID: <20260407043649.2015894-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58145-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9DE493A9B71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

'make htmldocs' complains that dma_fence_unlock_irqrestore() is missing
a description of its @flags parameter. The description is there but it is
missing a ':' sign. Add that and correct the possessive form of "its".

WARNING: ../include/linux/dma-fence.h:414 function parameter 'flags' not described in 'dma_fence_unlock_irqrestore'

Fixes: 3e5067931b5d ("dma-buf: abstract fence locking v2")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Christian König <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org

 include/linux/dma-fence.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20260406.orig/include/linux/dma-fence.h
+++ linux-next-20260406/include/linux/dma-fence.h
@@ -408,9 +408,9 @@ static inline spinlock_t *dma_fence_spin
 /**
  * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
  * @fence: the fence to unlock
- * @flags the CPU flags to restore
+ * @flags: the CPU flags to restore
  *
- * Unlock the fence, allowing it to change it's state to signaled again.
+ * Unlock the fence, allowing it to change its state to signaled again.
  */
 #define dma_fence_unlock_irqrestore(fence, flags)	\
 	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)

