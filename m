Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7887C7402BF
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjF0R6C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbjF0R57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF2F30EE
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888618;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=87bfuPHXZ79fWnXMdkGohubTyPN+ikZ3NxNN00IHwk0=;
        b=ErHS6ZckibUyaxf7mRSX6CYT8xRRsp6w3FCOOWV+VVvoDBEjeel5OtPp5ltPl7TP+IO2U5
        7yObPRxhAx27Q9Sb5ngeQX91hl96cqTqP0PHoXm/VpXPFVa21BzF5sLyaScX4C9AL54Hz/
        75iANpmVTcUQ1PqYoQCKpChFtnV4adY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-aUtsP1BZPR-d9CvVEBLtug-1; Tue, 27 Jun 2023 13:56:55 -0400
X-MC-Unique: aUtsP1BZPR-d9CvVEBLtug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79DE580027F;
        Tue, 27 Jun 2023 17:56:54 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 28DD7200A3AD;
        Tue, 27 Jun 2023 17:56:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 06/12] media: ipu3-cio2: Add a cio2_bridge_parse_sensor_fwnode() helper function
Date:   Tue, 27 Jun 2023 19:56:36 +0200
Message-ID: <20230627175643.114778-7-hdegoede@redhat.com>
In-Reply-To: <20230627175643.114778-1-hdegoede@redhat.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code to go from ACPI sensor info to a fwnode-tree with connector
nodes and endpoint properties is 99% the same for the atomisp2 and
the IPU3.

The main difference is that atomisp2 devices do not have a SSDB table
with various info.

Abstract out the parsing of the sensor's ACPI fwnode into a helper
function and store the parsed results, rather then the raw SSDB
in struct cio2_sensor.

This is a preparation patch for making the cio2-bridge code more generic
so that it can be shared with the atomisp driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 94 ++++++++++++----------
 drivers/media/pci/intel/ipu3/cio2-bridge.h |  6 +-
 2 files changed, 56 insertions(+), 44 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 741ef54f0d65..b189c2adf858 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -97,17 +97,18 @@ static int cio2_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 	return ret;
 }
 
-static u32 cio2_bridge_parse_rotation(struct cio2_sensor *sensor)
+static u32 cio2_bridge_parse_rotation(struct acpi_device *adev,
+				      struct cio2_sensor_ssdb *ssdb)
 {
-	switch (sensor->ssdb.degree) {
+	switch (ssdb->degree) {
 	case CIO2_SENSOR_ROTATION_NORMAL:
 		return 0;
 	case CIO2_SENSOR_ROTATION_INVERTED:
 		return 180;
 	default:
-		dev_warn(&sensor->adev->dev,
+		dev_warn(&adev->dev,
 			 "Unknown rotation %d. Assume 0 degree rotation\n",
-			 sensor->ssdb.degree);
+			 ssdb->degree);
 		return 0;
 	}
 }
@@ -148,15 +149,43 @@ cio2_bridge_get_orientation(struct acpi_device *adev)
 	return orientation;
 }
 
+static int cio2_bridge_parse_sensor_fwnode(struct acpi_device *adev,
+					   struct cio2_sensor *sensor)
+{
+	struct cio2_sensor_ssdb ssdb = {};
+	int ret;
+
+	ret = cio2_bridge_read_acpi_buffer(adev, "SSDB", &ssdb, sizeof(ssdb));
+	if (ret)
+		return ret;
+
+	if (ssdb.vcmtype > ARRAY_SIZE(cio2_vcm_types)) {
+		dev_warn(&adev->dev, "Unknown VCM type %d\n", ssdb.vcmtype);
+		ssdb.vcmtype = 0;
+	}
+
+	if (ssdb.lanes > CIO2_MAX_LANES) {
+		dev_err(&adev->dev, "Number of lanes in SSDB is invalid\n");
+		return -EINVAL;
+	}
+
+	sensor->link = ssdb.link;
+	sensor->lanes = ssdb.lanes;
+	sensor->mclkspeed = ssdb.mclkspeed;
+	sensor->rotation = cio2_bridge_parse_rotation(adev, &ssdb);
+	sensor->orientation = cio2_bridge_get_orientation(adev);
+
+	if (ssdb.vcmtype)
+		sensor->vcm_type = cio2_vcm_types[ssdb.vcmtype - 1];
+
+	return 0;
+}
+
 static void cio2_bridge_create_fwnode_properties(
 	struct cio2_sensor *sensor,
 	struct cio2_bridge *bridge,
 	const struct cio2_sensor_config *cfg)
 {
-	u32 rotation;
-
-	rotation = cio2_bridge_parse_rotation(sensor);
-
 	sensor->prop_names = prop_names;
 
 	sensor->local_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_CIO2_ENDPOINT]);
@@ -164,14 +193,14 @@ static void cio2_bridge_create_fwnode_properties(
 
 	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(
 					sensor->prop_names.clock_frequency,
-					sensor->ssdb.mclkspeed);
+					sensor->mclkspeed);
 	sensor->dev_properties[1] = PROPERTY_ENTRY_U32(
 					sensor->prop_names.rotation,
-					rotation);
+					sensor->rotation);
 	sensor->dev_properties[2] = PROPERTY_ENTRY_U32(
 					sensor->prop_names.orientation,
 					sensor->orientation);
