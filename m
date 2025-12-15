Return-Path: <linux-media+bounces-48756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7FECBCE15
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7FF53041CFD
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1822632D0D1;
	Mon, 15 Dec 2025 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GFb28qFU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D691C30E83F;
	Mon, 15 Dec 2025 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783922; cv=none; b=t4vcCbmAzqm/xyl7Nw795eQ9EIGSeJKHjkeZdT45LZJDwuEj9Lm0Baq4Au4wv72ioZzVEzZO/N3kmxJPijcdshLkJohj2hip9c8w4h3aTCMY0/DRTDJ7ox0YvkiF0+fxoNbL18pjUkKjhR4rQFlxyO3/V1v0gzOoQMI2ezGPOSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783922; c=relaxed/simple;
	bh=Vp2bdqWj7XiU3ZXC/8jNvb1g/2ee4MN05jLCZKPQiA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6zJWI52un/Jk4zTjf8jhXfVw38OLeZtWkduI7NlkSPEfalLdj3WCdfG3c8p1GzGQmvFTMzuLIFCBIHazyUSCDhHTopovCOtrK2Uy8Px3ZfIZ4YQPKyOLqWQPBSaDcE6VIIof9nuozkjHIEafvfmXNwxlLrFkRPmXbNjoL7wzNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GFb28qFU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 607B5581;
	Mon, 15 Dec 2025 08:31:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783914;
	bh=Vp2bdqWj7XiU3ZXC/8jNvb1g/2ee4MN05jLCZKPQiA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GFb28qFULiwTlUMqZBJ09N9S/n6t16JoQZelaFmEu2r+cedjdWwbleW0x5FV5NuoW
	 iyG+7M3EnHz26QMzD/hr2/Q1h5eEaeTn4muO6V4bzlW2rEi+2ZVPJF65Q2tc1H4c5+
	 bTEZ+lkG3ARaKCmwlgNRRucvT52B23BI7KaApFDc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:04 +0530
Subject: [PATCH v3 08/16] media: i2c: ov5647: Parse and register properties
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-8-4c25e3c883b2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=F6ta0vueo7eu8kDxEN/XO7biufHV8rAG8pCDIPMqhJc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jeJRHEKNSaECWuL30Pxls0LhaBOMiruRBd4
 NClbWDvglaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+43gAKCRBD3pH5JJpx
 RTKKEADSjPWkLElG/H/X26CbuTrZBXleo8RsxAuUrOPxIYr0ypYt29MVVstcGgTG8a3NtwoXG42
 vytM9gE+YxuE6GR5AOQLEkwnT1EkQp0m5uiiCfoR/D4wyAl+FdqV+TXKIU+8zv2wTZwZD1k50BE
 1qCYwxbRo57ax7lUYobdzjIGgXDRdlrTGal4QfAHDcQj8084TL7h38gPk3juHtD5d1dTDLzMhMK
 6bugqwIStueQMURyTsLmre07f/2b5oC0SpdPMJFN8NtZ1Fi3O+N0Ctm9o5J6B0fqL2enPHBf1MI
 Mh2Oce9U/Bxon5kDYsZR+Rtb+uR16oeyA36wVb3KcrYMcRgv/ljMqfGUJrNw+w4+LTeUp0W2/Tl
 i3cFt7csKgZf88q16HpCYtUv6JVQSXN0vFeyNQaYc+sxyqkKjCvuTSy0utpIYIdUqj9V9/IYt/F
 K6vmCdMXGcxNVigYSe3W+7aQD4jyZjZhASZhA6cHBKIUYCT/h3H2BLM5QZtJOZKKNDDydD9Zv4B
 FScHwVM2dJltKGcFLbMUZGh3PQG9Wjm2AnrNWn7Mwn7MOxmVt1GlW6Z/cT+o7ql5CyKUK7Es80l
 S9RTbw1w0WesO0W1ucmzDLcRAeJa54wzzk+16uawxn4MEd/+pT638Cx44g93GFyb6t+Z9/AidAI
 JoGcIDabRKxikBg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Parse device properties and register controls for them using the V4L2
fwnode properties helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
2.52.0


