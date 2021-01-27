Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F46430627B
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 18:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344182AbhA0Rrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 12:47:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:47176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344015AbhA0RrY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 12:47:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 532D064DB1;
        Wed, 27 Jan 2021 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611769603;
        bh=awOKI+XahHrzKqFqIy2x/6lyBTxRkf5j29o/Rpfi+pg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=m3u3hMcND3YBEhX700GAcxV5KDOYlTcCV/ZXzAphI3eZ9DaKJ5Ec1kKCWWui/Fmey
         POQ6Xi69PmNNsaYS09Az66I3HL5PM/gNbdJhzjySimKRPVQpSTajFm+6nIdNq87i8L
         UOXJnaZ4Ujqsv+vPB/HwvAT/luuRXinFqeFA4JfUPdPZjZ8eFpQUIykD36V94uuu6k
         6CNpipVaW0lWLsF9O+0A2U8uzS9WT/X+4b3Vxp7bPU8uHeLeGQFV+woLBtVk5WoWOS
         MUQGy8IOf9lD64lvVaX6ONphinlM0CLhkF5D0jlybUvaGqUT4f5EJeCyUESCAKKewK
         3cxXtZIfNfxGA==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/4] media: i2c: imx258: add support for binding via device tree
Date:   Wed, 27 Jan 2021 18:46:33 +0100
Message-Id: <20210127174635.3596-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127174635.3596-1-krzk@kernel.org>
References: <20210127174635.3596-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX258 can be used also on embedded designs using device tree so
allow the sensor to bind to a device tree node.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
---
 drivers/media/i2c/imx258.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index df62c69a48c0..ba7f29622974 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1291,11 +1291,18 @@ static const struct acpi_device_id imx258_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, imx258_acpi_ids);
 #endif
 
+static const struct of_device_id imx258_dt_ids[] = {
+	{ .compatible = "sony,imx258" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx258_dt_ids);
+
 static struct i2c_driver imx258_i2c_driver = {
 	.driver = {
 		.name = "imx258",
 		.pm = &imx258_pm_ops,
 		.acpi_match_table = ACPI_PTR(imx258_acpi_ids),
+		.of_match_table	= imx258_dt_ids,
 	},
 	.probe_new = imx258_probe,
 	.remove = imx258_remove,
-- 
2.25.1

