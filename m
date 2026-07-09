Return-Path: <linux-media+bounces-67111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KJ42FZVZT2rhewIAu9opvQ
	(envelope-from <linux-media+bounces-67111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:19:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD2372E2E6
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:19:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="pm/HadQM";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67111-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67111-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0102D304C60B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 08:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1645C3EA947;
	Thu,  9 Jul 2026 08:12:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D13E835E
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 08:12:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584754; cv=none; b=oEqYj5VVgu7LRDAqyO+5jBZEw78AEQKW3lQ7/xPE7RDm4m8aHZvnbWR0W1UX/oyPKP9A9GnawB3Bg4IxP1BCTETM6nCWxD9VWJIlhtNemJPZLFTkdAdG+p8uIHkSqsvYk5izM9CAVFBbubXT8lTY/69zsQh/In8APIUSJFf5Jqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584754; c=relaxed/simple;
	bh=W1OXVY9puxMvuLpLOktjHcdYOOhnW9MMsJY9qFlEz6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SdbzX0s2byo0xBMaFBRXc9VHadh9Y1ALAOhvv3T+klfYKviWKVqu++5Ig38cOmDyaroEnN0cETULwRZWDpSeLypJzxIMTi2s9vmpNLHft7T/E6GqiS+A0XM0h1Gpj12T+Y2C30qO75tXeF8kNb6Bp/+IJN/tybeGhebEEG8sQSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pm/HadQM; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381ed661712so718061a91.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783584751; x=1784189551; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fuRby/8yQ9T3IbKDfaI8jasKcp0bZvcAPDvEgOKp9H4=;
        b=pm/HadQMTJTaSz1pTHDWiQ08wZsHo7WL/Xr5gr29ubXtwo0mjgZFiPbL47xugnI4+n
         dfjCYLvrO2sXRiEVPiA2BtRJvbx5oo57i6FF9VitnxFc5eHdaFMtrsVAW7VTUYYGjoJv
         BgMHO6Vw1Ops+DkM+oZAuq3FUQIhf8lcCbPTul/RysbHiFHm8mUle5DyI+nvQ3r6bRFB
         VMHyv/KVHEkmgCfaX47KGviFuyHGF4OXYe6ff9iLqXSAT/PsbzxzhiXYSjRiPUbwiyoa
         ImTM7oPBA9RZR60B0iMO+PQ/TmGkd6u1OkWQ4xSYMTBT0+BbwMZvyad6R4/N9KwF0m5i
         5S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584751; x=1784189551;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fuRby/8yQ9T3IbKDfaI8jasKcp0bZvcAPDvEgOKp9H4=;
        b=bVcRwZI2KImdREHBXwLG3qqO/5II7VZXINLBbNXVZcWCAHgEJkTLJn+olkYfG7bDme
         nWSYyXSWFcxQV7pddVat4JLLQnug/AkZ655svi9or8waUiQy5jcQMYXz224K/5s+cVoe
         36jDis1hjg6io0BIvoKIR74K1CB7ZUD+K2oMs7+Z9tA0+4owDCQW2NZdCidFkQkteg27
         comGSS0z2yHCOEt746okrDXq/MH2Sx5H5JOLV9oVaufQkZ4d6UtQzHKm+skdhOApJ8Ji
         cz9vwBiq8WQI3zgjOLOYrNHwQ3Fb8dirvugJcGO7fGktBP7KLs6Bfz2+RKQdOf4wPcio
         3hSg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+JDENXloVga1Cn6iyOVaDlg6MEUI/FDIGBD+3iptjlAWPUJAX7rl908UTvpfld3u1qDYj7KlgpBiz8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ9YMMJBro1Ltu1p9/YRqPq/TJzmGDy+NRshgHRlVdBPxeGS2L
	9bOCVAXPJv2Zk8648CF21HP5Af8miD5e/hDvtneUnNalT1kK1fgYY3Km
X-Gm-Gg: AfdE7ckb9DdMldXs4/j7XQGCsiJTyUN0UPT3IgIYsWakjDhetup4vlJgBaQ2KEOgUXD
	YQi8vk/zKOoBO4VTMVcodbK2Xmodv14/w+mFutCulzcyNMQHj6aebpDZSpwQRVObpt/EITkM0IY
	0JgPmE/ek2psNqfR6EAdrzXbv4xcaPk9e5BDA8tdJeqNmE4uDJ6UoOnnDtsVQkbJe4zuTY4Vfb4
	KGVMDdfroAPPf9+OrSCJEw6kRsm6hTbQ4dXuE1FMr824p67LDYrBgAzQZRTTdtJy94pJHUDQrd0
	Lm8CE4OTxyx5NWKIrA62uVLM4jZMl2WdzwvSEBPkZcgPHrzQ5kcyJrcaKQnNI2TbEqrbTcA1ICj
	ZSQFx3CarYbp3yKJUkmyc0p0uyvRQ0WyFcBSBIuCvOtU6eJZgCPdJjENNSTAPT1LSmHhxqLA0Eg
	nIuK+ScImVGC/DNKnBeA==
X-Received: by 2002:a17:90b:3149:b0:37f:9ce1:7367 with SMTP id 98e67ed59e1d1-389416ebb78mr5632903a91.29.1783584751376;
        Thu, 09 Jul 2026 01:12:31 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8902:7295:9616:9031:8f8a:a80a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm10274601eec.26.2026.07.09.01.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:12:30 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Subject: [PATCH v5 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Thu, 09 Jul 2026 13:41:53 +0530
Message-Id: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQW7DIBCF4atErEsEA8Y4q96j6mIMQ0xVxxGkq
 FXkuwcnG4tFl0+a7587y5QiZXY63FmiEnNcLnV0bwfmJryciUdfNwMBRhhp+TRLMQD3KRZKHE0
 ARO8DCMmquSYK8ffZ+/h87fwzfpG7bZHtYor5tqS/58Mit7tXuxeyaRfJBfdy9FYSKDV27+cZ4
 /fRLTPb2gX2GloNVeswBGUGb1DbVqt/taradgGxD0EHcq3We921WlctUCpy0Gtvh71e1/UBUe+
 56nYBAAA=
X-Change-ID: 20260618-hm1092-driver-a6f2aaddf201
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5027; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=W1OXVY9puxMvuLpLOktjHcdYOOhnW9MMsJY9qFlEz6A=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqT1fnu98JgGCIxuDSLTnJB0MNckA0tDSB3EqE8
 YEE/e3bQVSJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCak9X5wAKCRAVlYpeERwF
 3gjBD/wLe8MNEWtl3ZhzAzeRd/3+zjtKkWmiNdzCOjCVQ9YtVE6pOIDZGH3SaHbSGyGeg9ziiuC
 QttRlc0PfKH23qfdJih4w8AcadHEaD3F2sPc7IQ6ZXRXB468tRYGbb8Co7Hboz10yuF/79BWW14
 V9cWggSY+CXPIC1PahGm/7oE3bSgzFBWWYrMVBJnJgAiPHvVFrr7UAXDhAknlbGKuO0Z+VYEvkY
 oK1LkbjoVQDVVxtIfrmNiFPsFMjQetb9UszwMIMSgxMnK7zJOMRTeZV71kaGdIhcgz0l9lKYBl0
 FKKl5SZYCUhKdOUe/R8veWsGd0EQJGfvkTF7dS9j6kzyqJJW7ES87V4tZW5uisxsNpU3mnKQtw2
 N9XVQboAnc27a88uk7RXaBjxjyNC//0xuO6sJxerwc83DShKjxjUBjQdZ8YsXXoHMZxtPAcgvfh
 v3Gzq0wTKLga6fIudl1TiP2BDezWw/QDOLfnqWiWeLsAZxdxgbKNzYtBI7yUHMEyJvIAgIkYvJV
 bLFrluxQwj0yxEYPx30sNINblM/uTZddFXu4Si+uiVkoZCt27tx9lzaj+KmyjakzpxgMTZPu7Es
 fb0tiFhpkIHFPxwvVGm5xCw8DE72CabvJCblNaNMrYwOwC4Xffe7RD0MiK07TbqZtV3e5k6FBoF
 A0g7RnfEZYQ+bcg==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67111-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rshouriesh@gmail.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,gmail.com,microchip.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDD2372E2E6

This adds a V4L2 subdev driver and DT binding for the Himax HM1092, a
1 megapixel monochrome near-infrared image sensor. On laptops it sits
behind the IR camera used for face unlock. It speaks a single MIPI CSI-2
data lane and outputs 10-bit RAW at 560x360.

The driver exposes that one native mode, a test pattern control and the
standard fwnode properties (orientation, rotation). It has been tested on
real hardware (an ASUS Zenbook A14): the sensor probes, streams, and the
on-chip test patterns come through the full CSI-2 pipeline.

The available HM1092 documentation does not describe the test pattern
modes. Their menu names are based on output observed during hardware
testing; the register programming was recovered from the Windows driver.

The pixel rate, horizontal and vertical blanking and the orientation and
rotation controls that libcamera requires have been present since v1; v5
adds the get_selection support requested for libcamera. The one gap is that
this driver does not implement the V4L2_CID_ANALOGUE_GAIN and
V4L2_CID_EXPOSURE controls that libcamera lists as mandatory for RAW
sensors: the same lack of documentation means the gain and exposure register
layout is not known, and the sensor is driven at the fixed exposure baked
into the init sequence. Gain/exposure can follow if the register map is
discovered.

The sensor driver and its binding are SoC-neutral, so they are sent on
their own through the media tree. The board-level device tree and PHY
work that wires this camera up on the ASUS Zenbook A14 will be sent as
its own series.

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
Changes in v5:
- dt-bindings: drop the data-lanes property entirely; the fixed
  single-lane wiring is not configurable, so it does not belong in DT.
- hm1092: implement the get_selection pad op (CROP, CROP_DEFAULT,
  CROP_BOUNDS and NATIVE_SIZE) reporting the sensor's pixel-array
  geometry, as required by libcamera.
- Link to v4: https://patch.msgid.link/20260705-hm1092-driver-v4-0-0a13ec274d89@gmail.com

Changes in v4:
- dt-bindings: make data-lanes optional for the fixed single-lane sensor,
  constrain explicit values to <1>, and omit it from the example.
- hm1092: add the copyright notice.
- hm1092: replace the private register representation and write helper
  with CCI register sequences and direct CCI writes.
- hm1092: use descriptive test-pattern names based on hardware captures;
  the available documentation does not identify these modes.
- hm1092: parse fwnode properties before creating controls and set
  read-only flags after validating control creation.
- hm1092: use the generic get_fmt callback for the fixed sensor mode.
- hm1092: initialize endpoint parsing with the fixed one-lane default,
  reject other lane configurations, and remove the redundant endpoint
  presence check.
- hm1092: use fsleep() and null-safe GPIO calls, and apply the requested
  declaration, brace, return-value and error-path formatting cleanups.
- Link to v3: https://patch.msgid.link/20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com

Changes in v3:
- dt-bindings: add the Reviewed-by tag from Conor Dooley.
- hm1092: initialize RAW colorimetry fields in the pad format helper so
  userspace values cannot leak into subdevice state.
- hm1092: return -ENXIO when the required firmware graph endpoint is
  absent instead of deferring probe indefinitely.
- Link to v2: https://patch.msgid.link/20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com

Changes in v2:
- hm1092: use pm_ptr() instead of pm_sleep_ptr() for the dev_pm_ops
  pointer. The ops come from DEFINE_RUNTIME_DEV_PM_OPS(), so gating them
  on CONFIG_PM_SLEEP dropped runtime PM on a CONFIG_PM=y, PM_SLEEP=n
  build.
- hm1092: free the control handler on the error paths in
  hm1092_init_controls(); the fwnode-parse and ctrl_hdlr->error returns
  leaked the handler.
- Link to v1: https://patch.msgid.link/20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com

To: Ramshouriesh R <rshouriesh@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Ramshouriesh R (2):
      media: dt-bindings: Add Himax HM1092 NIR sensor
      media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

 .../bindings/media/i2c/himax,hm1092.yaml           | 101 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/hm1092.c                         | 767 +++++++++++++++++++++
 5 files changed, 887 insertions(+)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260618-hm1092-driver-a6f2aaddf201

Best regards,
--  
Ramshouriesh R <rshouriesh@gmail.com>


