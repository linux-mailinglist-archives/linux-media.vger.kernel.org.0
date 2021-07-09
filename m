Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190E83C27DC
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 18:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhGIRA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 13:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhGIRA4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 13:00:56 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A13C0613E9
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 09:58:12 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s18so9042418ljg.7
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f8XoYoBjwLXEZIpdxhzgFJpA2gClzt4BdJyAm7WYaSM=;
        b=SJoCho35KxD7SkyvfP2FfnTyDlXDI0FYDl+WCSd8uigxvr6IxcnP7ZXevGBElK5bI6
         3A46nJ3T/23ndVdLERgBfLiRBuGxr01F2dNRnQoKnrmuRB8E4qyXcSfEBrlbzNzJVHK8
         XEmisP/6JbR4aURdMcqCqVtzeY0MQ7UUdayXquUv4o+pt7sTrvRKsCZbwdt7yw/hkGsw
         7L9ioJL2Prs/XhpERGL/r0VhUfBVZy7sa38WKw5Uh47iRG3v+gBYJ00vYaGk2qKL4lip
         5x5XHk57uCY9i7K9uMX/YT56be6p72VLLvzEPJHL1LYLJ2tpmH5iccerWemYmrmQSfJY
         /6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f8XoYoBjwLXEZIpdxhzgFJpA2gClzt4BdJyAm7WYaSM=;
        b=C4EhQj+wNcPSIM145mOCNZJ5wHDtT3spTTVe8i5tGOGJtQEh1gz4kK3MT0IqkJ8s3Q
         o3UdBI6xgMzxYP0HFFNo5lJU5cYIH0QBaJ2uHH/jfTUma9k2YcYyaOB2W7JJguUlzTF8
         oieJN2+1sgpz46I8YgDQ8uiP5KcYdZXr5SD/3r6pCZRI/0bXmHTFq7+JLhcyJ0lCEeov
         ilhK2l6YrwiRSw35g9CONFOX3W6r8avj7NA937TFvfrObZW8Fp5333LXF9kA01dKqCuA
         ELxbSRsgPcpQRTxGrGBNHKeaDMmtJ6tYq0K3dKWptbHEoeQ2woDQatXMUnMh/FYsm+wh
         vVMg==
X-Gm-Message-State: AOAM531nuQ1h+IUL6JekCnuw/JpAiNKJ61qaCiCUM+4ptjHYmkfQVsFZ
        gtx2dvwlAJwh6tGcNKNzGSP5cg==
X-Google-Smtp-Source: ABdhPJzDsI08eD9npiBG+/I46w4Y/qlsikFCPd/yiEigGL75qDnSVBLY58LpI1r1ZTLpp2t724/awA==
X-Received: by 2002:a2e:8244:: with SMTP id j4mr20186687ljh.364.1625849890155;
        Fri, 09 Jul 2021 09:58:10 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
        by smtp.gmail.com with ESMTPSA id i130sm504107lfd.304.2021.07.09.09.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 09:58:09 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v3 2/2] media: rc: introduce Meson IR blaster driver
