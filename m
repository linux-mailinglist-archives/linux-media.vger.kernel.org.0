Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1552CB8D
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbfE1QQC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:16:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43805 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfE1QO7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:14:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id l17so12494184wrm.10;
        Tue, 28 May 2019 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O41YUIVc2MJNuuXTwafk8QcCnNJUPDaUXKLKqpHPW48=;
        b=YhSCXK01y9HbwTyBObMn3fJPittt7i4aSVRpTPPjmajO7xtSjaZK0cRaOXZ7r19ajz
         +gcBgQ3posddHCH2GiO5s3XPG64beLuuMwRvfakcEEBy/wGjlbmefL665TJWDH9b/cJJ
         VRhTq4fAgXEbZg7Cq/EKE4aoJuOHkaTTrWBlbdA7Rj0EkSwQklxIh5O899bqnMZc3dLv
         AGzhwDwcXYSegQBMRAicZB64GRgo5zkE0wJ6pvH3/lDvYmtILl/FsJIRjNYeNd68OBRr
         JZLCsg28+RL5ynz4N7OfvWclWUiP+jIxdBqWSiL1T8LxLo2tSYJDn0MpySItIjfT9hYq
         /klQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O41YUIVc2MJNuuXTwafk8QcCnNJUPDaUXKLKqpHPW48=;
        b=I8tChv1EJhDPLh9nLT3rP6JxyCQAwrEXWUgz1TC/+mIuA1GWP4EtX72nbps5jeoTgK
         h+JnTQAIPeTZoS/0XSMiNAsLOclp820DzYVJcjNhwExt63x8Vv5G6Epnq3AJROWuAXgH
         BQiBDz1wcEijwGmhb8FESm3u1PqefGf5BQ5Q7ZrRunJOdJOwZGaOnPD2+ZRkZba/oOc1
         EbNOvl71AG/V8vnjSi0mvg6UXuaWQDBychlYlTz/jBgeX31Q9DjacEXJshPXrzgQZToL
         w2mQ7pqW+sWMmAx+UUTJyTIZDPO4bf2g/wvpv9q5HLXaklbU9Y+1IdUxyP0Fl6XfOyPd
         tlQQ==
X-Gm-Message-State: APjAAAWh7s8v3MIl5K1WZRztQdBI/O8PBi7SIvjSC2zAEeHb+SlFFt3z
        PDxeL/qWmq/aHO+Eqdy28Usu/b+6S0lfeQ==
X-Google-Smtp-Source: APXvYqzh9lA7QzTMNcXB9f8W/fXyhl8ZsJbIZmnPh8abVqtzC8iHmrkSxwMiA782tasG2CDzuGF3rA==
X-Received: by 2002:adf:9022:: with SMTP id h31mr22187951wrh.46.1559060097123;
        Tue, 28 May 2019 09:14:57 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.14.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:14:56 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 02/12] media: rc: Introduce sunxi_ir_quirks
Date:   Tue, 28 May 2019 18:14:30 +0200
Message-Id: <20190528161440.27172-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528161440.27172-1-peron.clem@gmail.com>
References: <20190528161440.27172-1-peron.clem@gmail.com>
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

