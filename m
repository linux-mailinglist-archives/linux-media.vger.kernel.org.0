Return-Path: <linux-media+bounces-66059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UJY3JUWOQ2rDbgoAu9opvQ
	(envelope-from <linux-media+bounces-66059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:37:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4DB6E2454
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:37:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=QNwTO0M4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66059-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66059-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC341302CA9E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A283F9287;
	Tue, 30 Jun 2026 09:25:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D503F788D
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 09:25:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811550; cv=none; b=Kh/v2paglMa74M4tqpkCUbfNpxLzcRWO/l1xyqaAjETdrScpHqKSxXrlwPyuxVSxUjziWp/C4m6gIecokvzi9MEZ2+Cakjdu1xtINrfS+hvHCp7R0Yyg51ZDjJuBem+cRJOGTt+bV4gOlRUx7RIHiUZ1QIqdB665TfxK4CNJslo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811550; c=relaxed/simple;
	bh=busqlJ0274t3/BPXZX8dUCt6vR+uEyrvfGNkr9d6lvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JymMVY77wtHGA9LwsQAu6HFSjM6q65vJnJAZrBJZd8Qt0I44mbw6zH9qH8SSUBa4cEoYDkLCEW32yUywbKQsuqZYcxCUlOI3TqilKhWnRuMrQJp9ZcOwNJrR0nalXuuc7WXwg+kT8ig5Euf/9i4s5GagSg1BpDzhjc4yJwQy1IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QNwTO0M4; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2703489f8f.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811547; x=1783416347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/rCC6H/PubQs56FOFh3BNffnWCFrCQpZD8Knhkq+Tw=;
        b=QNwTO0M4W3nv8eJPyQLxK6IEb//ScrqrEK25ktImO+3VZd0szBGjU9fth4Pj4ZF9Tr
         t4NYWOHcBr/FhnqNGnuSoWVcEyk7s93GwPWOHLQ0cBuA+lNdmIb/sWj4P72O821NMLvj
         dJRT025c5Zz3wD8+bnJk/GbDHWFmm7ny6xI4HDVr/LiyezBOVxmAKFP1FGhwhuHainrE
         A7qqvIPngIB6pXm2uqfpdXBd0gQVWZvImTzcJ9jgH7ZR3NqGNqxjj3szyuZUCG+lKK+k
         XqH43K1ReQvlyrDoo2RxIrz7NXoXj2kjqgR/atDcORDWcsWWP8iOeo0FbWs0yN5xqjDc
         ijHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811547; x=1783416347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W/rCC6H/PubQs56FOFh3BNffnWCFrCQpZD8Knhkq+Tw=;
        b=DKcmuXwYgF3/kgq3YvZI2aTPo4rQ/7xR3mjDfx0oAWeO50r2EHzNIpobbiVx/CiKlb
         xqh6JfTs1NP5w5xEYH4UIkAGEDjwC0bmG+svwt+Bl4X47945Z72pC/wsFylFE2gn2MAL
         J52XJp+u0zZj6Z+Bpozq2GYzZ4lutxn3Zn+ZpKMQRel8rLXfe1rOE4malHA6+L+Kmj0b
         xaPTJXjL9kI45QN2tNlbmepIyCHWjvSnTouKnY74pmLYpPZq/icfxPaE/hg+aJK4ghPm
         SW0bzXfxTWbU+SF0px3yQEQKM/oWewWnIoSm4ncVFKzHGkoL4tGvA2P4uDFTLmJVBZIl
         1IsA==
X-Forwarded-Encrypted: i=1; AHgh+RphVyXuJLZIm+4quAUovh1aPwPz0K31gQtTygQYxCAVn1NocYWQwerGkT2HVZ+xUxZ4Riop+lNoq3cWnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ZoT0oxmQheiUKTz5k3R42TgPDW3u1ql1ORsdabaj3s2U+MGD
	fD+P3bXp4lhXMMrXuQSPPT2CUkWhjKpmIInOqt0qGx9VBg6fh4UVfngrQP+Ga7TvogPl5MPrz8B
	9XnX2
X-Gm-Gg: AfdE7clVByppoFJPjRglNCXYDTZIjrngGtKfKGi3nzgVmRxa+KvOefIvlDIqUx11ack
	HJPJGsWfwLeHmhv+NHnQMmUnQ+qBRaMGYZ7NUavl+eTkDJ7dO7que/9xDXHyv2XC3/aFiPHvSHn
	+aWI7wk3N+UTwchHQKZ47mxTpNNVpSKpL6O0j9FPjYcCKMkAGcqM9YC4preHht29pie+enQKSvu
	k2+b6RYW7ZAvT+4r2rGk9Wai7DY/EfwdhwmhJSCxZ1aKX2Oa5kgVHES/nKHNcVQbJ7vIrAC34EK
	WPo8UTOXtG6lEW8S5HpvzYXdrAwKLIg7DJhHO4Dov3MFUcOS/wH7v02Drod3LoHAP6gNSOs+UJw
	+ljL+w86swLZ/8orHPbsDCWFVcWuPcioh/LPyFsgMxMFjgJV4pHtnPjUbABoyZvnVKibD98SLkf
	kEw1zd0ZBtLID7LBPqLbhC8sf4Dz97npP2wbsRnRi+lfKwEizJvC/cYnwhSijCsTaZyL0aL7att
	l6s
X-Received: by 2002:a05:6000:2dca:b0:474:6a5b:85f4 with SMTP id ffacd0b85a97d-4755021c1e7mr3384420f8f.5.1782811546773;
        Tue, 30 Jun 2026 02:25:46 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4756636cdccsm5535940f8f.24.2026.06.30.02.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 14/17] media: em28xx: Add include for struct usb_device_id
Date: Tue, 30 Jun 2026 11:24:33 +0200
Message-ID: <e72de5b4b9f1aa77a3c19a5e698a195dfd81ae0b.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=busqlJ0274t3/BPXZX8dUCt6vR+uEyrvfGNkr9d6lvE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ4ts8zLxjENiWAAmhECkbj4eY4/UuP9VPF6hM RBOBuvFtwqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakOLbAAKCRCPgPtYfRL+ TlwNB/4se/M65IDlDb0ks5IxrWNfQHtG5owdacvrkb5dOsenhpYf9v0LY7VELqDzyr1tiWeDZTU 9DsS6IHZhXphaX5b47OAdsX3rZaxjyBi4JtZEoKzWIkEDgOF3SQUGG4RRQnOfTSwX/yPSFOLYL6 GkQR+Pf7fT2vYS/XN7A+LZRX2g/od8c6g1Gp6z1XGlw5tei/N5lWAgtZTYLxm9T/o4L+bvdV/nB QRF4Kgk2muqr4h7TttASFfhT8xcM2WMVMoT5SHmYir3sKfIW6c65vB6+0x8ooT+vbhE0JDE6f8E 1i3Zs2a+zuyc6RsNJp7XQndyf6uZf3+JGxIvsBBEt3CQ9JFJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,m:o-takashi@sakamocchi.jp,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-66059-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sakamocchi.jp:email,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,msgid.link:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D4DB6E2454

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
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/b859817d9f6ec7450302a231e093a5ad5852cb91.1782682124.git.ukleinek@kernel.org
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


