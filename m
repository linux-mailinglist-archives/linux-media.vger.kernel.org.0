Return-Path: <linux-media+bounces-47273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4736C693E3
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 2380F2AB8A
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CD8354AC8;
	Tue, 18 Nov 2025 12:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sHNnYMXR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AD635389F;
	Tue, 18 Nov 2025 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467418; cv=none; b=RVPD//uvF4lvVoV/ZPoItQOR/igyRBxs4MJ95nw7ZLGnq+QEo/s0oDvyfZuw9pMIBtjJWHu6gdZXYjXBLeijCcbl3gk0Az2OKQjBScyyZjnVTNzfIxPLQyel/y+8mopk8EZgMa6MaQSf76qDYf4mMIHBxkpmmasv4RRqoalzwTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467418; c=relaxed/simple;
	bh=njQAp1UqANLQb/npkpFKkO99gEzxDInZPmiyCLWGuJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H4xYDGWofSbtDI2dnhCXDRe/hx1O17OqmSHMGm+MhAnxiUtSNkejQD4aDlyhotc+ROueBmdN/A19g6x/JZb/TrF5/0croURNcE3sux2Z5AlyxK89W7BWDEHmlnuYJKnt/4MZ0yGWe0m5cCCDRYZIa8661/wQbGid66+8SEoNtV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sHNnYMXR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C65D1FE4;
	Tue, 18 Nov 2025 13:01:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467288;
	bh=njQAp1UqANLQb/npkpFKkO99gEzxDInZPmiyCLWGuJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sHNnYMXRswAzPGdBV7xKuCX/NCPCDW/eb0fT/Y2usbKJ/SnBfPnD8QphegaUmpz2T
	 Pxf6mbur77+rnRp/kOKGa4Vc7MnbJzY83cmtlmrZ5+7t1e0tOYtzrjDZlMBFSrL2oR
	 zsuMtqGu9AzThWpWFRJO8Rq8xX+zUE9B8WZv06aE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:32:54 +0530
Subject: [PATCH v2 01/16] media: i2c: ov5647: Initialize subdev before
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-1-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=njQAp1UqANLQb/npkpFKkO99gEzxDInZPmiyCLWGuJQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGB6pzO2AeL8OFvgTWc239j+jGDWzOgTb0crZ
 +g6J3s8CXeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxgegAKCRBD3pH5JJpx
 RbyCD/4hi1WdAgcw80YNqLxvd6LfACVA6hB3MfCnitG5DNB6TpTiwC4UrkM61JkH/qVlG1nX1rc
 D84lrTzeqFYU+u6SrZiFK6d9vuUm7ZitG4QhztHbSxFz/iiKH5/luKkdjOsEx5biXgLtjXlXU8O
 KYG1YY0K6tV6KhQhPB0yxS12Bz4PvltpWa94VPGb9cruDBO6889caaSAC5snlAANxwJJyVeMzzS
 c0QOExmb5caSBxsSD7y6bTvNODIOw15Im/9b6lksduKl04M9EXuMmyJqawDAgs+4GEavS5pS43P
 +xAUOrwiXcB9mmT+a0gs7Ew67twoLKz8MILVJjJThtfF70+bHdSxboVAfRb8aIXZ9/eHj3qtLAG
 ct4klU4h5NX2xnatFBN7CLiUXJghvXNRks/n3yybs7MyZunGonSFdwIQkSIFQqsttnJ8KJQEjfZ
 hAHKZIrCwdq0QT+Un+jiU/lYVkuarJsK4+b/+dh7RCiyNjk+64Ci35V6KzQxMa9qfz7ecQJmhik
 Q/+Z40BFfJMjq1GbzYhnZbL+IPcQmUm10MQ51hs+mwb41PTi6PrKlKUWy0ucMhwMr+1N8tlXP4G
 xm1olsDPXpu7Su//0S71SRxXTJ8mybYQItuN8SPgY9WJwkhr3OH9m/yq8lOhnLPluFZf5ZOj2B5
 6y1grjQtFh8lHfA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

In ov5647_init_controls() we call v4l2_get_subdevdata, but it is
initialized by v4l2_i2c_subdev_init() in the probe, which currently
happens after init_controls(). This can result in a segfault if the
error condition is hit, and we try to access i2c_client, so fix the
order.

Fixes: 4974c2f19fd8 ("media: ov5647: Support gain, exposure and AWB controls")
Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fcedf4661564c032cd7dbd80a9fd30a6..f9fac858dc7ba754bdbebe1792f6fb0358781408 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1420,15 +1420,15 @@ static int ov5647_probe(struct i2c_client *client)
 
 	sensor->mode = OV5647_DEFAULT_MODE;
 
-	ret = ov5647_init_controls(sensor);
-	if (ret)
-		goto mutex_destroy;
-
 	sd = &sensor->sd;
 	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
 	sd->internal_ops = &ov5647_subdev_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 
+	ret = ov5647_init_controls(sensor);
+	if (ret)
+		goto mutex_destroy;
+
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = media_entity_pads_init(&sd->entity, 1, &sensor->pad);

-- 
2.51.1


