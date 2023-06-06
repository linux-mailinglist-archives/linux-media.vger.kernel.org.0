Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C047724479
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 15:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237655AbjFFNce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 09:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjFFNcd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 09:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F30B90
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686058310;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=GCVzN2LIu4vSO7tWZPbC06tIBrf+ZUAkcxyoriJ3kwQ=;
        b=D3pu+w8DTzol4CuK8sWJlX22An02a76+cv8JsRJbaqXcJ96RlTpDPqXRXUd0wl6TTZ1XXT
        vzqlfPLXC/07Fyh0sMwNVASUXx1Vk8k7fq7T/elF/7VdnNV2RTIQg/tJ5oQB7oNLN5Hvn/
        LUCXSVyHcxAYb/h2bNUbwpcs3RFA/ZY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-l5DP-GrONEu4kSaa-ndKYA-1; Tue, 06 Jun 2023 09:31:44 -0400
X-MC-Unique: l5DP-GrONEu4kSaa-ndKYA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1220980027F;
        Tue,  6 Jun 2023 13:31:42 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.198])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6F0514021AA;
        Tue,  6 Jun 2023 13:31:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: csi2-bridge: Add support for setting "clock-" and "link-frequencies" props
Date:   Tue,  6 Jun 2023 15:31:36 +0200
Message-Id: <20230606133136.23619-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some standard v4l2 sensor drivers from drivers/media/i2c expect a
"clock-frequency" property on the device indicating the frequency
of the extclk for the sensor. Example of such drivers are the
ov2680 and ov5693 drivers.

The standard ov5693 sensor also expects a "link-frequencies" property.
Add support for setting both properties.

Note the "clock-frequency" prop is added before the "rotation" prop while
the "link-frequencies" are added at the end to match the ipu3 cio2-bridge
code from which this is derived.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.h    | 13 +++++++++----
 .../staging/media/atomisp/pci/atomisp_csi2_bridge.c | 12 ++++++++++--
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
index b389ccda5e98..16ddb3ab2963 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
@@ -31,6 +31,7 @@
 #define CSI2_PADS_NUM		2
 
 #define CSI2_MAX_LANES		4
+#define CSI2_MAX_LINK_FREQS	3
 
 #define CSI2_MAX_ACPI_GPIOS	2u
 
@@ -64,10 +65,12 @@ enum atomisp_csi2_sensor_swnodes {
 };
 
 struct atomisp_csi2_property_names {
+	char clock_frequency[16];
 	char rotation[9];
 	char bus_type[9];
 	char data_lanes[11];
 	char remote_endpoint[16];
+	char link_frequencies[17];
 };
 
 struct atomisp_csi2_node_names {
@@ -79,6 +82,8 @@ struct atomisp_csi2_node_names {
 struct atomisp_csi2_sensor_config {
 	const char *hid;
 	int lanes;
+	int nr_link_freqs;
+	u64 link_freqs[CSI2_MAX_LINK_FREQS];
 };
 
 struct atomisp_csi2_sensor {
@@ -93,10 +98,10 @@ struct atomisp_csi2_sensor {
 	struct software_node swnodes[SWNODE_COUNT];
 	struct atomisp_csi2_node_names node_names;
 	struct atomisp_csi2_property_names prop_names;
-	/* "rotation" + terminating entry */
-	struct property_entry dev_properties[2];
-	/* "bus-type", "data-lanes", "remote-endpoint" + terminating entry */
-	struct property_entry ep_properties[4];
+	/* "clock-frequency", "rotation" + terminating entry */
+	struct property_entry dev_properties[3];
+	/* "bus-type", "data-lanes", "remote-endpoint" + "link-freq" + terminating entry */
+	struct property_entry ep_properties[5];
 	/* "data-lanes", "remote-endpoint" + terminating entry */
 	struct property_entry csi2_properties[3];
 	struct software_node_ref_args local_ref[1];
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 28d8779bbbc4..0d12ba78d9c1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -85,7 +85,7 @@ static const guid_t atomisp_dsm_guid =
 
 /*
  * Extend this array with ACPI Hardware IDs of sensors known to be working
- * plus the number of links expected by their drivers.
+ * plus the default number of links + link-frequencies.
  *
  * Do not add an entry for a sensor that is not actually supported,
  * or which have not yet been converted to work without atomisp_gmin
@@ -492,10 +492,12 @@ static int atomisp_csi2_add_gpio_mappings(struct atomisp_csi2_sensor *sensor,
 }
 
 static const struct atomisp_csi2_property_names prop_names = {
+	.clock_frequency = "clock-frequency",
 	.rotation = "rotation",
 	.bus_type = "bus-type",
 	.data_lanes = "data-lanes",
 	.remote_endpoint = "remote-endpoint",
+	.link_frequencies = "link-frequencies",
 };
 
 static void atomisp_csi2_create_fwnode_properties(struct atomisp_csi2_sensor *sensor,
@@ -507,7 +509,9 @@ static void atomisp_csi2_create_fwnode_properties(struct atomisp_csi2_sensor *se
 	sensor->local_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_CSI2_ENDPOINT]);
 	sensor->remote_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_SENSOR_ENDPOINT]);
 
-	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.rotation, 0);
+	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.clock_frequency,
+						       PMC_CLK_RATE_19_2MHZ);
+	sensor->dev_properties[1] = PROPERTY_ENTRY_U32(sensor->prop_names.rotation, 0);
 
 	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.bus_type,
 						      V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
@@ -516,6 +520,10 @@ static void atomisp_csi2_create_fwnode_properties(struct atomisp_csi2_sensor *se
 								sensor->lanes);
 	sensor->ep_properties[2] = PROPERTY_ENTRY_REF_ARRAY(sensor->prop_names.remote_endpoint,
 							    sensor->local_ref);
+	if (cfg->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(sensor->prop_names.link_frequencies,
+						     cfg->link_freqs, cfg->nr_link_freqs);
 
 	sensor->csi2_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(sensor->prop_names.data_lanes,
 								  bridge->data_lanes,
-- 
2.40.1

