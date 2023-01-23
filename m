Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 447F8677BC1
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbjAWMxa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231880AbjAWMx2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FD69012
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QvJYTeB3Wu8MhwvaaYZypd/b6miy5+15GFI2BoXs4X8=;
        b=eSGAfzlHMSIvGB5Y0PPIr9K9tqvWcgw/i3WuH4iOUdAeupagzRhtI89O5FlN++xmqcXewT
        cAoUN/5mymCge/5SS0rmBwBnGjNnnWn/rrsyp35MU1eWOGO6MlKg3PoEJee8eGmImPe9Ux
        UTkA8nGwVBfYKjL2lHLO6hj9quK58Is=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-lHdRfIdwPLaGPR0rgyEJDA-1; Mon, 23 Jan 2023 07:52:34 -0500
X-MC-Unique: lHdRfIdwPLaGPR0rgyEJDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A857A18A6464;
        Mon, 23 Jan 2023 12:52:33 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1AFC5C15BA0;
        Mon, 23 Jan 2023 12:52:30 +0000 (UTC)
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
Subject: [PATCH 08/57] media: atomisp: Remove custom ATOMISP_IOC_ISP_MAKERNOTE ioctl
Date:   Mon, 23 Jan 2023 13:51:16 +0100
Message-Id: <20230123125205.622152-9-hdegoede@redhat.com>
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

This ioctl simply returns a couple of fixed sensor parameters.

With libcamera these fixed parameters are instead stored in a table
with sensor-name to parameters mappings (camera_sensor_properties.cpp),
so these custom ioctl is not necessary; and it currently has no users.

Remove the ioctl and also remove the custom v4l2-ctrls underpinning
the ioctl.

This is part of a patch-series which tries to remove atomisp specific /
custom code from the sensor drivers, with as end goal to make the atomisp
drivers regular camera sensor drivers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 63 ------------------
 .../media/atomisp/i2c/atomisp-gc2235.c        | 63 ------------------
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 64 -------------------
 .../media/atomisp/i2c/atomisp-ov2680.c        | 64 -------------------
 .../media/atomisp/i2c/atomisp-ov2722.c        | 63 ------------------
 drivers/staging/media/atomisp/i2c/gc0310.h    |  3 -
 drivers/staging/media/atomisp/i2c/gc2235.h    |  3 -
 drivers/staging/media/atomisp/i2c/mt9m114.h   |  3 -
 drivers/staging/media/atomisp/i2c/ov2680.h    |  3 -
 drivers/staging/media/atomisp/i2c/ov2722.h    |  3 -
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c | 63 ------------------
 .../media/atomisp/include/linux/atomisp.h     | 20 ------
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 36 -----------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  3 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  7 --
 15 files changed, 461 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 87a634bf9ff5..a9c4724a9358 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -241,27 +241,6 @@ static int gc0310_write_reg_array(struct i2c_client *client,
 	return __gc0310_flush_reg_array(client, &ctrl);
 }
 
