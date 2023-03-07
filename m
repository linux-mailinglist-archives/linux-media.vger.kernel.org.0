Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00D466AD73E
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 07:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjCGGV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 01:21:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjCGGVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 01:21:55 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139B44E5FC
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 22:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678170114; x=1709706114;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8Gp+nwtOKFbS3wKjyWXpJdeyz04vKaez4ElwWt04oMg=;
  b=glffcWU1s/A1J/AnevE6k8ry0rh2EZXk9BwlmepTdcZDcp2KBH7jQ8CT
   3QgdLDdDHfdko3ct/ala/mBiZyEJHa0VvZT134vsj6KZWY1ufREORGKiD
   DVy3S3yZOMA5c8KxJ/XFmh5n7fUefWUMuqv9a9m/9l6unpnbdowPRgkMy
   DIc0/LzQusWtRxnlw9SP/sNPj4J10dBy9LqonvJ3CkSv9KwlK0OjJrY9P
   4MQYlqNnrEvRG5haNt7QleMaX9MmxJGIycjAksd+4ijpMns7pCAkbrP6q
   QVyc+EdRyrwKNkr0f4Tz5WGOg1HTc0BB22tc6kjRrdLO5ISjzeNKXwAAC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334487277"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="334487277"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 22:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="708926422"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="708926422"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga001.jf.intel.com with ESMTP; 06 Mar 2023 22:21:51 -0800
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, djrscally@gmail.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [PATCH v2] media: ipu3-cio2: support multiple sensors and VCMs with HID name
Date:   Tue,  7 Mar 2023 14:31:10 +0800
Message-Id: <20230307063110.1459508-1-bingbu.cao@intel.com>
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
sysfs_create_dir_ns+0xbc/0xd0
kobject_add_internal
kobject_init_and_add
swnode_register
software_node_register
software_node_register_nodes
cio2_bridge_init
...
kobject_add_internal failed for dw9714 with -EEXIST,
don't try to register things with the same name in the same directory.

One solution is appending the sensor link(Mipi Port) in SSDB as suffix
of the node name to fix this problem.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
Changes from v1:
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

