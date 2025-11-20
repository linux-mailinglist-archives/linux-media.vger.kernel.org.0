Return-Path: <linux-media+bounces-47426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E6C71976
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 01:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id D0D822967A
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 00:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725FF2153D8;
	Thu, 20 Nov 2025 00:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQS6nYr4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D041EF38E
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 00:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599580; cv=none; b=NcKqlOCuqSJkU0eD8dJcZqcOC1xZqgyVrct7khDplANuq1lzUZKdN7Kh8BXelYGecmmZF3T7xfp27T8qwWWFSLpLTNNcptuQX5yxW7fU1Wd6+2yM6bkuSFcLgxw2Xwf0+2Nqh4NWO2wS9mqwtQxvUnhVc35kjkN6nDWZX7RHDaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599580; c=relaxed/simple;
	bh=mPxIQxf8RXrT6ur3bfi9b6n4x+7PEd3xn7AU3r1AgeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUQwjkllIOEvu/nrDeMHVSKqtcrf/uXEx5tGtT3VxNil8G2zWy8gRRQKp4kvG3sAx9Fja0qfS17brylsppWd7tW5sRhALmQBkzPoPCn8CFsUVyuQhDFz2ZJiPf3fbU8Hy37UH14d1m+BaqqvluMFQst8RGsd8gwGFKo8/WrbXso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQS6nYr4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-595867f09fcso32325e87.2
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 16:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763599577; x=1764204377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXPnG8PtuBm329AWD7irpNDHB4AObnZc8MrCBAUiE7s=;
        b=TQS6nYr4UOYPl/0dx3+z2SUQDmFfqNTSYZhH98TNL7Vdb9l30nOCXczYMvjGlb+GgM
         aHUetGK55pRMmrP666Z0yrr3y/upG5YWm8JontJ0MMKRVTa/a/pg9t8UtFrJp1MaHlIZ
         iB/Ih4SgRMLHQiTfPfAYkOFUq9nCRa9KVch5cKmmlhgT6K+a7N66NWEZ4oiVl08bQXPd
         YYacPFPavIo2MJtKFZCrtamDBCUtE6gsH/1K3e6qJMwRk6M5y6EaPqp45IRrEZAx/dsG
         E0qO+me7/DpYtD312/buzolrckCyNiIYBeImP1uNtVzBA8uUg0fUxEqsnFSfThBU43qu
         Z2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763599577; x=1764204377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RXPnG8PtuBm329AWD7irpNDHB4AObnZc8MrCBAUiE7s=;
        b=GDEJ69t8VvGAyVRsmRaax6f2I3TIhZyM7KUKLXiJ6P7OoUg7c5XSU6ITr07QhC2pKh
         nSdDiob+F44l9ZKJsGRycDNTyZp+MwRJpZY/Mc8b0sG/alO2X1K4KwiHUThwScX448c0
         q4f2+Bq417sT5Iz5jpMEY4FHwnNKb7/0CJSNoCCKCLIwXELLYtQ/vTakYg4mqqCfO86H
         5nQ2tneTfk+YfctE3oarjde4UNyufU1a+6tz2y4PkpHGrvl/I/wi/JF3OyjJrCIRVlCR
         zY2IUFYYXBwOkQPceAD/LDjyUFIwzfz3I1I/FA9ARaQPgC/MzxQcoE9XbMH87ZOLGmCW
         65tw==
X-Forwarded-Encrypted: i=1; AJvYcCWJAm1L4L2Qkgon1tFXKFdMirHrM6J/cezVhWnTqhEHrNF6muuxLSyNtS3dWuDHjAAViipbATtHzsi81g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC24HmoAZnAcef3BARhgt8775sUqXrX6CtjireUV2wRI3w90Cz
	OJWjwIVZSdBdlajInl1ic4ZeFv79Rrk35fRWZo85PV5DFjXcK3OFPqpmGtjrQ4J2RHs=
X-Gm-Gg: ASbGncsW/45x5B/I9XfG5VoylJP/bfG8T0gksaZ5fd10e2+7Me4ainPmsDtZPuvo1tr
	lBBFpKgVB/ZkZrEH83gr5GgNVMTYC6GDdCm23BzY+NPWtqxIKZy/1vUsV6NCW7y1uAEZdIQthQ6
	5nUQ9luRg6702kYH+omiOa9k3kew75g7BhBXzXkCF70U4NkhYM9vOvcczjvv3ElbM5avrnnQG0W
	PNs5x3WXYs3F8IRMxf6zKRjKHvEqz3tIFIsFl+EGgdBmne26D8SC0CNFLRU/2Tw9s68wmQWVZJL
	FihoiBNbv5MqZGEB+eulh4FGJkAtq3gxgO+nZzaR/W9iq0ZYqTfnGPcR0lzmgOHgny3dVFOhksk
	KBR8A6f4TBou8bmIU3gL2cGDIVwHGmZSNCKjZ5fP246E/pgVIHnlKJPimqFplDNTkg3KbhBELdv
	K42QhYEKX/A83o7X8Fy/3x1BSR5rUiYZxoD5JXTn15IsfcyVsiIydyog==
