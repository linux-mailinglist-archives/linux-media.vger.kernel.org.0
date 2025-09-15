Return-Path: <linux-media+bounces-42554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C07BCB579A3
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 14:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 349653A2772
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 12:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8938C304967;
	Mon, 15 Sep 2025 12:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CL1anuVa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340F030277E
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937624; cv=none; b=dtKxq0eY2t0Q2WmxxCDfuMi3H0+6a+hsE3vTmMoURZJwhCGAhqa93STWEoJZKchlupmP++QO/Yh3QI9QvXS9K75zubZePFTPtK8KbfIoOvMGxUgwjjdzbQoVwnyzJ4sYwe6Z1UqlFDEGAr0bUXwqz+jtg9kKbQpBDf2d5Vi06Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937624; c=relaxed/simple;
	bh=If0dgx1FXHFyXEUkeAbgiTteB8l5THMpZJGkyb0YEF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aRRuyL296C1vDrPYbIlVJYyLRFw+TzQ0NRmst1jJ/+tNXoPnc3DQB4xFoIIORX/1C527U5mlqWFrsfh8YIfcVkSF/0QjyJ9wrgvRrUmfeH4oTB+RsuixJ7I8oszxXd9s2KYA3+lQiAZhgDuozDVAg85YQRit2AJo3NljtM6/H3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CL1anuVa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from Monstersaurus.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18CEC32CA;
	Mon, 15 Sep 2025 13:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757937543;
	bh=If0dgx1FXHFyXEUkeAbgiTteB8l5THMpZJGkyb0YEF4=;
	h=From:To:Cc:Subject:Date:From;
	b=CL1anuVaQuqzWLwvyW4utsddLRcfQhYeixKdafx1joQ94HMeby4U9DuHzZRBbVoVF
	 EvyQkEzuBcqwbroWpj2Kd7gxNNgSnETkYwqRZxTP1szY1p1QToSkWgXXN5QBrOSma9
	 d4HlaSj4KmEqadXVIPBjZcDqY4aNmfk1EMGh59Jo=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: imx335: Use dev_err_probe where appropriate
Date: Mon, 15 Sep 2025 13:00:15 +0100
Message-ID: <20250915120015.3062426-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the early probe we can fail with -EPROBE_DEFER.

Use dev_err_probe to ignore these warnings before we successfully power
on the camera.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
This is currently based on top of Jai's patches [0].

It can either wait until his have landed or perhaps go as part of that
series if you wish to collect in altogether.

[0] https://lore.kernel.org/linux-media/20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com/

 drivers/media/i2c/imx335.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 24d26bc6260b..5efa2884784e 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1462,26 +1462,23 @@ static int imx335_probe(struct i2c_client *client)
 
 	imx335->dev = &client->dev;
 	imx335->cci = devm_cci_regmap_init_i2c(client, 16);
-	if (IS_ERR(imx335->cci)) {
-		dev_err(imx335->dev, "Unable to initialize I2C\n");
-		return -ENODEV;
-	}
+	if (IS_ERR(imx335->cci))
+		return dev_err_probe(imx335->dev, PTR_ERR(imx335->cci),
+				     "Unable to initialize I2C\n");
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx335->sd, client, &imx335_subdev_ops);
 	imx335->sd.internal_ops = &imx335_internal_ops;
 
 	ret = imx335_parse_hw_config(imx335);
-	if (ret) {
-		dev_err(imx335->dev, "HW configuration is not supported\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(imx335->dev, ret,
+				     "HW configuration is not supported\n");
 
 	ret = imx335_power_on(imx335->dev);
-	if (ret) {
-		dev_err(imx335->dev, "failed to power-on the sensor\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(imx335->dev, ret,
+				     "failed to power-on the sensor\n");
 
 	/* Check module identity */
 	ret = imx335_detect(imx335);
-- 
2.50.1


