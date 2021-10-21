Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4B7436CE6
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhJUVqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhJUVqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:14 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAFCC061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:43:57 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id p21so961192wmq.1
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/w7EfRJhx2E8HGxcWfzRpVehPHP9jiRH6aIMpFoZSXk=;
        b=ceyAZX/bCJ2wwsHYUTng40w7DwGEjqdJTPiqES/QBWczEC2Wy76jzdPKaJtVqoXJmh
         1zALB+5Va/IeU4lcD10cfYnAABiKPz3qKfvoi7x1LsYDXucd2N3JaqbvOfPjsP7rP9Tz
         SNpF/AeSazFiyE89SzPa+VdTWBr1JaBsdTgapGa0YH4lfmJFOFjNWd2sBdZB2xuyaQ05
         Nf8lZAisn9Xxu9KlX0R6RY1/4l9XqdD0xuQlDuPe3VEw1XSHqtpZm6+EEeVyYAJvqkXb
         81WUs/mKPiUI/l4oelvcsacQyxplerzES32qrViyUe3xhtAK/kLkgN++K4v2w2fPzo7x
         jbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/w7EfRJhx2E8HGxcWfzRpVehPHP9jiRH6aIMpFoZSXk=;
        b=v4Xj9wSOsUw7f9k6EyykLLFQq1iXWQc1GY1W9PwAtFQ4Cfy3Biw6zl2UVm2Ru1qeYS
         DZf7nFjlyKAGcZ5fbUPZJiFRKqsPtTJ8U/C64gxQ+nELzwY1tMa6lRjVuTMrnmIIayuM
         Zc5PNvrPIHvsGQGBeiluBtluxiZv1MBmKzFN0R/YHHNUkjYcGlPVJu3oN/fTPfigfiiL
         drBusfRqWcpU/joU1lEmZzNabpt2aFq3X3pxzAvU9IfTEF/3tylO+gSmMc2yrGgY6Xar
         Fm1NuKYYV4X5ntvTnBF4b5z1IxKc/iVLaCDunRUXd9xnRjKdiQlLyyjDY837pp5Fc49H
         i7rg==
X-Gm-Message-State: AOAM531NvTiuAZZYLzDn9JeUXMMOKTBde5U6NS892ORQQ5D0vvki2prV
        lPebxkfRseu4sNS31di4xpo+7uHiOIY=
X-Google-Smtp-Source: ABdhPJyFOVBYaGac+qsH7xOXUIgizIPRA2bgC40bLToGYOH8rV5MyKN34Gu9Zxb7JO6lg91nrmKMDA==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr23136834wml.177.1634852636667;
        Thu, 21 Oct 2021 14:43:56 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:43:56 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 01/16] media: i2c: Add ACPI support to ov8865
Date:   Thu, 21 Oct 2021 22:43:16 +0100
Message-Id: <20211021214331.1188787-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 sensor is sometimes found on x86 platforms enumerated via ACPI.
Add an ACPI match table to the driver so that it's probed on those
platforms.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

 drivers/media/i2c/ov8865.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index d82c80274a7a..4c3039be9fe3 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
@@ -2946,6 +2947,12 @@ static const struct dev_pm_ops ov8865_pm_ops = {
 	SET_RUNTIME_PM_OPS(ov8865_suspend, ov8865_resume, NULL)
 };
 
+static const struct acpi_device_id ov8865_acpi_match[] = {
+	{"INT347A"},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8865_acpi_match);
+
 static const struct of_device_id ov8865_of_match[] = {
 	{ .compatible = "ovti,ov8865" },
 	{ }
@@ -2956,6 +2963,7 @@ static struct i2c_driver ov8865_driver = {
 	.driver = {
 		.name = "ov8865",
 		.of_match_table = ov8865_of_match,
+		.acpi_match_table = ov8865_acpi_match,
 		.pm = &ov8865_pm_ops,
 	},
 	.probe_new = ov8865_probe,
-- 
2.25.1

