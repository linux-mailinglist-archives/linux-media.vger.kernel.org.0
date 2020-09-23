Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F843275B89
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 17:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgIWPVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 11:21:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:41050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgIWPVv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 11:21:51 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C013B2220D;
        Wed, 23 Sep 2020 15:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600874511;
        bh=YFzPYTGbhS/cXqU9/JrjDc2rIbUUmhePYBf0XdnbY5c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jdFSqzeaWobiZMLn/+cvSwMakiL7KnX32BZ+wR8JppfqHnUFznHunmVWEirUe7Pki
         8xXWp3T6PPzBayhIL3uqO2rvT5MdPR2F9XKBjI2VQt0UBnH0czAdJd3Ljf/ureAEuH
         UErCL/cjIU2hOaJgewkWihe6AQTiLxvVXBee1QEg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] media: i2c: imx258: add support for binding via device tree
Date:   Wed, 23 Sep 2020 17:21:27 +0200
Message-Id: <20200923152129.21736-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923152129.21736-1-krzk@kernel.org>
References: <20200923152129.21736-1-krzk@kernel.org>
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
index ccb55fd1d506..ed79bfb4c991 100644
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
2.17.1

