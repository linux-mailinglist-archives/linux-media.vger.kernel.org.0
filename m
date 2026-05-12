Return-Path: <linux-media+bounces-61299-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCTSE1RSA2pq4gEAu9opvQ
	(envelope-from <linux-media+bounces-61299-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:16:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9FF5247AE
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBF753287AEF
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315583C819C;
	Tue, 12 May 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="V+1c4W7I"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE713CB8F5;
	Tue, 12 May 2026 15:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600670; cv=none; b=YYwoJZ024T2YWfBVvKvrRYIo2TaJ4RjtZbhu09A0RZv9B162+PyqupiWC7y08TcoJV2xkCOpZCnKnFhWLzWaXYTVlgzcI6sRmWl7bFttoqUC022jCzE5wc4jLLp/LozBvAUyalWja2Vazmi1ywscckc2fkUiKL3Y+EQ2ROx8CQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600670; c=relaxed/simple;
	bh=sUg/FdHhKpneoz83f5ukXAk07OBSKcQTvrRyENYAQqc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rNCMWUNdNs39NJiVtI51vWsZNnSdBtbCwLOyl8SchLdtpEgX4nXdF98eiEDn2H2xcU4kc0J9Ttn3hiUJOwBPAPr5zL4C3T9a6ZuiF7w+azMEGdMY5ufjsoEwvx5fJYNyjkoFQ5ric/J/HE/hMK91NAwAKs490te72+bztaKTS3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=V+1c4W7I; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600670; x=1810136670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sUg/FdHhKpneoz83f5ukXAk07OBSKcQTvrRyENYAQqc=;
  b=V+1c4W7IcgDuKK2A/eLCTY3vc/rEagtxR/817/zfTE2gHIlEf9IvY7Ao
   0B/PKLLHYQKHnda80cHnuBTJnRD+6NxESvyDxcTRmlfJB0GFBzXWQvkzp
   7bCG5n6G0AljjGcZQ+YK5z8IG61iXdiQV1vlKjoJX+nG8xthvaTBDR2Q0
   ga6wncwUI9UoIwjVGcbhsT7kfNfIBEu+69SPvuakYDTuCEwIjEnNq0pQq
   f8riMQ3TVBGRNEKuucODaZyhSlCsC9ImJ4TO7J0jLw4s3N/DZCC0+K+jB
   jdjOTCTHgPGNs9ZI/Ml8bRYZRYin+p5hXq+0LQJ+EJThm1Izsx6157BVp
   g==;
X-CSE-ConnectionGUID: XbB0UJlXTyWhbhgmk7NgVQ==
X-CSE-MsgGUID: YcUDCRPpT0WNLM73Gd8ogA==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="288760485"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2026 08:44:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 12 May 2026 08:44:27 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:44:25 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 14/15] media: microchip-isc: smooth AWB gains with EMA filter
Date: Tue, 12 May 2026 21:13:38 +0530
Message-ID: <20260512154339.210444-15-balakrishnan.s@microchip.com>
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
X-Rspamd-Queue-Id: AF9FF5247AE
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
	TAGGED_FROM(0.00)[bounces-61299-lists,linux-media=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
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
index 8fcf64708dc8..072386aa2d73 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -134,6 +134,7 @@ static inline void isc_reset_awb_ctrls(struct isc_devic=
e *isc)
 	for (c =3D ISC_HIS_CFG_MODE_GR; c <=3D ISC_HIS_CFG_MODE_B; c++) {
 		/* gains have a fixed point at 9 decimals */
 		isc->ctrls.gain[c] =3D 1 << 9;
+		isc->ctrls.gain_smooth[c] =3D 1 << 9;
 		/* offsets are in 2's complements */
 		isc->ctrls.offset[c] =3D 0;
 	}
@@ -1590,11 +1591,23 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
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


