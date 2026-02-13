Return-Path: <linux-media+bounces-52743-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILr4J2Mvj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52743-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:04:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2460E136DEF
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D127530D4EC2
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078FA35EDDF;
	Fri, 13 Feb 2026 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B4xy1JG6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4150736165A;
	Fri, 13 Feb 2026 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991332; cv=none; b=nGiVBBR69+0tZ1SfBfvnCPe2rHLTIlVjML2FTNoC6BPMc4lkf5bl0+kj0bfv+37O2+nY4HpONTRYuXshW2TWbXc4kvlhiyPtp6gV4azdvJAP82pCmIzVWk3In/LNKUeInMMHKclT5FHANbcHkEqCnGg3GgUE0auPPGxiRzKltEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991332; c=relaxed/simple;
	bh=NTgQ/2rHGAkPHH2Uu+x00zM1XvwISbGU3Lf7Bopj7uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pzr3Y4M7qEYvPmW2vngCBxFuY/03ZsF/znyBx/xwVAVQFb0gXV5khCytpM4DD+SmMV3ZqqOT+X4ZCZwMO1NW9NV8bwDqc44QRfW2Tfsq0t3HRkSSFy+Ma3/aItGGZ/Z2TG5zZodx283mRNYLjKzqNoBdG9PKkBV4iCU1R2XWkLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B4xy1JG6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAE0CDDE;
	Fri, 13 Feb 2026 15:01:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991277;
	bh=NTgQ/2rHGAkPHH2Uu+x00zM1XvwISbGU3Lf7Bopj7uk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B4xy1JG6+D0tWwIUlgmbnKlfNQcEIspsOE2FCsdNwf9kNFGeG7rz0/1qPDKOZkKr9
	 CQqh1JWJYTPELpxYUzGICr2FRtYfnChS23sG5RBWk5Hvhs9W+WdpGuy13g3XgH+SW/
	 Fhp78L6F56bv24tErAHGgd2CxKgnWPliuAc65v6k=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:41 +0000
Subject: [PATCH v2 02/25] media: i2c: imx283: Fix handling of unsupported
 mbus codes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-2-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
In-Reply-To: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Stefan Klug <stefan.klug@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=2730;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=LXvzP9NDUjaZdrRJSZzGi0gFzLYd6GS/gd80rfLdYBU=;
 b=eeGD/3lYfBUV3moy9r8cJaTHZ/gtLIdRP5H8tmDP96RHYa/YlS9dDPn2sEU0FMSuLR9J9TCyy
 SMLNZmT4POtApeykPJJzK6uSvEMjgB2EikDdBYtjrolaoc6KFlmuElA
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
	TAGGED_FROM(0.00)[bounces-52743-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2460E136DEF
X-Rspamd-Action: no action

From: Stefan Klug <stefan.klug@ideasonboard.com>

When the code requested by imx283_set_pad_format() is not supported, a
kernel exception occurs due to dereferencing the mode variable which is
null. Fix that by correcting the code to a valid value before getting
the mode table.

While at it, remove the cases for the other unsupported codes in
get_mode_table.

Cc: stable@vger.kernel.org # v6.10-rc1-70-gccb4eb4496fa
Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index e5c04d259625..9a47cd0b181a 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -576,23 +576,31 @@ static inline struct imx283 *to_imx283(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct imx283, sd);
 }
 
+static inline int get_format_code(unsigned int code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx283_mbus_codes); i++)
+		if (imx283_mbus_codes[i] == code)
+			break;
+
+	if (i >= ARRAY_SIZE(imx283_mbus_codes))
+		i = 0;
+
+	return imx283_mbus_codes[i];
+}
+
 static inline void get_mode_table(unsigned int code,
 				  const struct imx283_mode **mode_list,
 				  unsigned int *num_modes)
 {
 	switch (code) {
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
-	case MEDIA_BUS_FMT_SGRBG12_1X12:
-	case MEDIA_BUS_FMT_SGBRG12_1X12:
-	case MEDIA_BUS_FMT_SBGGR12_1X12:
 		*mode_list = supported_modes_12bit;
 		*num_modes = ARRAY_SIZE(supported_modes_12bit);
 		break;
 
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
-	case MEDIA_BUS_FMT_SGRBG10_1X10:
-	case MEDIA_BUS_FMT_SGBRG10_1X10:
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
 		*mode_list = supported_modes_10bit;
 		*num_modes = ARRAY_SIZE(supported_modes_10bit);
 		break;
@@ -963,6 +971,8 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx283_mode *mode_list;
 	unsigned int num_modes;
 
+	fmt->format.code = get_format_code(fmt->format.code);
+
 	get_mode_table(fmt->format.code, &mode_list, &num_modes);
 
 	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
@@ -1361,8 +1371,6 @@ static int imx283_init_controls(struct imx283 *imx283)
 
 	imx283->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx283_ctrl_ops, V4L2_CID_VFLIP,
 					  0, 1, 1, 0);
-	if (imx283->vflip)
-		imx283->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx283_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,

-- 
2.52.0


