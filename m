Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCD276D577
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 19:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjHBRfW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 13:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbjHBRfI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 13:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F33330DB
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 10:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690997517;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yFx6BYu9bpB75AJ8M6xQoqsHjFu/31ufoi+KwnL/ToM=;
        b=S49Cxo1A38GcPIlfcvpD24Lek7Ikf03tT5PVFt03brM6kzOOk/1mIBfJfWLdRield6MdZH
        d4JQjQVG7pu/ST5KpiKbBgOyjZ4Cks4AqFCt/YQUUQXMVJDIPrgX6okZ7fJLC6Aa2Skadw
        ZdC2vlsCDaTsTSOguavCmfdvB4nC8MM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-LvdLo8KuNGSlgI-uz24rgA-1; Wed, 02 Aug 2023 13:31:53 -0400
X-MC-Unique: LvdLo8KuNGSlgI-uz24rgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AED98104458E;
        Wed,  2 Aug 2023 17:31:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.110])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 51AA1140E949;
        Wed,  2 Aug 2023 17:31:51 +0000 (UTC)
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
Subject: [PATCH v4 26/32] media: ov2680: Drop unnecessary pad checks
Date:   Wed,  2 Aug 2023 19:30:40 +0200
Message-ID: <20230802173046.368434-27-hdegoede@redhat.com>
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

Drop unnecessary pad checks in enum_mbus_code, get_fmt, set_fmt
this is already checked by check_pad() from
drivers/media/v4l2-core/v4l2-subdev.c.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index e6c99c14da8f..c09a0e7f7787 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -591,7 +591,7 @@ static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
-	if (code->pad != 0 || code->index != 0)
+	if (code->index != 0)
 		return -EINVAL;
 
 	code->code = sensor->mode.fmt.code;
@@ -606,9 +606,6 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	if (format->pad != 0)
-		return -EINVAL;
-
 	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad,
 				      format->which);
 
@@ -629,9 +626,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	unsigned int width, height;
 	int ret = 0;
 
-	if (format->pad != 0)
-		return -EINVAL;
-
 	crop = __ov2680_get_pad_crop(sensor, sd_state, format->pad,
 				     format->which);
 
-- 
2.41.0

