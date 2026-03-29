Return-Path: <linux-media+bounces-57492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FgGM17FyGnBqQUAu9opvQ
	(envelope-from <linux-media+bounces-57492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:23:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A17E350EE8
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 446923026587
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 06:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F263D2C027B;
	Sun, 29 Mar 2026 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFKg2Bkk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B284502F
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 06:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765379; cv=none; b=bgxT4asa79PNqKvl34hNunlHjrowRCxRoYL5Z+5PDNeEphyoBbjI2iyMZwVkPMC0fe21f0PQdXPcAo24EAUKYlG/lUhKzjcmanmn8hCv3Cm2ZjCvDqHd5aqtWb93FznETJOoxGv3PHtWqru2rOfoZtv6zG/VT30sqFGh0oK0lo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765379; c=relaxed/simple;
	bh=WTY2Bs+KWBi/xry+kQfHDmPb8Mrycu7xQELHKazIz0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m4rGnGNyGIrKpFQ/0RfhcnEkFaLbc2qer4DuU8lPcEBG19i8lQo30f7z44x9uu1d2vWynD8ZNyPaTExy0lKrg85KQJhUkR+0T6DQxZAFT1GZPUPjYsqdti0HWQ3YWsTRygOFXGaUxTsWFjGtR5ht4yRnC8jscjRoL2kRkduvYmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFKg2Bkk; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-950bcf4df06so987914241.2
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 23:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765377; x=1775370177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjxqXxyKEmiZIG77mggO3OoX/XZCUgPWLAbtN+CQczY=;
        b=gFKg2BkkoGkfk4zRVsj0ovI4XMQF6j0jpH64A88179VxCdtZtMUl0x49r+a4GIjWF8
         Tk1f/z8kPzylDtcG7dEEPvxhaIW9/fGu1i5u4puY9KT4JidOv606vhdL/+NLn74B2L9m
         az0TlXookYYCd3hIglEaMuhTIDvPlqhSd8H5XY1SSd4NFZkO2xDz6bJZatkxL/o0ieKW
         tgifOqzrxe4k7crRr7t969MBVjjjJAj/kvyG4TfQ+Bym8OywpGYlLF8PXSQ2GtGNa3Mo
         b4pSxpw5slohadpMXKy0++01majuaHljxoHerkbc7BD3Xo5T2y2i2RSD3zIGazlWRpSg
         mDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765377; x=1775370177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjxqXxyKEmiZIG77mggO3OoX/XZCUgPWLAbtN+CQczY=;
        b=rbdURlw40aMLOblC6/GZFLFm/F75hSIQLI+PrZ3EhCvzxlZsdP8V6CEe0hn11b+E8C
         C25i9PZ2AblTqbO/XCXHm/SYz41/rScDinF4HAfLXPOCyGTlvQdz8Rr+L0+21StmTmmF
         KMOoB/Mv7EwV6oFE/BTdpE9dXKx/glRKhDykCaKY3+pxz+4TRwzIpz3fYDzFXAT3RIVh
         5JKL2fzPRN01LzPZL0xvepnTyEpUwtMdSEuf7jGlLj8h+5y4U/ekgXD7so241evl9qu0
         cYA0YDvHTF8jXV4eaL5zdWIDEiAKwmmceh7WLJPsm0aa2+WnzzTmu/A2Xl7iRa4SSwla
         fi6w==
X-Forwarded-Encrypted: i=1; AJvYcCWkb7JkYq8ugf8asCbhHJaTK223RjByEyks0Auu9Jx0JnLSYHyPj4k5421tl3ecv4kCpPTvIbMAExNUUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5bSRzr7gaYMw85AXG9A2p/WuWNh/sZv+tGnIKGqxelP+2EfZD
	eyLGezZNDIlw3Yo7DmlVNxIyyZVrvhEeuzGNVr9Dr2DiYDFRj9JK5H3A
X-Gm-Gg: ATEYQzzzTls3o8Kdtgu6d3aIoLBgPCJboRZi1K5nTKVMPHMahyo6WUb3MBFIxBhzxEN
	9/Z+17z8f0TcTzZVsQN+bz1JDcWixGPKf2nnH1tNFyZBTczx+Exoh6ieDhHHqS41KRP4QLhdfTX
	XMihk0u3169G5dj/oj58fQF/tljqF+znErkKSN5mhjwh+m+t+Y+4B8Ts/rfLvbkiznf46OslW9T
	yojQ3TPM/otUmTNd3QyRsN7aFG9tW+WXLVVxuRfG/K+JxHWzJ7hsdQc24nGqqNdF3wR/Ur5HRCl
	cNmQ2uF9oHGM+cpXuazkjb2IZjnlXDF3p8+NNESYSZersddi4VX6smz6rnzhSieRett1wX3qbK7
	oiDyKdFojGqjxVUH+C3Z/N8BCg914xpYLCduEiMad6XyFy61rCg+rKGspB9YWcg8/XwXEOgKyRU
	xkTJwOKC6teKqBf4jVOMgt72mf
X-Received: by 2002:a05:6102:160c:b0:602:86a6:986a with SMTP id ada2fe7eead31-604f92f1d79mr2960909137.27.1774765377217;
        Sat, 28 Mar 2026 23:22:57 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:56 -0700 (PDT)
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
Subject: [PATCH 4/4] staging: vc04_services: vchiq-mmal: fix integer underflow in port_parameter_get()
Date: Sun, 29 Mar 2026 00:21:14 -0600
Message-ID: <20260329062229.493430-5-sebasjosue84@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,raspberrypi.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57492-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5A17E350EE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

port_parameter_get() subtracts 2 * sizeof(u32) from the GPU firmware's
reply size field to compute the parameter value size. The reply size is
a u32 provided by the VideoCore firmware. If the firmware returns a
size smaller than 8, the subtraction wraps around to a large value due
to unsigned integer underflow.

The underflowed size is then:
1) Used in a comparison that selects the wrong copy path
2) Stored back to the caller via *value_size, propagating a bogus
   size (up to ~4GB) to subsequent operations

Add a minimum size check before the subtraction and return -EPROTO if
the reply is malformed.

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 11af71309..914ab9215 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1436,6 +1436,10 @@ static int port_parameter_get(struct vchiq_mmal_instance *instance,
 	/* port_parameter_get_reply.size includes the header,
 	 * whilst *value_size doesn't.
 	 */
+	if (rmsg->u.port_parameter_get_reply.size < (2 * sizeof(u32))) {
+		ret = -EPROTO;
+		goto release_msg;
+	}
 	rmsg->u.port_parameter_get_reply.size -= (2 * sizeof(u32));
 
 	if (ret || rmsg->u.port_parameter_get_reply.size > *value_size) {
-- 
2.43.0


