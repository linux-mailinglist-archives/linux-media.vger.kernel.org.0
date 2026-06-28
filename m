Return-Path: <linux-media+bounces-65834-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6HDONoqaQWqRsgkAu9opvQ
	(envelope-from <linux-media+bounces-65834-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 00:04:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBC16D51AB
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 00:04:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=d+inapl+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65834-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65834-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 288E5304AC15
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 22:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BC33C13EC;
	Sun, 28 Jun 2026 22:00:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28A93BB11A
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 22:00:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782684015; cv=none; b=OC6VYZmEsVrz8eVyWYt/m7P5kYzWj/t/GepbV6xFTVmzpdi+4DOeJoAdK6+X4unMJN37Gx5VDhHb8tsqOJVK9fhOjZ3oEdVt/f9hhxdpOHs5liSTVKkxSq51MaBMpldMe0DsljPE5uyrSCtaoOb2LgiSOI2t7EcDOLqoHE2X0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782684015; c=relaxed/simple;
	bh=gva0U6fAAgaPBLi9ym/vYLMerhAUc/5tn/A0azBCNzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fR+nbtSznLinx+QV6RC+C/AYirIgr+NQALopyLGI1ThOOGxkJL/a40hK3hgqmrlyXvKasGYcjQaGSt2eR79g2wbeRah+GR0DCkKkkM2+71/lCgOTm+nVa8C8trBgSayuRGAIXbAhnys1RIKYGeboAlXPxfBCF9FzosqX/FK2so8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d+inapl+; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so30556155e9.0
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 15:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782684012; x=1783288812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxIf5fe51LwEiWAQYu+OBbEJCFp+uFX7rYx0nMj0ZjM=;
        b=d+inapl+rKN5mnwDqykunJ8A33bvMYIpiSxovMEMy3LorWHTA8Gbx7i5gAjSvYr2FH
         noA39ykXl9RJaDx05LWI/ToGz0SG9yldZe1PhB1DtbpNoPZ04CK+WfmzZGYfbbJHkiFa
         PMM+j1PeQuvnNvhgCLQORjIkNi+Hejkx0+iLMJn478m+pMbr1CKK1badLdRB16NsBvll
         IGpXL/ifGiCdCxNXKe/cs++JoIBPk+rlOPWtTso04MhOzXErBktCXi1wQU80sCX4K9ij
         c72imolbRIirFPU7vFmgdIlRQGN/1cZ8T0d1IOFCb87zQDT8tSCo9DOb1uTEWhFn6AFw
         2qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782684012; x=1783288812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sxIf5fe51LwEiWAQYu+OBbEJCFp+uFX7rYx0nMj0ZjM=;
        b=d4w3lIdcXePE+lt7aCvzUP0irEMZo+dGw4uD/KSUh6vlfauo3U7KGEBxQdzWUS3wZe
         r0b1OjmDPNznhoGOUK0vC6jJZKfHFi9Xen6zxENLbeYZY+X6g0uR3wGmxvxjWh5+fnC8
         WN+YDpnFmljks5yZrN+qdlRm/koCS4gpgc9P7rMSoUqm6DCSxYA/pJXmvNxUJRyFCJ8i
         K91quWsqb7AHTodCfXUJ2zyCRXsBz6A4KwBtSJ5+rVEnausliDnQxPTWcblvEK6am9wL
         USbw70d93bLSL2C9ymm9xm5HvBpnSGtIlnrDwAhLPZzTzGu4OxyW7lW+woBtVEfYz7zw
         GkJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IIqrUU6gM1NyEpCTKsJjKMuSQ4nkE0x76fcL5by9TKzJKm3hpQNJzCqyCgW+zzocMnRo9mRyzipUXvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaBMBIkOBzQ2cxgfh0jFfxiUdHKi3X8TBsXBA/9o1Wniq8rhWF
	S+O0GCjx3JSNWLbcdWF/BRet0jL03GQqWpYGMXN7C0NFoF6V0I8ly8ht4IyEBl58PEs=
X-Gm-Gg: AfdE7cnjdohXo8NkJrHvez7ta4Irh2GxbMIFTrAuDddyV7BlYVKfTXp7qegYoDK9mx1
	oZqbyyzn/LSbbbZxFWI9HgExAweXGBG5u4YPm4iyFkXioY9azrTeIdWataFK80/M1aYfNfSCMDk
	i5+E96fGx5BW7FgU+p0naqCUbLPHrV5NPPRyim9BklwZk/jPNz2cZJWAB4wzzNpCODQNpqzRAqJ
	9ABgu/XK8k9Rddtjz3d2Z/GWRwKannUtLfRqj1z0H6ApDIu+35bbTMGSYNLE2rTxBogBweCXbAc
	NzAN0hc9liUfOyx07X6+MLwRyyCxi6xb7p6PNTD9+Fkkchv5I8M0z4o64vNrZVxxfgFhPjUFHLP
	cYFkMY9LDePfdL1hUHatCjvTZtcG870+50GED21RYWtmWwWU3rnbLc/lo4KWDrN/a3/x7e96TBX
	ac87S7+BJkT2EUVJ1aCA==
X-Received: by 2002:a05:600c:3b1a:b0:492:6379:e2b6 with SMTP id 5b1f17b1804b1-4926379e2d7mr252771305e9.9.1782684012411;
        Sun, 28 Jun 2026 15:00:12 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46f9db29b15sm17424839f8f.18.2026.06.28.15.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:00:10 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 14/16] media: em28xx: Add include for struct usb_device_id
