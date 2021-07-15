Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8333CAF35
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 00:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbhGOWj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 18:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbhGOWj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 18:39:56 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AD1C06175F
        for <linux-media@vger.kernel.org>; Thu, 15 Jul 2021 15:36:59 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i5so12700775lfe.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jul 2021 15:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=/JYScUJQAlk5ROep05PB0kICCEjQqxVY7P9YWhBtyHA=;
        b=O1a+qBrNB5bTVWRXb2QYnT7oCfC/ggo3qr/ydKfqzg3a0z5XmnJk153q5M7lY/lhPl
         sZ5gHmZXlwBcggO1Fdwv/ZS5AbwqXcxDQijhuOqML8tngSue7pmax7zvJJnwxuYRAWit
         CSVuTgI3O8aCUVtzEWSuIOxRgcKXxfL5X6B0MYNWq4u7nDKSqKEg7xm3gQcwRpgchgfe
         oTL2PGfjUOv1nwmnXPkZ6V420kv9EEcBnaKQVWVAu0i5k/9+inhVxDmwd9wSLs9H4+wO
         595kBSHyRhjm0tistAwqVO2pWt789b60vK4XlSPXXCwimZxRKDUN/JlpUrdH933uyEmp
         sGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=/JYScUJQAlk5ROep05PB0kICCEjQqxVY7P9YWhBtyHA=;
        b=RMayx0mMguuf0BWLdjLhdLJfY7x5uOIwX+1Y+rMMxL2DEqq/rENxhIXshw8xHnRn2I
         W0t5hVS7zj9QnvIGtGsB900Y22hQA++HIjMJC/S/6dCtT86QtVcvMwUX4khGlKdmn0XL
         7FjYDW6dMsStE8P9qFbgURArTQQ1V/J+jldI2p/Vv4UpAo2XqSaDeoI9/oF0ch3oigOz
         sNNuLESEH91zQzZuZ/6+FYSHm023LkL6hnLO4VbNy1Jh9MrAG6BahuO2FK/AbBOo1glZ
         hkJ3ViY5mJL411IXNWy82BVh1vwEGUaCfmwdcvsKM5cWrd9ciQ1V2GOctCF3IL/ZoBap
         vQIw==
X-Gm-Message-State: AOAM531b6AVZJsO8Kun4CdBjlAzx31zsLCxyh1ih91uIX5eP4dqc4PUn
        Uul1GF1Vcdtku1Sm8VKtFCFucg==
X-Google-Smtp-Source: ABdhPJyZbA6xb18clB5nIgIMrzSf8MA2ZFvd0SOVIA11TmYQq9nn0UQN8ElBbtK/1xTqqrdDtMyVZg==
X-Received: by 2002:ac2:538c:: with SMTP id g12mr1578044lfh.245.1626388617113;
        Thu, 15 Jul 2021 15:36:57 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
        by smtp.gmail.com with ESMTPSA id x13sm504345lfr.66.2021.07.15.15.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 15:36:56 -0700 (PDT)
Date:   Fri, 16 Jul 2021 01:36:52 +0300
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     Sean Young <sean@mess.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, khilman@baylibre.com,
        narmstrong@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
Subject: Re: [PATCH v5 2/2] media: rc: introduce Meson IR TX driver
Message-ID: <20210716013652.248bce6f@192.168.1.3>
In-Reply-To: <20210715214001.GA25809@gofer.mess.org>
References: <20210714212706.24945-1-viktor.prutyanov@phystech.edu>
        <20210714212706.24945-3-viktor.prutyanov@phystech.edu>
        <20210715214001.GA25809@gofer.mess.org>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On Thu, 15 Jul 2021 22:40:01 +0100
Sean Young <sean@mess.org> wrote:

