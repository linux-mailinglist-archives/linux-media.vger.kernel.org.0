Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B182773479A
	for <lists+linux-media@lfdr.de>; Sun, 18 Jun 2023 20:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjFRSSg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Jun 2023 14:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjFRSSf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Jun 2023 14:18:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD44EAA
        for <linux-media@vger.kernel.org>; Sun, 18 Jun 2023 11:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687112267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=PYQdVMUqNfC3tSh5mFYgKCL0bXZs+1UhR11OrbqPkWA=;
        b=PVt9zh0wQDMVzu6Y/GRZozFtQaJiKnNOjC/7C+AxVjHre6bJYjOMFbA0aFVQSgP3grK5zG
        yX9JmSm/yOX7maRbGaK3TXzaSQrM5hYFXoh9Pmj3JRO1pXVN6olTppG8YPt/GIYlAADgrG
        c0Y0zLCLx1lNWZtZHfSCYiPnB7MhsYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-bYBcxI_6O8-ZSBUeMZXiwQ-1; Sun, 18 Jun 2023 14:17:43 -0400
X-MC-Unique: bYBcxI_6O8-ZSBUeMZXiwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC11585A58C;
        Sun, 18 Jun 2023 18:17:42 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.65])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A41C7440CB;
        Sun, 18 Jun 2023 18:17:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH] media: ad5820: Drop unsupported ad5823 from i2c_ and of_device_id tables
Date:   Sun, 18 Jun 2023 20:17:40 +0200
Message-ID: <20230618181740.42432-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The supported ad5820 and ad5821 VCMs both use a single 16 bit register
which is written by sending 2 bytes with the data directly after sending
the i2c-client address.

The ad5823 OTOH has a more typical i2c / smbus device setup with multiple
8 bit registers where the first byte send after the i2c-client address is
the register address and the actual data only starts from the second byte
after the i2c-client address.

The ad5823 i2c_ and of_device_id-s was added at the same time as
the ad5821 ids with as rationale:

"""
Some camera modules also refer that AD5823 is a replacement of AD5820:
https://download.kamami.com/p564094-OV8865_DS.pdf
"""

The AD5823 may be an electrical and functional replacement of the AD5820,
but from a software pov it is not compatible at all and it is going to
need its own driver, drop its id from the ad5820 driver.

Fixes: b8bf73136bae ("media: ad5820: Add support for ad5821 and ad5823")
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ad5820.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index 5f605b9be3b1..1543d24f522c 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -349,7 +349,6 @@ static void ad5820_remove(struct i2c_client *client)
 static const struct i2c_device_id ad5820_id_table[] = {
 	{ "ad5820", 0 },
 	{ "ad5821", 0 },
-	{ "ad5823", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ad5820_id_table);
@@ -357,7 +356,6 @@ MODULE_DEVICE_TABLE(i2c, ad5820_id_table);
 static const struct of_device_id ad5820_of_table[] = {
 	{ .compatible = "adi,ad5820" },
 	{ .compatible = "adi,ad5821" },
-	{ .compatible = "adi,ad5823" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ad5820_of_table);
-- 
2.41.0

