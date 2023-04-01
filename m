Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 158DF6D31BF
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjDAPAw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbjDAPAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E301DFB1
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ykzzsi4vPVmnhdDu6qdf+OaX902dNbyBhmUCGQHQEy8=;
        b=F5E7SZVD0rTEah68UasgEc3zY+6HWxCPat515t6tpIz4bA8aMOEljq19pMnuqb70YxEm4e
        3WxnAFdLWiK18yL4esl/mayJeG51j7YPSmjN6hf/pOHsXmsYnZRi+Sy9iMLNdDAP6Zr2eX
        soQ0RhAFjj0tH56lKgvZSBcfQ4lEF78=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-U2EDORFDO8SrvaCKl1Uj0w-1; Sat, 01 Apr 2023 10:59:56 -0400
X-MC-Unique: U2EDORFDO8SrvaCKl1Uj0w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D27338533DC;
        Sat,  1 Apr 2023 14:59:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 531FD400F59;
        Sat,  1 Apr 2023 14:59:54 +0000 (UTC)
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
Subject: [PATCH 11/28] media: atomisp: gc0310: Drop custom ATOMISP_IOC_S_EXPOSURE support
Date:   Sat,  1 Apr 2023 16:59:09 +0200
Message-Id: <20230401145926.596216-12-hdegoede@redhat.com>
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

Exposure and gain control should use standard v4l2 controls,
not a custom ioctl.

The next patch in this series will re-add support as standard controls,
this is split into 2 patches for easier reviewing.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 99 -------------------
 1 file changed, 99 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index ba36bd0a0b41..115493641010 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -57,104 +57,6 @@ static int gc0310_write_reg_array(struct i2c_client *client,
 	return 0;
 }
 
-static int gc0310_set_gain(struct v4l2_subdev *sd, int gain)
-
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-	u8 again, dgain;
-
-	if (gain < 0x20)
-		gain = 0x20;
-	if (gain > 0x80)
-		gain = 0x80;
-
-	if (gain >= 0x20 && gain < 0x40) {
-		again = 0x0; /* sqrt(2) */
-		dgain = gain;
-	} else {
-		again = 0x2; /* 2 * sqrt(2) */
-		dgain = gain / 2;
-	}
-
-	dev_dbg(&client->dev, "gain=0x%x again=0x%x dgain=0x%x\n", gain, again, dgain);
-
-	/* set analog gain */
-	ret = i2c_smbus_write_byte_data(client, GC0310_AGC_ADJ, again);
-	if (ret)
-		return ret;
-
-	/* set digital gain */
-	ret = i2c_smbus_write_byte_data(client, GC0310_DGC_ADJ, dgain);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static int __gc0310_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
-				 int gain, int digitgain)
-
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	dev_dbg(&client->dev, "coarse_itg=%d gain=%d digitgain=%d\n", coarse_itg, gain, digitgain);
-
-	/* set exposure */
-	ret = i2c_smbus_write_word_swapped(client, GC0310_AEC_PK_EXPO_H, coarse_itg);
-	if (ret)
-		return ret;
-
-	ret = gc0310_set_gain(sd, gain);
-	if (ret)
-		return ret;
-
-	return ret;
-}
-
-static int gc0310_set_exposure(struct v4l2_subdev *sd, int exposure,
-			       int gain, int digitgain)
-{
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-	int ret;
-
-	mutex_lock(&dev->input_lock);
-	ret = __gc0310_set_exposure(sd, exposure, gain, digitgain);
-	mutex_unlock(&dev->input_lock);
-
-	return ret;
-}
-
-static long gc0310_s_exposure(struct v4l2_subdev *sd,
-			      struct atomisp_exposure *exposure)
-{
-	int exp = exposure->integration_time[0];
-	int gain = exposure->gain[0];
-	int digitgain = exposure->gain[1];
-
-	/* we should not accept the invalid value below. */
-	if (gain == 0) {
-		struct i2c_client *client = v4l2_get_subdevdata(sd);
-
-		v4l2_err(client, "%s: invalid value\n", __func__);
-		return -EINVAL;
-	}
-
-	return gc0310_set_exposure(sd, exp, gain, digitgain);
-}
-
-static long gc0310_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
-{
-	switch (cmd) {
-	case ATOMISP_IOC_S_EXPOSURE:
-		return gc0310_s_exposure(sd, arg);
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
 static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	int ret = 0;
@@ -627,7 +529,6 @@ static const struct v4l2_subdev_video_ops gc0310_video_ops = {
 
 static const struct v4l2_subdev_core_ops gc0310_core_ops = {
 	.s_power = gc0310_s_power,
-	.ioctl = gc0310_ioctl,
 };
 
 static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
-- 
2.39.1

