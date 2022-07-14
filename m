Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5589D5745EF
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 09:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbiGNHlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 03:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbiGNHlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 03:41:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3701F63D
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 00:41:50 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96E34383;
        Thu, 14 Jul 2022 09:41:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657784507;
        bh=em/bMGsaOX31yNnh557XQk2+LkGPSsM2JwXAofXjg5o=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RrYtlgzCRw7PrWWIptb+KsTSJQ3mrBclo06jd1wfTzn2hZI1c7d0/SjaqDO0wD1Xr
         2eaO5/anQjSqVOmW4GshzZTIPkRKFgbPdwhGnOdUMaWGl6lPqEj0/LiB6MlqNFKZDN
         qE9Vkn27VX5rDIvFBWmncMjQTNq2fqzGKLSwkfeI=
Message-ID: <d1eb02fc-a5a9-7b19-64da-fdd719f3e342@ideasonboard.com>
Date:   Thu, 14 Jul 2022 10:41:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v11 34/36] media: v4l2-subdev: Add
 v4l2_subdev_state_xlate_streams() helper
Content-Language: en-US
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-35-tomi.valkeinen@ideasonboard.com>
 <Ysa1HZh5f38iXDHf@chromium.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Ysa1HZh5f38iXDHf@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 07/07/2022 13:27, Tomasz Figa wrote:
> Hi Tomi, Laurent,
> 
> On Tue, Mar 01, 2022 at 06:11:54PM +0200, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Add a helper function to translate streams between two pads of a subdev,
>> using the subdev's internal routing table.
>>
> 
> Thanks for the patch! Please see my comments inline.
> 
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 25 +++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 23 +++++++++++++++++++++++
>>   2 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index e30338a53088..6a9fc62dacbf 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1529,6 +1529,31 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
>>   
>> +u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
>> +				    u32 pad0, u32 pad1, u64 *streams)
>> +{
>> +	const struct v4l2_subdev_krouting *routing = &state->routing;
>> +	struct v4l2_subdev_route *route;
>> +	u64 streams0 = 0;
>> +	u64 streams1 = 0;
>> +
>> +	for_each_active_route(routing, route) {
>> +		if (route->sink_pad == pad0 && route->source_pad == pad1 &&
>> +		    (*streams & BIT(route->sink_stream))) {
>> +			streams0 |= BIT(route->sink_stream);
>> +			streams1 |= BIT(route->source_stream);
>> +		}
>> +		if (route->source_pad == pad0 && route->sink_pad == pad1 &&
>> +		    (*streams & BIT(route->source_stream))) {
>> +			streams0 |= BIT(route->source_stream);
>> +			streams1 |= BIT(route->sink_stream);
>> +		}
>> +	}
>> +
>> +	*streams = streams0;
>> +	return streams1;
>> +}
>> +
>>   int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>   			struct v4l2_subdev_format *format)
>>   {
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 1eced0f47296..992debe116ac 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1497,6 +1497,29 @@ struct v4l2_mbus_framefmt *
>>   v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>>   					     u32 pad, u32 stream);
>>   
>> +/**
>> + * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
>> + *
>> + * @state: Subdevice state
>> + * @pad0: The first pad
>> + * @pad1: The second pad
>> + * @streams: Streams bitmask on the first pad
>> + *
>> + * Streams on sink pads of a subdev are routed to source pads as expressed in
>> + * the subdev state routing table. Stream numbers don't necessarily match on
>> + * the sink and source side of a route. This function translates stream numbers
>> + * on @pad0, expressed as a bitmask in @streams, to the corresponding streams
>> + * on @pad1 using the routing table from the @state. It returns the stream mask
>> + * on @pad1, and updates @streams with the streams that have been found in the
>> + * routing table.
>> + *
>> + * @pad0 and @pad1 must be a sink and a source, in any order.
>> + *
>> + * Return: The bitmask of streams of @pad1 that are routed to @streams on @pad0.
> 
> It might be just me, but somehow I associate "translate" with turning a
> name from one namespace into a corresponding name from another
> namespace. In this case I initially assumed that this function is
> supposed to accept stream IDs from pad0 and return corresponding
> stream IDs from pad1. However, it looks like this is move like - "tell
> me which streams on pad1 are connected to the given pad0 streams". Is
> this correct?

So is your point that as the function returns a bitmask, and not a 
mapping of the stream IDs, this is not a translate function?

> If yes, maybe v4l2_subdev_state_get_routed_streams() be a better name?

I think this name would also fit quite well for a function that returns 
a mapping of the streams. So... I don't have a strong opinion on this. 
To me, neither the current name nor the proposed one clearly explains 
alone what the function does.

  Tomi
