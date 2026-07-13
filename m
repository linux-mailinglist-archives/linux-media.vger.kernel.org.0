Return-Path: <linux-media+bounces-67521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hRhlLmtZVWr1nAAAu9opvQ
	(envelope-from <linux-media+bounces-67521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:32:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 546C974F462
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:32:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=Z1D+Pv3t;
	dkim=pass header.d=mess.org header.s=2020 header.b=nHpbvkBz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67521-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67521-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3469730D4BF0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E660D35E937;
	Mon, 13 Jul 2026 21:31:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E92F360EDC;
	Mon, 13 Jul 2026 21:31:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978294; cv=none; b=P8O22XEBWUFQGh+cNasl1yzNcheeUqwLE16NoBhuOa5fLk/cN/4x2hiOSxCvfXCn2xL9KSomJu0zqWh9FBKSY/nMZvOX4f5yiZoOH8U7nO2kztUSkOIgVRZZXH/Vrhi/ljI1v2QnUN5oWq6jGNY903rmghuJGtCOva/wtWFUXNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978294; c=relaxed/simple;
	bh=RjASzN1+lQ12QOCUkrxPeb7Fn9VCqtQNY/SUR6AGOxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jl7GpK6sAogwCTbE4pNeERh5wGSl6ceIdkdnY9YAqJ572xaiiCNN2kLsSeQXpc3mFJ2KysVqqsGQgrh9sR28o5wG9JC5sVWNjv34kTwLfh82RcrE7kLgS/aZFjLjoEQeozEDDxeDGQbIrEFw0AHh9K+rOHLnoQyomX8pMKInpUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Z1D+Pv3t; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=nHpbvkBz; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978283; bh=RjASzN1+lQ12QOCUkrxPeb7Fn9VCqtQNY/SUR6AGOxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z1D+Pv3tqmMIV52f2JxjqxZov+szmYA4YSSwQg6tBGO7ekontStJimdB8xHpnXyP7
	 +goRYMvxszH4kWFvFLmYUBPXi3Vt+W+5b8H54vFt6VgtIa6MAcI1iTKfFy+Js0w6wm
	 ol0vX7APy5vXkiRyhnrSPJC1S+7iHn2ZpzICgWnqh651tgHKtFLsNTsODv1SFHoLFG
	 bXLlyLnd3HTHNeYs8kZf47thfb3h4h/fRbdNowLGGyF0qCVFg6JdTsJbHd8u+rgrIv
	 AJkgkEx+a6gteVroUQpEUpJ1tr+Jq4LdSO+Lr/gFADZ9VZmGr0d/YlDa+otX+bk1WE
	 fJGV/dj0aTzJw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 0BFB140A45; Mon, 13 Jul 2026 22:31:23 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978282; bh=RjASzN1+lQ12QOCUkrxPeb7Fn9VCqtQNY/SUR6AGOxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nHpbvkBzPMceB3jdpsq9HRXh0EjgYHZOD+oS2WG+lON6aOUpJc9WaSgKHjJTUgO3+
	 BG/8OwONgzkpN/x4M1NufRutt+SttHPryBwohpzDjiZxazvntaQ/PSzrJ8w3ImJIDI
	 ScVLRMEwZH93mBgwdhoZ4KCj4LhA1bHhLr7pBdYImNq4cpRsyiwm8oz1qD5yUn4dpU
	 6JKY94sTD1Pt1I85HENFHrd98sc/vSd/zwq068g9rSiLyiKeYT9lgsRsBenZaoXJD6
	 vGy3PmJdhSrxp3MT6PoJ5jRfzuWbspXXx15+zWvC9mW0N+wgvAVuRd8hRjq+qfSCrF
	 eOcFCEy/Co+DQ==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 590D940A3B;
	Mon, 13 Jul 2026 22:31:22 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/11] media: redrat3: Ensure we don't read beyond the end of the packet
Date: Mon, 13 Jul 2026 22:30:57 +0100
Message-ID: <b9333cd20836ec316d5d65c408cee71b89918f4a.1783977550.git.sean@mess.org>
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
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67521-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:jarod@redhat.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mess.org:from_mime,mess.org:mid,mess.org:email,mess.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 546C974F462

The length and offset is provided by the usb device, so it should be
validated.

Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 391d01143491..44678ee322c2 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -358,8 +358,24 @@ static void redrat3_process_ir_data(struct redrat3_dev *rr3)
 
 	/* process each rr3 encoded byte into an int */
 	sig_size = be16_to_cpu(rr3->irdata.sig_size);
+
+	/*
+	 * Note we are not checking if we are reading beyond the end of the
+	 * packet which was sent, and reading stale data. If the device
+	 * sends a packet which is short then we get garbage IR, but no
+	 * out of bounds read.
+	 */
+	if (sig_size > RR3_MAX_SIG_SIZE) {
+		dev_err(dev, "length %u is incorrect\n", sig_size);
+		return;
+	}
+
 	for (i = 0; i < sig_size; i++) {
 		offset = rr3->irdata.sigdata[i];
+		if (offset >= RR3_DRIVER_MAXLENS) {
+			dev_err(dev, "offset %u is incorrect\n", offset);
+			return;
+		}
 		val = get_unaligned_be16(&rr3->irdata.lens[offset]);
 
 		/* we should always get pulse/space/pulse/space samples */
-- 
2.55.0


