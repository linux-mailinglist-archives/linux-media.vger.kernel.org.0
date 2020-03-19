Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B79518C30D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbgCSWjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:39:15 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35136 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgCSWjP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:39:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMdCmm111774;
        Thu, 19 Mar 2020 17:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584657552;
        bh=cTBh0dXWi7itVUp7YNSTCJE1tK3S1JBzhNFHQO9XilI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=RqCXWjmwT0/rZ7yBOLYtQdp5uRuvf8xO3Glv1yeE6fMPBmYecQV5B8OsjtZVANJ32
         ItQyUGwgTwhW1xLfyBzvv6ka7dxhaSxtmnUwChggFgKMbDqI7iRR18yD3KVtziRPKi
         QC9pcoiEMwBGEjCwlaLpORs6nk/xf9T8ch6slI2w=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMdC0s117968
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:39:12 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:39:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:39:12 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMdB7j056719;
        Thu, 19 Mar 2020 17:39:11 -0500
Subject: Re: [PATCH v2 08/19] media: ti-vpe: cal: simplify irq handling
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-9-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <483af670-f1c8-5ad3-95fb-96f85a03d321@ti.com>
Date:   Thu, 19 Mar 2020 17:39:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-9-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi,

Thanks for the patch.

On 3/19/20 2:50 AM, Tomi Valkeinen wrote:
> Instead of having identical code block to handle irqs for the two CAL
> ports, we can have a for loop and a single code block.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 68 +++++++++++------------------
>  1 file changed, 25 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index b070c56f8d80..ba82f0887875 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -1228,64 +1228,46 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>  	/* Check which DMA just finished */
>  	irqst2 = reg_read(dev, CAL_HL_IRQSTATUS(2));
>  	if (irqst2) {
> +		int i;
> +
>  		/* Clear Interrupt status */
>  		reg_write(dev, CAL_HL_IRQSTATUS(2), irqst2);
>  
> -		/* Need to check both port */
> -		if (isportirqset(irqst2, 1)) {
> -			ctx = dev->ctx[0];
> -
> -			spin_lock(&ctx->slock);
> -			ctx->dma_act = false;
> -
> -			if (ctx->cur_frm != ctx->next_frm)
> -				cal_process_buffer_complete(ctx);
> -
> -			spin_unlock(&ctx->slock);
> -		}
> -
> -		if (isportirqset(irqst2, 2)) {
> -			ctx = dev->ctx[1];
> +		for (i = 1; i <= 2; ++i) {
> +			if (isportirqset(irqst2, i)) {
> +				ctx = dev->ctx[i - 1];
>  
> -			spin_lock(&ctx->slock);
> -			ctx->dma_act = false;
> +				spin_lock(&ctx->slock);
> +				ctx->dma_act = false;
>  
> -			if (ctx->cur_frm != ctx->next_frm)
> -				cal_process_buffer_complete(ctx);
> +				if (ctx->cur_frm != ctx->next_frm)
> +					cal_process_buffer_complete(ctx);
>  
> -			spin_unlock(&ctx->slock);
> +				spin_unlock(&ctx->slock);
> +			}
>  		}
>  	}
>  
>  	/* Check which DMA just started */
>  	irqst3 = reg_read(dev, CAL_HL_IRQSTATUS(3));
>  	if (irqst3) {
> +		int i;
> +
>  		/* Clear Interrupt status */
>  		reg_write(dev, CAL_HL_IRQSTATUS(3), irqst3);
>  
> -		/* Need to check both port */
> -		if (isportirqset(irqst3, 1)) {
> -			ctx = dev->ctx[0];
> -			dma_q = &ctx->vidq;
> -
> -			spin_lock(&ctx->slock);
> -			ctx->dma_act = true;
> -			if (!list_empty(&dma_q->active) &&
> -			    ctx->cur_frm == ctx->next_frm)
> -				cal_schedule_next_buffer(ctx);
> -			spin_unlock(&ctx->slock);
> -		}
> -
> -		if (isportirqset(irqst3, 2)) {
> -			ctx = dev->ctx[1];
> -			dma_q = &ctx->vidq;
> -
> -			spin_lock(&ctx->slock);
> -			ctx->dma_act = true;
> -			if (!list_empty(&dma_q->active) &&
> -			    ctx->cur_frm == ctx->next_frm)
> -				cal_schedule_next_buffer(ctx);
> -			spin_unlock(&ctx->slock);
> +		for (i = 1; i <= 2; ++i) {
> +			if (isportirqset(irqst3, i)) {
> +				ctx = dev->ctx[i - 1];
> +				dma_q = &ctx->vidq;
> +
> +				spin_lock(&ctx->slock);
> +				ctx->dma_act = true;
> +				if (!list_empty(&dma_q->active) &&
> +				    ctx->cur_frm == ctx->next_frm)
> +					cal_schedule_next_buffer(ctx);
> +				spin_unlock(&ctx->slock);
> +			}
>  		}
>  	}
>  
> 

Reviewed-by: Benoit Parrot <bparrot@ti.com>
