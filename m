Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13BB33BE9C5
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 16:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbhGGOca (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 10:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbhGGOc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 10:32:29 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8317DC06175F
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 07:29:48 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i94so3315813wri.4
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 07:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5MaGHyLdCuCJ58u90aRn1xT/7Ryk+2td7Hv75ZRYf/w=;
        b=lK0/SE+1NWbKUGA07LPRRqwYlPJIEKHyYaaY5ne8aKUJ14+7CsS0/xyk7NtbRAzBoo
         ZkoFLdbfgIUJA/PO2AQ7iiRHiTJkgDbRK0fjc0Rdzn+KV31R/FEmXGx+YZrpbWfHwGHU
         /k7ikNwjauKMGOR1MRRFuWReg/a7vXH61X0ZEi7VLHe51EOyTzTl678/4C2A/QPW7GxE
         8zbi3Iyxj5szQOp9By6DG1By5D3SEyzm1oGmaNitlRUYbXL3vMxbJtLG9VrvDIuF297e
         oB94GnXNqJDvxlCl1mrZwUrqaiuIPMKEdX1D+3mblHwpmGArO1T3o1vWSJhxaQTskMIE
         ybZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5MaGHyLdCuCJ58u90aRn1xT/7Ryk+2td7Hv75ZRYf/w=;
        b=TJWkpr+DPraTehEXRqZoGS9cBO5eJICtaduD/7kH/0TlkSfMppu+snNjnTxbDoXPkM
         niTUmYelUHJ5fE+dFcDkbo91dgL5EQeudWZJ0ZFEkmagpyxPzX7uPbcdaidcJhcJEebH
         ywX28SKgMwvNaM3rNkIUY5LoNDoLY5NxZc1AhZTqx18DoCNBydPqT0hyrdOKxj8EIkH/
         LjwvPE8CxSzhKa73iI4NEQnjN00iwBIFxx5adjlPDoUISzUupZXPzkNZ2lT5/V4dR0/P
         e+fNuR7XqRw6AM8Jv/I54UxMyhp82yvoo4m6yG4U++4BGZGPacvSFuJaVy1b/QYdeafi
         ywZQ==
X-Gm-Message-State: AOAM532qhamvqFuZWcnQxDLMOtEcc6/iTVfh5zGSkgecgBMy+mE/FEly
        Hhxg0zU/5iO2Xsx/6FaaBf27ow==
X-Google-Smtp-Source: ABdhPJwRLpJRrd8jLJa7EbnttxDYq/Xba+Q25eUuAPFFC2Vq4Sxh3UjNL2AvOHz26xxjXi1vpur64w==
X-Received: by 2002:adf:e607:: with SMTP id p7mr28129767wrm.80.1625668186953;
        Wed, 07 Jul 2021 07:29:46 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:59ba:fed7:14a3:f22f? ([2001:861:44c0:66c0:59ba:fed7:14a3:f22f])
        by smtp.gmail.com with ESMTPSA id o8sm18763961wrx.28.2021.07.07.07.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 07:29:46 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] media: rc: introduce Meson IR blaster driver
To:     Viktor Prutyanov <viktor.prutyanov@phystech.edu>, sean@mess.org,
        mchehab@kernel.org, robh+dt@kernel.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
References: <20210707141323.20757-1-viktor.prutyanov@phystech.edu>
 <20210707141323.20757-3-viktor.prutyanov@phystech.edu>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <d5221f0f-5934-7773-6ef4-3a491c478aa9@baylibre.com>
