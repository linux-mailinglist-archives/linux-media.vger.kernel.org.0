Return-Path: <linux-media+bounces-65271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ftzDOt4jNWr0nQYAu9opvQ
	(envelope-from <linux-media+bounces-65271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 13:11:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 482086A55E5
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 13:11:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yandex.ru header.s=mail header.b=ACMAHLYH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65271-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65271-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=yandex.ru;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70E3E304E30C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 11:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55EA846F;
	Fri, 19 Jun 2026 11:10:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C698E34CFD3
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 11:10:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867455; cv=none; b=k62a/s91a/AMtT/ubaF2bs53w2m0vEKLhg23ZH3RQVFbfk9rvGpC8/HkXAvZXOnyMMQljRg5XhynlvnEZdyrpZO5htI5IakZFO+ZX4RX7yOddqYnygRKC7mb4FyLpQmVpn82gHlRUeZEjWdjKO9MBnH6ZkzeZRQ6H3z8FM/I1K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867455; c=relaxed/simple;
	bh=DqBNH0NWUoDaN78h+0Ar9Y1BKtcQDZVxXPhHLcvaXQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6G+n7HTSV6fT0b5u1PQIO1jA7IpuqSt56TUkLvB0tdVWOQW25jM6eQaT1qH/Ecgla/qEjEG2HMNNBdtlN6NkXpX594N+YhnQ+xokzUVCqcQqOw9esSvQPCwMxu3mE2kBDd52H+uRU4c4ZP79BE6vqZ3UngVo47+a4yNHMZVQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=ACMAHLYH; arc=none smtp.client-ip=178.154.239.213
Received: from mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:d788:0:640:6e4d:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id EFC17C0295;
	Fri, 19 Jun 2026 14:10:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net (smtp) with ESMTPSA id fARpYSLdFCg0-6SXQIJrv;
	Fri, 19 Jun 2026 14:10:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1781867443; bh=4uCoY8SikzfB05GkQy6/pM1sh3GGRsdn0xxzKFCz8W0=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=ACMAHLYHr0tYW/4ZXxXWfTnYQCc3U6T5tdkfiA1lqIVbBrwuvGb0QXQnzgcPIm7FO
	 5sdimPoEZgrmXmxq4u4RQsPZT3bVOAWAduLnozYa/ulP/ZVX+fzlhfN8O/xyGYJ40T
	 a2gHk4tlC4BIzZ7k629pVeGLy0EGQfU3FQFjE2E0=
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Valentin <benpicco@googlemail.com>
Cc: linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 2/3] media: xbox_remote: adjust device name setup in xbox_remote_probe()
Date: Fri, 19 Jun 2026 14:08:15 +0300
Message-ID: <20260619110816.2926821-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619110816.2926821-1-dmantipov@yandex.ru>
References: <20260619110816.2926821-1-dmantipov@yandex.ru>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yandex.ru,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[yandex.ru:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65271-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mess.org,kernel.org,googlemail.com];
	FORGED_SENDER(0.00)[dmantipov@yandex.ru,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[yandex.ru];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:mchehab@kernel.org,m:benpicco@googlemail.com,m:linux-media@vger.kernel.org,m:dmantipov@yandex.ru,m:benpicco@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,yandex.ru];
	DKIM_TRACE(0.00)[yandex.ru:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmantipov@yandex.ru,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 482086A55E5

In 'xbox_remote_probe()', use the value returned by 'snprintf()' to
check whether the device self-identification is empty or unexpectedly
large and so fallback to numerical vendor / product ID is desirable.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/rc/xbox_remote.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/xbox_remote.c b/drivers/media/rc/xbox_remote.c
index d2cb88b8f1ca..7b53fef277f7 100644
--- a/drivers/media/rc/xbox_remote.c
+++ b/drivers/media/rc/xbox_remote.c
@@ -190,7 +190,7 @@ static int xbox_remote_probe(struct usb_interface *interface,
 	struct usb_endpoint_descriptor *endpoint_in;
 	struct xbox_remote *xbox_remote;
 	struct rc_dev *rc_dev;
-	int err = -ENOMEM;
+	int len, err = -ENOMEM;
 
 	// why is there also a device with no endpoints?
 	if (iface_host->desc.bNumEndpoints == 0)
@@ -235,12 +235,11 @@ static int xbox_remote_probe(struct usb_interface *interface,
 
 	strlcat(xbox_remote->rc_phys, "/input0", sizeof(xbox_remote->rc_phys));
 
-	snprintf(xbox_remote->rc_name, sizeof(xbox_remote->rc_name), "%s%s%s",
-		 udev->manufacturer ?: "",
-		 udev->manufacturer && udev->product ? " " : "",
-		 udev->product ?: "");
-
-	if (!strlen(xbox_remote->rc_name))
+	len = snprintf(xbox_remote->rc_name, sizeof(xbox_remote->rc_name), "%s%s%s",
+		       udev->manufacturer ?: "",
+		       udev->manufacturer && udev->product ? " " : "",
+		       udev->product ?: "");
+	if (len == 0 || WARN_ON(len >= sizeof(xbox_remote->rc_name)))
 		snprintf(xbox_remote->rc_name, sizeof(xbox_remote->rc_name),
 			 DRIVER_DESC "(%04x,%04x)",
 			 le16_to_cpu(xbox_remote->udev->descriptor.idVendor),
-- 
2.54.0


