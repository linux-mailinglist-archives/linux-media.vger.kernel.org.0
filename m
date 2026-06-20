Return-Path: <linux-media+bounces-65303-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PQKeFKcpNmoS8QYAu9opvQ
	(envelope-from <linux-media+bounces-65303-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 07:48:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7226A860B
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 07:48:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H4v0mbAb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65303-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65303-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E35903034E2D
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 05:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96493537C7;
	Sat, 20 Jun 2026 05:48:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B8419E97B
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 05:48:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781934494; cv=none; b=kYv67LIVgzqX9RSk/fhNC7DSvaPyobdQCwibv2vAACfiYFg+5BZYS2bs3z2lPoeje7alqFGu4lj7Dxsys+zQmfjC0v7OV+pp+GIPQd8twScgWDAKDDoli8CPCOPslAv2/uligIc9LaL4wqTB/oY43IqC/qc10bhKcoM2WPvTTrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781934494; c=relaxed/simple;
	bh=XjyJT5W1WsG2MyfZ7fnuUwzGcUGg4Y6+iUVCy+1ozYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l70HOdYuC5C2HJDSjH5B/5oase5G1o3/1qoVTAkI7RdVq/AA6+WPItIJAKCaaJ0XwLRbB1SXxNUQqRpNISouSYS8eh5EEXHRaG+aqM2rN9XrEDb+nfpxnhlwmpHwo8FYLI81yOGYsfSqyFvcJyKNfInW613LceD0NIGhGHPiJv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4v0mbAb; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-697763eeafcso689855a12.3
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 22:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781934491; x=1782539291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed3t8ZxAhZ1D0n+cEn1P+22l2LNZt23J9pURBwnxtfY=;
        b=H4v0mbAbEV8EPkK1Xp5YAW9qHmAlaRuQhXm6/70bgOvNI21BcU3L2WXbKuo2ZAbWLp
         s7/e2ibOUD7eiK9ZI2fh9O05vMZMXgGud919/s2ORB6bkUTnSMvE55K7UbIoF/mn9LVJ
         gOnYEy+1g1KPq0Hkut1ZpuRyTAJcoLTGkz5BwEeD5PW4UXhXjUVZos7t1pz2+S4K4rZe
         7Tr3zaxEyP7w64l6icUXvydnTtGBUFHWumDikxAgwxO7xLl7rTjRPDDfQq0wb3WEj+uA
         Jk2tJEGB7xpRTK3ls6eb/uZ3IezFxuzcTN6kXCFknKvH6VfOkNOw7jX81tPwgvVpBeH4
         o7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781934491; x=1782539291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed3t8ZxAhZ1D0n+cEn1P+22l2LNZt23J9pURBwnxtfY=;
        b=VFpxI5y6lQnlONkVGu7aZmw/m21VgGa6ioZWLXav3Y1uyfxx0rxUgDmW5YY0KQvDhH
         S4+kT3lyqKrHBklGtku8WKhzyd2j0D0i6oobV2ediq6Ucksyw6vEq5BW+SY90Z52qPLX
         WZVFhcwWWDhGIGXEkWzuyuAH27wHCisiQIxIG+tZtyPxBgWEpJb25hsPiwhybeZB8wbV
         UGRKN8LANzgEQlfTH2jX6QYZFz7iW5h1t034vn9qzQMn5fZf4QMd12KAho58Bu8Gp9bE
         /GKkw1xGs5zqM4/OAcXY38Zqvi1HqmLBHx+SDqVbIQZTd//tIrD1olgTVbUnbkyiVdOg
         ycZw==
X-Gm-Message-State: AOJu0Yw9QpAC7AvqhAYIOtlO36geLdXkjMonChTMxcIe9L/KBtFKov2r
	cWGOtmEtyeNzAAlvLfoMxZZrwLPtU53tt4gxIhwBYFiy1wWLoff1UgZs
X-Gm-Gg: AfdE7cnLkynqWC0PWMQQL5k9ofZTEcEfnPYy+RhsiRPEAQ2/NeexmX3r507mdLY9uqg
	yWvDwCYs46xKK6/ThSvaZBpXt9cPpUJm42u/dRpP2WZYs8bTwsIClCExu9ATllHX6IyhHDbb7Ok
	QkS8l4j03k0+XkHBi2BHtSv2xpZw3Gc12ggiaWNKx+E8sJ4PzC5FgKpWrYyJGwgC11wvP8Ls3LJ
	X/Dh5gn84HlpYlLK4OiqvUIwfGpf/cVrM80Jc1w4bTMDyU7JpSlUQB6EwECHi3fG6ka6r3h18+c
	AO2vCObGKsabdIeOTNK0jMw6+my5XrpaoJk6g+CE20CBn0p5Ke/qW3jGVpyLAuSj0k1XKGa4+zq
	Pfmb0PJD9JCbB6cUGYyg0pNxPe5eDDqAO0z7gzVD4T5uKwxVo1FHCcE/6URDl
X-Received: by 2002:a05:6402:5243:b0:697:64ba:bb9b with SMTP id 4fb4d7f45d1cf-69764babcf3mr2494576a12.17.1781934491202;
        Fri, 19 Jun 2026 22:48:11 -0700 (PDT)
Received: from adr.. ([2a00:7c80:0:3a8::14])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be498e4sm353440a12.20.2026.06.19.22.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 22:48:10 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH] media: av7110: refactor deeply nested PTS loops
Date: Sat, 20 Jun 2026 02:46:54 -0300
Message-ID: <20260620054654.122464-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65303-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andrem.33333@gmail.com,m:andrem33333@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrem33333@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrem33333@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A7226A860B

