Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8DD366D6C
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 16:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243147AbhDUOAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 10:00:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242918AbhDUOA3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 10:00:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B824261439;
        Wed, 21 Apr 2021 13:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619013595;
        bh=CNVQb2amglggiYK766COMdlMdf28ZQ5o8yA5i+2u1Ag=;
        h=From:To:Cc:Subject:Date:From;
        b=FjcBTQqwSoCGO7LSoEYjwuACGY0C4aaHmenpPuafPRLuhmgi17ZmCVbmfExVeafan
         tAXgTuNniibSJS7qbFMlwvx+by7SWIkGFcGsA6jI9h9BlTI+Ri5RjMakxmwLyWG1Uq
         NU8ZKqmeQR0DUYMBcis+mVxsK9b17+FcQbV24OeLrozRYoO/N5rVMonzLJ0WqxR2rw
         YvEYJowj5OPr7vIRWUXIB3dGKerse/aWT3bPHfD+WLBEvM4X9+/VZt1lxMk7yCDZ0G
         BFod92ySyi0c9QGRqIxcZn5RZHRYTUq8GoxMZnc1axiGs0y+Kx+48YEpmClFH2DNsR
         nFf3OcTrBCHuQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Sean Young <sean@mess.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] [v2] media: rc: remove tango ir driver and keymap
Date:   Wed, 21 Apr 2021 15:58:40 +0200
Message-Id: <20210421135935.3653827-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The tango platform was removed, so the driver is no longer needed.

Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
Acked-by: Mans Rullgard <mans@mansr.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Sorry for the late resend
---
 .../devicetree/bindings/media/rc.yaml         |   1 -
 .../devicetree/bindings/media/tango-ir.txt    |  21 --
 drivers/media/rc/Kconfig                      |  10 -
 drivers/media/rc/Makefile                     |   1 -
 drivers/media/rc/keymaps/Makefile             |   1 -
 drivers/media/rc/keymaps/rc-tango.c           |  89 ------
 drivers/media/rc/tango-ir.c                   | 267 ------------------
 include/media/rc-map.h                        |   1 -
 8 files changed, 391 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/tango-ir.txt
 delete mode 100644 drivers/media/rc/keymaps/rc-tango.c
 delete mode 100644 drivers/media/rc/tango-ir.c

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index e3cea8cd74ed..9e2059462d5b 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -125,7 +125,6 @@ properties:
       - rc-snapstream-firefly
       - rc-streamzap
       - rc-su3000
-      - rc-tango
       - rc-tanix-tx3mini
       - rc-tanix-tx5max
       - rc-tbs-nec
diff --git a/Documentation/devicetree/bindings/media/tango-ir.txt b/Documentation/devicetree/bindings/media/tango-ir.txt
deleted file mode 100644
index a9f00c2bf897..000000000000
--- a/Documentation/devicetree/bindings/media/tango-ir.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Sigma Designs Tango IR NEC/RC-5/RC-6 decoder (SMP86xx and SMP87xx)
-
-Required properties:
-
-- compatible: "sigma,smp8642-ir"
-- reg: address/size of NEC+RC5 area, address/size of RC6 area
-- interrupts: spec for IR IRQ
-- clocks: spec for IR clock (typically the crystal oscillator)
-
-Optional properties:
-
-- linux,rc-map-name: see Documentation/devicetree/bindings/media/rc.txt
-
-Example:
-
-	ir@10518 {
-		compatible = "sigma,smp8642-ir";
-		reg = <0x10518 0x18>, <0x105e0 0x1c>;
-		interrupts = <21 IRQ_TYPE_EDGE_RISING>;
-		clocks = <&xtal>;
-	};
diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
index f016b35c2b17..ae0025fba21c 100644
--- a/drivers/media/rc/Kconfig
+++ b/drivers/media/rc/Kconfig
@@ -499,16 +499,6 @@ config IR_SIR
 	   To compile this driver as a module, choose M here: the module will
 	   be called sir-ir.
 
