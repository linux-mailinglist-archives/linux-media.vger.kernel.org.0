Return-Path: <linux-media+bounces-58271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEnqLXd/1mmQFwgAu9opvQ
	(envelope-from <linux-media+bounces-58271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:16:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6A3BEC11
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFCF13068F53
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 16:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65ABA3A16A0;
	Wed,  8 Apr 2026 16:15:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from 6.mo581.mail-out.ovh.net (6.mo581.mail-out.ovh.net [188.165.39.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D534361DDD
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.39.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775664935; cv=none; b=D4+EU6hCwHLTf1ET9f4LSoKz/HNEeDYszG0D8QScGXco3/Ebe+m1ypPQw+UjTMoMAjY8YpKzvWm6Rtf4NVusxFIkNVVMN9CKQIYIsGaH4+Gg4eoXQvinrp7WsNk5uRervDSgWG+Zn6ZBQRpyfK+JSRBDzyvGGTclgOGEwd9UYzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775664935; c=relaxed/simple;
	bh=T2ep69pEfKE5xHAslZZ3xSIyipbTysLJhfNfuI/3W9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDRZVcgwSvNzvqH+AO22FEiLnqvuw5P5qW9mx0SwY7FCjVUQ+xiQCwRXi2dwiQzvwEHP3pyJKaFX7I/nwqBf6Xt1DSEwMP/mbBjjewMxqPYmklyKPx/GmqpO7fJhjti9sjl5x4YShm7/3N4QmEPuv0Z1k76lsduPxW/0Z5TdGL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.39.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.58.189])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4frN1X74Ljz60Q0
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 12:39:44 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-rvp9c (unknown [10.110.118.225])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5CAADC29B9;
	Wed,  8 Apr 2026 12:39:43 +0000 (UTC)
Received: from etezian.org ([37.59.142.97])
	by ghost-submission-7d8d68f679-rvp9c with ESMTPSA
	id MJC9D49M1mneRSgAk2rvTQ
	(envelope-from <andi@etezian.org>); Wed, 08 Apr 2026 12:39:43 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G00223703280-d183-470b-9751-0b51bc554a44,
                    D209C671E6EFFA79B5C95F157C9E47DE85B2B2E2) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.82.31.9
From: Andi Shyti <andi.shyti@kernel.org>
To: christian.koenig@amd.com
Cc: janusz.krzysztofik@intel.com,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	sumit.semwal@linaro.org,
	Xiang Gao <gaoxiang17@xiaomi.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] dma-buf: fix UAF in dma_buf_put() tracepoint
Date: Wed,  8 Apr 2026 14:39:15 +0200
Message-ID: <20260408123916.2604101-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <68595b2ceed038074f5fe0a5739d75aafbcac8d3.camel@intel.com>
References: <68595b2ceed038074f5fe0a5739d75aafbcac8d3.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 5516909544000427226
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFJcN3wABJSf2iZpuR5LkA/rJofncb8HPc1lvL14FRcLOhQZE9m65WI7Syzas+A5oU/HMP6qC08qwn2zeFkRR5HvIZrLxMSqek0zFZDYgrkyvfAr5plLRTBX/NT1TF8vFWKq2ajKk0j/79sd/tNec7iFaJQhArVdfqMXgEY9sgx9yGM9FzuJLYJKMjXCETNVsXf+qfrOdOhVic425NTdRHE3a3QPOSdjP3MeHA+GhGkfeLZ3KRIxDswm1v6v1n01idrLScUV3IcfBnSZc3eV7sfBqvJvxU7El0aQnmB3Qejf7phnyndjNdEJ4FQBHv47AIXzCTaI9hPomwTY2P5akDfKr4R9NR+zvVponK4apkKLRC+/YPhnB6O84GetcPU2rHE3myR+9GlG05uoI7BKUCdVwdBL2a3vJo2u8Rsk/IYJiA0Ez+EjdYjFKYfoQ3KPzGRoCP8R1Mr4YlEe7Hyg+Dt62hZ+BeTlQqO/Nuj9mjwGVAr5wdpanvrZVKzmVeCXiNs/Fxt/jjnGksOtEVKqIqH0rhWzpPRoWmU7rbYTsh4DRmmlywE8YCgdEjlhKYkuK2IZr/joiMUpXuYmgfSKnNfQQ8Vu/US9Kp+KggogqyHpZICaZps67TNJtWxcuT29rhIbqNCvv0kXqTXCNEq3ln8BcJ45bWiRAjAJRRePaHbRQ
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58271-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.956];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CE6A3BEC11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dma_buf_put() may drop the final file reference via fput(), which
can free the dma-buf. The new tracepoint invocation was added
after fput(), and DMA_BUF_TRACE() dereferences dmabuf and takes
dmabuf->name_lock.

This leads to a use-after-free on the final put, visible for
example as a spinlock bad magic fault on a poisoned 0x6b6b6b...
lock.

Move the dma_buf_put tracepoint before fput().

Reported-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Fixes: 281a22631423 ("dma-buf: add some tracepoints to debug.")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Xiang Gao <gaoxiang17@xiaomi.com>
Cc: Christian König <christian.koenig@amd.com>
---
Hi,

I believe this patch fixes the issue reported by Janusz, I haven't
tested it. Perhaps we can add some more checks in DMA_BUF_TRACE.

Thanks,
Andi

 drivers/dma-buf/dma-buf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a202a308c079..b72932c57cb9 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -845,9 +845,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
 	if (WARN_ON(!dmabuf || !dmabuf->file))
 		return;
 
-	fput(dmabuf->file);
-
 	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
+	fput(dmabuf->file);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
-- 
2.53.0


