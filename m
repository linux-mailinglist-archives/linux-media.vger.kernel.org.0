Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7E4677BCD
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbjAWMyE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjAWMyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30C6144A5
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DWIGvqnloz9zXSWVxXbHL6Et1a4eFn7QrHwwasc0GMQ=;
        b=eYPN8KvBILC14QKdKCY5+mIzZ6B2NQO+HbttTuMhwyz9wWaea92etyB7I2dAmQI+2+km9f
        2Ua74SbAgJqHAel7l1QZLT2u4DSbcWBUsEQfVu/wI8bU9KEe9c6H8OHhXAZnvA/ireqr52
        rsnvDdjIYgUiTMTBaD+r7PdWSZqMxls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-Cvy_IqkUOp2mE4nxA5Zh-A-1; Mon, 23 Jan 2023 07:53:09 -0500
X-MC-Unique: Cvy_IqkUOp2mE4nxA5Zh-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02C70858F0E;
        Mon, 23 Jan 2023 12:53:09 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6BF66C15BA0;
        Mon, 23 Jan 2023 12:53:06 +0000 (UTC)
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
Subject: [PATCH 21/57] media: atomisp: Remove atomisp_gmin_find_subdev()
Date:   Mon, 23 Jan 2023 13:51:29 +0100
Message-Id: <20230123125205.622152-22-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_gmin_find_subdev() can be used to lookup a subdev
given its i2c-adapter + i2c-client-address.

But the only caller of it reads this from the intel_v4l2_subdev_table
struct and that same struct already contains a pointer to the v4l2_subdev.

So this function is not necessary, drop it and modify its only caller
to directly take the subdev from the intel_v4l2_subdev_table struct.

Also drop struct intel_v4l2_subdev_i2c_board_info since that now no
longer is used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../include/linux/atomisp_gmin_platform.h     |  2 -
 .../atomisp/include/linux/atomisp_platform.h  |  6 ---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 27 ----------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 54 +++----------------
 4 files changed, 7 insertions(+), 82 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
index 5463d11d4295..64bd54835c32 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
@@ -21,8 +21,6 @@
 int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 				struct camera_sensor_platform_data *plat_data,
 				enum intel_v4l2_subdev_type type);
-struct v4l2_subdev *atomisp_gmin_find_subdev(struct i2c_adapter *adapter,
-	struct i2c_board_info *board_info);
 int atomisp_gmin_remove_subdev(struct v4l2_subdev *sd);
 int gmin_get_var_int(struct device *dev, bool is_gmin,
 		     const char *var, int def);
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 559a497975c5..82973aa0e1eb 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -125,13 +125,7 @@ struct intel_v4l2_subdev_id {
 	enum atomisp_camera_port    port;
 };
 
