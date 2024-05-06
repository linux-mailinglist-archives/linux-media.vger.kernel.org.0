Return-Path: <linux-media+bounces-10906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A62C8BD31D
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE6141F24E97
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E9D15746D;
	Mon,  6 May 2024 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I46fYQXm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747C8156C5F;
	Mon,  6 May 2024 16:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014209; cv=none; b=S7wyAiKtUWG5eIvceH83KD/NffG33znU5W1QufhdVZ2sWTOKi3Rh1Y+HBE2yeJkk6zhzUIFtmjCOfp/ngXR7kYVHl0elZODRWArAnW9S2RmYIV0OcjMF6wpsJRMvN/zbMYPYqsIvl7smUCHqF5K+EYCvUiybEMAR8UjCkX+2h4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014209; c=relaxed/simple;
	bh=0/z5SxwJPXSOwBAyqMzAFVREUIXkewRlIaRZxX2+VDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWqqUnaPrnun+cCqoSYQHFfkC/UKUXcM7xVX8ErLx/xz/MREzqtCmaoecF5eqePODmCw4nnVsGnYB2N8SFfpo/IelAv/9c4TsZgVB4DIUgwVUVKbqhNRfeBDy1AE91NCyLVfWdqGnsAFUxa0dahk2age6O+qLm3nZ+A8Wpva7P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I46fYQXm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 603EC13E5;
	Mon,  6 May 2024 18:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715014197;
	bh=0/z5SxwJPXSOwBAyqMzAFVREUIXkewRlIaRZxX2+VDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I46fYQXmTn4Z3UKFqvQuHC7hB//G1aDS4K7j+XW5sswfos8LsJeQXVKUPD4xsICzr
	 CyIyhqXibH/oI9c3DQFUWG8/MsQACDS65f5nGUXzcWqloFzV8wNnKu9X2hwLB2kEWZ
	 sQXFUvBN6WqAGMUDnX3B84GeWuo83eCKrCyQv5Hk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/11] media: adv748x-csi2: Validate the image format
Date: Mon,  6 May 2024 18:49:34 +0200
Message-ID: <20240506164941.110389-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
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
and use the default UYVY8 one if that's not the case.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 4fd6d3a681d5..3f22dc426d7a 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -208,6 +208,23 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static bool adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx,
+					  unsigned int code)
+{
+	const unsigned int *codes = is_txa(tx) ?
+				    adv748x_csi2_txa_fmts :
+				    adv748x_csi2_txb_fmts;
+	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
+				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
+
+	for (unsigned int i = 0; i < num_fmts; i++) {
+		if (codes[i] == code)
+			return true;
+	}
+
+	return false;
+}
+
 static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
@@ -217,6 +234,13 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mbusformat;
 	int ret = 0;
 
+	/*
+	 * Make sure the format is supported, if not default it to
+	 * UYVY8 as it's supported by both TXes.
+	 */
+	if (!adv748x_csi2_is_fmt_supported(tx, sdformat->format.code))
+		sdformat->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
+
 	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
 						 sdformat->which);
 	if (!mbusformat)
-- 
2.44.0


