Return-Path: <linux-media+bounces-61856-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCpBMLz5CWrivgQAu9opvQ
	(envelope-from <linux-media+bounces-61856-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:24:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB9A5627DB
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9115C3004586
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 17:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5389B3BB661;
	Sun, 17 May 2026 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C0Jkif0W"
X-Original-To: linux-media@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4869A3C4B63
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038649; cv=none; b=C9zHR3cc2hSm6HkcacUGlCnsxVk+k8ZbgsZzWp59AkgjVY9Qag6aVk7kHW7ASTvwD6YhFqnSIF931vo8AJzKdG9NOe+Ld8QwKbRR1fsqAK3+Mjcq0iyj/oiYW6E9u4H0xOUQT3W1HdGpcVodOlKEfKNwNDuK8nrChQu1AlbFmTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038649; c=relaxed/simple;
	bh=2Qy1bhZE4ZUxVczuVFGuB6tJXixNg2z/25mUfsiG6bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CLZQvFXDsWK4+nXpRur/eHeKEBUJGH5B1t/p29u4tBOrIyXs8G/VqIHWkln4BYS5EleiJ0091PKv8+PmfcMLyVtVHB3o0pdzDqBa9i70BaHJmXYOkLX02poQ81H4LLXFHMBnbbJC6ARnOd6WUtDIfq48ZiudatVS1XiroBy+E3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C0Jkif0W; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779038645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hueLhtL3zsdmdXnMtuPrauJ8fkjBDESO/03aEH4/H2E=;
	b=C0Jkif0WiffvNY1BfsznBsr9/Y/cagb1baZyUmCRRG+gY5j7nDRJdQ7djJktZoFUtCItnD
	kCRU3w5AxOEEqgzpcZOpFnKDCpkic3dHBIl9LiImC/iipMlJY/sPVxy2us+CHCeckgtdYV
	hZj8+rL8KwTOEqEPDfXoJXWIu5GgUe8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2] dma-buf: heaps: use max3 in dma_heap_ioctl
Date: Sun, 17 May 2026 19:23:53 +0200
Message-ID: <20260517172352.3615-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=thorsten.blum@linux.dev; h=from:subject; bh=2Qy1bhZE4ZUxVczuVFGuB6tJXixNg2z/25mUfsiG6bg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmcP1f4TOnRZosXO71QYZ/h1sf+CvOZt2/JPL1xhs+GC 7uC8p0fd5SyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEMl8w/E9NZXQWOpjX9cFP f9vU6zOv1X+PfHhp+uVIM635Py32vT3CyPDq+bI7L7+o7Dk7r8LjhUit7tp7R1sErpt88eeW0la YXcsFAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 1BB9A5627DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61856-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Action: no action

Replace two nested max() calls with a single max3() in dma_heap_ioctl().

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Include minmax.h as suggested by T.J. Mercier
- v1: https://lore.kernel.org/lkml/20260427172519.417333-3-thorsten.blum@linux.dev/
---
 drivers/dma-buf/dma-heap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index ac5f8685a649..d49188893608 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/list.h>
+#include <linux/minmax.h>
 #include <linux/nospec.h>
 #include <linux/syscalls.h>
 #include <linux/uaccess.h>
@@ -153,7 +154,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		in_size = 0;
 	if ((ucmd & kcmd & IOC_OUT) == 0)
 		out_size = 0;
-	ksize = max(max(in_size, out_size), drv_size);
+	ksize = max3(in_size, out_size, drv_size);
 
 	/* If necessary, allocate buffer for ioctl argument */
 	if (ksize > sizeof(stack_kdata)) {

