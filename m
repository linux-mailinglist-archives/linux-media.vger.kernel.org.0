Return-Path: <linux-media+bounces-11226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ED78C1287
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 018901C21E3E
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 16:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953A0170821;
	Thu,  9 May 2024 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="et8DT+tt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D4216F8E0;
	Thu,  9 May 2024 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715271272; cv=none; b=CKLqgVrSiEF1LiE0nSDPNnT3aRBI6LmHxI19M+75J30mJuLPCj+3ZhLTlPV6xFR/gumjSlru96bWOIlxZr9JRyYpwraF2lZ6owpvKuutWMjpL/2cvwI2E7dlGBNVR1GRU9iu72gy9iAqT2KAmQMcViw3/qcf7GqUvPCakcYzcQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715271272; c=relaxed/simple;
	bh=pkYI8S00f4056qthXlLs54+AKAtyrd61xNdenH6dBHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckk4liZnb8Mpzi4FWbvNmZ+mukV2oKE50HftLFYmLDDoULpb/EUMN3v3jAI5i5ZstPK0cNM045RCndf9CHEO9mb01aVeZrM7IZYproz26kQYZ2BB47buIIKUxtP9YZnbJANJxseYQXflW1Pw8qmBmr2A1kM3eDvltYVUvIdyPmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=et8DT+tt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D25CD2F9A;
	Thu,  9 May 2024 18:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715271258;
	bh=pkYI8S00f4056qthXlLs54+AKAtyrd61xNdenH6dBHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=et8DT+ttzb2Mj2LByvhiHiwnAq4snSIGYDuXs8qUFphYU+5krBBjuw7dIQWBc/AEa
	 sWZdufXcks33gSR8GCHDaavaFJXz+5H5GrtkXsTsVoZ/e7st6xaJzMapXH/xCF4ANT
	 neI9936vrOyXSFQxAI9aYIFRdf6AOuvstBe21E10=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 06/11] media: adv748x-csi2: Validate the image format
Date: Thu,  9 May 2024 18:13:56 +0200
Message-ID: <20240509161403.111789-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 29b18b6c8b0e..0cdb397d9e0a 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -218,6 +218,22 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
 	return 0;
 }

+static bool adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx, u32 code)
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
@@ -227,6 +243,13 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
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


