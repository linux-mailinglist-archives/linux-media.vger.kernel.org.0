Return-Path: <linux-media+bounces-59405-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lRiuCs4Z6mkOuQIAu9opvQ
	(envelope-from <linux-media+bounces-59405-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:08:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE84527E3
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68C1E302FA19
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2461C3EF0B7;
	Thu, 23 Apr 2026 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="sTUshxCq"
X-Original-To: linux-media@vger.kernel.org
Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ABE2FE071;
	Thu, 23 Apr 2026 13:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=143.89.41.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949545; cv=pass; b=ic2CWFct5kOK+iIQ5Fnn4Cl2wDG++vkekM3WtL2PEXKSW0zpXxFaed751ZN4nsTa7lP70NmR+K6smIrOpXKXRh7I1xB3qn1F6PEedxCOCBNc7Di7PI8kWRNSY7vFSH5rQYG2LYB5zZi73EFx9pBnQkCUe+uT2XU3j8SPq6t15dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949545; c=relaxed/simple;
	bh=aLzDxBb1J1gWYmaPqd8pBCtC0DmGkFT/mAGECcwRLb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPER7BkHcGH5dgycLkEnVGHo9Y9PY7xIv15KcasRSFGDzCTju4reZeeRDp5qWlMhzhyXTwjAnWhTN5cSvtm3Psk7vXz5FMflc0I1ECLgvFe/cnzVEjdsPgTPbdVnJb9UHKTBnD5sOBVHGmzY0Jh1Z/o4+QBGjUyCNKegU8WVZMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk; spf=pass smtp.mailfrom=cse.ust.hk; dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b=sTUshxCq; arc=pass smtp.client-ip=143.89.41.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.ust.hk
ARC-Seal: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256; cv=none; t=1776949519;
	b=LMcPONrgpJECosOkMw7E+UsKR5GGRd928yfu2S/2BSesSsYZKKIifN/g+De+M4kgGUYM
	 KTzSqW2AmUAEfGnmtdwAKK9cES2CW8BqxNu67tMf2cA4rKzIl34QBCaOc32nfE5OWzASs
	 1WGjHoefp60ujJ9v3rrL4gs2UNgRnSVlqE=
ARC-Message-Signature: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256;
	c=relaxed/relaxed; t=1776949519;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
	bh=23v1ze6rB99pn8LU/e64hJMDAMlTqYXwzfV9f6HbCdY=;
	b=PyW7woBqei60iw/6AavNOcBStpqqjVgN3+x106XGIvLE82FXet0guWo6UJNwZlbd0EWy
	 9oswytIBq0pGhb2hX6dqkDuKonTJ3lCWzSKXPghbwBbT0lni/qygjDSl4RTQygTC9dOxw
	 7M58pQ9vKH/9BJlMs8IFYUU+3tzNQkERWc=
ARC-Authentication-Results: i=1; cse.ust.hk; arc=none smtp.remote-ip=143.89.191.45
Received: from chcpu16 (191host045.mobilenet.cse.ust.hk [143.89.191.45])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 63ND2gN51722271
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 21:05:19 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1776949519;
	bh=23v1ze6rB99pn8LU/e64hJMDAMlTqYXwzfV9f6HbCdY=;
	h=Date:From:To:Cc:Subject:From;
	b=sTUshxCq/Uvbn7k9JrE5LPT64mopbJRjG+fZlGGTaEyUQnVZmx4nn2yr/ZePW+9/J
	 whjWxPjZDawfs7+XqKoX7zTnu70bcEpBPRVSpG20+ONyq3kSpGetSCXjnVYJlRBEI0
	 AqM6SBoSlRu2N+cgCFTTFhvW4CHjcW9xUEFN1S5w=
Date: Thu, 23 Apr 2026 21:02:37 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] media: tw686x: hold dev->lock during streamoff DMA disable
Message-ID: <20260423130237.GA1894228@chcpu16>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Env-From: sfual
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cse.ust.hk,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[cse.ust.hk:s=cseusthk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59405-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sfual@cse.ust.hk,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[cse.ust.hk:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cse.ust.hk:dkim]
X-Rspamd-Queue-Id: 88CE84527E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tw686x_dma_delay() consumes and clears dev->pending_dma_en /
dev->pending_dma_cmd under dev->lock before replaying that deferred DMA
image to the hardware registers. tw686x_disable_channel() updates the
same fields. Most call sites serialize tw686x_disable_channel() with
dev->lock, but tw686x_stop_streaming() is the exception: it checks
dev->pci_dev under dev->lock, drops the lock, and then calls
tw686x_disable_channel().

If dma_delay_timer fires in that window, the timer path can race the
streamoff disable path and consume stale or partially updated pending
DMA state. This can leave deferred DMA programming out of sync with the
requested stream stop, so STREAMOFF may not immediately reflect the
intended channel-disable state.

Fix with holding dev->lock across the stop-side pci_dev check and
tw686x_disable_channel() call, so VIDIOC_STREAMOFF follows the same
locking contract as the other channel enable/disable paths.

Fixes: 704a84ccdbf1 ("[media] media: Support Intersil/Techwell TW686x-based video capture cards")
Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
---
 drivers/media/pci/tw686x/tw686x-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 785dd797d921b5..19fb6196cf9c05 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -552,9 +552,9 @@ static void tw686x_stop_streaming(struct vb2_queue *vq)
 	/* Check device presence */
 	spin_lock_irqsave(&dev->lock, flags);
 	pci_dev = dev->pci_dev;
-	spin_unlock_irqrestore(&dev->lock, flags);
 	if (pci_dev)
 		tw686x_disable_channel(dev, vc->ch);
+	spin_unlock_irqrestore(&dev->lock, flags);
 
 	spin_lock_irqsave(&vc->qlock, flags);
 	tw686x_clear_queue(vc, VB2_BUF_STATE_ERROR);
-- 
2.43.0

