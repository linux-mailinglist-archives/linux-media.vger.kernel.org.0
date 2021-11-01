Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9FF441193
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhKAAOA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbhKAAN7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:13:59 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE749C061746
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:26 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t30so947209wra.10
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/bxjYb6n9S0JXORpKNDGou8wcIBVx4S43SiHjxxXlMc=;
        b=KXCtC8ZcFEsxo5Jn7X2/wTaXsQFk+/1EG6VzVH0U6Snw0d7AApH26jA60Gwhzkxncu
         JXF+xJ9yasianYa27N8mrOacI/hKpBqrsyI/3VtkelkLwTcYpuz8NUwOqpSSvIPOCRoW
         84uOcBqHJvynxdIyJ7NPvLAdT7YsDGNFBmxVyLrwrEzPgZAgTII0BwYxoHuFFlOiWoI+
         L+p9VNAWNS3cfC4fl2mMsgUcUmYHFfpZvzHclVVvRzwOUDuNMg+yYcMQ0l4IosM4FPx4
         B776MAGsz0Dzr0CqZMQdJ1HUYeDuM+4zFcq8ocx9LsbpG6Akj66DfhBrTqydzMXpnrJk
         1tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/bxjYb6n9S0JXORpKNDGou8wcIBVx4S43SiHjxxXlMc=;
        b=SkdfuOqfgtGYw5G0UAq785Osha7+gKm82Qm4+MBfPIBe9X/6ZwyF5sv8m03sKEPJ0B
         +g3/Q3YvrMthpeK9ft4oeViDgfrQImvruby5k8QT33eaAlaRXKwgk9qGkDB1CU1Z73Pq
         IXCz3d1BtK9shdCsYjsCgr3tvjBuGl2kpvzVu3e0xaORhNWXCJ+OlCcX3BJBUoD6ysSS
         QgHCHKhg3icO8pBPzH6KwG+RWusxGQALaU5sa5fc4qm1LDn88PmvXchCaKWz7xBapAOC
         l632iXPd9guI1pfrnm9asctlafcHOgtsSH+3vWyZCx9g5wy2ZzQF5IQwmn3P5Zm8gL83
         A5oA==
X-Gm-Message-State: AOAM532wtzv7uN0cF92qCLWV4m5HQZssH1lBTa0hKiuKKbnLqJdinkzu
        /telMVnFvLIfygqZVkRevuI=
X-Google-Smtp-Source: ABdhPJxvtNneAlzvvVWRNR1BrXsEInIwqRhdj6zFIDLejp0Uu/ZXlRDeeR2ycwyCdZneXjzbznsxDA==
X-Received: by 2002:a05:6000:2c6:: with SMTP id o6mr33059470wry.321.1635725485535;
        Sun, 31 Oct 2021 17:11:25 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:25 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 01/16] media: i2c: Add ACPI support to ov8865
Date:   Mon,  1 Nov 2021 00:11:04 +0000
Message-Id: <20211101001119.46056-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
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
 drivers/media/i2c/ov8865.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index ce50f3ea87b8..7626c8608f8f 100644
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

