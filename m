Return-Path: <linux-media+bounces-63853-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7/9dGZpAImoxUQEAu9opvQ
	(envelope-from <linux-media+bounces-63853-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:20:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9442644D3C
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:20:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=sBeXdkby;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63853-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63853-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2722B3031127
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 03:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202493B5302;
	Fri,  5 Jun 2026 03:20:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3983BBFB8;
	Fri,  5 Jun 2026 03:20:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629628; cv=none; b=C2fs3W5xvEaG9Yo7V94uKMSL5GwzfzjpcU3SQNo8q2WNqEKRdxdl+Bhv4eB2m3gxGDIeprKtThT/hD+ddQIW2xF4BAf3Bg29HNFX4NN9dehGQ/m86rYhevO75rZARvtgEnbPxzSylGdHYasIA49skelZXuJXv0F9lGw0Jb7cBLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629628; c=relaxed/simple;
	bh=ApbxPaKFFEexR8wnxfVsRKseWLe6S8mZXKmP8pnfq5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2WcKKt+wcGxzUb3Cq3j6n7G20cPJw9ek9cpX3UacS1v0DJTcd0enmdYPwRMrAM0cSAGwO0iwDcf4oqr9qSa3ZpMQYddSkxwMXz4r/W88XDabCXQDeVqiLcVa1Fkc4mR8pyJB8jshSzrhqaz2xr0hOGd1Rep7RX0vXCDrd4bPlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=sBeXdkby; arc=none smtp.client-ip=136.144.136.17
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4gWmsG70pHzTPNxd;
	Fri,  5 Jun 2026 05:20:18 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission1.mail.transip.nl (Postfix) with ESMTPA id 4gWmsG29gwzJjhYK;
	Fri,  5 Jun 2026 05:20:18 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 0/2] media: i2c: add Aptina MT9M113 SoC sensor driver
Date: Fri,  5 Jun 2026 05:20:15 +0200
Message-ID: <cover.1780601033.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780629618; h=from:subject:to:cc:date:
 mime-version; bh=kViDbVFZ0fYEjw6HUxIoRCbf8V2Xv6QN5U5aVmfaMCE=;
 b=sBeXdkbyLxQreQpSREhZriW5Xh1VjSDhEI5XdQB8bRnTxIrSEpDzBLKrcuPmyu2208ylkU
 37W3wrHKHm1CWfNpSvMGDzGNDZOlAiPUUXaMHrXryuvv+h4S7yRTWoyX0sGimRjvjG8LOm
 M+9hyp7V6l55yv707KlK3WF4Ubu16ymTh6Ey5L/jIJa4bdZdyrv6WdE3NsQrFd6s4J1zCK
 qag7sRqT6eYDMIIhrAZ3T/5cVKHtzTA/Yr3bi7oyLo5x1eR9Hp65ENDy68/i/UsdrCSDeA
 g4muatoEp37j42enUdwxiMqAcAcosCJJkyFjPJ9tCt5aXhkB+LnNNUT4HIVDFA==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-63853-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:hverkuil@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-media@vger.kernel.org];
	DMARC_NA(0.00)[herrie.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:from_mime,herrie.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9442644D3C

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

Herman van Hazendonk (2):
  dt-bindings: media: i2c: add aptina,mt9m113
  media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

 .../bindings/media/i2c/aptina,mt9m113.yaml    |  127 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/mt9m113.c                   | 2971 +++++++++++++++++
 4 files changed, 3111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
 create mode 100644 drivers/media/i2c/mt9m113.c

-- 
2.43.0