-config IR_TANGO
-	tristate "Sigma Designs SMP86xx IR decoder"
-	depends on RC_CORE
-	depends on ARCH_TANGO || COMPILE_TEST
-	help
-	   Adds support for the HW IR decoder embedded on Sigma Designs
-	   Tango-based systems (SMP86xx, SMP87xx).
-	   The HW decoder supports NEC, RC-5, RC-6 IR protocols.
-	   When compiled as a module, look for tango-ir.
-
 config RC_XBOX_DVD
 	tristate "Xbox DVD Movie Playback Kit"
 	depends on RC_CORE
diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
index f31002288f7c..692e9b6b203f 100644
--- a/drivers/media/rc/Makefile
+++ b/drivers/media/rc/Makefile
@@ -48,6 +48,5 @@ obj-$(CONFIG_IR_IMG) += img-ir/
 obj-$(CONFIG_IR_SERIAL) += serial_ir.o
 obj-$(CONFIG_IR_SIR) += sir_ir.o
 obj-$(CONFIG_IR_MTK) += mtk-cir.o
-obj-$(CONFIG_IR_TANGO) += tango-ir.o
 obj-$(CONFIG_RC_XBOX_DVD) += xbox_remote.o
 obj-$(CONFIG_IR_TOY) += ir_toy.o
diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 50b2833dbe4f..f609dfe7fd76 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -100,7 +100,6 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-reddo.o \
 			rc-snapstream-firefly.o \
 			rc-streamzap.o \
-			rc-tango.o \
 			rc-tanix-tx3mini.o \
 			rc-tanix-tx5max.o \
 			rc-tbs-nec.o \
