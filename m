Return-Path: <linux-media+bounces-20462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 605729B3C1A
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 21:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CD8F1F22D02
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 20:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481EC1E0DED;
	Mon, 28 Oct 2024 20:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SQxuedcJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14711E0DE8
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 20:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730148297; cv=none; b=SlGwD83g01po3XY5y4vDGHzVUCbG+OzRf4V0+6MUwsnZmAW0zgpeKXjKdmgPzYGqgd9DPW8xP4jCiaq/Wfv7naiXPyFYlib4q5ASfBcM1Rl4jyLTpjS/SkcBiVlMKkxQaHJCuJ3S1z4UQ+u8MGsD83PVjBWMQDyRoS7aL61W8Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730148297; c=relaxed/simple;
	bh=v3Ti22ngeD4olcT0y6tudEp3U6RVw1nqdKeXW5XHY2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iysyXSX/rGVnEWFx4wQ/KuMe1YPMHS3Pv/IYthPOfHC63Dfc4zqU9uL494eovIUoLKFbVXMIbKrT1hzIlBmNWaw5ZMBOoa7wAgMoz5nQyCHkPeF6RJPJOpsFi/OyBPJTgyOehKRKUHkZdwgbx/RGeOAHPUZ+dGvaLtkx5XeJQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SQxuedcJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 834981AFB;
	Mon, 28 Oct 2024 21:44:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730148290;
	bh=v3Ti22ngeD4olcT0y6tudEp3U6RVw1nqdKeXW5XHY2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQxuedcJOigYBOneIw757cgnyTsYJtXlIGphjyJNctPMw4l3X4CMQUwT39z08FNLV
	 aorh28fE2WxWaxw02LNSW2ULaWJQfGoiW/8MNHfC3kFsnFSUb6QTcvl0pY0sj0ei/l
	 4D1GFvZPpXFSQzHGMckVb2qNSSmIFf4Q9m7/7FJU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Subject: [PATCH v2 2/3] media: i2c: mt9p031: Drop I2C device ID table
Date: Mon, 28 Oct 2024 22:44:42 +0200
Message-ID: <20241028204443.22426-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
References: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/mt9p031.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 9dcb8a0962a4..e6353a5667ea 100644
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


