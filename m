Return-Path: <linux-media+bounces-54978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE+SHnUHr2knLwIAu9opvQ
	(envelope-from <linux-media+bounces-54978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:46:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 704F223DD3B
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A405C300E1A5
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 17:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C672C28641F;
	Mon,  9 Mar 2026 17:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="jzfRuujj"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557B117A2F6;
	Mon,  9 Mar 2026 17:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078375; cv=none; b=lIck/JlKn+1rLVE7FfPvvl+qrLYrz5g3B2IVNBZNLwAh2e6kyHzouTVToVQcPFUXD6F45scucEPPfAaO1q3Sw/2TmjLNke38p4Hg7TYWXnBxtukNiQRmiUr8jLV38zQTGag5x+THhbFvY7aD/TM4x9a3p4r7CO0+JNC3rHOI46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078375; c=relaxed/simple;
	bh=cWDm9ErqxKJLC2n1skluzLcT0FCS8E88QJbHjPOtv8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fk/RzBK3l1mbUNUde8EIlmswr/MSqpvdx/QkfEBLNQ/U2wDUDiTJDCn1/uDHP9x8zgqCYLSV+2Cy5OA3tfQvH+chPzcAAUPGDM0ykzaE/qdjKBs2J/AwaTSg5r6J9t5fBsvi1qS65IOshPc0xio/u9/bIMm4H5CPQUHdmbi42s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=jzfRuujj; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JlrJBZ3P9IDIEe6f9DzFSUnZeE5fdn8L2C/RECLDFPs=; b=jzfRuujjJ+Q00LYDIN6JF0LMxg
	HgBA6anRAxpFOlsaQb46sLGgWYByJZk733lquIIK1b1fu/d11UA3vUYqI4Vwl4WZvRgpLm5hMUs26
	tbj07JJEelsLiQ36lp8/zpwwVqgHYm/JVVhicCAXKEOa9rtrQGkfZp7cYaOC+AI2gMes=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:56968 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vze4O-00Dxnt-F3; Mon, 09 Mar 2026 18:07:04 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH v2 0/9] drivers: media: i2c: Omnivision OV08D10
 improvements
Date: Mon, 09 Mar 2026 18:07:02 +0100
Message-Id: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADb+rmkC/z3MQQ7CIBCF4as0sxYDQ0XqynuYLmgZLAvBQEM0D
 XcXm+jyf3n5NsiUPGW4dBskKj77GFrgoYN5MeFOzNvWgBwVRzyxWLi2grPzJAbt+gEn20N7PxM
 5/9ql29h68XmN6b3DRXzXn6H+RhGMs1maQSiptEB5pYejYI9mhbHW+gEh//vNngAAAA==
X-Change-ID: 20260225-ov08d10-7b198f492bd4
To: Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 
X-Rspamd-Queue-Id: 704F223DD3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54978-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[emfend.at:mid,emfend.at:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
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
Changes in v2:
- Drop 'YAML' in bindings commit message (Krzysztof)
- Use devm_reset_control_get_optional_exclusive() (Philipp)
- Separate commit to fix PM handling in probe (Sakari)
- Added two 'Fixes' tags
- Resort series to get fixes first
- Link to v1: https://lore.kernel.org/r/20260226-ov08d10-v1-0-c3a916368123@emfend.at

---
Matthias Fend (9):
      media: i2c: ov08d10: fix runtime PM handling in probe
      media: i2c: ov08d10: fix image vertical start setting
      media: i2c: ov08d10: remove duplicate register write
      media: i2c: ov08d10: fix some typos in comments
      media: i2c: ov08d10: add missing newline to prints
      dt-bindings: media: i2c: document Omnivision OV08D10 CMOS image sensor
      media: i2c: ov08d10: add support for binding via device tree
      media: i2c: ov08d10: add support for reset and power management
      media: i2c: ov08d10: add support for 24 MHz input clock

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


