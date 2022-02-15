Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5054B7AFF
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242541AbiBOXIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241021AbiBOXIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:05 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236C565E0
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:54 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m126-20020a1ca384000000b0037bb8e379feso2497447wme.5
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=44CmJ4QtyEm7oBo0dApTxf2TlNPg1exYdSOKt0txzwU=;
        b=jkF7jdZpnPrMlilVWbpTbDKOI/ny/TP1HBWftbaIttn3qOEkWdzAHJLzPH/vcWrBVq
         i1PZBxVxM3Gwr/lG05MQf2pWVM5trbw4VA7J709Z/qAeHWEzsTpkDAEjT6g8R5BO5E/W
         CYxyQm0CUzi4sbQbQEKBZTh+U9inwSZ4o8mz0Q6bz2ZDF2qOqfThlNJNFnEiG0xjPFnV
         weC3PKz2gznTAdWHohAVvMBK1JlTF/UxG+zqctcCVcJNxRSk/RRRCfgOnLBKheB26gkt
         CjTXm0np4SXsOpjKvJNrIkU2Jj46UXfZUarrS0BH5OXmm5vipcMicDB7eyXJBbimx4li
         s+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=44CmJ4QtyEm7oBo0dApTxf2TlNPg1exYdSOKt0txzwU=;
        b=3SLU7UI/WlC3s4lwEdu+pcvqZnuWhMF6HsUzXgHYKwFqptWgSYvLvdAb9q+JrPuKX1
         OEwVUuE/0JdM9RCm0VgJbtjHpQN5hUhe9fJKHSKJJmLb72oBmM1e3rGcUwOax6pq5HWb
         Yq8bAq38pGrCF3w3Zq06lOlK+/7qR9V2/VAkLgcMhmQgJ2CZmwaG4UiR3pbxxodl7AVV
         XSH5/7epzRDjz+pTEpuC45ybFFHgU/KHNxwLvJKuV20WbKOLKwRaLDVefvMVuTjxvEoZ
         FTriffZZB/4jdugad5VzXpDt4H0fehvB01ADUB3FLToGiSe8F05ZlV81uI3ixN4r12ny
         wZDA==
X-Gm-Message-State: AOAM532bTJZuquc2X8sC1Kr3prpNoJst02sEwl6C0uUr8sTz2g3Ou7K2
        GF5QhgF/bmngBycBEwAcrmQQsVd/MRo4LA==
X-Google-Smtp-Source: ABdhPJyfZwzzti6+BF0O0YZbr+2Y0iEhLXz3Ha1j8fU7VNnTXgnBrYDeWD44iL7284z7C/8DuiMcNw==
X-Received: by 2002:a05:600c:1583:b0:346:3f83:6b8 with SMTP id r3-20020a05600c158300b003463f8306b8mr113497wmf.75.1644966472805;
        Tue, 15 Feb 2022 15:07:52 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:52 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 03/10] media: i2c: Add acpi support to ov7251
Date:   Tue, 15 Feb 2022 23:07:30 +0000
Message-Id: <20220215230737.1870630-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215230737.1870630-1-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
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

