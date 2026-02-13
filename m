Return-Path: <linux-media+bounces-52755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGuFNJMwj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:09:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AD6136F06
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D03A31A9723
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BC0362137;
	Fri, 13 Feb 2026 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rj3lJC1w"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C2F361676;
	Fri, 13 Feb 2026 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991362; cv=none; b=pg6LoemkysbhIVyDdNchRfcqj6W5lNhVX9Zucxjvt5Hhx/smyvT4MDH7pvSfcQC2NN6oRscEevj7sQFGlf+1IBaf/3tSFerufBptRj5BlJpTvGoheIuDbvVZIf6xbYEm8wm4tdcCBhrxZKwKsQKd99oKd/rbdLPb2b7P3TZzn/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991362; c=relaxed/simple;
	bh=eHhrdPEgO5CSfV7eghEybV6KvOAKJ2nsvsWWwSSnwQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1bs/ZHWRMVsRWob3VdmH/WJECW3pMlL5e5UON10PyEsZZvtih7ERIRu7D/oW4OcPjHhQTRTo/zWk4LgNjMHOHpfA6rTogQXBDfZNyTWd9icj4mf+crGGZpvAkAgEEMDeOC7zMj6GAKwDo1gcyWk6WzTqfqhlRIll62VVSe+IAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rj3lJC1w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34B912704;
	Fri, 13 Feb 2026 15:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991282;
	bh=eHhrdPEgO5CSfV7eghEybV6KvOAKJ2nsvsWWwSSnwQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rj3lJC1wHmFr0+ggIHssAZqS9+qJQp4LeM4d1kJX+pO1gDQty7ebArKykAJfZXoYG
	 SOcxRLLXFB3hbi+muMUh+sDiuCfxbZZcXqEs6IQSb1hnBaOXizHGVEuHzj0+4fe0WN
	 adhSGIYboeruxVEZpHtxhacdNmqzfF6zOX71C50k=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:53 +0000
Subject: [PATCH v2 14/25] media: i2c: imx283: Move minimum exposure
 handling to scan modes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-14-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
In-Reply-To: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=4365;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=eHhrdPEgO5CSfV7eghEybV6KvOAKJ2nsvsWWwSSnwQU=;
 b=Z8rjX0zf+5QyLaak7zXBB9NY5fhTNcIgxn2rzGMuJUTJRMoP5tVe0H5w42WlU6E6MLHa4vvKT
 mQztDLSPEpOCtT1PQ5T0zpD3CqryBjhnDfdQ/u+onb+pppOa7sBZCMH
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52755-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 75AD6136F06
X-Rspamd-Action: no action

The minimum exposure is a factor of the scan mode.

Move the definitions of the minimum exposure timeto the scan mode
structures and clean up the duplication from the v4l2 output mode
definitions.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index d333be4e66d7..6c2be9195cba 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -286,6 +286,9 @@ struct imx283_scanout {
 	s16 vst;
 	u16 vct;
 	u16 veff;
+
+	/* minimum SHR */
+	u32 min_shr;
 };
 
 static const struct imx283_scanout imx283_scan_modes[] = {
@@ -298,6 +301,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.vst = -1, /* Align to Mode 2/3 */
 		.vct = 0,
 		.veff = 3694,
+		.min_shr = 11,
 	},
 	[IMX283_MODE_1] = {
 		.bpp = 10,
@@ -307,6 +311,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.vst = -1, /* Align to Mode 2/3 */
 		.vct = 0,
 		.veff = 3694,
+		.min_shr = 10,
 	},
 	[IMX283_MODE_1A] = {
 		.bpp = 10,
@@ -316,6 +321,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.vst = 146,
 		.vct = 291,
 		.veff = 3112,
+		.min_shr = 10,
 	},
 	[IMX283_MODE_1S] = {
 		.bpp = 10,
@@ -325,6 +331,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.vst = 162,
 		.vct = 324,
 		.veff = 3046,
+		.min_shr = 10,
 	},
 
 	/* Horizontal / Vertical 2/2-line binning */
@@ -336,6 +343,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.vst = -2, /* Provides alignment to Mode 0/1 */
 		.vct = 0,
 		.veff = 1824,
+		.min_shr = 12,
 	},
 	[IMX283_MODE_2A] = {
 		.bpp = 12,
@@ -345,6 +353,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.vst = 71,
 		.vct = 143,
 		.veff = 1556,
+		.min_shr = 12,
 	},
 
 	/* Horizontal / Vertical 3/3-line binning */
@@ -356,6 +365,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.vst = 1, /* Provides alignment to Mode 0/1 */
 		.vct = 0,
 		.veff = 1234,
+		.min_shr = 16,
 	},
 
 	/* Vertical 2/9 subsampling, horizontal 3 binning cropping */
@@ -367,6 +377,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.vst = 9,
 		.vct = 17,
 		.veff = 378,
+		.min_shr = 4,
 	},
 
 	/* Vertical 2/19 subsampling binning, horizontal 3 binning */
@@ -378,6 +389,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.vst = 0,
 		.vct = 0,
 		.veff = 198,
+		.min_shr = 4,
 	},
 
 	/* Vertical 2 binning horizontal 2/4, subsampling 16:9 cropping */
@@ -389,6 +401,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.vst = 0,
 		.vct = 0,
 		.veff = 1556,
+		.min_shr = 12,
 	},
 
 	/*
@@ -435,9 +448,6 @@ struct imx283_mode {
 	/* default V-timing */
 	u32 default_vmax;
 
-	/* minimum SHR */
-	u32 min_shr;
-
 	/* Analog crop rectangle. */
 	struct v4l2_rect crop;
 };
@@ -511,8 +521,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.default_hmax = 6000, /* 900 @ 480MHz/72MHz */
 		.default_vmax = 4000,
 
-		.min_shr = 11,
-
 		.crop = imx283_recommended_area,
 	},
 	{
@@ -529,8 +537,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.default_hmax = 2500, /* 375 @ 480MHz/72Mhz */
 		.default_vmax = 3840,
 
-		.min_shr = 12,
-
 		.crop = imx283_recommended_area,
 	},
 	{
@@ -547,8 +553,6 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.default_hmax = 1900, /* 285 @ 480MHz/72Mhz */
 		.default_vmax = 4200,
 
-		.min_shr = 16,
-
 		.crop = imx283_recommended_area,
 	},
 };
@@ -566,8 +570,6 @@ static const struct imx283_mode supported_modes_10bit[] = {
 		.default_hmax = 6000, /* 750 @ 576MHz / 72MHz */
 		.default_vmax = 3840,
 
-		.min_shr = 10,
-
 		.crop = imx283_recommended_area,
 	},
 };
@@ -726,7 +728,7 @@ static void imx283_exposure_limits(struct imx283 *imx283,
 				   s64 *min_exposure, s64 *max_exposure)
 {
 	u32 svr = 0; /* SVR feature is not currently supported */
-	u64 min_shr = mode->min_shr;
+	u64 min_shr = mode->scan->min_shr;
 	/* Global Shutter is not supported */
 	u64 max_shr = (svr + 1) * imx283->vmax - 4;
 

-- 
2.52.0