Date:   Fri,  9 Jul 2021 19:57:53 +0300
Message-Id: <20210709165753.29353-3-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210709165753.29353-1-viktor.prutyanov@phystech.edu>
References: <20210709165753.29353-1-viktor.prutyanov@phystech.edu>
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
 changes in v2:
   - threaded IRQ removed, all stuff done in IRQ handler
   - DIV_ROUND_CLOSEST_ULL replaced with DIV_ROUND_CLOSEST
   - compatible changed to "amlogic,meson-g12a-irblaster"
   - 'debug' parameter removed
   - dprintk() replaced with dev_dbg()/dev_info()
   - carrier frequency checked against 0
   - device_name added
 changes in v3:
   - license header fixed
   - 'max_fifo_level' parameter removed
   - irq and clk_nr deleted from irblaster_dev struct
   - some divisions replaced with DIV_ROUND_CLOSEST
   - irb_send inlined
   - fixed early completion in IRQ handler
   - spin lock added before kfree

 drivers/media/rc/Kconfig           |  10 +
 drivers/media/rc/Makefile          |   1 +
 drivers/media/rc/meson-irblaster.c | 400 +++++++++++++++++++++++++++++
 3 files changed, 411 insertions(+)
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
index 000000000000..758d9abf252e
--- /dev/null
+++ b/drivers/media/rc/meson-irblaster.c
@@ -0,0 +1,400 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/**
+ * meson-irblaster.c - Amlogic Meson IR blaster driver
+ *
+ * Copyright (c) 2021, SberDevices. All Rights Reserved.
+ *
+ * Author: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
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
+#include <linux/slab.h>
+#include <media/rc-core.h>
+
+#define DEVICE_NAME	"Meson IR blaster"
+#define DRIVER_NAME	"meson-irblaster"
+
+#define IRB_MOD_1US_CLK_RATE	1000000
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
+struct irblaster_dev {
+	struct device *dev;
+	void __iomem *reg_base;
+	u32 *buf;
+	unsigned int buf_len;
+	unsigned int buf_head;
+	unsigned int carrier;
+	unsigned int duty_cycle;
+	spinlock_t lock;
+	struct completion completion;
+	unsigned int max_fifo_level;
+	unsigned long clk_rate;
+};
+
+static void irb_set_mod(struct irblaster_dev *irb)
+{
+	unsigned int cnt = DIV_ROUND_CLOSEST(irb->clk_rate, irb->carrier);
+	unsigned int pulse_cnt = DIV_ROUND_CLOSEST(cnt * irb->duty_cycle, 100);
+	unsigned int space_cnt = cnt - pulse_cnt;
+
+	dev_dbg(irb->dev, "F_mod = %uHz, T_mod = %luns, duty_cycle = %u%%\n",
+		irb->carrier, NSEC_PER_SEC / irb->clk_rate * cnt,
+		100 * pulse_cnt / cnt);
+
+	writel(IRB_MOD_COUNT(pulse_cnt, space_cnt),
+	       irb->reg_base + IRB_ADDR1);
+}
+
+static void irb_setup(struct irblaster_dev *irb, unsigned int clk_nr)
+{
+	unsigned int fifo_irq_threshold = IRB_FIFO_LEN - irb->max_fifo_level;
+
+	/*
+	 * Disable the blaster, set modulator clock tick and set initialize
+	 * output to be high. Set up carrier frequency and duty cycle. Then
+	 * unset initialize output. Enable FIFO interrupt, set FIFO interrupt
+	 * threshold. Finally, enable the blaster back.
+	 */
+	writel(~IRB_ENABLE & (IRB_MOD_CLK(clk_nr) | IRB_INIT_HIGH),
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
+static u32 irb_prepare_pulse(struct irblaster_dev *irb, unsigned int time)
+{
+	unsigned int delay;
+	unsigned int tb = IRB_TB_MOD_CLK;
+	unsigned int tb_us = DIV_ROUND_CLOSEST(USEC_PER_SEC, irb->carrier);
+
+	delay = (DIV_ROUND_CLOSEST(time, tb_us) - 1) & IRB_DELAY_MASK;
+
+	return ((IRB_WRITE_FIFO | IRB_MOD_ENABLE) | tb | delay);
+}
+
+static u32 irb_prepare_space(struct irblaster_dev *irb, unsigned int time)
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
+	delay = (DIV_ROUND_CLOSEST(time, tb_us) - 1) & IRB_DELAY_MASK;
+
+	return ((IRB_WRITE_FIFO & ~IRB_MOD_ENABLE) | tb | delay);
+}
+
+static void irb_send_buffer(struct irblaster_dev *irb)
+{
+	unsigned int nr = 0;
+
+	while (irb->buf_head < irb->buf_len && nr < irb->max_fifo_level) {
+		writel(irb->buf[irb->buf_head], irb->reg_base + IRB_ADDR2);
+
+		irb->buf_head++;
+		nr++;
+	}
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
+static void irb_fill_buf(struct irblaster_dev *irb, unsigned int *buf)
+{
+	unsigned int i;
+
+	for (i = 0; i < irb->buf_len; i++) {
+		if (i % 2 == 0)
+			irb->buf[i] = irb_prepare_pulse(irb, buf[i]);
+		else
+			irb->buf[i] = irb_prepare_space(irb, buf[i]);
+	}
+}
+
+static irqreturn_t irb_irqhandler(int irq, void *data)
+{
+	unsigned long flags;
+	struct irblaster_dev *irb = data;
+
+	writel(readl(irb->reg_base + IRB_ADDR3) & ~IRB_FIFO_THD_PENDING,
+	       irb->reg_base + IRB_ADDR3);
+
+	spin_lock_irqsave(&irb->lock, flags);
+	if (irb->buf_head < irb->buf_len)
+		irb_send_buffer(irb);
+	else
+		complete(&irb->completion);
+	spin_unlock_irqrestore(&irb->lock, flags);
+
+	return IRQ_HANDLED;
+}
+
+static int irb_set_tx_carrier(struct rc_dev *rc, u32 carrier)
+{
+	struct irblaster_dev *irb = rc->priv;
+
+	if (carrier == 0)
+		return -EINVAL;
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
+	unsigned long flags;
+	struct irblaster_dev *irb = rc->priv;
+
+	if (!irb_check_buf(irb, buf, len))
+		return -EINVAL;
+
+	irb->buf = kmalloc_array(len, sizeof(u32), GFP_KERNEL);
+	if (!irb->buf)
+		return -ENOMEM;
+
+	irb->buf_len = len;
+	irb->buf_head = 0;
+	irb_fill_buf(irb, buf);
+
+	reinit_completion(&irb->completion);
+
+	dev_dbg(irb->dev, "tx started, buffer length = %u\n", irb->buf_len);
+	spin_lock_irqsave(&irb->lock, flags);
+	irb_send_buffer(irb);
+	spin_unlock_irqrestore(&irb->lock, flags);
+	wait_for_completion_interruptible(&irb->completion);
+	dev_dbg(irb->dev, "tx completed\n");
+
+	spin_lock_irqsave(&irb->lock, flags);
+	kfree(irb->buf);
+	irb->buf = NULL;
+	irb->buf_len = 0;
+	spin_unlock_irqrestore(&irb->lock, flags);
+
+	return len;
+}
+
+static int irb_mod_clock_probe(struct irblaster_dev *irb, unsigned int *clk_nr)
+{
+	struct device_node *np = irb->dev->of_node;
+	struct clk *clock;
+
+	if (!np)
+		return -ENODEV;
+
+	clock = devm_clk_get(irb->dev, "xtal");
+	if (IS_ERR(clock) || clk_prepare_enable(clock))
+		return -ENODEV;
+
+	*clk_nr = IRB_MOD_XTAL3_CLK;
+	irb->clk_rate = clk_get_rate(clock) / 3;
+
+	if (irb->clk_rate < IRB_MOD_1US_CLK_RATE) {
+		*clk_nr = IRB_MOD_1US_CLK;
+		irb->clk_rate = IRB_MOD_1US_CLK_RATE;
+	}
+
+	dev_info(irb->dev, "F_clk = %luHz\n", irb->clk_rate);
+
+	return 0;
+}
+
+static int __init irblaster_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct irblaster_dev *irb;
+	struct rc_dev *rc;
+	int irq;
+	unsigned int clk_nr;
+	int ret;
+
+	irb = devm_kzalloc(dev, sizeof(*irb), GFP_KERNEL);
+	if (!irb)
+		return -ENOMEM;
+
+	irb->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(irb->reg_base))
+		return PTR_ERR(irb->reg_base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "no irq resource found\n");
+		return -ENODEV;
+	}
+
+	if (of_property_read_u32(dev->of_node, "max-fifo-level",
+				   &irb->max_fifo_level))
+		irb->max_fifo_level = IRB_DEFAULT_MAX_FIFO_LEVEL;
+	else if (irb->max_fifo_level > IRB_FIFO_LEN)
+		irb->max_fifo_level = IRB_DEFAULT_MAX_FIFO_LEVEL;
+	dev_dbg(dev, "max FIFO level set to %u\n", irb->max_fifo_level);
+
+	irb->dev = dev;
+	irb->carrier = IRB_DEFAULT_CARRIER;
+	irb->duty_cycle = IRB_DEFAULT_DUTY_CYCLE;
+	init_completion(&irb->completion);
+	spin_lock_init(&irb->lock);
+
+	ret = irb_mod_clock_probe(irb, &clk_nr);
+	if (ret) {
+		dev_err(dev, "modulator clock setup failed\n");
+		return ret;
+	}
+	irb_setup(irb, clk_nr);
+
+	ret = devm_request_irq(dev, irq,
+			       irb_irqhandler,
+			       IRQF_TRIGGER_RISING,
+			       DRIVER_NAME, irb);
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
+	rc->device_name = DEVICE_NAME;
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
+		.compatible = "amlogic,meson-g12a-irblaster",
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

