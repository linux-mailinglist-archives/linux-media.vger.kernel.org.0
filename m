Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0EB51B1F5
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379014AbiEDWef (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378999AbiEDWe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:26 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF722CE12
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:44 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t6so3813766wra.4
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LtBY2N5TqXr61LjPKGIkUGFKcHrrJ6M9YgKf43sWM2Y=;
        b=oWLAhudozGakxnM7+JelipPSPGMO7VGIkAgZBtCJiGO5hk1AkFB74UFg984TMe6eZD
         cZ+d7zaYT4C+a2x/DLD8w/a2oGHqPCH4ya1eAabb6PCtqgoIjjaRGhUEVK4AB5ZQy9n3
         FlGcAbj+viAfD/Kyfq+7/vzsNaMD/sq2lJD/WxPDIujrxrPTee28FpE+zpv6lXYI0MrE
         dgGmw1WSOhE6Oaco/65bKcKOliwWlSrC1vuLw7wa5uIA4Ld7wqf3lZRfhomeE8aQWCC3
         CORltZkGfBDYkpcN7Vy6FPGSklD5cJ5mXrueI6pwVSa3AvANkblpaW5lhOGMIZ296KQJ
         eNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LtBY2N5TqXr61LjPKGIkUGFKcHrrJ6M9YgKf43sWM2Y=;
        b=agH3FjRqXToPdJ8+Op1pAhJSNB2C7F6rQFfJvS23Ri8sSRkPHl41eYeQj4/1OrknN3
         ukGee8VAL7DiuREPxQO4b+F+zKYLqDOP3VMa/s8N3eGjEcvaSyYbHNF37FP9D/L/krga
         WuJamINAXUqb/T6tJmgW7ce/HSo4cyCeAPrcC/JaYm2dAvJ1PvTF7ufEuFJakhbGsomm
         u3SYuBtFnfuRi2qbTAsWahvhErTu6WyDZe0GVWkPZvwy0HJ5MTQuVwtH/yGL2F5esSw3
         PXFOHUxc1fUaNnXODdrbW9umkAluKPTS9oBevVMWvGPzlV0g13J7rff/4fy1RKeBtRMK
         7kJw==
X-Gm-Message-State: AOAM533CYc1PWqqJpBFNnT5BciCZ3ukfbUYXBucGx4jHU56kOGw9tJgs
        qBtpkHIkS3EGMSfTWVE/yEyZku/gWbI=
X-Google-Smtp-Source: ABdhPJzvoyzuQCyl7USfFZ54Cl3rpgjBcrz7Ok3tbgeF/tiRfmoTkHe2RqXYtpYM8oy0RzxUjLMdeA==
X-Received: by 2002:a5d:5887:0:b0:20c:83c9:b72 with SMTP id n7-20020a5d5887000000b0020c83c90b72mr3373093wrf.588.1651703443477;
        Wed, 04 May 2022 15:30:43 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:43 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 03/15] media: i2c: Add acpi support to ov7251
Date:   Wed,  4 May 2022 23:30:15 +0100
Message-Id: <20220504223027.3480287-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
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

