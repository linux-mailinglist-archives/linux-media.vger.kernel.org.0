Return-Path: <linux-media+bounces-10908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48B8BD321
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 508DAB22FA6
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A35B156F38;
	Mon,  6 May 2024 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lT5Umlw4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF9E156C62;
	Mon,  6 May 2024 16:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014212; cv=none; b=nOFHINRlxcEcT/pg53e/bypxXC6HbsvE4S6ijgZ8gCDDMl0Ta0rfxoAKPGxhOetg5a3MTkLisjHiWvQ1uNB0/GaTciinKxj66w8Wgq397GjsuY8xWWKtDKixKzV8jWozUvO22cdWGXQu6xCtuJDb9xVX6ttg0NHoC6LxMsFH01k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014212; c=relaxed/simple;
	bh=izib+hjshFbF9rI9xwqzWGxD8CCtnJhVcbWu+gHvO0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LB35q8/dgOxBuPwbgHaWpupEQzJsP5W+iIZw9RX+lQ52DvF3n1d6zcbAonnoZKVfD1TX3o4Re9mezs7spvq+pvysxzLkxEcJOW4uqq5AQQPxhd4n/yWpfbMBrR6tJT0/LybYX9gemwKf/8+h9/5v+EqOuc4hlWRfIMBYWcVKysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lT5Umlw4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D36316C3;
	Mon,  6 May 2024 18:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715014198;
	bh=izib+hjshFbF9rI9xwqzWGxD8CCtnJhVcbWu+gHvO0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lT5Umlw4Ap8rxsDVNqW6K9axpGstKBvOZZG2K/xXQE4SMDND78pxz10CgEhlAEvA4
	 RXD7/zTKn7FD7OdsyX5vTr9ZL1IpyRRiJ/ysc/qosHMc1S+/SrbxHH5Zrl8cLJcLEM
	 +7rS3uPT7uJlodLUH4YGPFauxVRj+tdKB6wKkA/4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 08/11] media: adv748x-afe: Use 1X16 media bus code
Date: Mon,  6 May 2024 18:49:36 +0200
Message-ID: <20240506164941.110389-9-jacopo.mondi@ideasonboard.com>
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

Now that the adv748x CSI-2 transmitter drivers validate the supported
formats, it is required for subdevices along the pipeline to produce
and consume the same media bus codes.

The adv748x analog front end driver use the 2X8 variant of the UYVY8
media bus code, while the CSI-2 transmitter use the 1X16 variant, which
is the correct one to use for the serial bus.

Make the adv748x afe use the 1X16 format variant to maintain the
pipeline validation correct.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-afe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index 50d9fbadbe38..5edb3295dc58 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -114,7 +114,7 @@ static void adv748x_afe_fill_format(struct adv748x_afe *afe,
 {
 	memset(fmt, 0, sizeof(*fmt));
 
-	fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
+	fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
 	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
 	fmt->field = V4L2_FIELD_ALTERNATE;
 
@@ -337,7 +337,7 @@ static int adv748x_afe_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index != 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
+	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
 	return 0;
 }
-- 
2.44.0


