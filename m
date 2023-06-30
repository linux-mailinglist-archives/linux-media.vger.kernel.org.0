Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAF5743A5D
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbjF3LIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbjF3LIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:08:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1630F5
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688123263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5MNLOy9lt+qXPeF34t3gqvDDkwckd4Gzz/dYOBCyw8I=;
        b=Mv+tdJdHg+iUsOF6ZPqM/rykhMqh6Z1B3bfosAtg54PfthyOCLWobLW3ViWpgJXLTc7wDu
        bclPrlkH4u4SLspORwW+rKGMxr2QLMKPzgbo4ZpBwuJhQOBx+B9kGkPW85KZdxSA/eBoCl
        d7Uw7MpOqK/UpaeHSDr0Wfi+ruAvRog=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-JzWYNiUNPumf3tTjvKqZxQ-1; Fri, 30 Jun 2023 07:07:18 -0400
X-MC-Unique: JzWYNiUNPumf3tTjvKqZxQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97A2A2932492;
        Fri, 30 Jun 2023 11:07:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0854D492B02;
        Fri, 30 Jun 2023 11:07:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 06/15] media: ipu-bridge: Store dev pointer in struct ipu_bridge
Date:   Fri, 30 Jun 2023 13:06:34 +0200
Message-ID: <20230630110643.209761-7-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-1-hdegoede@redhat.com>
References: <20230630110643.209761-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Store the dev pointer in struct ipu_bridge instead of passing it
around 3 levels deep.

This takes up slightly more memory but further patches in this series
add more data which needs to be passed around making passing
everything as arguments cumbersome and those further patches also
add data to struct ipu_bridge.

To be consistent with these upcoming patches also add
the dev pointer to struct ipu_bridge.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 15 +++++++--------
 drivers/media/pci/intel/ipu-bridge.h |  1 +
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 9027a8d2d176..8e91d9b3e0fe 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -286,8 +286,7 @@ static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
 }
 
 static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
-				     struct ipu_bridge *bridge,
-				     struct device *dev)
+				     struct ipu_bridge *bridge)
 {
 	struct fwnode_handle *fwnode, *primary;
 	struct ipu_sensor *sensor;
@@ -301,7 +300,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 
 		if (bridge->n_sensors >= IPU_MAX_PORTS) {
 			acpi_dev_put(adev);
-			dev_err(dev, "Exceeded available IPU ports\n");
+			dev_err(bridge->dev, "Exceeded available IPU ports\n");
 			return -EINVAL;
 		}
 
@@ -361,7 +360,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 
 		ipu_bridge_instantiate_vcm_i2c_client(sensor);
 
-		dev_info(dev, "Found supported sensor %s\n",
+		dev_info(bridge->dev, "Found supported sensor %s\n",
 			 acpi_dev_name(adev));
 
 		bridge->n_sensors++;
@@ -378,8 +377,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 	return ret;
 }
 
-static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge,
-				      struct device *dev)
+static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 {
 	unsigned int i;
 	int ret;
@@ -388,7 +386,7 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge,
 		const struct ipu_sensor_config *cfg =
 			&ipu_supported_sensors[i];
 
-		ret = ipu_bridge_connect_sensor(cfg, bridge, dev);
+		ret = ipu_bridge_connect_sensor(cfg, bridge);
 		if (ret)
 			goto err_unregister_sensors;
 	}
@@ -451,6 +449,7 @@ int ipu_bridge_init(struct device *dev)
 	strscpy(bridge->ipu_node_name, IPU_HID,
 		sizeof(bridge->ipu_node_name));
 	bridge->ipu_hid_node.name = bridge->ipu_node_name;
+	bridge->dev = dev;
 
 	ret = software_node_register(&bridge->ipu_hid_node);
 	if (ret < 0) {
@@ -468,7 +467,7 @@ int ipu_bridge_init(struct device *dev)
 	for (i = 0; i < IPU_MAX_LANES; i++)
 		bridge->data_lanes[i] = i + 1;
 
-	ret = ipu_bridge_connect_sensors(bridge, dev);
+	ret = ipu_bridge_connect_sensors(bridge);
 	if (ret || bridge->n_sensors == 0)
 		goto err_unregister_ipu;
 
diff --git a/drivers/media/pci/intel/ipu-bridge.h b/drivers/media/pci/intel/ipu-bridge.h
index 8c1437f252d2..6cb68e3344dc 100644
--- a/drivers/media/pci/intel/ipu-bridge.h
+++ b/drivers/media/pci/intel/ipu-bridge.h
@@ -136,6 +136,7 @@ struct ipu_sensor {
 };
 
 struct ipu_bridge {
+	struct device *dev;
 	char ipu_node_name[ACPI_ID_LEN];
 	struct software_node ipu_hid_node;
 	u32 data_lanes[4];
-- 
2.41.0

