Return-Path: <linux-media+bounces-59664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MwlCAg172kw+AAAu9opvQ
	(envelope-from <linux-media+bounces-59664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:06:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D282470867
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6667F301D338
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 10:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BA73B4EB4;
	Mon, 27 Apr 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYDX8QIv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE503B47CF;
	Mon, 27 Apr 2026 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284317; cv=none; b=L4wYayw7rNSsSJU9WtONtyTojJjTaWOAJdNAqBwQay0V0mzKZ65YITxkkaknBSS2zKzJxetsP3a2kBR+EiBguZt9SkiqitbyBJtZPG3hhpm1H2lDeBX+jk9P7cqW1kxDAlPm3V7YCPIBCl6MLbMUsVSoGOzeQMRyYT08rbji4bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284317; c=relaxed/simple;
	bh=DgPZwjzTFCrRVafEvDDt8RvwW+K7/Y0nWv4ZA667X40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dWgaXgs6oRJOfee2E6YuHg5Ahkh66jTC45ZciRzcb793o8thxaOPRG0YTN4w0mvj2qajWS38RN+QO4jM2+/L/mGx4HgtM/YnqU/M/M5pMV8nDAk7cPK/z/ZV03U518T6lyHcHek1r3wsMoD3j3ECWYUdAzlk472Oh/Dmvgl8zwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYDX8QIv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2E4C2BCB8;
	Mon, 27 Apr 2026 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777284317;
	bh=DgPZwjzTFCrRVafEvDDt8RvwW+K7/Y0nWv4ZA667X40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XYDX8QIv5rn6XF6AN3mOs8DUJBbHzQ4lcb6GLGW4Ex+wswcwryiFJRPGWOGkSiFDA
	 N5qaLLQldCWzxADjPFUxa3SX2HHiz5Vj9Sd0E4qZPKnU3/yBKYKYnSNxE0SeGoG6T+
	 sSA8STxJC9vlPYvlIyobICgLPT5lctMnflKiPBQXRmPrkMGTw7K1/2O84alAAG+Ugz
	 wSYmwb9ud5CQEbiztSggvtcdkopqBZ9w4O+Ht+1UQPvl7riDL4puO6W6u3gG2rWpjY
	 SOA3v+eY2hdrTOgCxtpyj3EJvVo8juB9D5ZAO4TxbA5EEVfI3nAQAnKMQTTX1U3Pfi
	 tiqXc9mMgbRUQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 Apr 2026 12:04:58 +0200
Subject: [PATCH v5 2/4] dma-buf: heaps: cma: Turn the heap into a module
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-dma-buf-heaps-as-modules-v5-2-b6f5678feefc@kernel.org>
References: <20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org>
In-Reply-To: <20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748; i=mripard@kernel.org;
 h=from:subject:message-id; bh=DgPZwjzTFCrRVafEvDDt8RvwW+K7/Y0nWv4ZA667X40=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnvTS7H/mDasOzXil2rF2y4GBjeWc2Xfag1r22CsoURM
 9P/7NwbHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAie30Z6+zcFMpK9LdFno2d
 KrJ3quyj8u91q/tDKuYwnq5Y6Mux+ew22dTMJweUVrH0Xqk1/1UpxFgfmnwu7ZC91dyFuZk85xo
 5Lwdej35VIPdbv0ug+uvy/l+/LF7vW16tpSbieNL72oxrCoIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: 9D282470867
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59664-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

All the symbols used by the CMA heap are already exported, so turning it
into a module is straightforward. We only need to add the usual MODULE_*
macros, import the proper namespaces and change the Kconfig symbol to a
tristate.

This heap won't be able to unload though, since we're missing a lot of
infrastructure to make it safe.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/Kconfig    | 2 +-
 drivers/dma-buf/heaps/cma_heap.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..aed0b9b4febf 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -4,11 +4,11 @@ config DMABUF_HEAPS_SYSTEM
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
 
 config DMABUF_HEAPS_CMA
-	bool "DMA-BUF CMA Heap"
+	tristate "DMA-BUF CMA Heap"
 	depends on DMABUF_HEAPS && DMA_CMA
 	help
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index a359aac45579..3fb4b946c91a 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -418,5 +418,8 @@ static int __init add_cma_heaps(void)
 
 	return 0;
 }
 module_init(add_cma_heaps);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DMA_BUF");
+MODULE_IMPORT_NS("DMA_BUF_HEAP");

-- 
2.53.0


