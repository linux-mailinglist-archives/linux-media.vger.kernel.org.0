Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBDA726666
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbjFGQs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbjFGQsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB731FF5
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AUS5vHwgw7nPJboZ1Bgg/3VXzhIpASShfa1ng09pKFg=;
        b=Kpfro3uKd+Q14pMBTE5kz1I4AZafP5uRZ1NpGONSJwZTh2uu7FU/IvUisTvq7QC5P3qRd4
        19whg8BeEGnI0X8bpHhSYRqyo80rW+snnCfGOxY4xEurXMvcE7K3hVib3sQf9wb+F2Iulp
        EKJ1mg1gWXOeyOHu8LRrddwrEINWRTc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-EVtaEZrTOzWKf7RmZQcW9g-1; Wed, 07 Jun 2023 12:48:01 -0400
X-MC-Unique: EVtaEZrTOzWKf7RmZQcW9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09121811E8D;
        Wed,  7 Jun 2023 16:48:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E472EC1603B;
        Wed,  7 Jun 2023 16:47:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 26/28] media: ov2680: Add g_skip_frames op support
Date:   Wed,  7 Jun 2023 18:47:10 +0200
Message-Id: <20230607164712.63579-27-hdegoede@redhat.com>
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

Add support for v4l2_subdev_sensor_ops.g_skip_frames.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 867df602ee53..9e4f0bcbe979 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -62,6 +62,8 @@
 
 #define OV2680_FRAME_RATE			30
 
+#define OV2680_SKIP_FRAMES			3
+
 #define OV2680_NATIVE_WIDTH			1616
 #define OV2680_NATIVE_HEIGHT			1216
 #define OV2680_NATIVE_START_LEFT		0
@@ -759,6 +761,12 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov2680_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
+{
+	*frames = OV2680_SKIP_FRAMES;
+	return 0;
+}
+
 static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
@@ -806,6 +814,10 @@ static const struct v4l2_subdev_video_ops ov2680_video_ops = {
 	.s_stream		= ov2680_s_stream,
 };
 
+static const struct v4l2_subdev_sensor_ops ov2680_sensor_ops = {
+	.g_skip_frames	= ov2680_g_skip_frames,
+};
+
 static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
 	.init_cfg		= ov2680_init_cfg,
 	.enum_mbus_code		= ov2680_enum_mbus_code,
@@ -820,6 +832,7 @@ static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
 static const struct v4l2_subdev_ops ov2680_subdev_ops = {
 	.video	= &ov2680_video_ops,
 	.pad	= &ov2680_pad_ops,
+	.sensor = &ov2680_sensor_ops,
 };
 
 static int ov2680_mode_init(struct ov2680_dev *sensor)
-- 
2.40.1

