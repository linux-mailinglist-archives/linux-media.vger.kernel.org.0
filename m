Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22298731B11
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345014AbjFOOPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345017AbjFOOPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7691FC2
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838489;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=739L6lBeVkCzHOJQsYUqyqcnAivlHuWrGf8T7jfFBDA=;
        b=Bi+vBPPINPjNZ5x0/90PVIvhH6NqMNARxqm8DuIUvGdHnWXMJvYirLI9zW3HSPbK7WbAfW
        FYlxycXRmlpXOLi3FRqaUFzVAHbIwhBqt3tPJIQhy5Ugx+xhSWici4hOeSfTditlug6aQu
        qKL/wdln01C79orI4suU9eSWXae7Gco=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-BfrS7le8PryQNT20b0BSPw-1; Thu, 15 Jun 2023 10:14:35 -0400
X-MC-Unique: BfrS7le8PryQNT20b0BSPw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B7BD811E78;
        Thu, 15 Jun 2023 14:14:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1465148FB01;
        Thu, 15 Jun 2023 14:14:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 22/28] media: ov2680: Add an __ov2680_get_pad_format() helper function
Date:   Thu, 15 Jun 2023 16:13:43 +0200
Message-Id: <20230615141349.172363-23-hdegoede@redhat.com>
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

Add an __ov2680_get_pad_format() helper function.

This is a preparation patch for adding selections support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index ab51fecd14f1..94b768bea327 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -216,6 +216,18 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor,
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
@@ -504,22 +516,16 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
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
2.40.1

