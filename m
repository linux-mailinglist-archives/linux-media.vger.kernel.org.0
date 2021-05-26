Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774083915BB
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 13:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234194AbhEZLMf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 07:12:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60132 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234006AbhEZLMe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 07:12:34 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id B44E51F42E68
Subject: Re: [PATCH v11 9/9] media: hantro: IMX8M: add variant for G2/HEVC
 codec
To:     Hans Verkuil <hverkuil@xs4all.nl>, ezequiel@collabora.com,
        p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210525161238.1191168-1-benjamin.gaignard@collabora.com>
 <20210525161238.1191168-10-benjamin.gaignard@collabora.com>
 <1454f153-c04b-6b90-8467-54bb33c6f3fa@xs4all.nl>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <3bd6a50d-6a70-ec17-2e9e-bb515ad5e832@collabora.com>
Date:   Wed, 26 May 2021 13:10:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1454f153-c04b-6b90-8467-54bb33c6f3fa@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 26/05/2021 à 11:52, Hans Verkuil a écrit :
> On 25/05/2021 18:12, Benjamin Gaignard wrote:
>> Add variant to IMX8M to enable G2/HEVC codec.
>> Define the capabilities for the hardware up to 3840x2160.
>> G2 doesn't have a postprocessor, uses the same clocks and has it
>> own interrupt.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>> ---
>>   drivers/staging/media/hantro/hantro_drv.c   |  1 +
>>   drivers/staging/media/hantro/hantro_hw.h    |  1 +
>>   drivers/staging/media/hantro/imx8m_vpu_hw.c | 96 ++++++++++++++++++++-
>>   3 files changed, 96 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>> index ae8a0037706f..507cd5b454b3 100644
>> --- a/drivers/staging/media/hantro/hantro_drv.c
>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>> @@ -588,6 +588,7 @@ static const struct of_device_id of_hantro_match[] = {
>>   #endif
>>   #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>>   	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
>> +	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
>  From checkpatch:
>
> WARNING: DT compatible string "nxp,imx8mq-vpu-g2" appears un-documented -- check ./Documentation/devicetree/bindings/
> #29: FILE: drivers/staging/media/hantro/hantro_drv.c:591:
> +       { .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
>
> Is a patch missing for bindings adding "nxp,imx8mq-vpu-g2"?

The DT and bindings patches are delayed because NXP guys want to use power domain to drive
the control block:
https://lore.kernel.org/linux-media/20210407073534.376722-1-benjamin.gaignard@collabora.com/T/#m6bd571fee94b1b1fa5c5d3fa6315ae5c9f4c8fad

Regards,
Benjamin

>
> Regards,
>
> 	Hans
>
>
>>   #endif
>>   #ifdef CONFIG_VIDEO_HANTRO_SAMA5D4
>>   	{ .compatible = "microchip,sama5d4-vdec", .data = &sama5d4_vdec_variant, },
>> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
>> index b743b255bf32..5cc083112017 100644
>> --- a/drivers/staging/media/hantro/hantro_hw.h
>> +++ b/drivers/staging/media/hantro/hantro_hw.h
>> @@ -206,6 +206,7 @@ extern const struct hantro_variant rk3328_vpu_variant;
>>   extern const struct hantro_variant rk3288_vpu_variant;
>>   extern const struct hantro_variant imx8mq_vpu_variant;
>>   extern const struct hantro_variant sama5d4_vdec_variant;
>> +extern const struct hantro_variant imx8mq_vpu_g2_variant;
>>   
>>   extern const struct hantro_postproc_regs hantro_g1_postproc_regs;
>>   
>> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> index 9eb556460e52..ea152e1e6514 100644
>> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> @@ -9,6 +9,9 @@
>>   #include <linux/delay.h>
>>   
>>   #include "hantro.h"
>> +#include "hantro_jpeg.h"
>> +#include "hantro_g1_regs.h"
>> +#include "hantro_g2_regs.h"
>>   
>>   #define CTRL_SOFT_RESET		0x00
>>   #define RESET_G1		BIT(1)
>> @@ -128,6 +131,62 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
>>   	},
>>   };
>>   
>> +static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_NV12,
>> +		.codec_mode = HANTRO_MODE_NONE,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
>> +		.codec_mode = HANTRO_MODE_HEVC_DEC,
>> +		.max_depth = 2,
>> +		.frmsize = {
>> +			.min_width = 48,
>> +			.max_width = 3840,
>> +			.step_width = MB_DIM,
>> +			.min_height = 48,
>> +			.max_height = 2160,
>> +			.step_height = MB_DIM,
>> +		},
>> +	},
>> +};
>> +
>> +static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
>> +{
>> +	struct hantro_dev *vpu = dev_id;
>> +	enum vb2_buffer_state state;
>> +	u32 status;
>> +
>> +	status = vdpu_read(vpu, G1_REG_INTERRUPT);
>> +	state = (status & G1_REG_INTERRUPT_DEC_RDY_INT) ?
>> +		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
>> +
>> +	vdpu_write(vpu, 0, G1_REG_INTERRUPT);
>> +	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
>> +
>> +	hantro_irq_done(vpu, state);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t imx8m_vpu_g2_irq(int irq, void *dev_id)
>> +{
>> +	struct hantro_dev *vpu = dev_id;
>> +	enum vb2_buffer_state state;
>> +	u32 status;
>> +
>> +	status = vdpu_read(vpu, HEVC_REG_INTERRUPT);
>> +	state = (status & HEVC_REG_INTERRUPT_DEC_RDY_INT) ?
>> +		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
>> +
>> +	vdpu_write(vpu, 0, HEVC_REG_INTERRUPT);
>> +	vdpu_write(vpu, HEVC_REG_CONFIG_DEC_CLK_GATE_E, HEVC_REG_CONFIG);
>> +
>> +	hantro_irq_done(vpu, state);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>>   static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
>>   {
>>   	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
>> @@ -142,6 +201,13 @@ static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
>>   	imx8m_soft_reset(vpu, RESET_G1);
>>   }
>>   
>> +static void imx8m_vpu_g2_reset(struct hantro_ctx *ctx)
>> +{
>> +	struct hantro_dev *vpu = ctx->dev;
>> +
>> +	imx8m_soft_reset(vpu, RESET_G2);
>> +}
>> +
>>   /*
>>    * Supported codec ops.
>>    */
>> @@ -167,13 +233,25 @@ static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
>>   	},
>>   };
>>   
>> +static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
>> +	[HANTRO_MODE_HEVC_DEC] = {
>> +		.run = hantro_g2_hevc_dec_run,
>> +		.reset = imx8m_vpu_g2_reset,
>> +		.init = hantro_hevc_dec_init,
>> +		.exit = hantro_hevc_dec_exit,
>> +	},
>> +};
>> +
>>   /*
>>    * VPU variants.
>>    */
>>   
>>   static const struct hantro_irq imx8mq_irqs[] = {
>> -	{ "g1", hantro_g1_irq },
>> -	{ "g2", NULL /* TODO: imx8m_vpu_g2_irq */ },
>> +	{ "g1", imx8m_vpu_g1_irq },
>> +};
>> +
>> +static const struct hantro_irq imx8mq_g2_irqs[] = {
>> +	{ "g2", imx8m_vpu_g2_irq },
>>   };
>>   
>>   static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
>> @@ -197,3 +275,17 @@ const struct hantro_variant imx8mq_vpu_variant = {
>>   	.reg_names = imx8mq_reg_names,
>>   	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
>>   };
>> +
>> +const struct hantro_variant imx8mq_vpu_g2_variant = {
>> +	.dec_offset = 0x0,
>> +	.dec_fmts = imx8m_vpu_g2_dec_fmts,
>> +	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_g2_dec_fmts),
>> +	.codec = HANTRO_HEVC_DECODER,
>> +	.codec_ops = imx8mq_vpu_g2_codec_ops,
>> +	.init = imx8mq_vpu_hw_init,
>> +	.runtime_resume = imx8mq_runtime_resume,
>> +	.irqs = imx8mq_g2_irqs,
>> +	.num_irqs = ARRAY_SIZE(imx8mq_g2_irqs),
>> +	.clk_names = imx8mq_clk_names,
>> +	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
>> +};
>>
