Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8798C731B1B
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345028AbjFOOQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345017AbjFOOQF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:16:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3FAE294E
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838517;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YpnLd4D3aY+Er+9N5tEaMiWapCZxi6iFIzO1D2D53sk=;
        b=gZKDLfWMtxzQUwPA6pxEFQ9IuM43vx6llZ9oKccI7fwOuF8jNYAO0mJPM71b8IqwSzScYO
        Qnaa1sAw0CIPY3hGEQrR7uFmjrDnLgh3HPLwvPAc3cAHZFQJ+s0GSpcp4OpxZzArAPKoJI
        acvPkGGGRwPg3toiowcakR/1PqNDNqU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232--Z9efX8qMli3T1vTdn2Hqg-1; Thu, 15 Jun 2023 10:14:59 -0400
X-MC-Unique: -Z9efX8qMli3T1vTdn2Hqg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E226D280D59E;
        Thu, 15 Jun 2023 14:14:26 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CD69F400F0B;
        Thu, 15 Jun 2023 14:14:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 26/28] media: ov2680: Drop unnecessary pad checks
Date:   Thu, 15 Jun 2023 16:13:47 +0200
Message-Id: <20230615141349.172363-27-hdegoede@redhat.com>
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

Drop unnecessary pad checks in enum_mbus_code, get_fmt, set_fmt
this is already checked by check_pad() from
drivers/media/v4l2-core/v4l2-subdev.c.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index a1cf877e13ef..4b8561dc3111 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -589,7 +589,7 @@ static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
-	if (code->pad != 0 || code->index != 0)
+	if (code->index != 0)
 		return -EINVAL;
 
 	code->code = sensor->mode.fmt.code;
@@ -604,9 +604,6 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	if (format->pad != 0)
-		return -EINVAL;
-
 	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad,
 				      format->which);
 
@@ -627,9 +624,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	unsigned int width, height;
 	int ret = 0;
 
-	if (format->pad != 0)
-		return -EINVAL;
-
 	crop = __ov2680_get_pad_crop(sensor, sd_state, format->pad,
 				     format->which);
 
-- 
2.40.1

