Return-Path: <linux-media+bounces-67008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hoU7KplmTmr6LwIAu9opvQ
	(envelope-from <linux-media+bounces-67008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:02:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E427727B98
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:02:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b="o6yL/UpS";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67008-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67008-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C9DB30EBAA4
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBC544CAEC;
	Wed,  8 Jul 2026 14:49:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008D8380FFB
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522153; cv=none; b=ZxGkw7LjgaYcxwd8H6k3VPtDpE/9nz3AZKHUsvECmfGeH/pfZY/xrgbDzIVWShm9BNb2kwRDrRoS+1MYi0zeT9/a/dJ+SgwXgfDwWnvJUBZOIFvATnH92x2N/yZHCEf7iGyoQESJzLeNeHo1e6PuOrk07ZlPyASDcgG1V2vWvEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522153; c=relaxed/simple;
	bh=PkeGhFY6Q42iKyZEdGoFgAB7t8bmf8m/485EG3n+oRY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eDBntN3gz/XNu1S081UV987FMJKGv9ZfOgVsieF/ETBbokNoIyM+T2tvVlaa7uKgHPJB94SjUjbdWk8XDdbKGBb+ZiAF/B7Vj8TlNXFBktm6Zu9qM8APjJABfSdw5zvaR2sFjpS0zmAle2PxW1vxhDzlQuog2sofnTJK2cmBfzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=o6yL/UpS; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso3244935e9.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522149; x=1784126949; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+9UPnmVuCFG1wL2SpxDmmWCbWX/vi6kSuhm5BA8bibE=;
        b=o6yL/UpSmSDW2dVhQoz4j/Q4cZCyABd8cE9AmDURtvPlwE2/A8JxsG1Y8QJXs+/r6R
         kMySTvdp/VZZVyphXtGIkoXIUslKQxptH3I/bvtkbz/Lsuhn2QK4NXDpbcRuM7H+/n5H
         Vf36/mfwcrsxfzUhBZzFnfBdgDjVaJk4COp//EonzSnip5b6Sg+qh3UQ5nZRsVijgJ+r
         I0gZsQ7bPVDD4DJfHSXKNbsfLWdRcfYXtJvTjM4g29mSiP7AdBAf4otS/8hbCFqDc2iU
         YXQsQPfcT2T/eubmJF8QcOOtTGGVBBwb7otmbZndnSvnmOvs98+J6PF3gjdIbDPpRmzo
         XtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522149; x=1784126949;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+9UPnmVuCFG1wL2SpxDmmWCbWX/vi6kSuhm5BA8bibE=;
        b=rtG8ZgZOA5XHDI28FuGPhJM+Wx3UBa5tq2ro48sDnSX0mAZ3i3fkw09sfU+FwuxEJa
         E88n+Pb0G7XY7Eg3Bw0mlHnJbtyasDPk/tliWKUiZCp0DebYfobfADFohUFYCd6vLrhf
         hM9p1fPkCCNKrPXzgAWEoqPxazZW5fd6Wc/OKUI3TMjd8Y5g9gVqwmKuBJVTPoA9cdfF
         AoqKitI0j8tGVpeqixkBbXccAaeChttJWQSH6cTNv9d4sm6NUk9sehjvQnyTNwKz671a
         E7BIBshIuROWC6lbJl5sarIY6swXgEYxfWH1ne/ZUhZj3Q/KXJRzIe9NC4G239zBONd4
         OAfA==
X-Gm-Message-State: AOJu0Yw64I8c2IiwmnMhhIvHEDk1xAvWc5mwmgc9goMCkwN4HewjcZaS
	snhEG3SB9G+YfravfQbVGvTX24Gkp7YtX7Z0vtOA5fEJiR2Jnh7wMpt9UxEtwKSsZoE=
X-Gm-Gg: AfdE7cmtxHKEZly0nkf4yEep7oVa61uhIe11Oe0WIdKEB2rT+AUoKgOd/COhkSinyht
	+uNJBHpaAGqAs21t6fyH0NZDHVU8+zY3m9tvdx443dRd5W7rpsxVlWE9ns8x+UCdaDhXU+YiItA
	OpPNV2B3vDK19fLOKeKQYktT+hBPHfWu2kgJU8dtWsBE4ScMw5zUkURyE1RjwCC/Zfyfo3qlhn0
	DYoPNfvDjD4ObxfxXrxuYuJPARUTzjzMJnglj1VGy/qN+a2882//8xzigV+HX9QIuqe5IbzeB0z
	NZHsHdLlJ1YYjrX+YsJgLhgdKwyeWrUGlNVbC21PIzNBRwj6qFC6/oJfnuSl+mEbRl9Sq93oyBV
	InJzCd/qdYYz5hnul9RyAL+PWvF7AtpUEjGyHePITFYoVylY2d/Y+sJnRSpt1wJukM8ht1mg+0x
	crEdP8Vm2Kmn2Oo6dV/X5xCRPrO13kLdCbnLMcYwEEp3VaqbrfQJ/9Ghn4I79R8lOY
X-Received: by 2002:a05:600c:1c0b:b0:492:4c2e:9613 with SMTP id 5b1f17b1804b1-493e6864191mr34475145e9.18.1783522149227;
        Wed, 08 Jul 2026 07:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:08 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 00/20] media/imx355: General code cleanups, and adding
 support for 2 lane operation
