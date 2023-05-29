Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE1BB7147FD
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbjE2Kjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbjE2Kjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FAFEC
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2WTUyKM7JYFaOLJYxV2vzVHcK/yxDtTpWHu4bshmsYY=;
        b=FZAnrQBUTMB7KwXLlhSutzPDXeiKrD0VKUZ5iFu/vm2Fbxx3vkgu0geiahvVEMjmwzfF8r
        er3/miP9vy70JavVi1s2MnlZtvmMj/qEB2T9FnUqTlyvTYFYeioHD8iQmEdpX1HyNvH5OR
        d74zXFzZhhuuI6TOUMA4mrSDbYFHaqw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-NLz6GPG8OB2pf7QxWDRUNg-1; Mon, 29 May 2023 06:38:16 -0400
X-MC-Unique: NLz6GPG8OB2pf7QxWDRUNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B25A2A59565;
        Mon, 29 May 2023 10:38:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6F31B2166B2B;
        Mon, 29 May 2023 10:38:14 +0000 (UTC)
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
Subject: [PATCH 07/21] media: atomisp: Remove a bunch of sensor related custom IOCTLs
Date:   Mon, 29 May 2023 12:37:27 +0200
Message-Id: <20230529103741.11904-8-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove a bunch of sensor related custom IOCTLs because:

1. They are custom IOCTLs and all custom IOCTLs should be removed
2. Userspace should directly talk to the sensor v4l2-subdev, rather
   then relying on ioctl-s on the output /dev/video# node to pass
   through ioctl-s to the senor
3. Some of these rely on the atomisp specific camera_mipi_info struct
   which is going away as we are switching to using standard v4l2
   sensor drivers
4. In the case of ATOMISP_IOC_S_EXPOSURE_WINDOW this was using the
   v4l2-subdev set_selection API in an undocumented atomisp custom way

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |  40 ---
 .../media/atomisp/include/linux/atomisp.h     | 120 ---------
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 240 ------------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  10 -
 .../atomisp/pci/atomisp_compat_ioctl32.h      |  55 ----
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  33 ---
 6 files changed, 498 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index c94fe8e861a5..460a4e34c55b 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -726,51 +726,11 @@ static void *ov5693_otp_read(struct v4l2_subdev *sd)
 	return buf;
 }
 
