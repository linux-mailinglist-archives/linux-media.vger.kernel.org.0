Return-Path: <linux-media+bounces-52812-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPxsLK1zkGn9ZwEAu9opvQ
	(envelope-from <linux-media+bounces-52812-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:07:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F713C105
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E59A305CE06
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 13:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F6130F549;
	Sat, 14 Feb 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t7zLrhI2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B829D30ACE6;
	Sat, 14 Feb 2026 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771074360; cv=none; b=f0LrY4oks1LQWK9Zckp1yfv+dKULxZc6fo2XntnWD4gDLdYcBwSpfv6eGswLV7u4o372NizbgIoInkfNpZE0r4I0amCRcn6RfOMEp+Lsw5ZQXhNnC5HJZaKw00VwcpMo4ljVa5vGWWRnyRP+jyjy/UH0OWFrjCe1T3UK+luqGK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771074360; c=relaxed/simple;
	bh=1bI32zm3Wuz81PE4dSrg/j+dht98RHbmddpIHH4Hlnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DO39WCA4qNOBsA9GLHzWBgaUXgmzfpCKWgYR23pPbn47gjJN3ey3fGQR9ivhCCPFYSoE+/l17wm/m5LmhVhRqZoDFfqQhewfaug25bHjNAgBwDK1bJvAdU3UWZ6Rt7SX/rKKd0jKJ2MRMi7gOYiuphzyDdh0dnU8E19PjNEFQUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t7zLrhI2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8F7D557;
	Sat, 14 Feb 2026 14:05:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771074308;
	bh=1bI32zm3Wuz81PE4dSrg/j+dht98RHbmddpIHH4Hlnk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t7zLrhI2bxolPEA9Ycz4btF5G38lWEn6YFifQad9QEck0v0DkDZZUsmYhqNhtWIMU
	 EfB49bn5RyBQVozXZMcGifXLwLgWq5zuEU9/BNHKvSXaOxjtWfmoHONYUD4ZDsI/hC
	 juEMTGPFJhLg8xqcOPIE44sv6HLXVotdwEXNqMhM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Sat, 14 Feb 2026 18:35:22 +0530
Subject: [PATCH v2 2/2] media: i2c: imx283: Fix hang when going from large
 to small resolution
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-imx283-hang-fix-v2-2-f4fd3de0f020@ideasonboard.com>
References: <20260214-imx283-hang-fix-v2-0-f4fd3de0f020@ideasonboard.com>
In-Reply-To: <20260214-imx283-hang-fix-v2-0-f4fd3de0f020@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3059;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=1bI32zm3Wuz81PE4dSrg/j+dht98RHbmddpIHH4Hlnk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpkHMjpIkzUOGT0RO4B4XLPadRh6OklvYO8EGON
 4uZxBtbC2CJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaZBzIwAKCRBD3pH5JJpx
 RcxtEACuyBK3Bs66l5wh9jubNR0KjGMm1Oq70uqrpdd+ghu5xZRGQIAb+2HxJVKzkhxAtgEiKAc
 2TXEeWKxfmOjrcRusA8AM92Puf1pI1FG72i34Oy98mIsZZYJC7LGc2ZJ/PmPfghrHSexps0z6HT
 cp7C65iwpPxfRH938TLpObYus4kgtKzYrwNODlcJMC4OyPBCgrc0gjWoMl8IqYgwJZnzLdVB5MK
 JtMGHJNxeTQyu4HegJQ6dSTJlE/kVXqSokDfC8PFRi88WZeay1sQEaDK63Q3ZQARUyOEfOKeGT0
 n+2etPJ3HkqGzNciSchf1cD90FvIkRq+qDroz5hDOTTnE+gKbrnOvVsbTPy5TdLbTC27mUc2bA9
 bYTPI6Ss9EgeEzt3PrYx+3cAEcnQsFX6ubJ8X95fPuY6T7tNGEiKm23R7bWgyIgOtWMZHEDYhp7
 v/V/mQ3DGTOaNMtsrW6UJnL0YlY6Le7Lc2ZaWnDH5FlYBlrB6CxnAl+/UULBv3ifbjk9VrlOln/
 NE0IGQ6QgLNpT1ejxEp3zACFQbzN+3TXi1lhUfUue/2AGJmMyH2uKyJv4Lk31kE73J3q18iLnWy
 HsdxTR8FE2S0gj+VkEpd2jOdS7/sXtvbFoG43ilopg6H1FBo2rDYY/MeH199xd4dAiYuCPOXME0
 mK4R+rnnAqbFhWg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52812-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 288F713C105
X-Rspamd-Action: no action

When switching between modes (e.g. full resolution to binned),
standby_cancel() previously cleared XMSTA (starting master mode data
output) before the new mode's MDSEL, crop, and timing registers were
programmed in start_streaming(). This caused the sensor to briefly
output MIPI data using the previous mode's configuration.

On receivers like imx-mipi-csis, this leads to FIFO overflow errors
when switching from a higher to a lower resolution, as the receiver is
configured for the new smaller frame size but receives stale
full-resolution data.

Fix this by moving the XMSTA and SYNCDRV register writes from
standby_cancel() to the end of start_streaming(), after all mode,
crop, and timing registers have been configured. Also explicitly stop
master mode (XMSTA=1) when stopping the stream, matching the pattern
used by other Sony sensor drivers (imx290, imx415).

Use named macros IMX283_XMSTA_START/STOP instead of raw 0/BIT(0) for
readability.

Cc: stable@vger.kernel.org
Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 9b3094a57873c6e8ff8c41d058ea3b0012642cac..1be6164c2d15524690b738aa725a6708e84487d0 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -129,7 +129,8 @@
 
 /* Master Mode Operation Control */
 #define IMX283_REG_XMSTA		CCI_REG8(0x3105)
-#define   IMX283_XMSTA			BIT(0)
+#define   IMX283_XMSTA_START		0
+#define   IMX283_XMSTA_STOP		BIT(0)
 
 #define IMX283_REG_SYNCDRV		CCI_REG8(0x3107)
 #define   IMX283_SYNCDRV_XHS_XVS	(0xa0 | 0x02)
@@ -1023,8 +1024,6 @@ static int imx283_standby_cancel(struct imx283 *imx283)
 	usleep_range(19000, 20000);
 
 	cci_write(imx283->cci, IMX283_REG_CLAMP, IMX283_CLPSQRST, &ret);
-	cci_write(imx283->cci, IMX283_REG_XMSTA, 0, &ret);
-	cci_write(imx283->cci, IMX283_REG_SYNCDRV, IMX283_SYNCDRV_XHS_XVS, &ret);
 
 	return ret;
 }
