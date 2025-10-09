Return-Path: <linux-media+bounces-44115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A160BC9E0A
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 17:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A72AA353DB9
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6CB2E03F0;
	Thu,  9 Oct 2025 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="FW3SZRJU"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B6F21CA0D;
	Thu,  9 Oct 2025 15:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025258; cv=none; b=fK33PHXpd9VetmbnWVBf73+GXNLtgd1vKDEvej0/GDMWlUI6XWDUIBh+1DJkq9d4LGMmLjIjBlMRDEicyZoskdON/Bnc3RE5BofncUd7omZvCuaxkK8U9NwQYQSHb2rlU9BLDniQ7e/5tftHGF27SlEVIIsQfq+r8Io7yvrowWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025258; c=relaxed/simple;
	bh=Zz+Uj157nUwkCRjTCQp7hgcM6Q5j7SCBgxkxYDjw0r4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EFt/a/gWAYrTYryq6L/q18ezhninfxNpAnM6oxK/kENJSUg74svQgFSu07co6IbIsLUKBoI/xeXO/lUG5tFxDu8V9UYPjKS9ZpTbeGks879ii+s0jIAHJUZs6kOZ1tI6OIR/qgWVACgDIolWdF6/3shXlaCkDBtdcsKYvYJ/O/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=FW3SZRJU; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025257; x=1791561257;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zz+Uj157nUwkCRjTCQp7hgcM6Q5j7SCBgxkxYDjw0r4=;
  b=FW3SZRJU/MXVdB0TMdhe0Y1EQymFXT+NyrSiyKopCMA7Uj0HWVZlcbPf
   8R1hxXiwoOcahS/a3yJmEzUMxolCPOZ0IyVgp3owlBeEGl9E8PzDC1o4l
   Vog05tfDc4zAmWwi31gQMijQSuk/1V7gOvfD7DKNZUtf3upjsQAcwzRzT
   yG2PE6z7MdWDfPIItHCSKin3gxBdqK9Vs/pCB1V+gP15kTTuhh0npn7bl
   sO8JxpAWMV4jpUqS7G4eF2VIdtFW+33Mf0zqhPoIzJ4Ns3vHd95nPwR2r
   TaM4b69DFk1X1RvWGADCMdZGktgdpTTh7AaLYygQgRmJC/wjqy2T+RKA/
   g==;
X-CSE-ConnectionGUID: lBmy0Ek5QtOpGZTOa4YF8Q==
X-CSE-MsgGUID: VHYNVfB/TiC0i/p9yG12qQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="278928714"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:10 -0700
Received: from chn-vm-ex1.mchp-main.com (10.10.87.30) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:53:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 9 Oct 2025 08:53:19 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:53:11 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
	<3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH 00/18] media: microchip-isc: Color correction and histogram stats
Date: Thu, 9 Oct 2025 21:22:33 +0530
Message-ID: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi,

This patch series has a set of enhancements to the Microchip Image Sensor
Controller driver. The objective is to expand its image processing
capabilities and to improve the colors.

This series also introduces a new stats driver that exposes the histogram
data to userspace via v4l2 controls. This allows applications such as
libcamera to access real time image statistics for advanced image
processing like automatic exposure, white balance adjustments etc.

Balakrishnan Sambath (11):
  media: microchip-isc: Enable GDC and CBC module flags for RGB formats
  media: microchip-isc: Improve histogram calculation with outlier
    rejection
  media: microchip-isc: Use channel averages for Grey World AWB
  media: microchip-isc: Add range based black level correction
  media: platform: microchip: Extend gamma table and control range
  media: platform: microchip: Add new histogram submodule
  media: microchip-isc: Register and unregister statistics device
  media: microchip-isc: Always enable histogram for all RAW formats
  media: microchip-isc: fix histogram state initialization order
  media: microchip-isc: decouple histogram cycling from AWB mode
  media: microchip-isc: enable userspace histogram statistics export

Balamanikandan Gunasundar (7):
  media: platform: microchip: set maximum resolution for sam9x7
  media: platform: microchip: Include DPC modules flags in pipeline
  media: microchip-isc: expose hue and saturation as v4l2 controls
  media: microchip-isc: Rename CBC to CBHS
  media: microchip-isc: Store histogram data of all channels
  media: videodev2.h, v4l2-ioctl: Add microchip statistics format
  media: microchip-isc: expose color correction registers as v4l2
    controls

 drivers/media/platform/microchip/Kconfig      |   2 +
 drivers/media/platform/microchip/Makefile     |   2 +-
 .../platform/microchip/microchip-isc-base.c   | 373 ++++++++++--
 .../platform/microchip/microchip-isc-regs.h   |   3 +
 .../platform/microchip/microchip-isc-stats.c  | 549 ++++++++++++++++++
 .../media/platform/microchip/microchip-isc.h  |  44 +-
 .../microchip/microchip-sama5d2-isc.c         |   2 +-
 .../microchip/microchip-sama7g5-isc.c         |  73 ++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/linux/atmel-isc-media.h               |  13 +
 include/uapi/linux/videodev2.h                |   3 +
 11 files changed, 1001 insertions(+), 64 deletions(-)
 create mode 100644 drivers/media/platform/microchip/microchip-isc-stats.c

-- 
2.34.1


