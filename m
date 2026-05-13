Return-Path: <linux-media+bounces-61333-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dH/nHrolBGqDEwIAu9opvQ
	(envelope-from <linux-media+bounces-61333-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:18:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C513452E7A9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88EAD3014106
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B2D3D5C0E;
	Wed, 13 May 2026 07:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="u6v+Rka+"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50D93D34BF;
	Wed, 13 May 2026 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656674; cv=none; b=S7rjThXH57+TT6VyN1U/grG4W6aFBFpiVNqISupfsGLT1BZo42uP+gVxUENaDrG9iy78hcxtgB3etTOOitU1v3dHzkE5Le8Zz7h7mz0Go11/Kqy2mGruJk7n6Q7SVXtFG3kHLBBLQ3mwTT9AqvK1fA4eK0teQEk2j8scY+9l4ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656674; c=relaxed/simple;
	bh=NKpRczsvAh17wM6+xkIQWdX/ETfRo/K2XEBQoNt6cqk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a7ntsancKDcrJFaJjIVI6gMx4QcLqb0SiYPJt6k8Nz5AisJUzsIq2td0GnyL+/alExg8l7omAHPXoSOc3Hcun51ioOMHisLgJDznb6kJsoOpER7MTOAQVu8nOIqwC+FbSGhTAyF4oKoRtFydtHmerVQ8FRdWCnvuz7B6YEGTMtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=u6v+Rka+; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778656672; x=1810192672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NKpRczsvAh17wM6+xkIQWdX/ETfRo/K2XEBQoNt6cqk=;
  b=u6v+Rka+H5wZt1G/PJ6X1tHqw/G8w4mfyZVC+MK5l2g4VTuhn3r8ZgTP
   XhmrfBumP7LjN7T4bZc1jPlqpEUfpBq8TtcUsl3irOshSJxmBYHKdKStD
   hlJi25WwQZ3Wnc3hxylKXWKEn7VY1Tr8/j5PvcIVI5GCt9CvEcpghZ59t
   I0YeJpBRt7pr6OXPnAzyY6FsstXH9nOLZ4VFhwy7E6yVMnDhLlsXFjzX6
   5ami+FEhyGhhP8xClbSDET8Xk8s+aD6o+UONHJi5ev59v7MioLKUfSutB
   px+3BABQkHDpYEudFOSa49Z1E5vmbJl2etyr6y+c7/lbnRyK4Rj9mp92o
   g==;
X-CSE-ConnectionGUID: X5J0OA4JR0q21e9Je1/UHA==
X-CSE-MsgGUID: lDxvpCI2TVG5OYFTLW0+3g==
X-IronPort-AV: E=Sophos;i="6.23,232,1770620400"; 
   d="scan'208";a="57838958"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 00:17:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Wed, 13 May 2026 00:17:46 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 13 May 2026 00:17:43 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 00/15] media: microchip-isc: fixes and enhancements
Date: Wed, 13 May 2026 12:47:27 +0530
Message-ID: <20260513071742.97263-1-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512154339.210444-1-balakrishnan.s@microchip.com>
References: <20260512154339.210444-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: C513452E7A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61333-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

Bug fixes and feature additions for the Microchip ISC/XISC driver.

Fixes:
 - SBGGR10 Bayer pattern was mapped incorrectly (red/blue swap)
 - WB register fields corrupted by sign extension
 - Race between histogram IRQ and stream stop
 - PM runtime reference leak in AWB work handler

Features:
 - Driver documentation
 - Gamma 1.8/2.4 curves, per-channel gamma LUT
 - Hue/saturation controls for SAMA7G5
 - Color correction matrix controls
 - Grey World AWB with EMA smoothing

Split from v1 per review. Histogram stats follow as Series 2.

Tested on SAMA7G5-EK with IMX219 (RAW10 Bayer capture, AWB, color
controls verified).

Based on v6.19-rc8 (18f7fcd5e69a).

v1: https://lore.kernel.org/linux-media/20251009155251.102472-1-balamanikan=
dan.gunasundar@microchip.com/

v3:
 - Fix bisect failures in patches 9-11 (regmap declaration, gamma LUT
   macro ordering)
 - Fix Fixes: tag in patch 2 (use mainline commit, not staging)
 - Add Co-developed-by for patches co-authored with Balamanikandan Gunasund=
ar

v2:
 - Split series (histogram stats moved to Series 2)
 - Bug fixes first, then features
 - New fixes and features as listed above
 - Commit message cleanups
 - Rebased on v6.19-rc8

Balakrishnan Sambath (15):
  media: microchip-isc: fix SBGGR10 Bayer pattern
  media: microchip-isc: mask WB offset and gain register fields
  media: microchip-isc: fix race condition on stream stop
  media: microchip-isc: fix PM runtime leak in AWB work handler
  media: microchip-isc: add driver documentation
  media: microchip-isc: set SAM9X7 maximum resolution to 2560x1920
  media: microchip-isc: configure DPC and pipeline for SAMA7G5
  media: microchip-isc: add gamma 1.8 and 2.4 correction curves
  media: microchip-isc: add SAMA7G5 hue and saturation controls
  media: microchip-isc: expose color correction matrix as V4L2 controls
  media: microchip-isc: add per-channel gamma LUT controls
  media: microchip-isc: reset pipeline state on kernel AWB enable
  media: microchip-isc: use weighted averages for Grey World AWB
  media: microchip-isc: smooth AWB gains with EMA filter
  media: microchip-isc: scale DPC black level to sensor bit depth

 .../userspace-api/media/drivers/index.rst     |   1 +
 .../media/drivers/microchip-isc.rst           |  71 ++
 MAINTAINERS                                   |   1 +
 .../platform/microchip/microchip-isc-base.c   | 728 ++++++++++++++++--
 .../platform/microchip/microchip-isc-regs.h   |  11 +-
 .../media/platform/microchip/microchip-isc.h  |  56 +-
 .../microchip/microchip-sama5d2-isc.c         |   2 +-
 .../microchip/microchip-sama7g5-isc.c         | 101 ++-
 include/linux/atmel-isc-media.h               |  31 +
 9 files changed, 894 insertions(+), 108 deletions(-)
 create mode 100644 Documentation/userspace-api/media/drivers/microchip-isc=
.rst

--=20
2.34.1


