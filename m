Return-Path: <linux-media+bounces-57894-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGUKA2tizWmMcwYAu9opvQ
	(envelope-from <linux-media+bounces-57894-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 20:22:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6259337F3A0
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 20:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C487F302D530
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 18:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD68D31F997;
	Wed,  1 Apr 2026 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4D42Brd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355E531A556
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 18:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775067424; cv=none; b=FGBtVRvFvn13J1k4lXE4vJkHe5xdSRhqQGw5waAPxIxFqrrRklN8qXCPF74t4DonfzgPSk7+b6FVjIsCf40CnPs4u0fy9Nu6kCgrUIf32eYKlXSlCsTejgTQg2jpvMt3n4jzbCwRPYwhB8FOoYQI5bMcbiLnm3v/r5Zwyguda30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775067424; c=relaxed/simple;
	bh=rHqkHlLGSzIWyYyjh18VBcT4V76L40BQlXN4aI2+M0E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iLCyLKEvaxGqbE3NcNkxzZAeHgNyIrAW1v++aOEmuxFLK5tIVyfDKy32H1zwFmt/5LutZM87TiNp79cCcLi4st+JChvEMHstsXqmDSNB0O6zcVPDkLFP4TQCQE28BnD8VoLf1sDc+FGPgBMRLTexsYALWXorbS623Uni04vxfnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4D42Brd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82a62714fe6so3536b3a.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 11:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775067422; x=1775672222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XhbFIJDLBzUo/YU63x1aHcpNwmBBCLqppXWMMSafRBY=;
        b=E4D42Brd0EpVZVPvDJhzfkHdP/nmET0B00a5XmGvH1CEPmjLgZ3HSmbv+Vaa9wX7fc
         oum2tbcJvmMX1jNPeM936EnWBBhBMQ6hmQgLl9h4i9HXw+s/8Xh12Yi21hWEw6fDFAaz
         s4qjAf1NnedZzHmfv3wZi7xJtkhZnp79lDpq9/WAe4s29L5Dov2iA7SPKdbu+NO3mfSG
         icWKrB2LVbZnrUzHga1sTyuhYQY57QEtm9bdtCfqGVGywTugeAjLZEt0QEe4O5YLJaBi
         cckjB/Eiy8IFW6ClwFSpxZvfBxSrMxRqY0qMJ6rB0tNF4QYRmFr3j3W9ce55u1dnoKaA
         GyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775067422; x=1775672222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhbFIJDLBzUo/YU63x1aHcpNwmBBCLqppXWMMSafRBY=;
        b=Lq+hg6RW8J6AaNeQ3U2SbmjbO/9Ji0k0BRGlkVbpn4SeBh7hZmM4MG5wAmufqV9IzI
         0TKdRkQdlRmwg1ZeqUwVgqGA61O665lWa9t/aOmuHI+Ikxzev4p43tJuHtT6reVQCMj3
         DDOe4k2OFh85A/BBHzXlH4VHNvSYx25VmAz5wyHEQ4KIsVA9gajifVNar/IN1Q/LvCku
         aA1VD9P6orhnx98oxbjDKWhbueNZNdhGY6iCw1w7JSToG4bk2LJrRLNnyJuY/kyQbdbL
         5lj8hGiJeLynnZjF+3BZ6kHGXiFulseh+MhZ0wfQBy0DU9cvELCIydn/7C+Fq5aicp9h
         PhOg==
X-Forwarded-Encrypted: i=1; AJvYcCUQo6Dx0QJ5ekiXMmL69hY5fZ80WpeyGIAGgJKJ8gY6oroUbwkN/pAYF2Sd87YobUOlbVTogXZ6MmSWkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1wc+ecZ52qa+lXzjIFUCGr3KARAnhB9UkCxpuzjWDS20ELuar
	k+tQTS2NM1rZEupOoWcmFW1L/aTV53ZfaWoKyEd9fTD59QYsuGxn+P4A
X-Gm-Gg: ATEYQzy272B4uZqG5IDgKhc36DcFuMEtvgmgu+fuSr3vUQrt1YiBMGwVkAU7ZszO8qW
	/bqQ5EkHzHczZpHz+EFzmHCiP/urnRuLruFr5l++FfKY77uytJjCsJt1v7HaE+26gBveD3xcWl5
	LeXS95ROoHKQH3V8YKfW7CLsdpB3yuJlnYcdS4szkw/B53j25X5OzQUU1suo1reGPlqFAx1aYH1
	SRq1NTknfhnyL0miA8bVuS4afqlHdQyVrW5f2ESi1OJN4YzSPc9F+O/aLtUlceGqjntzT6bgesC
	ftGSCsVswH5W0ppyWEIOKWxObNNN/jdDsIxde3FdYkeZuJ+PdKy5CIIxu27rDtAZ00Kl9fYNm/n
	InsDHxuh/GB5fZx79wXpUu/yG3MfNAyaQlwoln/DMwYu7fev4m5CGTqsz++P8u6DdT8ws33FKg3
	ogp5wXOwClmVCxTQO36cTwyMFew8MrKlea8BXfQNJqAKJIsdvk
X-Received: by 2002:a05:6a00:4fcf:b0:81f:32cc:b1fc with SMTP id d2e1a72fcca58-82cd61e2b08mr8262844b3a.3.1775067422484;
        Wed, 01 Apr 2026 11:17:02 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca14b3sm666249b3a.54.2026.04.01.11.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:17:02 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: i2c: gc0310: cleanups and sensor clock handling improvements
Date: Wed,  1 Apr 2026 23:46:54 +0530
Message-Id: <20260401181657.654055-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-57894-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6259337F3A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Hi all,

This patch series improves resource cleanup, error handling, and clock
management in the gc0310 camera sensor driver.

The changes focus on making the probe path more robust and easier to
reason about by fixing error unwind paths, reducing repeated access to
core structures, and adopting the common V4L2 sensor clock helper to
avoid manual clock handling in the driver.

Key highlights of this series:
- Fix probe error handling to ensure resources are properly released on
  failure paths.
- Use cached I2C client and device pointers consistently across the
  driver for improved readability and maintainability.
- Switch to devm_v4l2_sensor_clk_get() to standardise external clock
  handling and align with modern V4L2 sensor driver expectations.

No functional behavior changes are intended.

Testing:
  - Compiled with W=1
  - Build-tested on QEMU x86_64

Based on:
  <linux-v7.0-rc5>

Feedback and reviews are very welcome.

Thanks,
Sanjay Chitroda


Sanjay Chitroda (3):
  media: i2c: gc0310: fix probe error handling and unwind resources
    properly
  media: i2c: gc0310: use cached client and device pointers
  media: i2c: gc0310: Use devm_v4l2_sensor_clk_get()

 drivers/media/i2c/gc0310.c | 128 +++++++++++++++++++++----------------
 1 file changed, 73 insertions(+), 55 deletions(-)

-- 
2.34.1