-static int gc0310_g_focal(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (GC0310_FOCAL_LENGTH_NUM << 16) | GC0310_FOCAL_LENGTH_DEM;
-	return 0;
-}
-
-static int gc0310_g_fnumber(struct v4l2_subdev *sd, s32 *val)
-{
-	/*const f number for imx*/
-	*val = (GC0310_F_NUMBER_DEFAULT_NUM << 16) | GC0310_F_NUMBER_DEM;
-	return 0;
-}
-
-static int gc0310_g_fnumber_range(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (GC0310_F_NUMBER_DEFAULT_NUM << 24) |
-	       (GC0310_F_NUMBER_DEM << 16) |
-	       (GC0310_F_NUMBER_DEFAULT_NUM << 8) | GC0310_F_NUMBER_DEM;
-	return 0;
-}
-
 static int gc0310_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
 {
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
@@ -596,15 +575,6 @@ static int gc0310_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
 		ret = gc0310_q_exposure(&dev->sd, &ctrl->val);
 		break;
-	case V4L2_CID_FOCAL_ABSOLUTE:
-		ret = gc0310_g_focal(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_ABSOLUTE:
-		ret = gc0310_g_fnumber(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_RANGE:
-		ret = gc0310_g_fnumber_range(&dev->sd, &ctrl->val);
-		break;
 	case V4L2_CID_BIN_FACTOR_HORZ:
 		ret = gc0310_g_bin_factor_x(&dev->sd, &ctrl->val);
 		break;
@@ -655,39 +625,6 @@ static const struct v4l2_ctrl_config gc0310_controls[] = {
 		.step = 1,
 		.def = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FOCAL_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "focal length",
-		.min = GC0310_FOCAL_LENGTH_DEFAULT,
-		.max = GC0310_FOCAL_LENGTH_DEFAULT,
-		.step = 0x01,
-		.def = GC0310_FOCAL_LENGTH_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "f-number",
-		.min = GC0310_F_NUMBER_DEFAULT,
-		.max = GC0310_F_NUMBER_DEFAULT,
-		.step = 0x01,
-		.def = GC0310_F_NUMBER_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_RANGE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "f-number range",
-		.min = GC0310_F_NUMBER_RANGE,
-		.max = GC0310_F_NUMBER_RANGE,
-		.step = 0x01,
-		.def = GC0310_F_NUMBER_RANGE,
-		.flags = 0,
-	},
 	{
 		.ops = &ctrl_ops,
 		.id = V4L2_CID_BIN_FACTOR_HORZ,
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 4d5a7e335f85..e6df10bcab8c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -220,27 +220,6 @@ static int gc2235_write_reg_array(struct i2c_client *client,
 	return __gc2235_flush_reg_array(client, &ctrl);
 }
 
-static int gc2235_g_focal(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (GC2235_FOCAL_LENGTH_NUM << 16) | GC2235_FOCAL_LENGTH_DEM;
-	return 0;
-}
-
-static int gc2235_g_fnumber(struct v4l2_subdev *sd, s32 *val)
-{
-	/* const f number for imx */
-	*val = (GC2235_F_NUMBER_DEFAULT_NUM << 16) | GC2235_F_NUMBER_DEM;
-	return 0;
-}
-
-static int gc2235_g_fnumber_range(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (GC2235_F_NUMBER_DEFAULT_NUM << 24) |
-	       (GC2235_F_NUMBER_DEM << 16) |
-	       (GC2235_F_NUMBER_DEFAULT_NUM << 8) | GC2235_F_NUMBER_DEM;
-	return 0;
-}
-
 static int gc2235_get_intg_factor(struct i2c_client *client,
 				  struct camera_mipi_info *info,
 				  const struct gc2235_resolution *res)
@@ -467,15 +446,6 @@ static int gc2235_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
 		ret = gc2235_q_exposure(&dev->sd, &ctrl->val);
 		break;
-	case V4L2_CID_FOCAL_ABSOLUTE:
-		ret = gc2235_g_focal(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_ABSOLUTE:
-		ret = gc2235_g_fnumber(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_RANGE:
-		ret = gc2235_g_fnumber_range(&dev->sd, &ctrl->val);
-		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -499,39 +469,6 @@ static struct v4l2_ctrl_config gc2235_controls[] = {
 		.def = 0x00,
 		.flags = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FOCAL_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "focal length",
-		.min = GC2235_FOCAL_LENGTH_DEFAULT,
-		.max = GC2235_FOCAL_LENGTH_DEFAULT,
-		.step = 0x01,
-		.def = GC2235_FOCAL_LENGTH_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "f-number",
-		.min = GC2235_F_NUMBER_DEFAULT,
-		.max = GC2235_F_NUMBER_DEFAULT,
-		.step = 0x01,
-		.def = GC2235_F_NUMBER_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_RANGE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "f-number range",
-		.min = GC2235_F_NUMBER_RANGE,
-		.max = GC2235_F_NUMBER_RANGE,
-		.step = 0x01,
-		.def = GC2235_F_NUMBER_RANGE,
-		.flags = 0,
-	},
 };
 
 static int __gc2235_init(struct v4l2_subdev *sd)
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index a0e8e94b2412..eb34b5cadb33 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -841,28 +841,6 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/* TODO: Update to SOC functions, remove exposure and gain */
-static int mt9m114_g_focal(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (MT9M114_FOCAL_LENGTH_NUM << 16) | MT9M114_FOCAL_LENGTH_DEM;
-	return 0;
-}
-
-static int mt9m114_g_fnumber(struct v4l2_subdev *sd, s32 *val)
-{
-	/* const f number for mt9m114 */
-	*val = (MT9M114_F_NUMBER_DEFAULT_NUM << 16) | MT9M114_F_NUMBER_DEM;
-	return 0;
-}
-
-static int mt9m114_g_fnumber_range(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (MT9M114_F_NUMBER_DEFAULT_NUM << 24) |
-	       (MT9M114_F_NUMBER_DEM << 16) |
-	       (MT9M114_F_NUMBER_DEFAULT_NUM << 8) | MT9M114_F_NUMBER_DEM;
-	return 0;
-}
-
 /* Horizontal flip the image. */
 static int mt9m114_g_hflip(struct v4l2_subdev *sd, s32 *val)
 {
@@ -1271,15 +1249,6 @@ static int mt9m114_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_HFLIP:
 		ret = mt9m114_g_hflip(&dev->sd, &ctrl->val);
 		break;
-	case V4L2_CID_FOCAL_ABSOLUTE:
-		ret = mt9m114_g_focal(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_ABSOLUTE:
-		ret = mt9m114_g_fnumber(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_RANGE:
-		ret = mt9m114_g_fnumber_range(&dev->sd, &ctrl->val);
-		break;
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
 		ret = mt9m114_g_exposure(&dev->sd, &ctrl->val);
 		break;
@@ -1331,39 +1300,6 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
 		.step = 1,
 		.def = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FOCAL_ABSOLUTE,
-		.name = "focal length",
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.min = MT9M114_FOCAL_LENGTH_DEFAULT,
-		.max = MT9M114_FOCAL_LENGTH_DEFAULT,
-		.step = 1,
-		.def = MT9M114_FOCAL_LENGTH_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_ABSOLUTE,
-		.name = "f-number",
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.min = MT9M114_F_NUMBER_DEFAULT,
-		.max = MT9M114_F_NUMBER_DEFAULT,
-		.step = 1,
-		.def = MT9M114_F_NUMBER_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_RANGE,
-		.name = "f-number range",
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.min = MT9M114_F_NUMBER_RANGE,
-		.max = MT9M114_F_NUMBER_RANGE,
-		.step = 1,
-		.def = MT9M114_F_NUMBER_RANGE,
-		.flags = 0,
-	},
 	{
 		.ops = &ctrl_ops,
 		.id = V4L2_CID_EXPOSURE_ABSOLUTE,
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index fa1de45b7a2d..39f86c7fd12e 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -119,28 +119,6 @@ static int ov2680_write_reg_array(struct i2c_client *client,
 	return 0;
 }
 
-static int ov2680_g_focal(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (OV2680_FOCAL_LENGTH_NUM << 16) | OV2680_FOCAL_LENGTH_DEM;
-	return 0;
-}
-
-static int ov2680_g_fnumber(struct v4l2_subdev *sd, s32 *val)
-{
-	/* const f number for ov2680 */
-
-	*val = (OV2680_F_NUMBER_DEFAULT_NUM << 16) | OV2680_F_NUMBER_DEM;
-	return 0;
-}
-
-static int ov2680_g_fnumber_range(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (OV2680_F_NUMBER_DEFAULT_NUM << 24) |
-	       (OV2680_F_NUMBER_DEM << 16) |
-	       (OV2680_F_NUMBER_DEFAULT_NUM << 8) | OV2680_F_NUMBER_DEM;
-	return 0;
-}
-
 static int ov2680_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
 {
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
@@ -517,15 +495,6 @@ static int ov2680_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
 		ret = ov2680_q_exposure(&dev->sd, &ctrl->val);
 		break;
-	case V4L2_CID_FOCAL_ABSOLUTE:
-		ret = ov2680_g_focal(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_ABSOLUTE:
-		ret = ov2680_g_fnumber(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_RANGE:
-		ret = ov2680_g_fnumber_range(&dev->sd, &ctrl->val);
-		break;
 	case V4L2_CID_BIN_FACTOR_HORZ:
 		ret = ov2680_g_bin_factor_x(&dev->sd, &ctrl->val);
 		break;
@@ -556,39 +525,6 @@ static const struct v4l2_ctrl_config ov2680_controls[] = {
 		.def = 0x00,
 		.flags = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FOCAL_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "focal length",
-		.min = OV2680_FOCAL_LENGTH_DEFAULT,
-		.max = OV2680_FOCAL_LENGTH_DEFAULT,
-		.step = 0x01,
-		.def = OV2680_FOCAL_LENGTH_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "f-number",
-		.min = OV2680_F_NUMBER_DEFAULT,
-		.max = OV2680_F_NUMBER_DEFAULT,
-		.step = 0x01,
-		.def = OV2680_F_NUMBER_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_RANGE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "f-number range",
-		.min = OV2680_F_NUMBER_RANGE,
-		.max = OV2680_F_NUMBER_RANGE,
-		.step = 0x01,
-		.def = OV2680_F_NUMBER_RANGE,
-		.flags = 0,
-	},
 	{
 		.ops = &ctrl_ops,
 		.id = V4L2_CID_BIN_FACTOR_HORZ,
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 887b6f99f6ca..47eefaccbe0b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -261,27 +261,6 @@ static int ov2722_write_reg_array(struct i2c_client *client,
 	return __ov2722_flush_reg_array(client, &ctrl);
 }
 
-static int ov2722_g_focal(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (OV2722_FOCAL_LENGTH_NUM << 16) | OV2722_FOCAL_LENGTH_DEM;
-	return 0;
-}
-
-static int ov2722_g_fnumber(struct v4l2_subdev *sd, s32 *val)
-{
-	/*const f number for imx*/
-	*val = (OV2722_F_NUMBER_DEFAULT_NUM << 16) | OV2722_F_NUMBER_DEM;
-	return 0;
-}
-
-static int ov2722_g_fnumber_range(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (OV2722_F_NUMBER_DEFAULT_NUM << 24) |
-	       (OV2722_F_NUMBER_DEM << 16) |
-	       (OV2722_F_NUMBER_DEFAULT_NUM << 8) | OV2722_F_NUMBER_DEM;
-	return 0;
-}
-
 static int ov2722_get_intg_factor(struct i2c_client *client,
 				  struct camera_mipi_info *info,
 				  const struct ov2722_resolution *res)
@@ -547,15 +526,6 @@ static int ov2722_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
 		ret = ov2722_q_exposure(&dev->sd, &ctrl->val);
 		break;
-	case V4L2_CID_FOCAL_ABSOLUTE:
-		ret = ov2722_g_focal(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_ABSOLUTE:
-		ret = ov2722_g_fnumber(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_RANGE:
-		ret = ov2722_g_fnumber_range(&dev->sd, &ctrl->val);
-		break;
 	case V4L2_CID_LINK_FREQ:
 		val = dev->res->mipi_freq;
 		if (val == 0)
@@ -586,39 +556,6 @@ static const struct v4l2_ctrl_config ov2722_controls[] = {
 		.def = 0x00,
 		.flags = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FOCAL_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "focal length",
-		.min = OV2722_FOCAL_LENGTH_DEFAULT,
-		.max = OV2722_FOCAL_LENGTH_DEFAULT,
-		.step = 0x01,
-		.def = OV2722_FOCAL_LENGTH_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "f-number",
-		.min = OV2722_F_NUMBER_DEFAULT,
-		.max = OV2722_F_NUMBER_DEFAULT,
-		.step = 0x01,
-		.def = OV2722_F_NUMBER_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_RANGE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "f-number range",
-		.min = OV2722_F_NUMBER_RANGE,
-		.max = OV2722_F_NUMBER_RANGE,
-		.step = 0x01,
-		.def = OV2722_F_NUMBER_RANGE,
-		.flags = 0,
-	},
 	{
 		.ops = &ctrl_ops,
 		.id = V4L2_CID_LINK_FREQ,
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index 4b9ce681bd93..52b4c07e5cf0 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -38,9 +38,6 @@
 #define I2C_RETRY_COUNT		5
 
 #define GC0310_FOCAL_LENGTH_NUM	278	/*2.78mm*/
-#define GC0310_FOCAL_LENGTH_DEM	100
-#define GC0310_F_NUMBER_DEFAULT_NUM	26
-#define GC0310_F_NUMBER_DEM	10
 
 #define MAX_FMTS		1
 
diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
index 806be5dff7a5..dd2d44b40e22 100644
--- a/drivers/staging/media/atomisp/i2c/gc2235.h
+++ b/drivers/staging/media/atomisp/i2c/gc2235.h
@@ -44,9 +44,6 @@
 #define I2C_RETRY_COUNT		5
 
 #define GC2235_FOCAL_LENGTH_NUM	278	/*2.78mm*/
-#define GC2235_FOCAL_LENGTH_DEM	100
-#define GC2235_F_NUMBER_DEFAULT_NUM	26
-#define GC2235_F_NUMBER_DEM	10
 
 #define MAX_FMTS		1
 
diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
index bcce18b65fa6..831875071cbb 100644
--- a/drivers/staging/media/atomisp/i2c/mt9m114.h
+++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
@@ -136,9 +136,6 @@
 #define MT9M114_BPAT_BGBGGRGR	BIT(3)
 
 #define MT9M114_FOCAL_LENGTH_NUM	208	/*2.08mm*/
-#define MT9M114_FOCAL_LENGTH_DEM	100
-#define MT9M114_F_NUMBER_DEFAULT_NUM	24
-#define MT9M114_F_NUMBER_DEM	10
 #define MT9M114_WAIT_STAT_TIMEOUT	100
 #define MT9M114_FLICKER_MODE_50HZ	1
 #define MT9M114_FLICKER_MODE_60HZ	2
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 7ab337b859ad..2bc350c67711 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -37,9 +37,6 @@
 #define I2C_RETRY_COUNT		5
 
 #define OV2680_FOCAL_LENGTH_NUM	334	/*3.34mm*/
-#define OV2680_FOCAL_LENGTH_DEM	100
-#define OV2680_F_NUMBER_DEFAULT_NUM	24
-#define OV2680_F_NUMBER_DEM	10
 
 #define OV2680_BIN_FACTOR_MAX 4
 
diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index d6e2510bc01c..d4cd6f27ee8d 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -39,9 +39,6 @@
 #define I2C_RETRY_COUNT		5
 
 #define OV2722_FOCAL_LENGTH_NUM	278	/*2.78mm*/
-#define OV2722_FOCAL_LENGTH_DEM	100
-#define OV2722_F_NUMBER_DEFAULT_NUM	26
-#define OV2722_F_NUMBER_DEM	10
 
 #define MAX_FMTS		1
 
diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index c1cd631455e6..9adaf2fc940a 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -415,27 +415,6 @@ static int ov5693_write_reg_array(struct i2c_client *client,
 	return __ov5693_flush_reg_array(client, &ctrl);
 }
 
-static int ov5693_g_focal(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (OV5693_FOCAL_LENGTH_NUM << 16) | OV5693_FOCAL_LENGTH_DEM;
-	return 0;
-}
-
-static int ov5693_g_fnumber(struct v4l2_subdev *sd, s32 *val)
-{
-	/*const f number for imx*/
-	*val = (OV5693_F_NUMBER_DEFAULT_NUM << 16) | OV5693_F_NUMBER_DEM;
-	return 0;
-}
-
-static int ov5693_g_fnumber_range(struct v4l2_subdev *sd, s32 *val)
-{
-	*val = (OV5693_F_NUMBER_DEFAULT_NUM << 24) |
-	       (OV5693_F_NUMBER_DEM << 16) |
-	       (OV5693_F_NUMBER_DEFAULT_NUM << 8) | OV5693_F_NUMBER_DEM;
-	return 0;
-}
-
 static int ov5693_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
 {
 	struct ov5693_device *dev = to_ov5693_sensor(sd);
@@ -1107,15 +1086,6 @@ static int ov5693_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
 		ret = ov5693_q_exposure(&dev->sd, &ctrl->val);
 		break;
-	case V4L2_CID_FOCAL_ABSOLUTE:
-		ret = ov5693_g_focal(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_ABSOLUTE:
-		ret = ov5693_g_fnumber(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FNUMBER_RANGE:
-		ret = ov5693_g_fnumber_range(&dev->sd, &ctrl->val);
-		break;
 	case V4L2_CID_FOCUS_ABSOLUTE:
 		ret = ov5693_q_focus_abs(&dev->sd, &ctrl->val);
 		break;
@@ -1152,39 +1122,6 @@ static const struct v4l2_ctrl_config ov5693_controls[] = {
 		.def = 0x00,
 		.flags = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FOCAL_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "focal length",
-		.min = OV5693_FOCAL_LENGTH_DEFAULT,
-		.max = OV5693_FOCAL_LENGTH_DEFAULT,
-		.step = 0x01,
-		.def = OV5693_FOCAL_LENGTH_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "f-number",
-		.min = OV5693_F_NUMBER_DEFAULT,
-		.max = OV5693_F_NUMBER_DEFAULT,
-		.step = 0x01,
-		.def = OV5693_F_NUMBER_DEFAULT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FNUMBER_RANGE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "f-number range",
-		.min = OV5693_F_NUMBER_RANGE,
-		.max = OV5693_F_NUMBER_RANGE,
-		.step = 0x01,
-		.def = OV5693_F_NUMBER_RANGE,
-		.flags = 0,
-	},
 	{
 		.ops = &ctrl_ops,
 		.id = V4L2_CID_FOCUS_ABSOLUTE,
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 3f602b5aaff9..e70e57695300 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -586,20 +586,6 @@ struct atomisp_shading_table {
 	__u16 *data[ATOMISP_NUM_SC_COLORS];
 };
 
-struct atomisp_makernote_info {
-	/* bits 31-16: numerator, bits 15-0: denominator */
-	unsigned int focal_length;
-	/* bits 31-16: numerator, bits 15-0: denominator*/
-	unsigned int f_number_curr;
-	/*
-	* bits 31-24: max f-number numerator
-	* bits 23-16: max f-number denominator
-	* bits 15-8: min f-number numerator
-	* bits 7-0: min f-number denominator
-	*/
-	unsigned int f_number_range;
-};
-
 /* parameter for MACC */
 #define ATOMISP_NUM_MACC_AXES           16
 struct atomisp_macc_table {
@@ -914,8 +900,6 @@ struct atomisp_sensor_ae_bracketing_lut {
 	_IOR('v', BASE_VIDIOC_PRIVATE + 10, struct atomisp_morph_table)
 #define ATOMISP_IOC_S_ISP_GDC_TAB \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 10, struct atomisp_morph_table)
-#define ATOMISP_IOC_ISP_MAKERNOTE \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 11, struct atomisp_makernote_info)
 
 /* macc parameter control*/
 #define ATOMISP_IOC_G_ISP_MACC \
@@ -1093,10 +1077,6 @@ struct atomisp_sensor_ae_bracketing_lut {
  * Exposure, Flash and privacy (indicator) light controls, to be upstreamed */
 #define V4L2_CID_CAMERA_LASTP1             (V4L2_CID_CAMERA_CLASS_BASE + 1024)
 
-#define V4L2_CID_FOCAL_ABSOLUTE            (V4L2_CID_CAMERA_LASTP1 + 0)
-#define V4L2_CID_FNUMBER_ABSOLUTE          (V4L2_CID_CAMERA_LASTP1 + 1)
-#define V4L2_CID_FNUMBER_RANGE             (V4L2_CID_CAMERA_LASTP1 + 2)
-
 /* Flash related CIDs, see also:
  * http://linuxtv.org/downloads/v4l-dvb-apis/extended-controls.html\
  * #flash-controls */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5cea1df48b7d..b167ee32a952 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5492,42 +5492,6 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 	return ret;
 }
 
-int atomisp_exif_makernote(struct atomisp_sub_device *asd,
-			   struct atomisp_makernote_info *config)
-{
-	struct v4l2_control ctrl;
-	struct atomisp_device *isp = asd->isp;
-
-	ctrl.id = V4L2_CID_FOCAL_ABSOLUTE;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].camera->ctrl_handler, &ctrl)) {
-		dev_warn(isp->dev, "failed to g_ctrl for focal length\n");
-		return -EINVAL;
-	} else {
-		config->focal_length = ctrl.value;
-	}
-
-	ctrl.id = V4L2_CID_FNUMBER_ABSOLUTE;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].camera->ctrl_handler, &ctrl)) {
-		dev_warn(isp->dev, "failed to g_ctrl for f-number\n");
-		return -EINVAL;
-	} else {
-		config->f_number_curr = ctrl.value;
-	}
-
-	ctrl.id = V4L2_CID_FNUMBER_RANGE;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].camera->ctrl_handler, &ctrl)) {
-		dev_warn(isp->dev, "failed to g_ctrl for f number range\n");
-		return -EINVAL;
-	} else {
-		config->f_number_range = ctrl.value;
-	}
-
-	return 0;
-}
-
 int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
 				      struct atomisp_cont_capture_conf *cvf_config)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index b8911491581a..99bbab402c9c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -273,9 +273,6 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
 				      struct atomisp_cont_capture_conf *cvf_config);
 
-int atomisp_exif_makernote(struct atomisp_sub_device *asd,
-			   struct atomisp_makernote_info *config);
-
 void atomisp_free_internal_buffers(struct atomisp_sub_device *asd);
 
 int atomisp_s_ae_window(struct atomisp_sub_device *asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 4f35e8f8250a..faf65387df56 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1631,7 +1631,6 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 	switch (control->id) {
 	case V4L2_CID_IRIS_ABSOLUTE:
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
-	case V4L2_CID_FNUMBER_ABSOLUTE:
 	case V4L2_CID_2A_STATUS:
 	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
 	case V4L2_CID_EXPOSURE:
@@ -1828,7 +1827,6 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 		case V4L2_CID_EXPOSURE_ABSOLUTE:
 		case V4L2_CID_EXPOSURE_AUTO:
 		case V4L2_CID_IRIS_ABSOLUTE:
-		case V4L2_CID_FNUMBER_ABSOLUTE:
 		case V4L2_CID_BIN_FACTOR_HORZ:
 		case V4L2_CID_BIN_FACTOR_VERT:
 		case V4L2_CID_3A_LOCK:
@@ -1940,7 +1938,6 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 		case V4L2_CID_EXPOSURE_AUTO:
 		case V4L2_CID_EXPOSURE_METERING:
 		case V4L2_CID_IRIS_ABSOLUTE:
-		case V4L2_CID_FNUMBER_ABSOLUTE:
 		case V4L2_CID_VCM_TIMING:
 		case V4L2_CID_VCM_SLEW:
 		case V4L2_CID_3A_LOCK:
@@ -2276,10 +2273,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		err = atomisp_fixed_pattern_table(asd, arg);
 		break;
 
-	case ATOMISP_IOC_ISP_MAKERNOTE:
-		err = atomisp_exif_makernote(asd, arg);
-		break;
-
 	case ATOMISP_IOC_G_SENSOR_MODE_DATA:
 		err = atomisp_get_sensor_mode_data(asd, arg);
 		break;
-- 
2.39.0

