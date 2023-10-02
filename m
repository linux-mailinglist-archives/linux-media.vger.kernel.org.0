Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE79C7B50B2
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 12:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236576AbjJBK4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 06:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236567AbjJBK4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 06:56:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C857BF
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 03:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696244173; x=1727780173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ol4N6M3x9RMsv7hVGyoiQ54NW/GcT19vFywz0iD/u4g=;
  b=aPEkYlZTijb6yds3ufz3mZvzwC556tYaeRLc0lPIM5wFdlRi3Vag6n83
   Q4cKKH2cdAKZnDevrcc0EVBxS1ynDlNJY2Lz+UpoPUYLlfDgzr7TCbGv8
   shJ6baI2kUToSAw50jRlMLCqKAwKer7AHbGQfR6wVdIbu57C5Z3dbIJC9
   6XHu4/R1bx83r8+kckPsaz+StmQtXO7Fc5ZFlr7LzBbNiJ9ngay9WxBof
   dsagriqTDMcoVE1UGYgTWa3gz4x0S1SZCWHzpvB59YL0xtLIJ0vC9MvdG
   r6i4T/rbB2l8dwFlVKzmRCS5A3bhl82ZnJWtTv/dDIpGQ6ajMfzRcM1Qf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="379896351"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="379896351"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="816251173"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816251173"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:10 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id EE2EC11F967;
        Mon,  2 Oct 2023 13:56:06 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v7 07/19] media: ccs: Move media_entity_pads_init to init from register
