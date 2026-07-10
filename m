Return-Path: <linux-media+bounces-67242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uUPALPO0UGoN3wIAu9opvQ
	(envelope-from <linux-media+bounces-67242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:01:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9C738C4A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:01:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=oISRSD4w;
	dkim=pass header.d=mess.org header.s=2020 header.b=oISRSD4w;
	dmarc=pass (policy=none) header.from=mess.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67242-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67242-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE75030BF0D2
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E5F3DB325;
	Fri, 10 Jul 2026 08:53:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69333BFE5B;
	Fri, 10 Jul 2026 08:53:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673638; cv=none; b=WrvZc/OACi154u6OZFtTyZQmx76wYuuGS1HQYZXG8wmQPtsaVt+d263K6IFTD3WW4dzy0Cp5ZYLl1kMQkVvLz8rPp6qSVtirmBXlzbyP/cXGKsb2RIEpS3DkaAbKRYZhtT0mfMzgpm6ZfafTtirTSzBYGZy4Okh7ce82TlJ+AGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673638; c=relaxed/simple;
	bh=BG7YQu/+l+4a6tlt3FlGEMVNcMvn8qWv1zpRJHhhI2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBoz4uG93d1wTantEF+KMiKUW5coJStmL7t8P64NeWdKUVRS1pAeI1Mb/kTQd8vPiJqw0kPBkkKudG21Q0ac1tMDmw2uZEOpS/QX1EuEflUbyxFNm5+8Cb0QNVmY/C9MCoSOmmGTHIWRfa8dwJiTmSS1m3HICzOi8PTOr8NXyZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=oISRSD4w; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=oISRSD4w; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673629; bh=BG7YQu/+l+4a6tlt3FlGEMVNcMvn8qWv1zpRJHhhI2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oISRSD4wzezfDJ8GQYxRQKwvvokIl+acyoTltz/j+1eGYjThIJPk+rVxpmCs+YXfS
	 W7xfDMYqyafLtPL6hLSA0JTJm5cXL1mCVcxYU6KMesdMME8Ws75sjlyPWhofsKKyyi
	 cn7zp3Z0yR1y2VFXx6PaJuM7osaCGxSUoYEPnUMLOyNfYfgGjY7otA8JsedffsEdpn
	 3IJHOc9EMPv1KQIp0gXeZp3s6jUceKEPtYH2NzZz1cIy5RvgJlVh2g+V1t+U8I83I6
	 RvcLoqcfTHaYkli8qvQ2gEF49xk+A09mulka6ap0ITHN5jjont5moXBcmFhJE6CdiP
	 D4bOJwA/iIUHQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id BF8A540B4E; Fri, 10 Jul 2026 09:53:49 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673629; bh=BG7YQu/+l+4a6tlt3FlGEMVNcMvn8qWv1zpRJHhhI2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oISRSD4wzezfDJ8GQYxRQKwvvokIl+acyoTltz/j+1eGYjThIJPk+rVxpmCs+YXfS
	 W7xfDMYqyafLtPL6hLSA0JTJm5cXL1mCVcxYU6KMesdMME8Ws75sjlyPWhofsKKyyi
	 cn7zp3Z0yR1y2VFXx6PaJuM7osaCGxSUoYEPnUMLOyNfYfgGjY7otA8JsedffsEdpn
	 3IJHOc9EMPv1KQIp0gXeZp3s6jUceKEPtYH2NzZz1cIy5RvgJlVh2g+V1t+U8I83I6
	 RvcLoqcfTHaYkli8qvQ2gEF49xk+A09mulka6ap0ITHN5jjont5moXBcmFhJE6CdiP
	 D4bOJwA/iIUHQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 3654240AF1;
	Fri, 10 Jul 2026 09:53:49 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] media: redrat3: Ensure we don't read beyond the end of the packet
Date: Fri, 10 Jul 2026 09:53:31 +0100
Message-ID: <415546fcdb57253472f021f4094e9ef3228333a8.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67242-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:jarod@redhat.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mess.org:from_mime,mess.org:email,mess.org:mid,mess.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29A9C738C4A

The length and offset is provided by the usb device, so it should be
validated.

Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index d2a805dbd3f3..424f8b9e4d17 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -358,8 +358,18 @@ static void redrat3_process_ir_data(struct redrat3_dev *rr3)
 
 	/* process each rr3 encoded byte into an int */
 	sig_size = be16_to_cpu(rr3->irdata.sig_size);
+
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


