Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082756D31CC
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbjDAPBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjDAPBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E12D1EFC4
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9p7Od3sAYEk1CgnqH+EkvcH2i880ldmpe7bHStWUwTg=;
        b=EL+U5R3kR+rN1zOlsYuSSCkCafNmBCqqtoyc0geRAtI2gjZmc4me9qYjVF4AakMY/PiywC
        gBGlaTmv1P1mj/o2ImAD2aih0uPNj+MggKDXWKgIUcFdsH0l5Y0OcApDy6XNiqTV9//9Xc
        WcC55QgDTBylyZ1jQvpWgdJMIORQSAY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-w71TyjDdMSGVTs_yv5P6NA-1; Sat, 01 Apr 2023 11:00:23 -0400
X-MC-Unique: w71TyjDdMSGVTs_yv5P6NA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6989F101A531;
        Sat,  1 Apr 2023 15:00:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D7A4E400F59;
        Sat,  1 Apr 2023 15:00:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 24/28] media: atomisp: Remove atomisp_try_fmt() call from atomisp_set_fmt()
Date:   Sat,  1 Apr 2023 16:59:22 +0200
Message-Id: <20230401145926.596216-25-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_set_fmt() first calls:

v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
                 pad, set_fmt, ...);

with v4l2_subdev_format.which set to V4L2_SUBDEV_FORMAT_ACTIVE and then
reduces width + height by padding_w / padding_h followed by calling
atomisp_try_fmt() which then sets res_overflow if the requested resolution
is larger then the sensor's max resolution, but that will never happen
since we are requesting for the result of a set_fmt call minus padding,
so res_overflow will always be false.

And when called with a res_overflow parameter, combined with there
being no overflow then atomisp_try_fmt() does not change the passed
in width/height.

Except when using JPEG or CUSTOM_M10MO_RAW as pixelformat, then
atomisp_try_fmt() does change the width/height but in that case
atomisp_set_fmt actually restores the old widht/height which it
has saved before the atomisp_try_fmt() call. So this too is a no-op.

TL;DR: The atomisp_try_fmt() call in atomisp_set_fmt() is a no-op,
remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 56 ++-----------------
 1 file changed, 6 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 0fca4bc605ec..b5d094417fc5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4434,7 +4434,7 @@ static void atomisp_get_dis_envelop(struct atomisp_sub_device *asd,
 }
 
 static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
-				    int source_pad, struct v4l2_pix_format *f)
+				    int source_pad, const struct v4l2_pix_format *f)
 {
 	struct v4l2_mbus_framefmt *sink, *src;
 
@@ -4457,8 +4457,7 @@ static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
 	dev_dbg(asd->isp->dev, "copy_mode: %d\n", asd->copy_mode);
 }
 
-static int atomisp_set_fmt_to_snr(struct video_device *vdev,
-				  struct v4l2_pix_format *f, unsigned int pixelformat,
+static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_pix_format *f,
 				  unsigned int padding_w, unsigned int padding_h,
 				  unsigned int dvs_env_w, unsigned int dvs_env_h)
 {
@@ -4491,7 +4490,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 
 	v4l2_fh_init(&fh.vfh, vdev);
 
-	format = atomisp_get_format_bridge(pixelformat);
+	format = atomisp_get_format_bridge(f->pixelformat);
 	if (!format)
 		return -EINVAL;
 
@@ -4567,8 +4566,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	const struct atomisp_format_bridge *format_bridge;
 	const struct atomisp_format_bridge *snr_format_bridge;
 	struct ia_css_frame_info output_info;
-	struct v4l2_pix_format snr_fmt;
-	struct v4l2_pix_format backup_fmt, s_fmt;
 	unsigned int dvs_env_w = 0, dvs_env_h = 0;
 	unsigned int padding_w = pad_w, padding_h = pad_h;
 	struct v4l2_mbus_framefmt isp_source_fmt = {0};
@@ -4577,7 +4574,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	};
 	struct v4l2_rect isp_sink_crop;
 	u16 source_pad = atomisp_subdev_source_pad(vdev);
-	bool res_overflow = false;
 	struct v4l2_subdev_fh fh;
 	int ret;
 
@@ -4626,19 +4622,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	f->fmt.pix.width = vformat.format.width - padding_w;
 	f->fmt.pix.height = vformat.format.height - padding_h;
 
-	snr_fmt = f->fmt.pix;
-	backup_fmt = snr_fmt;
-
-	/* get sensor resolution and format */
-	ret = atomisp_try_fmt(vdev, &snr_fmt, &res_overflow);
-	if (ret) {
-		dev_warn(isp->dev, "Try format failed with error %d\n", ret);
-		return ret;
-	}
-	f->fmt.pix.width = snr_fmt.width;
-	f->fmt.pix.height = snr_fmt.height;
-
-	snr_format_bridge = atomisp_get_format_bridge(snr_fmt.pixelformat);
+	snr_format_bridge = atomisp_get_format_bridge_from_mbus(vformat.format.code);
 	if (!snr_format_bridge) {
 		dev_warn(isp->dev, "Can't find bridge format\n");
 		return -EINVAL;
@@ -4659,40 +4643,12 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		padding_h = 0;
 	}
 
-	/* construct resolution supported by isp */
-	if (res_overflow) {
-		f->fmt.pix.width = rounddown(
-				       clamp_t(u32, f->fmt.pix.width - padding_w,
-					       ATOM_ISP_MIN_WIDTH,
-					       ATOM_ISP_MAX_WIDTH), ATOM_ISP_STEP_WIDTH);
-		f->fmt.pix.height = rounddown(
-					clamp_t(u32, f->fmt.pix.height - padding_h,
-						ATOM_ISP_MIN_HEIGHT,
-						ATOM_ISP_MAX_HEIGHT), ATOM_ISP_STEP_HEIGHT);
-	}
-
 	atomisp_get_dis_envelop(asd, f->fmt.pix.width, f->fmt.pix.height,
 				&dvs_env_w, &dvs_env_h);
 
 	asd->capture_pad = source_pad;
 
-	/*
-	 * For jpeg or custom raw format the sensor will return constant
-	 * width and height. Because we already had quried try_mbus_fmt,
-	 * f->fmt.pix.width and f->fmt.pix.height has been changed to
-	 * this fixed width and height. So we cannot select the correct
-	 * resolution with that information. So use the original width
-	 * and height while set_mbus_fmt() so actual resolutions are
-	 * being used in while set media bus format.
-	 */
-	s_fmt = f->fmt.pix;
-	if (f->fmt.pix.pixelformat == V4L2_PIX_FMT_JPEG ||
-	    f->fmt.pix.pixelformat == V4L2_PIX_FMT_CUSTOM_M10MO_RAW) {
-		s_fmt.width = backup_fmt.width;
-		s_fmt.height = backup_fmt.height;
-	}
-
-	ret = atomisp_set_fmt_to_snr(vdev, &s_fmt, f->fmt.pix.pixelformat,
+	ret = atomisp_set_fmt_to_snr(vdev, &f->fmt.pix,
 				     padding_w, padding_h, dvs_env_w, dvs_env_h);
 	if (ret) {
 		dev_warn(isp->dev,
@@ -4702,7 +4658,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 
 	atomisp_csi_lane_config(isp);
 
-	atomisp_check_copy_mode(asd, source_pad, &backup_fmt);
+	atomisp_check_copy_mode(asd, source_pad, &f->fmt.pix);
 
 	isp_sink_crop = *atomisp_subdev_get_rect(&asd->subdev, NULL,
 			V4L2_SUBDEV_FORMAT_ACTIVE,
-- 
2.39.1

