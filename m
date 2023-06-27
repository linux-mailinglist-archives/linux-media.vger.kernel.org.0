Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C02C73FCAF
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 15:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjF0NUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 09:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjF0NUN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 09:20:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2937C2947
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687871944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i8tcjy6G6mmwa/xIqjfhF6Byk1vEc3U804i3bVHKQ/s=;
        b=EAfG6xtvI4KfISFRDaimuh/ZLAHJwaRtX0bNpt0B+5LXH54Qz9QgFFpWLYvw3KzGDg++Tz
        vkz9J43MUoweuOrQ52av2lWEHp3Ik58+cC5o5fmrn2dOHYSeRSU/jXbszcDB7nwGgA6l+z
        JPocRro0E4DeG3JqghA6b5D6XcT/Egk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-va6g6bkjMoKYnKV3PH1iyg-1; Tue, 27 Jun 2023 09:19:01 -0400
X-MC-Unique: va6g6bkjMoKYnKV3PH1iyg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8C098C80E3;
        Tue, 27 Jun 2023 13:19:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 797BB401061;
        Tue, 27 Jun 2023 13:18:59 +0000 (UTC)
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
Subject: [PATCH v3 18/29] media: ov2680: Fix ov2680_enum_frame_interval()
Date:   Tue, 27 Jun 2023 15:18:19 +0200
Message-ID: <20230627131830.54601-19-hdegoede@redhat.com>
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

Fix and simplify ov2680_enum_frame_interval(), the index is not
an index into ov2680_mode_data[], so using OV2680_MODE_MAX is wrong.

Instead it is an index indexing the different framerates for
the resolution specified in fie->width, fie->height.

Since the ov2680 code only supports a single fixed framerate,
index must always be 0 and we don't need to check the other
fie input values.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index b011dadbb98a..7ca70877abf1 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -532,17 +532,13 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_frame_interval_enum *fie)
 {
-	struct v4l2_fract tpf;
+	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
-	if (fie->index >= OV2680_MODE_MAX || fie->width > OV2680_WIDTH_MAX ||
-	    fie->height > OV2680_HEIGHT_MAX ||
-	    fie->which > V4L2_SUBDEV_FORMAT_ACTIVE)
+	/* Only 1 framerate */
+	if (fie->index)
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

