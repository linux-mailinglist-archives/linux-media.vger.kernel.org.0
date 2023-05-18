Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 988F17084F0
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbjERPdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjERPdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CA5121
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684423953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aQpbnMptJb6odDEC/or4lzJKM409r5z1A+o7C2M7BWM=;
        b=Vrs9nrr2RigvEIFKBy0aTYgZqIevjtd6rMgZ/ng2HX0ZAy1yD6yMzS6QIplZ2cLTB5ep4a
        mND1MdykW45MIVDL28sVCRVhZZW2EKqBBbTov+9EqErO2XsyPB0U2id8nraT9Ku3jcmMZI
        VUlvzKhO6SbJl+eA0PaZG+g76kVg9xQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-ijVm0HdYOlmn4drJFiqYhg-1; Thu, 18 May 2023 11:32:30 -0400
X-MC-Unique: ijVm0HdYOlmn4drJFiqYhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4856867959;
        Thu, 18 May 2023 15:32:28 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 66AF14078908;
        Thu, 18 May 2023 15:32:27 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 7/9] media: atomisp: gc0310: Remove gc0310_s_config() function
Date:   Thu, 18 May 2023 17:32:12 +0200
Message-Id: <20230518153214.194976-8-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-1-hdegoede@redhat.com>
References: <20230518153214.194976-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

gc0310_s_config() used to call camera_sensor_platform_data.csi_cfg() back
when the gc0310 driver was still using the atomisp_gmin_platform code
for power-management.

Now it is just a weirdly named wrapper around gc0310_detect(), drop
gc0310_s_config() and make probe() call gc0310_detect() directly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 20 +++++--------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 35367d6efd2c..486ea7979c57 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -172,7 +172,10 @@ static int gc0310_detect(struct i2c_client *client)
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
+	ret = pm_runtime_get_sync(&client->dev);
+	if (ret >= 0)
+		ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
+	pm_runtime_put(&client->dev);
 	if (ret < 0) {
 		dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
 		return -ENODEV;
@@ -261,19 +264,6 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int gc0310_s_config(struct v4l2_subdev *sd)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = pm_runtime_get_sync(&client->dev);
-	if (ret >= 0)
-		ret = gc0310_detect(client);
-
-	pm_runtime_put(&client->dev);
-	return ret;
-}
-
 static int gc0310_g_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_frame_interval *interval)
 {
@@ -403,7 +393,7 @@ static int gc0310_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
 
-	ret = gc0310_s_config(&dev->sd);
+	ret = gc0310_detect(client);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
-- 
2.40.1

