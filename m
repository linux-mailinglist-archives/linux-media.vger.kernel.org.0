Return-Path: <linux-media+bounces-52764-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IJ/Ag8xj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52764-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:11:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C33136F51
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FBFB31C7039
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABB43644D2;
	Fri, 13 Feb 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FyNTlQrl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4B364EA1;
	Fri, 13 Feb 2026 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991373; cv=none; b=uVz2n5dCiwFyIyMxLccoO+ezc15UPLV1CJD4Qx7/rnuGylMZsscm1c/yiR394+TaQj1IyEc4LaN+Y1YDKkSlSsHBgrjGNz8wFJr2NIFUrM4lyMETyGIbnRmCBM7ceH2tzlhfODK3EmLdb3oR+BlObZgbIthzSfBzxLX8uhtxnRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991373; c=relaxed/simple;
	bh=IlOKgiURXew91kVX0/CTX4xZDsCiJBqNvhyK9bk4hDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjhV6jD+LykzGWNRdxz8hyecRJ/4yYTQuGJs9NwugjsF8YXOTW9fNHHeDHfMD6NnVD/zgECk+b3xg6O3eR//shyo4tF7nTCPXyGbmMwU/Vxz4AXYcHxsqSC3vsTca4FrDaKVwFUFlrHozytPPajavRQ01XZIu/3wZ3gj/IjXWnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FyNTlQrl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F7BECF5;
	Fri, 13 Feb 2026 15:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991285;
	bh=IlOKgiURXew91kVX0/CTX4xZDsCiJBqNvhyK9bk4hDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FyNTlQrl4udUx/A/a9SrluVvS5wzFR+e47hsWYGRpaJh5ohnfdmUo2Kjv70aLfnin
	 O58itpIlawA8IXRmfTqfzUVbQBoJ5amiCqVz5abMDDmORUNaWaJi+qKZaBKbt51+5R
	 nFw+5s9byNAk9ro9qKwA7DijBY1pm4B89raG+ITw=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:02:02 +0000
