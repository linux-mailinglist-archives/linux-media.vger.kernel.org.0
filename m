Return-Path: <linux-media+bounces-64594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uAhiFiC4Kmr5vgMAu9opvQ
	(envelope-from <linux-media+bounces-64594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 15:29:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 967C2672566
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 15:29:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=e7juqfne;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64594-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64594-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E928530A1B0B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 13:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F4640960C;
	Thu, 11 Jun 2026 13:28:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B540801D
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 13:28:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184530; cv=none; b=BxUy5A7UrtYcWjPhJhEFBn+JQZlLy9tOa/Gc39ASROAO3bn9MoH2SSQZKWPMVpDGoMPXhdj4toTzOQzNJnFWziiOi+MDBw9O9b8npWd4tIE85lhs/5rpcwSRGrDIPZyp4D0HjlMAbshJ1RKEOESE1p3oot3IkJrwPVdKkwjhK1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184530; c=relaxed/simple;
	bh=crKmGM2BPtU1gWofMArc5RSNIxo8syCXCMCQHJjzvSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NoHbhtFRToTenHsWhnl0eevkbaQxKuOsnTuIcCgGcsDy/DwuGYk71wlX6qEQpkyrifZcTTIUovhhb7CTSlU3MmtKuxJFcNywdT+fAP0rMoYxF0XCWzESykk1jelmADAi3e87NAioJcmNdf08JEyRsSgnmOKIrEj0+QjZg8Gfggg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7juqfne; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so67622205ad.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 06:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781184528; x=1781789328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kr6lr/Zk4qDdZQL9yjJdI0zh4QdrOtRvdN1aN8UPXKU=;
        b=e7juqfne4BEQWFb7uAsbNpZ6bBRPG3XKGRIkDFcLIKc8iHJxeg9PA4FwMuKx7izMrC
         zvcAYxmIVlTvSVBp+TMJHP0r1EQvwEbLGK1fGIJ+6nyoZvSRfLUe1zf5TI8PldPbCOr+
         ExKcFbrPiAyvvEReMVudx9VRa36T2oNDa4o4DPEoXd+cy+n4LSq6ciplza6ioTStRog5
         CwEA07jb4eRKzZ2RQU/QQ1bYgjYeve4XXm+ZtkLjWDdzygl5E8vZhMSF7XVlOeJPpmcQ
         13yn1ybBiP5X0e0jfSA0u4mDoweAI90lqnk/Xl4BwjhN5Oif7gfuybYKUrNhIT7cAMPW
         yw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781184528; x=1781789328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr6lr/Zk4qDdZQL9yjJdI0zh4QdrOtRvdN1aN8UPXKU=;
        b=QdtqJ2h3aigEZom2bABfpT0ppxvMuDIfCnYXN4S+y1Ff4VG+LIJl6rk/KxdtMKC1wo
         Hp5WtakbrNhXS0dR3rqwZ2JYAH/ZNPuhI/o+YUW6bwtpApM9arjOJUXDrPMXaat5Ov3r
         sMOJB8zsZ1MXHekFQ6ZJr1iFsJ5aYknHpgVrjJEqXQGV9P03pda/A0WUJ3Fux68hnZ1p
         7t1ijyGajjmjiaeRmkIcGSih+GLzYhdI9pxfINmuXCbKyguR0VtIU9msO1/q/7C/Iaxk
         RmJ57O5Jbv1STe5JWrE1CEf5FZBubB2J2A6edlS+LRN3USnCnVu0bE4vB6BFoC0Qk/4T
         XjwA==
X-Gm-Message-State: AOJu0Yz+qzRj6W5aw/hxOdEJa1iR3qDX4T7gaPJCcBvlvQoL86EOwHfo
	0+fIAnGuT8ms7Fp+PYwWXC9C1Jvkp8wl9EZ8uT9PYA40bn38hZg+GC2H
X-Gm-Gg: Acq92OFaRuNs8rio2W/kdtyMYNIKwNK/p29NJ+TF2CiorQGMZqIUo4eoBsCWSWVk3x4
	OWN1tszCEjV8UXXc52WZfwkjwPZQeMYRnhL0gjlOFaCjnYQkLwMY4Y5fWkufJBdstpwhtcFYRLX
	0T86c96eml91ADFr9O+lXO7jWLl6Esh18KCkFMgsV8zZf95LQIZoqL0wNADHWqmSCK1D3F4rP2+
	hTuzN72L/rHL9fdp6XMaM26CQfk4gHR8yKzLt7KTYi3zLevq8nkD4JCIXop2gGwRQEAQfg3oDij
	E/Px3gD6m2x2Ju8HSGPoqNXFzMNlHr7P3GNa4KBugu1YTR6AMD4118gAeFTVeoCNp8zAWu+f7s1
	XtqnsoB5Gzfhz1FFKGKLaDPt3Bmgc3QL06xGdueRGgqCjQKmT+Sr9DgQk7v4mPzt6dYkPS/UpN0
	ikmVMPwh0EFiiR26cm6OeBpQ+Y/kNfozV2jJ8vJ4ezoK+2dsUDsR16Hanmyg+CzCpD6uQr1RlTD
	/27LP/KehvRbl+2bjEz0KTQPz3E9AQ8YgN47/Fhng9FTfvWkz/RPeKKnk+CD1jSPtZrwslSR3Nd
	Ar4W/3upQ8wu6G25iriwH4eitMZDmFJQGhLR93X05/WJQM6B
X-Received: by 2002:a17:903:90c:b0:2bf:dd8b:7cd with SMTP id d9443c01a7336-2c2f10165e3mr31858515ad.10.1781184528412;
        Thu, 11 Jun 2026 06:28:48 -0700 (PDT)
Received: from jfk-HP-EliteBook-640-14-inch-G10-Notebook-PC.cse.unsw.EDU.AU (dyn-dhcp-226.cse.unsw.EDU.AU. [129.94.175.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cfb4sm292927115ad.59.2026.06.11.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:28:47 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] media: cec: stm32: prevent out-of-bounds write on RX overflow
Date: Thu, 11 Jun 2026 23:22:48 +1000
Message-ID: <20260611132248.114519-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64594-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:geoffreyhe2@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geoffreyhe2@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geoffreyhe2@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 967C2672566

stm32_rx_done() appends each received CEC byte to rx_msg.msg[] using
rx_msg.len as the write index, incrementing it on every RXBR
(receive-byte-ready) interrupt without checking it against the buffer
size:

	cec->rx_msg.msg[cec->rx_msg.len++] = val & 0xFF;

rx_msg.msg[] is a fixed CEC_MAX_MSG_SIZE (16) byte array in struct
cec_msg, and rx_msg.len is only reset on RXACKE/RXOVR or after a
completed message (RXEND). The number of bytes received before RXEND is
decided by the remote CEC device (it sets EOM), not by the driver. A
peer that keeps sending bytes without ending the message drives RXBR
repeatedly, pushing rx_msg.len past 16 and writing peer-controlled bytes
out of bounds into the surrounding memory. This is reachable in normal
operation once the driver has probed and receiving is enabled, from the
IRQ thread, without any local privilege.

The length check in the CEC core runs on the consumer side, after the
byte has been stored, so it does not prevent the overflow. Bound the
index in the driver before the store, as the other platform CEC drivers
already do (e.g. tegra_cec), dropping the excess bytes of an overlong
frame.

Found by static analysis tool CodeQL.

Fixes: d69ae57453c8 ("[media] cec: add STM32 cec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/media/cec/platform/stm32/stm32-cec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index 1ec0cece0a5b7..8c2fc232202de 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -132,7 +132,8 @@ static void stm32_rx_done(struct stm32_cec *cec, u32 status)
 		u32 val;
 
 		regmap_read(cec->regmap, CEC_RXDR, &val);
-		cec->rx_msg.msg[cec->rx_msg.len++] = val & 0xFF;
+		if (cec->rx_msg.len < CEC_MAX_MSG_SIZE)
+			cec->rx_msg.msg[cec->rx_msg.len++] = val & 0xFF;
 	}
 
 	if (cec->irq_status & RXEND) {

base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
-- 
2.43.0


