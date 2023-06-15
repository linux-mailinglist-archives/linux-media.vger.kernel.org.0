Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA25D731B16
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344932AbjFOOPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345013AbjFOOPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859BD294D
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eMmKzqjUkskDKl2tvyFeP+FOjURkzLDRY3ct3DFVLNQ=;
        b=jBAc4Rm+qOoGZld1NP/P5/LrzncQSRHnvK0X1bp+kkyxbL/Yq46Ht+UH7bTTWmLFbGF1k0
        8dVS1Do5a55XdEop9jzGW88/uPMdvyzA5bQCuqfiC4DHqJtXtUmTtAIRfv/h69UFJAncsZ
        ZHuT8eIbpRLq6aiH2dqrwNRCMbKAgbc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-u66gaS8lNRyzrKM8D7zZ4Q-1; Thu, 15 Jun 2023 10:14:48 -0400
X-MC-Unique: u66gaS8lNRyzrKM8D7zZ4Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3521A857ABE;
        Thu, 15 Jun 2023 14:14:28 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 208BF48FB01;
        Thu, 15 Jun 2023 14:14:27 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 27/28] media: ov2680: Read and log sensor revision during probe
Date:   Thu, 15 Jun 2023 16:13:48 +0200
Message-Id: <20230615141349.172363-28-hdegoede@redhat.com>
In-Reply-To: <20230615141349.172363-1-hdegoede@redhat.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read and log sensor revision during probe.

Since this means that the driver will now already log a message on
successful probe drop the "ov2680 init correctly" log message.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 4b8561dc3111..b1107fd984a4 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -33,6 +33,7 @@
 #define OV2680_REG_SOFT_RESET			CCI_REG8(0x0103)
 
 #define OV2680_REG_CHIP_ID			CCI_REG16(0x300a)
+#define OV2680_REG_SC_CMMN_SUB_ID		CCI_REG8(0x302a)
 #define OV2680_REG_PLL_MULTIPLIER		CCI_REG16(0x3081)
 
 #define OV2680_REG_EXPOSURE_PK			CCI_REG24(0x3500)
@@ -941,10 +942,11 @@ static int ov2680_get_regulators(struct ov2680_dev *sensor)
 
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
 		return -ENODEV;
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
2.40.1

