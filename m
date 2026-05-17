Return-Path: <linux-media+bounces-61841-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JSpBrOHCWrVeAQAu9opvQ
	(envelope-from <linux-media+bounces-61841-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 11:17:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A28DE56031B
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 11:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE8E330055AC
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 09:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4999035A3B9;
	Sun, 17 May 2026 09:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virgilio.it header.i=@virgilio.it header.b="AsRVXqPc"
X-Original-To: linux-media@vger.kernel.org
Received: from virgilio.it (smtp-45.italiaonline.it [213.209.10.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89587080D
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 09:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.209.10.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779009450; cv=none; b=YjZSUcUwuj0zz172r8KIqeTu5tNYRGCSU1aAHNY9i6GYmGmyjxYMVAGPmf9vhQFjYzt2Wht8S74sUta7BnmUtd0RtaxYQe0O3E7CLqb18K8C0IS1jyamokbjR1kdYPvx2MS6jn/QrBeXRn9q4lcW19gyH+r0IIOnJbISKZzkEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779009450; c=relaxed/simple;
	bh=aMu4e0dakZCq6AVcA6u7jnJfaeBvp1Te1F/cmB1X5Rg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ETTuY/ZSF0BX7Kh//S/VWn7bOzJLhtbS0MXerWAswp3hKKXUdIJWRo0KRgUhAX3mq/ztJ+XGxZAUFnLKIG7GMRgQdMaE0i/oucxKzVPeMgQ+AadprznTB3/DnogubDpyzYOoPTT3QPjgp6nA+L2/3/8Nln9Fotj4JyFg0Z46meQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virgilio.it; spf=pass smtp.mailfrom=virgilio.it; dkim=pass (2048-bit key) header.d=virgilio.it header.i=@virgilio.it header.b=AsRVXqPc; arc=none smtp.client-ip=213.209.10.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virgilio.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virgilio.it
Received: from virgilio.it ([95.249.63.132])
	by smtp-45.iol.local with ESMTPA
	id OXa7wLP9Mij70OXaCwqyl4; Sun, 17 May 2026 11:14:48 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virgilio.it;
	s=s2017; t=1779009288;
	bh=WUmvhzaAYTvQ+529ZuES9WCw8eDX5ojCULxWZNGLK+E=; h=From:To;
	b=AsRVXqPcZG3MpzH0LUieRfz5bNsDuvXpvWlEyMyEG3o+KySkMsFfdRuhZNafNJYST
	 uxY2fX4KjjSxcwjVirHGhVfaXNQ1KHzrgmCmVoNerdD9qlP6+vk6A3efOKss0I6hAi
	 2vp93yIHi3kMKkZL4ymYBS4t2Ar3JhE7QihIylIMbag0Ew2NMkH7N1D1lij+FUFMWi
	 kvkdELGaxoqBIb/sbPnqWfIhLaQYhCM15EEWjORVpFQNkJa2ck8LZcoGEtbDuRHZEF
	 t+E4+xhKAAw7OE1NCX4vUVIdW5GHLxWoI0VWibeVEYJZ4jt57AfQ9Pd604B1fRDIgz
	 OaD6tNyBcPRsA==
X-CNFS-Analysis: v=2.4 cv=E7PNpbdl c=1 sm=1 tr=0 ts=6a098708 cx=a_exe
 a=31gyBBid8KDB93oJ8PHLEg==:117 a=31gyBBid8KDB93oJ8PHLEg==:17
 a=wAGg3p4uCBcpEzkhgB0A:9
From: Alessandro Baldi <baldovic@virgilio.it>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alessandro Baldi <baldovic@virgilio.it>
Subject: [PATCH] media: imon: Add iMON VFD HID OEM v1.2 key mappings
Date: Sun, 17 May 2026 11:14:15 +0200
Message-Id: <20260517091415.3080-1-baldovic@virgilio.it>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDny0Hjf+4ceWGCwuCUGQ6VzMy9xUF+1srS9lJT2l+AA9KjHK/qrvaOkxw4W9Zf7+Qij7HhgqUUjvK3iKsn55hX5xwN0rNVKcquxb3wnpCkNRN84JuuE
 zsxkEElt+j9+valpotnvSDMUed+8oBDcuLguAVTscZiyK8Tb7aCfWE6mgcSjIqBXA2t69871m1mL4Fd7EJwusLqUHBDYE8peWPLeZ6qHWJUO2EM9n/RVWBes
 mULFtI66NMzD3RvToGA75nfpDMbbuUsvPRkWcqY/f/PL3ytoRppFK5Fvzr5luPUR8PNXGi5w9wUBp1sepeUNbIq1hobYPeN9oHWnlvEY+Og=
X-Rspamd-Queue-Id: A28DE56031B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[virgilio.it,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[virgilio.it:s=s2017];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61841-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,virgilio.it];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[virgilio.it];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baldovic@virgilio.it,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[virgilio.it:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,virgilio.it:email,virgilio.it:mid,virgilio.it:dkim]
X-Rspamd-Action: no action

Add Vol+/Vol-/Mute panel button mappings for iMON VFD HID OEM v1.2.
This version differs in the codes that generate the
KEY_VOLUMEUP, KEY_VOLUMEDOWN and KEY_MUTE events.

Signed-off-by: Alessandro Baldi <baldovic@virgilio.it>
---

Note: this is my first kernel contribution.
Keycodes discovered by parsing USB packets with usbmon:
- modprobe usbmon
- cat /sys/kernel/debug/usb/usbmon/1u | grep Ii
Tested on Thermaltake Mozart Sx case with LibreELEC media center.

 drivers/media/rc/imon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 9bb27ba82..049a73b5f 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -290,6 +290,10 @@ static const struct imon_usb_dev_descr imon_OEM_VFD = {
 		{ 0x000100000000ffeell, KEY_VOLUMEUP },
 		{ 0x010000000000ffeell, KEY_VOLUMEDOWN },
 		{ 0x000000000100ffeell, KEY_MUTE },
+		/* iMON VFD HID OEM v1.2 */
+		{ 0x000000000a00ffeell, KEY_VOLUMEUP },
+		{ 0x000000000b00ffeell, KEY_VOLUMEDOWN },
+		{ 0x000000000c00ffeell, KEY_MUTE },
 		/* 0xffdc iMON MCE VFD */
 		{ 0x00010000ffffffeell, KEY_VOLUMEUP },
 		{ 0x01000000ffffffeell, KEY_VOLUMEDOWN },
-- 
2.34.1


