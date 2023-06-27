Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA3D7402BE
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbjF0R57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbjF0R5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971BF2D7D
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gKtDMJU4mEJurNtFzATwewadf+bZ067mPE4miPWSVN4=;
        b=T9kVtpDTSlU8uHU3IW4NxaC0Et8Py5yrnTjeikXbgBW2HGWno+icQzcUPRCaABWuR7cJ4P
        S7xF/pxr0EakxGTHsFOi6dM8ie9APoirKs6cICcUOgfCL620S5Px+WkPffqZB+cHfOsIZg
        +4FSk76PNHjdAmrFfUYO+XNQNEst/2U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-LLMfnjhqNHOsP91LCCU6Tw-1; Tue, 27 Jun 2023 13:56:50 -0400
X-MC-Unique: LLMfnjhqNHOsP91LCCU6Tw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D29243C0FCA0;
        Tue, 27 Jun 2023 17:56:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 84831200B677;
        Tue, 27 Jun 2023 17:56:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 03/12] media: ipu3-cio2: Make cio2_bridge_init() take a regular struct device as argument
Date:   Tue, 27 Jun 2023 19:56:33 +0200
Message-ID: <20230627175643.114778-4-hdegoede@redhat.com>
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

Make cio2_bridge_init() take a regular struct device, rather then
a pci_dev as argument.

This is a preparation patch for making the cio2-bridge code more generic
so that it can be shared with the atomisp driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c    | 16 +++++++---------
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h      |  4 ++--
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 0f7adca9d6f9..72a28844dfdb 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -4,7 +4,6 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
-#include <linux/pci.h>
 #include <linux/property.h>
 #include <media/v4l2-fwnode.h>
 
@@ -288,7 +287,7 @@ static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
 
 static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 				      struct cio2_bridge *bridge,
-				      struct pci_dev *cio2)
+				      struct device *dev)
 {
 	struct fwnode_handle *fwnode, *primary;
 	struct cio2_sensor *sensor;
@@ -302,7 +301,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 		if (bridge->n_sensors >= CIO2_NUM_PORTS) {
 			acpi_dev_put(adev);
-			dev_err(&cio2->dev, "Exceeded available CIO2 ports\n");
+			dev_err(dev, "Exceeded available CIO2 ports\n");
 			return -EINVAL;
 		}
 
@@ -357,7 +356,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 		cio2_bridge_instantiate_vcm_i2c_client(sensor);
 
-		dev_info(&cio2->dev, "Found supported sensor %s\n",
+		dev_info(dev, "Found supported sensor %s\n",
 			 acpi_dev_name(adev));
 
 		bridge->n_sensors++;
@@ -375,7 +374,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 }
 
 static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge,
-				       struct pci_dev *cio2)
+				       struct device *dev)
 {
 	unsigned int i;
 	int ret;
@@ -384,7 +383,7 @@ static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge,
 		const struct cio2_sensor_config *cfg =
 			&cio2_supported_sensors[i];
 
-		ret = cio2_bridge_connect_sensor(cfg, bridge, cio2);
+		ret = cio2_bridge_connect_sensor(cfg, bridge, dev);
 		if (ret)
 			goto err_unregister_sensors;
 	}
@@ -430,9 +429,8 @@ static int cio2_bridge_sensors_are_ready(void)
 	return ready;
 }
 
-int cio2_bridge_init(struct pci_dev *cio2)
+int cio2_bridge_init(struct device *dev)
 {
-	struct device *dev = &cio2->dev;
 	struct fwnode_handle *fwnode;
 	struct cio2_bridge *bridge;
 	unsigned int i;
@@ -465,7 +463,7 @@ int cio2_bridge_init(struct pci_dev *cio2)
 	for (i = 0; i < CIO2_MAX_LANES; i++)
 		bridge->data_lanes[i] = i + 1;
 
-	ret = cio2_bridge_connect_sensors(bridge, cio2);
+	ret = cio2_bridge_connect_sensors(bridge, dev);
 	if (ret || bridge->n_sensors == 0)
 		goto err_unregister_cio2;
 
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 34984a7474ed..afc3255b5eb8 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1724,7 +1724,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 			return -EINVAL;
 		}
 
-		r = cio2_bridge_init(pci_dev);
+		r = cio2_bridge_init(dev);
 		if (r)
 			return r;
 	}
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index 3a1f394e05aa..7ff7915f9823 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -460,9 +460,9 @@ static inline struct cio2_queue *vb2q_to_cio2_queue(struct vb2_queue *vq)
 }
 
 #if IS_ENABLED(CONFIG_CIO2_BRIDGE)
-int cio2_bridge_init(struct pci_dev *cio2);
+int cio2_bridge_init(struct device *dev);
 #else
-static inline int cio2_bridge_init(struct pci_dev *cio2) { return 0; }
+static inline int cio2_bridge_init(struct device *dev) { return 0; }
 #endif
 
 #endif
-- 
2.41.0

