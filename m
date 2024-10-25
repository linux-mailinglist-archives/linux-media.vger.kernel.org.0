Return-Path: <linux-media+bounces-20346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C87939B0CFF
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 20:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF87B286488
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887EC1D270C;
	Fri, 25 Oct 2024 18:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d5+/M6qL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53FD20BB5A
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 18:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729880243; cv=none; b=TNqe19N/Fzkvt935gfFL7PD9GxGZrKoRwJS4aArylfW2slWOcsiPPTICyRydSsKADFBH9vv3wmoZDik85Z2UKpt8qDmWBporT/v/PALLv3SAW6zi8o79pawcbX9kFjBcx/rF02QEzkHzslqlkxjlkslD8VtcjNupiHAgqPCtV9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729880243; c=relaxed/simple;
	bh=uGwa5g8yq+hcDfzO2Ctvo+yB1ICq5heJnHYFnSp2RXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+j/hLueSSoRjXxKEoczBgDEBzintqhdM+GEalaq6ZumF+xVvdH0vt1zmraa35MOW/zJqqGTEl2Wf8R/0DArX1w5xwaLNJ7c+LZzyLiRuAFc3JFs3oCFv/bBHUuwx/M5AhllR6ehHg1HsLsdAVq/5pXf5iECOJxZHXnTXrTDAmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d5+/M6qL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36DD3D77;
	Fri, 25 Oct 2024 20:15:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729880128;
	bh=uGwa5g8yq+hcDfzO2Ctvo+yB1ICq5heJnHYFnSp2RXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5+/M6qLOv/MN1G2hwQpfNUN0OIDMVIfgzOA/pviZ+bSFY+eYqfYBtHzN3+7PsK5G
	 0+aED5bF8xCW2Uc9Ikk+nu4lrz0naq3MNV79x6m3OWXlyEhUcw9xE+i4TB9tdd5kOT
	 vmMn9kubYkh91H0fG1QTbmqneh/njj8fkrPerPUk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Subject: [PATCH 2/2] media: i2c: mt9p031: Drop I2C device ID table
Date: Fri, 25 Oct 2024 21:17:08 +0300
Message-ID: <20241025181708.20648-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241025181708.20648-1-laurent.pinchart@ideasonboard.com>
References: <20241025181708.20648-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mt9p031 driver doesn't support platform data anymore, and requires
the I2C device to be instantiated through a method that supports device
properties. As the driver lacks an ACPI device ID table, the device
matching will always go through the OF device ID table, either for OF
devices, or for ACPI devices using PRP0001. The I2C device ID table is
therefore not needed. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9p031.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 70851f296142..f2f52f484044 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1112,7 +1112,7 @@ static int mt9p031_probe(struct i2c_client *client)
 
 	mt9p031->output_control	= MT9P031_OUTPUT_CONTROL_DEF;
 	mt9p031->mode2 = MT9P031_READ_MODE_2_ROW_BLC;
-	mt9p031->code = (uintptr_t)i2c_get_match_data(client);
+	mt9p031->code = (uintptr_t)device_get_match_data(&client->dev);
 
 	mt9p031->regulators[0].supply = "vdd";
 	mt9p031->regulators[1].supply = "vdd_io";
@@ -1208,14 +1208,6 @@ static void mt9p031_remove(struct i2c_client *client)
 	mutex_destroy(&mt9p031->power_lock);
 }
 
-static const struct i2c_device_id mt9p031_id[] = {
-	{ "mt9p006", MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ "mt9p031", MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ "mt9p031m", MEDIA_BUS_FMT_Y12_1X12 },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(i2c, mt9p031_id);
-
 static const struct of_device_id mt9p031_of_match[] = {
 	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
 	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
@@ -1231,7 +1223,6 @@ static struct i2c_driver mt9p031_i2c_driver = {
 	},
 	.probe          = mt9p031_probe,
 	.remove         = mt9p031_remove,
-	.id_table       = mt9p031_id,
 };
 
 module_i2c_driver(mt9p031_i2c_driver);
-- 
Regards,

Laurent Pinchart


