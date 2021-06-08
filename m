Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A4E39EFD1
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 09:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhFHHkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 03:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhFHHkA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 03:40:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D91C061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 00:38:08 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD6433E6;
        Tue,  8 Jun 2021 09:38:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623137886;
        bh=GV3YKDvS7RuAg87Co5RnqVg2HtnZoInCrVY3yXIO4yM=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=P2zstLaXU+BdPq9nhXREbRhF1I0zlurmok9vWkRDLzAwEgZKY1LO5Z7TcN7/BS7FV
         G0axgiDH45TUWCykThz9rH9whczO/5Uh+H9mUcJ4dpZPPdHNAQ2WFxqrSizlmpX4sU
         7LYIUoK80igwycGSdkB25/CyqSveQIjP0akQrXTA=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-33-tomi.valkeinen@ideasonboard.com>
 <YLozAqLmoKnHzQEi@pendragon.ideasonboard.com>
 <ca4c24d2-4edc-5ba4-970c-381195545a00@ideasonboard.com>
 <YL4iKZv5YV3LllIK@pendragon.ideasonboard.com>
 <b28c71d4-e7b1-2f21-530b-a108cfe0c337@ideasonboard.com>
 <YL5OpCAmfrMUibXq@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 32/38] media: ti-vpe: cal: use CSI-2 frame number
Message-ID: <d72d4f1e-19e1-8e9f-19da-469e88638653@ideasonboard.com>
Date:   Tue, 8 Jun 2021 10:38:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YL5OpCAmfrMUibXq@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/06/2021 19:51, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Mon, Jun 07, 2021 at 05:55:05PM +0300, Tomi Valkeinen wrote:
>> On 07/06/2021 16:42, Laurent Pinchart wrote:
>>> On Mon, Jun 07, 2021 at 03:39:45PM +0300, Tomi Valkeinen wrote:
>>>> On 04/06/2021 17:04, Laurent Pinchart wrote:
>>>>> On Mon, May 24, 2021 at 02:09:03PM +0300, Tomi Valkeinen wrote:
>>>>>> The driver fills buf->vb.sequence with an increasing number which is
>>>>>> incremented by the driver. This feels a bit pointless, as the userspace
>>>>>> could as well track that kind of number itself. Instead, lets use the
>>>>>
>>>>> s/lets/let's/
>>>>>
>>>>>> frame number provided in the CSI-2 data from the sensor.
>>>>>>
>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>> ---
>>>>>>     drivers/media/platform/ti-vpe/cal.c | 7 +++++--
>>>>>>     drivers/media/platform/ti-vpe/cal.h | 1 -
>>>>>>     2 files changed, 5 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>>>>>> index 888706187fd1..62c45add4efe 100644
>>>>>> --- a/drivers/media/platform/ti-vpe/cal.c
>>>>>> +++ b/drivers/media/platform/ti-vpe/cal.c
>>>>>> @@ -493,7 +493,6 @@ void cal_ctx_unprepare(struct cal_ctx *ctx)
>>>>>>     
>>>>>>     void cal_ctx_start(struct cal_ctx *ctx)
>>>>>>     {
>>>>>> -	ctx->sequence = 0;
>>>>>>     	ctx->dma.state = CAL_DMA_RUNNING;
>>>>>>     
>>>>>>     	/* Configure the CSI-2, pixel processing and write DMA contexts. */
>>>>>> @@ -586,6 +585,10 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
>>>>>>     static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
>>>>>>     {
>>>>>>     	struct cal_buffer *buf = NULL;
>>>>>> +	u32 frame_num;
>>>>>> +
>>>>>> +	frame_num = cal_read(ctx->cal, CAL_CSI2_STATUS(ctx->phy->instance,
>>>>>> +						       ctx->csi2_ctx)) & 0xffff;
>>>>>>     
>>>>>>     	spin_lock(&ctx->dma.lock);
>>>>>>     
>>>>>> @@ -607,7 +610,7 @@ static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
>>>>>>     	if (buf) {
>>>>>>     		buf->vb.vb2_buf.timestamp = ktime_get_ns();
>>>>>>     		buf->vb.field = ctx->v_fmt.fmt.pix.field;
>>>>>> -		buf->vb.sequence = ctx->sequence++;
>>>>>> +		buf->vb.sequence = frame_num;
>>>>>
>>>>> We'll need something a bit more complicated. The CSI-2 frame number is
>>>>> not mandatory, and when used, it is a 16-bit number starting at 1 and
>>>>> counting to an unspecified value larger than one, resetting to 1 at the
>>>>> end of the cycle. The V4L2 sequence number, on the other hand, is a
>>>>> monotonic counter starting at 0 and wrapping only at 2^32-1. We should
>>>>> thus keep a software sequence counter and
>>>>>
>>>>> - increase it by 1 if the frame number is zero
>>>>> - increase it by frame_num - last_frame_num (with wrap-around of
>>>>>      frame_num handled) otherwise
>>>>
>>>> Ok... I wonder if we need a new field for this, though. The problem I
>>>> was solving when I changed this to use the CSI-2 frame-number was how to
>>>> associate a pixel frame and a metadata frame.
>>>>
>>>> Their CSI-2 frame-numbers match (as they are from the same original
>>>> CSI-2 frame), so the userspace can use that to figure the matching
>>>> frames. While the above method you suggest should give us identical
>>>> sequence numbers for pixel and metadata, I think it's going a bit away
>>>> from my intended purpose, and possibly risks ending up with different
>>>> sequences for pixel and metadata.
>>>
>>> Why do you think they could get out of sync (assuming the sensor
>>> supports frame numbers of course, if it always returns 0, that's not
>>> usable for the purpose of synchronization).
>>
>> If there's a requirement that the sequence starts from 0, it doesn't
>> work, as the pixel and metadata video capture may be started at
>> different times. When pixel capture starts, the frame number could be 10
>> and pixel sequence would be 0, but when metadata capture starts, the
>> frame number could be 12, and pixel seq would thus be 2 and meta seq 0.
>>
>> But even if we allow the seq to start from the current frame number,
> 
> Good point. I think we can allow starting at a non-zero value to handle
> this.
> 
>> this doesn't work if the frame number has wrapped between starting the
>> pixel capture and starting the meta capture.
> 
> The timestamp should be enough to handle this, the timestamp difference
> between two wraparounds should be large enough to sync the two streams
> without any risk.

Well, this still won't work, as CAL doesn't know when the sensor's frame 
counter wraps. CAL can detect that the counter has wrapped, but it 
doesn't know if some frames were missed. This leads to the two streams 
getting out of sync.

I'll try to figure out if I can somehow handle the frame counter in a 
shared manner, so that multiple streams that originate from the same 
frame would always use the same sequence numbers for same frame numbers.

  Tomi
