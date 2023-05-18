Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF687708524
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbjERPip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbjERPid (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60916119
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684424270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=18PIBSnLLQB8KhBW4IKB8Z1Wv4i08F53b5d6bIfA5F8=;
        b=jEVetDRNPo/Y3BDeTunrmBqnpH8tq1cxVTEjyIoSJ1fPv81I4gwOyepvCWXSnxZeS4qiWZ
        K+MofyyxZKS46YwZ1FPtgKq4ueParHrHTPLYarm1dMRJ/hoVmtl4aemxVwYWBcB+SUyVjr
        JuymydGiHw1QkGwz/I35s4Udhg8iwng=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-cceehGNjOAmXx5jf9U6Ghg-1; Thu, 18 May 2023 11:37:45 -0400
X-MC-Unique: cceehGNjOAmXx5jf9U6Ghg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE7D784B062;
        Thu, 18 May 2023 15:37:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3F03C63F9A;
        Thu, 18 May 2023 15:37:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 5/9] media: atomisp: Store number of sensor lanes per port in struct atomisp_device
Date:   Thu, 18 May 2023 17:37:29 +0200
Message-Id: <20230518153733.195306-6-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-1-hdegoede@redhat.com>
References: <20230518153733.195306-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Store number of sensor lanes per port in struct atomisp_device.

This is a preparation patch for adding v4l2-async sensor probing support.
With async probing the inputs will get registered later, but we can
already fill the sensor_lanes array when parsing the fwnodes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../atomisp/include/linux/atomisp_platform.h  |  1 +
 .../media/atomisp/pci/atomisp_gmin_platform.c |  2 +
 .../media/atomisp/pci/atomisp_internal.h      |  5 ++
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 56 ++++---------------
 4 files changed, 20 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index e8e965f73fc8..487ef5846c24 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -125,6 +125,7 @@ struct intel_v4l2_subdev_id {
 struct intel_v4l2_subdev_table {
 	enum intel_v4l2_subdev_type type;
 	enum atomisp_camera_port port;
+	unsigned int lanes;
 	struct v4l2_subdev *subdev;
 };
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index ae45c1d8c50c..bc2dd96176d0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -189,6 +189,7 @@ int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 
 	pdata.subdevs[i].type = type;
 	pdata.subdevs[i].port = gs->csi_port;
+	pdata.subdevs[i].lanes = gs->csi_lanes;
 	pdata.subdevs[i].subdev = subdev;
 	return 0;
 }
@@ -1150,6 +1151,7 @@ int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
 
 	pdata.subdevs[i].type = RAW_CAMERA;
 	pdata.subdevs[i].port = port;
+	pdata.subdevs[i].lanes = lanes;
 	pdata.subdevs[i].subdev = subdev;
 	return 0;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index ee0dd5eb4711..b8d643c9df8f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -189,6 +189,11 @@ struct atomisp_device {
 	 * structures and css API calls. */
 	struct mutex mutex;
 
+	/*
+	 * Number of lanes used by each sensor per port.
+	 * Note this is indexed by mipi_port_id not atomisp_camera_port.
+	 */
+	int sensor_lanes[N_MIPI_PORT_ID];
 	unsigned int input_cnt;
 	struct atomisp_input_subdev inputs[ATOM_ISP_MAX_INPUTS];
 	struct v4l2_subdev *flash;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 94b9908139ab..b5a070f69120 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -713,7 +713,6 @@ int atomisp_csi_lane_config(struct atomisp_device *isp)
 	};
 
 	unsigned int i, j;
-	u8 sensor_lanes[ATOMISP_CAMERA_NR_PORTS] = { 0 };
 	u32 csi_control;
 	int nportconfigs;
 	u32 port_config_mask;
@@ -741,38 +740,10 @@ int atomisp_csi_lane_config(struct atomisp_device *isp)
 		nportconfigs = ARRAY_SIZE(portconfigs);
 	}
 
