Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 177F6677BE9
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbjAWMz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbjAWMzZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC3F14E9F
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UtOK/HWNZH+qL5ZXF+cCXTlQOh44nlku8hLbqoDJs4U=;
        b=JhViXGEuX3jBpG1FCvBFt9e2B1irSiUPbNMW2DKWfPNkpxf/f7J8t6QWPZj3sjEWWDK1gt
        hmxSc+RBKkgzTKJpWoZjZyAdtz8LIOBtW2xv6v76jIMNOtARFKErW+Qe7meghDZGwXlBnP
        A1G0MOZ0dyrUDkbh5a8YxRXDLG5oV44=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-gnPVpXcyMHKmqk_mYeCRYw-1; Mon, 23 Jan 2023 07:54:35 -0500
X-MC-Unique: gnPVpXcyMHKmqk_mYeCRYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38B6785A588;
        Mon, 23 Jan 2023 12:54:35 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 15DA3C15BA0;
        Mon, 23 Jan 2023 12:54:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 49/57] media: atomisp: ov2680: Use devm_kzalloc() for sensor data struct
Date:   Mon, 23 Jan 2023 13:51:57 +0100
Message-Id: <20230123125205.622152-50-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use devm_kzalloc() to allocate the sensor data struct. It is always free-ed
as the last step of probe-error-exit or remove, so it can be devm-managed.

This will make unwinding things easier when support is added to the ov2680
code to use standard GPIO APIs instead of the custom atomisp_gmin code.

This also allows dropping the out_free label and use direct return
on errors.

This may seem like a functional change since the out_free label also
did a v4l2_device_unregister_subdev() but at the 2 changed returns
the device is not registered yet, so that always is a no-op and can
be dropped.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/i2c/atomisp-ov2680.c   | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 5f26508a1e5a..2b4673092b6a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -780,7 +780,6 @@ static void ov2680_remove(struct i2c_client *client)
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 	pm_runtime_disable(&client->dev);
-	kfree(sensor);
 }
 
 static int ov2680_probe(struct i2c_client *client)
@@ -789,7 +788,7 @@ static int ov2680_probe(struct i2c_client *client)
 	int ret;
 	void *pdata;
 
-	sensor = kzalloc(sizeof(*sensor), GFP_KERNEL);
+	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
 	if (!sensor)
 		return -ENOMEM;
 
@@ -801,10 +800,8 @@ static int ov2680_probe(struct i2c_client *client)
 	pdata = gmin_camera_platform_data(&sensor->sd,
 					  ATOMISP_INPUT_FORMAT_RAW_10,
 					  atomisp_bayer_order_bggr);
-	if (!pdata) {
-		ret = -EINVAL;
-		goto out_free;
-	}
+	if (!pdata)
+		return -EINVAL;
 
 	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_enable(&client->dev);
@@ -813,7 +810,7 @@ static int ov2680_probe(struct i2c_client *client)
 
 	ret = ov2680_s_config(&sensor->sd, client->irq, pdata);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
@@ -840,11 +837,6 @@ static int ov2680_probe(struct i2c_client *client)
 	}
 
 	return 0;
-out_free:
-	dev_dbg(&client->dev, "+++ out free\n");
-	v4l2_device_unregister_subdev(&sensor->sd);
-	kfree(sensor);
-	return ret;
 }
 
 static int ov2680_suspend(struct device *dev)
-- 
2.39.0

