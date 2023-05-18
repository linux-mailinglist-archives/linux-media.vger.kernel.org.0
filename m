Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD4E708525
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbjERPiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbjERPig (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55CEF11D
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684424272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bnoo9XjPh1zunykubYca6XrRu6Oqli1p3xGFnNFHKcg=;
        b=Ktz9T55ERjoDu3qsKIiA+dHPN8S7PmiSPT+aQO84PHOmMCxMZG5MRDXvfMIPRZTNqhCPw2
        XAI6FsZEZDfTrKKU0CAh4vV/Xz2csHQImK6Hpm1d/fWaTyzzCOpk1rNr7eQqT6tV/He569
        Iv09w4gUroP9UaxoVjm9ZH2sLCYD4Qk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-s3ULk9w_PyiyW4QylTuZdg-1; Thu, 18 May 2023 11:37:48 -0400
X-MC-Unique: s3ULk9w_PyiyW4QylTuZdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CF10101A47E;
        Thu, 18 May 2023 15:37:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F180C63F5F;
        Thu, 18 May 2023 15:37:44 +0000 (UTC)
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
Subject: [PATCH 6/9] media: atomisp: Delay mapping sensors to inputs till atomisp_register_device_nodes()
Date:   Thu, 18 May 2023 17:37:30 +0200
Message-Id: <20230518153733.195306-7-hdegoede@redhat.com>
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

Delay mapping sensors to inputs till atomisp_register_device_nodes()
time. There are 2 reasons for this:

1. This guarantees a stable input order independent of the sensor
   probe order.

2. This is a preparation patch for v4l2-async sensor probing support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_internal.h      |  1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 83 ++++++++++---------
 2 files changed, 45 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index b8d643c9df8f..514c360d4d03 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -194,6 +194,7 @@ struct atomisp_device {
 	 * Note this is indexed by mipi_port_id not atomisp_camera_port.
 	 */
 	int sensor_lanes[N_MIPI_PORT_ID];
+	struct v4l2_subdev *sensor_subdevs[ATOMISP_CAMERA_NR_PORTS];
 	unsigned int input_cnt;
 	struct atomisp_input_subdev inputs[ATOM_ISP_MAX_INPUTS];
 	struct v4l2_subdev *flash;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index b5a070f69120..c668375e04ae 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -782,7 +782,7 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 {
 	const struct atomisp_platform_data *pdata;
 	struct intel_v4l2_subdev_table *subdevs;
-	int ret, mipi_port, raw_index = -1, count;
+	int ret, mipi_port, count;
 
 	pdata = atomisp_get_platform_data();
 	if (!pdata) {
@@ -814,26 +814,20 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 
 		switch (subdevs->type) {
 		case RAW_CAMERA:
-			dev_dbg(isp->dev, "raw_index: %d\n", raw_index);
-			raw_index = isp->input_cnt;
-			if (isp->input_cnt >= ATOM_ISP_MAX_INPUTS) {
-				dev_warn(isp->dev,
-					 "too many atomisp inputs, ignored\n");
-				break;
-			}
-
 			if (subdevs->port >= ATOMISP_CAMERA_NR_PORTS) {
 				dev_err(isp->dev, "port %d not supported\n", subdevs->port);
 				break;
 			}
 
-			isp->inputs[isp->input_cnt].type = subdevs->type;
-			isp->inputs[isp->input_cnt].port = subdevs->port;
-			isp->inputs[isp->input_cnt].camera = subdevs->subdev;
-			isp->input_cnt++;
+			if (isp->sensor_subdevs[subdevs->port]) {
+				dev_err(isp->dev, "port %d already has a sensor attached\n",
+					subdevs->port);
+				break;
+			}
 
 			mipi_port = atomisp_port_to_mipi_port(isp, subdevs->port);
 			isp->sensor_lanes[mipi_port] = subdevs->lanes;
+			isp->sensor_subdevs[subdevs->port] = subdevs->subdev;
 			break;
 		case CAMERA_MOTOR:
 			if (isp->motor) {
@@ -855,21 +849,6 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 		}
 	}
 
-	/*
-	 * HACK: Currently VCM belongs to primary sensor only, but correct
-	 * approach must be to acquire from platform code which sensor
-	 * owns it.
-	 */
-	if (isp->motor && raw_index >= 0)
-		isp->inputs[raw_index].motor = isp->motor;
-
-	/* Proceed even if no modules detected. For COS mode and no modules. */
-	if (!isp->input_cnt)
-		dev_warn(isp->dev, "no camera attached or fail to detect\n");
-	else
-		dev_info(isp->dev, "detected %d camera sensors\n",
-			 isp->input_cnt);
-
 	return atomisp_csi_lane_config(isp);
 }
 
@@ -943,16 +922,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		goto subdev_register_failed;
 	}
 
-	if (isp->input_cnt < ATOM_ISP_MAX_INPUTS) {
-		dev_dbg(isp->dev,
-			"TPG detected, camera_cnt: %d\n", isp->input_cnt);
-		isp->inputs[isp->input_cnt].type = TEST_PATTERN;
-		isp->inputs[isp->input_cnt].port = -1;
-		isp->inputs[isp->input_cnt++].camera = &isp->tpg.sd;
-	} else {
-		dev_warn(isp->dev, "too many atomisp inputs, TPG ignored.\n");
-	}
-
 	return 0;
 
 subdev_register_failed:
@@ -970,7 +939,43 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 
 static int atomisp_register_device_nodes(struct atomisp_device *isp)
 {
-	int err;
+	struct atomisp_input_subdev *input;
+	int i, err;
+
+	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
+		if (!isp->sensor_subdevs[i])
+			continue;
+
+		input = &isp->inputs[isp->input_cnt];
+
+		input->type = RAW_CAMERA;
+		input->port = i;
+		input->camera = isp->sensor_subdevs[i];
+
+		/*
+		 * HACK: Currently VCM belongs to primary sensor only, but correct
+		 * approach must be to acquire from platform code which sensor
+		 * owns it.
+		 */
+		if (i == ATOMISP_CAMERA_PORT_PRIMARY)
+			input->motor = isp->motor;
+
+		isp->input_cnt++;
+	}
+
+	if (!isp->input_cnt)
+		dev_warn(isp->dev, "no camera attached or fail to detect\n");
+	else
+		dev_info(isp->dev, "detected %d camera sensors\n", isp->input_cnt);
+
+	if (isp->input_cnt < ATOM_ISP_MAX_INPUTS) {
+		dev_dbg(isp->dev, "TPG detected, camera_cnt: %d\n", isp->input_cnt);
+		isp->inputs[isp->input_cnt].type = TEST_PATTERN;
+		isp->inputs[isp->input_cnt].port = -1;
+		isp->inputs[isp->input_cnt++].camera = &isp->tpg.sd;
+	} else {
+		dev_warn(isp->dev, "too many atomisp inputs, TPG ignored.\n");
+	}
 
 	isp->asd.video_out.vdev.v4l2_dev = &isp->v4l2_dev;
 	isp->asd.video_out.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-- 
2.40.1

