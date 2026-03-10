Return-Path: <linux-media+bounces-55066-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJqoLP/br2kzdAIAu9opvQ
	(envelope-from <linux-media+bounces-55066-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:53:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7C4247AC6
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24962303F567
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0585143901B;
	Tue, 10 Mar 2026 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsB3nyr9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAAC238C0A
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132796; cv=none; b=Wg+qLaTeHnLSSSWzxj9Cw6LOSta4uzhZQS+/Wlmg0DCZwYgYYmtRhSpQCCuwJFxaMeEKWnzEU39a9tVbWTiQx9nVANwo5oPPP0MtlmyV5Nsqe6d/Fy6fTdo4h0XufEdA1DD3h0S4MhPDEes432QWokpIFy0/d3on6TgbTzLmtN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132796; c=relaxed/simple;
	bh=pwuUPVWLWGHgGRSRKZmh3n+gi0RBXfZl2/eGNbUr12k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fcjhIrukahQgqyTD7TT6Vikerk2n/lGZxrIUs2eiv38L9gPBA6jiKChr3yqOvciVxLCf+fzJSUaoyMXnDlRERYsoNTTy5VMFfRmIHWOGvucqPwUQSGkMwrBOwF7dc+GEWhoyrNEE1YYxXALwgJM1KTM6Nn1lOFBg4YzNWWbdjOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsB3nyr9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39112C19423;
	Tue, 10 Mar 2026 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773132796;
	bh=pwuUPVWLWGHgGRSRKZmh3n+gi0RBXfZl2/eGNbUr12k=;
	h=From:Subject:Date:To:Cc:From;
	b=HsB3nyr9Dh30UV9HshMqIwqkc2xVMC0pRI0LPWSc297yibRFLkjnHIZDGuR2u7nr1
	 xgDXbY+fvarSZIKRVLDX2+aZ2+3KlmfjyPhGyYl1m0QnKnPerpht1+pMO260PzALDt
	 6e3oaYU0Xb2YAHjSctUiM9R55EUWkvF2h00ftMQW1seEuBqe0y6WOTAmnXGoY+xsv4
	 fslP79k5//sVWGM0iUmaTtEY7ZjWdEsuiK1garWsVfw74rucGjmicgRT2KBBSvbYDw
	 pcKzU2++eqk0EaS7dTVnePteyo36lvbEOaCbIXe3c8+WSsfQmMK6HAybwjktF2q5Jx
	 g7GnkPo9LTl7Q==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/2] dma-buf: heaps: Use page clearing helpers
Date: Tue, 10 Mar 2026 09:53:10 +0100
Message-Id: <20260310-cma-heap-clear-pages-v2-0-ecbbed3d7e6d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQqDMBBFryKz7pTERMWueo/iYkgmGmpVJkVax
 Ls3Fbrr8j3472+QWCInuBQbCK8xxXnKUJ4KcANNPWP0maFUZa2MMugehAPTgm5kElyo54SVVcG
 Qa0NjLOTpIhzi68jeusxDTM9Z3sfLqr/2F7T/g6tGjXUIVeup0bU31zvLxON5lh66fd8/3BOuU
 LkAAAA=
X-Change-ID: 20260303-cma-heap-clear-pages-540f3ac9f734
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 2C7C4247AC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55066-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Use clear_pages() and clear_highpage() properly in the
DMA heap allocator.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Added a second patch to use the clear_highpage() helper.
- Link to v1: https://lore.kernel.org/r/20260304-cma-heap-clear-pages-v1-1-6ff59da716d3@kernel.org

---
Linus Walleij (2):
      dma-buf: heaps: Clear CMA pages with clear_pages()
      dma-buf: heaps: Clear CMA highages using helper

 drivers/dma-buf/heaps/cma_heap.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260303-cma-heap-clear-pages-540f3ac9f734

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


