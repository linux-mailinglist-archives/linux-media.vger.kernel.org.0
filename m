Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A918972664A
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjFGQsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjFGQsL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B9D1FCD
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wtzTphop/QGPuvX2Dof33TgW5E31wj3uTYmnHpW82os=;
        b=ggmG3vlJwD5gPALIIhLAqfCIcH0K9+4+C86u3DHvBdTcvlERnmnpslSv5EI7rcTZV4OWHh
        gCu0ZA7MMQG1EL3IOTHP3mO7Bp73xTq1E2KAbL7LOCwIsPZLLWlfrZ2KAGNgApjUPpmTJP
        UV2E3VT+nCouxFZCW4Jmu+ng9mJTI2s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-BOhGoirYOb2wSFEE92z7vQ-1; Wed, 07 Jun 2023 12:47:23 -0400
X-MC-Unique: BOhGoirYOb2wSFEE92z7vQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C6DB8032F1;
        Wed,  7 Jun 2023 16:47:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 738C6C154D3;
        Wed,  7 Jun 2023 16:47:21 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 02/28] media: ov2680: Fix ov2680_bayer_order()
Date:   Wed,  7 Jun 2023 18:46:46 +0200
Message-Id: <20230607164712.63579-3-hdegoede@redhat.com>
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

The index into ov2680_hv_flip_bayer_order[] should be 0-3, but
ov2680_bayer_order() was using 0 + BIT(2) + (BIT(2) << 1) as
max index, while the intention was to use: 0 + 1 + 2 as max index.

Fix the index calculation in ov2680_bayer_order(), while at it
also just use the ctrl values rather then reading them back using
a slow i2c-read transaction.

This also allows making the function void, since there now are
no more i2c-reads to error check.

Note the check for the ctrls being NULL is there to allow
adding an ov2680_fill_format() helper later, which will call
ov2680_set_bayer_order() during probe() before the ctrls are created.

Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 02204e185e2f..9a9c90c8a949 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -315,26 +315,17 @@ static void ov2680_power_down(struct ov2680_dev *sensor)
 	usleep_range(5000, 10000);
 }
 
-static int ov2680_bayer_order(struct ov2680_dev *sensor)
+static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
 {
-	u32 format1;
-	u32 format2;
-	u32 hv_flip;
-	int ret;
+	int hv_flip = 0;
 
-	ret = ov2680_read_reg(sensor, OV2680_REG_FORMAT1, &format1);
-	if (ret < 0)
-		return ret;
+	if (sensor->ctrls.vflip && sensor->ctrls.vflip->val)
+		hv_flip += 1;
 
-	ret = ov2680_read_reg(sensor, OV2680_REG_FORMAT2, &format2);
-	if (ret < 0)
-		return ret;
-
-	hv_flip = (format2 & BIT(2)  << 1) | (format1 & BIT(2));
+	if (sensor->ctrls.hflip && sensor->ctrls.hflip->val)
+		hv_flip += 2;
 
 	sensor->fmt.code = ov2680_hv_flip_bayer_order[hv_flip];
-
-	return 0;
 }
 
 static int ov2680_vflip_enable(struct ov2680_dev *sensor)
@@ -345,7 +336,8 @@ static int ov2680_vflip_enable(struct ov2680_dev *sensor)
 	if (ret < 0)
 		return ret;
 
-	return ov2680_bayer_order(sensor);
+	ov2680_set_bayer_order(sensor);
+	return 0;
 }
 
 static int ov2680_vflip_disable(struct ov2680_dev *sensor)
@@ -378,7 +370,8 @@ static int ov2680_hflip_disable(struct ov2680_dev *sensor)
 	if (ret < 0)
 		return ret;
 
-	return ov2680_bayer_order(sensor);
+	ov2680_set_bayer_order(sensor);
+	return 0;
 }
 
 static int ov2680_test_pattern_set(struct ov2680_dev *sensor, int value)
-- 
2.40.1

