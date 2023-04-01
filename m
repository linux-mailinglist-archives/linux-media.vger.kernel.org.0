Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2DDF6D31BD
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjDAPAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjDAPAq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4321CB9B
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JP5qdqrHUFH6LRRriErWEru2yLbtNJt7pxXTeJIx3gs=;
        b=Z9AXOol+puCKTM2dNa+xRt5xJdhpsx7kJ0m201FEA8gyQR3/0eZ/mohNgiHRYN1fcByjLc
        /y3C0JpRAJECnrO8xscvAJk6iC1xnEJHTVNac+z/d9d6/32Ww1p8z3KVF5Z+x66m6DUCFv
        xyru//A4O+teOukuMVl9fRO7khP1pH0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-hJwjZVlhOuWBq82cb94ovA-1; Sat, 01 Apr 2023 10:59:53 -0400
X-MC-Unique: hJwjZVlhOuWBq82cb94ovA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 616EC85A588;
        Sat,  1 Apr 2023 14:59:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D65764021BC;
        Sat,  1 Apr 2023 14:59:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 09/28] media: atomisp: gc0310: Remove non working flip-controls
Date:   Sat,  1 Apr 2023 16:59:07 +0200
Message-Id: <20230401145926.596216-10-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The gc0310_[v|h]_flip() functions are empty stubs, remove
the non working controls.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 45 -------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 8f7eea39858b..93cde642ce44 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -144,18 +144,6 @@ static long gc0310_s_exposure(struct v4l2_subdev *sd,
 	return gc0310_set_exposure(sd, exp, gain, digitgain);
 }
 
-/* TO DO */
-static int gc0310_v_flip(struct v4l2_subdev *sd, s32 value)
-{
-	return 0;
-}
-
-/* TO DO */
-static int gc0310_h_flip(struct v4l2_subdev *sd, s32 value)
-{
-	return 0;
-}
-
 static long gc0310_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
 {
 	switch (cmd) {
@@ -186,22 +174,9 @@ static int gc0310_q_exposure(struct v4l2_subdev *sd, s32 *value)
 
 static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct gc0310_device *dev =
-	    container_of(ctrl->handler, struct gc0310_device, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&dev->sd);
 	int ret = 0;
 
 	switch (ctrl->id) {
-	case V4L2_CID_VFLIP:
-		dev_dbg(&client->dev, "%s: CID_VFLIP:%d.\n",
-			__func__, ctrl->val);
-		ret = gc0310_v_flip(&dev->sd, ctrl->val);
-		break;
-	case V4L2_CID_HFLIP:
-		dev_dbg(&client->dev, "%s: CID_HFLIP:%d.\n",
-			__func__, ctrl->val);
-		ret = gc0310_h_flip(&dev->sd, ctrl->val);
-		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -242,26 +217,6 @@ static const struct v4l2_ctrl_config gc0310_controls[] = {
 		.def = 0x00,
 		.flags = 0,
 	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_VFLIP,
-		.type = V4L2_CTRL_TYPE_BOOLEAN,
-		.name = "Flip",
-		.min = 0,
-		.max = 1,
-		.step = 1,
-		.def = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_HFLIP,
-		.type = V4L2_CTRL_TYPE_BOOLEAN,
-		.name = "Mirror",
-		.min = 0,
-		.max = 1,
-		.step = 1,
-		.def = 0,
-	},
 };
 
 static int gc0310_init(struct v4l2_subdev *sd)
-- 
2.39.1

