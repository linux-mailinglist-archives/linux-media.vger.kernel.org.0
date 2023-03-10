Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9076B4A3C
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 16:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234145AbjCJPUX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 10:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234273AbjCJPUC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 10:20:02 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0726912D41E
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 07:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678461038; x=1709997038;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ArFAi6gsvV3Y7QNlwkfNnQcqlm/0i/KsKMY+dv9mIsw=;
  b=aRy9SXTf3SOux0kTJX+zwHhmBH4yUf7+y1cerqIcBEtCn+89uX2DujGO
   /XhrY1fTU8+Wc3OXWp+rY7tcFDMZRJxKJwTiu9mffzDwukSDebG9r4w6U
   ikgdfgizgXs2QRk0t2doZHJO4zykjqmQMbH5gsePB6B/lzs+iR1ARTUCR
   sZVASztdEX0UOii3Wk8tnok82J/lSocrq6MATik+ItPNPQH+lIMpPMqwd
   JXPOtmFqjDlmWysDRfGxN2p5tPRZVzSLR4hpnH3oWAvPdVoJLVyXQ2HAH
   1vTIVSD3wo8nticPEa0SYW9oWaXue7bnE/vg74/qbLvplMJdDuF4fCk/2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="336766392"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="336766392"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 07:09:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788040776"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="788040776"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2023 07:09:47 -0800
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, djrscally@gmail.com
Cc:     bingbu.cao@intel.com, bingbu.cao@linux.intel.com
Subject: [PATCH v3] media: ipu3-cio2: support multiple sensors and VCMs with same HID
Date:   Fri, 10 Mar 2023 23:19:10 +0800
Message-Id: <20230310151910.1623899-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

In current cio2-bridge, it is using the hid name to register software
node and software node will create kobject and sysfs entry according to
the node name, if there are multiple sensors and VCMs which are sharing
same HID name, it will cause the software nodes registration failure:

sysfs: cannot create duplicate filename '/kernel/software_nodes/dw9714'
...
Call Trace:
software_node_register_nodes
cio2_bridge_init
...
kobject_add_internal failed for dw9714 with -EEXIST,
don't try to register things with the same name in the same directory.

One solution is appending the sensor link(Mipi Port) in SSDB as suffix
of the node name to fix this problem.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
Changes v2 -> v3:
 - Update commit message and subject

Changes v1 -> v2:
 - Use snprintf() instead of scnprinf()
 - Add comments to explain why expand the name size
 - Remove the distracting information of backtraces in commit message
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 15 +++++++++++----
 drivers/media/pci/intel/ipu3/cio2-bridge.h |  3 ++-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index dfefe0d8aa95..45427a3a3a25 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -212,6 +212,7 @@ static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
 						  struct cio2_sensor *sensor)
 {
 	struct software_node *nodes = sensor->swnodes;
+	char vcm_name[ACPI_ID_LEN + 4];
 
 	cio2_bridge_init_swnode_names(sensor);
 
@@ -229,9 +230,13 @@ static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
 						sensor->node_names.endpoint,
 						&nodes[SWNODE_CIO2_PORT],
 						sensor->cio2_properties);
-	if (sensor->ssdb.vcmtype)
-		nodes[SWNODE_VCM] =
-			NODE_VCM(cio2_vcm_types[sensor->ssdb.vcmtype - 1]);
+	if (sensor->ssdb.vcmtype) {
+		/* append ssdb.link to distinguish VCM nodes with same HID */
+		snprintf(vcm_name, sizeof(vcm_name), "%s-%u",
+			 cio2_vcm_types[sensor->ssdb.vcmtype - 1],
+			 sensor->ssdb.link);
+		nodes[SWNODE_VCM] = NODE_VCM(vcm_name);
+	}
 
 	cio2_bridge_init_swnode_group(sensor);
 }
@@ -295,7 +300,6 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 		}
 
 		sensor = &bridge->sensors[bridge->n_sensors];
-		strscpy(sensor->name, cfg->hid, sizeof(sensor->name));
 
 		ret = cio2_bridge_read_acpi_buffer(adev, "SSDB",
 						   &sensor->ssdb,
@@ -303,6 +307,9 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 		if (ret)
 			goto err_put_adev;
 
+		snprintf(sensor->name, sizeof(sensor->name), "%s-%u",
+			 cfg->hid, sensor->ssdb.link);
+
 		if (sensor->ssdb.vcmtype > ARRAY_SIZE(cio2_vcm_types)) {
 			dev_warn(&adev->dev, "Unknown VCM type %d\n",
 				 sensor->ssdb.vcmtype);
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
index b93b749c65bd..b76ed8a641e2 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
@@ -113,7 +113,8 @@ struct cio2_sensor_config {
 };
 
 struct cio2_sensor {
-	char name[ACPI_ID_LEN];
+	/* append ssdb.link(u8) in "-%u" format as suffix of HID */
+	char name[ACPI_ID_LEN + 4];
 	struct acpi_device *adev;
 	struct i2c_client *vcm_i2c_client;
 
-- 
2.39.1