Date:   Wed, 7 Jul 2021 16:29:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707141323.20757-3-viktor.prutyanov@phystech.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 07/07/2021 16:13, Viktor Prutyanov wrote:
> This patch adds the driver for Amlogic Meson IR blaster.
> 
> Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
> (blaster) controller onboard. It is capable of sending IR
> signals with arbitrary carrier frequency and duty cycle.
> 
> The driver supports 3 modulation clock sources:
>  - sysclk
>  - xtal3 clock (xtal divided by 3)
>  - 1us clock
> 
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  changes in v2:
>    - threaded IRQ removed, all stuff done in IRQ handler
>    - DIV_ROUND_CLOSEST_ULL replaced with DIV_ROUND_CLOSEST
>    - compatible changed to "amlogic,meson-g12a-irblaster"
>    - 'debug' parameter removed
>    - dprintk() replaced with dev_dbg()/dev_info()
>    - carrier frequency checked against 0
>    - device_name added
> 
>  drivers/media/rc/Kconfig           |  10 +
>  drivers/media/rc/Makefile          |   1 +
>  drivers/media/rc/meson-irblaster.c | 439 +++++++++++++++++++++++++++++
>  3 files changed, 450 insertions(+)
>  create mode 100644 drivers/media/rc/meson-irblaster.c
> 
> diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
> index d0a8326b75c2..6e60348e1bcf 100644
> --- a/drivers/media/rc/Kconfig
> +++ b/drivers/media/rc/Kconfig
> @@ -246,6 +246,16 @@ config IR_MESON
>  	   To compile this driver as a module, choose M here: the
>  	   module will be called meson-ir.
>  
> +config IR_MESON_IRBLASTER
> +	tristate "Amlogic Meson IR blaster"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	help
> +	   Say Y if you want to use the IR blaster available on
> +	   Amlogic Meson SoCs.
> +
> +	   To compile this driver as a module, choose M here: the
> +	   module will be called meson-irblaster.
> +
>  config IR_MTK
>  	tristate "Mediatek IR remote receiver"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
> index 692e9b6b203f..b108f2b0420c 100644
> --- a/drivers/media/rc/Makefile
> +++ b/drivers/media/rc/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_IR_ITE_CIR) += ite-cir.o
>  obj-$(CONFIG_IR_MCEUSB) += mceusb.o
>  obj-$(CONFIG_IR_FINTEK) += fintek-cir.o
>  obj-$(CONFIG_IR_MESON) += meson-ir.o
> +obj-$(CONFIG_IR_MESON_IRBLASTER) += meson-irblaster.o
>  obj-$(CONFIG_IR_NUVOTON) += nuvoton-cir.o
>  obj-$(CONFIG_IR_ENE) += ene_ir.o
>  obj-$(CONFIG_IR_REDRAT3) += redrat3.o
> diff --git a/drivers/media/rc/meson-irblaster.c b/drivers/media/rc/meson-irblaster.c
> new file mode 100644
> index 000000000000..bfcdf47e2100
> --- /dev/null
> +++ b/drivers/media/rc/meson-irblaster.c
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/**
> + * meson-irblaster.c - Amlogic Meson IR blaster driver
> + *
> + * Copyright (c) 2021, SberDevices. All Rights Reserved.
> + *
> + * Author: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License and no later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
> + * NON INFRINGEMENT. See the GNU General Public License for more
> + * details.
> + *
> + * The full GNU General Public License is included in this distribution in
> + * the file called "COPYING".

Please remove this licence text, only SPDX-License-Identifier is necessary now

> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/sched.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/interrupt.h>
> +#include <linux/spinlock.h>
> +#include <linux/of_irq.h>
> +#include <linux/clk.h>
> +#include <linux/slab.h>
> +#include <media/rc-core.h>
> +
> +#define DEVICE_NAME	"Meson IR blaster"
> +#define DRIVER_NAME	"meson-irblaster"
> +
> +#define IRB_DEFAULT_CARRIER	38000
> +#define IRB_DEFAULT_DUTY_CYCLE	50
> +
> +#define IRB_FIFO_LEN			128
> +#define IRB_DEFAULT_MAX_FIFO_LEVEL	96
> +
> +#define IRB_ADDR0	0x0
> +#define IRB_ADDR1	0x4
> +#define IRB_ADDR2	0x8
> +#define IRB_ADDR3	0xc
> +
> +#define IRB_MAX_DELAY	(1 << 10)
> +#define IRB_DELAY_MASK	(IRB_MAX_DELAY - 1)
> +
> +/* IRCTRL_IR_BLASTER_ADDR0 */
> +#define IRB_MOD_CLK(x)		((x) << 12)
> +#define IRB_MOD_SYS_CLK		0
> +#define IRB_MOD_XTAL3_CLK	1
> +#define IRB_MOD_1US_CLK		2
> +#define IRB_MOD_10US_CLK	3
> +#define IRB_INIT_HIGH		BIT(2)
> +#define IRB_ENABLE		BIT(0)
> +
> +/* IRCTRL_IR_BLASTER_ADDR2 */
> +#define IRB_MOD_COUNT(lo, hi)	((((lo) - 1) << 16) | ((hi) - 1))
> +
> +/* IRCTRL_IR_BLASTER_ADDR2 */
> +#define IRB_WRITE_FIFO	BIT(16)
> +#define IRB_MOD_ENABLE	BIT(12)
> +#define IRB_TB_1US	(0x0 << 10)
> +#define IRB_TB_10US	(0x1 << 10)
> +#define IRB_TB_100US	(0x2 << 10)
> +#define IRB_TB_MOD_CLK	(0x3 << 10)
> +
> +/* IRCTRL_IR_BLASTER_ADDR3 */
> +#define IRB_FIFO_THD_PENDING	BIT(16)
> +#define IRB_FIFO_IRQ_ENABLE	BIT(8)
> +
> +static unsigned int max_fifo_level = IRB_DEFAULT_MAX_FIFO_LEVEL;
> +module_param(max_fifo_level, uint, 0444);
> +MODULE_PARM_DESC(max_fifo_level, "Max blaster FIFO filling level");

