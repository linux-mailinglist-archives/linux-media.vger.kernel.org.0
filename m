Return-Path: <linux-media+bounces-64260-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5rzoHaqlJ2qE0AIAu9opvQ
	(envelope-from <linux-media+bounces-64260-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 07:33:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5665C75E
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 07:33:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kiKLuq9S;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64260-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64260-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D0C73018BCB
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 05:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26713C4553;
	Tue,  9 Jun 2026 05:32:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE30D33F597
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 05:32:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983158; cv=none; b=jYFQfE6qi/ecfdGgqI2C96Rz2hIv9WRCSVyH+nUQeSIcuUcKq2X+dp0AoaKqpK/jkONgiBPWIhKlf2vFC6GPHrigL69focvqZqk8Z0BZCCjqz5DVSsWdGaqt4E6a6oWi6Y2kEjCBxl3oZHPQtsWPUxP1evS+IIrO46UpvvXu5cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983158; c=relaxed/simple;
	bh=35gDjdmqsR7jXpjDEeoZ07B3PvW2qd7CDguv1yQuW5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=stWUS+zZdTxDIYc5UWMJY8f2XhflAPhSbBG0qHNNpCgLXrRCF9KFneb/KWRnHBgKhKJp7viipTda7YmFXVS8n/nijmYe9EJJm2rm9xWVWAj16/vI3bhkb9OmZaqrTpHN3ZwOsV85bKOIjDjARQHAn6hu/IGmwU1U2ar9pLODPgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiKLuq9S; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso41792785e9.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 22:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780983155; x=1781587955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb4Y81myTRhfZM02Lh/xiHfbbKBLaxr1bVcI9SRV4mw=;
        b=kiKLuq9StChh9vB0KTWT6PqScj5yK/Kp3Y6WsNXeCpMNJBsZxkpkyQ58AnqSmraKaC
         8Qmg8po+R4dOCaYIThP3qflD2n7pVY5jJSIx1e6oiR2Rz4RsO1bHCtTQ0C4pwZacDHSR
         rE2OFqbjaJfDg8c3u9U6SmST8IpbxB2EyO+QR9UYvc7daGN+r2XA48lOTQG5oBnORxRz
         eIkj8brjkNXme9dKE2yCH7J8DOUjJVd6UDTw1+XEyfIa37y4EfjOsQo7cp4F9hscdeWa
         zT8E24OHGqIQF+KD0GJ4o0UHcsgB/SgkCdWTwdtnhVOFPIMnX217dg9ignrD1v11V+qf
         5G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780983155; x=1781587955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eb4Y81myTRhfZM02Lh/xiHfbbKBLaxr1bVcI9SRV4mw=;
        b=rmEJ5KcIBdcizSvUhqld+4p8MB+4YKOqn6lrjFryqXbHTzHWrBIvx2XsOlD49Fdk5N
         XXQl0T+DwcSxAI6ZrWI4ZC93Aey/SE2sEw4ElT1MjwUuGKtZG07YfH+BFPiEJqCPuXCs
         8uQ62scerCdeweng4vc54qD0MLMfxkxYn5TzIME/JC5UhWphAmEcsp2RKBQVsumMh41I
         RrbkEzK4GCPD/hXnbhhNOkHK0234HNP4vncP2qEa5CPSxMd0ce+y3W0obyvZyppbgBz9
         SJU3swz5Ty00fdIV6B4+oFMAIOJs+Nd63/i2XUJt0RT0hVYqld7nvAGBcQNoG0DOL6cE
         UcQA==
X-Forwarded-Encrypted: i=1; AFNElJ9L32+Awg8p0ryQx+bEx2B2YDJiMqRAFr18PM55FpyhpR0pkmlfZ/OC8Wm03ZD7OgvOO+w6NJ9LCKSOMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd0YoJR8/Bn/IJyrjuws8FtFoguKXbohx9Sck5WLFFp0xrE1BI
	EjYkB8E/x0rQA8i0FnNZIWC7lx+Ha15aZsWdT5B2KtwMqXJPl70F1i2M
X-Gm-Gg: Acq92OE0BlsXc1OZdRtwh9UaaN92a8+OlXg/g8cx29cKeOqeG5V5f6cxM3ZUbLo86x7
	qgJ60TJSHj7M/8aGwO7fqrnp5LxeFOgLPtDwJ+FBwvJDNSRQ8c8Ok+Z156umWt/8CAIwZrp8ugy
	kxc195ssyI7QlSQJKveAi4Jm6m2Q0II899Rnhf+JQ5GYLnPP8/wfA3zQ+MOIMyGvumAQ1vFjWNC
	PYE35Ot//q2Hv/Rf85Ja39tVtmiJerEa088i4ZGLtTxGzFg02wpjIASxdApviZ6P41ESxq3UWvy
	fpC9INZr9aJlO+XvBCXmBfz1pYZPrMIxSK4UjE/s1c3hzJUFJA5YDzdttcDHPeOHnYn6QQlNXbT
	gqjbqzBVeBdwzKZxf8AKKhjr3ex4arvCbP69UsOZwsap+K1fQRq7gOW05aEPU6Ig7C2nfCvBUu7
	Ed8u0fSxYa18AW0sSOj1253ntun8kh8c2l6LZhnjF7QHljCEYKwUqHZ6fEQBUXawvvittrmh73C
	647t8TgRIJ64e5CNEmR0Mgyovxjfii2
X-Received: by 2002:a05:600c:4ec7:b0:490:b8ee:d6a5 with SMTP id 5b1f17b1804b1-490c2589927mr303859555e9.6.1780983154876;
        Mon, 08 Jun 2026 22:32:34 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35133csm56677372f8f.25.2026.06.08.22.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 22:32:33 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mali-c55: Fix AEXP IHIST disable bit shift
Date: Tue,  9 Jun 2026 06:32:31 +0100
Message-ID: <20260609053231.24855-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64260-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devnexen@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65F5665C75E

The post-Iridix auto-exposure histogram disable bit in
MALI_C55_REG_METERING_CONFIG is bit 16, but MALI_C55_AEXP_IHIST_DISABLE
was defined with a shift of 12, copied from the AEXP_HIST definition
above it. As the value is masked with the BIT(16) disable mask when it
is programmed, the result is always zero and the disable bit is never
set. The IHIST can therefore never be disabled, neither at ISP init nor
via a parameters block flagged V4L2_ISP_PARAMS_FL_BLOCK_DISABLE, and the
hardware keeps producing histogram statistics that userspace believes
are switched off.

Use a shift of 16 so the disable request takes effect.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-registers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
index f098effde..4cd13b702 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
@@ -173,7 +173,7 @@ enum mali_c55_interrupts {
 #define MALI_C55_AEXP_HIST_SWITCH_MASK			GENMASK(14, 13)
 #define MALI_C55_AEXP_HIST_SWITCH(x)			((x) << 13)
 #define MALI_C55_AEXP_IHIST_DISABLE_MASK		BIT(16)
-#define MALI_C55_AEXP_IHIST_DISABLE			(0x01 << 12)
+#define MALI_C55_AEXP_IHIST_DISABLE			(0x01 << 16)
 #define MALI_C55_AEXP_SRC_MASK				BIT(24)
 
 #define MALI_C55_REG_TPG_CH0				0x18ed8
-- 
2.53.0


