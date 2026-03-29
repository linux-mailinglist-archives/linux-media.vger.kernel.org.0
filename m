Return-Path: <linux-media+bounces-57524-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOlwJnN0yWmxyAUAu9opvQ
	(envelope-from <linux-media+bounces-57524-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 20:50:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC55353A9C
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 20:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06ECA302BA6C
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 18:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2167388388;
	Sun, 29 Mar 2026 18:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8627yc4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70795387374
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774810169; cv=none; b=dss2F2OiJzYEGAKPAoO4I6veynzZH0L/fuZIoPdoPksJsV3+dS2F0JIXCMlQZC4e5+XRsxJuVICs2oECBjkLzY9zk7IhbFy4MzWyEAVdqxWcH0n6UjSu9GATMVS+4jSGqj9AQp2PoKN4oz2nzWgFgRzFESKqsVhAYFMueKj+H/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774810169; c=relaxed/simple;
	bh=I4h+Hb85bL/zpjRA/hGHNI3yGfnFlHifIvIALM1Wh7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Um0PovnGKs71DdmyouwNjt8o2YmY7LFG8rUuj42vEMJjEEta0BIpHb7CHzkE06sRLLGz4Ku5R/fRKg4XlfNLHz+ziM/RtifJ2u1QFa/ZGdhsTQTCNBQIME7x4ONTX270byyoONS1XwyNi4+W4rzQdxJA7sRYtELmg82lBoyCA6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8627yc4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-482f454be5bso44518755e9.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810164; x=1775414964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMtD9W/+tPizjlaSoFxb4Hua6/k797TNYjPfSr7Lv6c=;
        b=J8627yc4I5E2mlNJWTfAo8bwchJ6+gdMQjhzJ+ZcGxp9msGTmXowCnIvln6wjZbLOr
         nGbfavuhBzv9W36zQfVjqkdIfV7uHX4e2xTiZ1RlFjoetmWKoO6LtX4AG+7lc0OhUhfR
         zvCQJ6I6pNSruH6d88ZDsHqIm48dh+wO0wscgXCWa9qRKXSjNx3MnHYX19Z2dgzdkCrJ
         fUJo8ChE/LSKF6syGqq5B8k5pWY2dmxgJrTQZHnx3GdpHqtXvrUNB8SvKxxcH8tNLaug
         uODn992gfpFjTkHrsGU4sR+0Y4z5vthNpH9iZMRo/NrJ4/wbvj/XH+LW1fTd1E8VHE8n
         zHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810164; x=1775414964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AMtD9W/+tPizjlaSoFxb4Hua6/k797TNYjPfSr7Lv6c=;
        b=gHAwgDutnrlZHpJFb1fwDwxIQsXK8zXtpjtdaMlKneDXNPtSqV9CUxUyG7kvH9h6Gn
         1A7B3sJU10y9+O5cwT0vjxFgIckndCgYfGz//v2+yNx3ZJnLqyg+p8EyfOtnV9Ig08QH
         px4ooki9/3IjeP5G4zTqMrYetGHB7fdGrZk+4eMBGYGl4a3ChhHxlLTr1Kwro/oxlpvm
         s+kzRdZSgWNS5foAgcwI4FxoISgVSq3wLsLLu1CvbMZtGcQhP+EOcizxGwUsezi2BN3y
         i44h2vKH19vAGXvSETvewQdScZVTU1qhXkC4jHjQMtSuc6p5WJPzSQVWoYdB1BarlRjt
         X3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCW8inRu6bxwaY+y9tsvHsvXK+ytnYRrYnRUaIn1VKKsfVLHBNXV73xUbPLgXcFflX+HFqgAWkBZGVBf1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+TLlKQKivhB/Wy0N+yfCctYEjoVWFPoslAIrmG3Sp03UAGdbO
	C8qCP4aDwShQxG2QYLPl3806KO3vQ5XyvVOHcqyTWHBmzd6D2f/uLrUo
X-Gm-Gg: ATEYQzx8jzTXVHGXrHOebt7Jgh+lT+iM0r7F2UTgjZ2Hgrf5tJo5pjnDFQ8I9wetAij
	HSvmTiLZ+ui5p7RZb9V+ifAcW284BEDR0I1QfCwAT3fGn1Cz0TOiWoKQUarpYmJB8vHcUiy8/S2
	Yc7ELWlgwv2NrmsWhxYIXkdXQ2bvAByxC6DUaU3LiGCpzWdQp3WMpUgY7bXk1Y8uh2ljsu+VxAW
	2hKKK4g1N7Eb6ez9a6j2XdafH+p52toRErslhFJ4gzACyo10tFvGDUiysD8TAhZLY9MLBXmBLz8
	h+yEJrc1ebSffHQ/vHtJTC2er6/HMzFi86YsSnlnnsMBrOibqW9L7p1DVF/0bGsYXJexkltjGdu
	4mFIOAEmBUJ7eQF4jPf0CjTmXCF80VjdYgVNKlbKPvDYQFfdUicpmZkxBj1d5iLirNA4GjTLh28
	jH8JjdTg/O797iDlcW+bMo99Krnh+xnoNATYIOHNKPWlqWr8BPnAY=
X-Received: by 2002:a05:6000:2701:b0:43b:9b0a:7e80 with SMTP id ffacd0b85a97d-43b9b0a816bmr11756256f8f.3.1774810164251;
        Sun, 29 Mar 2026 11:49:24 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm14058443f8f.11.2026.03.29.11.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:49:23 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	daniel.baluta@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v3 3/4] staging: media: atomisp: reformat block comments
Date: Sun, 29 Mar 2026 21:48:09 +0300
Message-ID: <20260329184810.455285-4-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
References: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,nxp.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-57524-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robyserbanpascu06@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EEC55353A9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing asterisks to block comments to conform with the
standard Linux kernel comment style.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index 6420436d88f7..c65a5be8445a 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -100,8 +100,9 @@ typedef enum {
 	N_GDC_ID
 } gdc_ID_t;
 
-/* this extra define is needed because we want to use it also
-   in the preprocessor, and that doesn't work with enums.
+/*
+ * this extra define is needed because we want to use it also
+ * in the preprocessor, and that doesn't work with enums.
  */
 #define N_GDC_ID_CPP 2
 
-- 
2.43.0


