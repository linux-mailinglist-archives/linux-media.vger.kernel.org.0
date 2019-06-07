Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A45433996D
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731450AbfFGXLO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:11:14 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45014 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731250AbfFGXLN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:13 -0400
Received: by mail-wr1-f68.google.com with SMTP id b17so3613091wrq.11;
        Fri, 07 Jun 2019 16:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nQa52sUHZ517m7H0LPZd/LRjrkZC8z+E4fM+VmhMcO0=;
        b=CECHZJqg/l5iO56T6hSFDxp8SKDvbku/8/gT+5g/3BhUfSrCljN4D11Laf+iXL29JR
         RMC0fWsn4BGkqOU7ZAsRawsHpNrGBQd5qzvD172Ces5DFruTSwS+nT/FbGDjaLx0k13X
         snmUOZTNZ2u3xtC02JBeWERzKEQ93DZ+JQABqrPpaxYu6KNjDh69svYQOlLVklgcgXQz
         GyFRkB/R8Tf2C9iuc77m0KP8CXt09E0VYwFrknpV+8NArPH+jWh5IW7/ZoP/5RgkY0JH
         t3kGCt0sTkjj6RzMTbugneDy2SA8nyILg70FzTlTSt3cWTkj94gB/K+XT19AFXHxSCra
         AuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nQa52sUHZ517m7H0LPZd/LRjrkZC8z+E4fM+VmhMcO0=;
        b=HUM+lwVYBW05bXjd9FTgTIF/aW/qKChvkYk2ipAJh27t7+04O2PZQQugeU+SDMnDPm
         VBfVk/KeCmUUyoUpLxgikVvJjolULbGIYTTFjDNw5Y93iTIFFgYa8nQPbC5ExQbEueCp
         BLf7vnpe7jSTyOX0T/uK+zjnorRoG6+T69aAuTNVFDG3UdcmOlF9YReOhPdhO2Rvo0mu
         At2Z5Ev9V8jnrYKM5/IrKdg9E7CADw1xGdJPKziIzikNw15wm9/3GpzBNJ2IgfAKlxLP
         pLXzgo1sX5D1ga1dAHr/CV+n6PI5bR0huo1XwTT4gcenJN51tdLNaX018m7oJlyWuEw/
         ToCg==
X-Gm-Message-State: APjAAAULloIeADQFjlW4fyIRbx6qEzYNelM8n3hMnUTZ801uGKgWzCzo
        ovip+kUwwy6hrZGe0NyxikxL45ceoo0=
X-Google-Smtp-Source: APXvYqwHX/FPxKirOi8VnV5ct8inI/+gasfuvYrdXORuCb+nY+vevbp3JsrN3ja9w8hPuIQD2+c1jQ==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr20049716wrj.47.1559949071207;
        Fri, 07 Jun 2019 16:11:11 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:09 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v5 02/13] media: rc: Introduce sunxi_ir_quirks
Date:   Sat,  8 Jun 2019 01:10:49 +0200
Message-Id: <20190607231100.5894-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607231100.5894-1-peron.clem@gmail.com>
References: <20190607231100.5894-1-peron.clem@gmail.com>
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
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
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

