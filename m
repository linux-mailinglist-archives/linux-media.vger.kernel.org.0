Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5083F3B985D
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 23:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234364AbhGAVyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 17:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234362AbhGAVy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 17:54:28 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961D6C061765
        for <linux-media@vger.kernel.org>; Thu,  1 Jul 2021 14:51:57 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id q18so14431765lfc.7
        for <linux-media@vger.kernel.org>; Thu, 01 Jul 2021 14:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XfwI2ZLMsSJ6lBQhEzc3SCr+kTo1z/GTfT7cVLNS8Og=;
        b=Kq48LUcapJ8+2Le0SMu2cNTsta103hiMEe8g0tUGKIfCVnTzCxFL7IB9AwYMWSjuEf
         hdaIq3mEovF38PQoUCxMNCYkx7alzNtukaPxf7XOgtYpV3OuHG8yK088lbM3tcGUKtsq
         kCTWh52GSd0SBtGegRi6T1FDJ6j6UyVuHEbAht1zw3I30rjJQjWjDZxbZToSQEMBmWwl
         4dFpyfj68jZCQwWjJqA5i26buGaUbYTHoDrLf+TI02pjEFgXiOnriEVIy36W3CIk8RqP
         /5Z+4JUep4h4xqiAzQhjaPeZDVbSMoH4zMhZlDRJ9k/Wl73rna3zvmPzsUxAtT0SdQZ4
         BRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XfwI2ZLMsSJ6lBQhEzc3SCr+kTo1z/GTfT7cVLNS8Og=;
        b=sF902H301amoJVRhEHzRqOK07K9G3VZr1TCre74E0thRjehbdePGGqd+1mc83q3MWE
         kCWF7W0lbZOns5uRlv/VCZsV4CP5/e/fwUgG9hUPxitPKwqV9Idr8bW8XnVaVg3wrnRC
         Pz+I9yk+E4uBvHtvayxEbR+hIEJpu0+7rVxApD3uC0KELQsdTt0vPtSPSDs3aIdxKAKq
         FII1OL4sXZPq6snaSPINWAKCRknW+GuU4HzyHOhU+SA90dWBZoOEDkWea0ueLjuQf6KX
         sq1ob0FHC/ubuUHNNJx2s4caM8c6o1j1yefaZ3nd2xLBTXxrC8d5KA63JC5hKZ1EYCE+
         FB5A==
X-Gm-Message-State: AOAM531CnMZ+a41Tiwz3JFS7ouTmKrCxtZ3FwVHTDNf1JsBzMAjh5+ya
        PXrtg25zfmSxhMhgYRbCqcP0Rw==
X-Google-Smtp-Source: ABdhPJzmoyphMmYe6UIK3qQ4kxpbsmp1UxH8CO7z2WXW/11Im2L4KQLcijbd9JX6Lcz9tMZxMdK7Sg==
X-Received: by 2002:a19:8685:: with SMTP id i127mr1255089lfd.555.1625176315855;
        Thu, 01 Jul 2021 14:51:55 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:4d3d:fdb7:f150:ee77:eba5])
        by smtp.gmail.com with ESMTPSA id q17sm138623ljp.3.2021.07.01.14.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 14:51:55 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH 2/2] media: rc: introduce Meson IR blaster driver
Date:   Fri,  2 Jul 2021 00:51:32 +0300
Message-Id: <20210701215132.16317-3-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
References: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds the driver for Amlogic Meson IR blaster.

Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
(blaster) controller onboard. It is capable of sending IR
signals with arbitrary carrier frequency and duty cycle.

The driver supports 3 modulation clock sources:
 - sysclk
 - xtal3 clock (xtal divided by 3)
 - 1us clock

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 drivers/media/rc/Kconfig           |  10 +
 drivers/media/rc/Makefile          |   1 +
 drivers/media/rc/meson-irblaster.c | 433 +++++++++++++++++++++++++++++
 3 files changed, 444 insertions(+)
 create mode 100644 drivers/media/rc/meson-irblaster.c

diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
index d0a8326b75c2..6e60348e1bcf 100644
--- a/drivers/media/rc/Kconfig
+++ b/drivers/media/rc/Kconfig
@@ -246,6 +246,16 @@ config IR_MESON
 	   To compile this driver as a module, choose M here: the
 	   module will be called meson-ir.
 
+config IR_MESON_IRBLASTER
+	tristate "Amlogic Meson IR blaster"
+	depends on ARCH_MESON || COMPILE_TEST
+	help
+	   Say Y if you want to use the IR blaster available on
+	   Amlogic Meson SoCs.
+
+	   To compile this driver as a module, choose M here: the
+	   module will be called meson-irblaster.
+
 config IR_MTK
 	tristate "Mediatek IR remote receiver"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
index 692e9b6b203f..b108f2b0420c 100644
--- a/drivers/media/rc/Makefile
+++ b/drivers/media/rc/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_IR_ITE_CIR) += ite-cir.o
 obj-$(CONFIG_IR_MCEUSB) += mceusb.o
 obj-$(CONFIG_IR_FINTEK) += fintek-cir.o
 obj-$(CONFIG_IR_MESON) += meson-ir.o
+obj-$(CONFIG_IR_MESON_IRBLASTER) += meson-irblaster.o
 obj-$(CONFIG_IR_NUVOTON) += nuvoton-cir.o
 obj-$(CONFIG_IR_ENE) += ene_ir.o
 obj-$(CONFIG_IR_REDRAT3) += redrat3.o
