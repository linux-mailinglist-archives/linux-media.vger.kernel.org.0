Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4060069E2DE
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbjBUPA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbjBUPA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB5F93D7
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676991576;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PkjWOkRIndZUfF/YTGs93yN5o9BcsbFnbkOKoQ8RUi8=;
        b=VkTmJlOuUOghBhAXU3Ij/26R2cYPdoLTHBvALUM4diCLhlVGxzsFaYF70LewO/2NQthoY4
        czrYX+x0iXVm3H754cV6LXUum75HUQWRCIGi5Z64g5Xv1DL7WYryVqLmqrZivyhNoepFgO
        lsajp5/DCGCBrslTx9LuhhnXtctTlh4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-KRZv-xpSOKeFZ9TKcFjuhg-1; Tue, 21 Feb 2023 09:59:32 -0500
X-MC-Unique: KRZv-xpSOKeFZ9TKcFjuhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A87D285A5B1;
        Tue, 21 Feb 2023 14:59:31 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 733242026D4B;
        Tue, 21 Feb 2023 14:59:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 04/10] media: atomisp: Remove crop_needs_override from atomisp_set_fmt()
Date:   Tue, 21 Feb 2023 15:59:00 +0100
Message-Id: <20230221145906.8113-5-hdegoede@redhat.com>
In-Reply-To: <20230221145906.8113-1-hdegoede@redhat.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the crop_needs_override local helper variable from
atomisp_set_fmt(), as it always is true now.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 48 +++++++++----------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 2af0de77c6ae..22b8e13e9c2e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4634,7 +4634,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	struct v4l2_pix_format backup_fmt, s_fmt;
 	unsigned int dvs_env_w = 0, dvs_env_h = 0;
 	unsigned int padding_w = pad_w, padding_h = pad_h;
-	bool res_overflow = false, crop_needs_override = false;
 	struct v4l2_mbus_framefmt *isp_sink_fmt;
 	struct v4l2_mbus_framefmt isp_source_fmt = {0};
 	struct v4l2_subdev_format vformat = {
@@ -4642,6 +4641,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	};
 	struct v4l2_rect isp_sink_crop;
 	u16 source_pad = atomisp_subdev_source_pad(vdev);
+	bool res_overflow = false;
 	struct v4l2_subdev_fh fh;
 	int ret;
 
@@ -4855,7 +4855,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	}
 
 	atomisp_csi_lane_config(isp);
-	crop_needs_override = true;
 
 	atomisp_check_copy_mode(asd, source_pad, &backup_fmt);
 	asd->yuvpp_mode = false;			/* Reset variable */
@@ -4917,30 +4916,29 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		 * which appears to be related by a hardware
 		 * performance limitation.  It's unclear why this
 		 * particular code triggers the issue. */
-		if (crop_needs_override) {
-			if (isp_sink_crop.width * main_compose.height >
-			    isp_sink_crop.height * main_compose.width) {
-				sink_crop.height = isp_sink_crop.height;
-				sink_crop.width = DIV_NEAREST_STEP(
-						      sink_crop.height *
-						      f->fmt.pix.width,
-						      f->fmt.pix.height,
-						      ATOM_ISP_STEP_WIDTH);
-			} else {
-				sink_crop.width = isp_sink_crop.width;
-				sink_crop.height = DIV_NEAREST_STEP(
-						       sink_crop.width *
-						       f->fmt.pix.height,
-						       f->fmt.pix.width,
-						       ATOM_ISP_STEP_HEIGHT);
-			}
-			atomisp_subdev_set_selection(&asd->subdev, fh.state,
-						     V4L2_SUBDEV_FORMAT_ACTIVE,
-						     ATOMISP_SUBDEV_PAD_SINK,
-						     V4L2_SEL_TGT_CROP,
-						     V4L2_SEL_FLAG_KEEP_CONFIG,
-						     &sink_crop);
+		if (isp_sink_crop.width * main_compose.height >
+		    isp_sink_crop.height * main_compose.width) {
+			sink_crop.height = isp_sink_crop.height;
+			sink_crop.width = DIV_NEAREST_STEP(
+					      sink_crop.height *
+					      f->fmt.pix.width,
+					      f->fmt.pix.height,
+					      ATOM_ISP_STEP_WIDTH);
+		} else {
+			sink_crop.width = isp_sink_crop.width;
+			sink_crop.height = DIV_NEAREST_STEP(
+					       sink_crop.width *
+					       f->fmt.pix.height,
+					       f->fmt.pix.width,
+					       ATOM_ISP_STEP_HEIGHT);
 		}
+		atomisp_subdev_set_selection(&asd->subdev, fh.state,
+					     V4L2_SUBDEV_FORMAT_ACTIVE,
+					     ATOMISP_SUBDEV_PAD_SINK,
+					     V4L2_SEL_TGT_CROP,
+					     V4L2_SEL_FLAG_KEEP_CONFIG,
+					     &sink_crop);
+
 		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     source_pad,
-- 
2.39.1

