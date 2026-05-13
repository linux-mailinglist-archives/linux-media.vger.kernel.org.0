Return-Path: <linux-media+bounces-61347-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNEmF1gmBGqDEwIAu9opvQ
	(envelope-from <linux-media+bounces-61347-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:20:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F05E52E853
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 380703082808
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C073E3D7D6B;
	Wed, 13 May 2026 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="gIdh6qSY"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8EC3D75DC;
	Wed, 13 May 2026 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656709; cv=none; b=KzOmtQBEptc/llHv1OY8XEaOwsCuDr3yu+O27ceOQch4sVIEdjdtJR9is5gkT2dtnd2Gi9jpJWKstningvQwEXIONmI0jg8XDth8UYTFuhdC/GcmvaUMCPJzeoWfQJBqPpefOlcWRV9NXVxJ3cMHLdZhezr9WIDLQcGFKjCDWU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656709; c=relaxed/simple;
	bh=Uq0Wb8JPOoOs2/0x2MV5Z+pFuVJ6FH0ojd6mLoBOmCg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBw9sMh6wCCtJ08eTjMcWOzYTQEH7icDDPrjlR2q5DTmN1hJSQ9Ib2AkV5i0jaSgDpb+6uKaLZzJ43gGq9KnEkwQ9g7YffmBsKhIK01PaoPzJN8TsPLAEha/aFXpI9kctjFIOzjVwSD9x9PUQJYczXWqsWssCOMe3Tl4o30GETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=gIdh6qSY; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778656708; x=1810192708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uq0Wb8JPOoOs2/0x2MV5Z+pFuVJ6FH0ojd6mLoBOmCg=;
  b=gIdh6qSYfmEZULLgt5N++nf3wZIMpPEz6jatm8tBQnQCysvUza2CNC91
   7kkRcpEDa30yJA6IpFe68VddeuFtmql9kR3mPqJxAx5kYIp4yDVx3d0Kx
   bzowXR/SN1T2yTYaWmxHDXpgFjj8qddyJzpHmqFVBCFEnhGbV0gZQr2op
   55ieIDXCZImj5p5C+dqh7uNSmb340YyLY9u24IPacgolpOvs8a0aJKqiR
   6sv1jRtmNsn6t+s2In9fw5iN7PF6VICWHD//XFYIlHmII4yL5M7+KXwok
   3JSfbhBQws6zWXEzLS+V5xQCzDglaDTIzL7DIxrdxmkaWFKQL7L652xaj
   Q==;
X-CSE-ConnectionGUID: dqs3d4p8TWCwjL5e7sGblA==
X-CSE-MsgGUID: 92IBeZoyTdeGwRK2fyMI2g==
X-IronPort-AV: E=Sophos;i="6.23,232,1770620400"; 
   d="scan'208";a="56656547"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2026 00:18:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 13 May 2026 00:18:27 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 13 May 2026 00:18:25 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 14/15] media: microchip-isc: smooth AWB gains with EMA filter
Date: Wed, 13 May 2026 12:47:41 +0530
Message-ID: <20260513071742.97263-15-balakrishnan.s@microchip.com>
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
X-Rspamd-Queue-Id: 1F05E52E853
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61347-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Apply exponential moving average (alpha=3D0.25) to reduce per-frame
flicker from sensor noise.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 19 ++++++++++++++++---
 .../media/platform/microchip/microchip-isc.h  |  1 +
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index ea71cf50eb58..80ae8db1ce01 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -132,6 +132,7 @@ static inline void isc_reset_awb_ctrls(struct isc_devic=
e *isc)
 	for (c =3D ISC_HIS_CFG_MODE_GR; c <=3D ISC_HIS_CFG_MODE_B; c++) {
 		/* gains have a fixed point at 9 decimals */
 		isc->ctrls.gain[c] =3D 1 << 9;
+		isc->ctrls.gain_smooth[c] =3D 1 << 9;
 		/* offsets are in 2's complements */
 		isc->ctrls.offset[c] =3D 0;
 	}
@@ -1588,11 +1589,23 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		/* Combine stretch and grey-world gains; result stays in Q9. */
 		gain =3D (s_gain * gw_gain) >> 9;
=20
-		ctrls->gain[c] =3D clamp_val(gain, 0, GENMASK(12, 0));
+		/*
+		 * Smooth gain updates with an exponential weighted average
+		 * to suppress per-frame flicker:
+		 *   smooth[n] =3D (3 * smooth[n-1] + gain) / 4
+		 * Clamp to the hardware register width to prevent unbounded
+		 * accumulation under degenerate (near-empty histogram) inputs.
+		 */
+		ctrls->gain_smooth[c] =3D (3 * ctrls->gain_smooth[c] + gain) / 4;
+		ctrls->gain_smooth[c] =3D min_t(u32, ctrls->gain_smooth[c],
+					      GENMASK(12, 0));
+
+		ctrls->gain[c] =3D ctrls->gain_smooth[c];
=20
 		dev_dbg(isc->dev,
-			"isc wb: c=3D%u black=3D%u avg=3D%u s_gain=3D%u gw_gain=3D%u gain=3D%u",
-			c, hist_min, channel_avg, s_gain, gw_gain, gain);
+			"isc wb: c=3D%u black=3D%u avg=3D%u s_gain=3D%u gw_gain=3D%u gain=3D%u =
smooth=3D%u\n",
+			c, hist_min, channel_avg, s_gain, gw_gain, gain,
+			ctrls->gain_smooth[c]);
 	}
 }
=20
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/med=
ia/platform/microchip/microchip-isc.h
index 44d54404250d..e558f1a65b33 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -155,6 +155,7 @@ struct isc_ctrls {
=20
 	/* one for each component : GR, R, GB, B */
 	u32 gain[HIST_BAYER];
+	u32 gain_smooth[HIST_BAYER];
 	s32 offset[HIST_BAYER];
=20
 	u32 hist_entry[HIST_ENTRIES];
--=20
2.34.1