Subject: [PATCH v2 23/25] media: i2c: imx283: Fix binned mode blanking
 timings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-23-be40a3770ebf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=4685;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=IlOKgiURXew91kVX0/CTX4xZDsCiJBqNvhyK9bk4hDw=;
 b=AOmPX89eV6UX9s0uRju1KLoauw3W/h4G34ZldWUyMuKEkv4dzZ7ZDXiKDn7NEZz5EpWD2j14K
 uwNUKhWy5U2A6j+0ssKmq5FxQNHOkmRnL2KBtRdBJwX8fuggncNMj0R
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
	TAGGED_FROM(0.00)[bounces-52764-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 81C33136F51
X-Rspamd-Action: no action

The IMX283 supports binning modes which combine multiple measured pixels
into a single output pixel.

The minimum timings for this must account for the operations on all
measured pixels, not the output pixel sizes.

Determine and calculate all hmax and vmax values in respect of the
HBLANK and VBLANK controls against the native resolution of the mode as
specified in the mode crop rectangle as opposed to the output mode width
and height.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 7fb654512c20..25e669370751 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -875,7 +875,7 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 		/* Honour the VBLANK limits when setting exposure. */
 		s64 current_exposure, max_exposure, min_exposure;
 
-		imx283->vmax = mode->height + ctrl->val;
+		imx283->vmax = mode->crop.height + ctrl->val;
 
 		imx283_exposure_limits(imx283, mode,
 				       &min_exposure, &max_exposure);
@@ -905,7 +905,7 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	case V4L2_CID_HBLANK:
 		pixel_rate = imx283_pixel_rate(imx283, mode);
-		imx283->hmax = imx283_internal_clock(pixel_rate, mode->width + ctrl->val);
+		imx283->hmax = imx283_internal_clock(pixel_rate, mode->crop.width + ctrl->val);
 		dev_dbg(imx283->dev, "V4L2_CID_HBLANK : %d  HMAX : %u\n",
 			ctrl->val, imx283->hmax);
 		ret = cci_write(imx283->cci, IMX283_REG_HMAX, imx283->hmax, NULL);
@@ -917,7 +917,7 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_VBLANK:
-		imx283->vmax = mode->height + ctrl->val;
+		imx283->vmax = mode->crop.height + ctrl->val;
 		dev_dbg(imx283->dev, "V4L2_CID_VBLANK : %d  VMAX : %u\n",
 			ctrl->val, imx283->vmax);
 		ret = cci_write(imx283->cci, IMX283_REG_VMAX, imx283->vmax, NULL);
@@ -1042,6 +1042,9 @@ static void imx283_set_framing_limits(struct imx283 *imx283,
 	u64 pixel_rate = imx283_pixel_rate(imx283, mode);
 	u64 min_hblank, max_hblank, def_hblank;
 
+	/* Use crop for timings from native sensor units */
+	const struct v4l2_rect *crop = &mode->crop;
+
 	/* Initialise hmax and vmax for exposure calculations */
 	imx283->hmax = imx283_internal_clock(pixel_rate, mode->default_hmax);
 	imx283->vmax = mode->default_vmax;
@@ -1050,18 +1053,18 @@ static void imx283_set_framing_limits(struct imx283 *imx283,
 	 * Horizontal Blanking
 	 * Convert the HMAX_MAX (72MHz) to Pixel rate values for HBLANK_MAX
 	 */
-	min_hblank = mode->min_hmax - mode->width;
-	max_hblank = imx283_iclk_to_pix(pixel_rate, IMX283_HMAX_MAX) - mode->width;
-	def_hblank = mode->default_hmax - mode->width;
+	min_hblank = mode->min_hmax - crop->width;
+	max_hblank = imx283_iclk_to_pix(pixel_rate, IMX283_HMAX_MAX) - crop->width;
+	def_hblank = mode->default_hmax - crop->width;
 	__v4l2_ctrl_modify_range(imx283->hblank, min_hblank, max_hblank, 1,
 				 def_hblank);
 	__v4l2_ctrl_s_ctrl(imx283->hblank, def_hblank);
 
 	/* Vertical Blanking */
-	__v4l2_ctrl_modify_range(imx283->vblank, mode->min_vmax - mode->height,
-				 IMX283_VMAX_MAX - mode->height, 1,
+	__v4l2_ctrl_modify_range(imx283->vblank, mode->min_vmax - crop->height,
+				 IMX283_VMAX_MAX - crop->height, 1,
 				 mode->default_vmax - mode->height);
-	__v4l2_ctrl_s_ctrl(imx283->vblank, mode->default_vmax - mode->height);
+	__v4l2_ctrl_s_ctrl(imx283->vblank, mode->default_vmax - crop->height);
 }
 
 static int imx283_set_pad_format(struct v4l2_subdev *sd,
@@ -1509,13 +1512,13 @@ static int imx283_init_controls(struct imx283 *imx283)
 	/* Initialise vblank/hblank/exposure based on the current mode. */
 	imx283->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx283_ctrl_ops,
 					   V4L2_CID_VBLANK,
-					   mode->min_vmax - mode->height,
+					   mode->min_vmax - mode->crop.height,
 					   IMX283_VMAX_MAX, 1,
-					   mode->default_vmax - mode->height);
+					   mode->default_vmax - mode->crop.height);
 
-	min_hblank = mode->min_hmax - mode->width;
-	max_hblank = imx283_iclk_to_pix(pixel_rate, IMX283_HMAX_MAX) - mode->width;
-	def_hblank = mode->default_hmax - mode->width;
+	min_hblank = mode->min_hmax - mode->crop.width;
+	max_hblank = imx283_iclk_to_pix(pixel_rate, IMX283_HMAX_MAX) - mode->crop.width;
+	def_hblank = mode->default_hmax - mode->crop.width;
 	imx283->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx283_ctrl_ops,
 					   V4L2_CID_HBLANK, min_hblank, max_hblank,
 					   1, def_hblank);

-- 
2.52.0


