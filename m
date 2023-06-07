Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03188726662
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbjFGQsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjFGQsu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8EB1FE2
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PfWwFBtME4SYGA2S2WE4vQpvFt1WrUdncBpg1pBw2Jw=;
        b=C1WCLSPA9O0APf7GgAUicOpayOfswNYEIW3C2YRSBwDxgC64E14UqcFb+wC0gyVravs88w
        iFhQNAFUHuKpfrIeYEVKbwEoGian27EObQSP5cDQHUSWFEN7QZEoouTguMsJe3zCQSM8db
        UktWaGmUJIuAgAhCEmdHHwLZks0B9VM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-9odgItuENOePp_34muWdWA-1; Wed, 07 Jun 2023 12:47:55 -0400
X-MC-Unique: 9odgItuENOePp_34muWdWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC582185A78F;
        Wed,  7 Jun 2023 16:47:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A4CE7C15612;
        Wed,  7 Jun 2023 16:47:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 22/28] media: ov2680: Add an __ov2680_get_pad_format() helper function
Date:   Wed,  7 Jun 2023 18:47:06 +0200
Message-Id: <20230607164712.63579-23-hdegoede@redhat.com>
In-Reply-To: <20230607164712.63579-1-hdegoede@redhat.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an __ov2680_get_pad_format() helper function.

This is a preparation patch for adding selections support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index b0a8322696ee..7f1990b9a3fb 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -214,6 +214,16 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor, struct v4l2_mbus_f
 	fmt->code = ov2680_hv_flip_bayer_order[hv_flip];
 }
 
+static struct v4l2_mbus_framefmt *
+__ov2680_get_pad_format(struct ov2680_dev *sensor, struct v4l2_subdev_state *state,
+			unsigned int pad, enum v4l2_subdev_format_whence which)
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
@@ -477,22 +487,15 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
-	struct v4l2_mbus_framefmt *fmt = NULL;
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad != 0)
 		return -EINVAL;
 
+	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad, format->which);
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
2.40.1

