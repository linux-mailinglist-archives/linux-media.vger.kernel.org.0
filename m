Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C11FF7402BC
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbjF0R5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbjF0R5p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C98E30D8
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PmJGJf7PHFMYCPKvlc6eoiKx4hcI9rJSnVS9cs6J5XM=;
        b=ALu1Lvv+68u0YqatBX3+K6mUMXMXvB2ES/+Z+VqVOskhTqDw+1u6dXS50rc1PK5IR5uUz+
        uZlTzT6v157kvXbTRc+k+lgLSuoS/AOEDK/000uB2RE6593BKt2frXX827HIPG8zLd74kr
        OoSrkZEU2fJxENovhXX5U7UDZOZihMo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-wbT-lN8zNemno8N2ZqNTyQ-1; Tue, 27 Jun 2023 13:56:53 -0400
X-MC-Unique: wbT-lN8zNemno8N2ZqNTyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E87A61C08963;
        Tue, 27 Jun 2023 17:56:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 94506200B677;
        Tue, 27 Jun 2023 17:56:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 05/12] media: ipu3-cio2: Only keep PLD around while parsing
Date:   Tue, 27 Jun 2023 19:56:35 +0200
Message-ID: <20230627175643.114778-6-hdegoede@redhat.com>
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

There is no need to keep a reference to the PLD struct around,
it is only used once the get the sensor orientation.

Rename cio2_bridge_parse_orientation() to cio2_bridge_get_orientation()
and make it also get + put the PLD.

This is a preparation patch for making the cio2-bridge code more generic
so that it can be shared with the atomisp driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 51 ++++++++++++----------
 drivers/media/pci/intel/ipu3/cio2-bridge.h |  2 +-
 2 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 746c1dda31d1..741ef54f0d65 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -112,23 +112,40 @@ static u32 cio2_bridge_parse_rotation(struct cio2_sensor *sensor)
 	}
 }
 
-static enum v4l2_fwnode_orientation cio2_bridge_parse_orientation(struct cio2_sensor *sensor)
+static enum v4l2_fwnode_orientation
+cio2_bridge_get_orientation(struct acpi_device *adev)
 {
-	switch (sensor->pld->panel) {
+	enum v4l2_fwnode_orientation orientation;
+	struct acpi_pld_info *pld;
+	acpi_status status;
+
+	status = acpi_get_physical_device_location(adev->handle, &pld);
+	if (ACPI_FAILURE(status)) {
+		dev_warn(&adev->dev, "_PLD call failed using unknown orientation\n");
+		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
+	}
+
+	switch (pld->panel) {
 	case ACPI_PLD_PANEL_FRONT:
-		return V4L2_FWNODE_ORIENTATION_FRONT;
+		orientation = V4L2_FWNODE_ORIENTATION_FRONT;
+		break;
 	case ACPI_PLD_PANEL_BACK:
-		return V4L2_FWNODE_ORIENTATION_BACK;
+		orientation = V4L2_FWNODE_ORIENTATION_BACK;
+		break;
 	case ACPI_PLD_PANEL_TOP:
 	case ACPI_PLD_PANEL_LEFT:
 	case ACPI_PLD_PANEL_RIGHT:
 	case ACPI_PLD_PANEL_UNKNOWN:
-		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
+		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
+		break;
 	default:
-		dev_warn(&sensor->adev->dev, "Unknown _PLD panel value %d\n",
-			 sensor->pld->panel);
-		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
+		dev_warn(&adev->dev, "Unknown _PLD panel val %d\n", pld->panel);
+		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
+		break;
 	}
+
+	ACPI_FREE(pld);
+	return orientation;
 }
 
 static void cio2_bridge_create_fwnode_properties(
@@ -137,10 +154,8 @@ static void cio2_bridge_create_fwnode_properties(
 	const struct cio2_sensor_config *cfg)
 {
 	u32 rotation;
-	enum v4l2_fwnode_orientation orientation;
 
 	rotation = cio2_bridge_parse_rotation(sensor);
-	orientation = cio2_bridge_parse_orientation(sensor);
 
 	sensor->prop_names = prop_names;
 
@@ -155,7 +170,7 @@ static void cio2_bridge_create_fwnode_properties(
 					rotation);
 	sensor->dev_properties[2] = PROPERTY_ENTRY_U32(
 					sensor->prop_names.orientation,
-					orientation);
+					sensor->orientation);
 	if (sensor->ssdb.vcmtype) {
 		sensor->vcm_ref[0] =
 			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
@@ -279,7 +294,6 @@ static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
 	for (i = 0; i < bridge->n_sensors; i++) {
 		sensor = &bridge->sensors[i];
 		software_node_unregister_node_group(sensor->group);
-		ACPI_FREE(sensor->pld);
 		acpi_dev_put(sensor->adev);
 		i2c_unregister_device(sensor->vcm_i2c_client);
 	}
@@ -291,7 +305,6 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 	struct fwnode_handle *fwnode, *primary;
 	struct cio2_sensor *sensor;
 	struct acpi_device *adev;
-	acpi_status status;
 	int ret;
 
 	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
@@ -321,17 +334,13 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 			sensor->ssdb.vcmtype = 0;
 		}
 
-		status = acpi_get_physical_device_location(adev->handle, &sensor->pld);
-		if (ACPI_FAILURE(status)) {
-			ret = -ENODEV;
-			goto err_put_adev;
-		}
+		sensor->orientation = cio2_bridge_get_orientation(adev);
 
 		if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
 			dev_err(&adev->dev,
 				"Number of lanes in SSDB is invalid\n");
 			ret = -EINVAL;
-			goto err_free_pld;
+			goto err_put_adev;
 		}
 
 		cio2_bridge_create_fwnode_properties(sensor, bridge, cfg);
@@ -339,7 +348,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 		ret = software_node_register_node_group(sensor->group);
 		if (ret)
-			goto err_free_pld;
+			goto err_put_adev;
 
 		fwnode = software_node_fwnode(&sensor->swnodes[
 						      SWNODE_SENSOR_HID]);
@@ -365,8 +374,6 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 err_free_swnodes:
 	software_node_unregister_node_group(sensor->group);
-err_free_pld:
-	ACPI_FREE(sensor->pld);
 err_put_adev:
 	acpi_dev_put(adev);
 	return ret;
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
index 8045ceab899b..e42c5c3cf856 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
@@ -125,7 +125,7 @@ struct cio2_sensor {
 	struct cio2_node_names node_names;
 
 	struct cio2_sensor_ssdb ssdb;
-	struct acpi_pld_info *pld;
+	enum v4l2_fwnode_orientation orientation;
 
 	struct cio2_property_names prop_names;
 	struct property_entry ep_properties[5];
-- 
2.41.0

