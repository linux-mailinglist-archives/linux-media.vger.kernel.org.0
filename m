Return-Path: <linux-media+bounces-15409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C72793ED23
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 08:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABE88B219A6
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 06:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2240383CD7;
	Mon, 29 Jul 2024 06:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GIxKLrWG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644087E1;
	Mon, 29 Jul 2024 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722233157; cv=none; b=nMR5TQpOohGw+VN73arx+W3v4+Ty1eiGHlK+Qnbq+mTEHSMHPytD+mNwlkBaSyFApUSbFrzJ3HpDTDN6yO9/ZbKGShShQwPUS/XWTx/j5pwxuu3zAGZ+9NVyD8AkliQob2nEbs+YErLOy/4hrgjdMTEY5EAF81srsvmtxG7bSoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722233157; c=relaxed/simple;
	bh=lPEHxXxtKfS/fsjqQS4/g6NJU5VecBaFkrp+46VOA0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LL+DkwzcR9tEx2aloEXSaC/LWToR6Vui50jwg/HOwUHq4m7yeBKw/ujexiC2iP04Fi/pnv2iIF/4X459SIpUJxPWUZCmyn6qPy0CtGUfKrobwjIVH4f7IPCB3WkiExcIEndpzhP9ZgGBL69awZm87G3hT+WSmXRpuGwjL5zdamo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GIxKLrWG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2E1B596;
	Mon, 29 Jul 2024 08:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722233107;
	bh=lPEHxXxtKfS/fsjqQS4/g6NJU5VecBaFkrp+46VOA0Y=;
	h=From:To:Cc:Subject:Date:From;
	b=GIxKLrWGahpJMWg2VTYFuEWBnZEyC+sSEDeWBNXErj7z6olXwK+G+JwMVb5Cy9Hn1
	 F+FjS334xQXelp8a+NaYcf0TeuHxVi80r9kV0yWqb5eLisYMmARIV1ykBs9DvQlw/T
	 0b7oKo5EyMkhQlPtdDauwk1S3CQ0nKdYKa3kuKp0=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: imx335: Fix reset-gpio handling
Date: Mon, 29 Jul 2024 11:35:35 +0530
Message-ID: <20240729060535.3227-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx335 reset-gpio is initialised with GPIO_OUT_LOW during probe.
However, the reset-gpio logical value is set to 1 in during power-on
and to 0 on power-off. This is incorrect as the reset line
cannot be high during power-on and low during power-off.

Rectify the logical value of reset-gpio so that it is set to
0 during power-on and to 1 during power-off.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index cd150606a8a9..878d88b5f476 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1171,7 +1171,7 @@ static int imx335_power_on(struct device *dev)
 	usleep_range(500, 550); /* Tlow */
 
 	/* Set XCLR */
-	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
 
 	ret = clk_prepare_enable(imx335->inclk);
 	if (ret) {
@@ -1184,7 +1184,7 @@ static int imx335_power_on(struct device *dev)
 	return 0;
 
 error_reset:
-	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
 
 	return ret;
@@ -1201,7 +1201,7 @@ static int imx335_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx335 *imx335 = to_imx335(sd);
 
-	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
 	clk_disable_unprepare(imx335->inclk);
 	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
 
-- 
2.45.0


