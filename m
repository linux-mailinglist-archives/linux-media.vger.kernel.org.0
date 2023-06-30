Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB83743AB1
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjF3LVz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbjF3LVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:21:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E008F5
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688124067;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9DYvV0OvjESZXnynIRWO/dWm7ZebngYcslB5yGYJSFI=;
        b=DGHpjWjjVKX/nkJFpSYqtoRPEC8hBvOX6+iEkpI/BB6MUptLTsxpvYOLUprNZ5KtOnZ2/b
        pWEG/p9EK+dgf5ruXvegukmkT4jTGfE9njYSN4sys0UYKbUuwwIpGpnpJWc8XFx3NqgZmx
        Jg+Dx4KJ/TNQKEtccZvVL2veOKfsLfk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-ymcK-mTIO3yy1SiS00u7ug-1; Fri, 30 Jun 2023 07:21:02 -0400
X-MC-Unique: ymcK-mTIO3yy1SiS00u7ug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5CAF1044597;
        Fri, 30 Jun 2023 11:07:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3AEB6492B02;
        Fri, 30 Jun 2023 11:07:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 10/15] media: ipu-bridge: Add a parse_sensor_fwnode callback to ipu_bridge_init()
Date:   Fri, 30 Jun 2023 13:06:38 +0200
Message-ID: <20230630110643.209761-11-hdegoede@redhat.com>
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

Add a parse_sensor_fwnode callback to ipu_bridge_init(), so that
ipu_bridge_init() can be used with other sensor fwnode parse functions
then just ipu_bridge_parse_ssdb().

This will allow the ipu3-bridge code to also be used by the atomisp
driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c     | 11 +++++++----
 drivers/media/pci/intel/ipu-bridge.h     | 10 ++++++++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c |  2 +-
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 891dc0b7c960..d60992fbdbeb 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -148,8 +148,7 @@ static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_dev
 	return orientation;
 }
 
-static int ipu_bridge_parse_ssdb(struct acpi_device *adev,
-				 struct ipu_sensor *sensor)
+int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 {
 	struct ipu_sensor_ssdb ssdb = {};
 	int ret;
@@ -179,6 +178,7 @@ static int ipu_bridge_parse_ssdb(struct acpi_device *adev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(ipu_bridge_parse_ssdb, INTEL_IPU_BRIDGE);
 
 static void ipu_bridge_create_fwnode_properties(
 	struct ipu_sensor *sensor,
@@ -343,7 +343,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 
 		sensor = &bridge->sensors[bridge->n_sensors];
 
-		ret = ipu_bridge_parse_ssdb(adev, sensor);
+		ret = bridge->parse_sensor_fwnode(adev, sensor);
 		if (ret)
 			goto err_put_adev;
 
@@ -441,7 +441,9 @@ static int ipu_bridge_sensors_are_ready(void)
 	return ready;
 }
 
-int ipu_bridge_init(struct device *dev)
+int ipu_bridge_init(struct device *dev,
+		    int (*parse_sensor_fwnode)(struct acpi_device *adev,
+					       struct ipu_sensor *sensor))
 {
 	struct fwnode_handle *fwnode;
 	struct ipu_bridge *bridge;
@@ -459,6 +461,7 @@ int ipu_bridge_init(struct device *dev)
 		sizeof(bridge->ipu_node_name));
 	bridge->ipu_hid_node.name = bridge->ipu_node_name;
 	bridge->dev = dev;
+	bridge->parse_sensor_fwnode = parse_sensor_fwnode;
 
 	ret = software_node_register(&bridge->ipu_hid_node);
 	if (ret < 0) {
diff --git a/drivers/media/pci/intel/ipu-bridge.h b/drivers/media/pci/intel/ipu-bridge.h
index a8b89c4b95bc..969d8d7d6b93 100644
--- a/drivers/media/pci/intel/ipu-bridge.h
+++ b/drivers/media/pci/intel/ipu-bridge.h
@@ -142,6 +142,8 @@ struct ipu_sensor {
 
 struct ipu_bridge {
 	struct device *dev;
+	int (*parse_sensor_fwnode)(struct acpi_device *adev,
+				   struct ipu_sensor *sensor);
 	char ipu_node_name[ACPI_ID_LEN];
 	struct software_node ipu_hid_node;
 	u32 data_lanes[4];
@@ -150,9 +152,13 @@ struct ipu_bridge {
 };
 
 #if IS_ENABLED(CONFIG_IPU_BRIDGE)
-int ipu_bridge_init(struct device *dev);
+int ipu_bridge_init(struct device *dev,
+		    int (*parse_sensor_fwnode)(struct acpi_device *adev,
+					       struct ipu_sensor *sensor));
+int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor);
 #else
-static inline int ipu_bridge_init(struct device *dev) { return 0; }
+/* Use a define to avoid the parse_sensor_fwnode arg getting evaluated */
+#define ipu_bridge_init(dev, parse_sensor_fwnode)	(0)
 #endif
 
 #endif
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 4068fa0a5ecf..26c4c1375990 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1725,7 +1725,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 			return -EINVAL;
 		}
 
-		r = ipu_bridge_init(dev);
+		r = ipu_bridge_init(dev, ipu_bridge_parse_ssdb);
 		if (r)
 			return r;
 	}
-- 
2.41.0

