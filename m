Return-Path: <linux-media+bounces-57497-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDBkCf/RyGnprAUAu9opvQ
	(envelope-from <linux-media+bounces-57497-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:17:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74218351017
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCAA4301DCFB
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 07:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CB52C3266;
	Sun, 29 Mar 2026 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTa/AzPN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD70C263F44
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768597; cv=none; b=FCBwiWF2MkpZoMvA9ccPONl9yIvMiBE3Qzdm5H6MonyhZA43Uv39xMzOe84qMTyHze8f1SMKzyTbuMT2smAv5Lf9F+p8bQ/+bUAF8Xnil1twt0rK2Khts6J4qjjZruRQi39MjsJBTfN9qN90JLKpxVm5kOG2KqrzWZoQZjJ3xNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768597; c=relaxed/simple;
	bh=SJRE/7KRsudcGVRZrVRgBTRMuVolyj6lhYLA9kgm5S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YobhKsZSgYBzFnw2OOwAKxYP7YdVaEmTObWcaJtRYzBnU/aQcq5L4fNcyHYiSGmDV3t3EwOsQUq3mBBMnINFdfAYCEdf9WINgOCPLNo4UeKSSqVeIxy4+z/xm80jywOJZ7S1tsNqrlGYJsqJ1mcTRWkfycC577XnmwitM0jaJKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTa/AzPN; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9539b80db32so171806241.2
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768595; x=1775373395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toe9kpqOLmbJqv5wMH+Pbc9jMDhi/6HRl6vvRfImJyA=;
        b=aTa/AzPNvz4oTqfq77vO42fWz75vvM/dBJkvK44J+foqV9a+7r1je5kW58Y5heK3St
         f0soMZWVqgHB8/a+UAOE/+CT3GmH6osLrNMUAfb1/TUQXeSRkYZlItOslntl2v3TmpeX
         wV3x194TDnIM6WKgy27YuEISyBIhvmccRLswncn4qBYbbqmUzGuP0Thrj1lK0uQe7uWB
         hdZXdTb6j9inUZQf1Zr48Ydmej4VL7kN7TP6JU8S2VdTWPZJAWVATgixOGGbrgHGtTEo
         TeyyztFpjl5DbUH3/DH31muR+nFJNk2Dr9ZP+Z95Aaw3ASv1mwx5q1JN56+QFzW1c0Qj
         /DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768595; x=1775373395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=toe9kpqOLmbJqv5wMH+Pbc9jMDhi/6HRl6vvRfImJyA=;
        b=qUhqRG8SVVALtJmuhT1S7cpcIWaAlvkcR43LkKXTaKw1chxEzOOOfxocSgtsibd9Qd
         wBC8Mjxueogd1bfpaXwyRFN7b6F9xkZ+/6sXk+gd0FjBHHISMbYDO4TKb02nFsWzzgIc
         OK2Uw0ZMZr2WgQyluNmSG+zDjs4InUAWzoqE3tw7wo/O4IcormMcQUfleeJcr40CAn6O
         g+slNWdziFQvR+gws+WbVu7f1Vj8RsBBfCSCx8qkZ3g7wLXv/oGeud5SqS7SoQjcthcq
         J6xgkpt2FxSA0bvhSNiXF78PCNjk6RtI5YtrK4WGBqshM3oUSm/1zFhikpsG1C7tH0ze
         IaVg==
X-Forwarded-Encrypted: i=1; AJvYcCWEXPfprogX50hfhqK9lE4bU4zwQWmKrzFA380In46dI8K0xQCQEFGwMrzdJdmNxD9YnT8lajh2qd8Q9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXGLW9VuABTaZy7Hdu05Rtmach46MRGYHkke6fG3AIDe3vKUYU
	oedxHc8Upispc107OIKcwWi/+Y/ffZJ3KXmOhJvXhN3SDino0qLPcQ6sdmt14rkSI5PoSQ==
X-Gm-Gg: ATEYQzwuTnjqM/+Zx0QbdyCt42baTZdHa0Myj28oGrLN4RnZba40hWV3FH/AxAUV/TP
	8EjWH1eMb6rxozEX5JoIX9aTavcHv1zWHJaBviDwipvaaRs5N0Nzwmxpjb0ip5a6ZiBeU5ZgyYS
	w+jdg8S1PCRu5cIO+nv/76TFCuzrcWXOflyM60lx8PnN0GrPT6iAi7HZJUQIzc2yIRLjmCxnRhT
	1g++TcpVtjDNipMMrAhxCjaAN+q1BQb6Rvb6g+0UO0y1JPqrVd0kT7wSXSHX1tDeMvArXrbav0G
	KuRZM102wSBJ9GtdPZuXOhv4y7NiZ5ojXINclySWUdwyNUmeTsV9T0vCAc0SWr5mNNd3/owup+z
	weJV5gE+YO/bLcdXagloKzPu8ugKF0L1rsc+nYEsnbvmhvreqI1y0rwrz2e09cjKel5mY8wteq4
	nptI4oD8YnQofqr+/++UEN3nJw
X-Received: by 2002:a67:e111:0:b0:5ff:2426:94ed with SMTP id ada2fe7eead31-604f92960edmr3008410137.28.1774768594732;
        Sun, 29 Mar 2026 00:16:34 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:34 -0700 (PDT)
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
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] staging: vc04_services: vchiq-mmal: add buffer size check in inline_receive()
Date: Sun, 29 Mar 2026 01:15:40 -0600
Message-ID: <20260329071616.507876-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329071616.507876-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,raspberrypi.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57497-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74218351017
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
does check buffer_size before copying.

Add a bounds check against buffer_size and truncate the copy length if
it exceeds the destination capacity, matching the defensive pattern used
in bulk_receive(). Use pr_warn_ratelimited() for the truncation warning.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 9c6533f82..44e5246f1 100644
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
+		pr_warn_ratelimited("inline_receive: payload truncated (%u > %lu)\n",
+				    msg->u.buffer_from_host.payload_in_message,
+				    msg_context->u.bulk.buffer->buffer_size);
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


