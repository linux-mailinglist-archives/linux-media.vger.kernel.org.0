Return-Path: <linux-media+bounces-61959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INMbHkD4CmpZ+QQAu9opvQ
	(envelope-from <linux-media+bounces-61959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:30:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E4456B8CC
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4EB5A300C01E
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F4E3F58DA;
	Mon, 18 May 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="WG6qFcRY"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91DE3321BD;
	Mon, 18 May 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103791; cv=none; b=nB/KklRO739Tmy9dRShakKLsechOv67mJIzc7dpammvq9eUoZtAppq7JVrQ9Pljwa4hLVTBeDAjvPTDT3XzlqA2fvK6u/m8iiZhFQyrP7nH4pYyt14F2bMxANsa97JBmCdoxWXGgibev9l54nmokyCn2ijBEkB9tUY2P8uDIjJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103791; c=relaxed/simple;
	bh=3ne2qLLoCCbskEmi6lYHYTd/lmowwrIY8ojJ5bJZjww=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QzZjXlYS+VxUiQIoVOZdekT364teAkDmK/xQG/HU+IWw2vu3JU75ndbKwjv0SmGS4lsp5TOM7Nt8IYV3KnrMHKlgZwl5TekMneo6OUFxaD7N2OB+sAn2lo0CezdKN2B297DdtylTpC9J8s3jjc+gNe04b4WlLO4yL0s4vfOGO0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=WG6qFcRY; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103788; x=1810639788;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=3ne2qLLoCCbskEmi6lYHYTd/lmowwrIY8ojJ5bJZjww=;
  b=WG6qFcRYWfl2xbSCCyeXKtfChfc5jeGfw1wKakxjo7lg6WRmkaDRH+tF
   Kl9x814x7GEig2K7VIYZ++/f+lhGmP0MLbnHyLFCTgWRyKUdtjjguQ8FM
   mYy2Ptbzih6YSU6g+zi1eePeUKKc3EjnlrwT9xRv2yEuLISNH0RMEABD7
   g9WukKLFUA4XhnSgvT12HBaF+DNrCxt57WMB9g7KmPohaCxyqgdFepM6R
   Q4sB5CvHPa1Xerf+46OlCLAW5x3JhysRrTbGt37umu/JEs1ny/CBKAjjN
   npO6ZWbroPsiOmFX6Yp4UPpET21ze5U9XeUuwpp0ujAP1IWXT5Ys40NoL
   Q==;
X-CSE-ConnectionGUID: AOxhwFhpROaZ7wci6oWuJA==
X-CSE-MsgGUID: uvKL02kWTI6WcHsPcL9WoQ==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="66410413"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 May 2026 04:29:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 18 May 2026 04:29:45 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:29:41 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Subject: [PATCH v4 00/12] media: microchip-isc: fixes and enhancements
Date: Mon, 18 May 2026 16:59:38 +0530
Message-ID: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACP4CmoC/yXMQQqAIBBA0avErBvQ0KiuEi0mG2soKhQikO6e1
 PIv3k8QOQhH6IoEgS+Jcuw5TFmAW2ifGWXKDZWqamV1gyNtq6BEh7/UeBnUzERWUesbA5megb3
 c37YfnucFqI5LG2YAAAA=
X-Change-ID: 20260518-balki-isc-series1-v4-1eeaa50a9f84
To: Eugen Hristev <eugen.hristev@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	<stable@vger.kernel.org>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 19E4456B8CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61959-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

Bug fixes and feature additions for the Microchip ISC/XISC driver.

Fixes:
 - SBGGR10 Bayer pattern was mapped incorrectly (red/blue swap)
 - WB register fields corrupted by sign extension
 - Race between histogram IRQ and stream stop
 - PM runtime reference leak in AWB work handler

Features:
 - Driver documentation
 - Gamma 1.8/2.4 preset curves
 - Hue/saturation controls for SAMA7G5
 - Grey World AWB with EMA smoothing

Split from v1 per review. Histogram statistics support is being sent
as a separate follow-up series.

Tested on SAMA7G5-EK with IMX219 (RAW10 Bayer capture, AWB, controls
verified across 8 formats and 5 resolutions up to 3264x2464).

Based on v6.19 (e9ec05addd1a).

v1: https://lore.kernel.org/linux-media/20251009155251.102472-1-balamanikandan.gunasundar@microchip.com/
v2: https://lore.kernel.org/linux-media/20260512154339.210444-1-balakrishnan.s@microchip.com/
v3: https://lore.kernel.org/linux-media/20260513071742.97263-1-balakrishnan.s@microchip.com/

v4:
 - Drop gamma LUT controls and CC matrix V4L2 controls patches (move
   to parameter buffer follow-up per Sakari's review)
 - Drop AWB enable pipeline reset patch (cleanup for the dropped
   controls, will return with the follow-up series)
 - Update documentation patch to remove references to dropped controls
 - Rebase on v6.19

v3:
 - Fix bisect failures (regmap declaration, gamma LUT macro ordering)
 - Fix Fixes: tag (use mainline commit, not staging)
 - Add Co-developed-by trailers for Balamanikandan Gunasundar

v2:
 - Split series (histogram stats moved to a separate follow-up series)
 - Reorder: bug fixes first, then features
 - Commit message cleanups
 - Rebase on v6.19-rc8

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
Balakrishnan Sambath (12):
      media: microchip-isc: fix SBGGR10 Bayer pattern
      media: microchip-isc: mask WB offset and gain register fields
      media: microchip-isc: fix race condition on stream stop
      media: microchip-isc: fix PM runtime leak in AWB work handler
      media: microchip-isc: add driver documentation
      media: microchip-isc: set SAM9X7 maximum resolution to 2560x1920
      media: microchip-isc: configure DPC and pipeline for SAMA7G5
      media: microchip-isc: add gamma 1.8 and 2.4 correction curves
      media: microchip-isc: add SAMA7G5 hue and saturation controls
      media: microchip-isc: use weighted averages for Grey World AWB
      media: microchip-isc: smooth AWB gains with EMA filter
      media: microchip-isc: scale DPC black level to sensor bit depth

 .../userspace-api/media/drivers/index.rst          |   1 +
 .../userspace-api/media/drivers/microchip-isc.rst  |  66 +++++
 MAINTAINERS                                        |   1 +
 .../media/platform/microchip/microchip-isc-base.c  | 320 ++++++++++++++++-----
 .../media/platform/microchip/microchip-isc-regs.h  |  11 +-
 drivers/media/platform/microchip/microchip-isc.h   |   8 +-
 .../platform/microchip/microchip-sama5d2-isc.c     |   2 +-
 .../platform/microchip/microchip-sama7g5-isc.c     | 100 +++++--
 8 files changed, 413 insertions(+), 96 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260518-balki-isc-series1-v4-1eeaa50a9f84

Best regards,
-- 
Balakrishnan Sambath <balakrishnan.s@microchip.com>