diff --git a/drivers/media/rc/keymaps/rc-tango.c b/drivers/media/rc/keymaps/rc-tango.c
deleted file mode 100644
index 2b9cef6ef5b5..000000000000
--- a/drivers/media/rc/keymaps/rc-tango.c
+++ /dev/null
@@ -1,89 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2017 Sigma Designs
- */
-
-#include <linux/module.h>
-#include <media/rc-map.h>
-
-static struct rc_map_table tango_table[] = {
-	{ 0x4cb4a, KEY_POWER },
-	{ 0x4cb48, KEY_FILE },
-	{ 0x4cb0f, KEY_SETUP },
-	{ 0x4cb4d, KEY_SUSPEND },
-	{ 0x4cb4e, KEY_VOLUMEUP },
-	{ 0x4cb44, KEY_EJECTCD },
-	{ 0x4cb13, KEY_TV },
-	{ 0x4cb51, KEY_MUTE },
-	{ 0x4cb52, KEY_VOLUMEDOWN },
-
-	{ 0x4cb41, KEY_NUMERIC_1 },
-	{ 0x4cb03, KEY_NUMERIC_2 },
-	{ 0x4cb42, KEY_NUMERIC_3 },
-	{ 0x4cb45, KEY_NUMERIC_4 },
-	{ 0x4cb07, KEY_NUMERIC_5 },
-	{ 0x4cb46, KEY_NUMERIC_6 },
-	{ 0x4cb55, KEY_NUMERIC_7 },
-	{ 0x4cb17, KEY_NUMERIC_8 },
-	{ 0x4cb56, KEY_NUMERIC_9 },
-	{ 0x4cb1b, KEY_NUMERIC_0 },
-	{ 0x4cb59, KEY_DELETE },
-	{ 0x4cb5a, KEY_CAPSLOCK },
-
-	{ 0x4cb47, KEY_BACK },
-	{ 0x4cb05, KEY_SWITCHVIDEOMODE },
-	{ 0x4cb06, KEY_UP },
-	{ 0x4cb43, KEY_LEFT },
-	{ 0x4cb01, KEY_RIGHT },
-	{ 0x4cb0a, KEY_DOWN },
-	{ 0x4cb02, KEY_ENTER },
-	{ 0x4cb4b, KEY_INFO },
-	{ 0x4cb09, KEY_HOME },
-
-	{ 0x4cb53, KEY_MENU },
-	{ 0x4cb12, KEY_PREVIOUS },
-	{ 0x4cb50, KEY_PLAY },
-	{ 0x4cb11, KEY_NEXT },
-	{ 0x4cb4f, KEY_TITLE },
-	{ 0x4cb0e, KEY_REWIND },
-	{ 0x4cb4c, KEY_STOP },
-	{ 0x4cb0d, KEY_FORWARD },
-	{ 0x4cb57, KEY_MEDIA_REPEAT },
-	{ 0x4cb16, KEY_ANGLE },
-	{ 0x4cb54, KEY_PAUSE },
-	{ 0x4cb15, KEY_SLOW },
-	{ 0x4cb5b, KEY_TIME },
-	{ 0x4cb1a, KEY_AUDIO },
-	{ 0x4cb58, KEY_SUBTITLE },
-	{ 0x4cb19, KEY_ZOOM },
-
-	{ 0x4cb5f, KEY_RED },
-	{ 0x4cb1e, KEY_GREEN },
-	{ 0x4cb5c, KEY_YELLOW },
-	{ 0x4cb1d, KEY_BLUE },
-};
-
-static struct rc_map_list tango_map = {
-	.map = {
-		.scan = tango_table,
-		.size = ARRAY_SIZE(tango_table),
-		.rc_proto = RC_PROTO_NECX,
-		.name = RC_MAP_TANGO,
-	}
-};
-
-static int __init init_rc_map_tango(void)
-{
-	return rc_map_register(&tango_map);
-}
-
-static void __exit exit_rc_map_tango(void)
-{
-	rc_map_unregister(&tango_map);
-}
-
-module_init(init_rc_map_tango)
-module_exit(exit_rc_map_tango)
-
-MODULE_AUTHOR("Sigma Designs");
-MODULE_LICENSE("GPL");
diff --git a/drivers/media/rc/tango-ir.c b/drivers/media/rc/tango-ir.c
deleted file mode 100644
index b8eb5bc4d9be..000000000000
--- a/drivers/media/rc/tango-ir.c
+++ /dev/null
@@ -1,267 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2015 Mans Rullgard <mans@mansr.com>
- */
-
-#include <linux/input.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/clk.h>
-#include <linux/of.h>
-#include <media/rc-core.h>
-
-#define DRIVER_NAME "tango-ir"
-
-#define IR_NEC_CTRL	0x00
-#define IR_NEC_DATA	0x04
-#define IR_CTRL		0x08
-#define IR_RC5_CLK_DIV	0x0c
-#define IR_RC5_DATA	0x10
-#define IR_INT		0x14
-
-#define NEC_TIME_BASE	560
-#define RC5_TIME_BASE	1778
-
-#define RC6_CTRL	0x00
-#define RC6_CLKDIV	0x04
-#define RC6_DATA0	0x08
-#define RC6_DATA1	0x0c
-#define RC6_DATA2	0x10
-#define RC6_DATA3	0x14
-#define RC6_DATA4	0x18
-
-#define RC6_CARRIER	36000
-#define RC6_TIME_BASE	16
-
-#define NEC_CAP(n)	((n) << 24)
-#define GPIO_SEL(n)	((n) << 16)
-#define DISABLE_NEC	(BIT(4) | BIT(8))
-#define ENABLE_RC5	(BIT(0) | BIT(9))
-#define ENABLE_RC6	(BIT(0) | BIT(7))
-#define ACK_IR_INT	(BIT(0) | BIT(1))
-#define ACK_RC6_INT	(BIT(31))
-
-#define NEC_ANY (RC_PROTO_BIT_NEC | RC_PROTO_BIT_NECX | RC_PROTO_BIT_NEC32)
-
-struct tango_ir {
-	void __iomem *rc5_base;
-	void __iomem *rc6_base;
-	struct rc_dev *rc;
-	struct clk *clk;
-};
-
-static void tango_ir_handle_nec(struct tango_ir *ir)
-{
-	u32 v, code;
-	enum rc_proto proto;
-
-	v = readl_relaxed(ir->rc5_base + IR_NEC_DATA);
-	if (!v) {
-		rc_repeat(ir->rc);
-		return;
-	}
-
-	code = ir_nec_bytes_to_scancode(v, v >> 8, v >> 16, v >> 24, &proto);
-	rc_keydown(ir->rc, proto, code, 0);
-}
-
-static void tango_ir_handle_rc5(struct tango_ir *ir)
-{
-	u32 data, field, toggle, addr, cmd, code;
-
-	data = readl_relaxed(ir->rc5_base + IR_RC5_DATA);
-	if (data & BIT(31))
-		return;
-
-	field = data >> 12 & 1;
-	toggle = data >> 11 & 1;
-	addr = data >> 6 & 0x1f;
-	cmd = (data & 0x3f) | (field ^ 1) << 6;
-
-	code = RC_SCANCODE_RC5(addr, cmd);
-	rc_keydown(ir->rc, RC_PROTO_RC5, code, toggle);
-}
-
-static void tango_ir_handle_rc6(struct tango_ir *ir)
-{
-	u32 data0, data1, toggle, mode, addr, cmd, code;
-
-	data0 = readl_relaxed(ir->rc6_base + RC6_DATA0);
-	data1 = readl_relaxed(ir->rc6_base + RC6_DATA1);
-
-	mode = data0 >> 1 & 7;
-	if (mode != 0)
-		return;
-
-	toggle = data0 & 1;
-	addr = data0 >> 16;
-	cmd = data1;
-
-	code = RC_SCANCODE_RC6_0(addr, cmd);
-	rc_keydown(ir->rc, RC_PROTO_RC6_0, code, toggle);
-}
-
-static irqreturn_t tango_ir_irq(int irq, void *dev_id)
-{
-	struct tango_ir *ir = dev_id;
-	unsigned int rc5_stat;
-	unsigned int rc6_stat;
-
-	rc5_stat = readl_relaxed(ir->rc5_base + IR_INT);
-	writel_relaxed(rc5_stat, ir->rc5_base + IR_INT);
-
-	rc6_stat = readl_relaxed(ir->rc6_base + RC6_CTRL);
-	writel_relaxed(rc6_stat, ir->rc6_base + RC6_CTRL);
-
-	if (!(rc5_stat & 3) && !(rc6_stat & BIT(31)))
-		return IRQ_NONE;
-
-	if (rc5_stat & BIT(0))
-		tango_ir_handle_rc5(ir);
-
-	if (rc5_stat & BIT(1))
-		tango_ir_handle_nec(ir);
-
-	if (rc6_stat & BIT(31))
-		tango_ir_handle_rc6(ir);
-
-	return IRQ_HANDLED;
-}
-
-static int tango_change_protocol(struct rc_dev *dev, u64 *rc_type)
-{
-	struct tango_ir *ir = dev->priv;
-	u32 rc5_ctrl = DISABLE_NEC;
-	u32 rc6_ctrl = 0;
-
-	if (*rc_type & NEC_ANY)
-		rc5_ctrl = 0;
-
-	if (*rc_type & RC_PROTO_BIT_RC5)
-		rc5_ctrl |= ENABLE_RC5;
-
-	if (*rc_type & RC_PROTO_BIT_RC6_0)
-		rc6_ctrl = ENABLE_RC6;
-
-	writel_relaxed(rc5_ctrl, ir->rc5_base + IR_CTRL);
-	writel_relaxed(rc6_ctrl, ir->rc6_base + RC6_CTRL);
-
-	return 0;
-}
-
-static int tango_ir_probe(struct platform_device *pdev)
-{
-	const char *map_name = RC_MAP_TANGO;
-	struct device *dev = &pdev->dev;
-	struct rc_dev *rc;
-	struct tango_ir *ir;
-	u64 clkrate, clkdiv;
-	int irq, err;
-	u32 val;
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return -EINVAL;
-
-	ir = devm_kzalloc(dev, sizeof(*ir), GFP_KERNEL);
-	if (!ir)
-		return -ENOMEM;
-
-	ir->rc5_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(ir->rc5_base))
-		return PTR_ERR(ir->rc5_base);
-
-	ir->rc6_base = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(ir->rc6_base))
-		return PTR_ERR(ir->rc6_base);
-
-	ir->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(ir->clk))
-		return PTR_ERR(ir->clk);
-
-	rc = devm_rc_allocate_device(dev, RC_DRIVER_SCANCODE);
-	if (!rc)
-		return -ENOMEM;
-
-	of_property_read_string(dev->of_node, "linux,rc-map-name", &map_name);
-
-	rc->device_name = DRIVER_NAME;
-	rc->driver_name = DRIVER_NAME;
-	rc->input_phys = DRIVER_NAME "/input0";
-	rc->map_name = map_name;
-	rc->allowed_protocols = NEC_ANY | RC_PROTO_BIT_RC5 | RC_PROTO_BIT_RC6_0;
-	rc->change_protocol = tango_change_protocol;
-	rc->priv = ir;
-	ir->rc = rc;
-
-	err = clk_prepare_enable(ir->clk);
-	if (err)
-		return err;
-
-	clkrate = clk_get_rate(ir->clk);
-
-	clkdiv = clkrate * NEC_TIME_BASE;
-	do_div(clkdiv, 1000000);
-
-	val = NEC_CAP(31) | GPIO_SEL(12) | clkdiv;
-	writel_relaxed(val, ir->rc5_base + IR_NEC_CTRL);
-
-	clkdiv = clkrate * RC5_TIME_BASE;
-	do_div(clkdiv, 1000000);
-
-	writel_relaxed(DISABLE_NEC, ir->rc5_base + IR_CTRL);
-	writel_relaxed(clkdiv, ir->rc5_base + IR_RC5_CLK_DIV);
-	writel_relaxed(ACK_IR_INT, ir->rc5_base + IR_INT);
-
-	clkdiv = clkrate * RC6_TIME_BASE;
-	do_div(clkdiv, RC6_CARRIER);
-
-	writel_relaxed(ACK_RC6_INT, ir->rc6_base + RC6_CTRL);
-	writel_relaxed((clkdiv >> 2) << 18 | clkdiv, ir->rc6_base + RC6_CLKDIV);
-
-	err = devm_request_irq(dev, irq, tango_ir_irq, IRQF_SHARED,
-			       dev_name(dev), ir);
-	if (err)
-		goto err_clk;
-
-	err = devm_rc_register_device(dev, rc);
-	if (err)
-		goto err_clk;
-
-	platform_set_drvdata(pdev, ir);
-	return 0;
-
-err_clk:
-	clk_disable_unprepare(ir->clk);
-	return err;
-}
-
-static int tango_ir_remove(struct platform_device *pdev)
-{
-	struct tango_ir *ir = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(ir->clk);
-	return 0;
-}
-
-static const struct of_device_id tango_ir_dt_ids[] = {
-	{ .compatible = "sigma,smp8642-ir" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, tango_ir_dt_ids);
-
-static struct platform_driver tango_ir_driver = {
-	.probe	= tango_ir_probe,
-	.remove	= tango_ir_remove,
-	.driver	= {
-		.name		= DRIVER_NAME,
-		.of_match_table	= tango_ir_dt_ids,
-	},
-};
-module_platform_driver(tango_ir_driver);
-
-MODULE_DESCRIPTION("SMP86xx IR decoder driver");
-MODULE_AUTHOR("Mans Rullgard <mans@mansr.com>");
-MODULE_LICENSE("GPL");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index b5585d14fff4..b50443d6fd77 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -312,7 +312,6 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_SNAPSTREAM_FIREFLY        "rc-snapstream-firefly"
 #define RC_MAP_STREAMZAP                 "rc-streamzap"
 #define RC_MAP_SU3000                    "rc-su3000"
-#define RC_MAP_TANGO                     "rc-tango"
 #define RC_MAP_TANIX_TX3MINI             "rc-tanix-tx3mini"
 #define RC_MAP_TANIX_TX5MAX              "rc-tanix-tx5max"
 #define RC_MAP_TBS_NEC                   "rc-tbs-nec"
-- 
2.29.2

