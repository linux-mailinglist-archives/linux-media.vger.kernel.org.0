Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D87436D9EEB
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 19:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239069AbjDFRgG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 13:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237436AbjDFRgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 13:36:00 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7CE9EF3
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 10:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680802538; x=1712338538;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gC/Ucm8/SfzwrvDVHjphzEdakh4YMcJbWGFE3d1nKYc=;
  b=QmJi/0pwawNPDIf3kLmMNuOhTpgMwzVjIDbmQkXTx/dVXXg40U3QWlwj
   h1XCtkp5WXfs1K20A4iyhp+YYynmO3DxQBGQ89bv1/H6mE6Vqy+Ghlb+H
   YQVKKscMOj0rzUOm70kTowLJrEHRyY3vcMjtaicw81bEaj4D+/CT/5Naq
   7mr+jd42vzsvZ/fvbnVPDgM89EyDUlT5HgHpNH0lcFdeuRs5R+GzkBdy9
   hN1fHvGWbMhgO+k2MOcwjqtNOi5ZhO4yMwwG9rG1QvRTcgjS5ee7avDmJ
   txi6tEYgp2E8GA+3G6mEBEv9RYkVvVbw/hQHh+L37TEQwBFFPjqu4C5ai
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370629623"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="370629623"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664558673"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664558673"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:34:34 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id CE61C122D3A
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 20:34:32 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/4] media: ccs: Differentiate SMIA and MIPI vendors in static data
Date:   Thu,  6 Apr 2023 20:34:27 +0300
Message-Id: <20230406173428.19855-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230406173428.19855-1-sakari.ailus@linux.intel.com>
References: <20230406173428.19855-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MIPI CCS uses a 16-bit MIPI manufacturer identifier for firmware filenames
compared to older 8-bit identifier used by SMIA. The requested firmware
files used the MIPI manufacturer ID even for SMIA compliant devices,
effectively making the manufacturer ID 0.

While CCS static data is a feature of CCS 1.1, it has no hardware
dependencies. Making this feature available for SMIA devices helps adding
support for them and avoids requesting ill-generated CCS static data file
names. The files are named as:

	ccs/smiapp-module-vv-mmmm-rrrr.fw,
	ccs/smiapp-sensor-vv-mmmm-rr.fw and
	ccs/smia-sensor-vv-mmmm-rr.fw

where vv is the manufacturer ID, mmmm is the model ID and rr or rrrr is
the revision number.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 73 +++++++++++++++++++++++---------
 1 file changed, 54 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 20c3974f5ac7..672e471bd39f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3271,8 +3271,46 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 	return rval;
 }
 
+static int ccs_firmware_name(struct i2c_client *client,
+			     struct ccs_sensor *sensor, char *filename,
+			     size_t filename_size, bool is_module)
+{
+	const struct ccs_device *ccsdev = device_get_match_data(&client->dev);
+	bool is_ccs = !(ccsdev->flags & CCS_DEVICE_FLAG_IS_SMIA);
+	bool is_smiapp = sensor->minfo.smiapp_version;
+	u16 manufacturer_id;
+	u16 model_id;
+	u16 revision_number;
+
+	/*
+	 * Old SMIA is module-agnostic. Its sensor identification is based on
+	 * what now are those of the module.
+	 */
+	if (is_module || (!is_ccs && !is_smiapp)) {
+		manufacturer_id = is_ccs ?
+			sensor->minfo.mipi_manufacturer_id :
+			sensor->minfo.smia_manufacturer_id;
+		model_id = sensor->minfo.model_id;
+		revision_number = sensor->minfo.revision_number;
+	} else {
+		manufacturer_id = is_ccs ?
+			sensor->minfo.sensor_mipi_manufacturer_id :
+			sensor->minfo.sensor_smia_manufacturer_id;
+		model_id = sensor->minfo.sensor_model_id;
+		revision_number = sensor->minfo.sensor_revision_number;
+	}
+
+	return snprintf(filename, filename_size,
+			"ccs/%s-%s-%0*x-%4.4x-%0*x.fw",
+			is_ccs ? "ccs" : is_smiapp ? "smiapp" : "smia",
+			is_module || (!is_ccs && !is_smiapp) ? "module" : "sensor",
+			is_ccs ? 4 : 2, manufacturer_id, model_id,
+			!is_ccs && !is_module ? 2 : 4, revision_number);
+}
+
 static int ccs_probe(struct i2c_client *client)
 {
+	const struct ccs_device *ccsdev = device_get_match_data(&client->dev);
 	struct ccs_sensor *sensor;
 	const struct firmware *fw;
 	char filename[40];
@@ -3381,11 +3419,8 @@ static int ccs_probe(struct i2c_client *client)
 		goto out_power_off;
 	}
 
-	rval = snprintf(filename, sizeof(filename),
-			"ccs/ccs-sensor-%4.4x-%4.4x-%4.4x.fw",
-			sensor->minfo.sensor_mipi_manufacturer_id,
-			sensor->minfo.sensor_model_id,
-			sensor->minfo.sensor_revision_number);
+	rval = ccs_firmware_name(client, sensor, filename, sizeof(filename),
+				 false);
 	if (rval >= sizeof(filename)) {
 		rval = -ENOMEM;
 		goto out_power_off;
@@ -3398,21 +3433,21 @@ static int ccs_probe(struct i2c_client *client)
 		release_firmware(fw);
 	}
 
-	rval = snprintf(filename, sizeof(filename),
-			"ccs/ccs-module-%4.4x-%4.4x-%4.4x.fw",
-			sensor->minfo.mipi_manufacturer_id,
-			sensor->minfo.model_id,
-			sensor->minfo.revision_number);
-	if (rval >= sizeof(filename)) {
-		rval = -ENOMEM;
-		goto out_release_sdata;
-	}
+	if (!(ccsdev->flags & CCS_DEVICE_FLAG_IS_SMIA) ||
+	    sensor->minfo.smiapp_version) {
+		rval = ccs_firmware_name(client, sensor, filename,
+					 sizeof(filename), true);
+		if (rval >= sizeof(filename)) {
+			rval = -ENOMEM;
+			goto out_release_sdata;
+		}
 
-	rval = request_firmware(&fw, filename, &client->dev);
-	if (!rval) {
-		ccs_data_parse(&sensor->mdata, fw->data, fw->size, &client->dev,
-			       true);
-		release_firmware(fw);
+		rval = request_firmware(&fw, filename, &client->dev);
+		if (!rval) {
+			ccs_data_parse(&sensor->mdata, fw->data, fw->size, &client->dev,
+				       true);
+			release_firmware(fw);
+		}
 	}
 
 	rval = ccs_read_all_limits(sensor);
-- 
2.30.2

