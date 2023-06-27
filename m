Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D0E7402C3
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbjF0R6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbjF0R6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F113C30F3
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LogEO9LYFMKdnZ8UkMzJ4vpiEVgHI5Xo9kkfiIz+BK0=;
        b=JvvOK1tpN9MpFK7Z563bJpcTFfd6FQNkOXNPD/DIL4jcYfEc7yoUQuqkixnvk/9rPTWMac
        /bn1oEHSxvrJ0D7SYKg5cbMrGdhPOhvjy7QWlfryfOu7GbUdxu58O9UGNO355Y8ohx9IDg
        0pGPcO1ku5rG7wl1znYZrv2OSW/ti+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-60DT8kMJOQiDydkLF1zl0A-1; Tue, 27 Jun 2023 13:56:58 -0400
X-MC-Unique: 60DT8kMJOQiDydkLF1zl0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88AE8800159;
        Tue, 27 Jun 2023 17:56:57 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3A8BD200A3AD;
        Tue, 27 Jun 2023 17:56:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 08/12] media: ipu3-cio2: Add supported_sensors parameter to cio2_bridge_init()
Date:   Tue, 27 Jun 2023 19:56:38 +0200
Message-ID: <20230627175643.114778-9-hdegoede@redhat.com>
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

Add a supported_sensors parameter to cio2_bridge_init(), so that
cio2_bridge_init() can be used with other bridges which have been
tested with / support a different set of sensors.

This is a preparation patch for making the cio2-bridge code more generic
so that it can be shared with the atomisp driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 22 +++++++++++++---------
 drivers/media/pci/intel/ipu3/cio2-bridge.h |  1 +
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index b799053f4934..9da0f003af7b 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -36,6 +36,7 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	CIO2_SENSOR_CONFIG("INT3537", 1, 437000000),
 	/* Omnivision ov13b10 */
 	CIO2_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
+	{}
 };
 
 static const struct cio2_property_names prop_names = {
@@ -393,9 +394,9 @@ static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge)
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(cio2_supported_sensors); i++) {
+	for (i = 0; bridge->supported_sensors[i].hid; i++) {
 		const struct cio2_sensor_config *cfg =
-			&cio2_supported_sensors[i];
+			&bridge->supported_sensors[i];
 
 		ret = cio2_bridge_connect_sensor(cfg, bridge);
 		if (ret)
@@ -421,15 +422,15 @@ static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge)
  * acpi_dev_ready_for_enumeration() helper, like the i2c-core-acpi code does
  * for the sensors.
  */
-static int cio2_bridge_sensors_are_ready(void)
+static int cio2_bridge_sensors_are_ready(
+	const struct cio2_sensor_config *supported_sensors)
 {
 	struct acpi_device *adev;
 	bool ready = true;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(cio2_supported_sensors); i++) {
-		const struct cio2_sensor_config *cfg =
-			&cio2_supported_sensors[i];
+	for (i = 0; supported_sensors[i].hid; i++) {
+		const struct cio2_sensor_config *cfg = &supported_sensors[i];
 
 		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
 			if (!adev->status.enabled)
@@ -447,14 +448,15 @@ static int __cio2_bridge_init(
 	struct device *dev,
 	int (*parse_sensor_fwnode)(struct acpi_device *adev,
 				   struct cio2_sensor *sensor,
-				   const struct cio2_sensor_config *cfg))
+				   const struct cio2_sensor_config *cfg),
+	const struct cio2_sensor_config *supported_sensors)
 {
 	struct fwnode_handle *fwnode;
 	struct cio2_bridge *bridge;
 	unsigned int i;
 	int ret;
 
-	if (!cio2_bridge_sensors_are_ready())
+	if (!cio2_bridge_sensors_are_ready(supported_sensors))
 		return -EPROBE_DEFER;
 
 	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
@@ -466,6 +468,7 @@ static int __cio2_bridge_init(
 	bridge->cio2_hid_node.name = bridge->cio2_node_name;
 	bridge->dev = dev;
 	bridge->parse_sensor_fwnode = parse_sensor_fwnode;
+	bridge->supported_sensors = supported_sensors;
 
 	ret = software_node_register(&bridge->cio2_hid_node);
 	if (ret < 0) {
@@ -512,5 +515,6 @@ static int __cio2_bridge_init(
 
 int cio2_bridge_init(struct device *dev)
 {
-	return __cio2_bridge_init(dev, cio2_bridge_parse_sensor_fwnode);
+	return __cio2_bridge_init(dev, cio2_bridge_parse_sensor_fwnode,
+				  cio2_supported_sensors);
 }
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
index b596fae2dc1b..e646cb17ab20 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
@@ -145,6 +145,7 @@ struct cio2_bridge {
 	int (*parse_sensor_fwnode)(struct acpi_device *adev,
 				   struct cio2_sensor *sensor,
 				   const struct cio2_sensor_config *cfg);
+	const struct cio2_sensor_config *supported_sensors;
 	char cio2_node_name[ACPI_ID_LEN];
 	struct software_node cio2_hid_node;
 	u32 data_lanes[4];
-- 
2.41.0

