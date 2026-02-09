Return-Path: <linux-media+bounces-52443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPbhD5AgimnLHQAAu9opvQ
	(envelope-from <linux-media+bounces-52443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 18:59:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F28113551
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 18:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50F4630069AC
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 17:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558F338A713;
	Mon,  9 Feb 2026 17:59:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from postmaster.electro-mail.ru (postmaster.electro-mail.ru [109.236.68.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A528388855;
	Mon,  9 Feb 2026 17:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.236.68.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770659971; cv=none; b=AwEgQ18uP58eVBCQnrFt7EWS0OUJSb9RZL3iZ0PqxogpnIIsyt6f8LKXlZ5EfhvvZzpMuz+TA971jUnGNUuBzQhOhe1kwM19bIvaIM9om679F/NuUcdzfKTELi0XxQi1hwDBGCwyfTpIYKS4XYVUpBKGCkDqeiDoxNYMNhpdCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770659971; c=relaxed/simple;
	bh=gtSwUzTS9A6okpGzABiWD7+Pn0WQ9EtXzPI723z72jw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GOlDCX3xPkwErqgGSocON558Ak4JVjcFcRrzQYvAzYMI7Gx86x3n68ql7+ORxXbP+BW/NraIMPKPlnXdL13/9HFXW83wOtcTK29J9dOnTkUtuhv8VKDJk2SIqe4U3r9ROPnEW1o1OjvmMprLgMdVZtT1U8vNTdoZTiar9QLx9fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tpz.ru; spf=pass smtp.mailfrom=tpz.ru; arc=none smtp.client-ip=109.236.68.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tpz.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tpz.ru
Received: from localhost (localhost [127.0.0.1])
	by postmaster.electro-mail.ru (Postfix) with ESMTP id 83291EEEB77;
	Mon,  9 Feb 2026 20:50:29 +0300 (MSK)
Received: from postmaster.electro-mail.ru ([127.0.0.1])
	by localhost (postmaster.electro-mail.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id q4FJGBBlwqk2; Mon,  9 Feb 2026 20:50:27 +0300 (MSK)
Received: from postmaster.electro-mail.ru (localhost [127.0.0.1])
	by postmaster.electro-mail.ru (Postfix) with ESMTPS id 0E1C5101601B;
	Mon,  9 Feb 2026 20:50:27 +0300 (MSK)
Received: from email.electro-mail.ru (unknown [10.10.0.10])
	by postmaster.electro-mail.ru (Postfix) with ESMTPS id F12B6EEEB77;
	Mon,  9 Feb 2026 20:50:26 +0300 (MSK)
Received: from lvc.d-systems.local (109.236.68.122) by email.electro-mail.ru
 (10.120.0.4) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 9 Feb 2026
 20:50:22 +0300
From: Ilya Krutskih <devsec@tpz.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Ilya Krutskih <devsec@tpz.ru>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH v3] media: dvb: mb86a16: fix array overflow in mb86a16_set_fe()
Date: Mon, 9 Feb 2026 17:50:10 +0000
Message-ID: <20260209175012.1772804-1-devsec@tpz.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-KSE-ServerInfo: srv-mail-01.tpz.local, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 09.10.2024 20:59:00
X-KSE-Attachment-Filter-Scan-Result: Clean
X-KSE-Attachment-Filter-Scan-Result: skipped
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[tpz.ru];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-52443-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devsec@tpz.ru,linux-media@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 54F28113551
X-Rspamd-Action: no action

The size of prev_swp_freq[] is a fixed constant unrelated to
the number of possible detection attempts. Index 'prev_freq_num'
of array 'prev_swp_freq' is incremented by each step in cycle.
If index exceeds the total length of array, an out-of-bounds
access might happen, in case of repeated unsuccessful signal
acquisition. Add check to prevent this.

Cc: stable@vger.kernel.org
Fixes: 41e840b13e11 ("V4L/DVB (13699): [Mantis, MB86A16] Initial checkin:=
 Mantis, MB86A16")
Signed-off-by: Ilya Krutskih <devsec@tpz.ru>
---
v2: Add check for array's length on each cycle step,
edit patch description, edit tag 'fixes'.
https://lore.kernel.org/all/20251211172251.852254-1-devsec@tpz.ru/
v3: Edit condition to >=3D ARRAY_SIZE(). Move condition at cycle
beginning to prevent border check error.

 drivers/media/dvb-frontends/mb86a16.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/dvb-frontends/mb86a16.c b/drivers/media/dvb-fr=
ontends/mb86a16.c
index 9033e39d75f4..5fabb6b884b5 100644
--- a/drivers/media/dvb-frontends/mb86a16.c
+++ b/drivers/media/dvb-frontends/mb86a16.c
@@ -1157,6 +1157,10 @@ static int mb86a16_set_fe(struct mb86a16_state *st=
ate)
 		v =3D 0;
=20
 		while (loop =3D=3D 1) {
+			if (prev_freq_num >=3D ARRAY_SIZE(prev_swp_freq)) {
+				dprintk(verbose, MB86A16_ERROR, 1, "Signal detection retry attempts =
failed");
+				return -1;
+			}
 			swp_info_get(state, fOSC_start, state->srate,
 				     v, R, swp_ofs, &fOSC,
 				     &afcex_freq, &AFCEX_L, &AFCEX_H);
--=20
2.43.0


