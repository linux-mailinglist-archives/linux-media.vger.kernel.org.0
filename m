Return-Path: <linux-media+bounces-54416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHbhBS58p2kshwAAu9opvQ
	(envelope-from <linux-media+bounces-54416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 01:26:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8089A1F8E6C
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 01:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 518EB301AAB9
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 00:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBB02E8DEB;
	Wed,  4 Mar 2026 00:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaeP7KnT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0130029E0FD
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 00:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772583910; cv=none; b=QOfyZHfYASwAdb/ObnBiP3XsprgcB7MVN0w4+ISJGcACfJZCZXY3uqjywT8ncH7T6EeT8kUXA0QuLArK7aSmhBf/i+u5CfCoUuq4Kl4opXvZM2T+EtQTqNG8Qs8GiKVg9cuIMshAAfZGZxNERJr9SkttlDKZfHr91PJyTAY0NLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772583910; c=relaxed/simple;
	bh=HeaohDIlgya71qEyi4Ax5lfXmfxcDbpMvfs/QKVJz1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pvJ6cxDI7xyJR0Rd1vyHEAfHiW038+ygstZsQn30qC3zcsMtXNUM5GB/5O3ZDvRf5IuZwEIjNh1JLzLsblnD0DB4Ys7WMwdC5EN8H1094GbviaYI9wf6paloBULr0vWxvoUd+BnS5gtWQLKBFuvf88/h6tD5DPKSD9ct9Vcf6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaeP7KnT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056CDC116C6;
	Wed,  4 Mar 2026 00:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772583909;
	bh=HeaohDIlgya71qEyi4Ax5lfXmfxcDbpMvfs/QKVJz1A=;
	h=From:Date:Subject:To:Cc:From;
	b=oaeP7KnTXcb8bhjfsex4+qPuAx+uX8yt3/u3rqEsDjTZNM8jWPKmjPxV6ihXBnBlz
	 gvKSYnpbKJowxWM/2Y6l8YptsLXCsrxiiOScVJeOIhMpIVumwOl4xjX6Ikrlu2QnGO
	 fbkwuroENvTFHY4lMGvd3HQONo+v0/mmkzaGrT95vb7Bg/CaCkYZRVblazc1zFjXxQ
	 YbeRSF8D28zsPmtS+9KdCtCjcsgcLCY6fwOihXqMIVr66EBhI6d+bhoqw/3EwH7Q2D
	 +AY4qpGsXQ5NrsHGe/bZbFZxIZ+6F/WF2/XtdP6JP4kAt9heEIvBNtSMVeqQ/0NpPu
	 yX87OwUL10kPQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Mar 2026 01:25:05 +0100
Subject: [PATCH] dma-buf: heaps: Clear CMA pages with clear_pages()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cma-heap-clear-pages-v1-1-6ff59da716d3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqAIBBA0V+JWTdg2YP6lWgx2JgDPUQhAvHfk
 5ZncW+CyEE4wlwlCPxIlPsqaOoKjKNrZ5StGFrVDkorjeYkdEwezcEU0NPOEftOWU1msqPuoKQ
 +sJX33y5rzh8T92GNZgAAAA==
X-Change-ID: 20260303-cma-heap-clear-pages-540f3ac9f734
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 8089A1F8E6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-54416-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

As of commit 62a9f5a85b98
"mm: introduce clear_pages() and clear_user_pages()" we can
clear a range of pages with a potentially assembly-optimized
call.

Instead of using a memset, use this helper to clear the whole
range of pages from the CMA allocation.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index bd3370b9a3f6..f0bacf25ed9d 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -343,7 +343,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 			nr_clear_pages--;
 		}
 	} else {
-		memset(page_address(cma_pages), 0, size);
+		clear_pages(page_address(cma_pages), pagecount);
 	}
 
 	buffer->pages = kmalloc_objs(*buffer->pages, pagecount);

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260303-cma-heap-clear-pages-540f3ac9f734

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


