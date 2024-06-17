Return-Path: <linux-media+bounces-13465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 983A590B5E6
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15374283C1A
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52A7E542;
	Mon, 17 Jun 2024 16:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h2NwNP6J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85070FBFC;
	Mon, 17 Jun 2024 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640737; cv=none; b=oGoANd+VYEE//HMzc58r0eypp4oDS/z5VK6NltFOA7bpMRBYVG8h/fVFn7/VmdXIY894CkRLja1BMC8no4xH3kbp+83hacDIPTEGZakquvNxZuGnTBsaY6o7rIo8DIOIGD1DxcbuW2EOSOolsafhrwQRmJPBGtoTgCtFTZRR9qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640737; c=relaxed/simple;
	bh=weu9PbG2UjYwSHmTVmgZ81Px4WAEi/QlfyQ+ZT6vp9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lPUgNcsWtSbzR5m6shsOKZl3oVyGwftPY6+SAR5gLhVUAk+H4Jup92ZPUAn+uGoOrFZ6fDbLgMolN95F5TzSAfUAnnYZE6M8lIH8yd4Ddr3jkIIrb5bgIoTGO6X9x7CYbXz7xuvtnwuj/0L0JEFVCuBBOHOTh4N4Swxk8IC5MSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h2NwNP6J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09B40FF1;
	Mon, 17 Jun 2024 18:11:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718640705;
	bh=weu9PbG2UjYwSHmTVmgZ81Px4WAEi/QlfyQ+ZT6vp9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h2NwNP6Jn3rTVIhK6g8r6Y2FGb9+YLQ9oAsa6f5VE6frySgXuuP10jWxDV5JMq3sw
	 kRgHo9QeekIM/t3K5gFXNB6+ZfriCIXnfTBZ51YDdI4vUsOrNbdoSPnm1jmvvgXqgB
	 1E1pil3HeXsWufYWbLivTR6mu3YNRBtqmWFrE78U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 07/11] media: adv748x-csi2: Validate the image format
Date: Mon, 17 Jun 2024 18:11:30 +0200
Message-ID: <20240617161135.130719-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
References: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
2.45.2


