Return-Path: <linux-media+bounces-53445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AEALBYToGlAfgQAu9opvQ
	(envelope-from <linux-media+bounces-53445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:32:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB5B1A36A8
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA88E3128F40
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE95C3A1A4E;
	Thu, 26 Feb 2026 09:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="AS6mBv3t"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66A23A0EAD;
	Thu, 26 Feb 2026 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097822; cv=none; b=ISIIa2v3xdpNM1F6jSxgmoEVtXmwRJmHIjotyNpC2cZPWGrKSRrluh8dUiPalxImWh/ZlzVS9aByXxBimM0Ff4MgtPjLta02SLmQnBjL/iHMijEB1ISRe/QzTjFFFgQttY9Yi052qJXZs2ERLh4a32O3c6nRhizN/gKx8C+YF+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097822; c=relaxed/simple;
	bh=zvSrGm2QeBoCRF+xVSmnLT3q8zMZ2z1SV1kSwKMoz/c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S8vsbDfJWVY2bKOq8yh+bK/I2j0OExBhaCjNf3gG4ooxEDeTjePSg93ExNEKwKTyaEA1vekJhZNshXk5zj+MjxodGb92R54NVTwKa27O7Z4jjdUHHZ73fy/nrzBvXSoXSN01VfHsOMWzxWBEMxt3yziflVxm0PevpWFbRE1VycE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=AS6mBv3t; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=V0s8/M6ZDcC33noReH54J8iiMCLBWu1vd60crkQTFPw=; b=AS6mBv3tvSs8s4TJL3jRgUAI3x
	lfXj3fubmQPYmepWFLpHSZcdrQoqVBwCX0VYJs94YeenDTlb2b8LBpEpSRQBZxLQrcger7Dt+AntN
	WEkt2RRfj7jgDQESbclTIYbIL6E9xio/r3OvvsQsOKVsyonzj8mPmZ+VKyDSAWpEFs9A=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:64689 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vvXAs-0018Zt-1P; Thu, 26 Feb 2026 09:56:46 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH 0/8] drivers: media: i2c: Omnivision OV08D10 improvements
Date: Thu, 26 Feb 2026 09:56:00 +0100
Message-Id: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAKoGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNT3fwyA4sUQwNd8yRDS4s0E0ujpBQTJaDqgqLUtMwKsEnRsbW1APX
 +GUlZAAAA
X-Change-ID: 20260225-ov08d10-7b198f492bd4
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53445-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.951];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,emfend.at:mid,emfend.at:email]
X-Rspamd-Queue-Id: 0DB5B1A36A8
X-Rspamd-Action: no action

This series provides basic device tree support and handling for power
supplies, an optional reset, and the option to use a 24MHz input clock.

In addition to a few minor fixes, a major problem with the configuration of
the sensor modes has also been resolved.

The changes have been tested on an i.MX8MP platform. Originally, the sensor
was apparently only used with ACPI - unfortunately, I do not have such a
hardware setup available.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Matthias Fend (8):
      dt-bindings: media: i2c: document Omnivision OV08D10 CMOS image sensor
      media: i2c: ov08d10: add support for binding via device tree
      media: i2c: ov08d10: add support for reset and power management
      media: i2c: ov08d10: add support for 24 MHz input clock
      media: i2c: ov08d10: fix image vertical start setting
      media: i2c: ov08d10: remove duplicate register write
      media: i2c: ov08d10: fix some typos in comments
      media: i2c: ov08d10: add missing newline to prints

 .../bindings/media/i2c/ovti,ov08d10.yaml           | 101 +++++++++
 MAINTAINERS                                        |   1 +
 drivers/media/i2c/ov08d10.c                        | 246 ++++++++++++++++-----
 3 files changed, 297 insertions(+), 51 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260225-ov08d10-7b198f492bd4

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