Maybe this could be a debugfs file instead ?

> +
> +struct irblaster_dev {
> +	struct device *dev;
> +	unsigned int irq;
> +	void __iomem *reg_base;
> +	u32 *buf;
> +	unsigned int buf_len;
> +	unsigned int buf_head;
> +	unsigned int carrier;
> +	unsigned int duty_cycle;
> +	spinlock_t lock;
> +	struct completion completion;
> +	unsigned int max_fifo_level;
> +	unsigned int clk_nr;
> +	unsigned long clk_rate;
> +};
> +
> +static void irb_set_mod(struct irblaster_dev *irb)
> +{
> +	unsigned int cnt = irb->clk_rate / irb->carrier;
> +	unsigned int pulse_cnt = cnt * irb->duty_cycle / 100;
> +	unsigned int space_cnt = cnt - pulse_cnt;
> +
> +	dev_dbg(irb->dev, "F_mod = %uHz, T_mod = %luns, duty_cycle = %u%%\n",
> +		irb->carrier, NSEC_PER_SEC / irb->clk_rate * cnt,
> +		100 * pulse_cnt / cnt);
> +
> +	writel(IRB_MOD_COUNT(pulse_cnt, space_cnt),
> +	       irb->reg_base + IRB_ADDR1);
> +}
> +
> +static void irb_setup(struct irblaster_dev *irb)
> +{
> +	unsigned int fifo_irq_threshold = IRB_FIFO_LEN - irb->max_fifo_level;
> +
> +	/*
> +	 * Disable the blaster, set modulator clock tick and set initialize
> +	 * output to be high. Set up carrier frequency and duty cycle. Then
> +	 * unset initialize output. Enable FIFO interrupt, set FIFO interrupt
> +	 * threshold. Finally, enable the blaster back.
> +	 */
> +	writel(~IRB_ENABLE & (IRB_MOD_CLK(irb->clk_nr) | IRB_INIT_HIGH),
> +	       irb->reg_base + IRB_ADDR0);
> +	irb_set_mod(irb);
> +	writel(readl(irb->reg_base + IRB_ADDR0) & ~IRB_INIT_HIGH,
> +	       irb->reg_base + IRB_ADDR0);
> +	writel(IRB_FIFO_IRQ_ENABLE | fifo_irq_threshold,
> +	       irb->reg_base + IRB_ADDR3);
> +	writel(readl(irb->reg_base + IRB_ADDR0) | IRB_ENABLE,
> +	       irb->reg_base + IRB_ADDR0);
> +}
> +
> +static u32 irb_prepare_pulse(struct irblaster_dev *irb, unsigned int time)
> +{
> +	unsigned int delay;
> +	unsigned int tb = IRB_TB_MOD_CLK;
> +	unsigned int tb_us = USEC_PER_SEC / irb->carrier;
> +
> +	delay = (DIV_ROUND_CLOSEST(time, tb_us) - 1) & IRB_DELAY_MASK;
> +
> +	return ((IRB_WRITE_FIFO | IRB_MOD_ENABLE) | tb | delay);
> +}
> +
> +static u32 irb_prepare_space(struct irblaster_dev *irb, unsigned int time)
> +{
> +	unsigned int delay;
> +	unsigned int tb = IRB_TB_100US;
> +	unsigned int tb_us = 100;
> +
> +	if (time <= IRB_MAX_DELAY) {
> +		tb = IRB_TB_1US;
> +		tb_us = 1;
> +	} else if (time <= 10 * IRB_MAX_DELAY) {
> +		tb = IRB_TB_10US;
> +		tb_us = 10;
> +	} else if (time <= 100 * IRB_MAX_DELAY) {
> +		tb = IRB_TB_100US;
> +		tb_us = 100;
> +	}
> +
> +	delay = (DIV_ROUND_CLOSEST(time, tb_us) - 1) & IRB_DELAY_MASK;
> +
> +	return ((IRB_WRITE_FIFO & ~IRB_MOD_ENABLE) | tb | delay);
> +}
> +
> +static void irb_send_buffer(struct irblaster_dev *irb)
> +{
> +	unsigned long flags;
> +	unsigned int nr = 0;
> +
> +	spin_lock_irqsave(&irb->lock, flags);
> +	while (irb->buf_head < irb->buf_len && nr < irb->max_fifo_level) {
> +		writel(irb->buf[irb->buf_head], irb->reg_base + IRB_ADDR2);
> +
> +		irb->buf_head++;
> +		nr++;
> +	}
> +	spin_unlock_irqrestore(&irb->lock, flags);
> +}
> +
> +static bool irb_check_buf(struct irblaster_dev *irb,
> +			  unsigned int *buf, unsigned int len)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < len; i++) {
> +		unsigned int max_tb_us;
> +		/*
> +		 * Max space timebase is 100 us.
> +		 * Pulse timebase equals to carrier period.
> +		 */
> +		if (i % 2 == 0)
> +			max_tb_us = USEC_PER_SEC / irb->carrier;
> +		else
> +			max_tb_us = 100;
> +
> +		if (buf[i] >= max_tb_us * IRB_MAX_DELAY)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void irb_fill_buf(struct irblaster_dev *irb, unsigned int *buf)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < irb->buf_len; i++) {
> +		if (i % 2 == 0)
> +			irb->buf[i] = irb_prepare_pulse(irb, buf[i]);
> +		else
> +			irb->buf[i] = irb_prepare_space(irb, buf[i]);
> +	}
> +}
> +
> +static void irb_send(struct irblaster_dev *irb)
> +{
> +	reinit_completion(&irb->completion);
> +
> +	dev_dbg(irb->dev, "tx started, buffer length = %u\n", len);
> +	irb_send_buffer(irb);
> +	wait_for_completion_interruptible(&irb->completion);
> +	dev_dbg(irb->dev, "tx completed\n");
> +}
> +
> +static irqreturn_t irb_irqhandler(int irq, void *data)
> +{
> +	struct irblaster_dev *irb = data;
> +
> +	writel(readl(irb->reg_base + IRB_ADDR3) & ~IRB_FIFO_THD_PENDING,
> +	       irb->reg_base + IRB_ADDR3);
> +
> +	if (irb->buf_head < irb->buf_len)
> +		irb_send_buffer(irb);
> +
> +	complete(&irb->completion);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int irb_set_tx_carrier(struct rc_dev *rc, u32 carrier)
> +{
> +	struct irblaster_dev *irb = rc->priv;
> +
> +	if (carrier == 0)
> +		return -EINVAL;
> +
> +	irb->carrier = carrier;
> +	irb_set_mod(irb);
> +
> +	return 0;
> +}
> +
> +static int irb_set_tx_duty_cycle(struct rc_dev *rc, u32 duty_cycle)
> +{
> +	struct irblaster_dev *irb = rc->priv;
> +
> +	irb->duty_cycle = duty_cycle;
> +	irb_set_mod(irb);
> +
> +	return 0;
> +}
> +
> +static int irb_tx_ir(struct rc_dev *rc, unsigned int *buf, unsigned int len)
> +{
> +	struct irblaster_dev *irb = rc->priv;
> +
> +	if (!irb_check_buf(irb, buf, len))
> +		return -EINVAL;
> +
> +	irb->buf = kmalloc_array(len, sizeof(u32), GFP_KERNEL);
> +	if (!irb->buf)
> +		return -ENOMEM;
> +
> +	irb->buf_len = len;
> +	irb->buf_head = 0;
> +	irb_fill_buf(irb, buf);
> +
> +	irb_send(irb);
> +
> +	kfree(irb->buf);
> +
> +	return len;
> +}
> +
> +static int irb_mod_clock_probe(struct irblaster_dev *irb)
> +{
> +	struct device_node *np = irb->dev->of_node;
> +	struct clk *clock;
> +	const char *clock_name;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	if (!of_property_read_string(np, "mod-clock", &clock_name)) {
> +		if (!strcmp(clock_name, "sysclk"))
> +			irb->clk_nr = IRB_MOD_SYS_CLK;
> +		else if (!strcmp(clock_name, "xtal"))
> +			irb->clk_nr = IRB_MOD_XTAL3_CLK;
> +		else
> +			return -EINVAL;
> +
> +		clock = devm_clk_get(irb->dev, clock_name);
> +		if (IS_ERR(clock) || clk_prepare_enable(clock))
> +			return -ENODEV;
> +	} else {
> +		irb->clk_nr = IRB_MOD_1US_CLK;
> +	}
> +
> +	switch (irb->clk_nr) {
> +	case IRB_MOD_SYS_CLK:
> +		irb->clk_rate = clk_get_rate(clock);
> +		break;
> +	case IRB_MOD_XTAL3_CLK:
> +		irb->clk_rate = clk_get_rate(clock) / 3;
> +		break;
> +	case IRB_MOD_1US_CLK:
> +		irb->clk_rate = 1000000;
> +		break;
> +	}
> +
> +	dev_info(irb->dev, "F_clk = %luHz\n", irb->clk_rate);
> +
> +	return 0;
> +}
> +
> +static int __init irblaster_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct irblaster_dev *irb;
> +	struct rc_dev *rc;
> +	struct resource *range;
> +	int ret;
> +
> +	irb = devm_kzalloc(dev, sizeof(*irb), GFP_KERNEL);
> +	if (!irb)
> +		return -ENOMEM;
> +
> +	range = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!range) {
> +		dev_err(dev, "no memory resource found\n");
> +		return -ENODEV;
> +	}
> +
> +	irb->reg_base = devm_ioremap_resource(dev, range);
> +	if (IS_ERR(irb->reg_base)) {
> +		dev_err(dev, "ioremap failed\n");
> +		return PTR_ERR(irb->reg_base);
> +	}

