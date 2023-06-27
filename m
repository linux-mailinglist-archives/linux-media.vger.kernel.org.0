Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C213E73FCB9
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 15:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjF0NVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 09:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbjF0NUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 09:20:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB232956
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687871959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lDNYewA0LhYP7AXWR2rYU9pbV3MQBnRXsVcZ7eW9yb8=;
        b=S/kxlGm6BOGnyO1sQ2LQIgufVsr0VPVC9k9spmK8AT8kNX7eny/JGJfD3hERqq3blYKBDO
        V48PEQd0D6V7NL2Px5I4dKcUQMcqS/rSJ9oTmPyCOdJ1V7nb8YbgjR0Jpq1gx3DMBT/xkx
        RC9mDMG7MPnnVuE+xdPHEYjgbVnzrUI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-3RlZmouePTidhjfuWup73w-1; Tue, 27 Jun 2023 09:19:15 -0400
X-MC-Unique: 3RlZmouePTidhjfuWup73w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A12B08C80FE;
        Tue, 27 Jun 2023 13:19:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 52279400F5A;
        Tue, 27 Jun 2023 13:19:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 27/29] media: ov2680: Read and log sensor revision during probe
Date:   Tue, 27 Jun 2023 15:18:28 +0200
Message-ID: <20230627131830.54601-28-hdegoede@redhat.com>
In-Reply-To: <20230627131830.54601-1-hdegoede@redhat.com>
References: <20230627131830.54601-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read and log sensor revision during probe.

Since this means that the driver will now already log a message on
successful probe drop the "ov2680 init correctly" log message.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index d1de2fc50f4e..8bc542df1890 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -33,6 +33,7 @@
 #define OV2680_REG_SOFT_RESET			CCI_REG8(0x0103)
 
 #define OV2680_REG_CHIP_ID			CCI_REG16(0x300a)
+#define OV2680_REG_SC_CMMN_SUB_ID		CCI_REG8(0x302a)
 #define OV2680_REG_PLL_MULTIPLIER		CCI_REG16(0x3081)
 
 #define OV2680_REG_EXPOSURE_PK			CCI_REG24(0x3500)
@@ -941,13 +942,14 @@ static int ov2680_get_regulators(struct ov2680_dev *sensor)
 
 static int ov2680_check_id(struct ov2680_dev *sensor)
 {
-	u64 chip_id;
-	int ret;
+	u64 chip_id, rev;
+	int ret = 0;
 
-	ret = cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, NULL);
+	cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, &ret);
+	cci_read(sensor->regmap, OV2680_REG_SC_CMMN_SUB_ID, &rev, &ret);
 	if (ret < 0) {
 		dev_err(sensor->dev, "failed to read chip id\n");
-		return -ENODEV;
+		return ret;
 	}
 
 	if (chip_id != OV2680_CHIP_ID) {
@@ -956,6 +958,9 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
 		return -ENODEV;
 	}
 
+	dev_info(sensor->dev, "sensor_revision id = 0x%llx, rev= %lld\n",
+		 chip_id, rev & 0x0f);
+
 	return 0;
 }
 
@@ -1094,8 +1099,6 @@ static int ov2680_probe(struct i2c_client *client)
 	pm_runtime_use_autosuspend(&client->dev);
 	pm_runtime_put_autosuspend(&client->dev);
 
-	dev_info(dev, "ov2680 init correctly\n");
-
 	return 0;
 
 err_pm_runtime:
-- 
2.41.0

