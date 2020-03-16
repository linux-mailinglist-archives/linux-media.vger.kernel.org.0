Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA61186975
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 11:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730684AbgCPKvf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 06:51:35 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:53517 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730612AbgCPKvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 06:51:35 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id DnLFjxULsEE3qDnLIjdjNY; Mon, 16 Mar 2020 11:51:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584355892; bh=9vVUHLhyCLfDk7DShbXHRw8JIn8i31ae6aqhdM31uI8=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NGgGk4bx4vYnC0h2ksQG9EBZwLc+sOvgGuRR3GS0cdsBZLlBWQhw2p8WZbaWWgTT4
         UkbOZF0D8fkOQQNYqeBA3ogRBdrWGbXLBHgvFJr+Q+6MbssFZ37cXeFaxeHK56PDtu
         d+PNHIh+kmIwlS5g9l/4nAKflTSucMMOLh0FGOwlDrMrfCqSW5HIgRzSZj9EIbnNkg
         5Uw9dzQ1u5k/tDa+xndvmTtwwhepaPsLiFKa6HtXNzFWYKT/zEFFRV5PVxeLAzA4vc
         SpQPwJ8gvodJ2lhU493OZ8qFy2oU/xsIzRaOqax8ETNr19J8mgk4lmKcJep9q6HW6a
         NbwoNvtRYqyVQ==
Subject: Re: [PATCH 03/16] media: ti-vpe: cal: catch error irqs and print
 errors
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-3-tomi.valkeinen@ti.com>
 <dd31db33-c73b-cb05-ac18-90643a2a0074@xs4all.nl>
Message-ID: <9af07911-54e7-fb04-1e34-26f306299e6e@xs4all.nl>
Date:   Mon, 16 Mar 2020 11:51:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dd31db33-c73b-cb05-ac18-90643a2a0074@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLzRqA92jWZMtOlzpLIq/ebsyfY4cXDHEmcDpHL/HKZLVGNqTwaF7FjaC0jkoV+/k0nrF2C9PAsP8/YkQifmW5i6IWlCMwQm7VFcY4B7QmK1BLVet/Fc
 jeDMjYcSHTTmdzqdUzgPF6GkQNYnbm9Gp2AkRyjuLbFBk2h812SlEZkT5aXjjBmRN6tzNUWAmXQDBixfxvsX5PXYn9X8TqZfNIWJUFzSZZQ2Wpa/Gc13LMMB
 /86gtuug8YBs0v1hHosICTzTem+FLQayqFP/dN4yEk19AEkxZ6o/ZOulvD26ufqU1jfqZnlJoe7AayC0eYdgKQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/16/20 11:06 AM, Hans Verkuil wrote:
> Hi Tomi,
> 
> On 3/13/20 12:41 PM, Tomi Valkeinen wrote:
>> CAL reports various errors via IRQs, which are not handled at all by the
>> current driver. Add code to enable and catch those IRQs and print
>> errors. This will make it much easier to notice and debug issues with
>> sensors.
> 
> Can you rebase your series to the media_tree master branch? Other recently
> merged patches from Benoit now conflict with at least this patch.
> 
> I reviewed this series and it looks good otherwise (just one other small comment
> about a confusing log message), so once I have a rebased version I can make
> a PR for it.

Just to confirm: this series has been tested with a real sensor, right? If so,
please add a Tested-by line as well.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  drivers/media/platform/ti-vpe/cal.c      | 46 +++++++++++++++++++++++-
>>  drivers/media/platform/ti-vpe/cal_regs.h |  3 ++
>>  2 files changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index b4a9f4d16ce4..f6ce0558752a 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -692,6 +692,21 @@ static void cal_quickdump_regs(struct cal_dev *dev)
>>   */
>>  static void enable_irqs(struct cal_ctx *ctx)
>>  {
>> +	const u32 cio_err_mask =
>> +		((1 << 20) - 1) |	/* lane errors */
>> +		BIT(27) |		/* FIFO_OVR */
>> +		BIT(28) |		/* SHORT_PACKET */
>> +		BIT(30);		/* ECC_NO_CORRECTION */
>> +
>> +	/* Enable CIO error irqs */
>> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1),
>> +		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
>> +	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
>> +		  cio_err_mask);
>> +
>> +	/* Always enable OCP error */
>> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1), BIT(6));
>> +
>>  	/* Enable IRQ_WDMA_END 0/1 */
>>  	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(2), 1 << (ctx->csi2_port - 1));
>>  	/* Enable IRQ_WDMA_START 0/1 */
>> @@ -702,6 +717,12 @@ static void enable_irqs(struct cal_ctx *ctx)
>>  
>>  static void disable_irqs(struct cal_ctx *ctx)
>>  {
>> +	/* Disable CIO error irqs */
>> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(1),
>> +		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
>> +	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
>> +		  0);
>> +
>>  	/* Disable IRQ_WDMA_END 0/1 */
>>  	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(2), 1 << (ctx->csi2_port - 1));
>>  	/* Disable IRQ_WDMA_START 0/1 */
>> @@ -1169,7 +1190,30 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>>  	struct cal_dev *dev = (struct cal_dev *)data;
>>  	struct cal_ctx *ctx;
>>  	struct cal_dmaqueue *dma_q;
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
>>  	/* Check which DMA just finished */
>>  	irqst2 = reg_read(dev, CAL_HL_IRQSTATUS(2));
>> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
>> index 0b76d1186074..a29198cc3efe 100644
>> --- a/drivers/media/platform/ti-vpe/cal_regs.h
>> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
>> @@ -158,6 +158,9 @@
>>  #define CAL_HL_IRQ_ENABLED				0x1
>>  #define CAL_HL_IRQ_PENDING				0x1
>>  
>> +#define CAL_HL_IRQ_CIO_MASK(i)			BIT(16 + (i-1) * 8)
>> +#define CAL_HL_IRQ_VC_MASK(i)			BIT(17 + (i-1) * 8)
>> +
>>  #define CAL_PIX_PROC_EN_MASK			BIT(0)
>>  #define CAL_PIX_PROC_EXTRACT_MASK		GENMASK(4, 1)
>>  #define CAL_PIX_PROC_EXTRACT_B6				0x0
>>
> 

