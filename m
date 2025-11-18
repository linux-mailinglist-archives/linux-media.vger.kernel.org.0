Return-Path: <linux-media+bounces-47280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F221C6948B
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C39AF367C8D
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E9A35772E;
	Tue, 18 Nov 2025 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NaNIN0KW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97002354AED;
	Tue, 18 Nov 2025 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467450; cv=none; b=mPaECVaGZxhpuT2OQunMQ915wVJDFEpvfE6h8IC60prBSZY4yZH9kfKBWK3gZN3kwT8NRjaU2o4Bd31Y2tmQ3ih06lLRcVN2TGxBHHpCysdKeOWLmcx/DI20XYqUvfaMNd3xt0vLP4A1ytP3KlUdEq3ZZ2MieXiDb1czuA83xEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467450; c=relaxed/simple;
	bh=EagBiosbmA2aeUNJ2gjYfEbWX3f+2KZqocjltwmKjnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPLi/2rlGUciPn7bqH+JeUBaHI+Pq/35MP6sQXPN9KwM4N9RYpRH0BnTgwepgTP7n1UK0RKYF5hMv4PDjpaDinK50AJ7A/aSIVXWnppTzG3NkkmnNTjsWkc9M8VteFUt1YF4596Y3z21hlBK8rh5RTdM76nBQmrlqAYogCy/XwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NaNIN0KW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE484215A;
	Tue, 18 Nov 2025 13:02:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467323;
	bh=EagBiosbmA2aeUNJ2gjYfEbWX3f+2KZqocjltwmKjnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NaNIN0KWGt481At/fTEsGmysR7aWTD+DXqp91zm5B3Pd2iyBIfincxyayIxyWZPvf
	 TtyOjK9psMNfefhdbSRAbwG/BsTyKEkNyxgjoG8KqPUdkOV4nIQmWE1CZp3BiQsdTT
	 vcBl2ULQMaM6dfyBuKztbP9Y9Kw4+32EU6w7ioa4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:33:01 +0530
Subject: [PATCH v2 08/16] media: i2c: ov5647: Parse and register properties
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-8-5e78e7cb7f9b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ggNyXAJEahrB0cW+L33CIKmXjx7qgHZNZzZcak6sQ6Y=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGCBD3Z3roM7KqqUSDASFFsWzxrJW0tzQFL1f
 Pged84+Tq+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxggQAKCRBD3pH5JJpx
 RccKEADAAgWhaNskPDgflvrV0F9pU33cp+wB+jWN3KHDinuocdMmWrU6IfuYiXOXUNang2C7V8n
 8yFpskItZvTbJvoukn/axOrIRf7deYcx1ZjC9Wy9v66DwB7Lrn/jzmVcaTE1p8eYGeeE9Ov3BE+
 wneS3Jspv72XMQRYc2bSWoMF1DCIolzQRLPcfZ2SUvRzQPmVxix7gqggKG++mssTQPiXhYCuH/O
 SrTEUvEGk0NBNoF5WRyttgCd3EDGlYzYhGYaMqdh9fCqmoATXxk5kbj4kC7ov6PkMrqBuP554BS
 zSxsbEv7+26TmsSIWqneXLQcSnkBWPc6E844CnNToAVJbWBUvI+lJ4NXLon2sf9DDONoCm9+HcI
 U3HQdw4O5hQSjHY34GTaPrzYJl98nXJBU5/ZQ9AJOcsdTSBNJ0wbyrf8ZkOtRnuixbsHjJ+kPYj
 CsPlAYOTQHX9MNX1z6PJ06MB76DA44kMOSyslZkmepBedPCoh5hCiWpMjGI+dQ2FUFXvsz1e5ED
 trC//ne4yeGk0WA9s+IKn3K+sMaUI5j6GcAf484iHwgUxPFFoFd0T7/9sDh7FY7dvihNOJq1cCG
 EqorskrQ65R6U0iEaV13pB0gstTE9XLus6G9OVTJxEW59OHYMA2mTL8FYyiQac+5OpwnIR76tLP
 /LCc0+ByyO0mtkg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Parse device properties and register controls for them using the V4L2
fwnode properties helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index dbc134af06a26e0e31b12a6360d794afa8bad5dd..5009fd8c05a64d7e06f66f8f75f0a881cd0b95c1 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1320,9 +1320,11 @@ static int ov5647_configure_regulators(struct device *dev,
 static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+	struct v4l2_fwnode_device_properties props;
 	int hblank, exposure_max, exposure_def;
+	struct device *dev = &client->dev;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 11);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1371,6 +1373,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
 				     0, 0, ov5647_test_pattern_menu);
 
+	v4l2_fwnode_device_parse(dev, &props);
+
+	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
+					&props);
+
 	if (sensor->ctrls.error)
 		goto handler_free;
 

-- 
2.51.1


