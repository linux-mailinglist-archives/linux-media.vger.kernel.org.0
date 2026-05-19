Return-Path: <linux-media+bounces-62096-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHrQOJQDDGojTwUAu9opvQ
	(envelope-from <linux-media+bounces-62096-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:30:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 594565781EE
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51CA2301681A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F333876D0;
	Tue, 19 May 2026 06:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CD2v9CJp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8FD27816C;
	Tue, 19 May 2026 06:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171879; cv=none; b=p+2JL/5aHaDspe4OQCSnnr8Q2j878mJQ3GR8nLj7Wdm9muKnXqlmYH5fui3Krj6EdzGD9b/IKatIfKiB/Luu0IuFcSVPJmLtOqZ5ym2tjE5Tn84OSgWo+zlh7uQrUc8PrUVq3ZTqJ+7cJNJSxotkEzEF9kUeRjoM/9wIPEfwgVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171879; c=relaxed/simple;
	bh=VcUrD//oUZnQvql1wMIPcTSBy0GWQBFqjz1wAD1jEJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/4g9aLQt4TYQPAt0F0OP1qGsiXVthpXGegIITM2P51in/+eP6SUDG4QtU3/Hhl+TPbFm299UbALMxxkfYlpMSBUGQ7CS3cRQl5esFjVr3W7S6YKe+h4EScVnp43raGWk003VuHVpRlCQ4LF/+Inliu8yQCe8AXAymO7DXfrAS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CD2v9CJp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A715C2BCB3;
	Tue, 19 May 2026 06:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171879;
	bh=VcUrD//oUZnQvql1wMIPcTSBy0GWQBFqjz1wAD1jEJo=;
	h=From:To:Cc:Subject:Date:From;
	b=CD2v9CJpTSarRp+GoMDt5TQdmsvn+jquUX8iP5O+RihoGx+qCzcVuYeeJEdNTZ3ty
	 W+0yvOKHtcYgzFZOJv/qT6OmNCusoneHcxOQyLx2ZAuLLNws9c3iynitrTAmIgNOwg
	 9i3rg7NUvdpiYmjXwTW33wFCPl74rCpt4xQEn2XaImN/pq14BeHagYSGR+RXjkO1Fc
	 IsO+8z0gfRUBD+oUYUX55L2+lcMwEal6SgQVY5XtKzEKNn1loAYz/I5NJHC9LehnBi
	 9NIdBlFvQEeQsVYEO3PB/ahPg43sJp/Q+a1+uLfSRmFUMAcBZ484IW9qG9uD4T2nOX
	 x1LZ4WKSgxkNg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: system_heap: Use LIST_HEAD() to initialize on stack list head
Date: Tue, 19 May 2026 14:05:32 +0800
Message-ID: <20260519060532.13221-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62096-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jszhang@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 594565781EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use LIST_HEAD to initialize on stack list head. No intentional
functional impact.

Change generated with below coccinelle script:

@@
identifier name;
@@
- struct list_head name;
+ LIST_HEAD(name);
... when != name
- INIT_LIST_HEAD(&name);

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/dma-buf/heaps/system_heap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 03c2b87cb111..6f8b7138ff56 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -409,7 +409,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	struct dma_buf *dmabuf;
 	struct sg_table *table;
 	struct scatterlist *sg;
-	struct list_head pages;
+	LIST_HEAD(pages);
 	struct page *page, *tmp_page;
 	int i, ret = -ENOMEM;
 
@@ -423,7 +423,6 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	buffer->len = len;
 	buffer->cc_shared = cc_shared;
 
-	INIT_LIST_HEAD(&pages);
 	i = 0;
 	while (size_remaining > 0) {
 		/*
-- 
2.53.0


