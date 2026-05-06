Return-Path: <linux-media+bounces-60683-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DydD9aT+2mrcwMAu9opvQ
	(envelope-from <linux-media+bounces-60683-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 21:17:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F394DFA97
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 21:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEAFA301A287
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 19:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1606313E3F;
	Wed,  6 May 2026 19:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5ew/lSl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA02C859
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 19:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778095059; cv=none; b=rhdll6jpKPNaleCoBI0YdapCvlIs73WOdhyhgc9LLJKylL0+07+lkMH04Z8IihzANb6dbX2b8i6wPoAufCU6ViNu0BbcFm2vOn4PuFPFbiygahPDFrftcF+/kuXPLUoz9tvlfSjX8wXuQ0odVmbgo5z5BQ8JOVoP9WXimv9b+dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778095059; c=relaxed/simple;
	bh=8UAQj/f3Q+ncXROJtPhADDYBGKMGJ7s0QgQpnbS3m6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EV6jrhvVixnL1DsHmOHzvMQUPiTVTHqnMIaK7zQmgxLFLQiqGYUwh+ROoHTAfLgej1SOVE1Gwu5HaOnbpETg70uJlSePi3l1pPN2QkmYcrTauNgDWPENBNve4umFGzSdoz9wMpneiJF65sbY8zqAPbbtNHiuhoS2XR37AfCNiQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5ew/lSl; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35fb0bb27e7so27590a91.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 12:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778095057; x=1778699857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anXElIfaQ5hZNXF4UbwKWtD/aeFWgX2f7zGp8d7W6Xo=;
        b=g5ew/lSluaL3hGBeh0ArgPXhWsQlfnt/lNNC8BbZPL2OqShPkhD9az6RaisXZAt5XJ
         khBPPM+x0LONOdiissPWueRpPHaehRnBG1Om8ERAxS5bL/6GkEhqf3/67CMttTaX3gFa
         AH6kDNZTkBVWXJzxBGVT/LAGnIC39hA5qbz7+T4Z3+E7qW+aXX0/XK9WabJm6cFDb1fr
         4oVefOuWNF76dUEksZzHEcSfGBZXGcuJwnfTi4mFQM+qr+lVjhKeGG745WJc0djjBfNl
         AspVCA50dW4teFhUdM1T81iJ8NfuPglvNHWZsOtu4hZesjvAMvVGVMqZb6+I45KlKKHJ
         ND4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778095057; x=1778699857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anXElIfaQ5hZNXF4UbwKWtD/aeFWgX2f7zGp8d7W6Xo=;
        b=bJEzTnDvtpyzV0hxSq/gvsxGxSFmYFnDVY0LW91SzIwXgqmlnK6u0AA2kY/bRWQmzn
         oi/GR3zwCdXc57x5xEMxqL+Lztv60mvo5BStTaPq/eD+/3MiX0jLQSZr5cFnRX4EBrl9
         Xpfd6VdzKxIK3MlvYeWEp9h+6/AFWfPmdl7iGroCBdpABfpnP3toQGZpmCTCRSOmjcol
         ZZwbQsE2OMwPnrDH6OuXLgUt1SrRGkxGKobdYHfk+33oiGmmcX5HPCheu2P+OdGhpdmZ
         4b5VQD7D2/P5wTv4ouiWWYb5Q/GMYMlhGPcXG32xN3uYXAr4rzjVLbbiacom8uN6Yjeq
         fsaA==
X-Forwarded-Encrypted: i=1; AFNElJ/MEh/mWafo+EAzQX/Xtsuyk7ZgLPQuw8TUHYMRMySaS+4cUgmaX7VC8IHzFP6+bqu8cvmrR0mF1tVStA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hcYSlQQ9XaspmEmxb5DKSo4lLZA8ww/zIrw7+cJeRJW9prGH
	m/ZFj98d8s464lnApn1/xuuLfh9b0nw87Mt6mWNXwpOrm1V9FuzlaP24
X-Gm-Gg: AeBDietlbHCtPPXdcg4ih6PzaqqK0x7l3QZip98ANb5My6oWPnomJGskaMfM/nluC32
	ZspguaRtSlxIQKTeAG/TqJZN60v3CJrY5Jqx4ywcaKGzNHRugaAfKk7SpB6OYe4slyVOJWti1xR
	F1pq+4k9VEGl6Bs6LMlFoQ6jL4/cP3KpAWyVnYmhRfC9QvSngQqZnkYOnlsKD/KJ6pPoBn1iPkL
	lz7iziOWFXsaNTTtHwk3Y2hs8dYHvj889LRLkgPXcuTNVonGCvq0hcCXIgv3J5aVqcXp2VN75Ci
	s4mSu4GH1dhOhK0ELxAirYcX/rQypxqClOo5omOPAqiV1f2WramE5slz6SzKhOY9EUuR0gSEl6Y
	OES88B1cIdUpJAPqPRcFWJ7IS3DIRjNHkvUzOKpQIQtCA+wH0DWCQ3xF4m1ybra+xQiszsvUUVR
	taddqas64M5bnEub9zCVEOPuDimYn0PwTP5/cvk+V8pcZoirJobjhDLI9WsaRfeS3A+o08M7+4f
	gF4s9yDJDBI68/q8Jo+5a5CuJ1AJ9SL
X-Received: by 2002:a17:90a:1210:b0:365:c025:779c with SMTP id 98e67ed59e1d1-365c0258d09mr2268793a91.11.1778095056970;
        Wed, 06 May 2026 12:17:36 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c2f5fcsm4135160a91.7.2026.05.06.12.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:17:35 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: mark pmic_name array as const
Date: Thu,  7 May 2026 00:46:58 +0530
Message-ID: <20260506191658.283328-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C3F394DFA97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-60683-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The pmic_name array is not modified after initialization and is only used
for lookup. Mark it as 'static const char *const' to place it in read-only
memory and prevent accidental modification.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
Changes in v2:
- Fix redundant "used for" typo in the description.

 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..d32d98720455 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -109,7 +109,7 @@ static enum {
 	PMIC_CRYSTALCOVE
 } pmic_id;
 
-static const char *pmic_name[] = {
+static const char *const pmic_name[] = {
 	[PMIC_UNSET]		= "ACPI device PM",
 	[PMIC_REGULATOR]	= "regulator driver",
 	[PMIC_AXP]		= "XPower AXP288 PMIC",
-- 
2.43.0


