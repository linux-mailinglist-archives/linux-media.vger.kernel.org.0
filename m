Return-Path: <linux-media+bounces-57490-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLYvDkvFyGnBqQUAu9opvQ
	(envelope-from <linux-media+bounces-57490-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:23:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E22350EDA
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53E663021B2F
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 06:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0EE29D281;
	Sun, 29 Mar 2026 06:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1tq4doF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2508929ACD1
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 06:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765371; cv=none; b=nICic5dm2khcmpCWarKLdisv4ncmhWPWaLczbNFWJMdqMH/z5Ste7QT8sSyJgtOaqMjbVsTG3hwcASScDHiq4HeOx7sWQLr2ecHRmL2ocJN/44JT1Qni3Z5zS/jcDVO9hIeFYOV7ufxwXc5Bo8FTsrxFWvGNzPlPGvRjqBJ1oIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765371; c=relaxed/simple;
	bh=kO3cHKvxWs9h2ty+QdXQbQN52ifSHtoJPbXeuqCapSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kn/JQfmw3RuNMSX9Fi8IlaXaivp6VOLUdiD3KZMCZi+x4fqX2xhO+nXzON4PdYn7dO2Es/1SUV+u/ri5JP+iO3T+W8GAnvuhSdcdElaf1kVII+UyY9Fec2vQMwP+TrIfG0KHujIQkvatSrSCBTAqkU4+UR1f19KePmIgY75pwig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1tq4doF; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-953b7d2c820so37099241.3
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 23:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765369; x=1775370169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2/8bJbSlzsQgyqyE2qlsA0InSGRaqOGGPVG89RGKtg=;
        b=M1tq4doFyj/CNU9Xmj8Vm8mkI14TWQQnblLsSQiIl02/b/6O4P/+B3JBh2HpJ0ihYX
         +l84JD6Gbq18xXwMbhjlhbTIU+FUaScsKGyNuXeYsRrOcwFmn+fp4Xn3LwxvxkKgxXqK
         G7zt9JbcZZsKKgFqp5/k1RtB2x19GRQHWfhu6V27R8SLxfXvKGDK44RsYLEfo8/v796l
         79ebFNjdjannUMFK+KIGfQ+5o0BoEkSRn2UBqqtVw1p3iFI6kiGIiODayi7yxzOobEbf
         /emIZ1jmNndv5w23Do9m12BRsbaVOuFfygEDkjjr0Pt06nkv17OBgxm8aYzeOSzYBN6T
         YQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765369; x=1775370169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2/8bJbSlzsQgyqyE2qlsA0InSGRaqOGGPVG89RGKtg=;
        b=eXP3ltTNyJ5szRRW+4JOmL4Y9290zqyr0MhIXVcbxo9EkPJOMEMpExjse2Z5Qc+/nY
         tBIcBoHFg+kTPSDRS70yuJJXN4q9NR0dUovH9wO3hPhr7Yx3Le/4dN2jTZBuMpT47yCa
         PMH2AXAsNR5hfp/SYKGpWju/WTWCgVRizh4p5QrZ+/1DeagQRI0U2sSST7YVHVem86nR
         Cuiosg+/HhvbuReupa5R4OIqdCnoNbbpk3UP0+9gg0dinSF8hg+W1smxaU4tTK9kghIC
         JENxuEA/HRRfV+RmWnHsMuc/YkY24ROebmBFXDvYr1mnDOF/v2X8DjsWZHxWWRxSG3kW
         WeDA==
X-Forwarded-Encrypted: i=1; AJvYcCUT+VxgeGTLeE7IEbZYox1SGelCpRF7LHyel6ABSGGvkdFo8rmUSu/8uksVMtKwR1HSkj2p8wNT3yP7MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbV7YZyZ2x2/6Txp/2zjcmgNlF2Vyh3I3zcevQ3za4HNuFuvrW
	fELX/aOFqi8Rp+6f7VVSgTh2HlKSkFHNrmHS/0UhgqTespBu+EPhuohF
X-Gm-Gg: ATEYQzwSTv7/zjIsPIYEX9lUPeX0RVKQCeInvEjZqCbB8Sb8uNQqJa4zEGRQNnBe2Ns
	abJXQlTnsvuQ6HvOdz4Cbwu1RR6Fw0b1eQwYU/zlOiMtoQDT2uJV3de7hfwBCJZ4YRqH3flOQan
	fzlYyEkP4RSmHgZgRV8LDgRrFlZKI0PWHE9QlEjIn9uA7+lLVmxWh+IYsS19F/w5ak76sUzN1JQ
	YIzuCwTKb7ygilp/CbAJB1VEdvll/23ho5dM30RGY2PSZlFNpFEbsSpWxePeQJxIVqU09OWiCdC
	R16UaAvv6jKEGtbNbTIZoLRMEtjFf3Bme7k0cJ5EH4ytYUjNb2UFhNVXAV0i/76B05eerMJ2MXm
	kfAYoa/3LoZK0NPTVb6/SW9I6iJ3bkB3Oc96ZZ2NedIk1OOJYtKext+a+NPmxXDpxY8iTeGnABj
	q133yFbvGg+cn7hsTYvB3hckGcqxRckm1JeUg=
X-Received: by 2002:a05:6102:6053:b0:5f5:40ab:2d65 with SMTP id ada2fe7eead31-604f928bd10mr2726527137.22.1774765368828;
        Sat, 28 Mar 2026 23:22:48 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:48 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 2/4] staging: vc04_services: vchiq-mmal: add buffer size check in inline_receive()
