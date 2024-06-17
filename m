Return-Path: <linux-media+bounces-13464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B0290B5E4
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC2951C23147
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126CF1D9535;
	Mon, 17 Jun 2024 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iCPYs0k4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDDBF9C9;
	Mon, 17 Jun 2024 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640734; cv=none; b=Dz5h0N2njWA0Vejm3jOufWwbig/djuoyQefCjHnmG7pd4qdikL61Ra6Cty7cE4jsRosFW3dssbDBYZgdzw6CZBWQ2JzlwAiF768at86L6JDGuA6iOv1ktZFh8YsZVjnljFXXJFQ25j9v2Ne851QvJR3/siX4OLi4AKkX1crFIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640734; c=relaxed/simple;
	bh=MSJvGXgpeAo/+stD4MMuQIkccV8UmUIpqlmNpgDh9K0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BJ6p+rLT0yDIwKJXRaZNKAgjcSXvcXd0XW87Qs02ZylgDr05bTUQa+XpRsoAeq3Y2xtNBLYa4s+7f3Ctuw3KwsHp5Oec+DULQbx59K4GKS0tSZF7BVQTt0RUkg0iT9NMhivXzwW1r8ip31n+fkNVSBSH8b6Fu34LDbD6Scg/A38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iCPYs0k4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61B0FFEF;
	Mon, 17 Jun 2024 18:11:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718640704;
	bh=MSJvGXgpeAo/+stD4MMuQIkccV8UmUIpqlmNpgDh9K0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCPYs0k4FqbSV+4y3+sH6cQpjtVqdxmYED02LrFWWdUFSDXYtJMtVwGRATXSjbAxC
	 tFep07iYl8LrlamWPbce+R4EHrFhZ4TK4ibdALPxuB06ffasQjffhfcaph6WnmflCe
	 be8DAgXsIxpwj60QNurhvBq5ZD9lwwpTjuGTHcy0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 06/11] media: adv748x-afe: Use 1X16 media bus code
Date: Mon, 17 Jun 2024 18:11:29 +0200
Message-ID: <20240617161135.130719-7-jacopo.mondi@ideasonboard.com>
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

Now that the adv748x CSI-2 transmitter driver validates the supported
formats, it is required for subdevices along the pipeline to produce
and consume the same media bus codes.

The adv748x analog front end driver use the 2X8 variant of the UYVY8
media bus code, while the CSI-2 transmitter use the 1X16 variant, which
is the correct one to use for the serial bus.

Make the adv748x afe use the 1X16 format variant to maintain the
pipeline validation correct.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
2.45.2


