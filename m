Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 042502B858F
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 21:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgKRU1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 15:27:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:48240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726397AbgKRU1X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 15:27:23 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1358246C2;
        Wed, 18 Nov 2020 20:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605731243;
        bh=awOKI+XahHrzKqFqIy2x/6lyBTxRkf5j29o/Rpfi+pg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lSv5jzn9L+7ukhSuSaft3SsDYzTYNaCYN2H7CeFa7lYE7xmUHMgGC/w6hJdM01BRc
         /M9thQPJbtsf41w91xm3aqg15wswOB51oqxNw5/eaXVjNGDzwZgpU+e8AjM+AXjOzs
         tWJv3XUqayaNvukqo/0QR3l+SLsJn+VeK03/BvSk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 2/4] media: i2c: imx258: add support for binding via device tree
Date:   Wed, 18 Nov 2020 21:27:13 +0100
Message-Id: <20201118202715.6692-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118202715.6692-1-krzk@kernel.org>
References: <20201118202715.6692-1-krzk@kernel.org>
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