@@ -1117,6 +1116,10 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	/* Apply customized values from controls (HMAX/VMAX/SHR) */
 	ret =  __v4l2_ctrl_handler_setup(imx283->sd.ctrl_handler);
 
+	/* Start master mode */
+	cci_write(imx283->cci, IMX283_REG_XMSTA, IMX283_XMSTA_START, &ret);
+	cci_write(imx283->cci, IMX283_REG_SYNCDRV, IMX283_SYNCDRV_XHS_XVS, &ret);
+
 	return ret;
 }
 
@@ -1153,12 +1156,14 @@ static int imx283_disable_streams(struct v4l2_subdev *sd,
 				  u64 streams_mask)
 {
 	struct imx283 *imx283 = to_imx283(sd);
-	int ret;
+	int ret = 0;
 
 	if (pad != IMAGE_PAD)
 		return -EINVAL;
 
-	ret = cci_write(imx283->cci, IMX283_REG_STANDBY, IMX283_STANDBY, NULL);
+	cci_write(imx283->cci, IMX283_REG_XMSTA, IMX283_XMSTA_STOP, &ret);
+	cci_write(imx283->cci, IMX283_REG_STANDBY, IMX283_STANDBY, &ret);
+
 	if (ret)
 		dev_err(imx283->dev, "Failed to stop stream\n");
 

-- 
2.53.0