-static int ov5693_g_priv_int_data(struct v4l2_subdev *sd,
-				  struct v4l2_private_int_data *priv)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct ov5693_device *dev = to_ov5693_sensor(sd);
-	u8 __user *to = priv->data;
-	u32 read_size = priv->size;
-	int ret;
-
-	/* No need to copy data if size is 0 */
-	if (!read_size)
-		goto out;
-
-	if (IS_ERR(dev->otp_data)) {
-		dev_err(&client->dev, "OTP data not available");
-		return PTR_ERR(dev->otp_data);
-	}
-
-	/* Correct read_size value only if bigger than maximum */
-	if (read_size > OV5693_OTP_DATA_SIZE)
-		read_size = OV5693_OTP_DATA_SIZE;
-
-	ret = copy_to_user(to, dev->otp_data, read_size);
-	if (ret) {
-		dev_err(&client->dev, "%s: failed to copy OTP data to user\n",
-			__func__);
-		return -EFAULT;
-	}
-
-	pr_debug("%s read_size:%d\n", __func__, read_size);
-
-out:
-	/* Return correct size */
-	priv->size = dev->otp_size;
-
-	return 0;
-}
-
 static long ov5693_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
 {
 	switch (cmd) {
 	case ATOMISP_IOC_S_EXPOSURE:
 		return ov5693_s_exposure(sd, arg);
-	case ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA:
-		return ov5693_g_priv_int_data(sd, arg);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index bada4c9911fd..14b1757e6674 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -149,12 +149,6 @@ enum atomisp_calibration_type {
 	calibration_type3
 };
 
-struct atomisp_calibration_group {
-	unsigned int size;
-	unsigned int type;
-	unsigned short *calb_grp_values;
-};
-
 struct atomisp_gc_config {
 	__u16 gain_k1;
 	__u16 gain_k2;
@@ -265,26 +259,6 @@ enum atomisp_metadata_type {
 	ATOMISP_METADATA_TYPE_NUM,
 };
 
-struct atomisp_metadata_with_type {
-	/* to specify which type of metadata to get */
-	enum atomisp_metadata_type type;
-	void __user *data;
-	u32 width;
-	u32 height;
-	u32 stride; /* in bytes */
-	u32 exp_id; /* exposure ID */
-	u32 *effective_width; /* mipi packets valid data size */
-};
-
-struct atomisp_metadata {
-	void __user *data;
-	u32 width;
-	u32 height;
-	u32 stride; /* in bytes */
-	u32 exp_id; /* exposure ID */
-	u32 *effective_width; /* mipi packets valid data size */
-};
-
 struct atomisp_ext_isp_ctrl {
 	u32 id;
 	u32 data;
@@ -298,14 +272,6 @@ struct atomisp_3a_statistics {
 	u32 isp_config_id; /* isp config ID */
 };
 
-struct atomisp_ae_window {
-	int x_left;
-	int x_right;
-	int y_top;
-	int y_bottom;
-	int weight;
-};
-
 /* White Balance (Gain Adjust) */
 struct atomisp_wb_config {
 	unsigned int integer_bits;
@@ -754,53 +720,6 @@ struct atomisp_s_runmode {
 	__u32 mode;
 };
 
-struct atomisp_update_exposure {
-	unsigned int gain;
-	unsigned int digi_gain;
-	unsigned int update_gain;
-	unsigned int update_digi_gain;
-};
-
-/*
- * V4L2 private internal data interface.
- * -----------------------------------------------------------------------------
- * struct v4l2_private_int_data - request private data stored in video device
- * internal memory.
- * @size: sanity check to ensure userspace's buffer fits whole private data.
- *	  If not, kernel will make partial copy (or nothing if @size == 0).
- *	  @size is always corrected for the minimum necessary if IOCTL returns
- *	  no error.
- * @data: pointer to userspace buffer.
- */
-struct v4l2_private_int_data {
-	__u32 size;
-	void __user *data;
-	__u32 reserved[2];
-};
-
-enum atomisp_sensor_ae_bracketing_mode {
-	SENSOR_AE_BRACKETING_MODE_OFF = 0,
-	SENSOR_AE_BRACKETING_MODE_SINGLE, /* back to SW standby after bracketing */
-	SENSOR_AE_BRACKETING_MODE_SINGLE_TO_STREAMING, /* back to normal streaming after bracketing */
-	SENSOR_AE_BRACKETING_MODE_LOOP, /* continue AE bracketing in loop mode */
-};
-
-struct atomisp_sensor_ae_bracketing_info {
-	unsigned int modes; /* bit mask to indicate supported modes  */
-	unsigned int lut_depth;
-};
-
-struct atomisp_sensor_ae_bracketing_lut_entry {
-	__u16 coarse_integration_time;
-	__u16 analog_gain;
-	__u16 digital_gain;
-};
-
-struct atomisp_sensor_ae_bracketing_lut {
-	struct atomisp_sensor_ae_bracketing_lut_entry *lut;
-	unsigned int lut_size;
-};
-
 /*Private IOCTLs for ISP */
 #define ATOMISP_IOC_G_XNR \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 0, int)
@@ -905,20 +824,12 @@ struct atomisp_sensor_ae_bracketing_lut {
 #define ATOMISP_IOC_S_EXPOSURE \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 21, struct atomisp_exposure)
 
-/* sensor calibration registers group */
-#define ATOMISP_IOC_G_SENSOR_CALIBRATION_GROUP \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 22, struct atomisp_calibration_group)
-
 /* white balance Correction */
 #define ATOMISP_IOC_G_3A_CONFIG \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 23, struct atomisp_3a_config)
 #define ATOMISP_IOC_S_3A_CONFIG \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 23, struct atomisp_3a_config)
 
-/* sensor OTP memory read */
-#define ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 26, struct v4l2_private_int_data)
-
 /* LCS (shading) table write */
 #define ATOMISP_IOC_S_ISP_SHD_TAB \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 27, struct atomisp_shading_table)
@@ -930,19 +841,9 @@ struct atomisp_sensor_ae_bracketing_lut {
 #define ATOMISP_IOC_S_ISP_GAMMA_CORRECTION \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 28, struct atomisp_gc_config)
 
-/* motor internal memory read */
-#define ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 29, struct v4l2_private_int_data)
-
 #define ATOMISP_IOC_S_PARAMETERS \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 32, struct atomisp_parameters)
 
-#define ATOMISP_IOC_G_METADATA \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 34, struct atomisp_metadata)
-
-#define ATOMISP_IOC_G_METADATA_BY_TYPE \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 34, struct atomisp_metadata_with_type)
-
 #define ATOMISP_IOC_EXT_ISP_CTRL \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 35, struct atomisp_ext_isp_ctrl)
 
@@ -961,27 +862,9 @@ struct atomisp_sensor_ae_bracketing_lut {
 #define ATOMISP_IOC_S_FORMATS_CONFIG \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 39, struct atomisp_formats_config)
 
-#define ATOMISP_IOC_S_EXPOSURE_WINDOW \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 40, struct atomisp_ae_window)
-
 #define ATOMISP_IOC_INJECT_A_FAKE_EVENT \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 42, int)
 
-#define ATOMISP_IOC_G_SENSOR_AE_BRACKETING_INFO \
-	_IOR('v', BASE_VIDIOC_PRIVATE + 43, struct atomisp_sensor_ae_bracketing_info)
-
-#define ATOMISP_IOC_S_SENSOR_AE_BRACKETING_MODE \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 43, unsigned int)
-
-#define ATOMISP_IOC_G_SENSOR_AE_BRACKETING_MODE \
-	_IOR('v', BASE_VIDIOC_PRIVATE + 43, unsigned int)
-
-#define ATOMISP_IOC_S_SENSOR_AE_BRACKETING_LUT \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 43, struct atomisp_sensor_ae_bracketing_lut)
-
-#define ATOMISP_IOC_G_INVALID_FRAME_NUM \
-	_IOR('v', BASE_VIDIOC_PRIVATE + 44, unsigned int)
-
 #define ATOMISP_IOC_S_ARRAY_RESOLUTION \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 45, struct atomisp_resolution)
 
@@ -995,9 +878,6 @@ struct atomisp_sensor_ae_bracketing_lut {
 #define ATOMISP_IOC_S_SENSOR_RUNMODE \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 48, struct atomisp_s_runmode)
 
-#define ATOMISP_IOC_G_UPDATE_EXPOSURE \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 49, struct atomisp_update_exposure)
-
 /*
  * Reserved ioctls. We have customer implementing it internally.
  * We can't use both numbers to not cause ABI conflict.
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5b244d173b9a..748cb78d1ee8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1851,161 +1851,6 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-int atomisp_get_metadata(struct atomisp_sub_device *asd, int flag,
-			 struct atomisp_metadata *md)
-{
-	struct atomisp_device *isp = asd->isp;
-	struct ia_css_stream_info *stream_info;
-	struct camera_mipi_info *mipi_info;
-	struct atomisp_metadata_buf *md_buf;
-	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
-	int ret, i;
-
-	if (flag != 0)
-		return -EINVAL;
-
-	stream_info = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
-		      stream_info;
-
-	/* We always return the resolution and stride even if there is
-	 * no valid metadata. This allows the caller to get the information
-	 * needed to allocate user-space buffers. */
-	md->width  = stream_info->metadata_info.resolution.width;
-	md->height = stream_info->metadata_info.resolution.height;
-	md->stride = stream_info->metadata_info.stride;
-
-	/* sanity check to avoid writing into unallocated memory.
-	 * This does not return an error because it is a valid way
-	 * for applications to detect that metadata is not enabled. */
-	if (md->width == 0 || md->height == 0 || !md->data)
-		return 0;
-
-	/* This is done in the atomisp_buf_done() */
-	if (list_empty(&asd->metadata_ready[md_type])) {
-		dev_warn(isp->dev, "Metadata queue is empty now!\n");
-		return -EAGAIN;
-	}
-
-	mipi_info = atomisp_to_sensor_mipi_info(
-			isp->inputs[asd->input_curr].camera);
-	if (!mipi_info)
-		return -EINVAL;
-
-	if (mipi_info->metadata_effective_width) {
-		for (i = 0; i < md->height; i++)
-			md->effective_width[i] =
-			    mipi_info->metadata_effective_width[i];
-	}
-
-	md_buf = list_entry(asd->metadata_ready[md_type].next,
-			    struct atomisp_metadata_buf, list);
-	md->exp_id = md_buf->metadata->exp_id;
-	if (md_buf->md_vptr) {
-		ret = copy_to_user(md->data,
-				   md_buf->md_vptr,
-				   stream_info->metadata_info.size);
-	} else {
-		hmm_load(md_buf->metadata->address,
-			 asd->params.metadata_user[md_type],
-			 stream_info->metadata_info.size);
-
-		ret = copy_to_user(md->data,
-				   asd->params.metadata_user[md_type],
-				   stream_info->metadata_info.size);
-	}
-	if (ret) {
-		dev_err(isp->dev, "copy to user failed: copied %d bytes\n",
-			ret);
-		return -EFAULT;
-	}
-
-	list_del_init(&md_buf->list);
-	list_add_tail(&md_buf->list, &asd->metadata[md_type]);
-
-	dev_dbg(isp->dev, "%s: HAL de-queued metadata type %d with exp_id %d\n",
-		__func__, md_type, md->exp_id);
-	return 0;
-}
-
-int atomisp_get_metadata_by_type(struct atomisp_sub_device *asd, int flag,
-				 struct atomisp_metadata_with_type *md)
-{
-	struct atomisp_device *isp = asd->isp;
-	struct ia_css_stream_info *stream_info;
-	struct camera_mipi_info *mipi_info;
-	struct atomisp_metadata_buf *md_buf;
-	enum atomisp_metadata_type md_type;
-	int ret, i;
-
-	if (flag != 0)
-		return -EINVAL;
-
-	stream_info = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
-		      stream_info;
-
-	/* We always return the resolution and stride even if there is
-	 * no valid metadata. This allows the caller to get the information
-	 * needed to allocate user-space buffers. */
-	md->width  = stream_info->metadata_info.resolution.width;
-	md->height = stream_info->metadata_info.resolution.height;
-	md->stride = stream_info->metadata_info.stride;
-
-	/* sanity check to avoid writing into unallocated memory.
-	 * This does not return an error because it is a valid way
-	 * for applications to detect that metadata is not enabled. */
-	if (md->width == 0 || md->height == 0 || !md->data)
-		return 0;
-
-	md_type = md->type;
-	if (md_type < 0 || md_type >= ATOMISP_METADATA_TYPE_NUM)
-		return -EINVAL;
-
-	/* This is done in the atomisp_buf_done() */
-	if (list_empty(&asd->metadata_ready[md_type])) {
-		dev_warn(isp->dev, "Metadata queue is empty now!\n");
-		return -EAGAIN;
-	}
-
-	mipi_info = atomisp_to_sensor_mipi_info(
-			isp->inputs[asd->input_curr].camera);
-	if (!mipi_info)
-		return -EINVAL;
-
-	if (mipi_info->metadata_effective_width) {
-		for (i = 0; i < md->height; i++)
-			md->effective_width[i] =
-			    mipi_info->metadata_effective_width[i];
-	}
-
-	md_buf = list_entry(asd->metadata_ready[md_type].next,
-			    struct atomisp_metadata_buf, list);
-	md->exp_id = md_buf->metadata->exp_id;
-	if (md_buf->md_vptr) {
-		ret = copy_to_user(md->data,
-				   md_buf->md_vptr,
-				   stream_info->metadata_info.size);
-	} else {
-		hmm_load(md_buf->metadata->address,
-			 asd->params.metadata_user[md_type],
-			 stream_info->metadata_info.size);
-
-		ret = copy_to_user(md->data,
-				   asd->params.metadata_user[md_type],
-				   stream_info->metadata_info.size);
-	}
-	if (ret) {
-		dev_err(isp->dev, "copy to user failed: copied %d bytes\n",
-			ret);
-		return -EFAULT;
-	} else {
-		list_del_init(&md_buf->list);
-		list_add_tail(&md_buf->list, &asd->metadata[md_type]);
-	}
-	dev_dbg(isp->dev, "%s: HAL de-queued metadata type %d with exp_id %d\n",
-		__func__, md_type, md->exp_id);
-	return 0;
-}
-
 /*
  * Function to calculate real zoom region for every pipe
  */
@@ -4665,30 +4510,6 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 	return ret;
 }
 
-/*
- * set auto exposure metering window to camera sensor
- */
-int atomisp_s_ae_window(struct atomisp_sub_device *asd,
-			struct atomisp_ae_window *arg)
-{
-	struct atomisp_device *isp = asd->isp;
-	/* Coverity CID 298071 - initialzize struct */
-	struct v4l2_subdev_selection sel = { 0 };
-
-	sel.r.left = arg->x_left;
-	sel.r.top = arg->y_top;
-	sel.r.width = arg->x_right - arg->x_left + 1;
-	sel.r.height = arg->y_bottom - arg->y_top + 1;
-
-	if (v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-			     pad, set_selection, NULL, &sel)) {
-		dev_err(isp->dev, "failed to call sensor set_selection.\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 int atomisp_flash_enable(struct atomisp_sub_device *asd, int num_frames)
 {
 	struct atomisp_device *isp = asd->isp;
@@ -4868,64 +4689,3 @@ int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event)
 
 	return 0;
 }
-
-static int atomisp_get_pipe_id(struct atomisp_video_pipe *pipe)
-{
-	struct atomisp_sub_device *asd = pipe->asd;
-
-	if (!asd) {
-		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, pipe->vdev.name);
-		return -EINVAL;
-	}
-
-	if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
-		return IA_CSS_PIPE_ID_VIDEO;
-	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
-		return IA_CSS_PIPE_ID_CAPTURE;
-	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-		return IA_CSS_PIPE_ID_VIDEO;
-	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
-		return IA_CSS_PIPE_ID_PREVIEW;
-	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_STILL_CAPTURE) {
-		if (asd->copy_mode)
-			return IA_CSS_PIPE_ID_COPY;
-		else
-			return IA_CSS_PIPE_ID_CAPTURE;
-	}
-
-	/* fail through */
-	dev_warn(asd->isp->dev, "%s failed to find proper pipe\n",
-		 __func__);
-	return IA_CSS_PIPE_ID_CAPTURE;
-}
-
-int atomisp_get_invalid_frame_num(struct video_device *vdev,
-				  int *invalid_frame_num)
-{
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-	struct atomisp_sub_device *asd = pipe->asd;
-	enum ia_css_pipe_id pipe_id;
-	struct ia_css_pipe_info p_info;
-	int ret;
-
-	pipe_id = atomisp_get_pipe_id(pipe);
-	if (!asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].pipes[pipe_id]) {
-		dev_warn(asd->isp->dev,
-			 "%s pipe %d has not been created yet, do SET_FMT first!\n",
-			 __func__, pipe_id);
-		return -EINVAL;
-	}
-
-	ret = ia_css_pipe_get_info(
-		  asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
-		  .pipes[pipe_id], &p_info);
-	if (!ret) {
-		*invalid_frame_num = p_info.num_invalid_frames;
-		return 0;
-	} else {
-		dev_warn(asd->isp->dev, "%s get pipe infor failed %d\n",
-			 __func__, ret);
-		return -EINVAL;
-	}
-}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 5270c370e463..ff2178c96fb8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -159,13 +159,6 @@ int atomisp_set_dis_vector(struct atomisp_sub_device *asd,
 int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 		    struct atomisp_3a_statistics *config);
 
-/* Function to get metadata from isp */
-int atomisp_get_metadata(struct atomisp_sub_device *asd, int flag,
-			 struct atomisp_metadata *config);
-
-int atomisp_get_metadata_by_type(struct atomisp_sub_device *asd, int flag,
-				 struct atomisp_metadata_with_type *config);
-
 int atomisp_set_parameters(struct video_device *vdev,
 			   struct atomisp_parameters *arg);
 
@@ -267,9 +260,6 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 
 void atomisp_free_internal_buffers(struct atomisp_sub_device *asd);
 
-int atomisp_s_ae_window(struct atomisp_sub_device *asd,
-			struct atomisp_ae_window *arg);
-
 int  atomisp_flash_enable(struct atomisp_sub_device *asd,
 			  int num_frames);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
index 33821b51d90e..762520ed87a5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
@@ -67,26 +67,6 @@ struct atomisp_3a_statistics32 {
 	u32 isp_config_id;
 };
 
-struct atomisp_metadata_with_type32 {
-	/* to specify which type of metadata to get */
-	enum atomisp_metadata_type type;
-	compat_uptr_t data;
-	u32 width;
-	u32 height;
-	u32 stride; /* in bytes */
-	u32 exp_id; /* exposure ID */
-	compat_uptr_t effective_width;
-};
-
-struct atomisp_metadata32 {
-	compat_uptr_t data;
-	u32 width;
-	u32 height;
-	u32 stride;
-	u32 exp_id;
-	compat_uptr_t effective_width;
-};
-
 struct atomisp_morph_table32 {
 	unsigned int enabled;
 	unsigned int height;
@@ -134,18 +114,6 @@ struct atomisp_overlay32 {
 	unsigned int overlay_start_y;
 };
 
-struct atomisp_calibration_group32 {
-	unsigned int size;
-	unsigned int type;
-	compat_uptr_t calb_grp_values;
-};
-
-struct v4l2_private_int_data32 {
-	__u32 size;
-	compat_uptr_t data;
-	__u32 reserved[2];
-};
-
 struct atomisp_shading_table32 {
 	__u32 enable;
 	__u32 sensor_width;
@@ -249,11 +217,6 @@ struct atomisp_dvs_6axis_config32 {
 	compat_uptr_t ycoords_uv;
 };
 
-struct atomisp_sensor_ae_bracketing_lut32 {
-	compat_uptr_t lut;
-	unsigned int lut_size;
-};
-
 #define ATOMISP_IOC_G_HISTOGRAM32 \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 3, struct atomisp_histogram32)
 #define ATOMISP_IOC_S_HISTOGRAM32 \
@@ -283,28 +246,10 @@ struct atomisp_sensor_ae_bracketing_lut32 {
 #define ATOMISP_IOC_S_ISP_OVERLAY32 \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 18, struct atomisp_overlay32)
 
-#define ATOMISP_IOC_G_SENSOR_CALIBRATION_GROUP32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 22, struct atomisp_calibration_group32)
-
-#define ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 26, struct v4l2_private_int_data32)
-
 #define ATOMISP_IOC_S_ISP_SHD_TAB32 \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 27, struct atomisp_shading_table32)
 
-#define ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 29, struct v4l2_private_int_data32)
-
 #define ATOMISP_IOC_S_PARAMETERS32 \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 32, struct atomisp_parameters32)
 
-#define ATOMISP_IOC_G_METADATA32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 34, struct atomisp_metadata32)
-
-#define ATOMISP_IOC_G_METADATA_BY_TYPE32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 34, struct atomisp_metadata_with_type32)
-
-#define ATOMISP_IOC_S_SENSOR_AE_BRACKETING_LUT32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 43, struct atomisp_sensor_ae_bracketing_lut32)
-
 #endif /* __ATOMISP_COMPAT_IOCTL32_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 2cde1af77a2d..6a86dc7a933f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1921,31 +1921,10 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		err = atomisp_fixed_pattern_table(asd, arg);
 		break;
 
-	case ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA:
-		if (motor)
-			err = v4l2_subdev_call(motor, core, ioctl, cmd, arg);
-		else
-			err = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-					       core, ioctl, cmd, arg);
-		break;
-
 	case ATOMISP_IOC_S_EXPOSURE:
-	case ATOMISP_IOC_G_SENSOR_CALIBRATION_GROUP:
-	case ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA:
-	case ATOMISP_IOC_G_SENSOR_AE_BRACKETING_INFO:
-	case ATOMISP_IOC_S_SENSOR_AE_BRACKETING_MODE:
-	case ATOMISP_IOC_G_SENSOR_AE_BRACKETING_MODE:
-	case ATOMISP_IOC_S_SENSOR_AE_BRACKETING_LUT:
 		err = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 				       core, ioctl, cmd, arg);
 		break;
-	case ATOMISP_IOC_G_UPDATE_EXPOSURE:
-		if (IS_ISP2401)
-			err = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-					       core, ioctl, cmd, arg);
-		else
-			err = -EINVAL;
-		break;
 
 	case ATOMISP_IOC_S_ISP_SHD_TAB:
 		err = atomisp_set_shading_table(asd, arg);
@@ -1963,12 +1942,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		err = atomisp_set_parameters(vdev, arg);
 		break;
 
-	case ATOMISP_IOC_G_METADATA:
-		err = atomisp_get_metadata(asd, 0, arg);
-		break;
-	case ATOMISP_IOC_G_METADATA_BY_TYPE:
-		err = atomisp_get_metadata_by_type(asd, 0, arg);
-		break;
 	case ATOMISP_IOC_EXT_ISP_CTRL:
 		err = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 				       core, ioctl, cmd, arg);
@@ -1989,15 +1962,9 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 	case ATOMISP_IOC_S_FORMATS_CONFIG:
 		err = atomisp_formats(asd, 1, arg);
 		break;
-	case ATOMISP_IOC_S_EXPOSURE_WINDOW:
-		err = atomisp_s_ae_window(asd, arg);
-		break;
 	case ATOMISP_IOC_INJECT_A_FAKE_EVENT:
 		err = atomisp_inject_a_fake_event(asd, arg);
 		break;
-	case ATOMISP_IOC_G_INVALID_FRAME_NUM:
-		err = atomisp_get_invalid_frame_num(vdev, arg);
-		break;
 	case ATOMISP_IOC_S_ARRAY_RESOLUTION:
 		err = atomisp_set_array_res(asd, arg);
 		break;
-- 
2.40.1

