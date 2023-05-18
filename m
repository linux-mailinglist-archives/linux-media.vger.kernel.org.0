Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C55E7084EE
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbjERPdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbjERPdS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:33:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D423611D
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684423948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gxV8KVIKHlEgmg3dCfW2L8bUk1uiBPvCDIyn7VgJ5O4=;
        b=eVJbqHa09xNPoEcZoUYfBkRdiuAIDTVI6cFjMsW6zVI/wTPknc8a2Wg5ntRHm+YCnDwjdR
        PB9FoOac24G/QOGFeVNDM7/fEaKwzKVJV/A3PV5X93TWIObaHZ2o7zyeLzfvJ0/Fj3DrKb
        7LedAt2tx/X1V866oeG17n9yMaj8GP8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-KTKkyC18OS6YyHLg6QyG2Q-1; Thu, 18 May 2023 11:32:22 -0400
X-MC-Unique: KTKkyC18OS6YyHLg6QyG2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F04EF3801F4D;
        Thu, 18 May 2023 15:32:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7339B407890A;
        Thu, 18 May 2023 15:32:20 +0000 (UTC)
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
Subject: [PATCH 3/9] media: atomisp: gc0310: Turn into standard v4l2 sensor driver
Date:   Thu, 18 May 2023 17:32:08 +0200
Message-Id: <20230518153214.194976-4-hdegoede@redhat.com>
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

Switch the atomisp-gc0310 driver to v4l2 async device registration.

After this change this driver no longer depends on
atomisp_gmin_platform and all atomisp-isms are gone.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 7 ++-----
 drivers/staging/media/atomisp/i2c/gc0310.h         | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index de7de1765e6b..1db9580fca78 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -35,7 +35,6 @@
 #include <media/v4l2-acpi.h>
 #include <media/v4l2-device.h>
 #include <linux/io.h>
-#include "../include/linux/atomisp_gmin_platform.h"
 
 #include "gc0310.h"
 
@@ -374,8 +373,7 @@ static void gc0310_remove(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "gc0310_remove...\n");
 
-	atomisp_unregister_subdev(sd);
-	v4l2_device_unregister_subdev(sd);
+	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
 	v4l2_ctrl_handler_free(&dev->ctrls.handler);
 	pm_runtime_disable(&client->dev);
@@ -434,8 +432,7 @@ static int gc0310_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = atomisp_register_sensor_no_gmin(&dev->sd, 1, ATOMISP_INPUT_FORMAT_RAW_8,
-					      atomisp_bayer_order_grbg);
+	ret = v4l2_async_register_subdev_sensor(&dev->sd);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index d40406289598..b5200a9c08a2 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -31,8 +31,6 @@
 #include <linux/v4l2-mediabus.h>
 #include <media/media-entity.h>
 
-#include "../include/linux/atomisp_platform.h"
-
 #define GC0310_NATIVE_WIDTH			656
 #define GC0310_NATIVE_HEIGHT			496
 
-- 
2.40.1