Date:   Mon,  2 Oct 2023 13:55:45 +0300
Message-Id: <20231002105557.28972-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media entity will soon need to be initialised before the sub-device
init finalisation that allocates memory for sub-device state. Do that now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 75 +++++++++++++++-----------------
 1 file changed, 36 insertions(+), 39 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 6bcce908f93b..e2669e9299ab 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2958,16 +2958,10 @@ static int ccs_register_subdev(struct ccs_sensor *sensor,
 	if (!sink_ssd)
 		return 0;
 
-	rval = media_entity_pads_init(&ssd->sd.entity, ssd->npads, ssd->pads);
-	if (rval) {
-		dev_err(&client->dev, "media_entity_pads_init failed\n");
-		return rval;
-	}
-
 	rval = v4l2_device_register_subdev(sensor->src->sd.v4l2_dev, &ssd->sd);
 	if (rval) {
 		dev_err(&client->dev, "v4l2_device_register_subdev failed\n");
-		goto out_media_entity_cleanup;
+		return rval;
 	}
 
 	rval = media_create_pad_link(&ssd->sd.entity, source_pad,
@@ -2975,18 +2969,11 @@ static int ccs_register_subdev(struct ccs_sensor *sensor,
 				     link_flags);
 	if (rval) {
 		dev_err(&client->dev, "media_create_pad_link failed\n");
-		goto out_v4l2_device_unregister_subdev;
+		v4l2_device_unregister_subdev(&ssd->sd);
+		return rval;
 	}
 
 	return 0;
-
-out_v4l2_device_unregister_subdev:
-	v4l2_device_unregister_subdev(&ssd->sd);
-
-out_media_entity_cleanup:
-	media_entity_cleanup(&ssd->sd.entity);
-
-	return rval;
 }
 
 static void ccs_unregistered(struct v4l2_subdev *subdev)
@@ -3031,6 +3018,10 @@ static int ccs_registered(struct v4l2_subdev *subdev)
 static void ccs_cleanup(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	unsigned int i;
+
+	for (i = 0; i < sensor->ssds_used; i++)
+		media_entity_cleanup(&sensor->ssds[i].sd.entity);
 
 	device_remove_file(&client->dev, &dev_attr_nvm);
 	device_remove_file(&client->dev, &dev_attr_ident);
@@ -3038,14 +3029,15 @@ static void ccs_cleanup(struct ccs_sensor *sensor)
 	ccs_free_controls(sensor);
 }
 
-static void ccs_init_subdev(struct ccs_sensor *sensor,
-			    struct ccs_subdev *ssd, const char *name,
-			    unsigned short num_pads, u32 function)
+static int ccs_init_subdev(struct ccs_sensor *sensor,
+			   struct ccs_subdev *ssd, const char *name,
+			   unsigned short num_pads, u32 function)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	int rval;
 
 	if (!ssd)
-		return;
+		return 0;
 
 	if (ssd != sensor->src)
 		v4l2_subdev_init(&ssd->sd, &ccs_ops);
@@ -3072,12 +3064,20 @@ static void ccs_init_subdev(struct ccs_sensor *sensor,
 
 	ssd->sd.entity.ops = &ccs_entity_ops;
 
+	rval = media_entity_pads_init(&ssd->sd.entity, ssd->npads, ssd->pads);
+	if (rval) {
+		dev_err(&client->dev, "media_entity_pads_init failed\n");
+		return rval;
+	}
+
 	if (ssd == sensor->src)
-		return;
+		return 0;
 
 	ssd->sd.owner = THIS_MODULE;
 	ssd->sd.dev = &client->dev;
 	v4l2_set_subdevdata(&ssd->sd, client);
+
+	return 0;
 }
 
 static int ccs_init_cfg(struct v4l2_subdev *sd,
@@ -3553,12 +3553,18 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
 
-	ccs_init_subdev(sensor, sensor->scaler, " scaler", 2,
-			MEDIA_ENT_F_PROC_VIDEO_SCALER);
-	ccs_init_subdev(sensor, sensor->binner, " binner", 2,
-			MEDIA_ENT_F_PROC_VIDEO_SCALER);
-	ccs_init_subdev(sensor, sensor->pixel_array, " pixel_array", 1,
-			MEDIA_ENT_F_CAM_SENSOR);
+	rval = ccs_init_subdev(sensor, sensor->scaler, " scaler", 2,
+			       MEDIA_ENT_F_PROC_VIDEO_SCALER);
+	if (rval)
+		goto out_cleanup;
+	rval = ccs_init_subdev(sensor, sensor->binner, " binner", 2,
+			       MEDIA_ENT_F_PROC_VIDEO_SCALER);
+	if (rval)
+		goto out_cleanup;
+	rval = ccs_init_subdev(sensor, sensor->pixel_array, " pixel_array", 1,
+			       MEDIA_ENT_F_CAM_SENSOR);
+	if (rval)
+		goto out_cleanup;
 
 	rval = ccs_init_controls(sensor);
 	if (rval < 0)
@@ -3591,14 +3597,9 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->streaming = false;
 	sensor->dev_init_done = true;
 
-	rval = media_entity_pads_init(&sensor->src->sd.entity, 2,
-				 sensor->src->pads);
-	if (rval < 0)
-		goto out_media_entity_cleanup;
-
 	rval = ccs_write_msr_regs(sensor);
 	if (rval)
-		goto out_media_entity_cleanup;
+		goto out_cleanup;
 
 	pm_runtime_set_active(&client->dev);
 	pm_runtime_get_noresume(&client->dev);
@@ -3618,9 +3619,6 @@ static int ccs_probe(struct i2c_client *client)
 	pm_runtime_put_noidle(&client->dev);
 	pm_runtime_disable(&client->dev);
 
-out_media_entity_cleanup:
-	media_entity_cleanup(&sensor->src->sd.entity);
-
 out_cleanup:
 	ccs_cleanup(sensor);
 
@@ -3653,10 +3651,9 @@ static void ccs_remove(struct i2c_client *client)
 		ccs_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 
-	for (i = 0; i < sensor->ssds_used; i++) {
+	for (i = 0; i < sensor->ssds_used; i++)
 		v4l2_device_unregister_subdev(&sensor->ssds[i].sd);
-		media_entity_cleanup(&sensor->ssds[i].sd.entity);
-	}
+
 	ccs_cleanup(sensor);
 	mutex_destroy(&sensor->mutex);
 	kfree(sensor->ccs_limits);
-- 
2.39.2

