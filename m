Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27EE4708526
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbjERPis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbjERPio (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:38:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A3211C
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684424275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xzv9rbVqfgZKX+kt3WNOrOC9mOEahw7mbIZlAszPjog=;
        b=PJAUp6d7O5JP8oJqcLV0IAipCJACl0cOsksb5GENGWumtvKHe+QDqGmk0IwlxyEdR7LYYq
        ZhHBdyW06/DUgXJDc5DitH0TCM3b2eIS0W5jAZRgTxrWPzq9aRwtRPCn4e2geW3Wy5CQQw
        RpaKNXMb1CbthMrIJr3F90o6IO6goVc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-pjy8UjvjNU-jGSl4l-Z7AA-1; Thu, 18 May 2023 11:37:50 -0400
X-MC-Unique: pjy8UjvjNU-jGSl4l-Z7AA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01437802A95;
        Thu, 18 May 2023 15:37:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 722D663F5F;
        Thu, 18 May 2023 15:37:48 +0000 (UTC)
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
Subject: [PATCH 8/9] media: atomisp: Allow camera_mipi_info to be NULL
Date:   Thu, 18 May 2023 17:37:32 +0200
Message-Id: <20230518153733.195306-9-hdegoede@redhat.com>
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

camera_mipi_info is an atomisp / atomisp_gmin_platform specific struct,
allow mipi_info pointers to be NULL.

This is a preparation patch for making atomisp work with
standard v4l2 sensor drivers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 33 ++++++++++---------
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  6 +---
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index f4a0341d1f8d..5b244d173b9a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3919,6 +3919,8 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	const struct atomisp_in_fmt_conv *fc;
 	int mipi_freq = 0;
 	unsigned int input_format, bayer_order;
+	enum atomisp_input_format metadata_format = ATOMISP_INPUT_FORMAT_EMBEDDED;
+	u32 mipi_port, metadata_width = 0, metadata_height = 0;
 
 	ctrl.id = V4L2_CID_LINK_FREQ;
 	if (v4l2_g_ctrl
@@ -3946,7 +3948,7 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 
 	/* Compatibility for sensors which provide no media bus code
 	 * in s_mbus_framefmt() nor support pad formats. */
-	if (mipi_info->input_format != -1) {
+	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
 		/* Input stream config is still needs configured */
@@ -3956,6 +3958,9 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 		if (!fc)
 			return -EINVAL;
 		input_format = fc->atomisp_in_fmt;
+		metadata_format = mipi_info->metadata_format;
+		metadata_width = mipi_info->metadata_width;
+		metadata_height = mipi_info->metadata_height;
 	} else {
 		struct v4l2_mbus_framefmt *sink;
 
@@ -3972,18 +3977,17 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	atomisp_css_input_set_format(asd, stream_id, input_format);
 	atomisp_css_input_set_bayer_order(asd, stream_id, bayer_order);
 
-	fc = atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-		 mipi_info->metadata_format);
+	fc = atomisp_find_in_fmt_conv_by_atomisp_in_fmt(metadata_format);
 	if (!fc)
 		return -EINVAL;
+
 	input_format = fc->atomisp_in_fmt;
-	atomisp_css_input_configure_port(asd,
-					 atomisp_port_to_mipi_port(asd->isp, mipi_info->port),
-					 mipi_info->num_lanes,
+	mipi_port = atomisp_port_to_mipi_port(isp, isp->inputs[asd->input_curr].port);
+	atomisp_css_input_configure_port(asd, mipi_port,
+					 isp->sensor_lanes[mipi_port],
 					 0xffff4, mipi_freq,
 					 input_format,
-					 mipi_info->metadata_width,
-					 mipi_info->metadata_height);
+					 metadata_width, metadata_height);
 	return 0;
 }
 
@@ -4071,7 +4075,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	int (*configure_pp_input)(struct atomisp_sub_device *asd,
 				  unsigned int width, unsigned int height) =
 				      configure_pp_input_nop;
-	const struct atomisp_in_fmt_conv *fc;
+	const struct atomisp_in_fmt_conv *fc = NULL;
 	int ret, i;
 
 	if (!asd) {
@@ -4093,15 +4097,14 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	if (isp->inputs[asd->input_curr].type != TEST_PATTERN) {
 		mipi_info = atomisp_to_sensor_mipi_info(
 				isp->inputs[asd->input_curr].camera);
-		if (!mipi_info) {
-			dev_err(isp->dev, "mipi_info is NULL\n");
-			return -EINVAL;
-		}
+
 		if (atomisp_set_sensor_mipi_to_isp(asd, ATOMISP_INPUT_STREAM_GENERAL,
 						   mipi_info))
 			return -EINVAL;
-		fc = atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-			 mipi_info->input_format);
+
+		if (mipi_info)
+			fc = atomisp_find_in_fmt_conv_by_atomisp_in_fmt(mipi_info->input_format);
+
 		if (!fc)
 			fc = atomisp_find_in_fmt_conv(
 				 atomisp_subdev_get_ffmt(&asd->subdev,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index b00bc0b7aaad..0045c4d3a7f6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -322,15 +322,11 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-	struct camera_mipi_info *mipi_info;
 	int mipi_freq = 0;
 	enum atomisp_camera_port port;
-
 	int n;
 
-	mipi_info = atomisp_to_sensor_mipi_info(
-			isp->inputs[asd->input_curr].camera);
-	port = mipi_info->port;
+	port = isp->inputs[asd->input_curr].port;
 
 	ctrl.id = V4L2_CID_LINK_FREQ;
 	if (v4l2_g_ctrl
-- 
2.40.1