diff --git a/drivers/media/rc/meson-irblaster.c b/drivers/media/rc/meson-irblaster.c
new file mode 100644
index 000000000000..ef60c8d3dc3e
--- /dev/null
+++ b/drivers/media/rc/meson-irblaster.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/**
+ * meson-irblaster.c - Amlogic Meson IR blaster driver
+ *
+ * Copyright (c) 2021, SberDevices. All Rights Reserved.
+ *
+ * Author: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; version 2 of the License and no later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
+ * NON INFRINGEMENT. See the GNU General Public License for more
+ * details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/interrupt.h>
+#include <linux/spinlock.h>
+#include <linux/of_irq.h>
+#include <linux/clk.h>
+#include <media/rc-core.h>
+
+#define DRIVER_NAME	"meson-irblaster"
+
+#define dprintk(x...)	{ if (debug) pr_info(DRIVER_NAME ": " x); }
+
+#define IRB_DEFAULT_CARRIER	38000
+#define IRB_DEFAULT_DUTY_CYCLE	50
+
+#define IRB_FIFO_LEN			128
+#define IRB_DEFAULT_MAX_FIFO_LEVEL	96
+
+#define IRB_ADDR0	0x0
+#define IRB_ADDR1	0x4
+#define IRB_ADDR2	0x8
+#define IRB_ADDR3	0xc
+
+#define IRB_MAX_DELAY	(1 << 10)
+#define IRB_DELAY_MASK	(IRB_MAX_DELAY - 1)
+
+/* IRCTRL_IR_BLASTER_ADDR0 */
+#define IRB_MOD_CLK(x)		((x) << 12)
+#define IRB_MOD_SYS_CLK		0
+#define IRB_MOD_XTAL3_CLK	1
+#define IRB_MOD_1US_CLK		2
+#define IRB_MOD_10US_CLK	3
+#define IRB_INIT_HIGH		BIT(2)
+#define IRB_ENABLE		BIT(0)
+
+/* IRCTRL_IR_BLASTER_ADDR2 */
+#define IRB_MOD_COUNT(lo, hi)	((((lo) - 1) << 16) | ((hi) - 1))
+
+/* IRCTRL_IR_BLASTER_ADDR2 */
+#define IRB_WRITE_FIFO	BIT(16)
+#define IRB_MOD_ENABLE	BIT(12)
+#define IRB_TB_1US	(0x0 << 10)
+#define IRB_TB_10US	(0x1 << 10)
+#define IRB_TB_100US	(0x2 << 10)
+#define IRB_TB_MOD_CLK	(0x3 << 10)
+
+/* IRCTRL_IR_BLASTER_ADDR3 */
+#define IRB_FIFO_THD_PENDING	BIT(16)
+#define IRB_FIFO_IRQ_ENABLE	BIT(8)
+
+static bool debug;
+module_param(debug, bool, 0644);
+MODULE_PARM_DESC(debug, "Enable debug messages");
+
+static unsigned int max_fifo_level = IRB_DEFAULT_MAX_FIFO_LEVEL;
+module_param(max_fifo_level, uint, 0444);
+MODULE_PARM_DESC(max_fifo_level, "Max blaster FIFO filling level");
+
+struct irblaster_dev {
+	unsigned int irq;
+	void __iomem *reg_base;
+	unsigned int *buf;
+	unsigned int buf_len;
+	unsigned int buf_head;
+	unsigned int carrier;
+	unsigned int duty_cycle;
+	spinlock_t lock;
+	struct completion completion;
+	unsigned int max_fifo_level;
+	unsigned int clk_nr;
+	unsigned long clk_rate;
+};
+
+static void irb_set_mod(struct irblaster_dev *irb)
+{
+	unsigned int cnt = irb->clk_rate / irb->carrier;
+	unsigned int pulse_cnt = cnt * irb->duty_cycle / 100;
+	unsigned int space_cnt = cnt - pulse_cnt;
+
+	dprintk("F_mod = %uHz, T_mod = %luns, duty_cycle = %u%%\n",
+		irb->carrier, NSEC_PER_SEC / irb->clk_rate * cnt,
+		100 * pulse_cnt / cnt);
+
+	writel(IRB_MOD_COUNT(pulse_cnt, space_cnt),
+	       irb->reg_base + IRB_ADDR1);
+}
+
+static void irb_setup(struct irblaster_dev *irb)
+{
+	unsigned int fifo_irq_threshold = IRB_FIFO_LEN - irb->max_fifo_level;
+
+	/*
+	 * Disable the blaster, set modulator clock tick and set initialize
+	 * output to be high. Set up carrier frequency and duty cycle. Then
+	 * unset initialize output. Enable FIFO interrupt, set FIFO interrupt
+	 * threshold. Finally, enable the blaster back.
+	 */
+	writel(~IRB_ENABLE & (IRB_MOD_CLK(irb->clk_nr) | IRB_INIT_HIGH),
+	       irb->reg_base + IRB_ADDR0);
+	irb_set_mod(irb);
+	writel(readl(irb->reg_base + IRB_ADDR0) & ~IRB_INIT_HIGH,
+	       irb->reg_base + IRB_ADDR0);
+	writel(IRB_FIFO_IRQ_ENABLE | fifo_irq_threshold,
+	       irb->reg_base + IRB_ADDR3);
+	writel(readl(irb->reg_base + IRB_ADDR0) | IRB_ENABLE,
+	       irb->reg_base + IRB_ADDR0);
+}
+
+static void irb_fifo_push_pulse(struct irblaster_dev *irb, unsigned int time)
+{
+	unsigned int delay;
+	unsigned int tb = IRB_TB_MOD_CLK;
+	unsigned int tb_us = USEC_PER_SEC / irb->carrier;
+
+	delay = (DIV_ROUND_CLOSEST_ULL(time, tb_us) - 1) & IRB_DELAY_MASK;
+	writel((IRB_WRITE_FIFO | IRB_MOD_ENABLE) | tb | delay,
+	       irb->reg_base + IRB_ADDR2);
+}
+
+static void irb_fifo_push_space(struct irblaster_dev *irb, unsigned int time)
+{
+	unsigned int delay;
+	unsigned int tb = IRB_TB_100US;
+	unsigned int tb_us = 100;
+
+	if (time <= IRB_MAX_DELAY) {
+		tb = IRB_TB_1US;
+		tb_us = 1;
+	} else if (time <= 10 * IRB_MAX_DELAY) {
+		tb = IRB_TB_10US;
+		tb_us = 10;
+	} else if (time <= 100 * IRB_MAX_DELAY) {
+		tb = IRB_TB_100US;
+		tb_us = 100;
+	}
+
+	delay = (DIV_ROUND_CLOSEST_ULL(time, tb_us) - 1) & IRB_DELAY_MASK;
+	writel((IRB_WRITE_FIFO & ~IRB_MOD_ENABLE) | tb | delay,
+	       irb->reg_base + IRB_ADDR2);
+}
+
+static void irb_send_buffer(struct irblaster_dev *irb)
+{
+	unsigned long flags;
+	unsigned int nr = 0;
+
+	spin_lock_irqsave(&irb->lock, flags);
+	while (irb->buf_head < irb->buf_len && nr < irb->max_fifo_level) {
+		if (irb->buf_head % 2 == 0)
+			irb_fifo_push_pulse(irb, irb->buf[irb->buf_head]);
+		else
+			irb_fifo_push_space(irb, irb->buf[irb->buf_head]);
+
+		irb->buf_head++;
+		nr++;
+	}
+	spin_unlock_irqrestore(&irb->lock, flags);
+}
+
+static bool irb_check_buf(struct irblaster_dev *irb,
+			  unsigned int *buf, unsigned int len)
+{
+	unsigned int i;
+
+	for (i = 0; i < len; i++) {
+		unsigned int max_tb_us;
+		/*
+		 * Max space timebase is 100 us.
+		 * Pulse timebase equals to carrier period.
+		 */
+		if (i % 2 == 0)
+			max_tb_us = USEC_PER_SEC / irb->carrier;
+		else
+			max_tb_us = 100;
+
+		if (buf[i] >= max_tb_us * IRB_MAX_DELAY)
+			return false;
+	}
+
+	return true;
+}
+
+static void irb_send(struct irblaster_dev *irb,
+		     unsigned int *buf, unsigned int len)
+{
+	reinit_completion(&irb->completion);
+
+	irb->buf = buf;
+	irb->buf_len = len;
+	irb->buf_head = 0;
+
+	dprintk("tx started, buffer length = %u\n", len);
+	irb_send_buffer(irb);
+	wait_for_completion_interruptible(&irb->completion);
+	dprintk("tx completed\n");
+}
+
+static irqreturn_t irb_irqhandler(int irq, void *data)
+{
+	struct irblaster_dev *irb = data;
+
+	writel(readl(irb->reg_base + IRB_ADDR3) & ~IRB_FIFO_THD_PENDING,
+	       irb->reg_base + IRB_ADDR3);
+
+	if (irb->buf_head < irb->buf_len)
+		return IRQ_WAKE_THREAD;
+
+	complete(&irb->completion);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t irb_thread_irqhandler(int irq, void *data)
+{
+	struct irblaster_dev *irb = data;
+
+	irb_send_buffer(irb);
+
+	return IRQ_HANDLED;
+}
+
+static int irb_set_tx_carrier(struct rc_dev *rc, u32 carrier)
+{
+	struct irblaster_dev *irb = rc->priv;
+
+	irb->carrier = carrier;
+	irb_set_mod(irb);
+
+	return 0;
+}
+
+static int irb_set_tx_duty_cycle(struct rc_dev *rc, u32 duty_cycle)
+{
+	struct irblaster_dev *irb = rc->priv;
+
+	irb->duty_cycle = duty_cycle;
+	irb_set_mod(irb);
+
+	return 0;
+}
+
+static int irb_tx_ir(struct rc_dev *rc, unsigned int *buf, unsigned int len)
+{
+	struct irblaster_dev *irb = rc->priv;
+
+	if (!irb_check_buf(irb, buf, len))
+		return -EINVAL;
+
+	irb_send(irb, buf, len);
+
+	return len;
+}
+
+static int irb_mod_clock_probe(struct irblaster_dev *irb, struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct clk *clock;
+	const char *clock_name;
+
+	if (!np)
+		return -ENODEV;
+
+	if (!of_property_read_string(np, "mod-clock", &clock_name)) {
+		if (!strcmp(clock_name, "sysclk"))
+			irb->clk_nr = IRB_MOD_SYS_CLK;
+		else if (!strcmp(clock_name, "xtal"))
+			irb->clk_nr = IRB_MOD_XTAL3_CLK;
+		else
+			return -EINVAL;
+
+		clock = devm_clk_get(dev, clock_name);
+		if (IS_ERR(clock) || clk_prepare_enable(clock))
+			return -ENODEV;
+	} else {
+		irb->clk_nr = IRB_MOD_1US_CLK;
+	}
+
+	switch (irb->clk_nr) {
+	case IRB_MOD_SYS_CLK:
+		irb->clk_rate = clk_get_rate(clock);
+		break;
+	case IRB_MOD_XTAL3_CLK:
+		irb->clk_rate = clk_get_rate(clock) / 3;
+		break;
+	case IRB_MOD_1US_CLK:
+		irb->clk_rate = 1000000;
+		break;
+	}
+
+	dprintk("F_clk = %luHz\n", irb->clk_rate);
+
+	return 0;
+}
+
+static int __init irblaster_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct irblaster_dev *irb;
+	struct rc_dev *rc;
+	struct resource *range;
+	int ret;
+
+	irb = devm_kzalloc(dev, sizeof(*irb), GFP_KERNEL);
+	if (!irb)
+		return -ENOMEM;
+
+	range = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!range) {
+		dev_err(dev, "no memory resource found\n");
+		return -ENODEV;
+	}
+
+	irb->reg_base = devm_ioremap_resource(dev, range);
+	if (IS_ERR(irb->reg_base)) {
+		dev_err(dev, "ioremap failed\n");
+		return PTR_ERR(irb->reg_base);
+	}
+
+	irb->irq = platform_get_irq(pdev, 0);
+	if (irb->irq < 0) {
+		dev_err(dev, "no irq resource found\n");
+		return -ENODEV;
+	}
+
+	if (max_fifo_level <= IRB_FIFO_LEN)
+		irb->max_fifo_level = max_fifo_level;
+	else {
+		irb->max_fifo_level = IRB_FIFO_LEN;
+		dev_warn(dev, "max FIFO level param truncated to %u",
+			 IRB_FIFO_LEN);
+	}
+
+	irb->carrier = IRB_DEFAULT_CARRIER;
+	irb->duty_cycle = IRB_DEFAULT_DUTY_CYCLE;
+	init_completion(&irb->completion);
+	spin_lock_init(&irb->lock);
+
+	ret = irb_mod_clock_probe(irb, dev);
+	if (ret) {
+		dev_err(dev, "modulator clock setup failed\n");
+		return ret;
+	}
+	irb_setup(irb);
+
+	ret = devm_request_threaded_irq(dev, irb->irq,
+					irb_irqhandler,
+					irb_thread_irqhandler,
+					IRQF_TRIGGER_RISING,
+					DRIVER_NAME, irb);
+	if (ret) {
+		dev_err(dev, "irq request failed\n");
+		return ret;
+	}
+
+	rc = rc_allocate_device(RC_DRIVER_IR_RAW_TX);
+	if (!rc)
+		return -ENOMEM;
+
+	rc->driver_name = DRIVER_NAME;
+	rc->priv = irb;
+
+	rc->tx_ir = irb_tx_ir;
+	rc->s_tx_carrier = irb_set_tx_carrier;
+	rc->s_tx_duty_cycle = irb_set_tx_duty_cycle;
+
+	ret = rc_register_device(rc);
+	if (ret < 0) {
+		dev_err(dev, "rc_dev registration failed\n");
+		rc_free_device(rc);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, rc);
+
+	return 0;
+}
+
+static int irblaster_remove(struct platform_device *pdev)
+{
+	struct rc_dev *rc = platform_get_drvdata(pdev);
+
+	rc_unregister_device(rc);
+
+	return 0;
+}
+
+static const struct of_device_id irblaster_dt_match[] = {
+	{
+		.compatible = "amlogic,meson-irblaster",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, irblaster_dt_match);
+
+static struct platform_driver irblaster_pd = {
+	.remove = irblaster_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+		.owner  = THIS_MODULE,
+		.of_match_table = irblaster_dt_match,
+	},
+};
+
+module_platform_driver_probe(irblaster_pd, irblaster_probe);
+
+MODULE_DESCRIPTION("Meson IR blaster driver");
+MODULE_AUTHOR("Viktor Prutyanov <viktor.prutyanov@phystech.edu>");
+MODULE_LICENSE("GPL");
-- 
2.21.0

