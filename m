Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3891E1E8E88
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgE3G5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:57:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:45016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728851AbgE3G4I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:08 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF20221897;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821764;
        bh=nH5rtDxPNK1Gakh5jDnYxn/bhzeaetx2TYQBH3jwn7E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TpFnv6ny2Zn5kQCefjg9fhGpoWlYxdLwyM2i9kgWckRtiy1XBsgZR+BQj6aW6XaY6
         m/dTmO1KA51TjnDS6X4wyvtp3+EGL5X2Hq1h4WI+Z6RSUh0QBgqJFakVaXETvTafj2
         NC3pmFDZpGrlQXszswL2ql6d+Tbxhrnt46B1nJeA=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPV-001hqK-NU; Sat, 30 May 2020 08:56:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 29/41] media: atomisp: do another round of coding style cleanup
Date:   Sat, 30 May 2020 08:55:46 +0200
Message-Id: <691be1dad35302a844c98d6ce8c34b170de00ff0.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Run checkpatch --fix-inline again, in order to get rid
of some additional issues that got introduced (or that
checkpatch can now detect).

This should help preventing receiving random cleanups,
while keeping the code on a better shape.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/TODO            |  4 +--
 drivers/staging/media/atomisp/i2c/Kconfig     |  2 +-
 .../media/atomisp/i2c/atomisp-gc0310.c        |  1 -
 .../media/atomisp/i2c/atomisp-ov2680.c        |  2 +-
 drivers/staging/media/atomisp/i2c/ov2680.h    |  2 ++
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |  4 +--
 .../staging/media/atomisp/include/hmm/hmm.h   |  2 +-
 .../media/atomisp/include/linux/atomisp.h     |  2 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  3 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c |  5 ++--
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  5 ++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  4 ++-
 .../css_2400_system/hive/ia_css_isp_states.c  |  2 +-
 .../css_2401_system/hive/ia_css_isp_configs.c |  1 -
 .../css_2401_system/hive/ia_css_isp_states.c  |  2 +-
 .../pci/css_2401_system/isys_dma_global.h     |  1 +
 drivers/staging/media/atomisp/pci/css_trace.h |  1 -
 .../pci/hive_isp_css_common/host/debug.c      |  1 -
 .../hive_isp_css_common/host/debug_private.h  |  1 -
 .../pci/hive_isp_css_include/string_support.h |  1 -
 .../media/atomisp/pci/ia_css_isp_states.h     |  2 +-
 .../media/atomisp/pci/ia_css_pipe_public.h    |  2 +-
 .../staging/media/atomisp/pci/ia_css_types.h  |  1 -
 .../isp/kernels/anr/anr_2/ia_css_anr2_param.h |  2 +-
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.c   |  2 +-
 .../macc/macc1_5/ia_css_macc1_5_param.h       |  2 +-
 .../sdis/common/ia_css_sdis_common.host.h     |  4 +--
 .../media/atomisp/pci/isp2400_system_local.h  |  5 ++++
 .../media/atomisp/pci/isp2401_system_local.h  |  5 ++++
 .../atomisp/pci/runtime/event/src/event.c     |  1 -
 .../atomisp/pci/runtime/frame/src/frame.c     |  9 +++---
 drivers/staging/media/atomisp/pci/sh_css.c    | 29 ++++++++++++-------
 .../staging/media/atomisp/pci/sh_css_defs.h   |  3 --
 .../staging/media/atomisp/pci/sh_css_params.c |  6 +++-
 .../staging/media/atomisp/pci/sh_css_struct.h |  1 +
 35 files changed, 67 insertions(+), 53 deletions(-)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index 9456ffbfe4aa..e58643a9de43 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -173,8 +173,8 @@ Limitations
    device but can also be extracted from the upgrade kit if you've managed
    to lose them somehow.
 
-2. Without a 3A libary the capture behaviour is not very good. To take a good
-   picture, you need tune ISP parameters by IOCTL functions or use a 3A libary
+2. Without a 3A library the capture behaviour is not very good. To take a good
+   picture, you need tune ISP parameters by IOCTL functions or use a 3A library
    such as libxcam.
 
 3. The driver is intended to drive the PCI exposed versions of the device.
diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index f7f7177b9b37..caf712c7d1f2 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -57,7 +57,7 @@ config VIDEO_ATOMISP_GC0310
 	---help---
 	  This is a Video4Linux2 sensor-level driver for the Galaxycore
 	  GC0310 0.3MP sensor.
-	 
+
 config VIDEO_ATOMISP_OV2680
        tristate "Omnivision OV2680 sensor support"
 	depends on ACPI
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index ad1bd7d6a02b..799383b1101d 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -1321,7 +1321,6 @@ static int gc0310_probe(struct i2c_client *client)
 		__func__, acpi_device_bid(adev), acpi_device_hid(adev));
 	// FIXME: may need to release resources allocated by acpi_bus_get_device()
 
-
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 1b60f6a9c0e0..df6d3f82fba7 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -703,7 +703,7 @@ static int power_ctrl(struct v4l2_subdev *sd, bool flag)
 	if (!dev || !dev->platform_data)
 		return -ENODEV;
 
-	dev_dbg(&client->dev, "%s: %s", __func__, flag? "on" : "off");
+	dev_dbg(&client->dev, "%s: %s", __func__, flag ? "on" : "off");
 
 	if (flag) {
 		ret |= dev->platform_data->v1p8_ctrl(sd, 1);
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 034e1032f6c0..f4e618062e9c 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -456,6 +456,7 @@ static struct ov2680_reg const ov2680_656x496_30fps[] = {
 	// {0x5090, 0x0c},
 	{}
 };
+
 /*
 * 800x600 30fps  VBlanking 1lane 10Bit (binning)
 */
@@ -500,6 +501,7 @@ static struct ov2680_reg const ov2680_720x592_30fps[] = {
 	{0x5081, 0x41},
 	{}
 };
+
 /*
 * 800x600 30fps  VBlanking 1lane 10Bit (binning)
 */
diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index 2be0ef14d53e..62e49a3804f9 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -1087,7 +1087,7 @@ static int ov5693_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VCM_SLEW:
 		ret = ov5693_t_vcm_slew(&dev->sd, ctrl->val);
 		break;
-	case V4L2_CID_VCM_TIMEING:
+	case V4L2_CID_VCM_TIMING:
 		ret = ov5693_t_vcm_timing(&dev->sd, ctrl->val);
 		break;
 	default:
@@ -1230,7 +1230,7 @@ static const struct v4l2_ctrl_config ov5693_controls[] = {
 	},
 	{
 		.ops = &ctrl_ops,
-		.id = V4L2_CID_VCM_TIMEING,
+		.id = V4L2_CID_VCM_TIMING,
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.name = "vcm step time",
 		.min = 0,
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 5d725a6b6e10..a91d17a80d9a 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -29,7 +29,7 @@
 #include "ia_css_types.h"
 
 #define mmgr_NULL              ((ia_css_ptr)0)
-#define mmgr_EXCEPTION         ((ia_css_ptr)-1)
+#define mmgr_EXCEPTION         ((ia_css_ptr) - 1)
 
 int hmm_pool_register(unsigned int pool_size, enum hmm_pool_type pool_type);
 void hmm_pool_unregister(enum hmm_pool_type pool_type);
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index fc2e76694613..1acfb53eb171 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -1274,7 +1274,7 @@ struct atomisp_sensor_ae_bracketing_lut {
 /* VCM slew control */
 #define V4L2_CID_VCM_SLEW                  (V4L2_CID_CAMERA_LASTP1 + 11)
 /* VCM step time */
-#define V4L2_CID_VCM_TIMEING               (V4L2_CID_CAMERA_LASTP1 + 12)
+#define V4L2_CID_VCM_TIMING                (V4L2_CID_CAMERA_LASTP1 + 12)
 
 /* Query Focus Status */
 #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 2758c2da60da..5754e66eb024 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -6005,10 +6005,9 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 				 output_info.padded_width, 8);
 		pipe->pix.sizeimage =
 		    PAGE_ALIGN(f->fmt.pix.height * pipe->pix.bytesperline);
-
 	}
 	dev_dbg(isp->dev, "%s: image size: %d, %d bytes per line\n",
-		__func__, pipe->pix.sizeimage,pipe-> pix.bytesperline);
+		__func__, pipe->pix.sizeimage, pipe->pix.bytesperline);
 
 	if (f->fmt.pix.field == V4L2_FIELD_ANY)
 		f->fmt.pix.field = V4L2_FIELD_NONE;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index b096b7d30463..18010bc861fc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -479,7 +479,6 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	if (i >= MAX_SUBDEVS)
 		return NULL;
 
-
 	if (power) {
 		gmin_subdevs[i].pwm_i2c_addr = power->addr;
 		dev_info(dev,
@@ -616,6 +615,7 @@ static int axp_regulator_set(struct device *dev, struct gmin_subdev *gs,
 static int axp_v1p8_on(struct device *dev, struct gmin_subdev *gs)
 {
 	int ret;
+
 	ret = axp_regulator_set(dev, gs, gs->eldo2_sel_reg, gs->eldo2_1p8v,
 				ELDO_CTRL_REG, gs->eldo2_ctrl_shift, true);
 	if (ret)
@@ -640,6 +640,7 @@ static int axp_v1p8_on(struct device *dev, struct gmin_subdev *gs)
 static int axp_v1p8_off(struct device *dev, struct gmin_subdev *gs)
 {
 	int ret;
+
 	ret = axp_regulator_set(dev, gs, gs->eldo1_sel_reg, gs->eldo1_1p8v,
 				ELDO_CTRL_REG, gs->eldo1_ctrl_shift, false);
 	if (ret)
@@ -650,7 +651,6 @@ static int axp_v1p8_off(struct device *dev, struct gmin_subdev *gs)
 	return ret;
 }
 
-
 static int gmin_gpio0_ctrl(struct v4l2_subdev *subdev, int on)
 {
 	struct gmin_subdev *gs = find_gmin_subdev(subdev);
@@ -753,7 +753,6 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 		dev_err(subdev->dev, "Couldn't set power mode for v1p2\n");
 	}
 
-
 	return -EINVAL;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d02c500d53b7..e5ade03e4749 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1563,7 +1563,7 @@ int atomisp_stream_on_master_slave_sensor(struct atomisp_device *isp,
 
 /* FIXME! ISP2400 */
 static void __wdt_on_master_slave_sensor(struct atomisp_device *isp,
-				         unsigned int wdt_duration)
+					 unsigned int wdt_duration)
 {
 	if (atomisp_buffers_queued(&isp->asd[0]))
 		atomisp_wdt_refresh(&isp->asd[0], wdt_duration);
@@ -2467,7 +2467,6 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 	int i;
 	int ret = 0;
 
-
 	if (!atomisp_hw_is_isp2401)
 		motor = isp->inputs[asd->input_curr].motor;
 	else
@@ -2484,7 +2483,7 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 		case V4L2_CID_EXPOSURE_METERING:
 		case V4L2_CID_IRIS_ABSOLUTE:
 		case V4L2_CID_FNUMBER_ABSOLUTE:
-		case V4L2_CID_VCM_TIMEING:
+		case V4L2_CID_VCM_TIMING:
 		case V4L2_CID_VCM_SLEW:
 		case V4L2_CID_3A_LOCK:
 		case V4L2_CID_TEST_PATTERN:
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 719ded53ffd8..891c990ab857 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1092,10 +1092,11 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 	/* FIXME: should return -EPROBE_DEFER if not all subdevs were probed */
 	for (count = 0; count < SUBDEV_WAIT_TIMEOUT_MAX_COUNT; count++) {
 		int camera_count = 0;
+
 		for (subdevs = pdata->subdevs; subdevs->type; ++subdevs) {
 			if (subdevs->type == RAW_CAMERA ||
 			    subdevs->type == SOC_CAMERA)
-				camera_count ++;
+				camera_count++;
 		}
 		if (camera_count)
 			break;
@@ -1571,6 +1572,7 @@ static int init_atomisp_wdts(struct atomisp_device *isp)
 
 	for (i = 0; i < isp->num_of_streams; i++) {
 		struct atomisp_sub_device *asd = &isp->asd[i];
+
 		if (!atomisp_hw_is_isp2401)
 			timer_setup(&asd->wdt, atomisp_wdt, 0);
 		else {
diff --git a/drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_states.c
index 42e0344c677d..aac816f8d252 100644
--- a/drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_states.c
+++ b/drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_states.c
@@ -210,7 +210,7 @@ ia_css_initialize_ynr_state(
 
 /* Code generated by genparam/genstate.c:gen_state_init_table() */
 
-void (* ia_css_kernel_init_state[IA_CSS_NUM_STATE_IDS])(
+void (*ia_css_kernel_init_state[IA_CSS_NUM_STATE_IDS])(
     const struct ia_css_binary *binary) = {
 	ia_css_initialize_aa_state,
 	ia_css_initialize_cnr_state,
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_configs.c
index 29d85407cac4..3ef556a64825 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_configs.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_configs.c
@@ -272,7 +272,6 @@ ia_css_configure_output(
 			    "ia_css_configure_output() leave:\n");
 }
 
-
 /* Code generated by genparam/genconfig.c:gen_configure_function() */
 
 void
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_states.c
index c54787f3fc24..a8cc21d45bd8 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_states.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_states.c
@@ -210,7 +210,7 @@ ia_css_initialize_ynr_state(
 
 /* Code generated by genparam/genstate.c:gen_state_init_table() */
 
-void (* ia_css_kernel_init_state[IA_CSS_NUM_STATE_IDS])(
+void (*ia_css_kernel_init_state[IA_CSS_NUM_STATE_IDS])(
     const struct ia_css_binary *binary) = {
 	ia_css_initialize_aa_state,
 	ia_css_initialize_cnr_state,
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/isys_dma_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/isys_dma_global.h
index 2ca4d5210a38..636d34a83931 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/isys_dma_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/isys_dma_global.h
@@ -46,6 +46,7 @@ struct isys2401_dma_port_cfg_s {
 	u32 cropping;
 	u32 width;
 };
+
 /* end of DMA Port */
 
 /************************************************
diff --git a/drivers/staging/media/atomisp/pci/css_trace.h b/drivers/staging/media/atomisp/pci/css_trace.h
index 32520c21c324..f272098b28d0 100644
--- a/drivers/staging/media/atomisp/pci/css_trace.h
+++ b/drivers/staging/media/atomisp/pci/css_trace.h
@@ -171,7 +171,6 @@ enum TRACE_DUMP_FORMAT {
 #define TRACE_ISP_DATA_SIZE   (TRACE_ISP_SIZE - TRACE_ISP_HEADER_SIZE)
 #define TRACE_ISP_MAX_POINTS  (TRACE_ISP_DATA_SIZE / TRACE_ISP_ITEM_SIZE)
 
-
 /* common majors */
 /* SP0 */
 #define MAJOR_MAIN              1
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
index 85b054c5ec80..200926cca00f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
@@ -20,7 +20,6 @@
 #include "debug_private.h"
 #endif /* __INLINE_DEBUG__ */
 
-
 #define __INLINE_SP__
 #include "sp.h"
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
index 0b107ee13072..23b18a824cc4 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
@@ -22,7 +22,6 @@
 #define __INLINE_ISP__
 #include "isp.h"
 
-
 #include "assert_support.h"
 
 STORAGE_CLASS_DEBUG_C bool is_debug_buffer_empty(void)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h
index 84efbbe78650..f653ec797601 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support.h
@@ -161,5 +161,4 @@ static inline int strcpy_s(
 	return 0;
 }
 
-
 #endif /* __STRING_SUPPORT_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
index cc9cdcd0e2be..d50c7d5ed5b6 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
@@ -65,7 +65,7 @@ struct ia_css_state_memory_offsets {
 #include "ia_css_binary.h"   /* struct ia_css_binary */
 /* Code generated by genparam/genstate.c:gen_state_init_table() */
 
-extern void (* ia_css_kernel_init_state[IA_CSS_NUM_STATE_IDS])(
+extern void (*ia_css_kernel_init_state[IA_CSS_NUM_STATE_IDS])(
     const struct ia_css_binary *binary);
 
 #endif /* IA_CSS_INCLUDE_STATE */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
index e782978a5ce7..34d64998202a 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
@@ -502,7 +502,7 @@ ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe,
  */
 enum ia_css_err
 ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
-				      uint32_t fw_handle,
+				      u32 fw_handle,
 				      struct ia_css_isp_param_css_segments *css_seg,
 				      struct ia_css_isp_param_isp_segments *isp_seg);
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index d3584756e34e..65073332301a 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -306,7 +306,6 @@ struct ia_css_shading_info {
 			u32 bayer_scale_ver_ratio_in;
 			u32 bayer_scale_ver_ratio_out;
 
-
 			/** Vertical ratio of bayer scaling
 			between input height and output height, for the scaling
 			which should be done before shading correction.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h
index 47a0fb08cfcc..629c9ae6ad23 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h
@@ -21,7 +21,7 @@
 /* Advanced Noise Reduction (ANR) thresholds */
 
 struct ia_css_isp_anr2_params {
-	VMEM_ARRAY(data, ANR_PARAM_SIZE *ISP_VEC_NELEMS);
+	VMEM_ARRAY(data, ANR_PARAM_SIZE * ISP_VEC_NELEMS);
 };
 
 #endif /* __IA_CSS_ANR2_PARAM_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
index 6888a7363710..43c57e401a86 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
@@ -42,7 +42,7 @@ static const s32 div_lut_intercepts[BNLM_DIV_LUT_SIZE] = {
  */
 static inline void
 bnlm_lut_encode(struct bnlm_lut *lut, const int32_t *lut_thr,
-		const int32_t *lut_val, const uint32_t lut_size)
+		const s32 *lut_val, const uint32_t lut_size)
 {
 	u32 blk, i;
 	const u32 block_size = 16;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_param.h
index 497ad89ab728..1ac2c9c50a71 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_param.h
@@ -25,7 +25,7 @@ struct sh_css_isp_macc1_5_params {
 };
 
 struct sh_css_isp_macc1_5_vmem_params {
-	VMEM_ARRAY(data, IA_CSS_MACC_NUM_COEFS *ISP_NWAY);
+	VMEM_ARRAY(data, IA_CSS_MACC_NUM_COEFS * ISP_NWAY);
 };
 
 #endif /* __IA_CSS_MACC1_5_PARAM_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common.host.h
index c03936fb0550..7f84762d9b98 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common.host.h
@@ -76,12 +76,12 @@ struct sh_css_isp_sdis_vert_proj_tbl {
 
 struct sh_css_isp_sdis_hori_coef_tbl {
 	VMEM_ARRAY(tbl[ISP_DVS_NUM_COEF_TYPES],
-		   ISP_MAX_SDIS_HOR_COEF_NUM_VECS *ISP_NWAY);
+		   ISP_MAX_SDIS_HOR_COEF_NUM_VECS * ISP_NWAY);
 };
 
 struct sh_css_isp_sdis_vert_coef_tbl {
 	VMEM_ARRAY(tbl[ISP_DVS_NUM_COEF_TYPES],
-		   ISP_MAX_SDIS_VER_COEF_NUM_VECS *ISP_NWAY);
+		   ISP_MAX_SDIS_VER_COEF_NUM_VECS * ISP_NWAY);
 };
 
 #endif /* defined(__ISP) || defined (MK_FIRMWARE) */
diff --git a/drivers/staging/media/atomisp/pci/isp2400_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
index ee38059d6ceb..dad28e42ce5c 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_system_local.h
@@ -106,6 +106,7 @@ static const hrt_address IRQ_BASE[N_IRQ_ID] = {
 	(hrt_address)0x000000000008C000ULL,
 	(hrt_address)0x0000000000090200ULL
 };
+
 /*
 	(hrt_address)0x0000000000000500ULL};
  */
@@ -161,6 +162,7 @@ static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
 static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
 	(hrt_address)0x0000000000080000ULL
 };
+
 /*	(hrt_address)0x0000000000081000ULL, */ /* capture A */
 /*	(hrt_address)0x0000000000082000ULL, */ /* capture B */
 /*	(hrt_address)0x0000000000083000ULL, */ /* capture C */
@@ -247,6 +249,7 @@ static const hrt_address IRQ_BASE[N_IRQ_ID] = {
 	(hrt_address)0x0008C000UL,
 	(hrt_address)0x00090200UL
 };
+
 /*
 	(hrt_address)0x00000500UL};
  */
@@ -297,12 +300,14 @@ static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
 	(hrt_address)0x00030200UL,
 	(hrt_address)0x00030400UL
 };
+
 /*	(hrt_address)0x00030600UL, */ /* memcpy() */
 
 /* INPUT_SYSTEM */
 static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
 	(hrt_address)0x00080000UL
 };
+
 /*	(hrt_address)0x00081000UL, */ /* capture A */
 /*	(hrt_address)0x00082000UL, */ /* capture B */
 /*	(hrt_address)0x00083000UL, */ /* capture C */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
index 4bd95b818494..1917b1d3b660 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_system_local.h
@@ -104,6 +104,7 @@ static const hrt_address IRQ_BASE[N_IRQ_ID] = {
 	0x000000000008C000ULL,
 	0x0000000000090200ULL
 };
+
 /*
 	0x0000000000000500ULL};
  */
@@ -160,6 +161,7 @@ static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
 static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
 	0x0000000000080000ULL
 };
+
 /*	0x0000000000081000ULL, */ /* capture A */
 /*	0x0000000000082000ULL, */ /* capture B */
 /*	0x0000000000083000ULL, */ /* capture C */
@@ -287,6 +289,7 @@ static const hrt_address IRQ_BASE[N_IRQ_ID] = {
 	0x0008C000UL,
 	0x00090200UL
 };
+
 /*
 	0x00000500UL};
  */
@@ -336,12 +339,14 @@ static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
 	0x00030200UL,
 	0x00030400UL
 };
+
 /*	0x00030600UL, */ /* memcpy() */
 
 /* INPUT_SYSTEM */
 static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
 	0x00080000UL
 };
+
 /*	0x00081000UL, */ /* capture A */
 /*	0x00082000UL, */ /* capture B */
 /*	0x00083000UL, */ /* capture C */
diff --git a/drivers/staging/media/atomisp/pci/runtime/event/src/event.c b/drivers/staging/media/atomisp/pci/runtime/event/src/event.c
index 4bbed9ee2e35..0de9de64db55 100644
--- a/drivers/staging/media/atomisp/pci/runtime/event/src/event.c
+++ b/drivers/staging/media/atomisp/pci/runtime/event/src/event.c
@@ -29,7 +29,6 @@
 
 /*#include "sp.h"*/	/* host2sp_enqueue_frame_data() */
 
-
 #include "assert_support.h"
 #include "platform_support.h"	/* hrt_sleep() */
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 95dcb2b86388..1fa8f7f6ab11 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -281,8 +281,7 @@ enum ia_css_err ia_css_frame_allocate_contiguous(struct ia_css_frame **frame,
 	enum ia_css_err err = IA_CSS_SUCCESS;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_frame_allocate_contiguous() "
-			    "enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
+			    "ia_css_frame_allocate_contiguous() enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
 			    width, height, format, padded_width, raw_bit_depth);
 
 	err = frame_allocate_with_data(frame, width, height, format,
@@ -802,9 +801,9 @@ static enum ia_css_err frame_allocate_buffer_data(struct ia_css_frame *frame)
 	IA_CSS_ENTER_LEAVE_PRIVATE("frame->data_bytes=%d\n", frame->data_bytes);
 #endif
 	frame->data = hmm_alloc(frame->data_bytes,
-			        HMM_BO_PRIVATE, 0, NULL,
-			        frame->contiguous ?
-			        ATOMISP_MAP_FLAG_CONTIGUOUS : 0);
+				HMM_BO_PRIVATE, 0, NULL,
+				frame->contiguous ?
+				ATOMISP_MAP_FLAG_CONTIGUOUS : 0);
 
 	if (frame->data == mmgr_NULL)
 		return IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 90d73fd8aa1b..7fa8ac0c9714 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3686,6 +3686,7 @@ static enum ia_css_err create_host_video_pipeline(struct ia_css_pipe *pipe)
 	}
 	if (video_stage) {
 		int frm;
+
 		for (frm = 0; frm < NUM_TNR_FRAMES; frm++) {
 			video_stage->args.tnr_frames[frm] =
 			    pipe->pipe_settings.video.tnr_frames[frm];
@@ -6685,7 +6686,8 @@ static enum ia_css_err load_low_light_binaries(
 	return err;
 }
 
-static bool copy_on_sp(struct ia_css_pipe *pipe) {
+static bool copy_on_sp(struct ia_css_pipe *pipe)
+{
 	bool rval;
 
 	assert(pipe);
@@ -7379,7 +7381,8 @@ unload_yuvpp_binaries(struct ia_css_pipe *pipe) {
 	return IA_CSS_SUCCESS;
 }
 
-static enum ia_css_err yuvpp_start(struct ia_css_pipe *pipe) {
+static enum ia_css_err yuvpp_start(struct ia_css_pipe *pipe)
+{
 	struct ia_css_binary *copy_binary;
 	enum ia_css_err err = IA_CSS_SUCCESS;
 	enum sh_css_pipe_config_override copy_ovrd;
@@ -8406,7 +8409,8 @@ remove_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware) {
 	return; /* removing single and multiple firmware is handled in acc_unload_extension() */
 }
 
-static enum ia_css_err upload_isp_code(struct ia_css_fw_info *firmware) {
+static enum ia_css_err upload_isp_code(struct ia_css_fw_info *firmware)
+{
 	ia_css_ptr binary;
 
 	if (!firmware) {
@@ -8663,7 +8667,8 @@ enum ia_css_err ia_css_stream_capture(
 	return return_err;
 }
 
-void ia_css_stream_request_flash(struct ia_css_stream *stream) {
+void ia_css_stream_request_flash(struct ia_css_stream *stream)
+{
 	(void)stream;
 
 	assert(stream);
@@ -8764,7 +8769,8 @@ sh_css_init_host_sp_control_vars(void) {
 /*
     * create the internal structures and fill in the configuration data
     */
-void ia_css_pipe_config_defaults(struct ia_css_pipe_config *pipe_config) {
+void ia_css_pipe_config_defaults(struct ia_css_pipe_config *pipe_config)
+{
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_pipe_config_defaults()\n");
 	*pipe_config = DEFAULT_PIPE_CONFIG;
 }
@@ -8786,7 +8792,8 @@ ia_css_pipe_extra_config_defaults(struct ia_css_pipe_extra_config
 	extra_config->enable_fractional_ds = false;
 }
 
-void ia_css_stream_config_defaults(struct ia_css_stream_config *stream_config) {
+void ia_css_stream_config_defaults(struct ia_css_stream_config *stream_config)
+{
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_config_defaults()\n");
 	assert(stream_config);
 	memset(stream_config, 0, sizeof(*stream_config));
@@ -8840,6 +8847,7 @@ ia_css_pipe_create(const struct ia_css_pipe_config *config,
 	if (!pipe)
 #else
 }
+
 if (!pipe)
 {
 	IA_CSS_LEAVE_ERR_PRIVATE(IA_CSS_ERR_INVALID_ARGUMENTS);
@@ -9059,7 +9067,8 @@ ia_css_pipe_get_info(const struct ia_css_pipe *pipe,
 	return IA_CSS_SUCCESS;
 }
 
-bool ia_css_pipe_has_dvs_stats(struct ia_css_pipe_info *pipe_info) {
+bool ia_css_pipe_has_dvs_stats(struct ia_css_pipe_info *pipe_info)
+{
 	unsigned int i;
 
 	if (pipe_info) {
@@ -9915,7 +9924,6 @@ ia_css_stream_get_info(const struct ia_css_stream *stream,
     */
 enum ia_css_err
 ia_css_stream_load(struct ia_css_stream *stream) {
-
 	if (!atomisp_hw_is_isp2401) {
 		int i;
 		enum ia_css_err err;
@@ -10492,7 +10500,8 @@ ia_css_update_continuous_frames(struct ia_css_stream *stream) {
 	return IA_CSS_SUCCESS;
 }
 
-void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map) {
+void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
+{
 	unsigned int thread_id;
 	enum ia_css_pipe_id pipe_id;
 	unsigned int pipe_num;
@@ -10755,7 +10764,7 @@ ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
 /* ISP2401 */
 enum ia_css_err
 ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
-					uint32_t fw_handle,
+					u32 fw_handle,
 					struct ia_css_isp_param_css_segments *css_seg,
 					struct ia_css_isp_param_isp_segments *isp_seg) {
 	unsigned int HIVE_ADDR_sp_group;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
index d444af82c309..1317e86849fb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
@@ -177,7 +177,6 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 #define SH_CSS_MORPH_TABLE_ELEMS_PER_DDR_WORD \
 	(HIVE_ISP_DDR_WORD_BYTES / SH_CSS_MORPH_TABLE_ELEM_BYTES)
 
-
 #define ISP2400_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR   (SH_CSS_MAX_BQ_GRID_WIDTH + 1)
 #define ISP2400_SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR   (SH_CSS_MAX_BQ_GRID_HEIGHT + 1)
 
@@ -275,7 +274,6 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 	(ISP_BQ_GRID_HEIGHT(input_height, deci_factor_log2) + \
 	SH_CSS_SCTBL_CENTERING_MARGIN + SH_CSS_SCTBL_LAST_GRID_COUNT)
 
-
 /* ISP2401: Legacy API: Number of horizontal grids per color in the shading table. */
 #define _ISP_SCTBL_LEGACY_WIDTH_PER_COLOR(input_width, deci_factor_log2) \
 	(ISP_BQ_GRID_WIDTH(input_width, deci_factor_log2) + SH_CSS_SCTBL_LAST_GRID_COUNT)
@@ -284,7 +282,6 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 #define _ISP_SCTBL_LEGACY_HEIGHT(input_height, deci_factor_log2) \
 	(ISP_BQ_GRID_HEIGHT(input_height, deci_factor_log2) + SH_CSS_SCTBL_LAST_GRID_COUNT)
 
-
 /* *****************************************************************
  * Statistics for 3A (Auto Focus, Auto White Balance, Auto Exposure)
  * *****************************************************************/
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 45df88e2aa74..ea5ce1221f5c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -4249,12 +4249,16 @@ sh_css_params_write_to_ddr_internal(
 	{
 		unsigned int i;
 		ia_css_ptr *virt_addr_tetra_x[
+
 		IA_CSS_MORPH_TABLE_NUM_PLANES];
 		size_t *virt_size_tetra_x[
+
 		IA_CSS_MORPH_TABLE_NUM_PLANES];
 		ia_css_ptr *virt_addr_tetra_y[
+
 		IA_CSS_MORPH_TABLE_NUM_PLANES];
 		size_t *virt_size_tetra_y[
+
 		IA_CSS_MORPH_TABLE_NUM_PLANES];
 
 		virt_addr_tetra_x[0] = &ddr_map->tetra_r_x;
@@ -4565,7 +4569,7 @@ free_ia_css_isp_parameter_set_info(
 	enum ia_css_err err = IA_CSS_SUCCESS;
 	struct ia_css_isp_parameter_set_info isp_params_info;
 	unsigned int i;
-	ia_css_ptr *addrs = (ia_css_ptr *) &isp_params_info.mem_map;
+	ia_css_ptr *addrs = (ia_css_ptr *)&isp_params_info.mem_map;
 
 	IA_CSS_ENTER_PRIVATE("ptr = %u", ptr);
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_struct.h b/drivers/staging/media/atomisp/pci/sh_css_struct.h
index 9e25887b9ab8..d4ea847d29ce 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_struct.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_struct.h
@@ -66,6 +66,7 @@ struct sh_css {
 #endif
 	ia_css_ptr                   sp_bin_addr;
 	hrt_data                       page_table_base_index;
+
 	unsigned int
 	size_mem_words; /* \deprecated{Use ia_css_mipi_buffer_config instead.}*/
 	enum ia_css_irq_type           irq_type;
-- 
2.26.2

