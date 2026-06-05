Return-Path: <linux-media+bounces-63857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LVh5O3JFImpCUgEAu9opvQ
	(envelope-from <linux-media+bounces-63857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:41:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B751644ECD
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:41:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Vohpo641;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63857-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63857-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74EC13051D61
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 03:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600533F411E;
	Fri,  5 Jun 2026 03:38:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225A31714A;
	Fri,  5 Jun 2026 03:38:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630736; cv=none; b=ZLEvhA1PPvAOkSMyk3pZXAQkjrJG5u1PijxP9Wsfkfga9WkBJ25WHlthcSBqNarGVA+5JZ/B2cQnukAr1emOrOIwFLH0AfaRa1kjh9Vdaa6H2914ZHv0IZEDAJaT81HAQq+a/k0PfOwzMU1wYsVzM2mjerE1A6gPhbSDEKAHqfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630736; c=relaxed/simple;
	bh=+/Pfejnvv47jdCDVLiewF3uDmKJ65qBjBwcc879f1Vw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ua+x7pkj4xoPjKg6mPvX6DdLgXfUMFiRlrVjWhJ4b/kGBnk5BCI9YrgbwFnsEt8aWD6MyZwUENmI8noTYclQwO6p3ZZHbeiJEn6IwuvZxNf1Xgcp+KaFgycceofmi2r4SU9h8194DF4yVNf7q4QNI2Y295ucK7TctK98KM0Jl0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vohpo641; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 868BAC2BCB8;
	Fri,  5 Jun 2026 03:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780630736;
	bh=+/Pfejnvv47jdCDVLiewF3uDmKJ65qBjBwcc879f1Vw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Vohpo641OfH79ekkpiYlQLKDKtus3VJ5nOAcYBl2yYCYdSrTl2sH8mC6n9LNn7i/j
	 z/TJvHSGsrxEgcUGl6QX4hEiJ0F1O7TByMN6rd587b5E1nI9EhAdebSsMOdC5yrAzo
	 QW1wbXg6Y/sX99o+crFvC/7qcuQJkrjvxojSDIrX4kcVWC9DHPJ9A3cnHr+4hMEwVG
	 eqIhWJ2EM181fxxVI4W5mX8bXmrakJqN3PcIU1vL/tfDg/z+cFD2ecfU0DNJHRH2WP
	 xAurDWPWtBuPRzfnliB/VgM8FjCSBD2VMkGrLIXyYFTVRyK0kWe4B+hrX3x/NaKO15
	 4yt8BvbfCcyrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B71CCD6E74;
	Fri,  5 Jun 2026 03:38:56 +0000 (UTC)
From: Herman van Hazendonk via B4 Relay <devnull+github.com.herrie.org@kernel.org>
Subject: [PATCH v2 0/2] media: i2c: add Aptina MT9M113 SoC sensor driver
Date: Fri, 05 Jun 2026 05:38:54 +0200
Message-Id: <20260605-submit-media-mt9m113-v2-0-de1cc807f4cf@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM5EImoC/x3MTQqAIBBA4avIrBvwhxK7SrSwmmoWWmhFEN09a
 fkt3nsgU2LK0IoHEl2ceYsFuhIwrj4uhDwVg5a6kY2sMZ9D4AMDTewxHC4oZbD2o1HGOqtmDyX
 dE818/9uuf98PtvqZl2YAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780630734; l=3080;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=+/Pfejnvv47jdCDVLiewF3uDmKJ65qBjBwcc879f1Vw=;
 b=S/XL230mm6P9SpLxZkMz98q6BJAL8m0RyU0+mOGX4MPIWDS3gosgqvtlhi4GAUERpGhL3kkw+
 XksDy2IrsIMAWR8KCXTC8/q06r15JfUOee03oEZlLUsds+eZ+5lm8nm
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Endpoint-Received: by B4 Relay for github.com@herrie.org/20240417 with
 auth_id=809
X-Original-From: Herman van Hazendonk <github.com@herrie.org>
Reply-To: github.com@herrie.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63857-lists,linux-media=lfdr.de,github.com.herrie.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[github.com@herrie.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:mid,herrie.org:email,herrie.org:replyto,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B751644ECD

v2: pure re-send.  No code changes from v1.

v1 was sent on 2026-06-04 but PATCH 2/2 (the driver itself) was
silently dropped by my outbound SMTP relay during the original send;
the cover letter and PATCH 1/2 reached the lists, the driver
patch did not.  Re-sending the full series via b4 / kernel.org so
the driver actually lands.

If you already started reviewing v1's cover or binding, no need to
re-read those - they're byte-identical.

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: van Hazendonk <github.com@herrie.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

This series adds a V4L2 subdev driver and DT binding for the Aptina
MT9M113, a 1.3 Mpx SoC sensor with an on-chip ISP and a small MCU
running a "SOC1040" firmware that performs auto-exposure, auto white
balance and lens-shading correction.  The sensor talks to the host
over MIPI CSI-2 (1 or 2 data lanes); register access is over I2C
using the Qualcomm CCI helper.

Hardware layout exposed to userspace:

    +-------------------+    +-----------------+
    | Pixel Array (PA)  |--->| IFP / ISP       |--->[CSI-2]
    | sink-less subdev  |    | MCU + pipe      |
    +-------------------+    +-----------------+

PA carries V4L2_CID_PIXEL_RATE and V4L2_CID_LINK_FREQ so that
downstream receivers walking the graph from the CSIPHY (camss does
this) find them on the entity flagged MEDIA_ENT_F_CAM_SENSOR.

V4L2 controls implemented:
  - exposure / gain / hflip / vflip
  - test pattern
  - V4L2_CID_COLORFX (sepia / mono / negative / aqua / vivid)
  - V4L2_CID_POWER_LINE_FREQUENCY (50/60 Hz flicker avoidance)

Tested on a HP TouchPad (APQ8060, MSM8x60 family) with the on-board
front 1.3 Mpx MT9M113.  Probes cleanly, both PA and IFP subdevs
register, csiphy_stream_on() picks up link_freq from PA, and the
preview pipeline up through CAMSS produces frames.  A bounded
3-attempt retry around s_stream(1) handles a residual silicon-level
wedge that occasionally leaves the MCU's SEQ_CMD in an inconsistent
state on cold start.

The DTS patches that enable the sensor on the HP TouchPad will be
sent separately to the ARM/DTS tree.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
Herman van Hazendonk (2):
      dt-bindings: media: i2c: add aptina,mt9m113
      media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

 .../bindings/media/i2c/aptina,mt9m113.yaml         |  127 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/mt9m113.c                        | 2971 ++++++++++++++++++++
 4 files changed, 3111 insertions(+)
---
base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
change-id: 20260605-submit-media-mt9m113-5ac3137971fa

Best regards,
-- 
Herman van Hazendonk <github.com@herrie.org>



