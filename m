Return-Path: <linux-media+bounces-40512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 620DBB2EE1D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8537A5C7912
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 06:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A049A273D84;
	Thu, 21 Aug 2025 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EV6mFJY0"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25B1263C7F;
	Thu, 21 Aug 2025 06:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755757363; cv=none; b=brND3u9WWpRYfO2BRoM1p0GcoLZMnbE2LRt+S/Ih6wx3/kHUlPmzE8agZeJA23lJIgab1uhs5Md855+ZTjPwCTi0HiH9toWb1IZMvBXxXuS+kr/zkvZKVOSxwlH+SBwNGdlHVO8RP7Y+kxIFbLjvdh8lvEX2ACVxu3Zk8jCVV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755757363; c=relaxed/simple;
	bh=nQx/iQvnZ+I2T0GIhyLovy+j/Ynj0Tg3BFgTsn0i5tM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r7mRCuNgAL30sCtgFGXMk20PL6FoeVE1ipxdAGaNQCm30ZCeEdHVVX6x/r2lQ0zztNy7nAkueoXpPsGttGoa+iOWQlYK7EtkJOQ2+qmLx5GZsbcwJFk0q0y1XTp96jVb6OiAxapwyn1uxBntUVICAg5Gj+q5oRRouILGjS/LH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EV6mFJY0; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57L6M54V3305637;
	Thu, 21 Aug 2025 01:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755757325;
	bh=+vJVxTr5AHSZEu8bxIlDbDhn59zoNQNyPn9xBd8vgkw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EV6mFJY0jKsNYOvj+LkyWYmlQiR0z+RfMJTyn6mtrobEWLhqTAOM/l2HrxQgwB4ga
	 RlJhC/rhP57hNj7qIvob6ub/14sj5yt8A/0Z1kmM0Kwr1eYPlPNncfLn9S+GoJrBPd
	 DKwBN7IDuEOwKykQ6eRk+uK/g30ycMQdKPACzkjM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57L6M5LE2331658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 01:22:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 01:22:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 01:22:04 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57L6LvC51423337;
	Thu, 21 Aug 2025 01:21:58 -0500
Message-ID: <9fa2e0ab-fed1-4d19-a735-e5458014f549@ti.com>
Date: Thu, 21 Aug 2025 11:51:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] media: ti: j721e-csi2rx: Submit all available
 buffers
To: Sjoerd Simons <sjoerd@collabora.com>, <jai.luthra@linux.dev>,
        <laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
        Julien Massot
	<jmassot@collabora.com>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <vaishnav.a@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
        <tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
        <changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, "Liu (EP), Bin"
	<b-liu@ti.com>
References: <20250514112527.1983068-1-r-donadkar@ti.com>
 <20250514112527.1983068-12-r-donadkar@ti.com>
 <ab421c6f9fc804a6f03833d824d5776c7272e6bb.camel@collabora.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <ab421c6f9fc804a6f03833d824d5776c7272e6bb.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 01/07/25 13:39, Sjoerd Simons wrote:
> Hey,


Hi Sjoerd,

>
> On Wed, 2025-05-14 at 16:55 +0530, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> We already make sure to submit all available buffers to DMA in each DMA
>> completion callback.
>>
>> Move that logic in a separate function, and use it during stream start
>> as well, as most application queue all their buffers before stream on.
>>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 43 +++++++++++--------
>>   1 file changed, 24 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 7986f96c5e11b..ba2a30bfed37d 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -651,6 +651,27 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>>   	return ret;
>>   }
>>   
>> +static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx)
>> +{
>> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>> +	struct ti_csi2rx_buffer *buf;
>> +	int ret = 0;
>> +
>> +	/* If there are more buffers to process then start their transfer. */
>> +	while (!list_empty(&dma->queue)) {
>> +		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer,
>> list);
>> +		ret = ti_csi2rx_start_dma(ctx, buf);
>> +		if (ret) {
>> +			dev_err(ctx->csi->dev,
>> +				"Failed to queue the next buffer for DMA\n");
>> +			vb2_buffer_done(&buf->vb.vb2_buf,
>> VB2_BUF_STATE_ERROR);
>> +			break;
> The break here seems wrong and does change the previous logic; It means once *a*
> buffer fails to start DMA, you'll no longer try to submit the other (queued)
> buffers. If this was called from the DMA callback of the last submitted buffer
> and userspace doesn't re-queue the error buffer, then capturing will stop, even
> if there were still queued up buffers from a userspace pov.
>
>
> For a potential next iteration you probably also want to wrap in the changes
> from to fix list_del corruption:
> https://lore.kernel.org/all/20250630-j721e-dma-fixup-v1-1-591e378ab3a8@collabora.com/


Thank you for the pointer !

I will make these changes in the next revision


Regards,

Rishikesh

>
>
>
>> +		}
>> +		list_move_tail(&buf->list, &dma->submitted);
>> +	}
>> +	return ret;
>> +}
>> +
>>   static void ti_csi2rx_dma_callback(void *param)
>>   {
>>   	struct ti_csi2rx_buffer *buf = param;
>> @@ -671,18 +692,7 @@ static void ti_csi2rx_dma_callback(void *param)
>>   	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>>   	list_del(&buf->list);
>>   
>> -	/* If there are more buffers to process then start their transfer. */
>> -	while (!list_empty(&dma->queue)) {
>> -		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer,
>> list);
>> -
>> -		if (ti_csi2rx_start_dma(ctx, buf)) {
>> -			dev_err(ctx->csi->dev,
>> -				"Failed to queue the next buffer for DMA\n");
>> -			vb2_buffer_done(&buf->vb.vb2_buf,
>> VB2_BUF_STATE_ERROR);
>> -		} else {
>> -			list_move_tail(&buf->list, &dma->submitted);
>> -		}
>> -	}
>> +	ti_csi2rx_dma_submit_pending(ctx);
>>   
>>   	if (list_empty(&dma->submitted))
>>   		dma->state = TI_CSI2RX_DMA_IDLE;
>> @@ -941,7 +951,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq,
>> unsigned int count)
>>   	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	struct ti_csi2rx_dma *dma = &ctx->dma;
>> -	struct ti_csi2rx_buffer *buf;
>>   	unsigned long flags;
>>   	int ret = 0;
>>   
>> @@ -980,16 +989,13 @@ static int ti_csi2rx_start_streaming(struct vb2_queue
>> *vq, unsigned int count)
>>   	ctx->sequence = 0;
>>   
>>   	spin_lock_irqsave(&dma->lock, flags);
>> -	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
>>   
>> -	ret = ti_csi2rx_start_dma(ctx, buf);
>> +	ret = ti_csi2rx_dma_submit_pending(ctx);
>>   	if (ret) {
>> -		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
>>   		spin_unlock_irqrestore(&dma->lock, flags);
>> -		goto err_pipeline;
>> +		goto err_dma;
>>   	}
>>   
>> -	list_move_tail(&buf->list, &dma->submitted);
>>   	dma->state = TI_CSI2RX_DMA_ACTIVE;
>>   	spin_unlock_irqrestore(&dma->lock, flags);
>>   
>> @@ -1004,7 +1010,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue
>> *vq, unsigned int count)
>>   
>>   err_dma:
>>   	ti_csi2rx_stop_dma(ctx);
>> -err_pipeline:
>>   	video_device_pipeline_stop(&ctx->vdev);
>>   	writel(0, csi->shim + SHIM_CNTL);
>>   	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));

