Return-Path: <linux-media+bounces-11228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F748C128B
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8EC21F224B3
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 16:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B26817082B;
	Thu,  9 May 2024 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YRbRXUNO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954BF16F8F4;
	Thu,  9 May 2024 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715271275; cv=none; b=F8P52YO6jSAUxcgg/Q9ICbtiQV82ppYjc66PDoVUf5p/YNdUwZLUz9bwt2rWlCZmZQLuqg8lda7j6kMFCs6rJPdQFOMosxR2f51SlALeiBnQNQlC0IAdfoFRPLQ/xCgJLohsM7rNDSIpvAijdaFcsk2o3mbVKjIWkNoVTKUoJVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715271275; c=relaxed/simple;
	bh=niqACMJUDQvX7bsbOCCveCvUwGDJ1tge5Qhp0HHDv6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZcM//0GGSp1tFQOu8vk/5CVbHVL4v/bg4GxZijhtA4O2GEm3oX9dKDOWZE/khP9lll3a6FMyFcKPq7/z63Fa9R04bbvhA+OuTe/kMIspDLFKf/IDbZZX7WHuIKryr3XBorT3N2EMju6L7G8aVRfiXH/6lpCtqMR37bhlzlYypw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YRbRXUNO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 057F02FB2;
	Thu,  9 May 2024 18:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715271259;
	bh=niqACMJUDQvX7bsbOCCveCvUwGDJ1tge5Qhp0HHDv6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YRbRXUNOQ7JdIs6LW81iJHozboPoJlmrZBHsO0gjtHDMHi+vvvFcI3FV+GofPazXH
	 ZoeZ/hhZ4KH1iW/HBsmtWt6ma5cVusUXIJSTJGxwHum/n1sXFPtxDZadn0Q0ypQqHh
	 HD+4PW5Q4XwfUH+FYLeg9nQcjKaJFpE8u3gkz5Lg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 08/11] media: adv748x-afe: Use 1X16 media bus code
Date: Thu,  9 May 2024 18:13:58 +0200
Message-ID: <20240509161403.111789-9-jacopo.mondi@ideasonboard.com>
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


