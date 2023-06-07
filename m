Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1CF872665B
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjFGQsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjFGQsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E99D1FE3
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e2j9uhooCDtqZkdd+jVDKfIEBOVRls05VfRR57bHZ10=;
        b=gAcPkaF72vZfJyDxoZd8ornJQ/TeeA7Xvg5l04GYt2FfTQMiigqQOFNM4ifzM+Ti0QkeTC
        WN5LTFVApXPN6VHIGrDNQJkCnvlGbIz46OFTdSm0GR6ah1hMuIEtKQYVdjsqx3e27VcVce
        xSXzelDPkLEOUDqIEzoY5YRpuQTqSpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-t19ptmjiPQeJFAl6m_t-fg-1; Wed, 07 Jun 2023 12:47:50 -0400
X-MC-Unique: t19ptmjiPQeJFAl6m_t-fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B4B5858F15;
        Wed,  7 Jun 2023 16:47:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6323CC1603B;
        Wed,  7 Jun 2023 16:47:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 18/28] media: ov2680: Fix ov2680_enum_frame_interval()
Date:   Wed,  7 Jun 2023 18:47:02 +0200
Message-Id: <20230607164712.63579-19-hdegoede@redhat.com>
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

Fix and simplify ov2680_enum_frame_interval(), the index is not
an index into ov2680_mode_data[], so using OV2680_MODE_MAX is wrong.

Instead it is an index indexing the different framerates for
the resolution specified in fie->width, fie->height.

Since the ov2680 code only supports a single fixed framerate,
index must always be 0 and we don't need to check the other
fie input values.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 190c58caae11..bc76ebee4854 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -507,20 +507,16 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_frame_interval_enum *fie)
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval_enum *fie)
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
2.40.1