Date: Sun, 28 Jun 2026 23:58:49 +0200
Message-ID:  <b859817d9f6ec7450302a231e093a5ad5852cb91.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=gva0U6fAAgaPBLi9ym/vYLMerhAUc/5tn/A0azBCNzg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQZk1qra8/0VnkcsBZFQEax1Eu7Ok59wpccQP0 RM1kb/1eW6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakGZNQAKCRCPgPtYfRL+ TtJzCACI29MF0fHEnoSJNsynETFQOj8MAOe+3oCwEsDNJ1CLjmzj0zbRnCkHFz6jMYe/yS+MzRY uu6vjCGKRxp9eUND6+pekNG4xLqL+lEJNIoK2Gtv/zPNomC5LaPt6xX2M3yYgZ34g65KRsmM5FQ VLA0pZjk0wqnW89X5nAKtY9+Q7lkyt4nzU4tmc11vUbJfM9Bm8varAHW0xCc5r/5WuQkdTjVnhP vPD5Kk3cs6B7SXhtF7ViHBCv4vb0VZuyiaj+du5wMuZSu8bEfYqlWA8XH5c8bDKx1XBjHvC+W3l tAQzm1R+9HkK+nStkjjXOdJIlzLHFdWHWYve3X6kgeUNVgWm
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65834-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CBC16D51AB

Traditionally <linux/mod_devicetable.h> was a header defining a plethora
of structs, among them struct usb_device_id. This was split now with the
objective that only the relevant bits are included.

Currently <linux/mod_devicetable.h> is transitively included in
drivers/media/usb/em28xx/em28xx.h via:

	drivers/media/usb/em28xx/em28xx.h ->
	<linux/i2c.h> ->
	<linux/acpi.h> ->
	<linux/device.h> ->
	<linux/device/driver.h> ->
	<linux/mod_devicetable.h

To keep struct usb_device_id available once <linux/device/driver.h>
stops including <linux/mod_devicetable.h>, include it the header
providing that struct explictly.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/media/usb/em28xx/em28xx.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 21c912403efc..711f281613f5 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -23,6 +23,7 @@
 #include <linux/mutex.h>
 #include <linux/kref.h>
 #include <linux/videodev2.h>
+#include <linux/device-id/usb.h>
 
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-vmalloc.h>
-- 
2.47.3


