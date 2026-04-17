Return-Path: <linux-media+bounces-59035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAeZGClh4mnI5QAAu9opvQ
	(envelope-from <linux-media+bounces-59035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:34:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F941D2B0
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42C783059FD1
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8FA355049;
	Fri, 17 Apr 2026 16:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRycPtJy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2049A40DFBB
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443583; cv=none; b=DrIWLvY8QC7s2bZ8hp+g9BYnPwHMZ3B7E64BoxXqKGu1+YiNdHhBN4kSDQn0WoJNuHZJN9csPr9ccXE0rl8yOQEetLeBPj0dVIsI6NTMR58AKtA3YKaTCWDfSXbMQUkgTNEOdRq9NfQMnTxT5MOl/ZQyaa2CzKYTFJgnizatbt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443583; c=relaxed/simple;
	bh=J5OgcCFwnIrfrY1lDLbmiededcV0yPWST+7OK4/Q97s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R18/o23JwPTW8NjxFsItJMN1uzki5f2dZ3uen9zjhP4NesdmkmuoZ9ZtsbwX7j7rheedElPBujreKjKATjr4sfKCyBcvRapPhyUnYIoBQwZgUVfgrtFFN5e1OH5wzuCmGcdfHpBlC7jVrtfGjwR10ZeR4iIEAkAryS0aCpUlrhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRycPtJy; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c79c7ba8cso86778c88.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776443580; x=1777048380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kC+iWM3xttVqCKTbazgg1uNec6BeUwe65zeKYKQox80=;
        b=DRycPtJykx3+fBjkLXoJUeVKLb3ZfEToqWVnwHvIiZbQrHOmqn/hyeOILH/yDG7O8F
         GJfNlgZEKlrHFpgi91jaf/obNPem5KxtX9zR/iCAgIE/xAXKVshF+RYMb8Gx2GYP7yjc
         UKz/CS8m2giS8fwfu3tjwyz3dPctsfZWnJ/LCJejj3GlsZ+rfQxTKH8HuJAZeiayVc5N
         NLCe3Afo+1Lz+OuBCQSYJpguXb56W0xnPNmeOFwTMs4WW96SIvCxYuIK+3+waOpEBPbz
         /m9a2QPSz8az3b4lOMiIbGoTsi78akBghxeYkuWsry+5JOs0xEirWV3mxpBAagPKEpT+
         XDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776443580; x=1777048380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kC+iWM3xttVqCKTbazgg1uNec6BeUwe65zeKYKQox80=;
        b=r/eEsO5f5gil4ssHa2u+imdCwnHuItysATsQbAT3UwN92hghTolHmfiuuqh0s4mc9h
         I52gHSltP/BgeNvOijj7SE4TkZB40ecoARmihaSOsoXXP/WLrMJP5veKpDZ4z1ILHUSk
         oPels8uXcGXMIx3fRp2jq0RSaDZzYMG0r6N49XWQ40phW9nBiNDeOurC5FnGXE00Twsx
         hm5WcYs8+c4KKTBs2pbZb+IfnJ0AK5eUYFw+/HCDJQt/k9b110rXXpH0pTzJYyfeSWt7
         XsGQgUPY90sgnG/t0qznsFAHnTjwySHoVycl887+LxRlCwqo0tPCEZ5rgiB8q2CBGhCh
         9h3A==
X-Forwarded-Encrypted: i=1; AFNElJ+1hw6LuXn/RiE6u3YBDpRceBYoXRHdjYIMZkw2vKv0JlaeQTf4FNkKb55ERAcWfMFfgxaxltnLRQ1NSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz853rs5mxylfPLMTuH6IWZ26gGH1t7FrNJAr5ZWACAac+3AmwR
	Yq9UiGXIsv5zbthn3uLyig4mjksz6pt3F0uPmHC4SGzgZETn60Jv5vcz
X-Gm-Gg: AeBDieuQ3bkxxT5AigdwrbBoMCbI19G2FXBJWf41HwJUt/QvnzC6Iy04w2X2CDGu9Wy
	xyD9iF8Lk2bin3P2BuW+A3SrBKyNSngECiBPa0KwIKVb4g5eT/sgwD3ULme49En13ZPf+5D+pPC
	Xtpfx9EUAlhFFzSEQ60549Vz34GLsNv55xQT87acLUpiEcabCHzVNEHGlHfe1LsirLBZQ4C4+bx
	HSOWU7oHqgVKrIjF7KCwSTtMMx56Ii6kjfUWly683fZ8318FOFv4++SQofMSkeot8NijbvtQOCG
	GsHYyBKSQ3T+uVulTacFn2LGcx/ogTldXQrO4vhhp8c6qnYjSLUkRQFgUAGjoVaKj7Qmx5z+Blk
	E5LsEFf2XzQx8yhQ+MdixksljwNeYPMcO8tv5QNrauh4eDo564FcxYpAMtcoVqKBVcAkjof8hv/
	NpOMmaE57cS2AMtq6bMYbxfSG/fBUFQqClvCxviCGZXxhjN+W99GBnJayJ8IX/klce5A7zTLnNq
	iQYgMh5
X-Received: by 2002:a05:7022:4191:b0:12c:427:dacf with SMTP id a92af1059eb24-12c73b05ceamr1418713c88.10.1776443579756;
        Fri, 17 Apr 2026 09:32:59 -0700 (PDT)
Received: from TC-LAPTOP (23-93-157-142.fiber.dynamic.sonic.net. [23.93.157.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749dc86bsm3603777c88.8.2026.04.17.09.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:32:58 -0700 (PDT)
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
Subject: [PATCH v3 0/5] Enable cameras on Dell Latitude 5285 2-in-1
Date: Fri, 17 Apr 2026 09:32:47 -0700
Message-ID: <20260417163252.15603-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59035-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: E64F941D2B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Changes since v2:
- Patch 2: Replaced the GNVS AML scanner (rejected) with a static clock
  consumer list in int3472_tps68470_board_data.  Adds n_clk_consumers and
  clk_consumers fields to the struct; probe uses them when present instead
  of for_each_acpi_consumer_dev().  All other platforms are unaffected.
- Patch 3: Adds dell_5285_clk_consumers[] (INT3477 + INT3479) and wires it
  into the Dell 5285 board_data entry.
- Patches 1, 4, 5: Unchanged.

Background on the _DEP issue (patch 2):
The BIOS leaves GNVS field C0TP at zero, causing INT3479's _DEP to resolve
to PCI0 rather than the INT3472.  As Hans noted, the i2c-INT3479:00 client
is created correctly by the ACPI+I2C core (PCI0 is available), so the device
itself is present.  The only visible effect of the broken _DEP is that
for_each_acpi_consumer_dev() on INT3472 misses INT3479, and its clock
consumer lookup entry is never registered.  The static clk_consumers list in
board_data fixes this directly.  Tested without any GNVS modification: both
cameras are operational, confirming no ACPI table patching is needed.

Tested on Ubuntu 25.10, kernel 6.17.0-22-generic.  Both cameras working in
Zoom, Chrome, and GNOME Camera via PipeWire.

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477 and vsio power supply

 drivers/clk/clk-tps68470.c                        |   2 +-
 drivers/media/i2c/ov8858.c                        |  23 ++-
 drivers/platform/x86/intel/int3472/tps68470.c     |  35 +++--
 drivers/platform/x86/intel/int3472/tps68470.h     |  13 +-
 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 176 ++++++++++++++++++++++
 drivers/platform/x86/intel/lpss/intel_lpss_acpi.c |  16 ++
 media/ipu-bridge.c                                 |   1 +
 7 files changed, 254 insertions(+), 11 deletions(-)

