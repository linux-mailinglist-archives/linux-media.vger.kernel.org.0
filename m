Return-Path: <linux-media+bounces-61338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DJ7HHEmBGqDEwIAu9opvQ
	(envelope-from <linux-media+bounces-61338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:21:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BF152E87B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12CA630E277D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9C63D5662;
	Wed, 13 May 2026 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vEHPxfAt"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AEC3D6699;
	Wed, 13 May 2026 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656683; cv=none; b=oyiJGZVFZMZ6VgHMiapg8A1Hc18zro70af3Iq3bxZPQaeeWle34GSMhsPr8AByZ4jN8nydELEFzYfk26E6givivec8s/JAiUnKYyolHcgJcdi6UC/5clQfq5TI4svI3smGawYrZjya6tCf/prhAyXaYbQ39bboYhq4Qj3m+Ncqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656683; c=relaxed/simple;
	bh=plHrpEXuH6kFYdgM+b8Q8Q2nKexGKx87z+mC65uBPnM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DiacqELCfBWo5s+ng25tP+MmKgIx95gYQRT/dR6kI3Y4jBUGZkhNxECEn3VMBuxCKDrl8KQ3bbPfJVCPVwnbCR9aqpThVQtnmFwvdsW43YItLrXFYjk5+LLBGZx6G86M5Yyi+rN85RHAAw0K0TSRz6eoHjIdvoM1+rnDhwl4qNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=vEHPxfAt; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778656682; x=1810192682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=plHrpEXuH6kFYdgM+b8Q8Q2nKexGKx87z+mC65uBPnM=;
  b=vEHPxfAtUTU38lLTxk+B0kDeNLn2TzTQrOHepgvEJhxhOPJDmrqlWLd9
   MZoYH5bEXr70DVktB+dVLXaEK/b2CyEHlr8FOzClEqwBkzbV7fwIIbhjr
   4Ke5geLYGkQ9rN527aU1SShOn3QHez92Wf0t3Xd6Opq/enZd1A6yCSXPz
   hc00/khK9Dg/Hvuem999sBS2YGhxDBC6ZuBAcTiGMqe55H9LflEbP6M70
   OwppuenlKKHuLtAvFEfHKm9ZC/uXBWtYVdmPg8S5mooM3qpfv1TT2EWJL
   WJjYV10L0J4Q9mPjowEmUb3+MNdAHvKYuBQMuUxucLz5aAaKep0+ZbLE5
   Q==;
X-CSE-ConnectionGUID: VxTTGQqyQtCR1O/+XjELGw==
X-CSE-MsgGUID: me8fhpGnRde5F1WUfkuRkg==
X-IronPort-AV: E=Sophos;i="6.23,232,1770620400"; 
   d="scan'208";a="224672547"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2026 00:18:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 13 May 2026 00:18:01 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 13 May 2026 00:17:58 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 05/15] media: microchip-isc: add driver documentation
