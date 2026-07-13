Return-Path: <linux-media+bounces-67520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qHewKFFZVWrgnAAAu9opvQ
	(envelope-from <linux-media+bounces-67520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:32:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ECC74F449
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=A3d1pQdm;
	dkim=pass header.d=mess.org header.s=2020 header.b=A3d1pQdm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67520-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67520-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C90330053E7
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08D735E1D9;
	Mon, 13 Jul 2026 21:31:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C243426B2CE;
	Mon, 13 Jul 2026 21:31:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978293; cv=none; b=nAWEAv8AYDGu7zMVeLFQFHYJLgJ4+TYjrkRMHKHMWcePe06XHtFiNzLvf1nuIalKBj4T/enCC1ukpnLhZSk/Al/JmewWF44rHn5fiFLPplmUJcppwK3Veu8OS3GSJRXtKaJq2rYwCUQbWazTZAeLR/MQhPJeoLgzZ7MLk1hoXio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978293; c=relaxed/simple;
	bh=jom5Sfj2r2NA+T+rZSarTiq+DJb0dHfs+u328K9p5yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUDnJlAN0DY4djTutRGOyCNOkoELrSTrgBr9h3ccdke/XLsqCW43xIT9zIQaJ9EcKSChvzYNJZC0c0prKaHSsC414SHLsRcO6fTXMPahiBMkmIdYzqspFmr4e6z+fw4Gr1KFia6nlUOqFm1EgVdxSA1Fuxy7PdQupTh/MLObFqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=A3d1pQdm; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=A3d1pQdm; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978283; bh=jom5Sfj2r2NA+T+rZSarTiq+DJb0dHfs+u328K9p5yY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A3d1pQdmwAFZ2JdWYYWWLCYzmT3HomNMyxoiDR7Puk3FnFPbagIEDxRb7WzuIZ3uh
	 TCtTaeGi7LhGjTYUjTNLQRk91CeDamR6rYDffO3DvHZh0ErnydiQf5lMGO9RopLHYq
	 v+1iib0+fKG+8xD8Q/neEOklIzk6UmUAO4TLQ/g/J2o0sG6gisa4yowmvntv53eNqr
	 x8McQJYGYxjUDmQS15JNgLKQBWUAbobEks/iFWUDc55KWrT5C+lpvSZEMfBAb537CN
	 UXy5+6GT983SfatZnJJgwsBFttabTMe/F9gYUCGIt5bbmKtKtQE58VXYQr4KGsh8EL
	 Qd8UcssY0uxNw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id A9B8040A4B; Mon, 13 Jul 2026 22:31:23 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978283; bh=jom5Sfj2r2NA+T+rZSarTiq+DJb0dHfs+u328K9p5yY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A3d1pQdmwAFZ2JdWYYWWLCYzmT3HomNMyxoiDR7Puk3FnFPbagIEDxRb7WzuIZ3uh
	 TCtTaeGi7LhGjTYUjTNLQRk91CeDamR6rYDffO3DvHZh0ErnydiQf5lMGO9RopLHYq
	 v+1iib0+fKG+8xD8Q/neEOklIzk6UmUAO4TLQ/g/J2o0sG6gisa4yowmvntv53eNqr
	 x8McQJYGYxjUDmQS15JNgLKQBWUAbobEks/iFWUDc55KWrT5C+lpvSZEMfBAb537CN
	 UXy5+6GT983SfatZnJJgwsBFttabTMe/F9gYUCGIt5bbmKtKtQE58VXYQr4KGsh8EL
	 Qd8UcssY0uxNw==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 64A2340A3B;
	Mon, 13 Jul 2026 22:31:23 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] media: redrat3: Error path leaves device in transmitting state
Date: Mon, 13 Jul 2026 22:30:59 +0100
Message-ID: <d8be8047def26d35726666fee2f3ca309da200ef.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67520-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mess.org:from_mime,mess.org:mid,mess.org:email,mess.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11ECC74F449

If the allocation fails, transmitting is left as true and the transmitter
cannot be used any more.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 468907d6c3a8..b64c6440b062 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -781,9 +781,6 @@ static int redrat3_transmit_ir(struct rc_dev *rcdev, unsigned *txbuf,
 	if (count > RR3_MAX_SIG_SIZE - RR3_TX_TRAILER_LEN)
 		return -EINVAL;
 
-	/* rr3 will disable rc detector on transmit */
-	rr3->transmitting = true;
-
 	sample_lens = kzalloc_objs(*sample_lens, RR3_DRIVER_MAXLENS);
 	if (!sample_lens)
 		return -ENOMEM;
@@ -794,6 +791,9 @@ static int redrat3_transmit_ir(struct rc_dev *rcdev, unsigned *txbuf,
 		goto out;
 	}
 
+	/* rr3 will disable rc detector on transmit */
+	rr3->transmitting = true;
+
 	for (i = 0; i < count; i++) {
 		cur_sample_len = redrat3_us_to_len(txbuf[i]);
 		if (cur_sample_len > 0xffff) {
-- 
2.55.0


