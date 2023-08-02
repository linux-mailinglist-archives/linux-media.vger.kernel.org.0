Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D8E76D581
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 19:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbjHBRfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 13:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbjHBRfa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 13:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3639B4226
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690997530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EcDyRHvJxga23N24g7zZoepisVmaaImy82FpCV8nah8=;
        b=JYfbuacfSsaNJvlkcUnUfe8jcHFsUe/xQsZRZ1l3WsjE0hO0hKDmNmmEKrRp/GuMyjumcq
        73r4natQdqf6pxXdR9yYn9qHp98Lc9vQT4n+Mo2lPpBYobQx1CkcOIUeVLagcJ0ifFbXjm
        Zxk0R92xyZTZ0xZ+xURtTuEE+TyiDT4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-6X6xD8yWPs2cAXVnhrEkzw-1; Wed, 02 Aug 2023 13:32:02 -0400
X-MC-Unique: 6X6xD8yWPs2cAXVnhrEkzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A31E38294A2;
        Wed,  2 Aug 2023 17:31:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.110])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E41D31454143;
        Wed,  2 Aug 2023 17:31:44 +0000 (UTC)
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
Subject: [PATCH v4 22/32] media: ov2680: Add an __ov2680_get_pad_format() helper function
Date:   Wed,  2 Aug 2023 19:30:36 +0200
Message-ID: <20230802173046.368434-23-hdegoede@redhat.com>
In-Reply-To: <20230802173046.368434-1-hdegoede@redhat.com>
References: <20230802173046.368434-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an __ov2680_get_pad_format() helper function.

This is a preparation patch for adding selections support.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 012b95f90c1d..87c4c5ea47c9 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -220,6 +220,18 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor,
 	fmt->code = ov2680_hv_flip_bayer_order[hv_flip];
 }
 
+static struct v4l2_mbus_framefmt *
+__ov2680_get_pad_format(struct ov2680_dev *sensor,
+			struct v4l2_subdev_state *state,
+			unsigned int pad,
+			enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_format(&sensor->sd, state, pad);
+
+	return &sensor->mode.fmt;
+}
+
 static void ov2680_fill_format(struct ov2680_dev *sensor,
 			       struct v4l2_mbus_framefmt *fmt,
 			       unsigned int width, unsigned int height)
@@ -508,22 +520,16 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
-	struct v4l2_mbus_framefmt *fmt = NULL;
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad != 0)
 		return -EINVAL;
 
+	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad,
+				      format->which);
+
 	mutex_lock(&sensor->lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
-						 format->pad);
-	} else {
-		fmt = &sensor->mode.fmt;
-	}
-
 	format->format = *fmt;
-
 	mutex_unlock(&sensor->lock);
 
 	return 0;
-- 
2.41.0