Date: Wed, 13 May 2026 12:47:32 +0530
Message-ID: <20260513071742.97263-6-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513071742.97263-1-balakrishnan.s@microchip.com>
References: <20260512154339.210444-1-balakrishnan.s@microchip.com>
 <20260513071742.97263-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: B2BF152E87B
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
	TAGGED_FROM(0.00)[bounces-61338-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

Document V4L2 controls and pipeline modes for ISC/XISC camera interface
on SAMA5D2, SAMA7G5, and SAM9X7.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../userspace-api/media/drivers/index.rst     |  1 +
 .../media/drivers/microchip-isc.rst           | 71 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 73 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/microchip-isc=
.rst

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Document=
ation/userspace-api/media/drivers/index.rst
index 02967c9b18d6..65ef6ba3523e 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -34,6 +34,7 @@ For more details see the file COPYING in the source distr=
ibution of Linux.
 	imx-uapi
 	mali-c55
 	max2175
+	microchip-isc
 	npcm-video
 	omap3isp-uapi
 	thp7312
diff --git a/Documentation/userspace-api/media/drivers/microchip-isc.rst b/=
Documentation/userspace-api/media/drivers/microchip-isc.rst
new file mode 100644
index 000000000000..2a436fd19272
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/microchip-isc.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Microchip ISC/XISC Driver
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The Image Sensor Controller (ISC) on SAMA5D2 and eXtended ISC (XISC) on
+SAMA7G5/SAM9X7 provide camera capture with hardware image processing.
+
+Supported Hardware
+------------------
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+SoC         Controller  Max Resolution  Interface         Hue/Saturation
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+SAMA5D2     ISC         2592x1944       12-bit parallel   No
+SAMA7G5     XISC        3264x2464       12-bit + CSI-2    Yes
+SAM9X7      XISC        2560x1920       12-bit + CSI-2    Yes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+SAM9X7 shares the XISC pipeline with SAMA7G5 but has a smaller internal
+line buffer, limiting horizontal resolution to 2560 pixels.
+
+Controls
+--------
+
+Standard V4L2 controls:
+
+* ``V4L2_CID_BRIGHTNESS``: -1024..1023, default 0
+* ``V4L2_CID_CONTRAST``: -2048..2047, default 256 (1.0x)
+* ``V4L2_CID_GAMMA``: 0..2 selects curve (0=3D2.4, 1=3D2.2, 2=3D1.8)
+* ``V4L2_CID_AUTO_WHITE_BALANCE``: Enable kernel Grey World AWB
+* ``V4L2_CID_DO_WHITE_BALANCE``: Trigger one-shot AWB
+
+SAMA7G5/SAM9X7 add:
+
+* ``V4L2_CID_HUE``: -180..180 degrees
+* ``V4L2_CID_SATURATION``: 0..255, default 16
+
+Custom controls (defined in ``atmel-isc-media.h``):
+
+* ``ISC_CID_R_GAIN``, ``ISC_CID_B_GAIN``, ``ISC_CID_GR_GAIN``,
+  ``ISC_CID_GB_GAIN``: WB gains, 0..8191, Q2.9 (512 =3D 1.0x)
+* ``ISC_CID_R_OFFSET``, ``ISC_CID_B_OFFSET``, ``ISC_CID_GR_OFFSET``,
+  ``ISC_CID_GB_OFFSET``: WB offsets, -4096..4095
+* ``ISC_CID_CC_RR`` ... ``ISC_CID_CC_BB``: 3x3 color correction matrix,
+  signed Q4.8 (256 =3D 1.0)
+* ``ISC_CID_CC_OR``, ``ISC_CID_CC_OG``, ``ISC_CID_CC_OB``: RGB offsets
+* ``ISC_CID_GAMMA_R_LUT``, ``ISC_CID_GAMMA_G_LUT``,
+  ``ISC_CID_GAMMA_B_LUT``: Per-channel gamma LUTs, 64-entry arrays
+
+Pipeline
+--------
+
+Pipeline modules: DPC -> WB -> CFA -> CC -> GAM -> CBHS/CBC -> CSC -> SUB
+
+* DPC: Defective Pixel Correction (XISC only), black level subtraction
+  to sensor bit depth, green disparity correction
+* WB: White Balance gains/offsets
+* CFA: Color Filter Array interpolation (demosaic)
+* CC: Color Correction matrix
+* GAM: Gamma correction (preset or per-channel LUT)
+* CBHS: Contrast/Brightness/Hue/Saturation (XISC only)
+* CBC: Contrast/Brightness (ISC only)
+* CSC: Color Space Conversion (RGB to YCbCr)
+* SUB: Chroma subsampling (4:2:2, 4:2:0)
+
+Pipeline usage depends on input and output formats:
+
+* Raw Bayer input, RGB output: DPC, WB, CFA, CC, GAM
+* Raw Bayer input, YUV output: Full pipeline including CSC, CBHS/CBC, SUB
+* Non-RAW input (YUV/RGB sensor): Pipeline bypassed
diff --git a/MAINTAINERS b/MAINTAINERS
index 0efa8cc6775b..fe5c3bb03e60 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17052,6 +17052,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/media/atmel,isc.yaml
 F:	Documentation/devicetree/bindings/media/microchip,xisc.yaml
+F:	Documentation/userspace-api/media/drivers/microchip-isc.rst
 F:	drivers/media/platform/microchip/microchip-isc*
 F:	drivers/media/platform/microchip/microchip-sama*-isc*
 F:	drivers/staging/media/deprecated/atmel/atmel-isc*
--=20
2.34.1


