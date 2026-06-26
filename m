Return-Path: <linux-media+bounces-65675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5EmJORTDPWoH6QgAu9opvQ
	(envelope-from <linux-media+bounces-65675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 02:08:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0706C9382
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 02:08:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=icloud.com header.s=1a1hai header.b=wctcL9Q7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65675-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65675-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=icloud.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7C193041941
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 00:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744401917CD;
	Fri, 26 Jun 2026 00:08:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.ci.icloud.com (ci-2007b-snip4-11.eps.apple.com [57.103.88.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A9D4A21
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 00:08:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782432523; cv=none; b=nOwCuTJ21fLhkDySMqb8tfTWGcPn25+AXq7c3YoPmPdgp83Nl2AJuXS/V3+PmLwh8dMw9LYZ1HlaHVTvbfmogrGL/NkZ2ZQqPc2b62QQvJQXNBf70JdTxfF0BzrKPFt55IGAwWoANe/sAOsixYA/GwqoSgO9dh5o34OZR1+IL38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782432523; c=relaxed/simple;
	bh=f4R9clzPjiybrAMIl/OswXdNDHBbS2L1z/PcKDFijhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2PxiWm/IU4BzPcmWGN13RWlz6smg0u+Us3z7UAg3MaZSZ6k3QjJhPzSppf6JeXSUYuZ8YW4Zkd3ttXWLFRTjQN20wauV5H0DaFn/uIxpcyeeGoDOUTwgyz0gOw/xFqRSScGg5jQ+/yZWwa3tiQ+XU9rTmEggvknzBTDmK/Ddg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=wctcL9Q7; arc=none smtp.client-ip=57.103.88.23
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPS id 2A491180015E;
	Fri, 26 Jun 2026 00:08:39 +0000 (UTC)
X-ICL-RepId: 019f0141-d3c5-7de5-9812-1b3eeda766ae
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWBVBRHV8CCgRHBFsXRgNTRVEZFxFQAVgeVl5aF15NRx9ATWJJAVoZWxxAF0puTVMPDxlaFFwYU0VRH1RYXgRTVg5CCUoFXQFZBEAJSARcAkUDQQhJC10ERgNdTxFdDlIFRl5aFFwYQwJXAnkRUAFYHlZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1782432521; x=1785024521; bh=62riOTYrLlfgacm6h7BtxUIAXTixdzk21VOhDGmuiTs=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=wctcL9Q78YFeus/xSU++iBhJ033IW+6wGUJ0SbOOahm1Q6LZWZQsVvt/U04/elZK+vh8ybxnvhMIZUoDyZQps5VblcA/l4wbfjCDZNVlXBsUe9PwD10Aqn3FuTm4drpkYTTDiJYCNt9Zp23uUED0XPZCunW4MEhoGDa5aWgidDoKZg38irBuZSmJB7M5jhXLrs+h1S0rLRuOzOecfVAgyX7xc44ohKGnjtLyP1ARq12k4XVmdSpE4zSo7HZMXmyFM9xrzrT+9dDAwwkmYosz7pSepOUlADWATmpgXR5PYb3fgSa/1MN+hJqmJkOigAqmuXEt0FRQOtjkuBiob/HRvg==
Received: from bigre.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPSA id 3C05A1800463;
	Fri, 26 Jun 2026 00:08:38 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	kernel@puri.sm,
	Vincent Cloutier <vincent@cloutier.co>
Subject: [PATCH RFC 0/4] media: i2c: Add Samsung S5K3L6 and Librem 5 rear camera
Date: Thu, 25 Jun 2026 20:06:56 -0400
Message-ID: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDIwOSBTYWx0ZWRfXzoAVob3LJ6jD
 EnG0MZyGxZ7CxJ/hh6tPeFu5N7rSuqvrNu9lOqWd9OGNbadBHG1mVkAtBh3pgXai6UMT3BV3WIP
 lXttj4lhmluntt8LgOpCaOniw+i8W2FFAqz970Cqn2gooehEzIAA3OQa1YwIYUluCid+AYK9S0O
 0guCDfnci6RMThBYam6LmzJyPBmMGXJw+QaHH9798g8JxUmB8jFT9xYlQOaAqmSZN4gUrUyJZGP
 PO4u8iGLppzhIS/REJ9jnlgDRSOrnuc0y0YrjgVw6jDqCwIy5HnelG+5+6MefeS3wowNio6GtCN
 GD9LByDGKrjMpLnCSe0
X-Proofpoint-GUID: UhiN7vVFI5x6yZ7pg-UP9OgSjO-L5kvV
X-Proofpoint-ORIG-GUID: UhiN7vVFI5x6yZ7pg-UP9OgSjO-L5kvV
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65675-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:kernel@puri.sm,m:vincent@cloutier.co,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[vincent.cloutier@icloud.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[vincent.cloutier@icloud.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[icloud.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[icloud.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloutier.co:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,icloud.com:dkim,icloud.com:mid,icloud.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D0706C9382

From: Vincent Cloutier <vincent@cloutier.co>

This RFC fixes the i.MX8MQ CSI-2 reset path needed by Librem 5 camera
capture, adds initial upstream support for the Samsung S5K3L6 image
sensor, and wires it up as the rear camera on the Purism Librem 5.

This is intentionally a rewrite, not a direct forwarding of the Librem 5
downstream S5K3L6 carry. The downstream history is a long bring-up
series with debugfs register overrides, debug-frame plumbing, commented-out
old subdev code, FIXME/TODO scaffolding, and several API-era migrations.
This RFC collapses the usable production path into a current V4L2 sensor
driver using CCI regmap, runtime PM, fwnode endpoint validation, and the
current subdev stream API.

Many thanks to Martin Kepplinger, Dorota Czaplejewicz, and Sebastian
Krzyszkowiak for the original Librem 5 S5K3L6 driver work and rear-camera
bring-up. Martin authored the initial downstream driver, and Dorota and
Sebastian substantially developed the mode tables, controls, power-up
sequence, and sensor tuning that this rewrite is based on.

This series covers:

- 25 MHz input clock, matching the Librem 5 downstream configuration
- two MIPI CSI-2 data lanes
- RAW8 and RAW10 SGRBG modes at 1052x780, 2104x1560, and 4208x3120
- exposure, analogue gain, digital gain, blanking, pixel-rate,
  link-frequency, test-pattern, orientation, and rotation controls
- Librem 5 DTS integration for the rear sensor and second CSI-2 path

The rewritten driver and DTS path have now been tested on Librem 5r4
hardware in a v7.1.1 carry build, with the i.MX8MQ CSI-2 reset fix from this
series applied.

Patch 1 keeps the i.MX8MQ CSI-2 software reset sequence compatible with
the Librem 5 camera pipeline by making the post-assert reset release
SoC-specific. This is included as an RFC prerequisite for the Librem 5
rear-camera enablement; if preferred, it can be split out and handled as
a separate media/platform fix.

Vincent Cloutier (4):
  media: imx8mq-mipi-csi2: Keep i.MX8MQ reset assert-only
  dt-bindings: media: i2c: Add Samsung S5K3L6 image sensor
  media: i2c: Add Samsung S5K3L6 image sensor driver
  arm64: dts: imx8mq-librem5: Add rear camera

 .../bindings/media/i2c/samsung,s5k3l6.yaml    | 117 ++
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi |  51 +
 drivers/media/i2c/Kconfig                         |  10 +
 drivers/media/i2c/Makefile                        |   1 +
 drivers/media/i2c/s5k3l6.c                         | 1055 +++++++++++++++++
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c     |   9 +-
 6 files changed, 1241 insertions(+), 2 deletions(-)

-- 
2.53.0

