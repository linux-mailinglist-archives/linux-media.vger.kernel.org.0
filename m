Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C4B6A99A2
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 15:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjCCOgl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 09:36:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbjCCOg3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 09:36:29 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A937043D
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 06:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677854144; x=1709390144;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dwCgSh9mJfoPu+QZkrGPzIR7Z0d4mSZASdK/NYnbOsw=;
  b=nPY4WwmitLuyUfHV7rQY2sfpV8UB4mhjX+G4xIVrN7o2UCPj/uj357Jo
   N2H3eEQdGqbw9yNVpl9dYxM3vlIX5gfe1VNZ1aLVMPV+kJVhnHEFsOmpQ
   GgURrAQGsVsSHrQ6XSbg2rouP7wF4gMnR6FxQwz8DU0ykTon9NTlTdHHx
   /Jkb2D3wMtJWCSugTSshW7hr7uMlK+BHxItiYraDMab2p3BVsy3roHxfE
   xeinpe9NpldHFURW671Q2LjJD8nbK9G8bbDRmhxlBTMxREirwaxuoXohe
   zSSQ1419KVf3+p1SOiFw/bAa7K1cpUvgVXpbqTSBNCN4H7Nz2hOPdQq3d
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="315452982"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="315452982"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 06:35:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="818491149"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="818491149"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2023 06:35:17 -0800
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, djrscally@gmail.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [PATCH] media: ipu3-cio2: support multiple sensors and VCMs with HID name
Date:   Fri,  3 Mar 2023 22:44:32 +0800
Message-Id: <20230303144432.2108677-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

In current cio2-bridge, it is using the hid as node name to register
software node and swnode will create kobject and sysfs entry with
the node name, if there are multiple sensors and VCMs which are sharing
same HID name, it will cause the software nodes registration failure:

[ 7.142311] sysfs: cannot create duplicate filename '/kernel/software_nodes/dw9714'
...
[ 7.142328] Call Trace:
[ 7.142330]  <TASK>
[ 7.142336]  dump_stack_lvl+0x49/0x63
[ 7.142341]  dump_stack+0x10/0x16
[ 7.142343]  sysfs_warn_dup.cold+0x17/0x2b
[ 7.142346]  sysfs_create_dir_ns+0xbc/0xd0
[ 7.142351]  kobject_add_internal+0xb1/0x2b0
[ 7.142356]  kobject_init_and_add+0x71/0xa0
[ 7.142360]  swnode_register+0x136/0x210
[ 7.142363]  software_node_register+0xd2/0x120
[ 7.142364]  software_node_register_nodes+0x83/0xf0
[ 7.142366]  ? acpi_get_physical_device_location+0x65/0xc0
[ 7.142371]  cio2_bridge_init+0x82a/0xb5e
...
[ 7.142448] kobject_add_internal failed for dw9714 with -EEXIST,
don't try to register things with the same name in the same directory.

One solution is appending the sensor link(Mipi Port) in SSDB as suffix
of the node name to fix this problem.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 14 ++++++++++----
 drivers/media/pci/intel/ipu3/cio2-bridge.h |  2 +-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index dfefe0d8aa95..1ce1acb18f3f 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -212,6 +212,7 @@ static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
 						  struct cio2_sensor *sensor)
 {
 	struct software_node *nodes = sensor->swnodes;
+	char vcm_name[ACPI_ID_LEN + 4];
 
 	cio2_bridge_init_swnode_names(sensor);
 
@@ -229,9 +230,12 @@ static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
 						sensor->node_names.endpoint,
 						&nodes[SWNODE_CIO2_PORT],
 						sensor->cio2_properties);
-	if (sensor->ssdb.vcmtype)
-		nodes[SWNODE_VCM] =
-			NODE_VCM(cio2_vcm_types[sensor->ssdb.vcmtype - 1]);
+	if (sensor->ssdb.vcmtype) {
+		scnprintf(vcm_name, sizeof(vcm_name), "%s-%u",
+			  cio2_vcm_types[sensor->ssdb.vcmtype - 1],
+			  sensor->ssdb.link);
+		nodes[SWNODE_VCM] = NODE_VCM(vcm_name);
+	}
 
 	cio2_bridge_init_swnode_group(sensor);
 }
@@ -295,7 +299,6 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 		}
 
 		sensor = &bridge->sensors[bridge->n_sensors];
-		strscpy(sensor->name, cfg->hid, sizeof(sensor->name));
 
 		ret = cio2_bridge_read_acpi_buffer(adev, "SSDB",
 						   &sensor->ssdb,
@@ -303,6 +306,9 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 		if (ret)
 			goto err_put_adev;
 
+		scnprintf(sensor->name, sizeof(sensor->name), "%s-%u",
+			  cfg->hid, sensor->ssdb.link);
+
 		if (sensor->ssdb.vcmtype > ARRAY_SIZE(cio2_vcm_types)) {
 			dev_warn(&adev->dev, "Unknown VCM type %d\n",
 				 sensor->ssdb.vcmtype);
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
index b93b749c65bd..820ff518ef2b 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
@@ -113,7 +113,7 @@ struct cio2_sensor_config {
 };
 
 struct cio2_sensor {
-	char name[ACPI_ID_LEN];
+	char name[ACPI_ID_LEN + 4];
 	struct acpi_device *adev;
 	struct i2c_client *vcm_i2c_client;
 
-- 
2.39.1