Date: Wed, 08 Jul 2026 15:48:36 +0100
Message-Id: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERjTmoC/23OTW7CMBAF4KtEXuNq/DN2YNV7VCzseAKzCEntN
 AKh3B03LJBol+9J8827i0KZqYhDcxeZFi48Xmowu0Z053A5keRUs9CgHSA4OVDiIHm4GkQZDPQ
 YySRKQdSTKVPP1437Oj5zpu+fqs7PUsRQSHbjMPB8aDTa3u6dsUTKBW+U8jbpQMbGDiEm7C1Sr
 cWvdeYyj/m2LV3Uhv0/alESpHPgWgQDFvEzhzJFyvk28Uf9vXGLfhEe/BuhK6Fca6gDH9u9/0u
 s6/oAPZoVtD0BAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67008-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E427727B98

This series came about as we had a customer ask about using imx355,
so I had a look at what was going on.

There was significant duplication between the various mode register lists,
unused parameters around, and no support for advertising the crop
rectangles through get_selection. It also wasn't using V4L2_CCI so
had all the boilerplate for writing registers.
The customer also wanted to run the sensor over only 2 CSI2 data lanes
which required some rework of the clock setup so that the MIPI link
frequency could be run at 445MHz instead of the 360MHz used for 4 lane
mode.

V2 has some fairly substantial differences to V1 as I obtained a datasheet.
Whilst some things worked perfectly, the datasheet declared them as
prohibited. This was largely using dual PLL mode in 2 lane mode, and
LLP is restricted to specific values. Link frequencies are therefore now
derived from the PLL configuration, and pixel rate is computed from that.

Being able to refer against the datasheet, I've pulled an updated version
of David Heidelberg's patch for 24MHz clock support into this series.

I've tried to keep it that the earlier patches are largely cleanups or
minor improvements, and then we get adding 2 lane support, and converting
to using subdev state as they are larger patches.

---
Changes in v3:
- Fixed a number of issues picked up by sashiko-bot
  - Unintentionally dropped writing reg 0x030b, which is at the default value anyway.
  - Swapped len and val in intermediate patches adding imx355_write_reg before converting
    to cci_write
  - Initialise colorspace in _open for try_fmt.
  - IMX355_REG_TEST_PATTERN is a 16 bit register, but was defined as 8 bit.
  - Call pm_runtime_dont_use_autosuspend on remove / probe error
  - Missed subdev_lock in set_stream.
  - Not addressed the pre-existing issues of double power_off in _probe error path, nor
    potential for VBLANK update on mode change not calling s_ctrl if the new value happens
    to be the same and therefore exposure range being incorrect. I'll look at them as
    separate fixes.
- Variable definition for format and state in imx355_set_ctrl got pushed into the wrong patch 
- Collected Krzysztof's R-b tag for the binding patch.
- Link to v2: https://lore.kernel.org/r/20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com

Changes in v2:
- Collected Jacopo's R-b tags and implement his review comments.
- Add patches to switch to using the subdev state, clean up colorspace
  (sets RAW), use a define for the exposure offset.
- Added DT binding update to permit 2 CSI2 data lanes.
- Link to v1: https://lore.kernel.org/r/20260506-media-imx355-v1-0-660685030455@raspberrypi.com

---
Dave Stevenson (19):
      dt-bindings: media: imx355: Allow 2 CSI2 data lane output
      media: imx355: Remove duplicated registers from the mode tables
      media: imx355: Remove setting FRM_LENGTH_LINES in the mode regs
      media: imx355: Programmatically set the crop parameters for each mode
      media: imx355: Set register LINE_LENGTH_PCK programmatically
      media: imx355: Set binning mode registers programmatically
      media: imx355: Remove link_freq_index from each mode as ununsed
      media: imx355: pixel_rate never changes, so don't recompute
      media: imx355: Remove redundant fll_min, and implement fixed offset
      media: imx355: Add support for get_selection
      media: imx355: Use pm_runtime autosuspend_delay
      media: imx355: Convert to new CCI register access helpers
      media: imx355: Set the colorspace in the format
      media: imx355: Define the exposure offset, and use that define
      media: imx355: Use NULL ctrl_ops for HBLANK as it is a read-only control
      media: imx355: Compute link frequency from PLL setup
      media: imx355: Support 2 lane readout
      media: imx355: Switch to using the subdev state
      media: imx355: Remove storing cur_mode in the state

David Heidelberg (1):
      media: i2c: imx355: Add support for 24 MHz external clock

 .../devicetree/bindings/media/i2c/sony,imx355.yaml |   11 +-
 drivers/media/i2c/Kconfig                          |    1 +
 drivers/media/i2c/imx355.c                         | 1518 +++++++-------------
 3 files changed, 498 insertions(+), 1032 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-media-imx355-a30f5be3deda

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


