Return-Path: <linux-media+bounces-48763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB9CBCD4B
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A7683035A7E
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FF733032D;
	Mon, 15 Dec 2025 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NpWMXl9w"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA8D33031A;
	Mon, 15 Dec 2025 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765784020; cv=none; b=Li9i5Hfi45RRjBDv1IQEOZ+26/nyDTeQbkGQo+e9Lvo7yOVwfQYcuD49oARb594yjZjENBVJW/xlcdXzUfp72JbmhxdD4krqcBOd3tq7YYaYYZiY3mpY11XCVUw9c2/Sy5UXZbF8EglI4l0d2rS6qyUO3gfGMd7cJRG2dIZQXxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765784020; c=relaxed/simple;
	bh=mDvI9W+VX8B2pl9BC6rcbSYJ7RJgiMppcLeL/kgmlHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7AZWY2UgGhmyBKMBLw97IvG8rCzdOg80ltFc945U7mP9+T1jT31nQQVZxTyU9Lbdb497ktpGWpybFPF6BhmmNJQnM/5z9VAdX18Ve3zXqW9W+TnlapqCQj50xvWEQ9hsJxjAV3mQkZ9m95ywP+UOYGy1CmH+UVjtjJyDG0Z7Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NpWMXl9w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 709E5581;
	Mon, 15 Dec 2025 08:33:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765784013;
	bh=mDvI9W+VX8B2pl9BC6rcbSYJ7RJgiMppcLeL/kgmlHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NpWMXl9wuxFcst9mHxl4LKz+rwt9EjXV+Gm12yCMn4zwpCj/f7IrQ/EIvnrnmbVse
	 cFNMOAX8/8UTl02HyijHbZuirkd2PUciLNBuz/awQOb6C2XaSnvTd1XzNu8j6nDFuN
	 iuFClpM323ujdN9ACVQPBsJIUCBLz5cAMeQnI8To=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:11 +0530
Subject: [PATCH v3 15/16] media: i2c: ov5647: Tidy up PIXEL_RATE control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-15-4c25e3c883b2@ideasonboard.com>
References: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
In-Reply-To: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=mDvI9W+VX8B2pl9BC6rcbSYJ7RJgiMppcLeL/kgmlHc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jluwc2P3hwGoZkiUGsZY303y3rx+CAdgV5c
 oZ6ZOg6EVGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+45QAKCRBD3pH5JJpx
 RYatEACGAHdoQo8g/pgVJhXdnUIpM77PcWwkumbvEGGlto7rMbWTmKOiIrPnFIQlbFgL1JhyQ1w
 M79Qi8Aa6yTh5G63YJl4v8GDHLuXMpZp7cJxRP5E9F/wcKkPYMVJ/PiZY9WFu1o7f+jzjT8Apzx
 EtA8otPBM0ym2q4Mx9l3M2dPyaaXQsy52VBlP0ynEADwxAj0GsUbzcYpH4h0RMZAsf/AVeHGbd6
 cxmxlz+hcsiAIYeJcndAV4fEoDyFKp2BZ+4l+RgZdDGIIej05aW2FXYAQif8CPiy5Eu8o1fl29L
 D6ejtqMQj03bp8jdmQiHAMZ0Wu2S7h89P/bkCNG9si1d2TaW6Rb3sfugs6T1PLlND7PaBLafq1I
 2SZLC8uM2x9zmfpLKy09wwEXsdlRxzh5zN7c0bQTrKWNGLXLBbconvoyrT4wCXUmX/eT1EhNrV4
 gWHHH9L7M7BzB3u+cUAvpwxrGSBQLXXbTTdVwH1are2fI4jluuzRFZ0QmEmcDwAnCdu8iXKCM99
 /yhbLwsNELLJxwC3zgf40W3WmONFC+czcPEcXa6MxvjpLyMzReJ8cYT+OkIMj6uFrnZ8yfuWj++
 D2KqJXL+fl4G17SvpVgKQvGZEhIvCFn6CGhAZMkUU72u/NQFU+/oW8wkzyPowg4Ztu2rdKHQHsm
 mhlVndUATP6YNoA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The pixel rate control is marked as read-only by the framework itself,
so no need to mark it explicitly in the driver. Also, we can set the ops
to NULL to avoid checking for it in the s_ctrl implementation.

Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index cbdd0f8fc8de9c0f4251aa4c8af62ca1ad8fb168..02d751967ab2c4a8dbe4a504738c2c0b36b6cb68 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1190,12 +1190,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
 				   ov5647_test_pattern_val[ctrl->val]);
 		break;
-
-	/* Read-only, but we adjust it based on mode. */
-	case V4L2_CID_PIXEL_RATE:
-		/* Read-only, but we adjust it based on mode. */
-		break;
-
 	case V4L2_CID_HFLIP:
 		/* There's an in-built hflip in the sensor, so account for that here. */
 		ret = ov5647_s_flip(sd, OV5647_REG_TIMING_TC_H, !ctrl->val);
@@ -1262,7 +1256,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 			  V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
 
 	/* By default, PIXEL_RATE is read only, but it does change per mode */
-	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, NULL,
 					       V4L2_CID_PIXEL_RATE,
 					       sensor->mode->pixel_rate,
 					       sensor->mode->pixel_rate, 1,
@@ -1301,7 +1295,6 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	if (sensor->ctrls.error)
 		goto handler_free;
 
-	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	sensor->sd.ctrl_handler = &sensor->ctrls;
 
 	return 0;

-- 
2.52.0


