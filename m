Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91167292CAD
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 19:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731107AbgJSR0f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 13:26:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:41696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730959AbgJSR0a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 13:26:30 -0400
Received: from localhost.localdomain (unknown [194.230.155.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3CAEF2224D;
        Mon, 19 Oct 2020 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603128390;
        bh=LtTPIaLF+T/Egigfy7DlYYdG0ge5HEoysq5xjHOwEqc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=klwvKpNBkSxcw7dMdvmeDPhn+uBB8ddY67JWfaOCgohr6LwJoV8z+pzLqCiT/e7bC
         hoKNL4J8IZUVi212uChMPAfE+/UFuRqIdO6+u1BOU5jEtoXCVArz/CPFkpFmP0gPI7
         M0V9j/NargeRy5Qf4+oxX8HspQ8roeX3EgDdoUW0=
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
Subject: [PATCH v5 2/4] media: i2c: imx258: add support for binding via device tree
Date:   Mon, 19 Oct 2020 19:26:15 +0200
Message-Id: <20201019172617.92815-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201019170247.92002-1-krzk@kernel.org>
References: <20201019170247.92002-1-krzk@kernel.org>
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
2.25.1

