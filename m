Return-Path: <linux-media+bounces-38830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F0B19FB8
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0347A16393A
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 10:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29AC24CEEA;
	Mon,  4 Aug 2025 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p3Pf3kB3"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD7B323E;
	Mon,  4 Aug 2025 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754303251; cv=none; b=lUxiJEXKQzI+GS7CSgcxTdcFp8VgCfi2Zwqpvfh8G9TRwo+WtXeZCIvMYGb2hkdy5yMyA18ON9rNbMdrPvyoan3byH0EcbyHhal9UvRZA4na3H3OzdTVKwfwe3pVRHQ2TDN80R6QSXCg0v4WrTpOz2cWX5liwJfa1EVuX9sD07A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754303251; c=relaxed/simple;
	bh=zuVyEaaPsk+jI/ddnJM3mILgtoWqUDUtXgflldmd0Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T/Z1+zNKSPKcGV7/M9lJbl2A1mOcYp9imouF7tWmKR9BccqbNbKQ0kUW9rqVaZyeoL0EMV5QFOHslIJ5jYWbL+5ljBDycPbqqDZDAeUPK6ikxAS835D6LQkuT1HxiBVXRR4Xcv1UxoBnPjlBdXZGx5r9IO/4qsn6nBflERmguxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=p3Pf3kB3; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 574AQwsV030354;
	Mon, 4 Aug 2025 05:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754303218;
	bh=zHDOjsZ3qxGXlfAXDGf5AHoG5TvKECFGs28x4k+pMqk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=p3Pf3kB3dzMdUP7rXRBOVXQjjY5xSdzsn6p8tayceW3c5C26sEFZ2b50KbCjNQsZL
	 UZR+s66MrEIoUAcuYDjwsrTEBNZpPf1GRV6VoPWzAnWV36XbT2AUKAAp7Wnto45kem
	 SmI08ITUOqyBdvpSGPH5vwh+s5dgHmtKRIPy4MjQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 574AQvBp1434573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 4 Aug 2025 05:26:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 4
 Aug 2025 05:26:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 4 Aug 2025 05:26:57 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 574AQp3S256262;
	Mon, 4 Aug 2025 05:26:51 -0500
Message-ID: <2da35b0a-de39-4f15-9b7d-4cc2e3a5237b@ti.com>
Date: Mon, 4 Aug 2025 15:56:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] media: ti: j721e-csi2rx: Change the drain
 architecture for multistream
To: Jai Luthra <jai.luthra@ideasonboard.com>, <jai.luthra@linux.dev>,
        <laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <vaishnav.a@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
        <tomi.valkeinen@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250514112527.1983068-1-r-donadkar@ti.com>
 <20250514112527.1983068-13-r-donadkar@ti.com>
 <175081523471.8144.8244237988305732382@freya>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <175081523471.8144.8244237988305732382@freya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 25/06/25 07:03, Jai Luthra wrote:
> Hi Rishikesh,


Hi Jai,

Thank you for the review !