-struct intel_v4l2_subdev_i2c_board_info {
-	struct i2c_board_info board_info;
-	int i2c_adapter_id;
-};
-
 struct intel_v4l2_subdev_table {
-	struct intel_v4l2_subdev_i2c_board_info v4l2_subdev;
 	enum intel_v4l2_subdev_type type;
 	enum atomisp_camera_port port;
 	struct v4l2_subdev *subdev;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 6116d3c62315..234088711f29 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -147,7 +147,6 @@ int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 				enum intel_v4l2_subdev_type type)
 {
 	int i;
-	struct i2c_board_info *bi;
 	struct gmin_subdev *gs;
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
@@ -181,36 +180,10 @@ int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 	pdata.subdevs[i].type = type;
 	pdata.subdevs[i].port = gs->csi_port;
 	pdata.subdevs[i].subdev = subdev;
-	pdata.subdevs[i].v4l2_subdev.i2c_adapter_id = client->adapter->nr;
-
-	/* Convert i2c_client to i2c_board_info */
-	bi = &pdata.subdevs[i].v4l2_subdev.board_info;
-	memcpy(bi->type, client->name, I2C_NAME_SIZE);
-	bi->flags = client->flags;
-	bi->addr = client->addr;
-	bi->irq = client->irq;
-	bi->platform_data = plat_data;
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(atomisp_register_i2c_module);
 
-struct v4l2_subdev *atomisp_gmin_find_subdev(struct i2c_adapter *adapter,
-	struct i2c_board_info *board_info)
-{
-	int i;
-
-	for (i = 0; i < MAX_SUBDEVS && pdata.subdevs[i].type; i++) {
-		struct intel_v4l2_subdev_table *sd = &pdata.subdevs[i];
-
-		if (sd->v4l2_subdev.i2c_adapter_id == adapter->nr &&
-		    sd->v4l2_subdev.board_info.addr == board_info->addr)
-			return sd->subdev;
-	}
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(atomisp_gmin_find_subdev);
-
 int atomisp_gmin_remove_subdev(struct v4l2_subdev *sd)
 {
 	int i, j;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 2a949d3dc5d1..ba628f7cf385 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -937,45 +937,9 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 	/* FIXME: should, instead, use I2C probe */
 
 	for (subdevs = pdata->subdevs; subdevs->type; ++subdevs) {
-		struct v4l2_subdev *subdev;
-		struct i2c_board_info *board_info =
-			    &subdevs->v4l2_subdev.board_info;
-		struct i2c_adapter *adapter =
-		    i2c_get_adapter(subdevs->v4l2_subdev.i2c_adapter_id);
-
-		dev_info(isp->dev, "Probing Subdev %s\n", board_info->type);
-
-		if (!adapter) {
-			dev_err(isp->dev,
-				"Failed to find i2c adapter for subdev %s\n",
-				board_info->type);
-			break;
-		}
-
-		/* In G-Min, the sensor devices will already be probed
-		 * (via ACPI) and registered, do not create new
-		 * ones */
-		subdev = atomisp_gmin_find_subdev(adapter, board_info);
-		if (!subdev) {
-			dev_warn(isp->dev, "Subdev %s not found\n",
-				 board_info->type);
-			continue;
-		}
-		ret = v4l2_device_register_subdev(&isp->v4l2_dev, subdev);
-		if (ret) {
-			dev_warn(isp->dev, "Subdev %s detection fail\n",
-				 board_info->type);
+		ret = v4l2_device_register_subdev(&isp->v4l2_dev, subdevs->subdev);
+		if (ret)
 			continue;
-		}
-
-		if (!subdev) {
-			dev_warn(isp->dev, "Subdev %s detection fail\n",
-				 board_info->type);
-			continue;
-		}
-
-		dev_info(isp->dev, "Subdev %s successfully register\n",
-			 board_info->type);
 
 		switch (subdevs->type) {
 		case RAW_CAMERA:
@@ -992,7 +956,7 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 
 			isp->inputs[isp->input_cnt].type = subdevs->type;
 			isp->inputs[isp->input_cnt].port = subdevs->port;
-			isp->inputs[isp->input_cnt].camera = subdev;
+			isp->inputs[isp->input_cnt].camera = subdevs->subdev;
 			isp->inputs[isp->input_cnt].sensor_index = 0;
 			/*
 			 * initialize the subdev frame size, then next we can
@@ -1004,22 +968,18 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 			break;
 		case CAMERA_MOTOR:
 			if (isp->motor) {
-				dev_warn(isp->dev,
-					 "too many atomisp motors, ignored %s\n",
-					 board_info->type);
+				dev_warn(isp->dev, "too many atomisp motors\n");
 				continue;
 			}
-			isp->motor = subdev;
+			isp->motor = subdevs->subdev;
 			break;
 		case LED_FLASH:
 		case XENON_FLASH:
 			if (isp->flash) {
-				dev_warn(isp->dev,
-					 "too many atomisp flash devices, ignored %s\n",
-					 board_info->type);
+				dev_warn(isp->dev, "too many atomisp flash devices\n");
 				continue;
 			}
-			isp->flash = subdev;
+			isp->flash = subdevs->subdev;
 			break;
 		default:
 			dev_dbg(isp->dev, "unknown subdev probed\n");
-- 
2.39.0

