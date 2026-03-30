Return-Path: <linux-media+bounces-57544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPa/B2gpymnX5gUAu9opvQ
	(envelope-from <linux-media+bounces-57544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:42:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7F356948
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E8DF3033A87
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485073A1A23;
	Mon, 30 Mar 2026 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzufV4V6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB23A0B11
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 07:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856174; cv=none; b=eVcf31TZuz0Lq089pWwuO2IN6eQzqFpCIknBi1i8rYfBYWesnthS4VpQJcs3NF5DtRviONTBpaUKdUDSV/RQHEw8mJvJVczZ3Z+sVdq+xcuLl1sd86wXibdP6gvsrRkWNdPdLqX/6UhO3EFUvTlKcLPlH37xlVi6MHsi0j1A+20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856174; c=relaxed/simple;
	bh=kYqH5iugI2Qn/oNsZa3uBNnIyEKEdoCOypRJz0huAGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YlnInw6BsHBXRsgqcppbjHwjDJZPV5yw/Ab6Boqv7/sIDDwSgrAIZF+OAfer/PJ6/fFnTZ7rMfhLaGz1UaG8/i/8z0+NPDaXSPzu77dIhPn16H1f+9pOvf4Fqc1zUNJwNF4e6HAr7kA0kqqDtrpV1KfwATZbGl4hhrhLg4FMDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzufV4V6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48704db565eso54594455e9.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 00:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856170; x=1775460970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HX27mnS6MIQlAM4e5IpyBKYekAZ0hpfOWZuRBhvW9/k=;
        b=VzufV4V6UPoQCdpvpNetk/l+RG1h8v6JU7cv+KC7SFChvP6/LOCkbFV0a+2KNZc70M
         KtdpIrRF14O7KULRkvgQVx6J5My8j3jg2uZOi+BbcRbNBxFqM3N6zxH9SnmLpqPwMAwc
         3jOgUnkmdg3Jd4nPPfETQyHEhGkYAeWVY6hBYotnNQDthbRwbzANEGOWFXMiIeFybUFm
         /HiNKCxNZaitgiWL9T8h8YEAenwNa5v0Tz9voed7BxULrga7MKQGIqub6AEvbPuYMFW2
         I74feP8Z9bGH92Pbqrfb5syHk9SV+8gwCmyIviRJZpULHkKOLJpz9Jgui/O2MKZDlWSQ
         0A3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856170; x=1775460970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HX27mnS6MIQlAM4e5IpyBKYekAZ0hpfOWZuRBhvW9/k=;
        b=VjVbN6f4VlUx0YWQ6TM1gon9I1VfQic9QBeGw1m3dtpxjnXZ03CHeh7XYPHwJ7DGig
         jPPkWxV5+AoGsAaTz5belcwp+bRmZXESeg1lhMhbvd3SkGDdRLUbsfuAELr9FUeF9DWf
         7/nRfUZRdA0AvO4IYZy4Jxv7gc+LUkVPRJBirPvrrPyHqpXjAUJu59jj3bP8mLdc9dTt
         2guvJrptzec3Iokt/OFr2bwIlMgWo2DIAnR33TCeQGPZ7E5bJRFTh+sT2Feo7zzIWYb/
         B6DS7aCnTIJrMj0h1pcHpRMzJKEEO1QfgYEtg3gJ7dYPlEZBaRpa362/BeOiOvhhhSrD
         bnFg==
X-Forwarded-Encrypted: i=1; AJvYcCVKHx2KKeQRz0BykXPR5vEVqvfULQ8lkAWQiTRLd6Is1q25Ynm0MLmdxU0xuksk7Cfv6OvIduR8hX5FTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3q9eqsRO+a3JK4usQfYM0nadgXyH98G871Vv/1OWr0iwbWEi2
	R/v7FLvcnaE7MHQ6+049Yrx7s+2nb8lQI8cXqHcaEVUfQg7DltTGo7lX
X-Gm-Gg: ATEYQzxzEJbSKsB6U+1oiD3CENy+nhLJmC+H5X5iawytZEOwLpNCWqtWncHL7z1amvM
	hqeRDRdo2Q6A5Fjt5D2kxedK5j3vQAZI+xnEptqDHoR/sKnD3qEfOKBjFKdMIkD6p9SrBY1QB9V
	ot51l7klmtmXNUi/A3lVviUOdl4os5iUhMJSFYUDRdMONcbi9iz8gwiibUQOBjyk335OTZKAXNR
	JUv4HRQpm3UVcexcMH/fxyLeui6ehUCqsUEXSbyJiWcC/ICVxkA/89nd1WHvn1ZPxK4UsqirXEu
	eueuIgY4KCtN3qeGyikoIyHNetfnrxz1Zew0Ntk600ogl6nbq/zNhS1tmGAIc3YaV2xVzGKSpW1
	gLJgwLmDoox/E1k02P3An30Bj7dkRxKWsx/CBHRmHrjB14d8UsAfkjHcOEIyHl58MI6NmRPDDxI
	V9/jZSV4Wobd15ReQ6w4qML/hGAwrVf3Ze4z1dbi8aI7KyKdVtMH4=
X-Received: by 2002:a05:600c:450a:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-48727d774e6mr199493235e9.14.1774856169983;
        Mon, 30 Mar 2026 00:36:09 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm389407255e9.0.2026.03.30.00.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:36:09 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	d-gole@ti.com,
	m-chadhry@ti.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v4 0/4] staging: media: atomisp: Few coding style fixes
Date: Mon, 30 Mar 2026 10:35:45 +0300
Message-ID: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,nxp.com,vger.kernel.org,lists.linux.dev,ti.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57544-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robyserbanpascu06@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DF7F356948
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes since v3:
- Added a descriptive subject to the cover letter,
- as requested by Daniel Baluta.

Serban-Pascu Robert (4):
  staging: media: atomisp: fix SPDX license identifier style
  staging: media: atomisp: fix typo 'uninterruptible' in comment
  staging: media: atomisp: reformat block comments
  staging: media: atomisp: remove redundant blank lines

 drivers/staging/media/atomisp/pci/system_global.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.43.0


