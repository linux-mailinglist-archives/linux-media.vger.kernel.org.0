Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1C6273FCA9
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 15:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjF0NUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 09:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjF0NUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 09:20:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D061722
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 06:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687871929;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fHbL8+wVyI61OsstH321bPv7X8D81LFoXSuSBgq+A9A=;
        b=MpZUIJK3//OtezrIFCBITl86vdLVQe5wysXH9+AQY7gef4He/WUOw7l2xf9zRDkSryH8iD
        /kFJw4vjpS5TMUcV8EcAvX2dA9JkxDagjQuNWQ7EgaL/Gcs4unKt70dFO4E5WXNdKpIKcR
        VtZM3QnSt0D72q7uqWmtQfAxFpZa1cI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-3McF31v6OzqJiKjdBHz3iQ-1; Tue, 27 Jun 2023 09:18:44 -0400
X-MC-Unique: 3McF31v6OzqJiKjdBHz3iQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5E881C0512D;
        Tue, 27 Jun 2023 13:18:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 97D5B401061;
        Tue, 27 Jun 2023 13:18:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 07/29] media: ov2680: Fix ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY not working
Date:   Tue, 27 Jun 2023 15:18:08 +0200
Message-ID: <20230627131830.54601-8-hdegoede@redhat.com>
In-Reply-To: <20230627131830.54601-1-hdegoede@redhat.com>
References: <20230627131830.54601-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY was getting
the try_fmt v4l2_mbus_framefmt struct from the passed in sd_state
and then storing the contents of that into the return by reference
format->format struct.

While the right thing to do would be filling format->format based on
the just looked up mode and then store the results of that in
sd_state->pads[0].try_fmt .

Before the previous change introducing ov2680_fill_format() this
resulted in ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY always
returning the zero-ed out sd_state->pads[0].try_fmt in format->format
breaking callers using this.

After the introduction of ov2680_fill_format() which at least
initializes sd_state->pads[0].try_fmt properly, format->format
is now always being filled with the default 800x600 mode set by
ov2680_init_cfg() independent of the actual requested mode.

Move the filling of format->format with ov2680_fill_format() to
before the if (which == V4L2_SUBDEV_FORMAT_TRY) and then store
the filled in format->format in sd_state->pads[0].try_fmt to
fix this.

Note this removes the fmt local variable because IMHO having a local
variable which points to a sub-struct of one of the function arguments
just leads to confusion when reading the code.

Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index c4a46c734d82..7fc4b39ebb37 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -603,7 +603,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
-	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct v4l2_mbus_framefmt *try_fmt;
 	const struct ov2680_mode_info *mode;
 	int ret = 0;
@@ -612,14 +611,18 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	mode = v4l2_find_nearest_size(ov2680_mode_data,
-				      ARRAY_SIZE(ov2680_mode_data), width,
-				      height, fmt->width, fmt->height);
+				      ARRAY_SIZE(ov2680_mode_data),
+				      width, height,
+				      format->format.width,
+				      format->format.height);
 	if (!mode)
 		return -EINVAL;
 
+	ov2680_fill_format(sensor, &format->format, mode->width, mode->height);
+
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
-		format->format = *try_fmt;
+		*try_fmt = format->format;
 		return 0;
 	}
 
@@ -630,8 +633,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		goto unlock;
 	}
 
-	ov2680_fill_format(sensor, fmt, mode->width, mode->height);
-
 	sensor->current_mode = mode;
 	sensor->fmt = format->format;
 	sensor->mode_pending_changes = true;
-- 
2.41.0

