Return-Path: <linux-media+bounces-62887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEhbLZXRFmowsgcAu9opvQ
	(envelope-from <linux-media+bounces-62887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:12:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2D05E32BF
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3C5D3012D5D
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B133FE375;
	Wed, 27 May 2026 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="eTLg6Fr5"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CC43FD957;
	Wed, 27 May 2026 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880094; cv=none; b=efi3+jw2JBbpTxegKJxaVTUPyK06XFucDzBymqA1eikK3VsGj/gEkd68dh8lmPkALy0B4xTxDJVzcpeBIiWdlQI16pwke2AtiueGwEO0SNHJj4WQvEHRnRb2Ped+7KEJGT0vXoHz/aUKD0ThiAADtgIQLzR5gcFJMwyLO+NY9zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880094; c=relaxed/simple;
	bh=qDvEDWXEKa8hkWcJmwTKKABkJC3pfZSaCyEoriecjCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=N45wKIDLyeXfznPsZ1S/KB0fZrMCsTCc6nS4UsWoYgYLrzVS8OU2lnQAl09Ehl4osvZHsPHfTnagwu5cYXQiAiMbY+cKSQv8m1NsMUe6IsO+kzTPaOaTg1PIyQr45emcQAWj/UWC4UjDKKwn7e30LAKdcgw0C+yZ8q5FqQ9mZ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=eTLg6Fr5; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779880093; x=1811416093;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=qDvEDWXEKa8hkWcJmwTKKABkJC3pfZSaCyEoriecjCc=;
  b=eTLg6Fr5ThyS3lOupe7PqEorhrfg1WFnSYSUVhQPM8ePGz829ADvJXfw
   gTaI8eOXo4CWNW6ktNuR2ubwFLXJnw40heM/TT4dtQlzbpGEn5EYWHQU2
   XkvNFqMCes9Np/RskxswudFeTVN2kUcCjsz3hh2fFUAfMHuemUQ43aSfn
   BSOzCJIORV+hiZdFtTwyOk6tV1T7G66zTxUoMqCRPnijAAUe4a0rpSBLZ
   x96Cif3Jq0vJPxuhVEiLcpsWfZoW8JA+WMTuDR6hoWPHGIoCmgh3h7teT
   mmcSDkJFCkYQxe9NgODYYig9P+iUfOIJ7zK4it5fFz/6YDUZxdSUvLBzc
   Q==;
X-CSE-ConnectionGUID: 2CtCAwlxSXCVN3qBpWODfQ==
X-CSE-MsgGUID: AjSiTKxHRj2rMAiwG66s8Q==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="58532069"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:08:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 04:08:11 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 04:08:07 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 16:37:27 +0530
Subject: [PATCH v5 11/12] media: microchip-isc: smooth AWB gains with EMA
 filter
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-microchip-isc-fixes-v5-11-b0ec1bb954be@microchip.com>
References: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
In-Reply-To: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62887-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Queue-Id: 5E2D05E32BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Apply exponential moving average (alpha=0.25) to reduce per-frame
flicker from sensor noise.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 19 ++++++++++++++++---
 drivers/media/platform/microchip/microchip-isc.h      |  1 +
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index a2719830d39b..d07ea2fa33c6 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -94,6 +94,7 @@ static inline void isc_reset_awb_ctrls(struct isc_device *isc)
 	for (c = ISC_HIS_CFG_MODE_GR; c <= ISC_HIS_CFG_MODE_B; c++) {
 		/* gains have a fixed point at 9 decimals */
 		ctrls->gain[c] = 1 << 9;
+		ctrls->gain_smooth[c] = 1 << 9;
 		/* offsets are in 2's complements */
 		ctrls->offset[c] = 0;
 	}
@@ -1477,11 +1478,23 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		/* Combine stretch and grey-world gains; result stays in Q9. */
 		gain = (s_gain * gw_gain) >> 9;
 
-		ctrls->gain[c] = clamp_val(gain, 0, GENMASK(12, 0));
+		/*
+		 * Smooth gain updates with an exponential weighted average
+		 * to suppress per-frame flicker:
+		 *   smooth[n] = (3 * smooth[n-1] + gain) / 4
+		 * Clamp to the hardware register width to prevent unbounded
+		 * accumulation under degenerate (near-empty histogram) inputs.
+		 */
+		ctrls->gain_smooth[c] = (3 * ctrls->gain_smooth[c] + gain) / 4;
+		ctrls->gain_smooth[c] = min_t(u32, ctrls->gain_smooth[c],
+					      GENMASK(12, 0));
+
+		ctrls->gain[c] = ctrls->gain_smooth[c];
 
 		dev_dbg(isc->dev,
-			"isc wb: c=%u black=%u avg=%u s_gain=%u gw_gain=%u gain=%u",
-			c, hist_min, channel_avg, s_gain, gw_gain, gain);
+			"isc wb: c=%u black=%u avg=%u s_gain=%u gw_gain=%u gain=%u smooth=%u\n",
+			c, hist_min, channel_avg, s_gain, gw_gain, gain,
+			ctrls->gain_smooth[c]);
 	}
 }
 
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index 45168c62e3bc..0ae9b4e8f32d 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -149,6 +149,7 @@ struct isc_ctrls {
 
 	/* one for each component : GR, R, GB, B */
 	u32 gain[HIST_BAYER];
+	u32 gain_smooth[HIST_BAYER];
 	s32 offset[HIST_BAYER];
 
 	u32 hist_entry[HIST_ENTRIES];

-- 
2.34.1


