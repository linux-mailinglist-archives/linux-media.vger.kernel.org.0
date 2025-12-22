Return-Path: <linux-media+bounces-49287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B325CD4F20
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0D03300D15F
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAC8221F0A;
	Mon, 22 Dec 2025 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ocqZzCh1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B115A864;
	Mon, 22 Dec 2025 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391365; cv=none; b=TkDjYesikntX5KORjUgQwNIVQ8l5S56BSCPv+uBdsu7jy8oTGHBbKWibVi4XSp2n9dOEitPFljA/2AfXN1Rb1VO4PRcE4lVtKayC1+hapylPLlJcS42cr0Ho5r2zuK0dctyy6c45/IK0urWOHfH26TD2hGFK1OBtyiXzH60Uhag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391365; c=relaxed/simple;
	bh=cWMNTcDu8x9WNg3vTB3u75ylHzVA7Jm5rmsZD93vNPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kN0iNOHGkm3Vqvg8FJVJYP+jw79FO6gmYI58Yts4vuDH/UHKtvo1WJSttYr3hBM56uLyC0ReCyrm617hQmqlOcvUjam7vdLjxrup2hLmb2XRVnj4VJVYBeifsSYvHf2vPJLhyjU+xEB3CCXujBVbJPfJBdqQ4o+6MD3rtmPta18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ocqZzCh1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5059F3C8;
	Mon, 22 Dec 2025 09:15:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391348;
	bh=cWMNTcDu8x9WNg3vTB3u75ylHzVA7Jm5rmsZD93vNPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ocqZzCh1ZbufO1J5PKjZA3gyLiwS9bQFSyhdh1ABwTrTI9TEbRONx5UGmlzjmYVJ3
	 2ZlIYSFRl95cUM2L+HYm7HvF0xVwH399AzDQaDXUcGc3ejQFlWm/ud2NJHrWdXpLkn
	 oTk9GbPHUXPfOZq4q98Oi8G/P6cgExUXnKJXxe3g=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:25 +0530
Subject: [PATCH v4 01/17] media: i2c: ov5647: Initialize subdev before
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-1-b949c7309280@ideasonboard.com>
References: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
In-Reply-To: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
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
 bh=cWMNTcDu8x9WNg3vTB3u75ylHzVA7Jm5rmsZD93vNPI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4ht8gnjUG9FsU855Li1VPwNmYSnrVkZcLyl
 WZUIWUNiaGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+IQAKCRBD3pH5JJpx
 RdwBD/9HEECawOWKldVHooFX2mQPmHLY1AZ4p9KYEIXMbE61vqAd5bTacK4grrTPuncK8I3MBmR
 f5uhzuE8iUMOelhEvZQYVl3k4xnrhFQgrFGRyGNOWBbyplT29t2Bzq8HuFmF/uEZAQOdY1b7WwO
 4QywtgP/7pVHP9IxaoWQhrTLkhBwzREDU6tcQ5uY6qEjtRt4UHoFRVVX9iAt8uQl5+0zO82C5Ic
 jPqIaOdYn15K/L6KCs45XXcyIE1Zd1gdnbAi0z7Qrl5zhVsXsfSpm2GJ8rU+rA7OhrRRtHDQJeY
 EYNn+7lkz8QlvRBD/lMcnFtj/ccm5tKj6bUWlJF6l/e9eOp7xOvWyYyPqOBn6zMprrWJjA6bEVn
 v42ZaarIGEBikdfjGPUWWPevuRJYHeKoXp4eTnCTFolqspKR/Swihjte8FAzqkETxCN19XyubXO
 dUkMfJq7ayO1yu7Su+Tw4njgjDjk+y0HHxUA35/ZW4ayxsj5jYK5H5KLwcr094Y0X3agzG0voki
 xWo5YEF17KEVvJOx88jYZAy+/GWEJroUmD5vFUhEalPg/HuPoEOWKXUqUok6/kWlMYX6ptfgznP
 KH0GKOlNVLB918rVKV+3ieb8WSyiZ+OUGcfk0wbFqG/2VJwYBMN6/a/fEkoxrUJY+0s920C76L/
 9qfztU+k75cJYtg==
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
2.52.0


