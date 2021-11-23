Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14A345A22A
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 13:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235914AbhKWMHm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 07:07:42 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:43645 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234506AbhKWMHm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 07:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637669074; x=1669205074;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L94R/5oyscK+m2W5edY8qYBhH08owBiaV5LRhrC+uqs=;
  b=m45l8WoUhxNFIQxfSSGTnPZ/rQv0Ipr52rSJMAto6tOnEESY5SrceK8x
   VVt1LK8PLT2IwV/xLmYBp8DgY0JXpaXSo64WUlBNt5ITB6G7RTrL07mzG
   qa6nAtKUw/qUqM+63kgm3MBhxF9nAA2wfKqwc61kF0yxmKsevsrez7K0J
   7+j8tvYFcly8l2VqhKM0CR/7UcKYZpYWdl2BNZlIFqf1rwamRzhzNpoKo
   P2JDRmsqDyDBf4Ij0yIcmO4AIof7moRdrQFSddfCXq2TxDDQl1sjgP76t
   4M1dDI/E/hB4mxwCGO1qPXvHc6H5QiNKY7c6y7UcKb55QT+8YDvSzANTb
   Q==;
IronPort-SDR: GHl82/W/Njauqiyn6X3GR2lTwUSfH8pFf+jAIwRLvj+5ZZldmoozwe26ZESfyEzE3LURhoI36T
 VrJ5BQ07QN2j+ANEzWcQDUyUS63ZDkNJZAvVqo/LAry5Gxm0YROPaPtGgmQEeCMXQARPFntEXL
 2EV52ClLBBpSHNm2ae/Cv2pDOXpS+nnbvjhXlqEK8IxrbOz7RyR2MNbZQFTezjz8HekS4qOeR6
 oXgEwQi91cfsUthTP5CjpvUl99Ax8OmU7edzsKU0A+UhabNQ1H8NixRdizssgxihmuXQqxqecn
 5Afo6gmaNJvapLx7FlM84KFp
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="152921832"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2021 05:04:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 05:04:34 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 05:04:28 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <leonl@leopardimaging.com>, <luca@lucaceresoli.net>,
        <linux-media@vger.kernel.org>
CC:     <skomatineni@nvidia.com>, <sakari.ailus@linux.intel.com>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2] media: i2c: imx274: implement fwnode parsing
Date:   Tue, 23 Nov 2021 14:04:21 +0200
Message-ID: <20211123120421.602965-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
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
Changes in v2:
- changed v4l2_fwnode_endpoint_alloc_parse to v4l2_fwnode_endpoint_parse

 drivers/media/i2c/imx274.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index e31f006b10d9..2aa15b9c23cc 100644
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
+	ret = v4l2_fwnode_endpoint_parse(endpoint, &ep);
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

