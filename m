Return-Path: <linux-media+bounces-10697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A89E88BB05D
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 17:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6ACFB22118
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 15:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D2E155332;
	Fri,  3 May 2024 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="paMS8LEE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0ED15531C;
	Fri,  3 May 2024 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714751521; cv=none; b=nAfr2/o9sDIqtWFOYPhNksLb3XtNqtZiFTgd2Wc6JvgAOtJHODBQs00EEjsWd53jirydVBUvUtNjVrW2dssLYMIy2uKFhivpCcEIuCbaSqVhT3QnGLAbv38//IkhlW1OS0LN+5F/wCkXPSxyOVKLUzoBAnSr63KjrLhIrD0OoXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714751521; c=relaxed/simple;
	bh=Gz0M0nqu3yOklZsJk36xaRu/xXa/Ykg3VGSD0UemLes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4QB6AJ+qyMSKLcMAwEguCrVoaIwn0Qwd+4Hm7IXeSQoMM6LeAobBhDW24fvzdrsGVUBx4ruPB9faJFophmJYyZ2+ge5wb4B+spODaeDBnElvqSvPZDuO/787Qpj7adbRXPX4iHCqfydmV/LpclyBrePjjHyW8WmKplLG4Q0PJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=paMS8LEE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 485162B62;
	Fri,  3 May 2024 17:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714751452;
	bh=Gz0M0nqu3yOklZsJk36xaRu/xXa/Ykg3VGSD0UemLes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=paMS8LEEZTCgCa8YIFgEC99l9AiDXIeWl2Q6GRXrMOxhQ7NDA6SpdKPw5N/yw2+Fz
	 fjTxIPxa+m3kNTNubxMzzDGky4XNkO40ddSBfBo0SNAGT8NdOocoXZG2feJRe7jOWj
	 0OZ8oY+JDF9/AoYfryAt/zwDZWW76HVzMA5yLnko=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 07/11] media: adv748x-csi2: Validate the image format
Date: Fri,  3 May 2024 17:51:22 +0200
Message-ID: <20240503155127.105235-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adv748x-csi2 driver configures the CSI-2 transmitter to
automatically infer the image stream format from the connected
frontend (HDMI or AFE).

Setting a new format on the subdevice hence does not actually control
the CSI-2 output format, but it's only there for the purpose of
pipeline validation.

However, there is currently no validation that the supplied media bus
code is valid and supported by the device.

With the introduction of enum_mbus_codes a list of supported format is
now available, use it to validate that the supplied format is correct
and use the default YUYV8 one if that's not the case.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 27 +++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 219417b319a6..1aae6467ca62 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -215,6 +215,23 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx,
+					 unsigned int code)
+{
+	const unsigned int *codes = is_txa(tx) ?
+				    adv748x_csi2_txa_fmts :
+				    adv748x_csi2_txb_fmts;
+	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
+				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
+
+	for (unsigned int i = 0; i < num_fmts; i++) {
+		if (codes[i] == code)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
@@ -222,7 +239,15 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
 	struct adv748x_state *state = tx->state;
 	struct v4l2_mbus_framefmt *mbusformat;
-	int ret = 0;
+	int ret;
+
+	/*
+	 * Make sure the format is supported, if not default it to
+	 * YUYV8 as it's supported by both TXes.
+	 */
+	ret = adv748x_csi2_is_fmt_supported(tx, sdformat->format.code);
+	if (ret)
+		sdformat->format.code = MEDIA_BUS_FMT_YUYV8_1X16;
 
 	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
 						 sdformat->which);
-- 
2.44.0


