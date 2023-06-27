Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1EE473FCB6
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 15:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjF0NU6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 09:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjF0NUY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 09:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD1B2951
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 06:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687871954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Py3m8gLUNPEn+UP9knJ5Khore2RWIznc21UGom5cOdY=;
        b=KX0rYwcKgyWQLmCJlj2WtSt2O5TPbHg1QnTOYVATvns7l7InpsfGvaNucXgv/8zFEG80ea
        ju79ERYwmoMj/GfQ4zPemb808UEXbXqI6q58ntZb17/TN1Es06SQAmhgSCzoayXY/STQvT
        D9N6byDkHsahBS7ZOtmKhD81nqTFDsE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-Ws-QWrDAOLmWdjyMvyzYpg-1; Tue, 27 Jun 2023 09:19:07 -0400
X-MC-Unique: Ws-QWrDAOLmWdjyMvyzYpg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE8118631DF;
        Tue, 27 Jun 2023 13:19:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A2311400F5A;
        Tue, 27 Jun 2023 13:19:05 +0000 (UTC)
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
Subject: [PATCH v3 22/29] media: ov2680: Add an __ov2680_get_pad_format() helper function
Date:   Tue, 27 Jun 2023 15:18:23 +0200
Message-ID: <20230627131830.54601-23-hdegoede@redhat.com>
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

Add an __ov2680_get_pad_format() helper function.

This is a preparation patch for adding selections support.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 15e0b0ef5e8f..c692e0457770 100644
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
2.41.0

