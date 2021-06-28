Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71EC53B5F24
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 15:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhF1NjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 09:39:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41656 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbhF1NiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 09:38:25 -0400
Received: from [IPv6:2a01:e0a:4cb:a870:fc14:fe1d:1736:64c2] (unknown [IPv6:2a01:e0a:4cb:a870:fc14:fe1d:1736:64c2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6598D1F42794;
        Mon, 28 Jun 2021 14:35:56 +0100 (BST)
Subject: Re: [PATCH v9 03/13] media: hantro: Use syscon instead of 'ctrl'
 register
To:     Lucas Stach <l.stach@pengutronix.de>, ezequiel@collabora.com,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        lee.jones@linaro.org, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-imx@nxp.com, kernel@pengutronix.de, kernel@collabora.com,
        cphealy@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
References: <20210407073534.376722-1-benjamin.gaignard@collabora.com>
 <20210407073534.376722-4-benjamin.gaignard@collabora.com>
 <7bcbb787d82f21d42563d8fb7e3c2e7d40123932.camel@pengutronix.de>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <24bea430-56d9-9a62-130d-1ed3830c1915@collabora.com>
Date:   Mon, 28 Jun 2021 15:35:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7bcbb787d82f21d42563d8fb7e3c2e7d40123932.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 16/04/2021 à 12:54, Lucas Stach a écrit :
> Am Mittwoch, dem 07.04.2021 um 09:35 +0200 schrieb Benjamin Gaignard:
>> In order to be able to share the control hardware block between
>> VPUs use a syscon instead a ioremap it in the driver.
>> To keep the compatibility with older DT if 'nxp,imx8mq-vpu-ctrl'
>> phandle is not found look at 'ctrl' reg-name.
>> With the method it becomes useless to provide a list of register
>> names so remove it.
> Sorry for putting a spoke in the wheel after many iterations of the
> series.
>
> We just discussed a way forward on how to handle the clocks and resets
> provided by the blkctl block on i.MX8MM and later and it seems there is
> a consensus on trying to provide virtual power domains from a blkctl
> driver, controlling clocks and resets for the devices in the power
> domain. I would like to avoid introducing yet another way of handling
> the blkctl and thus would like to align the i.MX8MQ VPU blkctl with
> what we are planning to do on the later chip generations.
>
> CC'ing Jacky Bai and Peng Fan from NXP, as they were going to give this
> virtual power domain thing a shot.

Hey guys,

I may I have miss them but I haven't see patches about power domain for IMX8MQ
VPU control block ?
Is it something that you still plan to do ?
If not, I can resend my patches where I use syscon.

Regards,
Benjamin

>
> Regards,
> Lucas
>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>> ---
>> version 9:
>>   - Corrections in commit message
>>
>> version 7:
>>   - Add Philipp reviewed-by tag.
>>   - Change syscon phandle name.
>>   
>>
>>
>>
>> version 5:
>>   - use syscon instead of VPU reset driver.
>>   - if DT doesn't provide syscon keep backward compatibilty by using
>>     'ctrl' reg-name.
>>
>>   drivers/staging/media/hantro/hantro.h       |  5 +-
>>   drivers/staging/media/hantro/imx8m_vpu_hw.c | 52 ++++++++++++---------
>>   2 files changed, 34 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
>> index 6c1b888abe75..37b9ce04bd4e 100644
>> --- a/drivers/staging/media/hantro/hantro.h
>> +++ b/drivers/staging/media/hantro/hantro.h
>> @@ -13,6 +13,7 @@
>>   #define HANTRO_H_
>>   
>>
>>
>>
>>   #include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>>   #include <linux/videodev2.h>
>>   #include <linux/wait.h>
>>   #include <linux/clk.h>
>> @@ -167,7 +168,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>>    * @reg_bases:		Mapped addresses of VPU registers.
>>    * @enc_base:		Mapped address of VPU encoder register for convenience.
>>    * @dec_base:		Mapped address of VPU decoder register for convenience.
>> - * @ctrl_base:		Mapped address of VPU control block.
>> + * @ctrl_base:		Regmap of VPU control block.
>>    * @vpu_mutex:		Mutex to synchronize V4L2 calls.
>>    * @irqlock:		Spinlock to synchronize access to data structures
>>    *			shared with interrupt handlers.
>> @@ -186,7 +187,7 @@ struct hantro_dev {
>>   	void __iomem **reg_bases;
>>   	void __iomem *enc_base;
>>   	void __iomem *dec_base;
>> -	void __iomem *ctrl_base;
>> +	struct regmap *ctrl_base;
>>   
>>
>>
>>
>>   	struct mutex vpu_mutex;	/* video_device lock */
>>   	spinlock_t irqlock;
>> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> index c222de075ef4..8d0c3425234b 100644
>> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> @@ -7,6 +7,7 @@
>>   
>>
>>
>>
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>> +#include <linux/mfd/syscon.h>
>>   
>>
>>
>>
>>   #include "hantro.h"
>>   #include "hantro_jpeg.h"
>> @@ -24,30 +25,28 @@
>>   #define CTRL_G1_PP_FUSE		0x0c
>>   #define CTRL_G2_DEC_FUSE	0x10
>>   
>>
>>
>>
>> +static const struct regmap_config ctrl_regmap_ctrl = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 0x14,
>> +};
>> +
>>   static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
>>   {
>> -	u32 val;
>> -
>>   	/* Assert */
>> -	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
>> -	val &= ~reset_bits;
>> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
>> +	regmap_update_bits(vpu->ctrl_base, CTRL_SOFT_RESET, reset_bits, 0);
>>   
>>
>>
>>
>>   	udelay(2);
>>   
>>
>>
>>
>>   	/* Release */
>> -	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
>> -	val |= reset_bits;
>> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
>> +	regmap_update_bits(vpu->ctrl_base, CTRL_SOFT_RESET,
>> +			   reset_bits, reset_bits);
>>   }
>>   
>>
>>
>>
>>   static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
>>   {
>> -	u32 val;
>> -
>> -	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
>> -	val |= clock_bits;
>> -	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
>> +	regmap_update_bits(vpu->ctrl_base, CTRL_CLOCK_ENABLE,
>> +			   clock_bits, clock_bits);
>>   }
>>   
>>
>>
>>
>>   static int imx8mq_runtime_resume(struct hantro_dev *vpu)
>> @@ -64,9 +63,9 @@ static int imx8mq_runtime_resume(struct hantro_dev *vpu)
>>   	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
>>   
>>
>>
>>
>>   	/* Set values of the fuse registers */
>> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
>> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
>> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
>> +	regmap_write(vpu->ctrl_base, CTRL_G1_DEC_FUSE, 0xffffffff);
>> +	regmap_write(vpu->ctrl_base, CTRL_G1_PP_FUSE, 0xffffffff);
>> +	regmap_write(vpu->ctrl_base, CTRL_G2_DEC_FUSE, 0xffffffff);
>>   
>>
>>
>>
>>   	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
>>   
>>
>>
>>
>> @@ -150,8 +149,22 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
>>   
>>
>>
>>
>>   static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
>>   {
>> -	vpu->dec_base = vpu->reg_bases[0];
>> -	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
>> +	struct device_node *np = vpu->dev->of_node;
>> +
>> +	vpu->ctrl_base = syscon_regmap_lookup_by_phandle(np, "nxp,imx8m-vpu-ctrl");
>> +	if (IS_ERR(vpu->ctrl_base)) {
>> +		struct resource *res;
>> +		void __iomem *ctrl;
>> +
>> +		res = platform_get_resource_byname(vpu->pdev, IORESOURCE_MEM, "ctrl");
>> +		ctrl = devm_ioremap_resource(vpu->dev, res);
>> +		if (IS_ERR(ctrl))
>> +			return PTR_ERR(ctrl);
>> +
>> +		vpu->ctrl_base = devm_regmap_init_mmio(vpu->dev, ctrl, &ctrl_regmap_ctrl);
>> +		if (IS_ERR(vpu->ctrl_base))
>> +			return PTR_ERR(vpu->ctrl_base);
>> +	}
>>   
>>
>>
>>
>>   	return 0;
>>   }
>> @@ -198,7 +211,6 @@ static const struct hantro_irq imx8mq_irqs[] = {
>>   };
>>   
>>
>>
>>
>>   static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
>> -static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
>>   
>>
>>
>>
>>   const struct hantro_variant imx8mq_vpu_variant = {
>>   	.dec_fmts = imx8m_vpu_dec_fmts,
>> @@ -215,6 +227,4 @@ const struct hantro_variant imx8mq_vpu_variant = {
>>   	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
>>   	.clk_names = imx8mq_clk_names,
>>   	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
>> -	.reg_names = imx8mq_reg_names,
>> -	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
>>   };
>
>
