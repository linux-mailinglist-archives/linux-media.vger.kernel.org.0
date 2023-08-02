Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3129876D574
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 19:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbjHBRfE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 13:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbjHBRen (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 13:34:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC3F4EF1
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 10:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690997482;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KWOneAe5/BFrkh6Y4MUil5D8m/sbDn/E9+AOy0W0w0U=;
        b=FHYv7ttX6ImM6Sp70pRySa9WbqyPIA7KjAcQ5jywRXaZVKlGK0WyZ6nZv1B5uWWWr9fCLS
        hH/YuRDpVa06FKT2By3LmNk23PW0e1btxHXEIh4OH9HnbRDq1NJbmX2sarYmED+OtoS0aq
        KB9Y4Lzn9p0VRwOkOZNt8qa1kTZR8rc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-RM3KbJM-MRqkBTTbLm8TzA-1; Wed, 02 Aug 2023 13:31:18 -0400
X-MC-Unique: RM3KbJM-MRqkBTTbLm8TzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC22486802C;
        Wed,  2 Aug 2023 17:31:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.110])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 81E71140E952;
        Wed,  2 Aug 2023 17:31:15 +0000 (UTC)
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
Subject: [PATCH v4 18/32] media: ov2680: Fix ov2680_enum_frame_interval()
Date:   Wed,  2 Aug 2023 19:30:32 +0200
Message-ID: <20230802173046.368434-19-hdegoede@redhat.com>
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

Fix and simplify ov2680_enum_frame_interval(), the index is not
an index into ov2680_mode_data[], so using OV2680_MODE_MAX is wrong.

Instead it is an index indexing the different framerates for
the resolution specified in fie->width, fie->height.

Note validating fie->which is not necessary this is already done
by the v4l2-core.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Verify that the passed in which, width and height are valid
---
 drivers/media/i2c/ov2680.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 0adfacc70735..a83efd449993 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -527,21 +527,30 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static bool ov2680_valid_frame_size(struct v4l2_subdev_frame_interval_enum *fie)
+{
+	int i;
+
+	for (i = 0; i < OV2680_MODE_MAX; i++) {
+		if (fie->width == ov2680_mode_data[i].width &&
+		    fie->height == ov2680_mode_data[i].height)
+			return true;
+	}
+
+	return false;
+}
+
 static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_frame_interval_enum *fie)
 {
-	struct v4l2_fract tpf;
+	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
-	if (fie->index >= OV2680_MODE_MAX || fie->width > OV2680_WIDTH_MAX ||
-	    fie->height > OV2680_HEIGHT_MAX ||
-	    fie->which > V4L2_SUBDEV_FORMAT_ACTIVE)
+	/* Only 1 framerate */
+	if (fie->index || !ov2680_valid_frame_size(fie))
 		return -EINVAL;
 
-	tpf.denominator = OV2680_FRAME_RATE;
-	tpf.numerator = 1;
-
-	fie->interval = tpf;
+	fie->interval = sensor->frame_interval;
 
 	return 0;
 }
-- 
2.41.0

