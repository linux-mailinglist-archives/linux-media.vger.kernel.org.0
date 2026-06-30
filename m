Return-Path: <linux-media+bounces-66074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xeQDI7eoQ2q3eQoAu9opvQ
	(envelope-from <linux-media+bounces-66074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 13:29:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E578F6E39B0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 13:29:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p60JLV1m;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66074-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66074-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D105E31CE54A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F87740682C;
	Tue, 30 Jun 2026 10:53:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B87401A13
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 10:53:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816800; cv=none; b=YNQnzQcne4cwZYyDPdhqLAeoQnKmUkxKmsuqZs8oKUWn52S7z58XDxHVAZC/LDXj1bShLeD2w/iPbcI8T7H3QxP1Ap7AcfQm2Tew//DC9XS1cysWI12o26QSUIh0M+mXGNG48y1EX5rO10a2EiZ+NJjEp/18WPNHE6Se3hNiFpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816800; c=relaxed/simple;
	bh=HrRniLGJXH9SLAdJIe9nPLqZuU4MY14Yod0V4qGNKiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIGBOy5KOe4kMkFKWweBV9REMd3m7PktqdC5lgtmzb0kp8V5rDExEoELllhFCLR6mAY/lCBLNtM5wefdzpI5mkYX2Jf3ZTs/V4v3CDENf+Ww2zpf2t4Fn5zl0D+EXmI5nbRQNPU+QRa3Y2PbiKem5tKBDsqc2/rT7IDaj9GyR14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p60JLV1m; arc=none smtp.client-ip=209.85.128.181
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8000e21f014so48303627b3.2
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 03:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816792; x=1783421592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/IRRV0LOClXSgOKUGMPe3argWggz8VbSg5fByXQ120=;
        b=p60JLV1moMELyceYaFL0kV5CCIshTCWer7VIKFwO7dmnv4hwqc6L2dsW4pqQdxbg84
         oipKKO0Qmif/5eioZBIJWe5dQtUHYXTYxwODNxB4QTA+eTBlvgp1YIJBv+8VNszmRclY
         CADyMaibLidfUawV1ZfzDHZZbeMX3OmQGzkeEYfu1rpO4N4m9ar8b8RPZ0vaYQi3deB4
         PbHGdYHobJYIJucXqS1oRVvgl8CcefjC658fq94ODVZyI8SYRE4d3YexHKHaNi5sieLc
         CkU2+CFW0W+L8AplU/qs11QQjM77sgY/OL4Ra0KRftWdTcEAVTlSKFjs0lq3f/iTpOQW
         UTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816792; x=1783421592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/IRRV0LOClXSgOKUGMPe3argWggz8VbSg5fByXQ120=;
        b=DpxX+wKNuRzezR33M44UQAPYG/tgxc58CLB0Hy8m6+mU+cHB6Evd4F8gbCmwfRPFWD
         CsRHo8OS6lboGvqsU1C8rSc8swKbUTE0WDSL4n5fMvRU5zugA2s7aKvg0BMl5KYcyF3e
         uy9yxxG0mC4rukosFpyseu3TLgo+AwQHCJx9QgUhAPbaNX4YF+8KTYaFS20sOyOUimrv
         cy4mJtRDuCg90ULiNpO4ofohYvwmSAHsKVtRVU52U8GosoM828xQSeEWijHAc5RCSjHx
         NMkcTBm1WEDfU6C9YL7oh22m+ZQYWErpK7RT04WSZwvHJE8G104Lc4bilrXxMGLiNYrK
         ugnw==
X-Forwarded-Encrypted: i=1; AHgh+RoileifmFhqfaLKyhsZDB9ykVkAwfSB3udmxyqHcz187eM3ZisPj2J7vaTPz5yVg7nXZ0I2ewHY1aOV3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOwoFkfIUa/1eTlPu5js1Y/LRNPnPDsl46mSoh/EZhkQ0D6pUm
	4weEqhkKZ8ueemYNHHrQ9cmWI+jqYTPBrfpfXLuIPC4EGxFXSoauN6qf
X-Gm-Gg: AfdE7cnfZsUCwew+nUQD5nlf7t5sy9IBFGGykfAgLJafB+Hht0BRRtIIolw/5mscRZe
	tBCEXG5O4W1GAkWrV2pDrBtGN+8ia/YwTnzf40pjrY8LT2sbb8ckK8j2hSsiMKc+8vXP6pFVmhU
	xC8L3VG1I6kBBjqo2xPJV2DDBD8Yw1GStu0r9J+hPrg67LAtR6yBuGK7veGdB1ewphZTrTrLlHx
	Gc3Jpa8RJovCkeWIFaEOlEvN2XXhsw6N7ZX/tOhCP9xk488NhWKCDogQIRBVQD9Cm3Cvv09gbYd
	5z3qwoRUwu+71zp7QQM40lNddAvlOktQ4gzKdT8C09v+ZMkDSW7dmCNC1M2QXqv1Feg3z+d4chZ
	O7x20jRtyx9nLvQBPVyv9yVC5W36fXWSjWXcmzUhDtLb6s5vUzDKTDOM8S/7IhEYp7cpWxrf/Ix
	Gzv1nCCPSVVvk2ugAKa/LGAtvSQw==
X-Received: by 2002:a05:690c:4a09:b0:80c:fed7:9cab with SMTP id 00721157ae682-810d7fd9444mr33711557b3.10.1782816792554;
        Tue, 30 Jun 2026 03:53:12 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-810ea95254dsm9101137b3.46.2026.06.30.03.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:53:12 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] media: go7007: avoid undefined shifts in MPEG-4 headers
