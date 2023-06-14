Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB55F726661
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbjFGQsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjFGQsu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CA21FF1
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WSo8JZnTuWmwPfUreQxvE7qG0jdP5V/aSUc8BdbGm/E=;
        b=OokW7aiba7cVRrZ0zU5gY1BlzXbWss1NDGJI6zplOHbpjolSRzRp8i9q381Xj1hfSGjlFh
        UFYWzSNIbrGt/pz3b9Qae+dFPryK9nsZgozLXcJEUFU8S1CI1R60BkqUw77XfqlofjPiaQ
        MGYmEJNWpN9/zTnogD2MO0atI1vrfdc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-sXa1cRJLPO6HiV3Hq638Ow-1; Wed, 07 Jun 2023 12:47:58 -0400
X-MC-Unique: sXa1cRJLPO6HiV3Hq638Ow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61B03185A792;
        Wed,  7 Jun 2023 16:47:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 48B32C1603B;
        Wed,  7 Jun 2023 16:47:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 24/28] media: ov2680: Fix exposure and gain ctrls range and default value
Date:   Wed,  7 Jun 2023 18:47:08 +0200
Message-Id: <20230607164712.63579-25-hdegoede@redhat.com>
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

The exposure control's max effective value is VTS - 8, set the control
range to match this. Thas means that if/when a future commit makes VTS
configurable as a control itself the exposure range needs to be
updated dynamically to match the VTS value.

The gain control goes from 0 - 1023, higher values wrap around to
the lowest gain setting.

Also stop setting 0 as default for both controls this leads to
a totally black picture which is no good. This is esp. important
for tests of the sensor driver without (userspace driven)
auto exposure / gain.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 4705a901c513..d1fd47f10a17 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -80,6 +80,9 @@
 /* If possible send 16 extra rows / lines to the ISP as padding */
 #define OV2680_END_MARGIN			16
 
+/* Max exposure time is VTS - 8 */
+#define OV2680_INTEGRATION_TIME_MARGIN		8
+
 #define OV2680_DEFAULT_WIDTH			800
 #define OV2680_DEFAULT_HEIGHT			600
 
@@ -784,6 +787,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor, struct i2c_client *cl
 	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
 	struct ov2680_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	int exp_max = OV2680_LINES_PER_FRAME - OV2680_INTEGRATION_TIME_MARGIN;
 	int ret = 0;
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
@@ -810,9 +814,9 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor, struct i2c_client *cl
 					0, 0, test_pattern_menu);
 
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
-					    0, 32767, 1, 0);
+					    0, exp_max, 1, exp_max);
 
-	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 2047, 1, 0);
+	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 1023, 1, 250);
 
 	if (hdl->error) {
 		ret = hdl->error;
-- 
2.40.1

