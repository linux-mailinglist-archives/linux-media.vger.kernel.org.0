Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F94E327C0B
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 11:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234275AbhCAK0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 05:26:34 -0500
Received: from gofer.mess.org ([88.97.38.141]:60605 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234206AbhCAK0Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 05:26:16 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D13F7C6367; Mon,  1 Mar 2021 10:25:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1614594322; bh=tLUbkXhItkf6LKgtlXUZQKTwZ5ut1MvcIB8+Lw9y2w4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DoirwXVmFUz/+k809ssCy85h31Ce+rzpzuBmU1HD8y95epmfbjzPqYdn/JgwJrprE
         is0If8KvaBdS6QFIWM3sK4L0SsMXBiTDlyDU81gI9xAWhb2Drv+5JpbvJqGaASBxKc
         cHiAkqXpgnvudv3K/ce3JSDm4CDGogVrVvmVO+3aRDsZjaW/Pn8cY8kTZB9/mNfZ+A
         6QFlZxj6w5pzIbbBmlzGoc2PwvYM76plYmlJSrLh5wb3avZ/rdbshN1R9JMvYeMY27
         D9zruQmsGLnniwwGkYElbqFz65itHeLs4UQIWEbAvSICeI3p09Nkgtd7KBIozBa3x6
         D0MZWHiOZd6hQ==
Date:   Mon, 1 Mar 2021 10:25:22 +0000
From:   Sean Young <sean@mess.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/2] media: rc: remove zte zx ir driver
Message-ID: <20210301102522.GB25633@gofer.mess.org>
References: <20210120142542.4100741-1-arnd@kernel.org>
 <20210120142542.4100741-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120142542.4100741-3-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On Wed, Jan 20, 2021 at 03:25:42PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The zte zx platform is getting removed, so this driver is no
> longer needed.

I think the keymap should go too.

drivers/media/rc/keymaps/rc-zx-irdec.c

Any references to RC_MAP_ZX_IRDEC or rc-zx-irdec

Thanks

Sean

