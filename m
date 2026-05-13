Return-Path: <linux-media+bounces-61348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGg6K2AmBGqDEwIAu9opvQ
	(envelope-from <linux-media+bounces-61348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:21:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4552E864
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADC1030536C1
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821813D6666;
	Wed, 13 May 2026 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="MVTHzs8o"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E003D7D7F;
	Wed, 13 May 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656712; cv=none; b=IcYFSupkR6/7ZkZewc8VKDYDpCJlDuMUirfhZ/rGkPZKaAulguMVDmDaJMo1WhL42D0WJSsCtQ/psZdmSG6q1niNt7PzFX/PL8oYVJGu4FsTcE2mqXY7X2E6EBp3rHVYy+mFed3MQ1fEmUJbJnvhLcNw7Y4VAb9noKn6Dda5+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656712; c=relaxed/simple;
	bh=pYFtLLi3SuyNLJBpvcInLmiZVX11uNDvUzoUsZ/OyFk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEGl6WQiyWx8P3qk8xojp7uB5QF/M1JAeD8YimHf90AlK5UJSsynGaf+Vs9SAxZUFxeA74ac9M6dEdALGWpJjYLu+VHJ6LXUGvlkC58r05zf+0MhrS2Vg3LZOSlvS6gK/SzZlhCqqgrVmlgkAFIafIHfG28IsLp7wZtOanxYzCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=MVTHzs8o; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778656710; x=1810192710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pYFtLLi3SuyNLJBpvcInLmiZVX11uNDvUzoUsZ/OyFk=;
  b=MVTHzs8oMSUO19HRvc2HAfJZdVdP4iepaIf8Ok7ngT46VxrW0b2RcQxH
   w8VyMHCJYi7hg+2x0wsUEi6Le9RB1enoB1NVjDXTWQ6JMJilS8modVbVy
   bNYx5WcEkBBmijcshVA/4lqbng2jLggTcy1EmobnHhdGCw9OX1DjuV2/D
   KtufDUkQjyUyvgOJP7yC7s2LUFDoZdd8SMM9u/IKYI5D0KIM+q8SFbQ6t
   AyZpLzwFJP3keZXoSTH7adKiw+y5thQ+HXcsCe82SULvsjWwr9RYzHm9u
   8GFMbqv0ydxa4LP4xAxYWAUIOhkXFjQIXX7sBSn+IQJjTiurOOhwjPsrF
   A==;
X-CSE-ConnectionGUID: Wocee0VURaCqmY8sNPBdcA==
X-CSE-MsgGUID: Jf15taBwRHyD36cc8c+3Dw==
X-IronPort-AV: E=Sophos;i="6.23,232,1770620400"; 
   d="scan'208";a="56656549"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2026 00:18:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 13 May 2026 00:18:30 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 13 May 2026 00:18:27 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 15/15] media: microchip-isc: scale DPC black level to sensor bit depth
Date: Wed, 13 May 2026 12:47:42 +0530
Message-ID: <20260513071742.97263-16-balakrishnan.s@microchip.com>
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
X-Rspamd-Queue-Id: A4D4552E864
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61348-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

Scale the nominal 10-bit black level (64 counts) to match 8/10/12-bit
sensor bus width.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../microchip/microchip-sama7g5-isc.c         | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/dri=
vers/media/platform/microchip/microchip-sama7g5-isc.c
index 9110690a49e4..46a721d76453 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -26,6 +26,7 @@
  * HIS: Histogram module performs statistic counters on the frames
  */
=20
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
@@ -289,9 +290,25 @@ static void isc_sama7g5_config_dpc(struct isc_device *=
isc)
 {
 	u32 bay_cfg =3D isc->config.sd_format->cfa_baycfg;
 	struct regmap *regmap =3D isc->regmap;
+	u32 bps, bloff;
+
+	/*
+	 * Scale the nominal 10-bit black level offset (64 counts) to the
+	 * actual sensor bus width.
+	 * ISC_PFE_CFG0_BPS encodes (12 - bit_depth) / 2 in bits[30:28]:
+	 *   BPS_EIGHT  =3D 4  ->  8-bit  -> bloff =3D 64 >> 2 =3D 16
+	 *   BPS_TEN    =3D 2  -> 10-bit  -> bloff =3D 64
+	 *   BPS_TWELVE =3D 0  -> 12-bit  -> bloff =3D min(64 << 2, 255) =3D 255
+	 * The BLOFF hardware field is 8-bit so values are clamped to 255.
+	 */
+	bps =3D FIELD_GET(ISC_PFE_CFG0_BPS_MASK, isc->config.sd_format->pfe_cfg0_=
bps);
+	if (bps >=3D 2)
+		bloff =3D 64u >> (bps - 2);
+	else
+		bloff =3D min(64u << (2 - bps), 255u);
=20
 	regmap_update_bits(regmap, ISC_DPC_CFG, ISC_DPC_CFG_BLOFF_MASK,
-			   (64 << ISC_DPC_CFG_BLOFF_SHIFT));
+			   (bloff << ISC_DPC_CFG_BLOFF_SHIFT));
 	regmap_update_bits(regmap, ISC_DPC_CFG, ISC_DPC_CFG_BAYCFG_MASK,
 			   (bay_cfg << ISC_DPC_CFG_BAYCFG_SHIFT));
 }
--=20
2.34.1


