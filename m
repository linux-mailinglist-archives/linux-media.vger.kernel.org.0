Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9638D187B9A
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 09:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgCQI4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 04:56:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55452 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgCQI4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 04:56:06 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02H8u2Nj085947;
        Tue, 17 Mar 2020 03:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584435362;
        bh=7Jass23Z7vv2TJIC1Oxodpvn58VovJbGZYMvS3JwgPk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xpk4zv9bpo138LHt0iRImR+GHVgH8vIrEGSZ4LXt+WvWaDxFE4Z8Xe6wi9wqZNbCf
         2d3blzgQM+dhgMFE+kyRfAT5zzKWAceTN8JACBeCj8IqjNXDyNt+23u+miKfr3Cqzh
         xsT/AFLH1AWDmY9nzYMTFc/IeLqqCdH9aKAAVnX4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02H8u2pn065637;
        Tue, 17 Mar 2020 03:56:02 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Mar 2020 03:56:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Mar 2020 03:56:02 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02H8u0uV018222;
        Tue, 17 Mar 2020 03:56:01 -0500
Subject: Re: [PATCH 03/16] media: ti-vpe: cal: catch error irqs and print
 errors
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-3-tomi.valkeinen@ti.com>
 <20200316122218.GV4732@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1ad97d7b-c1d8-7673-ab68-954afb41cd98@ti.com>
Date:   Tue, 17 Mar 2020 10:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316122218.GV4732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2020 14:22, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Mar 13, 2020 at 01:41:08PM +0200, Tomi Valkeinen wrote:
>> CAL reports various errors via IRQs, which are not handled at all by the
>> current driver. Add code to enable and catch those IRQs and print
>> errors. This will make it much easier to notice and debug issues with
>> sensors.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c      | 46 +++++++++++++++++++++++-
>>   drivers/media/platform/ti-vpe/cal_regs.h |  3 ++
>>   2 files changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index b4a9f4d16ce4..f6ce0558752a 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -692,6 +692,21 @@ static void cal_quickdump_regs(struct cal_dev *dev)
>>    */
>>   static void enable_irqs(struct cal_ctx *ctx)
>>   {
>> +	const u32 cio_err_mask =
>> +		((1 << 20) - 1) |	/* lane errors */
>> +		BIT(27) |		/* FIFO_OVR */
>> +		BIT(28) |		/* SHORT_PACKET */
>> +		BIT(30);		/* ECC_NO_CORRECTION */
> 
> Could you create macros for those bits ?
> 
>> +
>> +	/* Enable CIO error irqs */
>> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1),
>> +		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
>> +	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
>> +		  cio_err_mask);
>> +
>> +	/* Always enable OCP error */
>> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1), BIT(6));
> 
> And for this bit too.

Yep, will do.

>> +
>>   	/* Enable IRQ_WDMA_END 0/1 */
>>   	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(2), 1 << (ctx->csi2_port - 1));
>>   	/* Enable IRQ_WDMA_START 0/1 */
>> @@ -702,6 +717,12 @@ static void enable_irqs(struct cal_ctx *ctx)
>>   
>>   static void disable_irqs(struct cal_ctx *ctx)
>>   {
>> +	/* Disable CIO error irqs */
>> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(1),
>> +		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
>> +	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
>> +		  0);
>> +
>>   	/* Disable IRQ_WDMA_END 0/1 */
>>   	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(2), 1 << (ctx->csi2_port - 1));
>>   	/* Disable IRQ_WDMA_START 0/1 */
>> @@ -1169,7 +1190,30 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>>   	struct cal_dev *dev = (struct cal_dev *)data;
>>   	struct cal_ctx *ctx;
>>   	struct cal_dmaqueue *dma_q;
>> -	u32 irqst2, irqst3;
>> +	u32 irqst1, irqst2, irqst3;
>> +
>> +	irqst1 = reg_read(dev, CAL_HL_IRQSTATUS(1));
>> +	if (irqst1) {
>> +		int i;
>> +
>> +		reg_write(dev, CAL_HL_IRQSTATUS(1), irqst1);
>> +
>> +		if (irqst1 & BIT(6))
>> +			dev_err_ratelimited(&dev->pdev->dev, "OCP ERROR\n");
>> +
>> +		for (i = 1; i <= 2; ++i) {
>> +			if (irqst1 & CAL_HL_IRQ_CIO_MASK(i)) {
>> +				u32 cio_stat = reg_read(dev,
>> +							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
>> +
>> +				dev_err_ratelimited(&dev->pdev->dev,
>> +						    "CIO%d error: %#08x\n", i, cio_stat);
>> +
>> +				reg_write(dev, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
>> +					  cio_stat);
>> +			}
>> +		}
>> +	}
>>   
>>   	/* Check which DMA just finished */
>>   	irqst2 = reg_read(dev, CAL_HL_IRQSTATUS(2));
>> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
>> index 0b76d1186074..a29198cc3efe 100644
>> --- a/drivers/media/platform/ti-vpe/cal_regs.h
>> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
>> @@ -158,6 +158,9 @@
>>   #define CAL_HL_IRQ_ENABLED				0x1
>>   #define CAL_HL_IRQ_PENDING				0x1
>>   
>> +#define CAL_HL_IRQ_CIO_MASK(i)			BIT(16 + (i-1) * 8)
> 
> This should be
> 
> 	BIT(16 + ((i)-1) * 8)
> 
>> +#define CAL_HL_IRQ_VC_MASK(i)			BIT(17 + (i-1) * 8)
> 
> Same here.

Right. Thanks!

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
