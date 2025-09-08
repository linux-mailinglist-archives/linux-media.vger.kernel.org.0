Return-Path: <linux-media+bounces-41974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90286B48911
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A7CE4E1512
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB4E2F069E;
	Mon,  8 Sep 2025 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WjN/vY8I"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6161D1E505;
	Mon,  8 Sep 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325118; cv=none; b=EBKaMVQjecVFNifooEAatIy5IfwFHZ4knhW4OhvcijeqjnP85sKRvLbkReF9XzD3qPltTMI108mmHKMqEE188gesOofyTKYLAmm1o/PDxQ/JC/hybzS19HF4D2myE9kRvXFCcxzwrk3XRydJxT/de3aJa9VCuTFMzzqu4voGaO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325118; c=relaxed/simple;
	bh=AewMyCtVmzpGoCtRfmUsnmVxguA8lkNLgMZfgg4IN80=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UdYgh4BroP/lPXD2HAkukPURixh0frkt42qnEqj1t+19PYDVdvyw0nFre9hap9/us7Lzd6Ng/FBwRH20bkMopOZJrxs6ObMh6Ld6Om+SrLllV3f4VzaI19JRyOfcif16VuyCinJseVy0qSJDKeS5ZSgxzjTHrd4v1Oxz4lN5iBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WjN/vY8I; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5889pQE5029061;
	Mon, 8 Sep 2025 04:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757325086;
	bh=SS6DuSzgR76vaizUYakz4Izy7zwMeTZaSuY4kSQIbIU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WjN/vY8IaoBYzndQySfVCWD0a7MFN+yOIL/iHqmNSGZJjF9TMloFBSplNRqA6QwKT
	 4VHQgA1/49unadzhM0GnL9N2HQPzwsu1Xe4WzfVYR1/W4RvCNFjK2sCsE/54nf5+ld
	 /6a/Mv2Smdrj471MbeGQ41dKGgpIMWoyAGmPM1vw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5889pQU62877877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 04:51:26 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 04:51:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 04:51:25 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5889pJLO401019;
	Mon, 8 Sep 2025 04:51:20 -0500
Message-ID: <5f830f6e-f48d-4150-b705-0cad04ea5267@ti.com>
Date: Mon, 8 Sep 2025 15:21:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/14] media: ti: j721e-csi2rx: Wait for the last drain
 completion
To: Jai Luthra <jai.luthra@ideasonboard.com>, <jai.luthra@linux.dev>,
        <laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <vaishnav.a@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
        <tomi.valkeinen@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250825142522.1826188-1-r-donadkar@ti.com>
 <20250825142522.1826188-15-r-donadkar@ti.com>
 <175707067154.8095.10777597561482124941@freya>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <175707067154.8095.10777597561482124941@freya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 05/09/25 16:41, Jai Luthra wrote:
> Quoting Rishikesh Donadkar (2025-08-25 19:55:22)

Hi Jai,

Thank you for the comments.

>> dmaengine_terminate_sync() causes all activity for the DMA channel to be
>> stopped, and may discard data in the DMA FIFO which hasn't been fully
>> transferred. No callback functions will be called for any
>> incomplete transfers[1].
>>
>> In multistream use case, calling dmaengine_terminate_sync() immediately
>> after issuing the last drain transaction will result in no callback
>> for the last drain cycle.
>>
>> Implement complete callback for the last drain cycle to make sure that
>> the last drain has completed properly, this will ensure that stale data
>> is not left out in the HW FIFO.
>>
>> [1] : https://docs.kernel.org/driver-api/dmaengine/client.html
>>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 4ac6a76b9409..520ee05eb5b4 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -62,6 +62,7 @@
>>   #define TI_CSI2RX_MAX_PADS             (1 + TI_CSI2RX_MAX_SOURCE_PADS)
>>   
>>   #define DRAIN_BUFFER_SIZE              SZ_32K
>> +#define DRAIN_TIMEOUT_MS               50
> This was dropped in the previous patch, and now reintroduce.
>
> IIUC this patch is fixing a bug introduced by the previous one, so it's
> better to squash them together, and have a combined commit description that
> goes over this end-of-stream case, as well as why continuous drain was
> needed for mid-stream scenario.

Okay

>
>>   
>>   #define CSI2RX_BRIDGE_SOURCE_PAD       1
>>   
>> @@ -137,6 +138,7 @@ struct ti_csi2rx_dev {
>>                  size_t                  len;
>>          } drain;
>>          bool                            vc_cached;
>> +       struct completion drain_complete;
> Why is the struct completion shared amongst all contexts in the
> ti_csi2rx_dev structure?
>
> What happens when two streams are stopped together?
Right, this struct completion must be per ctx.
>
>>   };
>>   
>>   static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
>> @@ -624,12 +626,14 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   static void ti_csi2rx_drain_callback(void *param)
>>   {
>>          struct ti_csi2rx_ctx *ctx = param;
>> +       struct ti_csi2rx_dev *csi = ctx->csi;
>>          struct ti_csi2rx_dma *dma = &ctx->dma;
>>          unsigned long flags;
>>   
>>          spin_lock_irqsave(&dma->lock, flags);
>>   
>>          if (dma->state == TI_CSI2RX_DMA_STOPPED) {
>> +               complete(&csi->drain_complete);
> Please also add comment above this if case explaining why we need to wait
> for the drain to complete when dma->state == STOPPED, which is set by the
> driver elsewhere when streamoff was requested, and no more data will be
> coming in from the source.
Sure, I believe it would make more sense to add this comment above the 
wait_for_completion_timeout() call.
>
>>                  spin_unlock_irqrestore(&dma->lock, flags);
>>                  return;
>>          }
>> @@ -774,6 +778,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>>   static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>>   {
>>          struct ti_csi2rx_dma *dma = &ctx->dma;
>> +       struct ti_csi2rx_dev *csi = ctx->csi;
>>          enum ti_csi2rx_dma_state state;
>>          unsigned long flags;
>>          int ret;
>> @@ -783,6 +788,8 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>>          dma->state = TI_CSI2RX_DMA_STOPPED;
>>          spin_unlock_irqrestore(&dma->lock, flags);
>>   
>> +       init_completion(&csi->drain_complete);
>> +
>>          if (state != TI_CSI2RX_DMA_STOPPED) {
>>                  /*
>>                   * Normal DMA termination does not clean up pending data on
>> @@ -796,6 +803,10 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>>                                   "Failed to drain DMA. Next frame might be bogus\n");
>>          }
>>   
>> +       if (!wait_for_completion_timeout(&csi->drain_complete,
>> +                                        msecs_to_jiffies(DRAIN_TIMEOUT_MS)))
>> +               dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
>> +
>>          ret = dmaengine_terminate_sync(ctx->dma.chan);
>>          if (ret)
>>                  dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
>> -- 
>> 2.34.1
>>
> Thanks,
>      Jai

Regards,

Rishikesh