X-Google-Smtp-Source: AGHT+IFnf7qKIzWnkSQq4jAY4Quq4AnkczpeiPzfliC678e0KHe83BA3joW9GLNqgA+6WPKCEYn/dw==
X-Received: by 2002:a05:6512:3b99:b0:594:5582:f77e with SMTP id 2adb3069b0e04-5969f4901c4mr12381e87.4.1763599577153;
        Wed, 19 Nov 2025 16:46:17 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc59a9sm229479e87.71.2025.11.19.16.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 16:46:15 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/2] media: qcom: camss: change internals of endpoint parsing to fwnode handling
Date: Thu, 20 Nov 2025 02:46:03 +0200
Message-ID: <20251120004604.2573803-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120004604.2573803-1-vladimir.zapolskiy@linaro.org>
References: <20251120004604.2573803-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since a few called V4L2 functions operate with fwnode arguments the change
from OF device nodes to fwnodes brings a simplification to the code.

The camss_parse_endpoint_node() function is called once by camss_probe(),
and there is no use of knowing a number of asynchronously registered
remote devices, so it makes sense to remove the related computation from
the function.

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 49 +++++++++++------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fcc2b2c3cba0..736f04e10bdb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4022,16 +4022,16 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
 };
 
 /*
- * camss_of_parse_endpoint_node - Parse port endpoint node
- * @dev: Device
- * @node: Device node to be parsed
+ * camss_parse_endpoint_node - Parse port endpoint node
+ * @dev: CAMSS device
+ * @ep: Device endpoint to be parsed
  * @csd: Parsed data from port endpoint node
  *
  * Return 0 on success or a negative error code on failure
  */
-static int camss_of_parse_endpoint_node(struct device *dev,
-					struct device_node *node,
-					struct camss_async_subdev *csd)
+static int camss_parse_endpoint_node(struct device *dev,
+				     struct fwnode_handle *ep,
+				     struct camss_async_subdev *csd)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
@@ -4039,7 +4039,7 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	unsigned int i;
 	int ret;
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &vep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
 		return ret;
 
@@ -4074,49 +4074,46 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 }
 
 /*
- * camss_of_parse_ports - Parse ports node
- * @dev: Device
- * @notifier: v4l2_device notifier data
+ * camss_parse_ports - Parse ports node
+ * @dev: CAMSS device
  *
- * Return number of "port" nodes found in "ports" node
+ * Return 0 on success or a negative error code on failure
  */
-static int camss_of_parse_ports(struct camss *camss)
+static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
-	struct device_node *node = NULL;
-	struct device_node *remote = NULL;
-	int ret, num_subdevs = 0;
+	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	int ret;
 
-	for_each_endpoint_of_node(dev->of_node, node) {
+	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct camss_async_subdev *csd;
+		struct fwnode_handle *remote;
 
-		remote = of_graph_get_remote_port_parent(node);
+		remote = fwnode_graph_get_remote_port_parent(ep);
 		if (!remote) {
 			dev_err(dev, "Cannot get remote parent\n");
 			ret = -EINVAL;
 			goto err_cleanup;
 		}
 
-		csd = v4l2_async_nf_add_fwnode(&camss->notifier,
-					       of_fwnode_handle(remote),
+		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
 					       struct camss_async_subdev);
-		of_node_put(remote);
+		fwnode_handle_put(remote);
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
 		}
 
-		ret = camss_of_parse_endpoint_node(dev, node, csd);
+		ret = camss_parse_endpoint_node(dev, ep, csd);
 		if (ret < 0)
 			goto err_cleanup;
-
-		num_subdevs++;
 	}
 
-	return num_subdevs;
+	return 0;
 
 err_cleanup:
-	of_node_put(node);
+	fwnode_handle_put(ep);
+
 	return ret;
 }
 
@@ -4673,7 +4670,7 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	ret = camss_of_parse_ports(camss);
+	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
 
-- 
2.49.0


