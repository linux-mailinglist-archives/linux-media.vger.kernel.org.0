Return-Path: <linux-media+bounces-56690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN+NBiQWwWn5QQQAu9opvQ
	(envelope-from <linux-media+bounces-56690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:29:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 775AE2F0113
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71B8730089AD
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853C738BF75;
	Mon, 23 Mar 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b="XysKIAOS";
	dkim=permerror (0-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b="hwnjyxiz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx2.cyberprotect.ru (mx2.cyberprotect.ru [176.10.93.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91973890ED;
	Mon, 23 Mar 2026 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.10.93.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261789; cv=none; b=F1+hPl2uYFhTlZRJdvrnZPuXDuWEoKOASm+LwZR0mBVi7ecu34+BH9oII0BIuadZcfT6WxH3rSEwXNhRD7rdnvanxjqn/vw5NsNBblpJMW/gNLfL2teIFZmg1VmhA6GcA2Bwe9/WqlyqFtwDt2pNqZi5fPx+dMg34K37p4eO9J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261789; c=relaxed/simple;
	bh=vChF+djsY2Mkl4Z6W6c2JK5OAK/+jIxyhxkcM40E4nU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sO5bXvBrCVm44FpINs9fjpw4GDOFs5z96gJGp7ZQRZoflahkG1Fx5PZZ7wO+syYHVO5zPX/YiRxd//sKYl59OjHCpZPhpaUJCNNtsU72QoaEblQZHX5SuHNXY91A40Mg/i/iVcjDYfP8vsD55LDUFiAwlA34bZpmCdL3YrsLx3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru; spf=pass smtp.mailfrom=cyberprotect.ru; dkim=pass (2048-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b=XysKIAOS; dkim=permerror (0-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b=hwnjyxiz; arc=none smtp.client-ip=176.10.93.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberprotect.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=QcbI5Xku4fL4lXhZomurIoI8W7kAjTeXntNYDbnIz3I=; b=XysKIAOSOYPk5gW7S0b71zF9Li
	UByknk+MwzDidsKgKUgVxA3JtDO2fBHf/1uEvLnICjA6i+ifY9MlU47AXbt9oA9PLV8L77YaEcL3/
	cLGx5mdMwM1HN3MmdsZfOrE/BfGXAGqtAp5QCdYe7pK0YCQmb6otNSrIIymWyfiLoWgT0JxgTe/C4
	75fUKfYdE7M1uzLCLgU7fUlGu4mZUV66LXvMZ944bNowQnrFt7wwsKM1Yrsq17INlQ/2OiFiF81pX
	h3sGGKgdNoysm7Bwtl4z1fZy3HH5MK9lrhmAA7hCfkJavNHPnfOI45vAyA0a/Ns5krm0k/YrBvlyd
	H14MhkWA==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=QcbI5Xku4fL4lXhZomurIoI8W7kAjTeXntNYDbnIz3I=; b=hwnjyxiz9371raxn6PLZzNScaW
	AJSuZZfz5912EOXjePSXht8dny98iLOVnDqC4rg3XOt80OYc81DTJ0c6/2Cg==;
From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Andrew Morton <akpm@osdl.org>, Andreas Oberritter
	<obi@linuxtv.org>, Johannes Stezenbach <js@linuxtv.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] media: pluto2: fix potential buffer overflow in pluto_dma_end()
Date: Mon, 23 Mar 2026 13:29:20 +0300
Message-ID: <20260323102920.19937-1-Dmitry.Chumachenko@cyberprotect.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AIP-EXCH-1.aip.ooo (10.77.28.101) To AIP-EXCH-2.aip.ooo
 (10.77.28.102)
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cyberprotect.ru,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[cyberprotect.ru:s=dkim-r,cyberprotect.ru:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56690-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[cyberprotect.ru:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Dmitry.Chumachenko@cyberprotect.ru,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxtesting.org:url]
X-Rspamd-Queue-Id: 775AE2F0113
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The while loop in pluto_dma_end() scans the DMA buffer for MPEG-TS sync 
bytes (0x47) at 188-byte intervals. However, it does not check the buffer 
boundary. If the buffer contains 0x47 at every 188-byte offset, the loop 
index will exceed the buffer size, causing an out-of-bounds read.

Add a check to ensure the index stays within TS_DMA_BYTES.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: c7cadb3a02b5 ("[PATCH] dvb: add Pluto2 driver")
Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
---
 drivers/media/pci/pluto2/pluto2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/pluto2/pluto2.c b/drivers/media/pci/pluto2/pluto2.c
index 6ac9b9bd7435..fd7f8d8b85a8 100644
--- a/drivers/media/pci/pluto2/pluto2.c
+++ b/drivers/media/pci/pluto2/pluto2.c
@@ -291,7 +291,7 @@ static void pluto_dma_end(struct pluto *pluto, unsigned int nbpackets)
 	 */
 	if ((nbpackets == 0) || (nbpackets > TS_DMA_PACKETS)) {
 		unsigned int i = 0;
-		while (pluto->dma_buf[i] == 0x47)
+		while (i < TS_DMA_BYTES && pluto->dma_buf[i] == 0x47)
 			i += 188;
 		nbpackets = i / 188;
 		if (i == 0) {
-- 
2.49.0