Date: Sun, 29 Mar 2026 00:21:12 -0600
Message-ID: <20260329062229.493430-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,raspberrypi.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57490-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebasjosue84@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4E22350EDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

inline_receive() copies payload data from a VCHIQ message into a
destination buffer using payload_in_message as the copy length, but
never validates that this length fits within the destination buffer
(msg_context->u.bulk.buffer->buffer_size).

While the caller validates payload_in_message <= MMAL_VC_SHORT_DATA
(128) to prevent overreading the source, the destination buffer may be
smaller than 128 bytes. This is inconsistent with bulk_receive() which
does check buffer_size before copying. A VideoCore GPU sending a short
inline payload to a smaller destination buffer would cause a heap buffer
overflow in kernel memory.

Add a bounds check against buffer_size and truncate the copy length if
it exceeds the destination capacity, matching the defensive pattern used
in bulk_receive().

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 4772126d7..e18471930 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -368,12 +368,26 @@ static int inline_receive(struct vchiq_mmal_instance *instance,
 			  struct mmal_msg *msg,
 			  struct mmal_msg_context *msg_context)
 {
+	u32 payload_len = msg->u.buffer_from_host.payload_in_message;
+
+	/*
+	 * Ensure the payload fits within the destination buffer.
+	 * The caller already validates payload_len <= MMAL_VC_SHORT_DATA
+	 * against the source, but the destination buffer may be smaller.
+	 * bulk_receive() performs this check; inline_receive() must too.
+	 */
+	if (payload_len > msg_context->u.bulk.buffer->buffer_size) {
+		payload_len = msg_context->u.bulk.buffer->buffer_size;
+		pr_warn("inline_receive: payload truncated (%u > %lu)\n",
+			msg->u.buffer_from_host.payload_in_message,
+			msg_context->u.bulk.buffer->buffer_size);
+	}
+
 	memcpy(msg_context->u.bulk.buffer->buffer,
 	       msg->u.buffer_from_host.short_data,
-	       msg->u.buffer_from_host.payload_in_message);
+	       payload_len);
 
-	msg_context->u.bulk.buffer_used =
-	    msg->u.buffer_from_host.payload_in_message;
+	msg_context->u.bulk.buffer_used = payload_len;
 
 	return 0;
 }
-- 
2.43.0


