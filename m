Return-Path: <linux-media+bounces-67649-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +ymWOQFzV2r2OAEAu9opvQ
	(envelope-from <linux-media+bounces-67649-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:46:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E775DB15
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:46:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b="Oc/Q8lS2";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67649-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67649-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 383A9308E5B5
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF8543C7DF;
	Wed, 15 Jul 2026 11:44:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EA3434E56
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115852; cv=none; b=cdrGtsr4Ep79TJ24aaMuVID3qcM7pB8Ohu5zP1/NNJiN+/QAJtDUtQHHm7wGf9YuwEwP7tmzRnSf3ToTibUzgL6t5nkpjxFWAU56dDVXGb3DMESQ/9rvywdTSg2kdmu+LLn+TJb1QKkT2doZyFAaWu56RVq1soR59ReUQmbBLIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115852; c=relaxed/simple;
	bh=fMzfDJMKQUZ03KS16inXaqdjVjmByxXsgM2IAEum4ps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ffwW6926s9JR+HvpEIXvejo0FEzs+/15xjXwSzlNMANwvmwo5tYAqSkbery/rEPreN0TVLlKpZGRS5zfk4cVMwJkFpudIxcUTALDQcod07sL4sc6wLh3d3ihC1RFuyoGLHO78A5R9SOZ73ksLQAQP2ZwWhTd5XNPNg5cNPeZgiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Oc/Q8lS2; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so11940715e9.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115848; x=1784720648; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t9uTLI4PNn7Iu3pBhUskUo84883YLgKy0z27USpVPmo=;
        b=Oc/Q8lS2xXFaLx2JwKJAc9ZNK4NgrN2JjJUzcuHCgBoisZpbQsZdV+LcqJy+qz/5EF
         afxFKKWaQNjALmRPu1e4pCWdB0nvlibbSYs58zXdLPFAPCGVF9nFbz4yI6vlHN7OdOR4
         rciv0PUx585ibd1YW3dnxqn9QMesNdpQ7xYey0TsGwpIm71Ozfc6s5IXGT/Q6nBLKd1+
         ZGMS+cA76lXIrEqUDLl2m+fEQRud0p0by8nyv/z8ZWI4hcauJCJJ2t8w6Cy5oyrcXFrr
         aDHeVrcwwU6BC8nbWREVQpNBED2+G1M/S3W7u/NKDOe1Es5VWwHwKINVKqYJU/zpfxB2
         mP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115848; x=1784720648;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t9uTLI4PNn7Iu3pBhUskUo84883YLgKy0z27USpVPmo=;
        b=Tc5rX2F19st3blsu1VolOLMVE7d9TmuE3ir1RmH+wvTYmFQE2kQmzpINzRdympVOrT
         3ku9ZALCwh0b160dlCNzvC8gkSoiy87fXMVcgdiwxDK71uXg6V/ShCUsIzIGLWqtGob4
         Dd8r6Pnko2nn7h9KX30Lybn9QZQAnSq0hJ0DB4ifEc0d1SRJUo0N533y68x/3q+nQhxr
         Y5SXkd6IzGV7B5+uuxVvYURNW3ybbi9/l+XlTMUtl++NwpcV/YbZD4xBPoioW+GVSTrC
         S/IUS3DZdjY1CYIDR/OdWcvDqxJYfdE1Tlh6r72bhaX2fT3NPUENdO1ryCLiVrM6QMDl
         T5Jg==
X-Gm-Message-State: AOJu0Yw2WKrpi4ub2SQo+JkANu3YClnHyIGvHmNBDh6LmI5H8UWP5bNV
	W9rJA3truaxjS8IqBGYJzR8WsbH1Ox9Wz4J1ldyUXXH8geRy9DFaE8TEky+tOKx3D8k=
X-Gm-Gg: AfdE7ckAd8WguvLt7ywE2JqK71+BcVDuhqCFPW0FY1hWhMRxqerNus0J/E6OWIEvlOZ
	XdhAZNqt/RO7fm7i95HV/xOGC0BNxp81l4AB/vuGVKhs6CHwDs9tH66B92tBTmOy/eL3veIR+tJ
	bQFrO/pu2RHTUhKk6sOJwEgH25IpfBgbuO/Y3Zf2ndVDsmxrF6v7uyS8pvSWlluRC73nKpXKJce
	gqGXXFi5dJUwo2knVxYru7M/bNTeKglSIzS/OB/bnp5j7BnF4FmUAQqy5MffdBy/IvjSqlmQPjS
	fA/Lo5ami5soM9vlKk2xqoO9gSrfvRXYZPHFuyPwO6GNJGoLQVNCFTQvsScZV7wkz959gedYsLL
	fTTyuYIVjWLRDsgpj9+e177DHIGYzjsVoy8Pg7tQ1cy/E1Bt9XXXvRBRJA/lEBVandFWJ3VSnRc
	+1To6Z1sya8FfPcD191dusn6kIk/27nrmmYUE/DrRq+O6G/Fzq6sWmIjRtAwE1FDoi
X-Received: by 2002:a05:600c:2244:b0:493:e543:1dd9 with SMTP id 5b1f17b1804b1-493f2ab7772mr176681565e9.9.1784115848112;
        Wed, 15 Jul 2026 04:44:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:07 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v4 00/21] media/imx355: General code cleanups, and adding
 support for 2 lane operation
Date: Wed, 15 Jul 2026 12:43:13 +0100
Message-Id: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJyV2oC/23OQW7DIBAF0KtYrEs1MAzYWfUeVRdgxg0Lxy64V
 qLIdy91Fq0iL/+X5s2/i8I5cRGn5i4yr6mk6VKDeWlEf/aXT5Yp1iw0aAsEVo4ck5dpvCKR9Ag
 DBcbI0Yt6Mmce0nXn3j8eOfPXd1WXRymCLyz7aRzTcmo0mcF0Fg2zst6hUs5E7RlN6AlCpMEQ1
 1r8WudUlinf9qWr2rHjUauSIK0F2xIgGKK37MscOOfbnF7r751b9R/hwD0RuhLKtsg9uNB27pj
 A/0T7RGAlujhga73VGA+Ibdt+AMPZ1YuAAQAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 stable@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67649-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:stable@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F8E775DB15

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
Changes in v4:
- Added patch to avoid regulator/clock imbalance. Also means autosuspend is enabled
  before first _idle call in _probe. (Sakari and Sashiko)
- Lock state through the whole of imx355_set_stream so mutex is held in calling
  __v4l2_ctrl_grab (Sashiko)
- Fixed leak of media entity pads if v4l2_subdev_init_finalize failed (Sashiko)
- Sashiko flagged a pre-existing issue that pm_runtime_get_if_in_use returns
  -EINVAL if disabled, but imx355_set_ctrl (in common with ALL other sensor
  drivers) checks !pm_runtime_get_if_in_use. Not addressed here as it appears to
  be a widespread issue, and has more significant implications (have to assume
  the sensor IS powered, but then not call pm_runtime_put), and this isn't going
  to be the only place that needs consideration.
- Fixed build break in the middle of the set.
- Link to v3: https://lore.kernel.org/r/20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com

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
Dave Stevenson (20):
      media: imx355: Avoid calling imx355_power_off twice in error path
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
 drivers/media/i2c/imx355.c                         | 1522 +++++++-------------
 3 files changed, 503 insertions(+), 1031 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-media-imx355-a30f5be3deda

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


