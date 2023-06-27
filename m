Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0C7B7402C0
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjF0R6D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbjF0R6A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FC12D4A
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lPHYAhnwx0D/YUkDucAHX508Omza4wkqVCLr7LtRCYk=;
        b=aXNFl6VIlBfVADyPxfQiOtfWm8bvDJkTIanhfP7rystMeyTl6rD6NvhU5CNxbIOqD1iQtM
        LivJ0t9bZ4bQAfhWJ4gyD4QMRe7l0IP3SRlPkVUE/dJFY64ob8SCJkjl9FFY9OsT8oKR6N
        accgxsy/QmC7XJdYK54picFSULz5sCc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-R5A84L-6MFu_rTzSSOKuvA-1; Tue, 27 Jun 2023 13:56:56 -0400
X-MC-Unique: R5A84L-6MFu_rTzSSOKuvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 075A03C0FC9B;
        Tue, 27 Jun 2023 17:56:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AC9D0200A3AD;
        Tue, 27 Jun 2023 17:56:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 07/12] media: ipu3-cio2: Add a parse_sensor_fwnode callback to cio2_bridge_init()
Date:   Tue, 27 Jun 2023 19:56:37 +0200
Message-ID: <20230627175643.114778-8-hdegoede@redhat.com>
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

Add a parse_sensor_fwnode callback to cio2_bridge_init(), so that
cio2_bridge_init() can be used with other sensor fwnode parse functions
then just cio2_bridge_parse_sensor_fwnode.

This is a preparation patch for making the cio2-bridge code more generic
so that it can be shared with the atomisp driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note to reviewers the wrapped __cio2_bridge_init() function goes away
(becomes a generic shared helper) later in this series
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 17 ++++++++++++++---
 drivers/media/pci/intel/ipu3/cio2-bridge.h |  3 +++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index b189c2adf858..b799053f4934 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -150,7 +150,8 @@ cio2_bridge_get_orientation(struct acpi_device *adev)
 }
 
 static int cio2_bridge_parse_sensor_fwnode(struct acpi_device *adev,
-					   struct cio2_sensor *sensor)
+					   struct cio2_sensor *sensor,
+					   const struct cio2_sensor_config *cfg)
 {
 	struct cio2_sensor_ssdb ssdb = {};
 	int ret;
@@ -344,7 +345,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 		sensor = &bridge->sensors[bridge->n_sensors];
 
-		ret = cio2_bridge_parse_sensor_fwnode(adev, sensor);
+		ret = bridge->parse_sensor_fwnode(adev, sensor, cfg);
 		if (ret)
 			goto err_put_adev;
 
@@ -442,7 +443,11 @@ static int cio2_bridge_sensors_are_ready(void)
 	return ready;
 }
 
-int cio2_bridge_init(struct device *dev)
+static int __cio2_bridge_init(
+	struct device *dev,
+	int (*parse_sensor_fwnode)(struct acpi_device *adev,
+				   struct cio2_sensor *sensor,
+				   const struct cio2_sensor_config *cfg))
 {
 	struct fwnode_handle *fwnode;
 	struct cio2_bridge *bridge;
@@ -460,6 +465,7 @@ int cio2_bridge_init(struct device *dev)
 		sizeof(bridge->cio2_node_name));
 	bridge->cio2_hid_node.name = bridge->cio2_node_name;
 	bridge->dev = dev;
+	bridge->parse_sensor_fwnode = parse_sensor_fwnode;
 
 	ret = software_node_register(&bridge->cio2_hid_node);
 	if (ret < 0) {
@@ -503,3 +509,8 @@ int cio2_bridge_init(struct device *dev)
 
 	return ret;
 }
+
+int cio2_bridge_init(struct device *dev)
+{
+	return __cio2_bridge_init(dev, cio2_bridge_parse_sensor_fwnode);
+}
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
index d53ce0c78e83..b596fae2dc1b 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
@@ -142,6 +142,9 @@ struct cio2_sensor {
 
 struct cio2_bridge {
 	struct device *dev;
+	int (*parse_sensor_fwnode)(struct acpi_device *adev,
+				   struct cio2_sensor *sensor,
+				   const struct cio2_sensor_config *cfg);
 	char cio2_node_name[ACPI_ID_LEN];
 	struct software_node cio2_hid_node;
 	u32 data_lanes[4];
-- 
2.41.0

