Return-Path: <linux-media+bounces-61285-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sALjKNhRA2qR4QEAu9opvQ
	(envelope-from <linux-media+bounces-61285-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:14:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B6E52472B
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC22E30ECA5F
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD293911D5;
	Tue, 12 May 2026 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="idi1fZUd"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445183E173D;
	Tue, 12 May 2026 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600625; cv=none; b=k9GCpBvDYgVb1DZAKTEQXOYLu/Pgqgh3no0cGFweNa7qQP3Ybeh7mitTOikqATkQSkzQyu2sGo4CDvAeq7Lkn5K9ezAgg00tWTzT79wMrDwx8XxiaJeM/tFvWfnt4bBwbkt4LRsww8bct5E/KHTDTHifNUw2OSM9LetGhFmEBW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600625; c=relaxed/simple;
	bh=k0edP+pIESqfsKFc0EzBCZ+0k6fV3XnnxyDryWzyE0E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=se3MQ/H77wU2Ony9zb476EVnAjhU5u9pdvDKDOY7ZKp8EFgKCnYupE7zwQQGVQ/W8ZBVlQT0DA0TBYYKvYKtEsNlWB3ELpUXmrIgZ+g0I/DHmaxberBXIh2oI7l4ZBeLzoyfDfqW/T6+aoZ42831ggvlOepbu/ZjivaCOpc6wWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=idi1fZUd; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600624; x=1810136624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k0edP+pIESqfsKFc0EzBCZ+0k6fV3XnnxyDryWzyE0E=;
  b=idi1fZUdqQULEpdRwQ20lkj2GH5gZB7u/MWJmEq85PrIAWtcRYjKlF5b
   UZ61D7ig2eUbUEpYzv52cgJyXebhiATlfkUzCH1GESFpC+Q6zAMmUr+Qv
   iDSEejsCaQVXvbDRZs2N4tPccoMENriM1kFLzNWVxcn1THsUbp7i3j9TI
   XnbGWQ43QsN0yrW4h/TFZKkLueZqBUbR9rvrT03M2c+cNZ8i7I9on6ShJ
   mNLpo35xn+V9wb4HPu04Q6BMCZM/vQZx8+i7cutHs4C7/ttjBsgsX95gA
   gdnms6oOLrTyN89r/x5YJI8T8kwUitVL/BoeUInaklr4dmtI2gwGp8txW
   Q==;
X-CSE-ConnectionGUID: 0sXDrkccQUOb0eEDhMwHUQ==
X-CSE-MsgGUID: bsk4vfDERSqfuYpFlUncRQ==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="65713083"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2026 08:43:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 12 May 2026 08:43:42 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:43:40 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 00/15] media: microchip-isc: fixes and enhancements
Date: Tue, 12 May 2026 21:13:24 +0530
Message-ID: <20260512154339.210444-1-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: 10B6E52472B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61285-lists,linux-media=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
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
controls verified). Build tested with COMPILE_TEST and W=3D1. All
patches pass checkpatch --strict.

Based on v6.19-rc8 (18f7fcd5e69a).

v1: https://lore.kernel.org/linux-media/20251009155251.102472-1-balamanikan=
dan.gunasundar@microchip.com/

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
 .../platform/microchip/microchip-isc-base.c   | 730 ++++++++++++++++--
 .../platform/microchip/microchip-isc-regs.h   |  11 +-
 .../media/platform/microchip/microchip-isc.h  |  56 +-
 .../microchip/microchip-sama5d2-isc.c         |   2 +-
 .../microchip/microchip-sama7g5-isc.c         | 101 ++-
 include/linux/atmel-isc-media.h               |  31 +
 9 files changed, 896 insertions(+), 108 deletions(-)
 create mode 100644 Documentation/userspace-api/media/drivers/microchip-isc=
.rst

--=20
2.34.1


