Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB12D6D31C1
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjDAPAz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjDAPAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E231D862
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S4GAIpJCftsr7cfhH7olfn6cbD9j4KKnAiVOmRdN5nc=;
        b=HyMnbsFi5tk8dDqtoy9N95kjYJOJg51uSXZuvEF/K8OOU9NAlRE+OU62S454kMHRheqmpD
        1q0dXJoefouTR2XIxF2g4+H218BM5BH/akWoGivXw965oZBrOT4HYG8JLn972Qhs0zpf8n
        sbSjNmxwZcWu5LI2eqUrGP4jR3rZ/04=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-GG6NRFMbO1KQWG4K6pAVAw-1; Sat, 01 Apr 2023 10:59:54 -0400
X-MC-Unique: GG6NRFMbO1KQWG4K6pAVAw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 200DF801779;
        Sat,  1 Apr 2023 14:59:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 945F74021C7;
        Sat,  1 Apr 2023 14:59:52 +0000 (UTC)
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
Subject: [PATCH 10/28] media: atomisp: gc0310: Remove read-only exposure control
Date:   Sat,  1 Apr 2023 16:59:08 +0200
Message-Id: <20230401145926.596216-11-hdegoede@redhat.com>
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

The sensor does not have automatic exposure so the exposure cannot
change underneath us.

And the control is not marked volatile in it flags,
so the .g_volatile_ctrl callback will never get called.

Remove the current broken read-only (no s_ctrl implementation)
exposure ctrl, this will be replaced with a proper r/w exposure
control relying on the kernel caching the last set value
(so non volatile).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 58 +------------------
 1 file changed, 1 insertion(+), 57 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 93cde642ce44..ba36bd0a0b41 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -155,23 +155,6 @@ static long gc0310_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
 	return 0;
 }
 
-/* This returns the exposure time being used. This should only be used
- * for filling in EXIF data, not for actual image processing.
- */
-static int gc0310_q_exposure(struct v4l2_subdev *sd, s32 *value)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	/* get exposure */
-	ret = i2c_smbus_read_word_swapped(client, GC0310_AEC_PK_EXPO_H);
-	if (ret < 0)
-		return ret;
-
-	*value = ret;
-	return 0;
-}
-
 static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	int ret = 0;
@@ -183,40 +166,8 @@ static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
-static int gc0310_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct gc0310_device *dev =
-	    container_of(ctrl->handler, struct gc0310_device, ctrl_handler);
-	int ret = 0;
-
-	switch (ctrl->id) {
-	case V4L2_CID_EXPOSURE_ABSOLUTE:
-		ret = gc0310_q_exposure(&dev->sd, &ctrl->val);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
 static const struct v4l2_ctrl_ops ctrl_ops = {
 	.s_ctrl = gc0310_s_ctrl,
-	.g_volatile_ctrl = gc0310_g_volatile_ctrl
-};
-
-static const struct v4l2_ctrl_config gc0310_controls[] = {
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_EXPOSURE_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "exposure",
-		.min = 0x0,
-		.max = 0xffff,
-		.step = 0x01,
-		.def = 0x00,
-		.flags = 0,
-	},
 };
 
 static int gc0310_init(struct v4l2_subdev *sd)
@@ -713,7 +664,6 @@ static int gc0310_probe(struct i2c_client *client)
 	struct gc0310_device *dev;
 	int ret;
 	void *pdata;
-	unsigned int i;
 
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -744,18 +694,12 @@ static int gc0310_probe(struct i2c_client *client)
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
 	dev->format.code = MEDIA_BUS_FMT_SGRBG8_1X8;
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	ret =
-	    v4l2_ctrl_handler_init(&dev->ctrl_handler,
-				   ARRAY_SIZE(gc0310_controls));
+	ret = v4l2_ctrl_handler_init(&dev->ctrl_handler, 0);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(gc0310_controls); i++)
-		v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc0310_controls[i],
-				     NULL);
-
 	if (dev->ctrl_handler.error) {
 		gc0310_remove(client);
 		return dev->ctrl_handler.error;
-- 
2.39.1

