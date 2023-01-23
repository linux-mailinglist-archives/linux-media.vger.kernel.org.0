Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD016677BC2
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbjAWMxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbjAWMxc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A403D4231
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478362;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cVHGQcbbQHcS+NuR6DiWzWJOmOLeD9HgTWN6+sGtUoQ=;
        b=ZnXfX+20pmG+eR6fb7dqt7wLKH2ROr8MA14Ozdsv0ddxCGu21/72f2eIsmdZgienLghc2f
        F6gqjh8955bPnDm3Mz0V+X8gcff0V1g3m42DAWlkCZvO1W+G8TYrfZzWKoiLO6PUvexyCy
        2PezMOfyTZ6B2gtyRIIygeT0/LnsYWs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-s98VAebNMOeH29ySh4By0w-1; Mon, 23 Jan 2023 07:52:39 -0500
X-MC-Unique: s98VAebNMOeH29ySh4By0w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B6443C02539;
        Mon, 23 Jan 2023 12:52:39 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B554CC15BA0;
        Mon, 23 Jan 2023 12:52:36 +0000 (UTC)
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
Subject: [PATCH 10/57] media: atomisp: Remove V4L2_CID_BIN_FACTOR_HORZ/_VERT
Date:   Mon, 23 Jan 2023 13:51:18 +0100
Message-Id: <20230123125205.622152-11-hdegoede@redhat.com>
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

The bin-factor-x and bin-factor-y ctrls are only used internally to
get a single value to pass to atomisp_css_input_set_binning_factor(),
which is supposed to tune the lens-shading correction for the binning
factor. But all sensor drivers return either 0 or 1 for this,
with 0 meaning unset and 1 meaning no-binning. Even though some modes
do actually do binning ...

Also note that the removed atomisp_get_sensor_bin_factor() would fall
back to 0 if either the x and y factor differ or if the ctrls are not
implemented (not all sensor drivers implement them).

Simply always pass 0 to atomisp_css_input_set_binning_factor().

This is part of a patch-series which tries to remove atomisp specific /
custom code from the sensor drivers, with as end goal to make the atomisp
drivers regular camera sensor drivers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 46 -----------------
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 46 -----------------
 .../media/atomisp/i2c/atomisp-ov2680.c        | 49 -------------------
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c | 46 -----------------
 .../media/atomisp/include/linux/atomisp.h     |  4 --
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 20 --------
 .../media/atomisp/pci/atomisp_subdev.c        | 36 +-------------
 7 files changed, 1 insertion(+), 246 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 4968ec51ff1b..0d90683ed227 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -241,24 +241,6 @@ static int gc0310_write_reg_array(struct i2c_client *client,
 	return __gc0310_flush_reg_array(client, &ctrl);
 }
 
