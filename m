Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B0739333B
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 18:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236293AbhE0QMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 12:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235603AbhE0QMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 12:12:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54B0C061574
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 09:10:45 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7633923E8;
        Thu, 27 May 2021 18:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622131843;
        bh=2FC2XJu+c0JFZAj9UBTapGhcoVTTGF7jrn0p5k9ojBw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=wdpD1P34177izmIR55coHR2kk5u+ZyqqGFeFPMEuUziPLCIJl4SBNNzDBGP+e9ue7
         3V4p9foDjkRqkWyizTzVumH1/emBM2XbvaHjMcDQpemCU5b4jsFDfgRsd2YFnEf7F6
         rxobf1em3I9Ms4JOmtTY9Kks7H2iwinCN4D2cBhk=
Subject: Re: [PATCH v3 38/38] media: ti-vpe: cal: add multiplexed streams
 support
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-39-tomi.valkeinen@ideasonboard.com>
 <20210527160622.c4tumqkld2rrwbva@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <60f6ef13-31ba-9d1d-7a36-b9f344142465@ideasonboard.com>
Date:   Thu, 27 May 2021 19:10:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527160622.c4tumqkld2rrwbva@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/05/2021 19:06, Pratyush Yadav wrote:
> Hi Tomi,
> 
> On 24/05/21 02:09PM, Tomi Valkeinen wrote:
>> Add routing and stream_config support to CAL driver.
>>
>> Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
>> separate streams at the same time.
>>
>> Add 8 video device nodes, each representing a single dma-engine, and set
>> the number of source pads on camerarx to 8. Each video node can be
>> connected to any of the source pads on either of the camerarx instances
>> using media links. Camerarx internal routing is used to route the
>> incoming CSI-2 streams to one of the 8 source pads.
>>
>> CAL doesn't support transcoding, so the driver currently allows changes
>> only on the camerarx sink side, and then copies the sink pad config to
>> the source pad. This becomes slighly more complex with 8 source pads and
>> multiple streams on the sink pad. A helper,
>> cal_camerarx_get_opposite_stream_format(), is added, which uses the
>> routing table to get the format from the "opposite" side.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal-camerarx.c | 303 ++++++++++++++++---
>>   drivers/media/platform/ti-vpe/cal-video.c    | 103 ++++++-
>>   drivers/media/platform/ti-vpe/cal.c          |  34 ++-
>>   drivers/media/platform/ti-vpe/cal.h          |  12 +-
>>   4 files changed, 385 insertions(+), 67 deletions(-)
>>
> [...]
>> @@ -1178,18 +1177,33 @@ static int cal_probe(struct platform_device *pdev)
>>   	}
>>   
>>   	/* Create contexts. */
>> -	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
>> -		if (!cal->phy[i]->source_node)
>> -			continue;
>> +	if (!cal_mc_api) {
>> +		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
>> +			if (!cal->phy[i]->source_node)
>> +				continue;
>> +
>> +			cal->ctx[i] = cal_ctx_create(cal, i);
>> +			if (!cal->ctx[i]) {
>> +				cal_err(cal, "Failed to create context %u\n", i);
>> +				ret = -ENODEV;
>> +				goto error_context;
>> +			}
>>   
>> -		cal->ctx[i] = cal_ctx_create(cal, i);
>> -		if (!cal->ctx[i]) {
>> -			cal_err(cal, "Failed to create context %u\n", i);
>> -			ret = -ENODEV;
>> -			goto error_context;
>> +			cal->ctx[i]->phy = cal->phy[i];
>> +
>> +			cal->num_contexts++;
>>   		}
>> +	} else {
>> +		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
>> +			cal->ctx[i] = cal_ctx_create(cal, i);
>> +			if (!cal->ctx[i]) {
>> +				cal_err(cal, "Failed to create context %u\n", i);
>> +				ret = -ENODEV;
>> +				goto error_context;
>> +			}
>>   
>> -		cal->num_contexts++;
>> +			cal->num_contexts++;
> 
> In cal_async_notifier_complete() I see:
> 
>    for (i = 0; i < cal->num_contexts; i++)
>      ret = cal_ctx_v4l2_register();
> 
> This means that if the CAL device has 8 DMA contexts it will create 8
> /dev/videoX nodes, even if the hardware setup is only capable of 1
> stream.
> 
> Would it make more sense to populate /dev/videoX nodes based on the
> configured routing? So for example, if only one pad is being used to
> output, only create one node corresponding to that pad. If there are 3
> pads being populated then create 3 nodes and so on.

Routing is a runtime configuration, so it could mean creating or 
removing video nodes every time the user changes the routing. I believe 
video nodes are supposed to be more permanent than that.

If we knew that the HW setup can only ever have N routes, we could limit 
the number of video nodes, but I don't think we have means to figure 
that out.

  Tomi
