Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D4B743A55
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbjF3LIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjF3LIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C203A87
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688123229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kxDjDQhp4n8jjnShXZ1pjXuN2r1RfrRtpWsT2XOEpQU=;
        b=WUxj9KC/aAfs0/cc9T+yTPMq/8lq42lJ99/6jfy+Ks7w6iku7eIK1uVmYecSWUTW80DfQA
        90F5klMxbLFt8FDlUkULHH2NHkDofpCqKWgdrY1OvFrfIQoYKMKvsRQLDsTDHZZ5f4jN5r
        BRnTZLhaXg1QQYsl5icdkir71xJnjYY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-S7oS2TYoPBmUsetP26ejOw-1; Fri, 30 Jun 2023 07:07:05 -0400
X-MC-Unique: S7oS2TYoPBmUsetP26ejOw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6CDC10504AE;
        Fri, 30 Jun 2023 11:07:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7C353492B02;
        Fri, 30 Jun 2023 11:06:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 05/15] media: ipu-bridge: Make ipu_bridge_init() take a regular struct device as argument
Date:   Fri, 30 Jun 2023 13:06:33 +0200
Message-ID: <20230630110643.209761-6-hdegoede@redhat.com>
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

Make ipu_bridge_init() take a regular struct device, rather then
a pci_dev as argument.

This is a preparation patch for making the ipu-bridge code more generic
so that it can be shared with the atomisp driver.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c     | 16 +++++++---------
 drivers/media/pci/intel/ipu-bridge.h     |  4 ++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c |  2 +-
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 97b544736af2..9027a8d2d176 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -4,7 +4,6 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
-#include <linux/pci.h>
 #include <linux/property.h>
 #include <media/v4l2-fwnode.h>
 
@@ -288,7 +287,7 @@ static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
 
 static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 				     struct ipu_bridge *bridge,
-				     struct pci_dev *ipu)
+				     struct device *dev)
 {
 	struct fwnode_handle *fwnode, *primary;
 	struct ipu_sensor *sensor;
@@ -302,7 +301,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 
 		if (bridge->n_sensors >= IPU_MAX_PORTS) {
 			acpi_dev_put(adev);
-			dev_err(&ipu->dev, "Exceeded available IPU ports\n");
+			dev_err(dev, "Exceeded available IPU ports\n");
 			return -EINVAL;
 		}
 
@@ -362,7 +361,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 
 		ipu_bridge_instantiate_vcm_i2c_client(sensor);
 
-		dev_info(&ipu->dev, "Found supported sensor %s\n",
+		dev_info(dev, "Found supported sensor %s\n",
 			 acpi_dev_name(adev));
 
 		bridge->n_sensors++;
@@ -380,7 +379,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 }
 
 static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge,
-				      struct pci_dev *ipu)
+				      struct device *dev)
 {
 	unsigned int i;
 	int ret;
@@ -389,7 +388,7 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge,
 		const struct ipu_sensor_config *cfg =
 			&ipu_supported_sensors[i];
 
-		ret = ipu_bridge_connect_sensor(cfg, bridge, ipu);
+		ret = ipu_bridge_connect_sensor(cfg, bridge, dev);
 		if (ret)
 			goto err_unregister_sensors;
 	}
@@ -435,9 +434,8 @@ static int ipu_bridge_sensors_are_ready(void)
 	return ready;
 }
 
-int ipu_bridge_init(struct pci_dev *ipu)
+int ipu_bridge_init(struct device *dev)
 {
-	struct device *dev = &ipu->dev;
 	struct fwnode_handle *fwnode;
 	struct ipu_bridge *bridge;
 	unsigned int i;
@@ -470,7 +468,7 @@ int ipu_bridge_init(struct pci_dev *ipu)
 	for (i = 0; i < IPU_MAX_LANES; i++)
 		bridge->data_lanes[i] = i + 1;
 
-	ret = ipu_bridge_connect_sensors(bridge, ipu);
+	ret = ipu_bridge_connect_sensors(bridge, dev);
 	if (ret || bridge->n_sensors == 0)
 		goto err_unregister_ipu;
 
diff --git a/drivers/media/pci/intel/ipu-bridge.h b/drivers/media/pci/intel/ipu-bridge.h
index 6cce712a0f34..8c1437f252d2 100644
--- a/drivers/media/pci/intel/ipu-bridge.h
+++ b/drivers/media/pci/intel/ipu-bridge.h
@@ -144,9 +144,9 @@ struct ipu_bridge {
 };
 
 #if IS_ENABLED(CONFIG_IPU_BRIDGE)
-int ipu_bridge_init(struct pci_dev *ipu);
+int ipu_bridge_init(struct device *dev);
 #else
-static inline int ipu_bridge_init(struct pci_dev *ipu) { return 0; }
+static inline int ipu_bridge_init(struct device *dev) { return 0; }
 #endif
 
 #endif
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index dc09fbdb062b..4068fa0a5ecf 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1725,7 +1725,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 			return -EINVAL;
 		}
 
-		r = ipu_bridge_init(pci_dev);
+		r = ipu_bridge_init(dev);
 		if (r)
 			return r;
 	}
-- 
2.41.0

