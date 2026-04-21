Return-Path: <linux-media+bounces-59250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBZYKiUB6GlJEAIAu9opvQ
	(envelope-from <linux-media+bounces-59250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 00:58:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E11C4405CA
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 00:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48D783069632
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA9F3A6B74;
	Tue, 21 Apr 2026 22:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlQgxJ2o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F93A75A7
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811954; cv=none; b=YqezVJVS6hLYxVSUNpAEQdqbr08+NEwlgFJoByCKNoFDvjAdhKgKW5CAEJOGw1ZIWSCMSlvLeoQlMtpwrrDNc+kn8f0Wmu+cx9oaiWfRcxneJxK3egPmiobk7ToK9kz0Ug6QjO1jacf6kQ3goBkLjEwfZJ+qF1Qij8DtYo9HDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811954; c=relaxed/simple;
	bh=p4hpYbaaV2jAO91rm4XYUSpVwUAcL13OGh3u8xmVSKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ug+FhYVR3Q56IJmPxiHQUdBZzvSVjnLYCdXRYc8LW4MIx01BFNG2hzA2fdMP8Fo87u09PFQMK5S2/nVx0xmWxQkAeizt8kC22KZQO9F/swSe9L1Nn28XMP6FEUZfP8KEVvaodMt2BPZAsWp0BJlmkwueDl7vi7q59m9DbtdxBpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlQgxJ2o; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2de831d2b20so397260eec.1
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 15:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811949; x=1777416749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52lKPT06xJB6S0hMXMshZr9YSqwMjyDFKuBVFDd9B08=;
        b=nlQgxJ2opjNvu83bLd8aKVBBvJoqzj5pFQ+4168NZkyPsNdYp84jbr0udrDk7+hC4x
         BXZffM0E2KxgkiYoPMLMRNQY14vfmuFavnEGDDXH4IGXAyzWWzz6v0jbmGLuHOl9dOix
         Nkai5e1bPSb0iMm6ukejQ6q6k7VNZkVej7mSIl0f4WEQaPXdkyBiZVwUAb07LplOukjH
         uQwSrjGNGXUE8L5pEBFcjbCJ95yDJPD4cccKl0QSTXURKMo9KvVQpAcYVYS9xsE9cRyd
         d6VVrTQGzXqc5TP5dRo8I3vcxdiqnUWEFhR/P+8J+yYU3dwRBm6XxbwdRmddWu56sFSU
         ihHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811949; x=1777416749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=52lKPT06xJB6S0hMXMshZr9YSqwMjyDFKuBVFDd9B08=;
        b=sGPzpKTiS5kMs3Qx3QrgjBcvcJdO3R6vCWCqXhVtfzBY9ytg3IcWk3XmZZxkVTwuPt
         CRnHZ3KpUYtLYOddQvp7HNAOdl426uxwJ1PfbCTnfI9bWECXvH6rJlXLBUMrt31qOcre
         rAPNuoCcQ9ohplHjGfNuMTaAmB3pPe0B4u1uGqDPyT5PS2OHvo9qQurfeekU5sOkYhXH
         z+yhlMIGZnE25rUHcnbJ+dvfycfjA3P83utvV32onK40LJyuqSstMFutrYmuqz3gG3Vu
         UVPfwgoGARwVZS6PlGKRmAkEN6d73Na8Axe7+NXoLmW8KDHpzsF1QJ0Ja7cd3Pgf/S0v
         hv5g==
X-Forwarded-Encrypted: i=1; AFNElJ9N9/vGxCwxiQD8m2YDXKsrkKku5pyiA9AQZ26dwRlptZlaUgwRKjRUyjRZLuLP0qmIfCc/QP4jd86hdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu23QNu6NQl6cLzNB6ZHuCnKt0c3sfoZL397uPc06jYAs2ibkH
	nRyXg6FiCVABOwFKziB6zMC1rKZ5DMln5yIGACfI4x49+MtPHLFvaqpo
X-Gm-Gg: AeBDiesevxCjgi3+kCodvc5SLvoeVCc4V/bVQAVWT6jyPrPjOm4fQfpJaeFWgH+4iTN
	lkysdU+QV4VhVLVnYs8l3t22Wo77AMFIqM30TsG5w/HgYSjJL5NKI/vPW4CRaapW3v1lF2cW/IE
	TpbKmX6cTKnlEk50NACc+F7EbsMvezxOsSoMswwdQ4Yx11Gw+rZkJO42H9WsXJ+LZ9BZGKwqel5
	BM4oNi53g77w7i8r6C4t/8/WrDJ5vQt6TEXC+tnhem927gT5F1GLwZzkm4TcjafwKDAVaSnhZkY
	Bu1LY8rBopHVaVQqDZ8SS9NukbLEgaRkSJHvtPJYV72KbI0Op5zkstgymeLDjcwXYiXywpk/M2y
	zRcitnhpWgUMZFq7AZyavTAU3j1Ri/nxp6EyVXMG7z0UBHTzCay2dYFWWC0YrHe0VJxjrhqYBaI
	9YO62kKACHyktkmTyaMPx/GctWDBvpnpJz
X-Received: by 2002:a05:7300:b58a:b0:2d4:62f0:b2d4 with SMTP id 5a478bee46e88-2e4786461b4mr11747692eec.13.1776811949190;
        Tue, 21 Apr 2026 15:52:29 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm26145884eec.8.2026.04.21.15.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:52:28 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v4 0/5] Enable cameras on Dell Latitude 5285 2-in-1
Date: Tue, 21 Apr 2026 15:52:12 -0700
Message-ID: <20260421225217.12472-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59250-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E11C4405CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Changes since v3 (addressing feedback from Sakari Ailus and Hans de Goede):
- Patch 1: Fix multi-line comment style (blank opening line).
- Patch 2: Fix multi-line comment style; change n_consumers and loop
  variable i from int to unsigned int; remove spurious (int) cast.
- Patch 3: Rework regulator mapping per Hans's review:
    * VIO has no enable register and is always-on at hardware level; it
      must never have direct software consumers.  Rename
      surface_go_tps68470_vio_reg_init_data to generic_tps68470_vio_reg_init_data
      (used by both Surface Go and Dell 5285) and remove all VIO consumers.
    * Map VSIO to dovdd/INT3477 instead of vsio/INT3477.  Enabling VSIO
      sets S_I2C_CTL (reg 0x43) which opens the I2C passthrough to OV8858;
      since ov8858 enables dovdd before any I2C transaction, the passthrough
      is guaranteed to be active in time without marking VSIO always_on.
    * Remove always_on from VSIO (was a workaround; no longer needed).
    * Update commit message to reflect the new design.
- Patch 5: Remove "vsio" from ov8858_supply_names[] (VSIO now maps to
  "dovdd", which the driver already requests); remove ACPI_PTR() wrapper
  (unnecessary when the ACPI table is declared unconditionally); update
  commit message and title.
- Patches 4: Unchanged.

Tested on Ubuntu 25.10, kernel 6.17.0-22-generic.  Both cameras working
in Zoom, Chrome, and GNOME Camera via PipeWire.

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477


