Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2463639340E
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 18:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236172AbhE0Qfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 12:35:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41062 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235001AbhE0Qfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 12:35:32 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7079C163F;
        Thu, 27 May 2021 18:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622133238;
        bh=JNiMooTXBKSl5v6nyfIddEeAajEqSujVXlAIDDY4qvo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QJ/lqRvQzPfBKRTn1vU3mTsvd74/BBgPTfjP6mceyMhylp17H0uQ2x1RSXrYIz4dt
         E1ZP/9VLpt5Nj0FimXpbuS9CPhnQgwagYlGyN+vNtGULJsFOK6RBBIk91pMbWXyUTZ
         293ne5mdsaozdh9o2UfarwoqbTQWqxJTQX3nrfMg=
Subject: Re: [PATCH v3 38/38] media: ti-vpe: cal: add multiplexed streams
 support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-39-tomi.valkeinen@ideasonboard.com>
 <20210527160622.c4tumqkld2rrwbva@ti.com>
 <60f6ef13-31ba-9d1d-7a36-b9f344142465@ideasonboard.com>
 <YK/JLBWfEPXqUGqY@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <32487c88-b60c-3c6a-d164-7c3f587dbb4b@ideasonboard.com>
Date:   Thu, 27 May 2021 19:33:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YK/JLBWfEPXqUGqY@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/05/2021 19:30, Laurent Pinchart wrote:
> On Thu, May 27, 2021 at 07:10:42PM +0300, Tomi Valkeinen wrote:
>> On 27/05/2021 19:06, Pratyush Yadav wrote:
>>> On 24/05/21 02:09PM, Tomi Valkeinen wrote:
>>>> Add routing and stream_config support to CAL driver.
>>>>
>>>> Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
>>>> separate streams at the same time.
>>>>
>>>> Add 8 video device nodes, each representing a single dma-engine, and set
>>>> the number of source pads on camerarx to 8. Each video node can be
>>>> connected to any of the source pads on either of the camerarx instances
>>>> using media links. Camerarx internal routing is used to route the
>>>> incoming CSI-2 streams to one of the 8 source pads.
>>>>
>>>> CAL doesn't support transcoding, so the driver currently allows changes
>>>> only on the camerarx sink side, and then copies the sink pad config to
>>>> the source pad. This becomes slighly more complex with 8 source pads and
>>>> multiple streams on the sink pad. A helper,
>>>> cal_camerarx_get_opposite_stream_format(), is added, which uses the
>>>> routing table to get the format from the "opposite" side.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    drivers/media/platform/ti-vpe/cal-camerarx.c | 303 ++++++++++++++++---
>>>>    drivers/media/platform/ti-vpe/cal-video.c    | 103 ++++++-
>>>>    drivers/media/platform/ti-vpe/cal.c          |  34 ++-
>>>>    drivers/media/platform/ti-vpe/cal.h          |  12 +-
>>>>    4 files changed, 385 insertions(+), 67 deletions(-)
>>>>
>>> [...]
>>>> @@ -1178,18 +1177,33 @@ static int cal_probe(struct platform_device *pdev)
>>>>    	}
>>>>    
>>>>    	/* Create contexts. */
>>>> -	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
>>>> -		if (!cal->phy[i]->source_node)
>>>> -			continue;
>>>> +	if (!cal_mc_api) {
>>>> +		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
>>>> +			if (!cal->phy[i]->source_node)
>>>> +				continue;
>>>> +
>>>> +			cal->ctx[i] = cal_ctx_create(cal, i);
>>>> +			if (!cal->ctx[i]) {
>>>> +				cal_err(cal, "Failed to create context %u\n", i);
>>>> +				ret = -ENODEV;
>>>> +				goto error_context;
>>>> +			}
>>>>    
>>>> -		cal->ctx[i] = cal_ctx_create(cal, i);
>>>> -		if (!cal->ctx[i]) {
>>>> -			cal_err(cal, "Failed to create context %u\n", i);
>>>> -			ret = -ENODEV;
>>>> -			goto error_context;
>>>> +			cal->ctx[i]->phy = cal->phy[i];
>>>> +
>>>> +			cal->num_contexts++;
>>>>    		}
>>>> +	} else {
>>>> +		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
>>>> +			cal->ctx[i] = cal_ctx_create(cal, i);
>>>> +			if (!cal->ctx[i]) {
>>>> +				cal_err(cal, "Failed to create context %u\n", i);
>>>> +				ret = -ENODEV;
>>>> +				goto error_context;
>>>> +			}
>>>>    
>>>> -		cal->num_contexts++;
>>>> +			cal->num_contexts++;
>>>
>>> In cal_async_notifier_complete() I see:
>>>
>>>     for (i = 0; i < cal->num_contexts; i++)
>>>       ret = cal_ctx_v4l2_register();
>>>
>>> This means that if the CAL device has 8 DMA contexts it will create 8
>>> /dev/videoX nodes, even if the hardware setup is only capable of 1
>>> stream.
>>>
>>> Would it make more sense to populate /dev/videoX nodes based on the
>>> configured routing? So for example, if only one pad is being used to
>>> output, only create one node corresponding to that pad. If there are 3
>>> pads being populated then create 3 nodes and so on.
>>
>> Routing is a runtime configuration, so it could mean creating or
>> removing video nodes every time the user changes the routing. I believe
>> video nodes are supposed to be more permanent than that.
>>
>> If we knew that the HW setup can only ever have N routes, we could limit
>> the number of video nodes, but I don't think we have means to figure
>> that out.
> 
> And even if we did, I think that wouldn't help userspace. The media
> graph is meant to model the hardware topology, it's best to minimize the
> complexity on the kernel side and let userspace deal with routing
> configuration.

I think it's a valid question. Maybe a CSI-2 RX uses system DMA, and can 
support, say, 128 contexts. We probably don't want 128 video nodes (of 
which perhaps 1-4 are ever used). But in CAL's case, I think always 
having all the 8 video nodes is acceptable.

  Tomi
