Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B293E4F9C
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbhHIW7V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236935AbhHIW7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:21 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C94C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:00 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so526903wms.2
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y+CnuUk1MG8+nD9ogP5Gq1YiYRDWMee14Is8W0ErguM=;
        b=Dl63A4F6quXuq9FDELX65373t1MLLPMaxlWBDljwOJpR79qJseGxswbhv1ctEsnjwS
         T7bvJXbaYCIgWcddKx4wj2+3Dd+YofnYq1gQdMgB7NcJg4LvdNUCE5zyU97KtBVqbb7K
         C1aQAFhaBXz0zcROIFL+KQ6iOzMIi8Ghm6mseBi+WwhPG/7yL/vMbHd0e66qKzWo/V6j
         xEhHGnKDpXA16fs/UK9KsZ0mw4A32JPr73LuzNab2nVaRFfAnqDvjRds+yz/34dRNLdu
         BzyA9PJW2TaZVCGzv98yfNfyu8vrm4YnzJVB3nKTMvFDdeOc7VGt3ZzHLGd/7e+j8CPE
         PntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y+CnuUk1MG8+nD9ogP5Gq1YiYRDWMee14Is8W0ErguM=;
        b=bKgpM16GNbFC90bYB+EsOVtvzhlaTnJhDiwT82J0VX9kuOIdEJ6PDcvxDN+c9P+LCO
         95iuSBwdLCvoLt9FfuXk7+ZGEikg72wTCMOthd+ZW7jj1aKbi5y5tupjZl/TwyDnnuWx
         gu78wsZM0ZYWrcNv6Yni7lfzxgvIjoLOUh4qN6uRQJhKkHrkK5u3f+3gNnVnIjHHni4I
         YvoBFPuNmbiLWATcf0nsxyoApCtYF8xsiMBe6dhDyjFLqfZsptUtHJ0inQy2+l/xPHC3
         cT2eJGF1ja+z22/0DPN4ToCJS8hNB6oNvdx+wJ6vywW5txZiRzinoxsk4XyP0knmCaCC
         wNkA==
X-Gm-Message-State: AOAM530f8B+CPHOgSLGqLQ3k5G2zPU7on/CyMsT0y8iTIbeqOLbIt0kN
        jolv7ST2ZkpJ0hOAqX7O2II=
X-Google-Smtp-Source: ABdhPJzUelipX/Ut3NHsZ/DI77imklltpETnbFt/ibjd0EW0fQXMq0dfQzRh/SISo8z2BMJC+Lc82g==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr1376766wmj.180.1628549938892;
        Mon, 09 Aug 2021 15:58:58 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:58:58 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 01/12] media: i2c: Add ACPI support to ov8865
Date:   Mon,  9 Aug 2021 23:58:34 +0100
Message-Id: <20210809225845.916430-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
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
Changes in v2:

	- Fix the new include to be mod_devicetable.h, not acpi.h (Andy)

 drivers/media/i2c/ov8865.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index ce50f3ea87b8..cf6cc55e8506 100644
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
+	{},
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