-	if (sensor->ssdb.vcmtype) {
+	if (sensor->vcm_type) {
 		sensor->vcm_ref[0] =
 			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
 		sensor->dev_properties[3] =
@@ -183,8 +212,7 @@ static void cio2_bridge_create_fwnode_properties(
 					V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
 	sensor->ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
-					bridge->data_lanes,
-					sensor->ssdb.lanes);
+					bridge->data_lanes, sensor->lanes);
 	sensor->ep_properties[2] = PROPERTY_ENTRY_REF_ARRAY(
 					sensor->prop_names.remote_endpoint,
 					sensor->local_ref);
@@ -197,8 +225,7 @@ static void cio2_bridge_create_fwnode_properties(
 
 	sensor->cio2_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
-					bridge->data_lanes,
-					sensor->ssdb.lanes);
+					bridge->data_lanes, sensor->lanes);
 	sensor->cio2_properties[1] = PROPERTY_ENTRY_REF_ARRAY(
 					sensor->prop_names.remote_endpoint,
 					sensor->remote_ref);
@@ -208,18 +235,17 @@ static void cio2_bridge_init_swnode_names(struct cio2_sensor *sensor)
 {
 	snprintf(sensor->node_names.remote_port,
 		 sizeof(sensor->node_names.remote_port),
-		 SWNODE_GRAPH_PORT_NAME_FMT, sensor->ssdb.link);
+		 SWNODE_GRAPH_PORT_NAME_FMT, sensor->link);
 	snprintf(sensor->node_names.port,
 		 sizeof(sensor->node_names.port),
 		 SWNODE_GRAPH_PORT_NAME_FMT, 0); /* Always port 0 */
 	snprintf(sensor->node_names.endpoint,
 		 sizeof(sensor->node_names.endpoint),
 		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
-	if (sensor->ssdb.vcmtype) {
-		/* append ssdb.link to distinguish nodes with same model VCM */
+	if (sensor->vcm_type) {
+		/* append link to distinguish nodes with same model VCM */
 		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
-			 "%s-%u", cio2_vcm_types[sensor->ssdb.vcmtype - 1],
-			 sensor->ssdb.link);
+			 "%s-%u", sensor->vcm_type, sensor->link);
 	}
 }
 
@@ -232,7 +258,7 @@ static void cio2_bridge_init_swnode_group(struct cio2_sensor *sensor)
 	sensor->group[SWNODE_SENSOR_ENDPOINT] = &nodes[SWNODE_SENSOR_ENDPOINT];
 	sensor->group[SWNODE_CIO2_PORT] = &nodes[SWNODE_CIO2_PORT];
 	sensor->group[SWNODE_CIO2_ENDPOINT] = &nodes[SWNODE_CIO2_ENDPOINT];
-	if (sensor->ssdb.vcmtype)
+	if (sensor->vcm_type)
 		sensor->group[SWNODE_VCM] =  &nodes[SWNODE_VCM];
 }
 
@@ -267,13 +293,12 @@ static void cio2_bridge_instantiate_vcm_i2c_client(struct cio2_sensor *sensor)
 	struct i2c_board_info board_info = { };
 	char name[16];
 
-	if (!sensor->ssdb.vcmtype)
+	if (!sensor->vcm_type)
 		return;
 
 	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor->adev));
 	board_info.dev_name = name;
-	strscpy(board_info.type, cio2_vcm_types[sensor->ssdb.vcmtype - 1],
-		ARRAY_SIZE(board_info.type));
+	strscpy(board_info.type, sensor->vcm_type, ARRAY_SIZE(board_info.type));
 	board_info.swnode = &sensor->swnodes[SWNODE_VCM];
 
 	sensor->vcm_i2c_client =
@@ -319,29 +344,12 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 		sensor = &bridge->sensors[bridge->n_sensors];
 
-		ret = cio2_bridge_read_acpi_buffer(adev, "SSDB",
-						   &sensor->ssdb,
-						   sizeof(sensor->ssdb));
+		ret = cio2_bridge_parse_sensor_fwnode(adev, sensor);
 		if (ret)
 			goto err_put_adev;
 
 		snprintf(sensor->name, sizeof(sensor->name), "%s-%u",
-			 cfg->hid, sensor->ssdb.link);
-
-		if (sensor->ssdb.vcmtype > ARRAY_SIZE(cio2_vcm_types)) {
-			dev_warn(&adev->dev, "Unknown VCM type %d\n",
-				 sensor->ssdb.vcmtype);
-			sensor->ssdb.vcmtype = 0;
-		}
-
-		sensor->orientation = cio2_bridge_get_orientation(adev);
-
-		if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
-			dev_err(&adev->dev,
-				"Number of lanes in SSDB is invalid\n");
-			ret = -EINVAL;
-			goto err_put_adev;
-		}
+			 cfg->hid, sensor->link);
 
 		cio2_bridge_create_fwnode_properties(sensor, bridge, cfg);
 		cio2_bridge_create_connection_swnodes(bridge, sensor);
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
index e42c5c3cf856..d53ce0c78e83 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
@@ -124,8 +124,12 @@ struct cio2_sensor {
 	struct software_node swnodes[SWNODE_COUNT];
 	struct cio2_node_names node_names;
 
-	struct cio2_sensor_ssdb ssdb;
+	u8 link;
+	u8 lanes;
+	u32 mclkspeed;
+	u32 rotation;
 	enum v4l2_fwnode_orientation orientation;
+	const char *vcm_type;
 
 	struct cio2_property_names prop_names;
 	struct property_entry ep_properties[5];
-- 
2.41.0

