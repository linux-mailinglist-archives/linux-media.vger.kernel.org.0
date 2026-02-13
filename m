Return-Path: <linux-media+bounces-52744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIwPE2gvj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:04:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEF9136DFD
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 202C730D72A6
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5AC35FF49;
	Fri, 13 Feb 2026 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u5QbiwFH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4982436165E;
	Fri, 13 Feb 2026 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991332; cv=none; b=FzyA/vCSMv3SdLdWKebAs3ZJRXPOYTS17PJsQXrhHGW8E0XHuBjacCq4jNrIstFdHJRzEjV69DEr9VLFCTV6m1841t3FToghhwBSy52j8VlW8su0SHBg3KWeXIlA78ujZ4LD5s9fYL37j7LXvbvShzxjxUlAyyKg+wBcTp5PNTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991332; c=relaxed/simple;
	bh=F4uVtfvNBktKfqDGbg5M69Sf5liv6m8cJ/tSteIi9ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPLo16eHnwexo+MKdwMZcwxI0EVG3+FMXBVpl+j8zvYjdYLpmER9MmBngD/iTwpTNJ8joNRzGVGob2yvgMiwFWhDIeK9ZDUbAyMJEj7PXpO6bbQjgXCSsrksiLncuBQxvBkuWqY4D15CsYgHYyU3n7AwJrGpJ0V/KUXAtA8hliI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u5QbiwFH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19F76180F;
	Fri, 13 Feb 2026 15:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991278;
	bh=F4uVtfvNBktKfqDGbg5M69Sf5liv6m8cJ/tSteIi9ZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u5QbiwFH6rEEqU/QOh4AaiTftX/CxdrtOZTthbm007eQnLnGB9jcVbXa3BCOAjnFu
	 0D8B+ZMO7r0Rnjq5FSqtuhqI2YUf3jLWrPhpx5djgt6R00YJBC3xdg9dFcMqT46lvK
	 BDXVi3rH2Hm2HZiWFxOeqb5mdCu/X06wNiO4RZ3U=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:42 +0000
Subject: [PATCH v2 03/25] media: i2c: imx283: Move imx283_mode structure
 definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-3-be40a3770ebf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=3614;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=F4uVtfvNBktKfqDGbg5M69Sf5liv6m8cJ/tSteIi9ZE=;
 b=M7R7ZG5b1HwRG1d7TYIhc8EIOlnXkkkKdRFjEWYgVam8gKEUgzZfILyBsraRJSnIa+Y3BbQ4v
 eYCdEjPkiOiDlcGBPaz1XdOkHlEDFKEycNK4/Je8pkR/Sn9p0y1GqT6
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
	TAGGED_FROM(0.00)[bounces-52744-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: DDEF9136DFD
X-Rspamd-Action: no action

Move the struct imx283_mode further down in the compilation unit so that
it can make reference of the scan out mode structures which are
presently defined after.

No functional change intended in this commit.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 118 ++++++++++++++++++++++-----------------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 9a47cd0b181a..d53cea49baae 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -195,65 +195,6 @@ struct imx283_reg_list {
 	const struct cci_reg_sequence *regs;
 };
 
-/* Mode : resolution and related config values */
-struct imx283_mode {
-	unsigned int mode;
-
-	/* Bits per pixel */
-	unsigned int bpp;
-
-	/* Frame width */
-	unsigned int width;
-
-	/* Frame height */
-	unsigned int height;
-
-	/*
-	 * Minimum horizontal timing in pixel-units
-	 *
-	 * Note that HMAX is written in 72MHz units, and the datasheet assumes a
-	 * 720MHz link frequency. Convert datasheet values with the following:
-	 *
-	 * For 12 bpp modes (480Mbps) convert with:
-	 *   hmax = [hmax in 72MHz units] * 480 / 72
-	 *
-	 * For 10 bpp modes (576Mbps) convert with:
-	 *   hmax = [hmax in 72MHz units] * 576 / 72
-	 */
-	u32 min_hmax;
-
-	/* minimum V-timing in lines */
-	u32 min_vmax;
-
-	/* default H-timing */
-	u32 default_hmax;
-
-	/* default V-timing */
-	u32 default_vmax;
-
-	/* minimum SHR */
-	u32 min_shr;
-
-	/*
-	 * Per-mode vertical crop constants used to calculate values
-	 * of IMX283REG_WIDCUT and IMX283_REG_VWINPOS.
-	 */
-	u32 veff;
-	u32 vst;
-	u32 vct;
-
-	/* Horizontal and vertical binning ratio */
-	u8 hbin_ratio;
-	u8 vbin_ratio;
-
-	/* Optical Blanking */
-	u32 horizontal_ob;
-	u32 vertical_ob;
-
-	/* Analog crop rectangle. */
-	struct v4l2_rect crop;
-};
-
 struct imx283_input_frequency {
 	unsigned int mhz;
 	unsigned int reg_count;
@@ -352,6 +293,65 @@ static const struct imx283_readout_mode imx283_readout_modes[] = {
 	 */
 };
 
+/* Mode : resolution and related config values */
+struct imx283_mode {
+	unsigned int mode;
+
+	/* Bits per pixel */
+	unsigned int bpp;
+
+	/* Frame width */
+	unsigned int width;
+
+	/* Frame height */
+	unsigned int height;
+
+	/*
+	 * Minimum horizontal timing in pixel-units
+	 *
+	 * Note that HMAX is written in 72MHz units, and the datasheet assumes a
+	 * 720MHz link frequency. Convert datasheet values with the following:
+	 *
+	 * For 12 bpp modes (480Mbps) convert with:
+	 *   hmax = [hmax in 72MHz units] * 480 / 72
+	 *
+	 * For 10 bpp modes (576Mbps) convert with:
+	 *   hmax = [hmax in 72MHz units] * 576 / 72
+	 */
+	u32 min_hmax;
+
+	/* minimum V-timing in lines */
+	u32 min_vmax;
+
+	/* default H-timing */
+	u32 default_hmax;
+
+	/* default V-timing */
+	u32 default_vmax;
+
+	/* minimum SHR */
+	u32 min_shr;
+
+	/*
+	 * Per-mode vertical crop constants used to calculate values
+	 * of IMX283REG_WIDCUT and IMX283_REG_VWINPOS.
+	 */
+	u32 veff;
+	u32 vst;
+	u32 vct;
+
+	/* Horizontal and vertical binning ratio */
+	u8 hbin_ratio;
+	u8 vbin_ratio;
+
+	/* Optical Blanking */
+	u32 horizontal_ob;
+	u32 vertical_ob;
+
+	/* Analog crop rectangle. */
+	struct v4l2_rect crop;
+};
+
 static const struct cci_reg_sequence mipi_data_rate_1440Mbps[] = {
 	/* The default register settings provide the 1440Mbps rate */
 	{ CCI_REG8(0x36c5), 0x00 }, /* Undocumented */

-- 
2.52.0


