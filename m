Return-Path: <linux-media+bounces-53233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JRuLjzMnGlHKQQAu9opvQ
	(envelope-from <linux-media+bounces-53233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:53:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24617DCBA
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9EF96303B904
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 21:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279B237A48B;
	Mon, 23 Feb 2026 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="12UX7p4R"
X-Original-To: linux-media@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5D73793CF;
	Mon, 23 Feb 2026 21:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883525; cv=none; b=jQItIHaEHauyQ+YvTj+HUSuNHnrv7Pc/EkMNveVAHE1snLk/8aKshzZ3hYgmvoBtqCRWpX1SBMfcKRvQ7tlL+RomkqtaATcvmj9osWCNyfdeQqPZyFUUSwTrKel99d+65UgbjTozncUQ+Edfc5M9BQGvz4voXDWyzwzxeHmh8oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883525; c=relaxed/simple;
	bh=bRtJabWT+yTTorF0+GnkO804qkKj0hG8M/ihWTLoebQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/QyG9nu5TDuq8V4BLMJTDvr0p5Gdv781TR7jeYSC7P4+VkfFTiR+hGso8SuEqrrH7eYP2mGUIlRoqlvW9b48yj8ozfSRZcx1Xhb7hKwhmbJZP08uIzNJEuc0Csi43FT8S4F3SGT0f1dv3ZPsJxZaqgTw3nssQYfFbMzBiWOnx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=12UX7p4R; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fKZM81lXFzlh2fB;
	Mon, 23 Feb 2026 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:references:in-reply-to:x-mailer:message-id:date:date:subject
	:subject:from:from:received:received; s=mr01; t=1771883521; x=
	1774475522; bh=fYxQozmqbCR65/nGtCFoDmorhdFiAw0UWwj4/dZzG/k=; b=1
	2UX7p4R6l4PEZM9r52HT1Jf50nEOJ0m39jMoMg3Tfsp9WsFOHgulw2H44NjGQvP4
	DL5ApNhPO0mT8ReHpkkaj55s7eRrkHSnXFLW9+WZltzgXTa/g16Q9v1JHxUyS7wB
	fagrrI8TJSQMNVjVmJk+FwjDVO5jxTK/2uRkDN+2ueraDDiohnYfnWGJ4QBep57z
	OYFv5WnxE47GQuCzfN18UyHeaXpij3/2olSgO0qE94nfAC3T0b4qW0WQen/rKZq9
	YRZ5k4WQTxL/JlVqNFD9S67RAPP7hLPluHRdYUqswxD8SmPtZHjrww22HC50BVyH
	dVYfVGfDBV75l+sDZzTug==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id fUDcx3UVRY_l; Mon, 23 Feb 2026 21:52:01 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fKZM04p9Szlfl6N;
	Mon, 23 Feb 2026 21:51:56 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 06/62] dma-buf: Handle all dma_resv_lock() errors
Date: Mon, 23 Feb 2026 13:50:21 -0800
Message-ID: <20260223215118.2154194-7-bvanassche@acm.org>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
In-Reply-To: <20260223215118.2154194-1-bvanassche@acm.org>
References: <20260223215118.2154194-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53233-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[acm.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,linaro.org:email,acm.org:mid,acm.org:dkim,acm.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A24617DCBA
X-Rspamd-Action: no action

Instead of assuming that dma_resv_lock() only returns 0 or -EDEADLK,
handle all possible dma_resv_lock() return values. This patch prepares
for enabling compile-time thread-safety analysis. This will cause the
compiler to check whether all dma_resv_lock() return values are handled.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/dma-buf/dma-resv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index bea3e9858aca..b4710f730e9b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -792,6 +792,8 @@ static int __init dma_resv_lockdep(void)
 	ret =3D dma_resv_lock(&obj, &ctx);
 	if (ret =3D=3D -EDEADLK)
 		dma_resv_lock_slow(&obj, &ctx);
+	else if (ret)
+		goto fini;
 	fs_reclaim_acquire(GFP_KERNEL);
 	/* for unmap_mapping_range on trylocked buffer objects in shrinkers */
 	i_mmap_lock_write(&mapping);
@@ -805,12 +807,14 @@ static int __init dma_resv_lockdep(void)
 #endif
 	fs_reclaim_release(GFP_KERNEL);
 	ww_mutex_unlock(&obj.lock);
+
+fini:
 	ww_acquire_fini(&ctx);
 	mmap_read_unlock(mm);
=20
 	mmput(mm);
=20
-	return 0;
+	return ret;
 }
 subsys_initcall(dma_resv_lockdep);
 #endif