Date: Tue, 30 Jun 2026 12:52:57 +0200
Message-ID: <20260630105257.54757-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66074-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E578F6E39B0

The byte-alignment paths can call CODE_ADD() with a zero bit
length.  The macro then shifts an int by name.b, which can be 32
after the preceding bit was flushed.

vti_bitlen() can likewise shift a signed int into its sign bit while
searching for the bit length, and the package mask construction can
shift by the full type width.

Make zero-length additions a no-op, derive the bit length with fls(),
and build the mask with GENMASK().

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/media/usb/go7007/go7007-fw.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-fw.c b/drivers/media/usb/go7007/go7007-fw.c
index 86ce593e0c54..8cf959c20e30 100644
--- a/drivers/media/usb/go7007/go7007-fw.c
+++ b/drivers/media/usb/go7007/go7007-fw.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/bitops.h>
 #include <linux/time.h>
 #include <linux/mm.h>
 #include <linux/device.h>
@@ -58,14 +59,16 @@ struct code_gen {
 #define CODE_GEN(name, dest) struct code_gen name = { dest, 0, 32, 0 }
 
 #define CODE_ADD(name, val, length) do { \
-	name.b -= (length); \
-	name.a |= (val) << name.b; \
-	while (name.b <= 24) { \
-		*name.p = name.a >> 24; \
-		++name.p; \
-		name.a <<= 8; \
-		name.b += 8; \
-		name.len += 8; \
+	if (length) { \
+		name.b -= (length); \
+		name.a |= (val) << name.b; \
+		while (name.b <= 24) { \
+			*name.p = name.a >> 24; \
+			++name.p; \
+			name.a <<= 8; \
+			name.b += 8; \
+			name.len += 8; \
+		} \
 	} \
 } while (0)
 
@@ -707,11 +710,10 @@ static int gen_mpeg1hdr_to_package(struct go7007 *go,
 
 static int vti_bitlen(struct go7007 *go)
 {
-	unsigned int i, max_time_incr = go->sensor_framerate / go->fps_scale;
+	unsigned int max_time_incr = go->sensor_framerate / go->fps_scale;
+	int bitlen = fls(max_time_incr);
 
-	for (i = 31; (max_time_incr & ((1 << i) - 1)) == max_time_incr; --i)
-		;
-	return i + 1;
+	return bitlen ?: 1;
 }
 
 static int mpeg4_frame_header(struct go7007 *go, unsigned char *buf,
@@ -1209,7 +1211,7 @@ static int seqhead_to_package(struct go7007 *go, __le16 *code, int space,
 		0xbf08,		fps,
 		0xbf09,		0,
 		0xbff2,		vop_time_increment_bitlength,
-		0xbff3,		(1 << vop_time_increment_bitlength) - 1,
+		0xbff3,		GENMASK(vop_time_increment_bitlength - 1, 0),
 		0xbfe6,		0,
 		0xbfe7,		(fps / 1000) << 8,
 		0,		0,
-- 
2.54.0


