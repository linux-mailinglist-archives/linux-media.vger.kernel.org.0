Return-Path: <linux-media+bounces-64549-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e7qKHgZrKmo1pAMAu9opvQ
	(envelope-from <linux-media+bounces-64549-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:00:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A9C66FA41
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:00:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="puZ/sOua";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ewz0UhNi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64549-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64549-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CC1D312E1F6
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AAA370ACE;
	Thu, 11 Jun 2026 07:55:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E119636F8EB;
	Thu, 11 Jun 2026 07:55:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164557; cv=none; b=hLdgCV9fs49w0d/Y7/ERnycdBqlqJe4JKXStDqkvDjtoUgHfJxr6r1w5zgDT+ZzDNyUTkXs3wyBRI/gSaRSU0ZRW6VqZCXhuOcwka8AihpcwpSaPHQ38pXPyniqBYdCGeLyHupEzYdEEo3r68lMRTV8Wdf8O24R+3LCD+3UrFuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164557; c=relaxed/simple;
	bh=tYiFxavXausdnzeNk9fIDaCPQba67WTZfVllk2Ur48E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RcVPy64NjRAnpYBUqjyaz6ES2aUGhI5pxeY/FE37VTFCqj2Pa+yC4LS8ShWrPBXDTjke2mosK5oNL+q1/pNMPMNseb+IcfVqw6V6wHuOZEAMO9be4jWn4nmLBPBcA2QBfGCrMMD/gd9dPub5PW2jT2Mqr0LpLJRaQI3cct8qUe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=puZ/sOua; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ewz0UhNi; arc=none smtp.client-ip=80.241.56.151
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gbZhT5Fjhz9v3j;
	Thu, 11 Jun 2026 09:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781164553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pAV1UJ1no9WK2q1zB1twcHH/8NnwCGBjRhicKU7e0vA=;
	b=puZ/sOua+HmFqhOVGBagYqGiMhvW8PyeLudvB3i6fAlAVjArxlL3LzQj69ZXFyV1a/Ygpg
	jHRRWLqB4uuPO8pC6DS3Q8r3vb2NkKIn8sqNPmQBuvVYbAhAcg6Ct4piT+8MExzw9NOxCq
	eqR2zI0ayYNwfT5/ug7gRxlUSSxHSn5Ec6d8yoi3pwYtzyCo8AdED5BhO7S42+/0ONmcur
	bOhG/LR+IhtKFZGd9Z/SLs4W71vwMXZQGe/Xaiy/WOuUqy3Ht/sl2mgm+aemrmR27awGFt
	1k1z78AdeqSPIQPTuPRwluH9h8A/SlcIntlsaNXNInXXe/p+HW0ydG1epRnoTQ==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781164552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pAV1UJ1no9WK2q1zB1twcHH/8NnwCGBjRhicKU7e0vA=;
	b=ewz0UhNiI12koaJNchIgEkpzdMn8j3hdQUXel82ibazfssS7eVxJVgmL7kkW4jrkwp4dCP
	GAXw0g3Ww/nGe2XhhzP+Ny8yvNMZ8GelbsIY7VUVA5fdR3Vj3C5QqlQ2svQX2MiXk3xC8W
	OGqWgpKsnd9sXxUH4rQ0xlaw3wmmS7O5GsD11hG+ILqKRh+gjnOUtSdbU5TXP2umECJVlb
	iy1fdvK3JqE7+kfQkYWup+nHh2BUwPDa7Lf+SeFk901GAV+WQGd8wq3aAZBINuz3tctyCj
	3BlYwI8co0z6T6S/kzQuUdLHJ2nqo+tTWx9InF0g1e9INgpykIfwPLxuBObqNA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: admin-guide: fix bracelets and translation issue
Date: Thu, 11 Jun 2026 09:55:14 +0200
Message-ID: <20260611075513.124994-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1dpimzm3zsfohwpso9nx3srzqjqkp49i
X-MBO-RS-ID: a1bc5a2f346bd7c1d65
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manuelebner@mailbox.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64549-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3A9C66FA41

Add missing ] and replace 'neuer Name' with 'new Name'.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 +++---
 Documentation/admin-guide/media/bttv.rst        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 00375193bd26..17363d525ae3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6414,9 +6414,9 @@ Kernel parameters
 	reboot=		[KNL]
 			Format (x86 or x86_64):
 				[w[arm] | c[old] | h[ard] | s[oft] | g[pio]] | d[efault] \
-				[[,]s[mp]#### \
+				[[,]s[mp]####] \
 				[[,]b[ios] | a[cpi] | k[bd] | t[riple] | e[fi] | p[ci]] \
-				[[,]f[orce]
+				[[,]f[orce]]
 			Where reboot_mode is one of warm (soft) or cold (hard) or gpio
 					(prefix with 'panic_' to set mode for panic
 					reboot only),
@@ -6917,7 +6917,7 @@ Kernel parameters
 			apic=verbose is specified.
 			Example: apic=debug show_lapic=all
 
-	slab_debug[=options[,slabs][;[options[,slabs]]...]	[MM]
+	slab_debug[=options[,slabs][;[options[,slabs]]...]]	[MM]
 			Enabling slab_debug allows one to determine the
 			culprit if slab objects become corrupted. Enabling
 			slab_debug can create guard zones around objects and
diff --git a/Documentation/admin-guide/media/bttv.rst b/Documentation/admin-guide/media/bttv.rst
index 58cbaf6df694..78c3e560b806 100644
--- a/Documentation/admin-guide/media/bttv.rst
+++ b/Documentation/admin-guide/media/bttv.rst
@@ -1239,7 +1239,7 @@ Models:
 - Galaxis DVB Card C CI
 - Galaxis DVB Card S
 - Galaxis DVB Card C
-- Galaxis plug.in S [neuer Name: Galaxis DVB Card S CI
+- Galaxis plug.in S [new Name: Galaxis DVB Card S CI]
 
 Hauppauge
 ~~~~~~~~~
-- 
2.54.0


