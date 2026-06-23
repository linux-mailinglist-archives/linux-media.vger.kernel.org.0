Return-Path: <linux-media+bounces-65477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +VXcITCzOmoUEQgAu9opvQ
	(envelope-from <linux-media+bounces-65477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 18:24:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399A6B8B3E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 18:24:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cuoMDwgo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65477-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65477-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDDFC3048634
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 16:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D63C30FF27;
	Tue, 23 Jun 2026 16:24:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A8C283FDD
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 16:24:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231851; cv=none; b=BiPJuZlVkzuoYNOw3Sdx7F1aV2NrCQrdOZHuBZmgoAK/dE7E3wSe+Kbdl4E5Xqz58XsAE2nr1AgJFKF5T3+zqKA0zs5P4ttx+qIa8CJINCS9X7B+BkLTqAo+rOIjWzrERO4fj24Z7dAOzv5ehEGou9ddBY0fIj4FLlnL/ELOb/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231851; c=relaxed/simple;
	bh=/Tdk1jbBipddBJq0dmcz1nrqTIcVuxdkKR3kb4oIrlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fjoehEMmIUdQ0qcC+VM1gykTr/jVaWzLFFfKkm8F+N0ZsevZw9e76jH1HJqoDx7MBWYtKOScDvBQ+qcXJAry71ONhqbaTMtBZxdLwwP9MszBNuCqtXDdMqZZ0Q++ynMENEMHqyVpwBB2SXuQCc53NnkAlT1ajdP5/9JBnzWPvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuoMDwgo; arc=none smtp.client-ip=209.85.128.176
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7fdb04d774aso1527257b3.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 09:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782231850; x=1782836650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uDWVK0ltljA+nA6FKZl+j5AYOtbg0eIqj37dbUHyX5s=;
        b=cuoMDwgoLE3SuOtvB7C63FzTlYWMUw8SBaJ88DQx0eUqn5ulaJwZXfQ2p43hmJ/FlF
         OIGaPoRexoDCggNj5SM1t25H/TyK7pMLa5rDLUvInFQp/UtcYTT9pXCLdrVqzN1nJDef
         bwS1e2CK537HaO8R+YkGTk3v2g5qFg541BSfWCWy8cpZWI3FyThFbZZviZpmc5xh3M/u
         ne/X+okan/oPUau30ETngsg46eNXnuVwc2XeH1z0ELabt5jVZXu75i7BWqH/AIGhQoUX
         Vooy/AYzhJLjXi7OZcMnj3YExMrHGMxzS3usflZqSKxXm+na1e/LwOiDWekaILNY3iB6
         unSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231850; x=1782836650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDWVK0ltljA+nA6FKZl+j5AYOtbg0eIqj37dbUHyX5s=;
        b=VgJvGJaK/nsH4cNuZPw0MH8C4AOb3i5Y27wkbiZ/nB895LKkTXAkrOZOaU3nTVg7RS
         hoqONUP0racSF7rkup2y17ncl4oYNvrWvsMHlDRd53SA7rf1Va9TGIbkXvoqtQujamof
         p4R5LtZzyq7UixPRySWjKA9PAS9QxzUWLyRtcJXQAgrP5QTCG7FUlpwXx24HI/k5fxg/
         GXWn3h1g8FlcBlH+K9FGkDvI+v0Qd/YWC34cKQ/1XJ/NIlovW+G4guDNVsnZA6X4wlRK
         Apz4uVu/0wNB9rYIN1K3pQErylHcewQTuatAEFJJIM56lpLO9TZasv9R0mNxpwrIIJUJ
         yUTw==
X-Gm-Message-State: AOJu0YzYRP/gov7x8n7W+u68PFK8G7lx86TPsdE6XxK17sz71HAoSBRu
	MBnZVGdVtLmdqzaSep/H7a+RPeaR9LyvWyWT5URCfWaLYLmcXR0uL+/Kn6dq53KBOxM=
X-Gm-Gg: AfdE7cng1FhJPb0AkVWIetCHsrciQKjqL3nj3bSbNgma6jIZOpJ95xquLYn4/T2sZYU
	7PTtctS9UwYeJToqsltZKdZksjRGAJaU44zrXuCwxvkltUU1hvn5UImqpBJIIO0zBblgaXXKCon
	eAApjej6MQQ0hxfiPhrq3XhD0zWdwWI1gnTD9sGgQ5PKotyv66uH69xZUYp71mY1/KyDuklx3kO
	8i1P9983ciRTlwT3BxWuiDT39WWDDz83vSrBcO8i8Zn6vvrjh5wtpw8xCPxiHrGayJ3YZdVSKrz
	I4tSOE8ztp7bCnfd5lERoVMAby3Vgbu52rkNLNhU4yAs3RbzPnzbBktFptPVEpa/o6LHc1rvzAq
	+g0bAzfa1d9pOl/XQodjTunB89I7+JoPSeRuTr8c7Q0NzJoXSeZZs0ztDDnlt5PHaJXRjXm2CBO
	pRz2E2CirNRfLyUvDDZ3mZ
X-Received: by 2002:a05:690c:4907:b0:7d0:79f:339f with SMTP id 00721157ae682-80266163efdmr178245337b3.34.1782231849415;
        Tue, 23 Jun 2026 09:24:09 -0700 (PDT)
Received: from cachyostemp ([2409:40f2:1188:3b98:dbb2:9405:9ae2:4b4f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025f9d7df6sm47722617b3.32.2026.06.23.09.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:24:08 -0700 (PDT)
From: saivishnu725 <saivishnu725@gmail.com>
To: linux-media@vger.kernel.org
Cc: saivishnu725 <saivishnu725@gmail.com>
Subject: [PATCH] v4l2-sysfs-path: Add missing help text
Date: Tue, 23 Jun 2026 21:54:03 +0530
Message-ID: <20260623162403.21641-1-saivishnu725@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65477-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[saivishnu725@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:saivishnu725@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[saivishnu725@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2399A6B8B3E

Add a program description to the help output.
The description matches the existing README documentation
to keep the documentation consistent.

Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
---
 utils/v4l2-sysfs-path/v4l2-sysfs-path.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/v4l2-sysfs-path/v4l2-sysfs-path.c b/utils/v4l2-sysfs-path/v4l2-sysfs-path.c
index d1ad7edb..70da5353 100644
--- a/utils/v4l2-sysfs-path/v4l2-sysfs-path.c
+++ b/utils/v4l2-sysfs-path/v4l2-sysfs-path.c
@@ -30,6 +30,8 @@
 
 const char *argp_program_version = "v4l2-sysfs-path version " V4L_UTILS_VERSION;
 const char *argp_program_bug_address = "Mauro Carvalho Chehab <mchehab@kernel.org>";
+static const char doc[] = "Tool to show relationships between V4L2 video devices \
+and other related devices belonging to the same physical device by parsing the sysfs tree.";
 
 static const struct argp_option options[] = {
 	{"device", 'd', 0, 0, "use alternative device show mode", 0},
@@ -53,6 +55,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 static struct argp argp = {
 	.options = options,
 	.parser = parse_opt,
+	.doc = doc
 };
 
 static void print_all_associated_devices(void *md, const char *vid,
-- 
2.54.0


