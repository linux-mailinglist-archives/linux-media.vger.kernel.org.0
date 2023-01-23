Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E81F677BE4
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbjAWMzL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbjAWMzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB8F2102
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d610X0Ps7fGiDlzx6sG6hJzIubiUs2bO9UIizF024m4=;
        b=grKjC160TWll6bFgTDkYYnejUKrgK+7RW7ID8eMNjgg+be8jjqKqnWu36yGRPdoNmhMKb1
        pzVsTAKBIuc0n1Q4FcCbXmjtC9wep3cHysK5DjYlr0ZHcp5dZ53AgIXJ/DVmOA2DixxjgR
        m+/6YYfceEQbkPeGmE0rwqOlZJOM2dc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-G5OumJ1NNACCtmRAu-tybw-1; Mon, 23 Jan 2023 07:54:02 -0500
X-MC-Unique: G5OumJ1NNACCtmRAu-tybw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D99D3814941;
        Mon, 23 Jan 2023 12:54:02 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A93DAC15BA0;
        Mon, 23 Jan 2023 12:53:59 +0000 (UTC)
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
Subject: [PATCH 37/57] media: atomisp: ov2680: Drop unused res member from struct ov2680_device
Date:   Mon, 23 Jan 2023 13:51:45 +0100
Message-Id: <20230123125205.622152-38-hdegoede@redhat.com>
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

The res member of struct ov2680_device isn't read anywhere anymore,
drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 5 -----
 drivers/staging/media/atomisp/i2c/ov2680.h         | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index dee6eb3d8c63..09c260ac93bf 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -548,10 +548,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 
 	/* Restore value of all ctrls */
 	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
-	if (ret < 0)
-		goto err;
-
-	dev->res = res;
 err:
 	mutex_unlock(&dev->input_lock);
 	return ret;
@@ -839,7 +835,6 @@ static int ov2680_probe(struct i2c_client *client)
 	mutex_init(&dev->input_lock);
 
 	dev->client = client;
-	dev->res = &ov2680_res_preview[0];
 	v4l2_i2c_subdev_init(&dev->sd, client, &ov2680_ops);
 
 	pdata = gmin_camera_platform_data(&dev->sd,
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 4c1d20f514b2..e9d0c84705fb 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -180,7 +180,6 @@ struct ov2680_device {
 	struct media_pad pad;
 	struct mutex input_lock;
 	struct i2c_client *client;
-	struct ov2680_resolution *res;
 	struct camera_sensor_platform_data *platform_data;
 	bool power_on;
 	bool is_streaming;
-- 
2.39.0

