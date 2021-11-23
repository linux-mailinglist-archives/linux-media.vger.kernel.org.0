Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CBA45A11D
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 12:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235867AbhKWLTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 06:19:00 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:13242 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233966AbhKWLTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 06:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637666152; x=1669202152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+FDMRuH0cV/0MvMxRvV0la9igxDPLQ2v4ncIXHeWANw=;
  b=JEJfedeSoImALmY9JTJ9vDsWnFprdGjOgS+shPoINoUMZAYnMDoZYoYj
   +1UQw1Sz16ofqQMosyFxR0OVZ0f+QIadXP6Ubu+pku5+Oblwot/hRyG9L
   U6tB0pJbBDknhN0/0LjXDNJJaNeonFpXbDkQlafX9dBIMGZ7Wysy2peUf
   8uq2yiIPXnOiYdq7k0Ze5XmJF9SYZaZDeOtcusJz/MjZ8ZXNFJpHs2fDx
   kYM7GlBwJk8i5Mg4NJAV1WB1MTO0Wvw/zFH918qn1r9HoTziRdRQQRgUs
   AZ4cgKTRNKrae7PkMW1fbkxSDwFcCNEH3+sO9FgKMD9Kzczyeh5umQiuf
   g==;
IronPort-SDR: OTtBl3RBa6zRHHPp+9Nf6GysJJvTVd252YXIw+kGm6B4Qh0Pr0DVTLuL4jo8IYZoF9fNJsMMBF
 yjkUZKpus9lM8FR+2uA28ti8LQiFISC2UAjR8vR6WMR90SOr95BA04WUO3glsrV8Z7P+/50PUn
 ZKR8dWl9vJgXT7Tz10pSnf8qCIL1x3iGq3wJIvhjdsKjTHMI3axC5htXZOOE+IuBe3kelQ6H46
 QxMxAgB7gVw14fFQW6bacMqa7zwOTF3b2tB/Qxzy/yGEkLYv+ENrACXlBv1jU3y27eo4qR6ScG
 IaNADGm76zeEbyeqdmnlzaWn
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="77303387"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2021 04:15:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 04:15:50 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 04:15:41 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>
CC:     <skomatineni@nvidia.com>, <sakari.ailus@linux.intel.com>,
        <luca@lucaceresoli.net>, <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 2/2] media: i2c: imx274: implement fwnode parsing
Date:   Tue, 23 Nov 2021 13:15:21 +0200
Message-ID: <20211123111521.593863-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123111521.593863-1-eugen.hristev@microchip.com>
References: <20211123111521.593863-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement fwnode parsing at probe time.
Check if the bus and number of lanes are supported.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/i2c/imx274.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index e31f006b10d9..774912f44efe 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -27,6 +27,7 @@
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
 /*
@@ -1957,6 +1958,41 @@ static const struct i2c_device_id imx274_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, imx274_id);
 
+static int imx274_fwnode_parse(struct device *dev)
+{
+	struct fwnode_handle *endpoint;
+	/* Only CSI2 is supported */
+	struct v4l2_fwnode_endpoint ep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	int ret;
+
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint) {
+		dev_err(dev, "Endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
+	fwnode_handle_put(endpoint);
+	if (ret == -ENXIO) {
+		dev_err(dev, "Unsupported bus type, should be CSI2\n");
+		return ret;
+	} else if (ret) {
+		dev_err(dev, "Parsing endpoint node failed %d\n", ret);
+		return ret;
+	}
+
+	/* Check number of data lanes, only 4 lanes supported */
+	if (ep.bus.mipi_csi2.num_data_lanes != 4) {
+		dev_err(dev, "Invalid data lanes: %d\n",
+			ep.bus.mipi_csi2.num_data_lanes);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int imx274_probe(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd;
@@ -1971,6 +2007,10 @@ static int imx274_probe(struct i2c_client *client)
 
 	mutex_init(&imx274->lock);
 
+	ret = imx274_fwnode_parse(dev);
+	if (ret)
+		return ret;
+
 	imx274->inck = devm_clk_get_optional(dev, "inck");
 	if (IS_ERR(imx274->inck))
 		return PTR_ERR(imx274->inck);
-- 
2.25.1

