Return-Path: <linux-media+bounces-54982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBxfBGEIr2loMAIAu9opvQ
	(envelope-from <linux-media+bounces-54982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:50:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6444123DEF4
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2FD030DA1DA
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 17:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CDA27467F;
	Mon,  9 Mar 2026 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="cGF8JMkF"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C727FB3C;
	Mon,  9 Mar 2026 17:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078392; cv=none; b=usV+3fherOHFSrTBq58eiRrWXlGINBQtsWsAU3DZqXyCmK+pAFoQkI/ZJko/VB+C0ih5IDI+uqOGYF6iI9bpfJb5BQ/54j4zsA2xusNaEaZJL3DZys3bFACUWmX89d4Itev6n3UZ5uuc6wdq3QYTKvNddG22r7cxgCX1fIonneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078392; c=relaxed/simple;
	bh=Msne2OPU6AC8rANt+KJ9Nfx9HBaFIIS/y7bNrfoHsP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnU8ZnCxU/LU4bTuFQmHFbk95JiiNqP/9DQWdVRuQL3J8g9pjyx+F84iUSfjKKPNIwdUhx+XLHP2n04ENgj0tL/R3Vf8IkUPcspZI8IRWKJMoPcCncS8bsaDTLZLEh+RnwpWPLzX5qinFD6JF3Uo5h2oyaAeNqVG3AZnuh3ZtDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=cGF8JMkF; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QhGjIQciuVNZ6DrTWNpHCvmxA9va2rN5Hjh+s//xY04=; b=cGF8JMkFNvAnRdeD4yb9NO15Ua
	tJPqVL/qzN/BBT1s/zexwwaVUIJQ6yohXwVrUkZ33r1cA/WfCFJgrrJjYcVkvDhPZuRpE+YLHtt7E
	tfLFrd5WNG+L/N76q3ewlgHFZksqBGZfmGEH5WkDIB+Ft///gB2TZ+pLVGERlHhPhLCY=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:56968 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vze4P-00Dxnt-S1; Mon, 09 Mar 2026 18:07:06 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Mon, 09 Mar 2026 18:07:04 +0100
Subject: [PATCH v2 2/9] media: i2c: ov08d10: fix image vertical start
 setting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-ov08d10-v2-2-81f8b5d99984@emfend.at>
References: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
In-Reply-To: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Set the device's runtime PM status and enable runtime PM before
    registering the async sub-device. This is needed to avoid the case where
   the device is runtime PM resumed while runtime PM has not been [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
X-Rspamd-Queue-Id: 6444123DEF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54982-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,emfend.at:mid,emfend.at:email]
X-Rspamd-Action: no action

The current settings for the "image vertical start" register appear to be
incorrect. While this only results in an incorrect start line for native
modes, this faulty setting causes actual problems in binning mode. At least
on an i.MX8MP test system, only corrupted frames could be received.
To correct this, the recommended settings from the reference register sets
are used for all modes. Since this shifts the start by one line, the Bayer
pattern also changes, which has also been corrected.

Fixes: 7be91e02ed57 ("media: i2c: Add ov08d10 camera sensor driver")
Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 5b02f61e359fa900da9290c1c151aa01b9d70e6e..5e1b8b58b3d64bcf20a7b1a4e47f547d2fd82998 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -217,7 +217,7 @@ static const struct ov08d10_reg lane_2_mode_3280x2460[] = {
 	{0x9a, 0x30},
 	{0xa8, 0x02},
 	{0xfd, 0x02},
-	{0xa1, 0x01},
+	{0xa1, 0x00},
 	{0xa2, 0x09},
 	{0xa3, 0x9c},
 	{0xa5, 0x00},
@@ -335,7 +335,7 @@ static const struct ov08d10_reg lane_2_mode_3264x2448[] = {
 	{0x9a, 0x30},
 	{0xa8, 0x02},
 	{0xfd, 0x02},
-	{0xa1, 0x09},
+	{0xa1, 0x08},
 	{0xa2, 0x09},
 	{0xa3, 0x90},
 	{0xa5, 0x08},
@@ -467,7 +467,7 @@ static const struct ov08d10_reg lane_2_mode_1632x1224[] = {
 	{0xaa, 0xd0},
 	{0xab, 0x06},
 	{0xac, 0x68},
-	{0xa1, 0x09},
+	{0xa1, 0x04},
 	{0xa2, 0x04},
 	{0xa3, 0xc8},
 	{0xa5, 0x04},
@@ -613,8 +613,8 @@ static const struct ov08d10_lane_cfg lane_cfg_2 = {
 static u32 ov08d10_get_format_code(struct ov08d10 *ov08d10)
 {
 	static const u32 codes[2][2] = {
-		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10},
-		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10},
+		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10 },
+		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10 },
 	};
 
 	return codes[ov08d10->vflip->val][ov08d10->hflip->val];

-- 
2.34.1


