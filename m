Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD094C3A20
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233831AbiBYAIx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiBYAIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:50 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EA4145E3E
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:18 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d3so2065399wrf.1
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Ggtdfs6xUCAEq1TnXtNlY6irAHHG7sOgSjdYFohxjU=;
        b=LFi1WglF2fSgMQGPVRwsXCoHK6v63I8U8/Yycf6ZefWgc/KuvKuOhLBRnZ/T57P3nW
         em4F+JS2zele004n1x1BzXizpNPbshdfWyDeaiBg8IsPjlDv9qTkCESUDovfukDOrTZ6
         z/F660U9KtDjp0KZBKQfOF8gUUMz0X6/1n2SDOrbdHG4BUiVCVNK2GlpGeXq9xIokiIB
         KDGz9dxnwr5kJw67tolfEmrfEJT/JjfoiqKrqHLOJ9Jfkf3XH/EASMNRCAQN7S+Q5VSV
         HCpeW5js0nRfRB65qxxdghzc2OKdR0xSq7Bs6oXa1XNw59aM+/f3d6Si87NSUzJSLs3o
         yY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Ggtdfs6xUCAEq1TnXtNlY6irAHHG7sOgSjdYFohxjU=;
        b=cqthZ4LNmVULVKLuPdTm1vu00Q3z2CA2fx7d7kyeTKFmQ7p36AFl5AxVHaByRtOXIK
         8KRLzfzoBr05I8IbpkRkSPmpK2VVVqgLU39aH7inGCb9gUBLLaaMJu+NFMte2Deo+Yu8
         3PoahNQVrHE1mfegakh43Ahhc5WbNADBY0sGddE8Y/fGSGMb/K2Ah1n9EsviK81TyzrC
         28nJZBMJzgYP0e04sHraF0SjeoORCPa1Jw+DOp2HCty3o5kfh8y18n3+GiTSvs7BAXOP
         EL5zkF6P24Ag/yz+PWww9DhfwpriRf4+T6u0770pMc0rTvBf/ReLxuxAunqHcva3i8Zr
         sJcg==
X-Gm-Message-State: AOAM533CLnxIh4R3McrCpwJsEp2J0HgUz7rl/5yUXkStNOetIaZ0gpH+
        lSMTHMNPf5wjoDtJkPWeIXHER+yGuAuwQw==
X-Google-Smtp-Source: ABdhPJx89AvKA3uncBqDeSNDYygU0jDA4JN0ucjA649nx81qmkzdjfUXpx6z7n0zAlUzx02y+bCI3w==
X-Received: by 2002:adf:d1c3:0:b0:1ea:911c:bf84 with SMTP id b3-20020adfd1c3000000b001ea911cbf84mr4173815wrd.355.1645747697573;
        Thu, 24 Feb 2022 16:08:17 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:17 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 03/11] media: i2c: Add acpi support to ov7251
Date:   Fri, 25 Feb 2022 00:07:45 +0000
Message-Id: <20220225000753.511996-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000753.511996-1-djrscally@gmail.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
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