> On Thu, Jul 15, 2021 at 12:27:06AM +0300, Viktor Prutyanov wrote:
> > This patch adds the driver for Amlogic Meson IR transmitter.
> > 
> > Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
> > (also called blaster) controller onboard. It is capable of sending
> > IR signals with arbitrary carrier frequency and duty cycle.
> > 
> > The driver supports 2 modulation clock sources:
> >  - xtal3 clock (xtal divided by 3)
> >  - 1us clock
> > 
> > Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> > ---
> >  changes in v2:
> >    - threaded IRQ removed, all stuff done in IRQ handler
> >    - DIV_ROUND_CLOSEST_ULL replaced with DIV_ROUND_CLOSEST
> >    - compatible changed to "amlogic,meson-g12a-irblaster"
> >    - 'debug' parameter removed
> >    - dprintk() replaced with dev_dbg()/dev_info()
> >    - carrier frequency checked against 0
> >    - device_name added
> >  changes in v3:
> >    - license header fixed
> >    - 'max_fifo_level' parameter removed
> >    - irq and clk_nr deleted from irblaster_dev struct
> >    - some divisions replaced with DIV_ROUND_CLOSEST
> >    - irb_send inlined
> >    - fixed early completion in IRQ handler
> >    - spin lock added before kfree
> >  changes in v4:
> >    - irblaster -> ir-tx renaming
> >    - spin lock added before buffer allocation
> >  changes in v5:
> >    - spinlocks rework made in meson_irtx_transmit
> >    - max_fifo_level replaced with fifo_threshold (max_fifo_level +
> >      fifo_threshold == IRB_FIFO_LEN == 128)
> >    - max-fifo-level -> amlogic,fifo-threshold
> > 
> >  drivers/media/rc/Kconfig       |  10 +
> >  drivers/media/rc/Makefile      |   1 +
> >  drivers/media/rc/meson-ir-tx.c | 410
> > +++++++++++++++++++++++++++++++++ 3 files changed, 421 insertions(+)
> >  create mode 100644 drivers/media/rc/meson-ir-tx.c
> > 
> > diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
> > index d0a8326b75c2..fd5a7a058714 100644
> > --- a/drivers/media/rc/Kconfig
> > +++ b/drivers/media/rc/Kconfig
> > @@ -246,6 +246,16 @@ config IR_MESON
> >  	   To compile this driver as a module, choose M here: the
> >  	   module will be called meson-ir.
> >  
> > +config IR_MESON_TX
> > +	tristate "Amlogic Meson IR TX"
> > +	depends on ARCH_MESON || COMPILE_TEST
> > +	help
> > +	   Say Y if you want to use the IR transmitter available on
> > +	   Amlogic Meson SoCs.
> > +
> > +	   To compile this driver as a module, choose M here: the
> > +	   module will be called meson-ir-tx.
> > +
> >  config IR_MTK
> >  	tristate "Mediatek IR remote receiver"
> >  	depends on ARCH_MEDIATEK || COMPILE_TEST
> > diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
> > index 692e9b6b203f..0db51fad27d6 100644
> > --- a/drivers/media/rc/Makefile
> > +++ b/drivers/media/rc/Makefile
> > @@ -28,6 +28,7 @@ obj-$(CONFIG_IR_ITE_CIR) += ite-cir.o
> >  obj-$(CONFIG_IR_MCEUSB) += mceusb.o
> >  obj-$(CONFIG_IR_FINTEK) += fintek-cir.o
> >  obj-$(CONFIG_IR_MESON) += meson-ir.o
> > +obj-$(CONFIG_IR_MESON_TX) += meson-ir-tx.o
> >  obj-$(CONFIG_IR_NUVOTON) += nuvoton-cir.o
> >  obj-$(CONFIG_IR_ENE) += ene_ir.o
> >  obj-$(CONFIG_IR_REDRAT3) += redrat3.o
> > diff --git a/drivers/media/rc/meson-ir-tx.c
> > b/drivers/media/rc/meson-ir-tx.c new file mode 100644
> > index 000000000000..1730af93e43d
> > --- /dev/null
> > +++ b/drivers/media/rc/meson-ir-tx.c
> > @@ -0,0 +1,410 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/**
> > + * meson-ir-tx.c - Amlogic Meson IR TX driver
> > + *
> > + * Copyright (c) 2021, SberDevices. All Rights Reserved.
> > + *
> > + * Author: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/sched.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/clk.h>
> > +#include <linux/slab.h>
> > +#include <media/rc-core.h>
> > +
> > +#define DEVICE_NAME	"Meson IR TX"
> > +#define DRIVER_NAME	"meson-ir-tx"
> > +
> > +#define MIRTX_DEFAULT_CARRIER		38000
> > +#define MIRTX_DEFAULT_DUTY_CYCLE	50
> > +#define MIRTX_DEFAULT_FIFO_THD		32
> > +
> > +#define IRB_MOD_1US_CLK_RATE	1000000
> > +
> > +#define IRB_FIFO_LEN	128
> > +
> > +#define IRB_ADDR0	0x0
> > +#define IRB_ADDR1	0x4
> > +#define IRB_ADDR2	0x8
> > +#define IRB_ADDR3	0xc
> > +
> > +#define IRB_MAX_DELAY	(1 << 10)
> > +#define IRB_DELAY_MASK	(IRB_MAX_DELAY - 1)
> > +
> > +/* IRCTRL_IR_BLASTER_ADDR0 */
> > +#define IRB_MOD_CLK(x)		((x) << 12)
> > +#define IRB_MOD_SYS_CLK		0
> > +#define IRB_MOD_XTAL3_CLK	1
> > +#define IRB_MOD_1US_CLK		2
> > +#define IRB_MOD_10US_CLK	3
> > +#define IRB_INIT_HIGH		BIT(2)
> > +#define IRB_ENABLE		BIT(0)
> > +
> > +/* IRCTRL_IR_BLASTER_ADDR2 */
> > +#define IRB_MOD_COUNT(lo, hi)	((((lo) - 1) << 16) | ((hi) -
> > 1)) +
> > +/* IRCTRL_IR_BLASTER_ADDR2 */
> > +#define IRB_WRITE_FIFO	BIT(16)
> > +#define IRB_MOD_ENABLE	BIT(12)
> > +#define IRB_TB_1US	(0x0 << 10)
> > +#define IRB_TB_10US	(0x1 << 10)
> > +#define IRB_TB_100US	(0x2 << 10)
> > +#define IRB_TB_MOD_CLK	(0x3 << 10)
> > +
> > +/* IRCTRL_IR_BLASTER_ADDR3 */
> > +#define IRB_FIFO_THD_PENDING	BIT(16)
> > +#define IRB_FIFO_IRQ_ENABLE	BIT(8)
> > +
> > +struct meson_irtx {
> > +	struct device *dev;
> > +	void __iomem *reg_base;
> > +	u32 *buf;
> > +	unsigned int buf_len;
> > +	unsigned int buf_head;
> > +	unsigned int carrier;
> > +	unsigned int duty_cycle;
> > +	spinlock_t lock;
> > +	struct completion completion;
> > +	unsigned int fifo_threshold;
> > +	unsigned long clk_rate;
> > +};
> > +
> > +static void meson_irtx_set_mod(struct meson_irtx *ir)
> > +{
> > +	unsigned int cnt = DIV_ROUND_CLOSEST(ir->clk_rate,
> > ir->carrier);
> > +	unsigned int pulse_cnt = DIV_ROUND_CLOSEST(cnt *
> > ir->duty_cycle, 100);
> > +	unsigned int space_cnt = cnt - pulse_cnt;
> > +
> > +	dev_dbg(ir->dev, "F_mod = %uHz, T_mod = %luns, duty_cycle
> > = %u%%\n",
> > +		ir->carrier, NSEC_PER_SEC / ir->clk_rate * cnt,
> > +		100 * pulse_cnt / cnt);
> > +
> > +	writel(IRB_MOD_COUNT(pulse_cnt, space_cnt),
> > +	       ir->reg_base + IRB_ADDR1);
> > +}
> > +
> > +static void meson_irtx_setup(struct meson_irtx *ir, unsigned int
> > clk_nr) +{
> > +	/*
> > +	 * Disable the TX, set modulator clock tick and set
> > initialize
> > +	 * output to be high. Set up carrier frequency and duty
> > cycle. Then
> > +	 * unset initialize output. Enable FIFO interrupt, set
> > FIFO interrupt
> > +	 * threshold. Finally, enable the transmitter back.
> > +	 */
> > +	writel(~IRB_ENABLE & (IRB_MOD_CLK(clk_nr) | IRB_INIT_HIGH),
> > +	       ir->reg_base + IRB_ADDR0);
> > +	meson_irtx_set_mod(ir);
> > +	writel(readl(ir->reg_base + IRB_ADDR0) & ~IRB_INIT_HIGH,
> > +	       ir->reg_base + IRB_ADDR0);
> > +	writel(IRB_FIFO_IRQ_ENABLE | ir->fifo_threshold,
> > +	       ir->reg_base + IRB_ADDR3);
> > +	writel(readl(ir->reg_base + IRB_ADDR0) | IRB_ENABLE,
> > +	       ir->reg_base + IRB_ADDR0);
> > +}
> > +
> > +static u32 meson_irtx_prepare_pulse(struct meson_irtx *ir,
> > unsigned int time) +{
> > +	unsigned int delay;
> > +	unsigned int tb = IRB_TB_MOD_CLK;
> > +	unsigned int tb_us = DIV_ROUND_CLOSEST(USEC_PER_SEC,
> > ir->carrier); +
> > +	delay = (DIV_ROUND_CLOSEST(time, tb_us) - 1) &
> > IRB_DELAY_MASK; +
> > +	return ((IRB_WRITE_FIFO | IRB_MOD_ENABLE) | tb | delay);
> > +}
> > +
> > +static u32 meson_irtx_prepare_space(struct meson_irtx *ir,
> > unsigned int time) +{
> > +	unsigned int delay;
> > +	unsigned int tb = IRB_TB_100US;
> > +	unsigned int tb_us = 100;
> > +
> > +	if (time <= IRB_MAX_DELAY) {
> > +		tb = IRB_TB_1US;
> > +		tb_us = 1;
> > +	} else if (time <= 10 * IRB_MAX_DELAY) {
> > +		tb = IRB_TB_10US;
> > +		tb_us = 10;
> > +	} else if (time <= 100 * IRB_MAX_DELAY) {
> > +		tb = IRB_TB_100US;
> > +		tb_us = 100;
> > +	}
> > +
> > +	delay = (DIV_ROUND_CLOSEST(time, tb_us) - 1) &
> > IRB_DELAY_MASK; +
> > +	return ((IRB_WRITE_FIFO & ~IRB_MOD_ENABLE) | tb | delay);
> > +}
> > +
> > +static void meson_irtx_send_buffer(struct meson_irtx *ir)
> > +{
> > +	unsigned int nr = 0;
> > +	unsigned int max_fifo_level = IRB_FIFO_LEN -
> > ir->fifo_threshold; +
> > +	while (ir->buf_head < ir->buf_len && nr < max_fifo_level) {
> > +		writel(ir->buf[ir->buf_head], ir->reg_base +
> > IRB_ADDR2); +
> > +		ir->buf_head++;
> > +		nr++;
> > +	}
> > +}
> > +
> > +static bool meson_irtx_check_buf(struct meson_irtx *ir,
> > +			  unsigned int *buf, unsigned int len)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < len; i++) {
> > +		unsigned int max_tb_us;
> > +		/*
> > +		 * Max space timebase is 100 us.
> > +		 * Pulse timebase equals to carrier period.
> > +		 */
> > +		if (i % 2 == 0)
> > +			max_tb_us = USEC_PER_SEC / ir->carrier;
> > +		else
> > +			max_tb_us = 100;
> > +
> > +		if (buf[i] >= max_tb_us * IRB_MAX_DELAY)
> > +			return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static void meson_irtx_fill_buf(struct meson_irtx *ir, u32
> > *dst_buf,
> > +				unsigned int *src_buf, unsigned
> > int len) +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < len; i++) {
> > +		if (i % 2 == 0)
> > +			dst_buf[i] = meson_irtx_prepare_pulse(ir,
> > src_buf[i]);
> > +		else
> > +			dst_buf[i] = meson_irtx_prepare_space(ir,
> > src_buf[i]);
> > +	}
> > +}
> > +
> > +static irqreturn_t meson_irtx_irqhandler(int irq, void *data)
> > +{
> > +	unsigned long flags;
> > +	struct meson_irtx *ir = data;
> > +
> > +	writel(readl(ir->reg_base + IRB_ADDR3) &
> > ~IRB_FIFO_THD_PENDING,
> > +	       ir->reg_base + IRB_ADDR3);
> > +
> > +	spin_lock_irqsave(&ir->lock, flags);
> > +	if (ir->buf_head < ir->buf_len)
> > +		meson_irtx_send_buffer(ir);
> > +	else
> > +		complete(&ir->completion);
> > +	spin_unlock_irqrestore(&ir->lock, flags);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int meson_irtx_set_carrier(struct rc_dev *rc, u32 carrier)
> > +{
> > +	struct meson_irtx *ir = rc->priv;
> > +
> > +	if (carrier == 0)
> > +		return -EINVAL;
> > +
> > +	ir->carrier = carrier;
> > +	meson_irtx_set_mod(ir);
> > +
> > +	return 0;
> > +}
> > +
> > +static int meson_irtx_set_duty_cycle(struct rc_dev *rc, u32
> > duty_cycle) +{
> > +	struct meson_irtx *ir = rc->priv;
> > +
> > +	ir->duty_cycle = duty_cycle;
> > +	meson_irtx_set_mod(ir);
> > +
> > +	return 0;
> > +}
> > +
> > +static void meson_irtx_update_buf(struct meson_irtx *ir, u32 *buf,
> > +				  unsigned int len, unsigned int
> > head) +{
> > +	ir->buf = buf;
> > +	ir->buf_len = len;
> > +	ir->buf_head = head;
> > +}
> > +
> > +static int meson_irtx_transmit(struct rc_dev *rc, unsigned int
> > *buf,
> > +			       unsigned int len)
> > +{
> > +	unsigned long flags;
> > +	struct meson_irtx *ir = rc->priv;
> > +	u32 *tx_buf;
> > +	int ret;
> > +
> > +	if (!meson_irtx_check_buf(ir, buf, len))
> > +		return -EINVAL;
> > +
> > +	tx_buf = kmalloc_array(len, sizeof(u32), GFP_KERNEL);
> > +	if (!tx_buf)
> > +		return -ENOMEM;
> > +
> > +	meson_irtx_fill_buf(ir, tx_buf, buf, len);
> > +	dev_dbg(ir->dev, "TX buffer filled, length = %u\n", len);
> > +
> > +	spin_lock_irqsave(&ir->lock, flags);
> > +	meson_irtx_update_buf(ir, tx_buf, len, 0);
> > +	reinit_completion(&ir->completion);
> > +	meson_irtx_send_buffer(ir);
> > +	spin_unlock_irqrestore(&ir->lock, flags);
> > +
> > +	ret = wait_for_completion_interruptible(&ir->completion);
> > +	dev_dbg(ir->dev, "TX %s\n", ret ? "interrupted" :
> > "completed");  
> 
> Here two things can happen. One is, the process received a signal
> (e.g. ^C). The other is that the hardware didn't issue any interrupts
> due some problem somewhere. In the latter case, we only escape this
> wait_for_completion_interruptable() when the user gets fed up and
> presses ^C or something like that.
> 
> > +
> > +	spin_lock_irqsave(&ir->lock, flags);
> > +	kfree(ir->buf);
> > +	meson_irtx_update_buf(ir, NULL, 0, 0);
> > +	spin_unlock_irqrestore(&ir->lock, flags);  
> 
> Now it is possible that the buffer gets cleared before that IR was
> sent, if the signal was received early enough. This means not all the
> Tx was completed.
> 
> > +
> > +	return len;  
> 
> Yet, we always return success.
> 
> In case no interrupts were generated we should return an error in a
> timely manner, so the wait_for_completion() needs the timeout. You
> can use the fact that the IR is never longer IR_MAX_DURATION (half a
> second currently). Not sure what the returned error should be, maybe
> -ETIMEDOUT?

As for me, ETIMEDOUT is OK.
> 
> The problem with the interruptable wait is that a process can receive
> a signal at any time, and now when this happens your IR gets
> truncated. I don't think this is what you want.

Should I replace wait_for_completion_interruptible by
wait_for_completion_timeout in order to wait in uninterruptible way?
> 
> Thanks
> 
> Sean
> 

Best regards,
Viktor