Please use devm_platform_ioremap_resource() instead of these 2

> +
> +	irb->irq = platform_get_irq(pdev, 0);
> +	if (irb->irq < 0) {
> +		dev_err(dev, "no irq resource found\n");
> +		return -ENODEV;
> +	}
> +
> +	if (max_fifo_level <= IRB_FIFO_LEN)
> +		irb->max_fifo_level = max_fifo_level;
> +	else {
> +		irb->max_fifo_level = IRB_FIFO_LEN;
> +		dev_warn(dev, "max FIFO level param truncated to %u",
> +			 IRB_FIFO_LEN);
> +	}
> +
> +	irb->dev = dev;
> +	irb->carrier = IRB_DEFAULT_CARRIER;
> +	irb->duty_cycle = IRB_DEFAULT_DUTY_CYCLE;
> +	init_completion(&irb->completion);
> +	spin_lock_init(&irb->lock);
> +
> +	ret = irb_mod_clock_probe(irb);
> +	if (ret) {
> +		dev_err(dev, "modulator clock setup failed\n");
> +		return ret;
> +	}
> +	irb_setup(irb);
> +
> +	ret = devm_request_irq(dev, irb->irq,
> +			       irb_irqhandler,
> +			       IRQF_TRIGGER_RISING,
> +			       DRIVER_NAME, irb);
> +	if (ret) {
> +		dev_err(dev, "irq request failed\n");
> +		return ret;
> +	}
> +
> +	rc = rc_allocate_device(RC_DRIVER_IR_RAW_TX);
> +	if (!rc)
> +		return -ENOMEM;
> +
> +	rc->driver_name = DRIVER_NAME;
> +	rc->device_name = DEVICE_NAME;
> +	rc->priv = irb;
> +
> +	rc->tx_ir = irb_tx_ir;
> +	rc->s_tx_carrier = irb_set_tx_carrier;
> +	rc->s_tx_duty_cycle = irb_set_tx_duty_cycle;
> +
> +	ret = rc_register_device(rc);
> +	if (ret < 0) {
> +		dev_err(dev, "rc_dev registration failed\n");
> +		rc_free_device(rc);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, rc);
> +
> +	return 0;
> +}
> +
> +static int irblaster_remove(struct platform_device *pdev)
> +{
> +	struct rc_dev *rc = platform_get_drvdata(pdev);
> +
> +	rc_unregister_device(rc);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id irblaster_dt_match[] = {
> +	{
> +		.compatible = "amlogic,meson-g12a-irblaster",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, irblaster_dt_match);
> +
> +static struct platform_driver irblaster_pd = {
> +	.remove = irblaster_remove,
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.owner  = THIS_MODULE,
> +		.of_match_table = irblaster_dt_match,
> +	},
> +};
> +
> +module_platform_driver_probe(irblaster_pd, irblaster_probe);
> +
> +MODULE_DESCRIPTION("Meson IR blaster driver");
> +MODULE_AUTHOR("Viktor Prutyanov <viktor.prutyanov@phystech.edu>");
> +MODULE_LICENSE("GPL");
> 

Neil
