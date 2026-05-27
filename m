Return-Path: <linux-media+bounces-62876-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mINJGIDQFmowsgcAu9opvQ
	(envelope-from <linux-media+bounces-62876-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:07:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 332695E3186
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20C8F301B3DB
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE383F44E8;
	Wed, 27 May 2026 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tPnDpQJ7"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6089377ECF;
	Wed, 27 May 2026 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880045; cv=none; b=d0UdaEV8tBHECKKpswZ2foYlNdRKXfKSwmdXTNp6FKhv2Ax0fpfJNJI0TrcactAjy4xCD1K26zYUe6oyEB0AVLhw2nevQJy0VVT5mdDulJ6jkKbqCYQTnLWrl2SgdcssI/r3dhTedDFMmjM88L5y+x1roN5PASkXbAolcNiFrYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880045; c=relaxed/simple;
	bh=b+Tu3qHK71SNVwMqTu0CBGWWCSxTIrotwCnbsJroiTk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=bL0yUGzosIdA7qfVIGXYtzVOBRkqCDik7R4N24XA8ty1p//6/NVCNbCIcObeRB88KaZK3wbqTBGszHTKJvEoCsraCV8chvDDuzSIfWbv+mcnxBk+q/xJx8SuOTCUEzAGULfXu5ryt9kXvKC1TEa5lE0aLi1uHWGOYXz3JeEFJIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=tPnDpQJ7; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779880044; x=1811416044;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=b+Tu3qHK71SNVwMqTu0CBGWWCSxTIrotwCnbsJroiTk=;
  b=tPnDpQJ7cmthk/C0qoTcGI2LlxxNIhwvKCdYtFv1BUiNsphiSpYfD6UF
   thHUcPzJpZ08KBUerXBQBQ3eBn/K+jrTadNo7A6h6ALfMRqhfNVSvV1fZ
   vKh3cytiH7FsKaiws3H6UEtxlLzqII/Q1e6EcwjrLSAR1WX7H/wl7uH7X
   PlPjycmm7lW8oy/3bMt+5BT/W45MGQN139UEhdozhLUxSrgp8PfcdeXXP
   WLUfggqD0fVUulR12eX2AvbrH6UINtgb4beVbzQSuEWWdCl9iKrhwnsGJ
   6UpeAxyHufjKyGDTUiSStYY5POFxaCjW7/6+oxbkHvqOlR7zIUeglkgBH
   w==;
X-CSE-ConnectionGUID: w30TpKoYTnu287PdmOlybg==
X-CSE-MsgGUID: 9q8FUm6CSPKlLGA7+hTkvA==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="58112108"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:07:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 04:07:22 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 04:07:18 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Subject: [PATCH v5 00/12] media: microchip-isc: fixes and enhancements
Date: Wed, 27 May 2026 16:37:16 +0530
Message-ID: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTQFmoC/x3LQQqAIBBA0avErBsQQ4OuEi1iHHMWWTgQgXj3p
 OXj8ysoF2GFZahQ+BGVK3e4cQBKez4YJXSDNdYbZx2eQuWiJDeKEkZ5WXG3FDjONAXP0M+78B/
 6uG6tffrTB6NlAAAA
X-Change-ID: 20260525-microchip-isc-fixes-a2cdef7c3d6e
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, <stable@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Balakrishnan
 Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62876-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 332695E3186
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
v4: https://lore.kernel.org/linux-media/20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com/

v5:
 - Picked up Eugen's Reviewed-by on the PM runtime leak fix.
   The SBGGR10 fix is extended to SAMA5D2 in v5, so dropped his
   Reviewed-by from that patch pending re-review.
 - Fix SAMA7G5 pipeline mask: CBHS_ENABLE, not CBC_ENABLE
 - Per-platform gamma_default. v4 used 1 for both SoCs, which picks
   the wrong curve on SAMA5D2 (1/2.2 is at index 2 there, index 1
   on SAMA7G5)
 - Fix V4L2_CID_SATURATION range to 0..127 (Q4); update docs to match
 - Initialise hue/saturation at probe to avoid a grayscale first frame
 - Reset histogram stats and gain_smooth in isc_reset_awb_ctrls() so
   AWB does not consume stale state from a previous stream
 - Reword WB masking subject; expand commit bodies on the feature
   patches

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
      media: microchip-isc: fix WB offset and gain register field masking
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
 .../userspace-api/media/drivers/microchip-isc.rst  |  68 +++++
 MAINTAINERS                                        |   1 +
 .../media/platform/microchip/microchip-isc-base.c  | 328 ++++++++++++++++-----
 .../media/platform/microchip/microchip-isc-regs.h  |  11 +-
 drivers/media/platform/microchip/microchip-isc.h   |   9 +-
 .../platform/microchip/microchip-sama5d2-isc.c     |   6 +-
 .../platform/microchip/microchip-sama7g5-isc.c     | 102 +++++--
 8 files changed, 426 insertions(+), 100 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260525-microchip-isc-fixes-a2cdef7c3d6e

Best regards,
-- 
Balakrishnan Sambath <balakrishnan.s@microchip.com>


