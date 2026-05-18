Return-Path: <linux-media+bounces-61963-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G0BFKr7CmqB+wQAu9opvQ
	(envelope-from <linux-media+bounces-61963-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:44:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B364B56BD59
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52AD3312129F
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2466F3F86EE;
	Mon, 18 May 2026 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="A802PHY9"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481F13F6C5C;
	Mon, 18 May 2026 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103812; cv=none; b=oYyPU7aj0SHsuOvmfgx7XJA334rZYdE7Ew/6bXF/rP3XFozePI+sJPG5+9ivNO8SXwDsREc/iHqsChFDocAInRJjVwNS0jQ/W/xyaLP9qKiDN6E6dOZj/Cqh0RZLrGOlpHJJYvRO1r+u5V1YiKiHRBP3TnF1n9PhjWk2EH1VSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103812; c=relaxed/simple;
	bh=tIPzbHjktUKJyUNaMWj69c6dOkLPHyPZt6qx4G/J1iM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rp64K0SzNvFjzf9oUvbTMr5E35KOZFIolJmdkEZRIavE89rKn9n61SLqhvEqzDaOE6/pBD0hKAAMshf9Ewhu49hZATMncItl8TzWRiofk6wa572v3TD8zijFu383tM4bGEiFKbW0kT3f8DQc35sbk/OJDCMwPBtNq3iffK6UIW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=A802PHY9; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103809; x=1810639809;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=tIPzbHjktUKJyUNaMWj69c6dOkLPHyPZt6qx4G/J1iM=;
  b=A802PHY9yLfY3NrQDOJwHmh/B3P5BVuudWoPMUkd51S9mhBjDo9R31kF
   LdaaKF0zBfgHljL0ewpcwFQRCHgufiSRUB7dYrVfLvmUeXvpcVVBulEJy
   RIf9gPa08LLVOPr7jQztuOQ/u13lkMwOp6cX/8EmNKgr/tJYe2hWiDkl8
   wSI4t6cnRoe3/1IhEg5J8N02XmVDH0p3D3pP3YN7VLoEANwFPOgZoe7TY
   yM91FGHlbQqOI7EYjpzTehS4W4NnxyHTlAx6HkrDpf49G2w8wt+MKOZS0
   3LtQMkwmCG6iMYTIdSo7R62dp1icZBw/28fMvLO8ODg5+Tl5aiK6zg7+W
   Q==;
X-CSE-ConnectionGUID: uTzkBJghSh2aWlyoa4M9MQ==
X-CSE-MsgGUID: Kf8P9f0tQ9i0jccudbh9cQ==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="289025038"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:30:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 18 May 2026 04:30:07 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:30:03 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 18 May 2026 16:59:43 +0530
Subject: [PATCH v4 05/12] media: microchip-isc: add driver documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260518-balki-isc-series1-v4-v4-5-97f189185b7e@microchip.com>
References: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
In-Reply-To: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: B364B56BD59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61963-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Document V4L2 controls and pipeline modes for ISC/XISC camera interface
on SAMA5D2, SAMA7G5, and SAM9X7.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../userspace-api/media/drivers/index.rst          |  1 +
 .../userspace-api/media/drivers/microchip-isc.rst  | 66 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 68 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 02967c9b18d6..65ef6ba3523e 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -34,6 +34,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	imx-uapi
 	mali-c55
 	max2175
+	microchip-isc
 	npcm-video
 	omap3isp-uapi
 	thp7312
diff --git a/Documentation/userspace-api/media/drivers/microchip-isc.rst b/Documentation/userspace-api/media/drivers/microchip-isc.rst
new file mode 100644
index 000000000000..e065ae009595
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/microchip-isc.rst
@@ -0,0 +1,66 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Microchip ISC/XISC Driver
+=========================
+
+The Image Sensor Controller (ISC) on SAMA5D2 and eXtended ISC (XISC) on
+SAMA7G5/SAM9X7 provide camera capture with hardware image processing.
+
+Supported Hardware
+------------------
+
+==========  ==========  ==============  ================  ===============
+SoC         Controller  Max Resolution  Interface         Hue/Saturation
+==========  ==========  ==============  ================  ===============
+SAMA5D2     ISC         2592x1944       12-bit parallel   No
+SAMA7G5     XISC        3264x2464       12-bit + CSI-2    Yes
+SAM9X7      XISC        2560x1920       12-bit + CSI-2    Yes
+==========  ==========  ==============  ================  ===============
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
+* ``V4L2_CID_GAMMA``: 0..2 selects curve (0=2.4, 1=2.2, 2=1.8)
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
+  ``ISC_CID_GB_GAIN``: WB gains, 0..8191, Q2.9 (512 = 1.0x)
+* ``ISC_CID_R_OFFSET``, ``ISC_CID_B_OFFSET``, ``ISC_CID_GR_OFFSET``,
+  ``ISC_CID_GB_OFFSET``: WB offsets, -4096..4095
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
+* GAM: Gamma correction (preset)
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
index e08767323763..d4aa7e86e2bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17057,6 +17057,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/media/atmel,isc.yaml
 F:	Documentation/devicetree/bindings/media/microchip,xisc.yaml
+F:	Documentation/userspace-api/media/drivers/microchip-isc.rst
 F:	drivers/media/platform/microchip/microchip-isc*
 F:	drivers/media/platform/microchip/microchip-sama*-isc*
 F:	drivers/staging/media/deprecated/atmel/atmel-isc*

-- 
2.34.1


