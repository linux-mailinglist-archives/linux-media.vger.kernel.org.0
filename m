Return-Path: <linux-media+bounces-53712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKhoGAGboWl8ugQAu9opvQ
	(envelope-from <linux-media+bounces-53712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:24:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F31B79B1
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B80330B0F2B
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 13:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1624280035;
	Fri, 27 Feb 2026 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzPAG66Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F423D7D4;
	Fri, 27 Feb 2026 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772198614; cv=none; b=tEeJYFR17+dgakpgRnABe7X3YSErjT1yLM6MEAm1XuQllcQMpNhmREpQhQ/HPIvCFGzBqDZlwtn29czCfyd6xTTHXIOaD4cHQrQ2vd88C9JdnCSggReHWkTJS0EF5KaoQw/ZFDVls7cQpFL4Q5QVJ8dlMApxgYWdnbq9eSDmQ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772198614; c=relaxed/simple;
	bh=DVrZa0opFACOmunPNX4g6dx/xvzbq4g8Ca2Z3xTFR0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LumuNEJtKu3c0/pTreD7pNRbwaqYHdlrSQuN7qJREYBlXt67h2/yZ+/yQoQx7VX9YoNb0ngDsmV8lKqaTlnuSPA1zBxqdUFw4YId3H27tOY/b3+wFkJYhQqO78MY9iT8heNv0Rvce8jn8TE4Xf+P9/opFtXb2lCODJxdXqdXFJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzPAG66Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F08C116C6;
	Fri, 27 Feb 2026 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772198614;
	bh=DVrZa0opFACOmunPNX4g6dx/xvzbq4g8Ca2Z3xTFR0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VzPAG66Yq1LbChnheWalbgxhOhB2UyDr91D0n07b9ONxD2FRP83YtjXiyOJSCUjoQ
	 z6THRn9HOSPfUmJL50h5oZWcDGSMsVYkhDpuYw5f5OoH9nUBbQ26ViRJriYWa1nDNl
	 LOLQTj9GO7fU6h4gSTxtpmVrSDGxxxwYmOVOg64YiyZJF6/QVDlfvIrIUzDxOsc9UO
	 1QrCsl/Nw/7OhTUnkIcLx92ZvAkn159yrtFx2Sh8CInV7LYXoApmC6CFTE3vZXCshU
	 kUQQMo4tItRZVDObIp4SV9DuVA23SOifYSkP0b84RKR+6St8MY3x1nwQFF61Y+cU4N
	 ARGN/6wMZY7yg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 27 Feb 2026 14:15:45 +0100
Subject: [PATCH v2 6/9] mm: cma: Export cma_get_name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-dma-buf-heaps-as-modules-v2-6-454aee7e06cc@kernel.org>
References: <20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org>
In-Reply-To: <20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, linux-mm@kvack.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=mripard@kernel.org;
 h=from:subject:message-id; bh=DVrZa0opFACOmunPNX4g6dx/xvzbq4g8Ca2Z3xTFR0o=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLZ+1yVxR4r8SsqfG4YUbymZtxh5QTV5x3FZ5eq2ZdN
 f3spD9cHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAit9cxNhz99LzjYaOKvtgn
 BfFNfaG/c/jiF8RMjZm0aoP+jrdPo/xu/9/+5un+I8yPNUw9DA4aMjI2vKzz6js8Z9JFB4ksrin
 fJ1neaHy1ZalfqKXhk42yS4qCg2Lm3RPPOvSgeOn+qZ5ZWpaeAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53712-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B3F31B79B1
X-Rspamd-Action: no action

The CMA dma-buf heap uses the cma_get_name() function to get the name of
the heap instance it's going to create.

However, this function is not exported. Since we want to turn the CMA
heap into a module, let's export it.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 mm/cma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/cma.c b/mm/cma.c
index be142b473f3bd41b9c7d8ba4397f018f6993d962..550effb9c4e01cc488b5744fe61d55a5b70a6d6c 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -50,10 +50,11 @@ unsigned long cma_get_size(const struct cma *cma)
 
 const char *cma_get_name(const struct cma *cma)
 {
 	return cma->name;
 }
+EXPORT_SYMBOL_GPL(cma_get_name);
 
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
 {
 	if (align_order <= cma->order_per_bit)

-- 
2.53.0


