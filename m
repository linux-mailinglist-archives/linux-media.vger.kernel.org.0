Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7813F7402BB
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbjF0R5y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjF0R5p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC83297C
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IXspoUMbXahzIwGsmqD0Xy6ILU3RyqBjkkqTnQxjZu4=;
        b=RzfkTDDELg8I9Vy4SNF/vnE/BjUXt86zx577qBpO6SvYaBqop0ITZjn61fX21JYgryhj9i
        6FCSYZQdN+uVL+gPNXYBeqtYiZE49Yf4wxom81oYydq1/gmX0TKzOe27YlAPorhHj8EI3/
        kOWq+Ec1J9zN5C31NrI2WnZRwPT2VNw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-AClckXdLN6iCSoHSBqW9eQ-1; Tue, 27 Jun 2023 13:56:52 -0400
X-MC-Unique: AClckXdLN6iCSoHSBqW9eQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 610E1280BC51;
        Tue, 27 Jun 2023 17:56:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 125D3200A3AD;
        Tue, 27 Jun 2023 17:56:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 04/12] media: ipu3-cio2: Store dev pointer in struct cio2_bridge
Date:   Tue, 27 Jun 2023 19:56:34 +0200
Message-ID: <20230627175643.114778-5-hdegoede@redhat.com>
In-Reply-To: <20230627175643.114778-1-hdegoede@redhat.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Store the dev pointer in struct cio2_bridge instead of passing it
around 3 levels deep.

This takes up slightly more memory but further patches in this series
add more data which needs to be passed around making passing
everything as arguments cumbersome and those further patches also
add data to struct cio2_bridge.

To be consistent with these upcoming patches also add
the dev pointer to struct cio2_bridge.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 15 +++++++--------
 drivers/media/pci/intel/ipu3/cio2-bridge.h |  1 +
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 72a28844dfdb..746c1dda31d1 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -286,8 +286,7 @@ static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
 }
 
 static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
-				      struct cio2_bridge *bridge,
-				      struct device *dev)
+				      struct cio2_bridge *bridge)
 {
 	struct fwnode_handle *fwnode, *primary;
 	struct cio2_sensor *sensor;
@@ -301,7 +300,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 		if (bridge->n_sensors >= CIO2_NUM_PORTS) {
 			acpi_dev_put(adev);
-			dev_err(dev, "Exceeded available CIO2 ports\n");
+			dev_err(bridge->dev, "Exceeded available CIO2 ports\n");
 			return -EINVAL;
 		}
 
@@ -356,7 +355,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 		cio2_bridge_instantiate_vcm_i2c_client(sensor);
 
-		dev_info(dev, "Found supported sensor %s\n",
+		dev_info(bridge->dev, "Found supported sensor %s\n",
 			 acpi_dev_name(adev));
 
 		bridge->n_sensors++;
@@ -373,8 +372,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 	return ret;
 }
 
-static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge,
-				       struct device *dev)
+static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge)
 {
 	unsigned int i;
 	int ret;
@@ -383,7 +381,7 @@ static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge,
 		const struct cio2_sensor_config *cfg =
 			&cio2_supported_sensors[i];
 
-		ret = cio2_bridge_connect_sensor(cfg, bridge, dev);
+		ret = cio2_bridge_connect_sensor(cfg, bridge);
 		if (ret)
 			goto err_unregister_sensors;
 	}
@@ -446,6 +444,7 @@ int cio2_bridge_init(struct device *dev)
 	strscpy(bridge->cio2_node_name, CIO2_HID,
 		sizeof(bridge->cio2_node_name));
 	bridge->cio2_hid_node.name = bridge->cio2_node_name;
+	bridge->dev = dev;
 
 	ret = software_node_register(&bridge->cio2_hid_node);
 	if (ret < 0) {
@@ -463,7 +462,7 @@ int cio2_bridge_init(struct device *dev)
 	for (i = 0; i < CIO2_MAX_LANES; i++)
 		bridge->data_lanes[i] = i + 1;
 
-	ret = cio2_bridge_connect_sensors(bridge, dev);
+	ret = cio2_bridge_connect_sensors(bridge);
 	if (ret || bridge->n_sensors == 0)
 		goto err_unregister_cio2;
 
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
index a824b96bcdf2..8045ceab899b 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
@@ -137,6 +137,7 @@ struct cio2_sensor {
 };
 
 struct cio2_bridge {
+	struct device *dev;
 	char cio2_node_name[ACPI_ID_LEN];
 	struct software_node cio2_hid_node;
 	u32 data_lanes[4];
-- 
2.41.0

