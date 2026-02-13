Return-Path: <linux-media+bounces-52751-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGMMOFkwj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52751-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:08:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7F136EC3
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1784931851CE
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F5B361DB0;
	Fri, 13 Feb 2026 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VcBK1QWI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D23624A3;
	Fri, 13 Feb 2026 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991348; cv=none; b=ojgt5fn/1McL8oN00whWthFEaSOvB+2PxPezd62uQ+RZozXayvPYmo+6tlkniReXN4sk+4XRC8BX0+FSr5rvaSABphCeFPwUOry0oUk9vpU+gWMYJ9qM0dpn6mohX5CUMT5pbpdm286hVapeMKu9sSFF350BKo9Xq1bS4Iurlx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991348; c=relaxed/simple;
	bh=sB8Itc28fEfjUIVxNRQYfIOTT0ffhtlQFZ4N6tgI0kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVXJeKwh27uv8m7mb4YAQz2fS3JSEsOgCastCOPeL4B9e+i5dLTdQRw5Z7wDfTicYBkewco45sZoo6QQpbzSkHTX9QMsCs7VZleSCIOQL6EypNNKfmo3jdtY/hc+Xm0GagExFr6i3HRUBrrIQAhGC8i9VPmTy/9nokYlKjFehU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VcBK1QWI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5084C26C4;
	Fri, 13 Feb 2026 15:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991280;
	bh=sB8Itc28fEfjUIVxNRQYfIOTT0ffhtlQFZ4N6tgI0kc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VcBK1QWIWhFmtCh7xs2o9+AgcPewN1Vr3O5HeLK6qW6QbrqSsG6Oqx19FvyOuI44d
	 qLISJZtbt94Y17nGWeIGl4WSmfS+5k+8pr4ke6MGf7UtKf2JJe4D+MuC6XINxQ96YX
	 yTRMd8ckXlqcVLeX79/go/qEpHflxraS7IWK5j44=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:48 +0000
Subject: [PATCH v2 09/25] media: i2c: imx283: Define recommended area
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-9-be40a3770ebf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=2448;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=sB8Itc28fEfjUIVxNRQYfIOTT0ffhtlQFZ4N6tgI0kc=;
 b=rb3U0C690n7vRSMJjjEENVTgex+KjmSzvFg3VJOwpOAggUCVwrfB7OgSsjes02CDxHm4Gb1cI
 QJsilRae41JBMdaRTqvvjJKOaCzwrBCod+C/EYk/zAfYcYUL5bMIdxk
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
	TAGGED_FROM(0.00)[bounces-52751-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 76C7F136EC3
X-Rspamd-Action: no action

Provide a common reference for the recommended recording area to use in
each of the binning modes.

No functional change intended in this commit.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 44 +++++++++++++++++---------------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 95f93ee0747f..32b8070756f0 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -175,7 +175,7 @@
 #define IMX283_XCLR_MIN_DELAY_US	(1 * USEC_PER_MSEC)
 #define IMX283_XCLR_DELAY_RANGE_US	(1 * USEC_PER_MSEC)
 
-/* IMX283 native and active pixel array size. */
+/* IMX283 crop regions and positions */
 static const struct v4l2_rect imx283_native_area = {
 	.top = 0,
 	.left = 0,
@@ -184,8 +184,16 @@ static const struct v4l2_rect imx283_native_area = {
 };
 
 static const struct v4l2_rect imx283_active_area = {
-	.top = 40,
-	.left = 108,
+	.top = 16,
+	.left = 96,
+	.width = 5496,
+	.height = 3694,
+};
+
+/* Datasheet recommended recording pixels */
+static const struct v4l2_rect imx283_recommended_area = {
+	.top = 16 + 12 + 12, /* Clamp, Ignored area, Color margin */
+	.left = 96 + 12, /* Horizontal black, Color margin */
 	.width = 5472,
 	.height = 3648,
 };
@@ -498,12 +506,8 @@ static const struct imx283_mode supported_modes_12bit[] = {
 		.default_vmax = 4000,
 
 		.min_shr = 11,
-		.crop = {
-			.top = 40,
-			.left = 108,
-			.width = 5472,
-			.height = 3648,
-		},
+
+		.crop = imx283_recommended_area,
 	},
 	{
 		/*
@@ -524,12 +528,7 @@ static const struct imx283_mode supported_modes_12bit[] = {
 
 		.min_shr = 12,
 
-		.crop = {
-			.top = 40,
-			.left = 108,
-			.width = 5472,
-			.height = 3648,
-		},
+		.crop = imx283_recommended_area,
 	},
 	{
 		/*
@@ -550,12 +549,7 @@ static const struct imx283_mode supported_modes_12bit[] = {
 
 		.min_shr = 16,
 
-		.crop = {
-			.top = 40,
-			.left = 108,
-			.width = 5472,
-			.height = 3648,
-		},
+		.crop = imx283_recommended_area,
 	},
 };
 
@@ -573,12 +567,8 @@ static const struct imx283_mode supported_modes_10bit[] = {
 		.default_vmax = 3840,
 
 		.min_shr = 10,
-		.crop = {
-			.top = 40,
-			.left = 108,
-			.width = 5472,
-			.height = 3648,
-		},
+
+		.crop = imx283_recommended_area,
 	},
 };
 

-- 
2.52.0


