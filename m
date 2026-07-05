Return-Path: <linux-media+bounces-66610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JewjC/LNSWo37QAAu9opvQ
	(envelope-from <linux-media+bounces-66610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 05:22:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C168708DAF
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 05:22:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UTHWrUjK;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66610-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66610-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B496300C9A3
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 03:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF26280CC1;
	Sun,  5 Jul 2026 03:22:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5F2459C5
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 03:22:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783221742; cv=none; b=uePJKiAZhGboDktapuz7ehKUEfb0ztWKuRbZSAKGNAgBuWkILBNW6MxHeIXVGaiW28brEogA2bqDQKRSc2uGF/mIvl/xs9DDANvlMAU8atN0qhPkdIRGY8Tp3ueu+MuhrA1g0NSU0rbVlCBWTN8Eo/3+ZUATH5cH7nX9Lnt0830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783221742; c=relaxed/simple;
	bh=UogHHflNA8CqOvLE8GVFWsBMej3ynkGYFHrDq7WWrCs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kZ03rdoHWATg6OH6kCOOupsirhq2mP9M/yPuX9pW/sb4erDNyaC7AbhQwJ6YBAUjxIvRwtSTAVcrTQ8cTNe86dArulWz8GHkrSHTYtxHCf2owEkSYA2Am2zKYMX62H4HnaStyvcyId8dtHkzQK2kNzMvCIi8QANqUWpwgbmLVSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTHWrUjK; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1336254a91.2
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 20:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783221741; x=1783826541; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YUyL1bFxWaS+QQi3YcGBfEFUpX7LDZmNQCwyRpxcohU=;
        b=UTHWrUjK52BzkVqed6RlgKZBd5lOras4GNJ8gSVLcor3zT52mZ8ycIQQ9TkXemBii8
         1ZsI618+UOCWFOxmLwUDqe6D0vL0PLT6azi/TIw8Cu552PXSA3okSpeni5IM/j0dF/2+
         aASIciirob/7wZoxPVq6AAuDPQuuPeuRzieZEIxP41Gn8oC7r+zJ6b9jgkU6rmuXeGrn
         DyRkervuA5MVy74PK7YUi+11YL4XQHITNMdhEA1RO0x0EX3tVzAecD8t8Ewg6q8bHcwp
         eajpvXL2XW/jMIAQKpIdXiMw7kfYyyvBwZOasYiqU8/VAZXWyqeEQJrTTjwGnIH3NMEe
         DCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783221741; x=1783826541;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YUyL1bFxWaS+QQi3YcGBfEFUpX7LDZmNQCwyRpxcohU=;
        b=VFa4n621XmEfrtbl+xEaG1LzKU+z5gKbVLrZEK7wUzyhQ1fhyIO+uNMeSBrWzGVmvV
         e5a94eae3adWW4woGfu3viwUlMi0z24g6YwCcUdxgqjE3CiW9CeWVNc7AlPpklc8Tv5e
         K3NptFswYdNVzgz4ie5Itm4gl+CMtWcdok50CSAsLgEtZ55sc3fUYfkt6r8CuOfvg8a3
         ZH/3meGywxMfDHLQhvKwNvs8zJzUu/LXfJEDF52/TvDiNVbMGXl598/yifXzbRsjVdNv
         5Re7kWUTZW+bOYEZeJZJWgdZolK5LocGmKy2xdiSx8pII0dgFWrZPtQMClesUUzHC5Xx
         xRyw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7oACkNirHbw+QWm5WAtr3z/N5H0xwEV+ONwQbHk732JvPdPluvLu5vAp+gi37/nJJ0Yq1/WL0j+sQ3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaRO5e5myR8vlsYfRptb1gCpLw1j9fc43eJjY/1ijULilGzKee
	fFsAJK12GH4NnLa3sLpVrw+3wcpF7uB1wQae37o+ZF9tNiBriOWBzfUQ
X-Gm-Gg: AfdE7cmT7F7F9uMqogopjJjIsrx9usSy6xWwJ0IWw4DvmFg0WWxZhyaDkvxkQkhac/W
	oJvM47tNKLOgsiAki69netVuosIhPCfsraos8GQtvRcokTBV0dagw1dShWRlWnmGDVOAl93Oyhr
	sS092IpK6FOTPM12DKTNR5hm6oMQxS3t/biWbUE5L7tCeCuu6xjyo5/s6F0+5Uh6jbr7ml3oXbG
	FRjzPURrw5ep/85+1L3Y595S5gGYglVGM/pDGgGVQnKuOblInr7PsKU3lgRXvgi6yGRdTlfL7xO
	U/vo9vnmBICd0U6yvU0JsE/KwjSN/3q4+f21MUjhN7Rar22BZXFCvqV/GWmhY/xLKb5wm0quahy
	d72x9BhEV3gSX+YRs0YbXL4IyWPWvhr9BbBsjb8FBwbH1sBzQoNcny82ZMzc6wLy0TlrQ3aUbmG
	uML1aIfsIQefSSdlVo
X-Received: by 2002:a17:90b:1d50:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-383f52bd657mr4188451a91.10.1783221739665;
        Sat, 04 Jul 2026 20:22:19 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8900:e54d:68b:5bba:3eab:6b41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813c4dsm35139723eec.7.2026.07.04.20.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:22:19 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Subject: [PATCH v4 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Sun, 05 Jul 2026 08:43:33 +0530
Message-Id: <20260705-hm1092-driver-v4-0-0a13ec274d89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrq1pp1DBlfcwLgqdgRoB02KjI
 dzdohvCwuVL5vtnYgG9w8BOu4l5jC64oU8j2+9Y3Zq+Qe5s2gwEaKFlwdtOihK49S6i50YTGGM
 tgZAsmYdHcq9v73L97fCsbliPS2S5aF0YB//+Poxyufu1j0Ju2lFywa2sbCERlKryc9MZdz/UQ
 8eWdoS1hq2GpDMqSenSapMVW63+apV0kZMxR6KMsF7reZ4/f4XhOTgBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4009; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=UogHHflNA8CqOvLE8GVFWsBMej3ynkGYFHrDq7WWrCs=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqSc3k1GkujVLkiZMT98E4r1uGr9zKp6xm4+QRU
 b5OjrB+5VGJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCaknN5AAKCRAVlYpeERwF
 3p5sEACn+L2mGVSNQruazQXfFVLK5sUiORgpADVx90ES5MkHppSRn5BZsqsCDXkqXiecO7/9pQl
 xwGUyXcsJagWDRnIC82f9zUo2008Uujb2FcFAPFjKx2VC2Kj3fkClgaewaX/2+O0X7VBu4SL8DM
 OWUt2j47JYYVk13MUPZT9HYQ5m3/xsHrMnMEtR6d51odCA5lscvaKXtoDlHJq4KFmjDvvzuhQTa
 2QPx6dl/FiMRikODkz2DbdPzyKnW/FeX9PLfzL9zGbBhKknS1r2KBj98JuaXvwHVqQy9QTfrhI2
 VkX+GBuiKdXbAhqyXq/5BFWguWCqBKzKp+4GxpHiY6gCZWGznT2LLoLTCgCne6PhpXrKe26XN9Z
 lTuMvZdvcGptiIgRyD9MtqDoQwqnQfSkzAT+wjoi296/kuXIOoJ0HWCj8zcYIY68ZQt6kuvMl+2
 49Cf475WR+ZJf8ZyKs2SdBhAwDhyNUC5zq/KWNL7wm88nRAOGfJDJokgX0+4Y2XzzJnQf9kkY9S
 WimBd+54PgIqpBq7NYrRg5dXPZ7TXQIimzFDocwvCNtp5x3cBPw1KRBDwBuODApGLBeROG0Tldc
 fQYV8meTgxzRtco/ZHwyRHzAMlAKGp18/06Na7rrkt1ZWOaRShqgqXCSCNVIQ3G0TgAhKg4eC0M
 Wzcuxn0Ty+NHkgQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66610-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C168708DAF

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

The sensor driver and its binding are SoC-neutral, so they are sent on
their own through the media tree. The board-level device tree and PHY
work that wires this camera up on the ASUS Zenbook A14 will be sent as
its own series.

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
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

 .../bindings/media/i2c/himax,hm1092.yaml           | 109 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/hm1092.c                         | 728 +++++++++++++++++++++
 5 files changed, 856 insertions(+)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260618-hm1092-driver-a6f2aaddf201

Best regards,
--  
Ramshouriesh R <rshouriesh@gmail.com>