> 
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../devicetree/bindings/media/zx-irdec.txt    |  14 --
>  drivers/media/rc/Kconfig                      |  11 --
>  drivers/media/rc/Makefile                     |   1 -
>  drivers/media/rc/zx-irdec.c                   | 181 ------------------
>  4 files changed, 207 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/zx-irdec.txt
>  delete mode 100644 drivers/media/rc/zx-irdec.c
> 
> diff --git a/Documentation/devicetree/bindings/media/zx-irdec.txt b/Documentation/devicetree/bindings/media/zx-irdec.txt
> deleted file mode 100644
> index 295b9fab593e..000000000000
> --- a/Documentation/devicetree/bindings/media/zx-irdec.txt
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -IR Decoder (IRDEC) on ZTE ZX family SoCs
> -
> -Required properties:
> - - compatible: Should be "zte,zx296718-irdec".
> - - reg: Physical base address and length of IRDEC registers.
> - - interrupts: Interrupt number of IRDEC.
> -
> -Exmaples:
> -
> -	irdec: ir-decoder@111000 {
> -		compatible = "zte,zx296718-irdec";
> -		reg = <0x111000 0x1000>;
> -		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> -	};
> diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
> index 39bc75cc1848..afeef7d99a5a 100644
> --- a/drivers/media/rc/Kconfig
> +++ b/drivers/media/rc/Kconfig
> @@ -509,17 +509,6 @@ config RC_XBOX_DVD
>  	   To compile this driver as a module, choose M here: the module will be
>  	   called xbox_remote.
>  
> -config IR_ZX
> -	tristate "ZTE ZX IR remote control"
> -	depends on RC_CORE
> -	depends on ARCH_ZX || COMPILE_TEST
> -	help
> -	   Say Y if you want to use the IR remote control available
> -	   on ZTE ZX family SoCs.
> -
> -	   To compile this driver as a module, choose M here: the
> -	   module will be called zx-irdec.
> -
>  config IR_TOY
>  	tristate "Infrared Toy and IR Droid"
>  	depends on RC_CORE
> diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
> index f46a72071a7b..23eb7d43d2ff 100644
> --- a/drivers/media/rc/Makefile
> +++ b/drivers/media/rc/Makefile
> @@ -47,6 +47,5 @@ obj-$(CONFIG_IR_IMG) += img-ir/
>  obj-$(CONFIG_IR_SERIAL) += serial_ir.o
>  obj-$(CONFIG_IR_SIR) += sir_ir.o
>  obj-$(CONFIG_IR_MTK) += mtk-cir.o
> -obj-$(CONFIG_IR_ZX) += zx-irdec.o
>  obj-$(CONFIG_RC_XBOX_DVD) += xbox_remote.o
>  obj-$(CONFIG_IR_TOY) += ir_toy.o
> diff --git a/drivers/media/rc/zx-irdec.c b/drivers/media/rc/zx-irdec.c
> deleted file mode 100644
> index 948ad90ae5d8..000000000000
> --- a/drivers/media/rc/zx-irdec.c
> +++ /dev/null
> @@ -1,181 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (C) 2017 Sanechips Technology Co., Ltd.
> - * Copyright 2017 Linaro Ltd.
> - */
> -
> -#include <linux/device.h>
> -#include <linux/err.h>
> -#include <linux/interrupt.h>
> -#include <linux/io.h>
> -#include <linux/module.h>
> -#include <linux/of_platform.h>
> -#include <linux/platform_device.h>
> -
> -#include <media/rc-core.h>
> -
> -#define DRIVER_NAME		"zx-irdec"
> -
> -#define ZX_IR_ENABLE		0x04
> -#define ZX_IREN			BIT(0)
> -#define ZX_IR_CTRL		0x08
> -#define ZX_DEGL_MASK		GENMASK(21, 20)
> -#define ZX_DEGL_VALUE(x)	(((x) << 20) & ZX_DEGL_MASK)
> -#define ZX_WDBEGIN_MASK		GENMASK(18, 8)
> -#define ZX_WDBEGIN_VALUE(x)	(((x) << 8) & ZX_WDBEGIN_MASK)
> -#define ZX_IR_INTEN		0x10
> -#define ZX_IR_INTSTCLR		0x14
> -#define ZX_IR_CODE		0x30
> -#define ZX_IR_CNUM		0x34
> -#define ZX_NECRPT		BIT(16)
> -
> -struct zx_irdec {
> -	void __iomem *base;
> -	struct rc_dev *rcd;
> -};
> -
> -static void zx_irdec_set_mask(struct zx_irdec *irdec, unsigned int reg,
> -			      u32 mask, u32 value)
> -{
> -	u32 data;
> -
> -	data = readl(irdec->base + reg);
> -	data &= ~mask;
> -	data |= value & mask;
> -	writel(data, irdec->base + reg);
> -}
> -
> -static irqreturn_t zx_irdec_irq(int irq, void *dev_id)
> -{
> -	struct zx_irdec *irdec = dev_id;
> -	u8 address, not_address;
> -	u8 command, not_command;
> -	u32 rawcode, scancode;
> -	enum rc_proto rc_proto;
> -
> -	/* Clear interrupt */
> -	writel(1, irdec->base + ZX_IR_INTSTCLR);
> -
> -	/* Check repeat frame */
> -	if (readl(irdec->base + ZX_IR_CNUM) & ZX_NECRPT) {
> -		rc_repeat(irdec->rcd);
> -		goto done;
> -	}
> -
> -	rawcode = readl(irdec->base + ZX_IR_CODE);
> -	not_command = (rawcode >> 24) & 0xff;
> -	command = (rawcode >> 16) & 0xff;
> -	not_address = (rawcode >> 8) & 0xff;
> -	address = rawcode & 0xff;
> -
> -	scancode = ir_nec_bytes_to_scancode(address, not_address,
> -					    command, not_command,
> -					    &rc_proto);
> -	rc_keydown(irdec->rcd, rc_proto, scancode, 0);
> -
> -done:
> -	return IRQ_HANDLED;
> -}
> -
> -static int zx_irdec_probe(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct zx_irdec *irdec;
> -	struct resource *res;
> -	struct rc_dev *rcd;
> -	int irq;
> -	int ret;
> -
> -	irdec = devm_kzalloc(dev, sizeof(*irdec), GFP_KERNEL);
> -	if (!irdec)
> -		return -ENOMEM;
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	irdec->base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(irdec->base))
> -		return PTR_ERR(irdec->base);
> -
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -
> -	rcd = devm_rc_allocate_device(dev, RC_DRIVER_SCANCODE);
> -	if (!rcd) {
> -		dev_err(dev, "failed to allocate rc device\n");
> -		return -ENOMEM;
> -	}
> -
> -	irdec->rcd = rcd;
> -
> -	rcd->priv = irdec;
> -	rcd->input_phys = DRIVER_NAME "/input0";
> -	rcd->input_id.bustype = BUS_HOST;
> -	rcd->map_name = RC_MAP_ZX_IRDEC;
> -	rcd->allowed_protocols = RC_PROTO_BIT_NEC | RC_PROTO_BIT_NECX |
> -							RC_PROTO_BIT_NEC32;
> -	rcd->driver_name = DRIVER_NAME;
> -	rcd->device_name = DRIVER_NAME;
> -
> -	platform_set_drvdata(pdev, irdec);
> -
> -	ret = devm_rc_register_device(dev, rcd);
> -	if (ret) {
> -		dev_err(dev, "failed to register rc device\n");
> -		return ret;
> -	}
> -
> -	ret = devm_request_irq(dev, irq, zx_irdec_irq, 0, NULL, irdec);
> -	if (ret) {
> -		dev_err(dev, "failed to request irq\n");
> -		return ret;
> -	}
> -
> -	/*
> -	 * Initialize deglitch level and watchdog counter beginner as
> -	 * recommended by vendor BSP code.
> -	 */
> -	zx_irdec_set_mask(irdec, ZX_IR_CTRL, ZX_DEGL_MASK, ZX_DEGL_VALUE(0));
> -	zx_irdec_set_mask(irdec, ZX_IR_CTRL, ZX_WDBEGIN_MASK,
> -			  ZX_WDBEGIN_VALUE(0x21c));
> -
> -	/* Enable interrupt */
> -	writel(1, irdec->base + ZX_IR_INTEN);
> -
> -	/* Enable the decoder */
> -	zx_irdec_set_mask(irdec, ZX_IR_ENABLE, ZX_IREN, ZX_IREN);
> -
> -	return 0;
> -}
> -
> -static int zx_irdec_remove(struct platform_device *pdev)
> -{
> -	struct zx_irdec *irdec = platform_get_drvdata(pdev);
> -
> -	/* Disable the decoder */
> -	zx_irdec_set_mask(irdec, ZX_IR_ENABLE, ZX_IREN, 0);
> -
> -	/* Disable interrupt */
> -	writel(0, irdec->base + ZX_IR_INTEN);
> -
> -	return 0;
> -}
> -
> -static const struct of_device_id zx_irdec_match[] = {
> -	{ .compatible = "zte,zx296718-irdec" },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, zx_irdec_match);
> -
> -static struct platform_driver zx_irdec_driver = {
> -	.probe = zx_irdec_probe,
> -	.remove = zx_irdec_remove,
> -	.driver = {
> -		.name = DRIVER_NAME,
> -		.of_match_table	= zx_irdec_match,
> -	},
> -};
> -module_platform_driver(zx_irdec_driver);
> -
> -MODULE_DESCRIPTION("ZTE ZX IR remote control driver");
> -MODULE_AUTHOR("Shawn Guo <shawn.guo@linaro.org>");
> -MODULE_LICENSE("GPL v2");
> -- 
> 2.29.2
