Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC23B34D77
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbfFDQbN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:31:13 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53348 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727586AbfFDQaJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:09 -0400
Received: by mail-wm1-f66.google.com with SMTP id d17so732388wmb.3;
        Tue, 04 Jun 2019 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MV6jnkx+iwxZaJiMiVz9qnojBD0BD/3s5TPe2dpCEIM=;
        b=Fx/IlzsiYB9NYMdSCB4N/0Fj/qvx9OeMIafcg/PSyOCDwGIesjtTCej002nbNf4JPz
         A+bujnIxIilBNprucYdILxd1YfwkIdB9NF5tJHeIRgq+GqtBODKeetd7IlWQEVNS/T4V
         Uuhbz1duDEJKlQupeWkL7I+11uiZ5HdfeLxgr2Pov3CSp8bXGLqWWBZg/yX+EZGYmsHF
         njkmZ18cXZifWLATeXayCefXx5+tZtP9C8546a6eYd3FosyS29FmLxytOxW/+ReL0muo
         3G6x5PHVjYlT4j2mBrzTzXodcxUaNXkueypM9+K+dxEVGWTVay3M8vbiFrstyKORq435
         2ICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MV6jnkx+iwxZaJiMiVz9qnojBD0BD/3s5TPe2dpCEIM=;
        b=dSmee30SSqlvuSkidQgpCc7aCWCKApDfRaRGKn9BLkGmVn8/26YO1RNCzLit2va9wx
         ERyUgiDRZNB593eUYBjPtu3jm8uoS+DubfoSLKAcq/CpfWSwEpI4n/cnkw+YyWxthn17
         iqOT8eT1icGpZmr72+T33+bop2lRuuC/3uADbjDoI/8JAA0JyWKnnKvOflM5UTMuytQm
         fRRzfzF34iTMqb1y3SXYh94NcwrLtVC05X+lR6F3CgwMKGCrv6aym5VVHvJeZcE9bWyz
         VoiFfkavLVGr9HFarmYhwemRV1Au2yNAMe8/8Se7x5D1Q2i6d2ARPiumEbLnpR0VdL4l
         CS4A==
X-Gm-Message-State: APjAAAWK2xQGiMZTmT3eHROUKLh2RjPG3g7cd5anxlIwGLSPtZNrD7tT
        XOXAaV5BTkgvqRG9xbfc5MCkvt//XzW1sw==
X-Google-Smtp-Source: APXvYqwJYDJu1KcvEZ11IPopX5Ugbq2R6IGnkd1uXC8mohUAoxPbVCeDp32xyLvquSj+Yt3X0cF4Fg==
X-Received: by 2002:a1c:1947:: with SMTP id 68mr1406373wmz.171.1559665807417;
        Tue, 04 Jun 2019 09:30:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:06 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v4 02/13] media: rc: Introduce sunxi_ir_quirks
Date:   Tue,  4 Jun 2019 18:29:48 +0200
Message-Id: <20190604162959.29199-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604162959.29199-1-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver is used in various Allwinner SoC with different configuration.

Introduce a quirks struct to know the fifo size and if a reset is required.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/sunxi-cir.c | 61 +++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 307e44714ea0..d02dcb6fd0a5 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -81,6 +81,17 @@
 /* Time after which device stops sending data in ms */
 #define SUNXI_IR_TIMEOUT      120
 
+/**
+ * struct sunxi_ir_quirks - Differences between SoC variants.
+ *
+ * @has_reset: SoC needs reset deasserted.
+ * @fifo_size: size of the fifo.
+ */
+struct sunxi_ir_quirks {
+	bool		has_reset;
+	int		fifo_size;
+};
+
 struct sunxi_ir {
 	spinlock_t      ir_lock;
 	struct rc_dev   *rc;
@@ -143,6 +154,7 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node;
+	const struct sunxi_ir_quirks *quirks;
 	struct resource *res;
 	struct sunxi_ir *ir;
 	u32 b_clk_freq = SUNXI_IR_BASE_CLK;
@@ -151,12 +163,15 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	if (!ir)
 		return -ENOMEM;
 
+	quirks = of_device_get_match_data(&pdev->dev);
+	if (quirks == NULL) {
+		dev_err(&pdev->dev, "Failed to determine the quirks to use\n");
+		return -ENODEV;
+	}
+
 	spin_lock_init(&ir->ir_lock);
 
-	if (of_device_is_compatible(dn, "allwinner,sun5i-a13-ir"))
-		ir->fifo_size = 64;
-	else
-		ir->fifo_size = 16;
+	ir->fifo_size = quirks->fifo_size;
 
 	/* Clock */
 	ir->apb_clk = devm_clk_get(dev, "apb");
@@ -173,13 +188,15 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	/* Base clock frequency (optional) */
 	of_property_read_u32(dn, "clock-frequency", &b_clk_freq);
 
-	/* Reset (optional) */
-	ir->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
-	if (IS_ERR(ir->rst))
-		return PTR_ERR(ir->rst);
-	ret = reset_control_deassert(ir->rst);
-	if (ret)
-		return ret;
+	/* Reset */
+	if (quirks->has_reset) {
+		ir->rst = devm_reset_control_get_exclusive(dev, NULL);
+		if (IS_ERR(ir->rst))
+			return PTR_ERR(ir->rst);
+		ret = reset_control_deassert(ir->rst);
+		if (ret)
+			return ret;
+	}
 
 	ret = clk_set_rate(ir->clk, b_clk_freq);
 	if (ret) {
@@ -316,10 +333,26 @@ static int sunxi_ir_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sunxi_ir_quirks sun4i_a10_ir_quirks = {
+	.has_reset = false,
+	.fifo_size = 16,
+};
+
+static const struct sunxi_ir_quirks sun5i_a13_ir_quirks = {
+	.has_reset = false,
+	.fifo_size = 64,
+};
+
 static const struct of_device_id sunxi_ir_match[] = {
-	{ .compatible = "allwinner,sun4i-a10-ir", },
-	{ .compatible = "allwinner,sun5i-a13-ir", },
-	{},
+	{
+		.compatible = "allwinner,sun4i-a10-ir",
+		.data = &sun4i_a10_ir_quirks,
+	},
+	{
+		.compatible = "allwinner,sun5i-a13-ir",
+		.data = &sun5i_a13_ir_quirks,
+	},
+	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_ir_match);
 
-- 
2.20.1

