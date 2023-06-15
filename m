Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C91731B01
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344969AbjFOOPQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344983AbjFOOPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7236272D
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kKlLwzyVrigYN3c/peMe+2RQwIwNuPOBKlxsMN795iE=;
        b=J7ofR+HZorjXgtTPjL8HTn95K1MCz8fClzxOng72LFA4NGtXgX0LElDv/FpPhxnjK+Rsv4
        AOXhs1ZkM68I/LTcyq1AVNdWFlytbeP71KCs07wlZPRsK/SKuwmqrsd6lGZLxG149LI/GY
        BTktRbIWBCpftebTvkx0cl9WTmZW/e0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-TugKSjR4MtGfnUU3meRWkA-1; Thu, 15 Jun 2023 10:14:19 -0400
X-MC-Unique: TugKSjR4MtGfnUU3meRWkA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B348280D5A2;
        Thu, 15 Jun 2023 14:14:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 864A8400F0B;
        Thu, 15 Jun 2023 14:13:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 07/28] media: ov2680: Fix ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY not working
Date:   Thu, 15 Jun 2023 16:13:28 +0200
Message-Id: <20230615141349.172363-8-hdegoede@redhat.com>
In-Reply-To: <20230615141349.172363-1-hdegoede@redhat.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
2.40.1

