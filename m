Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9562F76E473
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbjHCJel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232097AbjHCJej (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8176330FF
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E3Kn4TsWrDw+ZJ+Mh6vLUTPtTgKM0u0Q2gCUlSm1+ik=;
        b=NyerCBRZLGXlzyQ04jGVLNYyzo7aJmwdxL5hIzibHWwnzrDc/GsOVVdHYIBvdinLL6PNAi
        lGXNu4MQBcKZz/xd1G51O4iBv74zu09pYapJ/DEis7CeUWl+PoL9S2IIGUm0Ga8KoJ2Qlc
        RZIwTKjRHMyXWAc5Fw6fSfW12dHugJY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-_rC2PgcxNDauW7nXRoPDAA-1; Thu, 03 Aug 2023 05:33:57 -0400
X-MC-Unique: _rC2PgcxNDauW7nXRoPDAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09C5C835154;
        Thu,  3 Aug 2023 09:33:57 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8219E2166B25;
        Thu,  3 Aug 2023 09:33:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 04/32] media: ov2680: Remove VIDEO_V4L2_SUBDEV_API ifdef-s
Date:   Thu,  3 Aug 2023 11:33:19 +0200
Message-ID: <20230803093348.15679-5-hdegoede@redhat.com>
In-Reply-To: <20230803093348.15679-1-hdegoede@redhat.com>
References: <20230803093348.15679-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VIDEO_V4L2_SUBDEV_API is now automatically selected in Kconfig
for all sensor drivers. Remove the ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
checks.

This is a preparation patch for fixing ov2680_set_fmt()
which == V4L2_SUBDEV_FORMAT_TRY calls not properly filling in
the passed in v4l2_mbus_framefmt struct.

Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 74024ba968b4..5c1f5dd4824a 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -562,7 +562,6 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 	struct v4l2_mbus_framefmt *fmt = NULL;
-	int ret = 0;
 
 	if (format->pad != 0)
 		return -EINVAL;
@@ -570,22 +569,17 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&sensor->lock);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
 						 format->pad);
-#else
-		ret = -EINVAL;
-#endif
 	} else {
 		fmt = &sensor->fmt;
 	}
 
-	if (fmt)
-		format->format = *fmt;
+	format->format = *fmt;
 
 	mutex_unlock(&sensor->lock);
 
-	return ret;
+	return 0;
 }
 
 static int ov2680_set_fmt(struct v4l2_subdev *sd,
@@ -594,9 +588,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 	struct v4l2_mbus_framefmt *fmt = &format->format;
-#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 	struct v4l2_mbus_framefmt *try_fmt;
-#endif
 	const struct ov2680_mode_info *mode;
 	int ret = 0;
 
@@ -619,10 +611,8 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		format->format = *try_fmt;
-#endif
 		goto unlock;
 	}
 
@@ -780,9 +770,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	v4l2_i2c_subdev_init(&sensor->sd, sensor->i2c_client,
 			     &ov2680_subdev_ops);
 
-#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 	sensor->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
-#endif
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-- 
2.41.0

