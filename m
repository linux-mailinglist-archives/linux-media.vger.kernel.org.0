Return-Path: <linux-media+bounces-66633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y79XAEFuSmr1CwEAu9opvQ
	(envelope-from <linux-media+bounces-66633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 16:46:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F16970A60C
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 16:46:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mapicom.org header.s=dkim header.b=XO56a9KI;
	dmarc=pass (policy=quarantine) header.from=mapicom.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66633-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66633-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A47C23009394
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 14:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E98F380FC1;
	Sun,  5 Jul 2026 14:46:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out7.jino.ru (smtp-out7.jino.ru [81.177.141.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A7347C6;
	Sun,  5 Jul 2026 14:46:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783262777; cv=none; b=HCZkqeB7zmR79z2d+qjCojqlsvUi5gQmirMch26JaN20px+a1qiHGdTfw0y/Pwmh11o92hGsG2S07LSrYAjBKkrkWFCtFsOI0wOoox765bhKw+SljULkqTeEKx/OpdBbvLq2hTtvc2uvuaGzppMqGIfH5kzjCPZ069GhfLHsnTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783262777; c=relaxed/simple;
	bh=ECZC4rfEZ+cnW7kdNaHgHapogWDpTvgE7RpQqcRktyI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sy2zc/8ZR4sRPMvi01WjqcgBnKgSLnLLidt/L2R20SkWGYmLh5tTN4TLOTEQRLr+8otcnXyrcGDeeUlHMosoL67eJuGnaxKtw1GYBKqMO8yP/Dzarfo+UKQKnLyQWt3HLjPugri6WADpxSNx1JwAb/iJtXluCMIIeh0V2KyabU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mapicom.org; spf=pass smtp.mailfrom=mapicom.org; dkim=pass (2048-bit key) header.d=mapicom.org header.i=@mapicom.org header.b=XO56a9KI; arc=none smtp.client-ip=81.177.141.182
Received: from kirokota-srv.lan (unknown [91.204.186.31])
	(Authenticated sender: pinigin@mapicom.org)
	by smtp-out7.jino.ru (Postfix) with ESMTPSA id 28BBB3784C54;
	Sun,  5 Jul 2026 17:46:11 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mapicom.org; s=dkim;
	t=1783262772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jyJqke+OJg3gQ8grppUr2wpoupU6svpv5JErbr3g2tM=;
	b=XO56a9KIpLNT6y+DoGhz3FEHjLm70MTQsf48I681f1hUcVAvLHL2ZWLRITE+d+fYeCmVnc
	b96UeUtE/jZo4+LeYiGvWt/PAcEbSd6DrVVDP69etFJd1j673zENv1Ry4oqTOziDEAodsM
	f02YMw2RusmosP1oBfxwqqgZR61G2VBcS8ZK7bWu0r7qNawhxd1raGdY55kxdjMj+mtQYy
	4g58D8v9TUcSAiPSyJrAafX9o0UAKSIJl0KTCJi4p18fUmFeJ9DVZb6saJJxdMevVRn/So
	gDCbeIp0XDqc8MQYyC6dXGbOh7ALYl1hGvIAGJeK//MqEehBciqvtlAWtPJ6bQ==
From: Maksim Pinigin <pinigin@mapicom.org>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Maksim Pinigin <pinigin@mapicom.org>
Subject: [PATCH v2] media: dw2102: Fix a buffer overflow
Date: Sun,  5 Jul 2026 21:45:50 +0700
Message-Id: <20260705144550.455058-1-pinigin@mapicom.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mapicom.org,quarantine];
	R_DKIM_ALLOW(-0.20)[mapicom.org:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66633-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pinigin@mapicom.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pinigin@mapicom.org,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pinigin@mapicom.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mapicom.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mapicom.org:from_mime,mapicom.org:email,mapicom.org:mid,mapicom.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F16970A60C

This bug in dw2102_load_firmware() function appears only when building the kernel via LLVM+Clang. Due to reading of 64 bytes chunk, it may happen that there will be an attempt to read a more bytes in chunk than there is left, which is why Kernel oops occurs.
At least this bug happens when downloading the firmware for Prof Revolution DVB-S2 7500 USB.

Signed-off-by: Maksim Pinigin <pinigin@mapicom.org>
---
Changes in v2:
 - Fix patch syntax

 drivers/media/usb/dvb-usb/dw2102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 4fecf2f965e9..ad90d7be4412 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -1893,7 +1893,7 @@ static int dw2102_load_firmware(struct usb_device *dev,
 		break;
 	}
 	info("start downloading DW210X firmware");
-	p = kmalloc(fw->size, GFP_KERNEL);
+	p = kzalloc(round_up(fw->size, 0x40), GFP_KERNEL);
 	reset = 1;
 	/*stop the CPU*/
 	dw210x_op_rw(dev, 0xa0, 0x7f92, 0, &reset, 1, DW210X_WRITE_MSG);
-- 
2.39.5


