Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A98B51CC6A
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386541AbiEEXH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386535AbiEEXH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:07:56 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E765EDCA
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:15 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id i133-20020a1c3b8b000000b003946c466c17so586501wma.4
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LwE0qGkmiPjneH2DbDMhC+unsy48LGyAbwLZRv++e6Y=;
        b=MeG2ksdLjesAZbVvWNmBOa36TqdtnEzyvGERMp4MO1yovXw/yh8lu66Hr6/P3BYjYW
         Pf+MUYbVS5JJrphpox5UDvBL/JQprhh/UJpmfGv9IAuTx3rvlPM6L++IZGQEATftOLnR
         VmWLs8W/WYIgAbFd91XAgkThB+NaiQB0ICfdAEMMZW6WOprF/Ra+SZ7pPbVN3kF5KWKJ
         mLQOj8SJ3aUcIeXMSXjziILTRR352zERrtAiPAvWMgNpK/Ke0Jtv2IOak7xyKEOlH9AB
         OuBfHY9v8Wl3Z5O40vLU/lEDSevh5wUw/z0d8MVIqVSCtJmqXY3KktyVFWUnzfFJRpiR
         KBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LwE0qGkmiPjneH2DbDMhC+unsy48LGyAbwLZRv++e6Y=;
        b=NMRkutExI+/z9cxKQc4NXX764rngtvUSiHH3I5p6bBC/SEBbhkQFWl8K7ZJwXKAnFn
         q1Eldgn812/7GQiTomGfBS0MVXG7JGoWArNOzSE0IFGEmtXIhJYMGkc9YMe1wGutq6oI
         hE2y9qc1Rx0/aAWJv2IaH3qCOCNjL5ujfI+FFzwNcRgo5tNL/YwqFx9hURw9hDM9cu27
         fzNsDfjNbZ9Qxo1I7ulz1nBPPmnryPiwL/q9PdvHynffzglzGKuMeF+eNUfXS+aUDnD4
         IYtSiqVHnZJ8qPJRN8ZhkMbTIRF7tAJXKWd8SpksVpSS0+QasnICHtaeSIJOUzCAM1uy
         eNtw==
X-Gm-Message-State: AOAM533pGa0IZh9AEfHUvuYDoNouhHOfseKwRN0T+POihVw4UjyOp+Dl
        7GkKU5xv/DsRf4H9hSK+AJBW0mdLeXQ=
X-Google-Smtp-Source: ABdhPJwIK47X7LX0NsaMeINp9AfCJ2OpUaXoXcYru8/FayFhLWc4L6W3pUh6tzRBcnZhf/EWQNwjjw==
X-Received: by 2002:a1c:19c3:0:b0:392:9cef:e32b with SMTP id 186-20020a1c19c3000000b003929cefe32bmr477687wmz.116.1651791854729;
        Thu, 05 May 2022 16:04:14 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:14 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 03/15] media: i2c: Add acpi support to ov7251
Date:   Fri,  6 May 2022 00:03:50 +0100
Message-Id: <20220505230402.449643-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for enumeration through ACPI to the ov7251 driver

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v4:

	- None

Changes in v3:

	- None

Changes in v2:

	- None
 drivers/media/i2c/ov7251.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index ebb299f207e5..d6fe574cb9e0 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -14,6 +14,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -1490,9 +1491,16 @@ static const struct of_device_id ov7251_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov7251_of_match);
 
+static const struct acpi_device_id ov7251_acpi_match[] = {
+	{ "INT347E" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov7251_acpi_match);
+
 static struct i2c_driver ov7251_i2c_driver = {
 	.driver = {
 		.of_match_table = ov7251_of_match,
+		.acpi_match_table = ov7251_acpi_match,
 		.name  = "ov7251",
 	},
 	.probe_new  = ov7251_probe,
-- 
2.25.1

