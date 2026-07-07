Return-Path: <linux-media+bounces-66875-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qvl3JxEyTWqhwQEAu9opvQ
	(envelope-from <linux-media+bounces-66875-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:06:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0171E15A
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:06:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b="H+z8Qk/l";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66875-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66875-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5A7630074F6
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE9543784A;
	Tue,  7 Jul 2026 17:06:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8A741D4C1
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443978; cv=none; b=By/c1RShwJbtmDkhL68mgPo83zA3N2BGoHpeaIfDPEyjFOlnV9YWRsCMfi01bJVY33vBscvY/HZiC+SS2OoIU9sclo1ac4nvrDjQ1XxvmAjhkWaem0R9wJxMZMccglXbhm9+revxunAf0okJdwGMeyNj9PhWCS854tIB2pgOJlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443978; c=relaxed/simple;
	bh=XjcantRHqujraCkoG10YtUTCxsHNyNT9YOjAxukf+cw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YK/WGTz/omufkNRYfuMGUcCh/gri/Z3MzUxpGuR8NclOJRzTNiUZuiO3uzRfeL/iJFXawbnECJjbl21C9VjETJY3Y92Gwh+TNTJECTM19iVE/vnFdGzMungIRZvBZYU1Xm/qL6RBDR7HVLE6iTw5Id9AKWqtnYyllIBzW6WFjzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=H+z8Qk/l; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso19446015e9.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443974; x=1784048774; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5en/aJUKwFqffgmyTdsB0nU4jEKYPOBxxBLBV03iHyI=;
        b=H+z8Qk/lb6uIBOl9iYPEIgbLz6CDm+2cKJSpPU0t18e5sbhGqX7jrxtb1q7Xb7dtTd
         V8ok4r/3w2Jm6MjGRTQcGD1lEgzwPTzlVsyzcGHs+nTCcmrci4QphoqilCqYIv11yrkl
         DPgIT9w6t0iFBP6t/RpEbepYXHOAWx41PTIj8sIUCo9OyIS8hQ65ETd9JV5xn+f4Hsj/
         uCUGwy3m25fLNxUzZGgEPlYCqWyB2xjHwIEB0hA9aZMS02PFFarwQtTZmG8WN+0eo1E+
         lIIH16Nwq1RCcqyefiFeQEsobEvXAfQ55IKPzPlJ8n64UylOmSJ+mFk9whXpP8H+VYrz
         aQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443974; x=1784048774;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5en/aJUKwFqffgmyTdsB0nU4jEKYPOBxxBLBV03iHyI=;
        b=ldrsGcf14hkel35BA3zOP1tKz9hx4LJumR9DcPbT8XpAPuQnHaXrVA6zQ67xrS9nDb
         KsOOqrwc8nWc7fwJ+dnEbcdslBU4JCQt/nFGsUaMJ2/EI+Yd0HpRLJjmAsJ8PnQvUr8s
         VTDAyw8fK5XZLVmfzThxigx2QtLhapPHrZ0pTfYllP3FpjPstCPq17RY57MwPGXrkAZE
         7fDMHsUDjB9g830yVvzOsau+VgvXMfkaeR9p9KAe6Ls7rEaGEwv8l6NaPfZSswCPj7wv
         17r6YU1Qf+D25xLcrTL8HnHweL5JpwSz4qFhPDbsM8SVao4LMIjktHpiTbhJ0xWC0Cb+
         VYzw==
X-Gm-Message-State: AOJu0YwBOs9lFpPkNUkNE5MHknHyr4ow6iPoGI8yAw3wFcm6yNt9UjnS
	HM2RnINBlg0MfUKYafV5Qe/kytDLgyUi0YhgWIAJLXehKN8Cke+BLf/Dz/fcxAsV448=
X-Gm-Gg: AfdE7clFGK8I11h9RI3XQJ6jPn6fhm9aW6J2uzSm7Ole10o6nfzUe79P5gvMa6CjtM0
	TcnfT2P+P6BlDMrrFeYLPdfJWwwOELiDLS6nz9HYOF5vtMSLoA+k4gGWNFTkrPeSKeTpjCclFoi
	pzeb0S6lZHao4scGMXS1KRP8l0dcrTN+wEFOBSvVo/Z92YgJT5G2277BXfoNpD+Rtdxgndy3o/w
	8xbT1COaasBdaNji6hj3yib+6nqHLlwaeyP0w+LiC4GT+aEsTm4e5C82aZ6/7Dcm/0cQzZ8cj1E
	JfNNHAfvu1shwZTPx6y4occnVLMgMjwjODT0j+TtrFgmt/fTBFA9zcZPXAgIQ4b2liGqmb9M5o5
	0u/oDC4ikQUmRpIytwjvy41rj/a2JLwUQxENP7aho+j3YF0tb72Lo2QWz8Xl1+JOG6F+mjftS62
	FusMtnQvT2L+BIq/gZJN/jOrnKkY2kOPt6OzUKNF9hCcwPKtZUZbQhe0Yv+7kXjc1U
X-Received: by 2002:a05:600c:46d1:b0:493:e451:fb8 with SMTP id 5b1f17b1804b1-493e4510fbcmr21750135e9.21.1783443974589;
        Tue, 07 Jul 2026 10:06:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:14 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 00/20] media/imx355: General code cleanups, and adding
 support for 2 lane operation
Date: Tue, 07 Jul 2026 18:04:32 +0100
Message-Id: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKExTWoC/22OOw7CMBBEr4K2xmgde82n4h6Iwo43sEVIsENEF
 OXumNBSvpHmzcyQOQlnOG1mSDxKlu5RoNpuoL77x42VxMJQYeWQ0KmWo3gl7dsQKW+wocAmcvR
 QKn3iRt6r7nL9ceLnq1iHXwjBZ1Z117YylBWyjT06Y5m183uj9d7GyrOxoSYMkRpLXGL4uu6Sh
 y5N69NRr7L/p0atUDmH7kBo0BKdk8994JSmXnZlG67LsnwAGzJI9foAAAA=
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66875-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2C0171E15A

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
 drivers/media/i2c/imx355.c                         | 1515 +++++++-------------
 3 files changed, 494 insertions(+), 1033 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-media-imx355-a30f5be3deda

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