-static int gc0310_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
-{
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-
-	*val = dev->res->bin_factor_x;
-
-	return 0;
-}
-
-static int gc0310_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
-{
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-
-	*val = dev->res->bin_factor_y;
-
-	return 0;
-}
-
 static int gc0310_set_gain(struct v4l2_subdev *sd, int gain)
 
 {
@@ -441,12 +423,6 @@ static int gc0310_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
 		ret = gc0310_q_exposure(&dev->sd, &ctrl->val);
 		break;
-	case V4L2_CID_BIN_FACTOR_HORZ:
-		ret = gc0310_g_bin_factor_x(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_BIN_FACTOR_VERT:
-		ret = gc0310_g_bin_factor_y(&dev->sd, &ctrl->val);
-		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -491,28 +467,6 @@ static const struct v4l2_ctrl_config gc0310_controls[] = {
 		.step = 1,
 		.def = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_BIN_FACTOR_HORZ,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "horizontal binning factor",
-		.min = 0,
-		.max = GC0310_BIN_FACTOR_MAX,
-		.step = 1,
-		.def = 0,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_BIN_FACTOR_VERT,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "vertical binning factor",
-		.min = 0,
-		.max = GC0310_BIN_FACTOR_MAX,
-		.step = 1,
-		.def = 0,
-		.flags = 0,
-	},
 };
 
 static int gc0310_init(struct v4l2_subdev *sd)
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 1df38f5fe1f4..0e5a981dd331 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1016,24 +1016,6 @@ static int mt9m114_s_exposure_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int mt9m114_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
-{
-	struct mt9m114_device *dev = to_mt9m114_sensor(sd);
-
-	*val = mt9m114_res[dev->res].bin_factor_x;
-
-	return 0;
-}
-
-static int mt9m114_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
-{
-	struct mt9m114_device *dev = to_mt9m114_sensor(sd);
-
-	*val = mt9m114_res[dev->res].bin_factor_y;
-
-	return 0;
-}
-
 static int mt9m114_s_ev(struct v4l2_subdev *sd, s32 val)
 {
 	struct i2c_client *c = v4l2_get_subdevdata(sd);
@@ -1159,12 +1141,6 @@ static int mt9m114_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE_ZONE_NUM:
 		ret = mt9m114_g_exposure_zone_num(&dev->sd, &ctrl->val);
 		break;
-	case V4L2_CID_BIN_FACTOR_HORZ:
-		ret = mt9m114_g_bin_factor_x(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_BIN_FACTOR_VERT:
-		ret = mt9m114_g_bin_factor_y(&dev->sd, &ctrl->val);
-		break;
 	case V4L2_CID_EXPOSURE:
 		ret = mt9m114_g_ev(&dev->sd, &ctrl->val);
 		break;
@@ -1237,28 +1213,6 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
 		.def = 1,
 		.flags = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_BIN_FACTOR_HORZ,
-		.name = "horizontal binning factor",
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.min = 0,
-		.max = MT9M114_BIN_FACTOR_MAX,
-		.step = 1,
-		.def = 0,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_BIN_FACTOR_VERT,
-		.name = "vertical binning factor",
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.min = 0,
-		.max = MT9M114_BIN_FACTOR_MAX,
-		.step = 1,
-		.def = 0,
-		.flags = 0,
-	},
 	{
 		.ops = &ctrl_ops,
 		.id = V4L2_CID_EXPOSURE,
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 9379c25205b4..88fdeb828c6c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -119,27 +119,6 @@ static int ov2680_write_reg_array(struct i2c_client *client,
 	return 0;
 }
 
-static int ov2680_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
-{
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-
-	dev_dbg(&client->dev,  "++++ov2680_g_bin_factor_x\n");
-	*val = dev->res->bin_factor_x;
-
-	return 0;
-}
-
-static int ov2680_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
-{
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-
-	*val = dev->res->bin_factor_y;
-	dev_dbg(&client->dev,  "++++ov2680_g_bin_factor_y\n");
-	return 0;
-}
-
 static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 				  int gain, int digitgain)
 
@@ -419,12 +398,6 @@ static int ov2680_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
 		ret = ov2680_q_exposure(&dev->sd, &ctrl->val);
 		break;
-	case V4L2_CID_BIN_FACTOR_HORZ:
-		ret = ov2680_g_bin_factor_x(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_BIN_FACTOR_VERT:
-		ret = ov2680_g_bin_factor_y(&dev->sd, &ctrl->val);
-		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -449,28 +422,6 @@ static const struct v4l2_ctrl_config ov2680_controls[] = {
 		.def = 0x00,
 		.flags = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_BIN_FACTOR_HORZ,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "horizontal binning factor",
-		.min = 0,
-		.max = OV2680_BIN_FACTOR_MAX,
-		.step = 1,
-		.def = 0,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_BIN_FACTOR_VERT,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "vertical binning factor",
-		.min = 0,
-		.max = OV2680_BIN_FACTOR_MAX,
-		.step = 1,
-		.def = 0,
-		.flags = 0,
-	},
 	{
 		.ops = &ctrl_ops,
 		.id = V4L2_CID_VFLIP,
diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index e65759499d81..da8c3b1d3bcd 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -415,24 +415,6 @@ static int ov5693_write_reg_array(struct i2c_client *client,
 	return __ov5693_flush_reg_array(client, &ctrl);
 }
 
-static int ov5693_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
-{
-	struct ov5693_device *dev = to_ov5693_sensor(sd);
-
-	*val = ov5693_res[dev->fmt_idx].bin_factor_x;
-
-	return 0;
-}
-
-static int ov5693_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
-{
-	struct ov5693_device *dev = to_ov5693_sensor(sd);
-
-	*val = ov5693_res[dev->fmt_idx].bin_factor_y;
-
-	return 0;
-}
-
 static long __ov5693_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 				  int gain, int digitgain)
 
@@ -1014,12 +996,6 @@ static int ov5693_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_FOCUS_STATUS:
 		ret = ov5693_q_focus_status(&dev->sd, &ctrl->val);
 		break;
-	case V4L2_CID_BIN_FACTOR_HORZ:
-		ret = ov5693_g_bin_factor_x(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_BIN_FACTOR_VERT:
-		ret = ov5693_g_bin_factor_y(&dev->sd, &ctrl->val);
-		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -1099,28 +1075,6 @@ static const struct v4l2_ctrl_config ov5693_controls[] = {
 		.def = 0,
 		.flags = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_BIN_FACTOR_HORZ,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "horizontal binning factor",
-		.min = 0,
-		.max = OV5693_BIN_FACTOR_MAX,
-		.step = 1,
-		.def = 0,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_BIN_FACTOR_VERT,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "vertical binning factor",
-		.min = 0,
-		.max = OV5693_BIN_FACTOR_MAX,
-		.step = 1,
-		.def = 0,
-		.flags = 0,
-	},
 };
 
 static int ov5693_init(struct v4l2_subdev *sd)
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index d6da776e9bf4..63b1bcd35399 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -1071,10 +1071,6 @@ struct atomisp_sensor_ae_bracketing_lut {
 /* Query Focus Status */
 #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
 
-/* Query sensor's binning factor */
-#define V4L2_CID_BIN_FACTOR_HORZ	   (V4L2_CID_CAMERA_LASTP1 + 15)
-#define V4L2_CID_BIN_FACTOR_VERT	   (V4L2_CID_CAMERA_LASTP1 + 16)
-
 /* number of frames to skip at stream start */
 #define V4L2_CID_G_SKIP_FRAMES		   (V4L2_CID_CAMERA_LASTP1 + 17)
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d202b2b9ae18..9cb9685d91bb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -172,24 +172,6 @@ static struct v4l2_queryctrl ci_v4l2_controls[] = {
 		.step = 1,
 		.default_value = 1,
 	},
-	{
-		.id = V4L2_CID_BIN_FACTOR_HORZ,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Horizontal binning factor",
-		.minimum = 0,
-		.maximum = 10,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_BIN_FACTOR_VERT,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Vertical binning factor",
-		.minimum = 0,
-		.maximum = 10,
-		.step = 1,
-		.default_value = 0,
-	},
 	{
 		.id = V4L2_CID_2A_STATUS,
 		.type = V4L2_CTRL_TYPE_BITMASK,
@@ -1827,8 +1809,6 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 		case V4L2_CID_EXPOSURE_ABSOLUTE:
 		case V4L2_CID_EXPOSURE_AUTO:
 		case V4L2_CID_IRIS_ABSOLUTE:
-		case V4L2_CID_BIN_FACTOR_HORZ:
-		case V4L2_CID_BIN_FACTOR_VERT:
 		case V4L2_CID_3A_LOCK:
 		case V4L2_CID_TEST_PATTERN:
 		case V4L2_CID_TEST_PATTERN_COLOR_R:
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index cadc468b4c2f..fc9e07bf63ae 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -574,40 +574,6 @@ static int isp_subdev_set_selection(struct v4l2_subdev *sd,
 					    sel->target, sel->flags, &sel->r);
 }
 
-static int atomisp_get_sensor_bin_factor(struct atomisp_sub_device *asd)
-{
-	struct v4l2_control ctrl = {0};
-	struct atomisp_device *isp = asd->isp;
-	int hbin, vbin;
-	int ret;
-
-	if (isp->inputs[asd->input_curr].type == FILE_INPUT ||
-	    isp->inputs[asd->input_curr].type == TEST_PATTERN)
-		return 0;
-
-	ctrl.id = V4L2_CID_BIN_FACTOR_HORZ;
-	ret =
-	    v4l2_g_ctrl(isp->inputs[asd->input_curr].camera->ctrl_handler,
-			&ctrl);
-	hbin = ctrl.value;
-	ctrl.id = V4L2_CID_BIN_FACTOR_VERT;
-	ret |=
-	    v4l2_g_ctrl(isp->inputs[asd->input_curr].camera->ctrl_handler,
-			&ctrl);
-	vbin = ctrl.value;
-
-	/*
-	 * ISP needs to know binning factor from sensor.
-	 * In case horizontal and vertical sensor's binning factors
-	 * are different or sensor does not support binning factor CID,
-	 * ISP will apply default 0 value.
-	 */
-	if (ret || hbin != vbin)
-		hbin = 0;
-
-	return hbin;
-}
-
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     uint32_t which,
@@ -645,7 +611,7 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 							 ATOMISP_INPUT_STREAM_GENERAL, ffmt);
 			atomisp_css_input_set_binning_factor(isp_sd,
 							     ATOMISP_INPUT_STREAM_GENERAL,
-							     atomisp_get_sensor_bin_factor(isp_sd));
+							     0);
 			atomisp_css_input_set_bayer_order(isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
 							  fc->bayer_order);
 			atomisp_css_input_set_format(isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
-- 
2.39.0

