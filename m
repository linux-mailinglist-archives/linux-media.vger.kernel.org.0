Return-Path: <linux-media+bounces-57256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH3iCPWVxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:36:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 253983462E1
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62091302378C
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011253F23A4;
	Fri, 27 Mar 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=ming.li@zohomail.com header.b="RfM4V5cM"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D6D3F7869;
	Fri, 27 Mar 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622014; cv=pass; b=EkT2Zs90YBbE1H+kDCaHV7k7nY56QdoEORXYDd8TxdgFtPQjfWBfdcqlAn9CnKpJj1F4OXbYXfRe/lv2HBY1OK/AqtKwRHqgI18FPjcbYbNltnTMBOyymfnDqWpuzvFQfo+WJeC6Cp08b9tkDWQiHnyEFTWcu89ktgcKO5kvaLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622014; c=relaxed/simple;
	bh=+zLhFjmQDcbbt7AWjLmj5y51IOac2tCxLouPPcLnI8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nP1lZKT76oW6dVnrdBFyRBCs5V8kJNKLPsituxkuMeWUkVWl7/x9pdXDvz0TuJW07dGjuWTw4o5/wvhRrePYRDaZX8VB4mobOPj/Iy4xCoA5MGOWGtieG6vU7iQHYBTLdFYwlHbTIj5QuqUfaL9lkbCTTHQlu7v6+39Y3HU7Npk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=ming.li@zohomail.com header.b=RfM4V5cM; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1774622001; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nUljK+qPzkYuVja+whhHMc0Zqr0M6hxb9rBEptKzX4J+TXATTg+him+nzPhHAAJIu01j9yl9Djb+lJzBFZxpO4DxtGZbBQkVrlKngZZQoCCS2pKaOP3qjzgtf0+Utw2rgzPvi4QUz+LBIi9MShCVWnXG5yooKLgW7ujckGeYHO0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774622001; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y7oh+a8faCMP0nn2EAP8q8UOeOBQTSgBhDx/Ls2KJr4=; 
	b=YkO5hHZW6oJ7/gKoZkW6uJtS/upBQLzMMVw28KuPslkHzh1MHK+Jx4rTCsi43ESCwVJ/g8py0VSHTSBJIykFTbsnA/hXx+tu3jbI8+fIBEHO1Lh5c8wSHzFxuIIBGUxsps7a2Qvl8a9O0jr/OWv1O1Q8vv0PBEPksas6uKcQePk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=ming.li@zohomail.com;
	dmarc=pass header.from=<ming.li@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774622001;
	s=zm2022; d=zohomail.com; i=ming.li@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=Y7oh+a8faCMP0nn2EAP8q8UOeOBQTSgBhDx/Ls2KJr4=;
	b=RfM4V5cMNMR705uZ8k7dsBzmDifyma3junLIxjCSeWyrLgYMLhEy/kE+Bbc2KeCB
	paN+bvdUPe9E/s7S9pJ42af1fm+8012gTfIyRscrDu8hiukwXEjgaDsmLafYIEnOLI+
	tBV24CfyLNwhs+2Ww675A52Fi/cgwRG5erZX21kY=
Received: by mx.zohomail.com with SMTPS id 1774621998416686.6503783790713;
	Fri, 27 Mar 2026 07:33:18 -0700 (PDT)
From: Li Ming <ming.li@zohomail.com>
Date: Fri, 27 Mar 2026 22:33:12 +0800
Subject: [PATCH] dma-fence: Dereference correct dma_fence in
 dma_fence_chain_find_seqno()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-fix_dma_fence_chain_find_seqno-v1-1-60e80bfb43c8@zohomail.com>
X-B4-Tracking: v=1; b=H4sIACeVxmkC/x2NQQqEMBAEvyJz3kCMi4JfERmC6ezOwVETWATx7
 w57LOjquqiiCCqNzUUFP6myqUH7amj5Rv3ASTKm4EPvuzC4LCenNXKGLmDbiHIWTVxx6OaGmBD
 7NzJ8S3ayF5jxD0zzfT/Zd5u7cAAAAA==
X-Change-ID: 20260327-fix_dma_fence_chain_find_seqno-7adea64efe01
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Li Ming <ming.li@zohomail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774621995; l=1233;
 i=ming.li@zohomail.com; s=20260210; h=from:subject:message-id;
 bh=+zLhFjmQDcbbt7AWjLmj5y51IOac2tCxLouPPcLnI8s=;
 b=n+W96xE4botpec3dm4ZtmEfoa2crfqwYysFYGgIGPd40VUnYgxh6GUDVRA02g7GKPnyDIfZ3a
 px4khNDWLaaBfqUeciHdC5QYk3tNhwpvOgC0sEslcxLi0Jq0gaKY6Al
X-Developer-Key: i=ming.li@zohomail.com; a=ed25519;
 pk=JfhrdHjyYJMXt47Hy8d/fsqZuhGPD4Z3whV5lTfVvhE=
Feedback-ID: rr08011228940aa66380fa0d4b662a568400000d279bad22d5095ea3e85f9414054fc86fffc237db77815a9796:zu08011227ab6f83bf04d1505dc422a3a70000adc505029736d0771b9faea9619460ca47f63293d14ccafe3a:rf0801122d88732d6b5a5151da13656a3e00007c881f111584b5d382ba029be96c8375f169bebdf57c1d7ad2c58728b9fa40:ZohoMail
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[zohomail.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[zohomail.com:s=zm2022];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57256-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,zohomail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.li@zohomail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[zohomail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,zohomail.com:dkim,zohomail.com:email,zohomail.com:mid]
X-Rspamd-Queue-Id: 253983462E1
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


