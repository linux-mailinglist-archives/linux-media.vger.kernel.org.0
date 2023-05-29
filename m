Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E9C714800
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbjE2Kjg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbjE2Kje (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2A5DE
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hjJ9FNeGRlkTdpI+kOKuG2VRr3rPDBgWcEmjDPBKML4=;
        b=IxScb3BXLejKzu7wtniJZzNW/AnQ8GgSU79rnzupRzffTnNCFBNLD6mAt3u90vJx6n+lLx
        tY/R2witGYNWgjlr0g21htkXTb+7EbDjnKtWGn7mBASYQEh1iRX83XXw4j0YY1wU2djeo1
        KBqRXs57B8lLGw4+zGD//qp8WgVCdeM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-GdP3wUyqPsmd48MJPbfWXA-1; Mon, 29 May 2023 06:38:50 -0400
X-MC-Unique: GdP3wUyqPsmd48MJPbfWXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EF5638184E0;
        Mon, 29 May 2023 10:38:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1AF2A2166B2B;
        Mon, 29 May 2023 10:38:48 +0000 (UTC)
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
Subject: [PATCH 15/21] media: atomisp: Add support for sensors which implement selection API / cropping
Date:   Mon, 29 May 2023 12:37:35 +0200
Message-Id: <20230529103741.11904-16-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sensor drivers which implement set_selection V4L2_SEL_TGT_CROP expect
v4l2_subdev_state.pads[pad].try_crop to have valid contents when calling
set_fmt with which == V4L2_SUBDEV_FORMAT_TRY since the crop-rectangle
may influence the available image size.

Just passing an uninitalized struct v4l2_subdev_pad_config from
the stack to set_fmt with which == V4L2_SUBDEV_FORMAT_TRY will result
in wrong results with such drivers.

Store a per sensor v4l2_subdev_pad_config and add a new
atomisp_init_sensor_crop() function to initialize this before
registering /dev/* nodes with userspace.

Sensor drivers which implement the selection API will allow
the atomisp to properly deal with the extra padding the ISP wants
on a per sensor basis instead of hardcoding this.
atomisp_init_sensor_crop() stores the native and active rects
of the sensor in preparation for using these for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  6 +-
 .../media/atomisp/pci/atomisp_internal.h      |  7 +++
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 55 +++++++++++++++++++
 3 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 9531baa26fe0..8c48d566131f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3696,9 +3696,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
-	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg,
+		.pads = &input->pad_cfg,
 	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
@@ -4162,9 +4161,8 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 	struct atomisp_device *isp = asd->isp;
 	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	const struct atomisp_format_bridge *format;
-	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg,
+		.pads = &input->pad_cfg,
 	};
 	struct v4l2_subdev_format vformat = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index e59c0f1e7f53..14d21c6e227d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -125,7 +125,14 @@
 struct atomisp_input_subdev {
 	unsigned int type;
 	enum atomisp_camera_port port;
+	bool crop_support;
 	struct v4l2_subdev *camera;
+	/* Sensor rects for sensors which support crop */
+	struct v4l2_rect native_rect;
+	struct v4l2_rect active_rect;
+	/* Sensor pad_cfg for which == V4L2_SUBDEV_FORMAT_TRY calls */
+	struct v4l2_subdev_pad_config pad_cfg;
+
 	struct v4l2_subdev *motor;
 
 	/*
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index a2ce9bbf10df..506f04ca92b1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -931,6 +931,59 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	return ret;
 }
 
+static void atomisp_init_sensor(struct atomisp_input_subdev *input)
+{
+	struct v4l2_subdev_state sd_state = {
+		.pads = &input->pad_cfg,
+	};
+	struct v4l2_subdev_selection sel = { };
+	int err;
+
+	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sel.target = V4L2_SEL_TGT_NATIVE_SIZE;
+	err = v4l2_subdev_call(input->camera, pad, get_selection, NULL, &sel);
+	if (err)
+		return;
+
+	input->native_rect = sel.r;
+
+	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sel.target = V4L2_SEL_TGT_CROP_DEFAULT;
+	err = v4l2_subdev_call(input->camera, pad, get_selection, NULL, &sel);
+	if (err)
+		return;
+
+	input->active_rect = sel.r;
+
+	/*
+	 * The ISP also wants the non-active pixels at the border of the sensor
+	 * for padding, set the crop rect to cover the entire sensor instead
+	 * of only the default active area.
+	 *
+	 * Do this for both try and active formats since the try_crop rect in
+	 * pad_cfg may influence (clamp) future try_fmt calls with which == try.
+	 */
+	sel.which = V4L2_SUBDEV_FORMAT_TRY;
+	sel.target = V4L2_SEL_TGT_CROP;
+	sel.r = input->native_rect;
+	err = v4l2_subdev_call(input->camera, pad, set_selection, &sd_state, &sel);
+	if (err)
+		return;
+
+	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sel.target = V4L2_SEL_TGT_CROP;
+	sel.r = input->native_rect;
+	err = v4l2_subdev_call(input->camera, pad, set_selection, NULL, &sel);
+	if (err)
+		return;
+
+	dev_info(input->camera->dev, "Supports crop native %dx%d active %dx%d\n",
+		 input->native_rect.width, input->native_rect.height,
+		 input->active_rect.width, input->active_rect.height);
+
+	input->crop_support = true;
+}
+
 int atomisp_register_device_nodes(struct atomisp_device *isp)
 {
 	struct atomisp_input_subdev *input;
@@ -952,6 +1005,8 @@ int atomisp_register_device_nodes(struct atomisp_device *isp)
 		input->port = i;
 		input->camera = isp->sensor_subdevs[i];
 
+		atomisp_init_sensor(input);
+
 		/*
 		 * HACK: Currently VCM belongs to primary sensor only, but correct
 		 * approach must be to acquire from platform code which sensor
-- 
2.40.1