-	for (i = 0; i < isp->input_cnt; i++) {
-		struct camera_mipi_info *mipi_info;
-
-		if (isp->inputs[i].type != RAW_CAMERA)
-			continue;
-
-		mipi_info = atomisp_to_sensor_mipi_info(isp->inputs[i].camera);
-		if (!mipi_info)
-			continue;
-
-		switch (mipi_info->port) {
-		case ATOMISP_CAMERA_PORT_PRIMARY:
-			sensor_lanes[0] = mipi_info->num_lanes;
-			break;
-		case ATOMISP_CAMERA_PORT_SECONDARY:
-			sensor_lanes[1] = mipi_info->num_lanes;
-			break;
-		case ATOMISP_CAMERA_PORT_TERTIARY:
-			sensor_lanes[2] = mipi_info->num_lanes;
-			break;
-		default:
-			dev_err(isp->dev,
-				"%s: invalid port: %d for the %dth sensor\n",
-				__func__, mipi_info->port, i);
-			return -EINVAL;
-		}
-	}
-
 	for (i = 0; i < nportconfigs; i++) {
 		for (j = 0; j < ATOMISP_CAMERA_NR_PORTS; j++)
-			if (sensor_lanes[j] &&
-			    sensor_lanes[j] != portconfigs[i].lanes[j])
+			if (isp->sensor_lanes[j] &&
+			    isp->sensor_lanes[j] != portconfigs[i].lanes[j])
 				break;
 
 		if (j == ATOMISP_CAMERA_NR_PORTS)
@@ -783,7 +754,7 @@ int atomisp_csi_lane_config(struct atomisp_device *isp)
 		dev_err(isp->dev,
 			"%s: could not find the CSI port setting for %d-%d-%d\n",
 			__func__,
-			sensor_lanes[0], sensor_lanes[1], sensor_lanes[2]);
+			isp->sensor_lanes[0], isp->sensor_lanes[1], isp->sensor_lanes[2]);
 		return -EINVAL;
 	}
 
@@ -811,7 +782,7 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 {
 	const struct atomisp_platform_data *pdata;
 	struct intel_v4l2_subdev_table *subdevs;
-	int ret, raw_index = -1, count;
+	int ret, mipi_port, raw_index = -1, count;
 
 	pdata = atomisp_get_platform_data();
 	if (!pdata) {
@@ -851,10 +822,18 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 				break;
 			}
 
+			if (subdevs->port >= ATOMISP_CAMERA_NR_PORTS) {
+				dev_err(isp->dev, "port %d not supported\n", subdevs->port);
+				break;
+			}
+
 			isp->inputs[isp->input_cnt].type = subdevs->type;
 			isp->inputs[isp->input_cnt].port = subdevs->port;
 			isp->inputs[isp->input_cnt].camera = subdevs->subdev;
 			isp->input_cnt++;
+
+			mipi_port = atomisp_port_to_mipi_port(isp, subdevs->port);
+			isp->sensor_lanes[mipi_port] = subdevs->lanes;
 			break;
 		case CAMERA_MOTOR:
 			if (isp->motor) {
@@ -964,15 +943,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		goto subdev_register_failed;
 	}
 
-	for (i = 0; i < isp->input_cnt; i++) {
-		if (isp->inputs[i].port >= ATOMISP_CAMERA_NR_PORTS) {
-			dev_err(isp->dev, "isp->inputs port %d not supported\n",
-				isp->inputs[i].port);
-			ret = -EINVAL;
-			goto link_failed;
-		}
-	}
-
 	if (isp->input_cnt < ATOM_ISP_MAX_INPUTS) {
 		dev_dbg(isp->dev,
 			"TPG detected, camera_cnt: %d\n", isp->input_cnt);
@@ -985,8 +955,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 
 	return 0;
 
-link_failed:
-	atomisp_subdev_unregister_entities(&isp->asd);
 subdev_register_failed:
 	atomisp_tpg_unregister_entities(&isp->tpg);
 tpg_register_failed:
-- 
2.40.1

