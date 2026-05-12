Return-Path: <linux-media+bounces-61287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM67JfVLA2pq3AEAu9opvQ
	(envelope-from <linux-media+bounces-61287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:49:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE4523FE2
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91FDF30D0BB3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DD03C4175;
	Tue, 12 May 2026 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="J3cjX2SQ"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9EF3C417B;
	Tue, 12 May 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600633; cv=none; b=XY7AbvqTUyTEX0Vd2zAl63wEcJ6UFnP2fDj3dGfNlVIz8pMw0AEtgHx77RAcvyu8AsRNkf0Nt4qwFprCg5IMlxWp+7ZV3yCnpPLpFzNz80ampo1G8KbbDMWDkaOidrn9YZPcLT/xdw/rA2Uw1SDnhaiUV2KpkxKd+zIp/Th0l6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600633; c=relaxed/simple;
	bh=OZ/NoQcSk903dsmx/KLriu0QXhQ9xFJlOklwE77v3A8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjFpqt+c5lo6XWM7ZQUNohstdy1LPulHzNqAgJTtZ52UgvAglsqoL4l9rs223CA5MHoN4f5zCQrZaSulCZw0ZaO06h6dvbxhsgSBd1G6EzUngLOQ7q8IHVlccjOmxN9LGZeFGA6w02IkGgDatsH7TcraKFf6cXnECTyRe0momzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=J3cjX2SQ; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600632; x=1810136632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OZ/NoQcSk903dsmx/KLriu0QXhQ9xFJlOklwE77v3A8=;
  b=J3cjX2SQoWW4HpMvxQPCPRc4u5axH2oNylkOksjijIHNb5DMS2XWfWHR
   dl0eX3S0KPdz0o852hgXrPAnMvrgSQMzgHz5uF0fyRgXQeqd8vLLFx7u0
   44XrgEqw+h+exWbV+ssGM5YmsiX9B7vd9/VPA+lZb4OEQ0/shvW0wppMw
   oAbRIYN8OCNXfWZEAhzG7jE3m2lslnyMqBgXHctICYLZ4XOMrWhBdPu/0
   1qd+uj/UHdovIWFjaPHZeOY8l8vpJCDY2/2KZCm2apTWPlp1ViXNDrX+6
   O2QaIF4QYZNTKxnvv01fEobCTtZ6QS6M7ZaWE6GJWgi9OpzzGl11SmcUc
   g==;
X-CSE-ConnectionGUID: UGBbjlKIQjemmeMGCtx39A==
X-CSE-MsgGUID: Gc1JeymaQ3a9f02GofXFFQ==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="288760437"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 08:43:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 12 May 2026 08:43:49 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:43:46 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v2 02/15] media: microchip-isc: mask WB offset and gain register fields
Date: Tue, 12 May 2026 21:13:26 +0530
Message-ID: <20260512154339.210444-3-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512154339.210444-1-balakrishnan.s@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20260512154339.210444-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: 58AE4523FE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-61287-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

ISC_WB_O_* and ISC_WB_G_* pack two 13-bit fields per register. Sign
extension from negative offsets corrupts the upper field. Mask both
fields to 13 bits before packing.

Fixes: 3308bec11098 ("at91: isc: integrate pipeline")
Cc: stable@vger.kernel.org
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index a7cdc743fda7..45b94f1e89d8 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -61,18 +61,23 @@ static inline void isc_update_awb_ctrls(struct isc_devi=
ce *isc)
=20
 	/* In here we set our actual hw pipeline config */
=20
+	/*
+	 * Mask offset fields to 13 bits. Sign extension of negative s32
+	 * values would otherwise corrupt the adjacent field.
+	 */
 	regmap_write(isc->regmap, ISC_WB_O_RGR,
-		     ((ctrls->offset[ISC_HIS_CFG_MODE_R])) |
-		     ((ctrls->offset[ISC_HIS_CFG_MODE_GR]) << 16));
+		     ((u32)ctrls->offset[ISC_HIS_CFG_MODE_R] & GENMASK(12, 0)) |
+		     (((u32)ctrls->offset[ISC_HIS_CFG_MODE_GR] & GENMASK(12, 0)) << 16));
 	regmap_write(isc->regmap, ISC_WB_O_BGB,
-		     ((ctrls->offset[ISC_HIS_CFG_MODE_B])) |
-		     ((ctrls->offset[ISC_HIS_CFG_MODE_GB]) << 16));
+		     ((u32)ctrls->offset[ISC_HIS_CFG_MODE_B] & GENMASK(12, 0)) |
+		     (((u32)ctrls->offset[ISC_HIS_CFG_MODE_GB] & GENMASK(12, 0)) << 16));
+	/* Gains are 13-bit unsigned fields [12:0] and [28:16] */
 	regmap_write(isc->regmap, ISC_WB_G_RGR,
-		     ctrls->gain[ISC_HIS_CFG_MODE_R] |
-		     (ctrls->gain[ISC_HIS_CFG_MODE_GR] << 16));
+		     (ctrls->gain[ISC_HIS_CFG_MODE_R] & GENMASK(12, 0)) |
+		     ((ctrls->gain[ISC_HIS_CFG_MODE_GR] & GENMASK(12, 0)) << 16));
 	regmap_write(isc->regmap, ISC_WB_G_BGB,
-		     ctrls->gain[ISC_HIS_CFG_MODE_B] |
-		     (ctrls->gain[ISC_HIS_CFG_MODE_GB] << 16));
+		     (ctrls->gain[ISC_HIS_CFG_MODE_B] & GENMASK(12, 0)) |
+		     ((ctrls->gain[ISC_HIS_CFG_MODE_GB] & GENMASK(12, 0)) << 16));
 }
=20
 static inline void isc_reset_awb_ctrls(struct isc_device *isc)
--=20
2.34.1


