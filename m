Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C923D5B5035
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiIKRRf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiIKRRd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C73C27DC8
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L/W/rjP1QtSVPZbFM/TRVi84q3gQaXkjU7+GpxaZ2sQ=;
        b=FR/4nwgfN3L3k5r/G2qkFy25xotyBPfc6awZjxU/WmiV2IY3c7CYGtNi7DfzBWCbVPXD1C
        7ReSiO//X0hUDw/+V4mjDXiNloo+9bNKNIlW6ndxonHFXEEhh107KO8H23SNmgmmH7jVDI
        IqpStZRTPbaT4NyW6XIU9IpDbyXmucc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-L8bx7WmnOzqJETHaPRN1rA-1; Sun, 11 Sep 2022 13:17:27 -0400
X-MC-Unique: L8bx7WmnOzqJETHaPRN1rA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00A4A85A58A;
        Sun, 11 Sep 2022 17:17:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 62C8A492C3B;
        Sun, 11 Sep 2022 17:17:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 17/17] media: atomisp_gmin_platform: Unexport and split camera_sensor_csi()
Date:   Sun, 11 Sep 2022 19:16:53 +0200
Message-Id: <20220911171653.568932-18-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The camera_sensor_csi() is not used outside the module, hence make it
static. While at it, split it to _alloc() and _free() to clearly show
the idea behind the last parameter @flag that is passed to
gmin_csi_cfg().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/r/20220730162027.1011-1-andriy.shevchenko@linux.intel.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../include/linux/atomisp_gmin_platform.h     |  2 -
 .../media/atomisp/pci/atomisp_gmin_platform.c | 68 ++++++++++---------
 2 files changed, 37 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
index 58e0ea5355a3..5463d11d4295 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
@@ -26,8 +26,6 @@ struct v4l2_subdev *atomisp_gmin_find_subdev(struct i2c_adapter *adapter,
 int atomisp_gmin_remove_subdev(struct v4l2_subdev *sd);
 int gmin_get_var_int(struct device *dev, bool is_gmin,
 		     const char *var, int def);
-int camera_sensor_csi(struct v4l2_subdev *sd, u32 port,
-		      u32 lanes, u32 format, u32 bayer_order, int flag);
 struct camera_sensor_platform_data *
 gmin_camera_platform_data(
     struct v4l2_subdev *subdev,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 254e8c97f71f..3d41fab661cf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1048,6 +1048,38 @@ static int gmin_flisclk_ctrl(struct v4l2_subdev *subdev, int on)
 	return ret;
 }
 
+static int camera_sensor_csi_alloc(struct v4l2_subdev *sd, u32 port, u32 lanes,
+				   u32 format, u32 bayer_order)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct camera_mipi_info *csi;
+
+	csi = kzalloc(sizeof(*csi), GFP_KERNEL);
+	if (!csi)
+		return -ENOMEM;
+
+	csi->port = port;
+	csi->num_lanes = lanes;
+	csi->input_format = format;
+	csi->raw_bayer_order = bayer_order;
+	v4l2_set_subdev_hostdata(sd, csi);
+	csi->metadata_format = ATOMISP_INPUT_FORMAT_EMBEDDED;
+	csi->metadata_effective_width = NULL;
+	dev_info(&client->dev,
+		 "camera pdata: port: %d lanes: %d order: %8.8x\n",
+		 port, lanes, bayer_order);
+
+	return 0;
+}
+
+static void camera_sensor_csi_free(struct v4l2_subdev *sd)
+{
+	struct camera_mipi_info *csi;
+
+	csi = v4l2_get_subdev_hostdata(sd);
+	kfree(csi);
+}
+
 static int gmin_csi_cfg(struct v4l2_subdev *sd, int flag)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -1056,8 +1088,11 @@ static int gmin_csi_cfg(struct v4l2_subdev *sd, int flag)
 	if (!client || !gs)
 		return -ENODEV;
 
-	return camera_sensor_csi(sd, gs->csi_port, gs->csi_lanes,
-				 gs->csi_fmt, gs->csi_bayer, flag);
+	if (flag)
+		return camera_sensor_csi_alloc(sd, gs->csi_port, gs->csi_lanes,
+					       gs->csi_fmt, gs->csi_bayer);
+	camera_sensor_csi_free(sd);
+	return 0;
 }
 
 static struct camera_vcm_control *gmin_get_vcm_ctrl(struct v4l2_subdev *subdev,
@@ -1340,35 +1375,6 @@ int gmin_get_var_int(struct device *dev, bool is_gmin, const char *var, int def)
 }
 EXPORT_SYMBOL_GPL(gmin_get_var_int);
 
-int camera_sensor_csi(struct v4l2_subdev *sd, u32 port,
-		      u32 lanes, u32 format, u32 bayer_order, int flag)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct camera_mipi_info *csi = NULL;
-
-	if (flag) {
-		csi = kzalloc(sizeof(*csi), GFP_KERNEL);
-		if (!csi)
-			return -ENOMEM;
-		csi->port = port;
-		csi->num_lanes = lanes;
-		csi->input_format = format;
-		csi->raw_bayer_order = bayer_order;
-		v4l2_set_subdev_hostdata(sd, (void *)csi);
-		csi->metadata_format = ATOMISP_INPUT_FORMAT_EMBEDDED;
-		csi->metadata_effective_width = NULL;
-		dev_info(&client->dev,
-			 "camera pdata: port: %d lanes: %d order: %8.8x\n",
-			 port, lanes, bayer_order);
-	} else {
-		csi = v4l2_get_subdev_hostdata(sd);
-		kfree(csi);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(camera_sensor_csi);
-
 /* PCI quirk: The BYT ISP advertises PCI runtime PM but it doesn't
  * work.  Disable so the kernel framework doesn't hang the device
  * trying.  The driver itself does direct calls to the PUNIT to manage
-- 
2.37.3