>
> Thanks for the patch.
>
> Quoting Rishikesh Donadkar (2025-05-14 04:25:27)
>> On buffer starvation the DMA is marked IDLE, and the stale data in the
>> internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
>> userspace. This approach works fine for a single stream case.
>>
>> But in multistream scenarios, buffer starvation for one stream i.e. one
>> virtual channel, can block the shared HW FIFO of the CSI2RX IP. This can
>> stall the pipeline for all other virtual channels, even if buffers are
>> available for them.
>>
>> This patch introduces a new architecture, that continuously drains data
>> from the shared HW FIFO into a small (32KiB) buffer if no buffers are made
>> available to the driver from the userspace. This ensures independence
>> between different streams, where a slower downstream element for one
>> camera does not block streaming for other cameras.
>>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 96 +++++++------------
>>   1 file changed, 33 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index ba2a30bfed37d..3b046d3cf7e5a 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -57,7 +57,6 @@
>>   #define TI_CSI2RX_MAX_SOURCE_PADS      TI_CSI2RX_MAX_CTX
>>   #define TI_CSI2RX_MAX_PADS             (1 + TI_CSI2RX_MAX_SOURCE_PADS)
>>   
>> -#define DRAIN_TIMEOUT_MS               50
>>   #define DRAIN_BUFFER_SIZE              SZ_32K
>>   
>>   struct ti_csi2rx_fmt {
>> @@ -77,7 +76,6 @@ struct ti_csi2rx_buffer {
>>   
>>   enum ti_csi2rx_dma_state {
>>          TI_CSI2RX_DMA_STOPPED,  /* Streaming not started yet. */
>> -       TI_CSI2RX_DMA_IDLE,     /* Streaming but no pending DMA operation. */
>>          TI_CSI2RX_DMA_ACTIVE,   /* Streaming and pending DMA operation. */
>>   };
>>   
>> @@ -245,6 +243,10 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>>   static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>>                                 struct ti_csi2rx_buffer *buf);
>>   
>> +/* Forward declarations needed by ti_csi2rx_drain_callback. */
>> +static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx);
>> +static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx);
>> +
>>   static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
>>   {
>>          unsigned int i;
>> @@ -596,9 +598,28 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   
>>   static void ti_csi2rx_drain_callback(void *param)
>>   {
>> -       struct completion *drain_complete = param;
>> +       struct ti_csi2rx_ctx *ctx = param;
>> +       struct ti_csi2rx_dma *dma = &ctx->dma;
>> +       unsigned long flags;
>> +
>> +       spin_lock_irqsave(&dma->lock, flags);
>>   
>> -       complete(drain_complete);
>> +       if (dma->state == TI_CSI2RX_DMA_STOPPED) {
>> +               spin_unlock_irqrestore(&dma->lock, flags);
>> +               return;
>> +       }
>> +
>> +       /*
>> +        * If dma->queue is empty, it signals no buffer has arrived from
>> +        * user space, so, queue more transaction to drain dma
>> +        */
>> +       if (list_empty(&dma->queue)) {
>> +               if (ti_csi2rx_drain_dma(ctx))
>> +                       dev_warn(ctx->csi->dev, "DMA drain failed\n");
>> +       } else {
>> +               ti_csi2rx_dma_submit_pending(ctx);
>> +       }
>> +       spin_unlock_irqrestore(&dma->lock, flags);
>>   }
>>   
>>   /*
>> @@ -616,12 +637,9 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>>   {
>>          struct ti_csi2rx_dev *csi = ctx->csi;
>>          struct dma_async_tx_descriptor *desc;
>> -       struct completion drain_complete;
>>          dma_cookie_t cookie;
>>          int ret;
>>   
>> -       init_completion(&drain_complete);
>> -
>>          desc = dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
>>                                             csi->drain.len, DMA_DEV_TO_MEM,
>>                                             DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>> @@ -631,7 +649,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>>          }
>>   
>>          desc->callback = ti_csi2rx_drain_callback;
>> -       desc->callback_param = &drain_complete;
>> +       desc->callback_param = ctx;
>>   
>>          cookie = dmaengine_submit(desc);
>>          ret = dma_submit_error(cookie);
>> @@ -640,13 +658,6 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>>   
>>          dma_async_issue_pending(ctx->dma.chan);
>>   
>> -       if (!wait_for_completion_timeout(&drain_complete,
>> -                                        msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
>> -               dmaengine_terminate_sync(ctx->dma.chan);
>> -               dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
>> -               ret = -ETIMEDOUT;
>> -               goto out;
>> -       }
>>   out:
>>          return ret;
>>   }
>> @@ -694,9 +705,11 @@ static void ti_csi2rx_dma_callback(void *param)
>>   
>>          ti_csi2rx_dma_submit_pending(ctx);
>>   
>> -       if (list_empty(&dma->submitted))
>> -               dma->state = TI_CSI2RX_DMA_IDLE;
>> -
>> +       if (list_empty(&dma->submitted)) {
>> +               if (ti_csi2rx_drain_dma(ctx))
>> +                       dev_warn(ctx->csi->dev,
>> +                                "DMA drain failed on one of the transactions\n");
>> +       }
>>          spin_unlock_irqrestore(&dma->lock, flags);
>>   }
>>   
>> @@ -749,7 +762,7 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>>                   * enforced before terminating DMA.
>>                   */
>>                  ret = ti_csi2rx_drain_dma(ctx);
>> -               if (ret && ret != -ETIMEDOUT)
>> +               if (ret)
>>                          dev_warn(ctx->csi->dev,
>>                                   "Failed to drain DMA. Next frame might be bogus\n");
>>          }
>> @@ -816,57 +829,14 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>          struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>>          struct ti_csi2rx_buffer *buf;
>>          struct ti_csi2rx_dma *dma = &ctx->dma;
>> -       bool restart_dma = false;
>>          unsigned long flags = 0;
>> -       int ret;
>>   
>>          buf = container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
>>          buf->ctx = ctx;
>>   
>>          spin_lock_irqsave(&dma->lock, flags);
>> -       /*
>> -        * Usually the DMA callback takes care of queueing the pending buffers.
>> -        * But if DMA has stalled due to lack of buffers, restart it now.
>> -        */
>> -       if (dma->state == TI_CSI2RX_DMA_IDLE) {
>> -               /*
>> -                * Do not restart DMA with the lock held because
>> -                * ti_csi2rx_drain_dma() might block for completion.
>> -                * There won't be a race on queueing DMA anyway since the
>> -                * callback is not being fired.
>> -                */
>> -               restart_dma = true;
>> -               dma->state = TI_CSI2RX_DMA_ACTIVE;
>> -       } else {
>> -               list_add_tail(&buf->list, &dma->queue);
>> -       }
>> +       list_add_tail(&buf->list, &dma->queue);
>>          spin_unlock_irqrestore(&dma->lock, flags);
>> -
>> -       if (restart_dma) {
>> -               /*
>> -                * Once frames start dropping, some data gets stuck in the DMA
>> -                * pipeline somewhere. So the first DMA transfer after frame
>> -                * drops gives a partial frame. This is obviously not useful to
> I think it would be good to retain a similar comment in the code, and also
> in the commit message, as there is a possibility of returning a partial frame
> to the user post drain.


Noted, Will add this info in the next revision of this series


Regards,

Rishikesh

>
> With that change,
>
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>
>> -                * the application and will only confuse it. Issue a DMA
>> -                * transaction to drain that up.
>> -                */
>> -               ret = ti_csi2rx_drain_dma(ctx);
>> -               if (ret && ret != -ETIMEDOUT)
>> -                       dev_warn(ctx->csi->dev,
>> -                                "Failed to drain DMA. Next frame might be bogus\n");
>> -
>> -               spin_lock_irqsave(&dma->lock, flags);
>> -               ret = ti_csi2rx_start_dma(ctx, buf);
>> -               if (ret) {
>> -                       vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>> -                       dma->state = TI_CSI2RX_DMA_IDLE;
>> -                       spin_unlock_irqrestore(&dma->lock, flags);
>> -                       dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
>> -               } else {
>> -                       list_add_tail(&buf->list, &dma->submitted);
>> -                       spin_unlock_irqrestore(&dma->lock, flags);
>> -               }
>> -       }
>>   }
>>   
>>   static int ti_csi2rx_get_route(struct ti_csi2rx_ctx *ctx)
>> -- 
>> 2.34.1
> >

