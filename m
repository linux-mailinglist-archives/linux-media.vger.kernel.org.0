Return-Path: <linux-media+bounces-45739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08272C134AB
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E957A1AA0726
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6F526FDBF;
	Tue, 28 Oct 2025 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s/fwEuaj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B08221714;
	Tue, 28 Oct 2025 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636484; cv=none; b=m1Vs7Uw29uU+5AcApIVWaFHVdq+Qaj7N6+EhoXoJcJWRxEuKJRIqWXFPYah0cItcvc94b636Ss5wXCP/ceGTVvi+3JxUqzIDf0KUp/EnI+IF4VJ77/jQNGDlXwkJoztAJLXAm0MD02BoPR8IphiTxv70WSM/DED/x+foSfDFass=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636484; c=relaxed/simple;
	bh=og8LkaaN/yOnabmGm0NkoOn9PcLr++/M9jUek2uOYnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udonouW9YVxSQTdL1fCxCvBSripVGdluBCAzxVgfe5ZvPOPD6CD4oOjPE5/SRmw25mjFuAwTJzmr/xcLSjF2l5W/U/teZ6gMC63qRmZYfq+pLpJhO1Pg+fDhES0tMIQ10x5e8uxzzdLwjKGAGtFvsGd5z4weS4XbfzsezZ8vk0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s/fwEuaj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66ACD176B;
	Tue, 28 Oct 2025 08:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636372;
	bh=og8LkaaN/yOnabmGm0NkoOn9PcLr++/M9jUek2uOYnc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s/fwEuaj7SGDlDOLE14TYeHILm+XVuvCrfoB2fRjhhIkJMUMwAqFRSPYbga/7YvrI
	 zgOwmWCOeke8F5xS0CwYs1y8I2LoeO3fm+SnaiwGBSpDQ5mf1f0EFhj86/skg/eaPx
	 H/CiUyYoLUYXlNAfdY2IZ8ULhnQbh7cVynTf3vDM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:12 +0530
Subject: [PATCH 01/13] media: i2c: ov5647: Parse and register properties
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-1-098413454f5e@ideasonboard.com>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
In-Reply-To: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=3k/xCjZp6XqE/F7ObaCjn7FHHU/2F9CezCuQyktY/ds=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHBqPqb/GpQ5KhEjgfqKCxGc5EiwzXEbhVtgf
 fgrhoujWgqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwagAKCRBD3pH5JJpx
 RSoXD/9ceKCWv1LttIPTTeKrjZO+CEbkICWbVKVFvfJHfXuzRWWrNCiD5hvIY/SdAJAEhheUV5b
 NFlw2knVae0dmcSyg5MEQNweaU+He70bqErTXqNqcpf+FmLGXdnhnxUnHnYVFFfU0vqpNJ4WAFD
 ddQCKgByIEN5XJlTTJyv3WzHojBp6DmHy3/6CKyp0+uqJDrOQ/694auM3hdWb+7ZTFupZ+vr7OR
 CXsvsPNFdX9vTSjthf8RO8w0LHclUatteyhFLB5cxovxrbTIw1FfjblWC8pic1d35finp/HIpZl
 fR8wPUc8DYY2WJ2mLdBFzR3grh52ZT5m3zPke8IGOKOX3aZFJv6YG1ECZzVCtCBp4qiu4p0cBmM
 sZOSD2RyGLSzcYnO0CP851rooc+HN3bnvf+rOhe1mXFrQb7PUbqxQQk2C3EwSN7P+XV9vMRnabu
 aI8sQeFb55fqUR4ddESXIBJLQcD2ov+raoQHSb1YbOh7SaGCyfUN1Gg5seVItfnLNNdd/bV01n0
 9M6dfu/3UlJDgTU/iA7TEOAbf47Liuc+rX1gsoqg4rohflqvvrirtL6nqenJSG/LnOkiMEO1hN2
 K6WssNtM5+atKFq2SxvQ06NZxyt6ba8LXRrYsd6MOJ4Mldqxx/fnlZWX9V8yMqgiDpaqOfpOjE5
 8fue0Ie3OHgvlpg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Parse device properties and register controls for them using the V4L2
fwnode properties helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fcedf4661564c032cd7dbd80a9fd30a6..985a8e81529d2f88cb38ccb8c94f8605026a28a9 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1284,10 +1284,11 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
 	.s_ctrl = ov5647_s_ctrl,
 };
 
-static int ov5647_init_controls(struct ov5647 *sensor)
+static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	int hblank, exposure_max, exposure_def;
+	struct v4l2_fwnode_device_properties props;
 
 	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
 
@@ -1338,6 +1339,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
 				     0, 0, ov5647_test_pattern_menu);
 
+	v4l2_fwnode_device_parse(dev, &props);
+
+	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
+					&props);
+
 	if (sensor->ctrls.error)
 		goto handler_free;
 
@@ -1420,7 +1426,7 @@ static int ov5647_probe(struct i2c_client *client)
 
 	sensor->mode = OV5647_DEFAULT_MODE;
 
-	ret = ov5647_init_controls(sensor);
+	ret = ov5647_init_controls(sensor, dev);
 	if (ret)
 		goto mutex_destroy;
 

-- 
2.51.0