Extract the deeply nested loops handling PTS flags in the MPEG-1
block into a separate helper function `av7110_ipack_m1_pts()`.

This fixes a checkpatch warning regarding too many leading tabs and
improves code readability without changing the underlying parser logic.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/media/av7110/av7110_ipack.c | 35 +++++++++++----------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging/media/av7110/av7110_ipack.c
index 4be6e225f08e8..a3e69a737e97d 100644
--- a/drivers/staging/media/av7110/av7110_ipack.c
+++ b/drivers/staging/media/av7110/av7110_ipack.c
@@ -136,6 +136,22 @@ static void write_ipack(struct ipack *p, const u8 *data, int count)
 	}
 }
 
+static int av7110_ipack_m1_pts(struct ipack *p, const u8 *buf,
+			       int c, int count, int max_which)
+{
+	while (c < count && p->which < max_which) {
+		if (p->which < 7)
+			p->pts[p->which - 2] = buf[c];
+
+		write_ipack(p, buf + c, 1);
+		c++;
+		p->found++;
+		p->which++;
+		p->hlength++;
+	}
+	return c;
+}
+
 int av7110_ipack_instant_repack(const u8 *buf, int count, struct ipack *p)
 {
 	int l;
@@ -335,26 +351,11 @@ int av7110_ipack_instant_repack(const u8 *buf, int count, struct ipack *p)
 				return count;
 			if (p->which > 2) {
 				if ((p->flag2 & PTS_DTS_FLAGS) == PTS_ONLY) {
-					while (c < count && p->which < 7) {
-						p->pts[p->which - 2] = buf[c];
-						write_ipack(p, buf + c, 1);
-						c++;
-						p->found++;
-						p->which++;
-						p->hlength++;
-					}
+					c = av7110_ipack_m1_pts(p, buf, c, count, 7);
 					if (c == count)
 						return count;
 				} else if ((p->flag2 & PTS_DTS_FLAGS) == PTS_DTS) {
-					while (c < count && p->which < 12) {
-						if (p->which < 7)
-							p->pts[p->which - 2] = buf[c];
-						write_ipack(p, buf + c, 1);
-						c++;
-						p->found++;
-						p->which++;
-						p->hlength++;
-					}
+					c = av7110_ipack_m1_pts(p, buf, c, count, 12);
 					if (c == count)
 						return count;
 				}
-- 
2.43.0


