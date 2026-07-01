Return-Path: <linux-media+bounces-66189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Z/3C0XlRGr82goAu9opvQ
	(envelope-from <linux-media+bounces-66189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 12:00:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 737876EBD25
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 12:00:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KVdNLSx5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66189-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66189-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AAF430DE251
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 09:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBE03FD96E;
	Wed,  1 Jul 2026 09:56:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732A12DA749
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 09:56:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899816; cv=none; b=KAuptc0A1LNZn6OdwhduevXwmaM2FJcJwDcZTgKrindXUucG6C65B9RjQfSJCot0rs8rHwWqjM9zPqlZnFDzBIqj3MOXvSIVwjZ3VwX3d2FJJ3xILzCTmd8Lv7GASysiz6GChyF+ed/dYadM67q8gGLjZKyJcTw2tCWebxTZOLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899816; c=relaxed/simple;
	bh=t+bn4ARU2qsMhkC59ArW5TPuhnPJNCnn3jR8GSf3inU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NR1lMJsT7SfIa35mMsUf4zBQV2e3TUzRqr9QwbIAzkWuKzkELvOPf9BuNm5iYRUhbX/hOkNb6oV3T7+yOH6IJczvADky0ZhYJ2mMHUfqzyBFPHsh5XfHHRzwx2je9naXs3NAAk9ECNBXVP2TMvve6bMywmSWu2b3dbSJAZwYUx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVdNLSx5; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84592b55832so212381b3a.3
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899815; x=1783504615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vEdEK80Jd1yG0lDF+zMo8x4TdBxEhk7qOVWqvNZnFM=;
        b=KVdNLSx5tFk3BnjW7SU63F5wP1jHThzO8r6e5vDrvJP84wmZPzGEVgGVxmeX5MhcP6
         O5yPznjfoRRTTMHn1F7idApQISz3E7Y4MuahCTmEtVc6f834E9XezTPoGETFOZQgSYfn
         tHdgAwCkai7pzC2KJ8CidYxayRaAURd2pgvHclx3700uoounvGk/Qz5V4DNYgMTl3hFc
         E3TtkbX3NnRTbU1uF3A+fjlqbJagfwVk4jw9nUtSuU1RakK5gwJpXnmcL/qeQGw8lsWR
         kI5Rtv80BDnSjHRHHkM5+6qUfS2Px0XO+sgjWpjdZSrTLvo6hpcBUr7uhAJQrgpRpb9z
         RLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899815; x=1783504615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vEdEK80Jd1yG0lDF+zMo8x4TdBxEhk7qOVWqvNZnFM=;
        b=cGDI9zdEJII96kqZdLmMLxfTCgvyrrTymmyuHgSwDG7YdKUf6t6sX0SKUqlSqDJPhb
         dA16gCS70HLZ1q+nNbeNnaIIQ4XNcRMKRmP46qL4lLSGAS7urDpN0Zt3a9nXxjspGtcn
         2lh7H1MZDFhUWUAqWjsp5PycEQMgmzVzuk+FF/5hrlPHwG5NJR6x6QtiacDLem/PTSIG
         jxo73qNZ0fgIul5eaXKln9t2PgLaCPkSZ1qPhiG2HPUF7ewWSiNZ6X4DoZkwHTSLRcF6
         zxG5UODHGYRhqsF2fBv6jfZr4oEw51RjYQgEyD1j7UAj4pR3Xy01pjEmB3tE9dVeaDPd
         zevg==
X-Forwarded-Encrypted: i=1; AFNElJ8WbZID1ddn1vNV+TcNjXLF13f1c5/A4iMSax+jxAy6MUj3hxl14v1MVezLWgmmnOwuUvQNHJyiOtWodw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+9xdFO3DlcIcBvQQw2qut0ozIHbF99C50mFPbA8uD0XUYUx/7
	bKYn3dgq57Hzm8y8aUolMbAdK4HrwilRJqTv5TOIlSwF0xYhOHZP6Chx
X-Gm-Gg: AfdE7clkoQOGMZiWCNXiALmQBbtX4H3UrJTQDnmGmLxCc95OM8s04i7g0nfz84/OwWz
	Fwxxk7UATTtYkmL+2YK2d3D4hjJWM0N0eNHmVUzLtnkD95d1qVNQzUZmyDM6NCVcilUBW+GvgiN
	Mt6Tlfzl2+6jHczXsyBrM+wqO0kH/I6h9SLPuHdELwxzSW7OQed5Ba/pkMjT2D9aeoIFiEJQHle
	qqJAJA/uW9hi/2kGcpsq54Yrqxvfajhf/EUvl0j0WE8pz5VsTpshaCG2aZGI6+piZjRIpT3IRZ1
	r+WXr4o0D/woDIvBDolAUtot3iF+UJbAEbwOGqmpneXc7WWhpNUKLFX1AG8ZdSsKW+rIn+XB+oE
	jaRc+luo8wvNwmBFec5+2+IxDgo0Xazsi7YFg+GFVl7Fz0iGRHgQ/NR8wd1OmHWnCEH6/h0D1kz
	rYldkVn9HJkffkGzYUvmrN4XeZR5NLdAvdhYkPIA==
X-Received: by 2002:a05:6a00:4f86:b0:847:997b:1182 with SMTP id d2e1a72fcca58-847c099b200mr875743b3a.59.1782899814636;
        Wed, 01 Jul 2026 02:56:54 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479ff8c62asm3756542b3a.12.2026.07.01.02.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:56:53 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dib9000: bound the mailbox reply length in dib9000_mbx_get_message_attr
Date: Wed,  1 Jul 2026 17:56:49 +0800
Message-Id: <20260701095649.1629460-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-66189-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 737876EBD25

dib9000_mbx_get_message_attr() copies a mailbox reply into the caller
buffer with a length the demod controls:

	*size = (*block & 0xff) - 1;
	memcpy(msg, block + 1, (*size) * 2);

*block is a cached mailbox word whose low byte comes from the DiB9000 demod
over I2C. *size is a u8. A low byte of 0 wraps to 255, so the memcpy runs
510 bytes. The callers pass small fixed stack buffers. check_version()
passes a u8 r[4] and the APB helpers a u16 mb[10], with no check. fw_init()
has a check but runs it after the copy. check_version() runs on the
firmware boot path, so a normal frontend bring-up reaches it.

dib9000_mbx_get_message_attr() now takes the buffer size in words and
rejects an oversized reply. Each caller passes its buffer size.

Fixes: dd316c6bacc2 ("[media] DIB9000: initial support added")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/media/dvb-frontends/dib9000.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib9000.c b/drivers/media/dvb-frontends/dib9000.c
index cb7c943225bd3..19c1853e6af2d 100644
--- a/drivers/media/dvb-frontends/dib9000.c
+++ b/drivers/media/dvb-frontends/dib9000.c
@@ -390,7 +390,7 @@ static inline int dib9000_write_word_attr(struct dib9000_state *state, u16 reg,
 #define dib9000_write16_noinc_attr(state, reg, buf, len, attribute) dib9000_write16_attr(state, reg, buf, len, DATA_BUS_ACCESS_MODE_NO_ADDRESS_INCREMENT | (attribute))
 
 #define dib9000_mbx_send(state, id, data, len) dib9000_mbx_send_attr(state, id, data, len, 0)
-#define dib9000_mbx_get_message(state, id, msg, len) dib9000_mbx_get_message_attr(state, id, msg, len, 0)
+#define dib9000_mbx_get_message(state, id, msg, len, words) dib9000_mbx_get_message_attr(state, id, msg, len, words, 0)
 
 #define MAC_IRQ      (1 << 1)
 #define IRQ_POL_MSK  (1 << 4)
@@ -725,7 +725,7 @@ static int dib9000_mbx_process(struct dib9000_state *state, u16 attr)
 	return ret;
 }
 
-static int dib9000_mbx_get_message_attr(struct dib9000_state *state, u16 id, u16 * msg, u8 * size, u16 attr)
+static int dib9000_mbx_get_message_attr(struct dib9000_state *state, u16 id, u16 *msg, u8 *size, u16 msg_words, u16 attr)
 {
 	u8 i;
 	u16 *block;
@@ -738,6 +738,10 @@ static int dib9000_mbx_get_message_attr(struct dib9000_state *state, u16 id, u16
 			block = state->platform.risc.message_cache[i];
 			if ((*block >> 8) == id) {
 				*size = (*block & 0xff) - 1;
+				if (*size > msg_words) {
+					*block = 0;
+					return -1;
+				}
 				memcpy(msg, block + 1, (*size) * 2);
 				*block = 0;	/* free the block */
 				i = 0;	/* signal that we found a message */
@@ -770,7 +774,7 @@ static int dib9000_risc_check_version(struct dib9000_state *state)
 	if (dib9000_mbx_send(state, OUT_MSG_REQ_VERSION, &fw_version, 1) != 0)
 		return -EIO;
 
-	if (dib9000_mbx_get_message(state, IN_MSG_VERSION, (u16 *) r, &size) < 0)
+	if (dib9000_mbx_get_message(state, IN_MSG_VERSION, (u16 *) r, &size, sizeof(r) / sizeof(u16)) < 0)
 		return -EIO;
 
 	fw_version = (r[0] << 8) | r[1];
@@ -1022,7 +1026,7 @@ static int dib9000_risc_apb_access_read(struct dib9000_state *state, u32 address
 	mb[0] = (u16) address;
 	mb[1] = len / 2;
 	dib9000_mbx_send_attr(state, OUT_MSG_BRIDGE_APB_R, mb, 2, attribute);
-	switch (dib9000_mbx_get_message_attr(state, IN_MSG_END_BRIDGE_APB_RW, mb, &s, attribute)) {
+	switch (dib9000_mbx_get_message_attr(state, IN_MSG_END_BRIDGE_APB_RW, mb, &s, ARRAY_SIZE(mb), attribute)) {
 	case 1:
 		s--;
 		for (i = 0; i < s; i++) {
@@ -1056,7 +1060,7 @@ static int dib9000_risc_apb_access_write(struct dib9000_state *state, u32 addres
 		mb[1 + len / 2] = b[len - 1] << 8;
 
 	dib9000_mbx_send_attr(state, OUT_MSG_BRIDGE_APB_W, mb, (3 + len) / 2, attribute);
-	return dib9000_mbx_get_message_attr(state, IN_MSG_END_BRIDGE_APB_RW, mb, &s, attribute) == 1 ? 0 : -EINVAL;
+	return dib9000_mbx_get_message_attr(state, IN_MSG_END_BRIDGE_APB_RW, mb, &s, ARRAY_SIZE(mb), attribute) == 1 ? 0 : -EINVAL;
 }
 
 static int dib9000_fw_memmbx_sync(struct dib9000_state *state, u8 i)
@@ -1135,7 +1139,7 @@ static int dib9000_fw_init(struct dib9000_state *state)
 	if (dib9000_mbx_send(state, OUT_MSG_FE_FW_DL, NULL, 0) != 0)
 		return -EIO;
 
-	if (dib9000_mbx_get_message(state, IN_MSG_FE_FW_DL_DONE, b, &size) < 0)
+	if (dib9000_mbx_get_message(state, IN_MSG_FE_FW_DL_DONE, b, &size, ARRAY_SIZE(b)) < 0)
 		return -EIO;
 
 	if (size > ARRAY_SIZE(b)) {
-- 
2.34.1


