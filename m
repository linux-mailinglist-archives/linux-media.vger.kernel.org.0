Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4FC6A6E8B
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 15:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbjCAOfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 09:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjCAOft (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 09:35:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E1030EAB
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 06:35:47 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6E7B890;
        Wed,  1 Mar 2023 15:35:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677681345;
        bh=tRJ70xWnvsfnc0NEW3fYSHagDucOZGT/ijRVW8ylhyM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OaE+A8Q7oSD4st9P80Ea7kNxX+VjWteTbc8GloJ/9D23fQtRsqDgQzWXQwnhUy9Fp
         a+78NVKTO7JhAHWPHyKJqT+5xu2FaTU0PVSTP2xyVLg7InCuRXTyu2a4DLlqLGvb9B
         ZIbzD2nXFezqpXjauUqm8CPE9TRhGReWahGbzORI=
Message-ID: <fe9c3c13-304c-91b8-d961-8a9309172d29@ideasonboard.com>
Date:   Wed, 1 Mar 2023 16:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] media: subdev: Split
 V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230228092346.101105-1-tomi.valkeinen@ideasonboard.com>
 <20230301103756.ynkivjauuqgpnanl@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230301103756.ynkivjauuqgpnanl@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/03/2023 12:37, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Tue, Feb 28, 2023 at 11:23:45AM +0200, Tomi Valkeinen wrote:
>> V4L2_SUBDEV_ROUTING_NO_STREAM_MIX routing validation flag means that all
>> routes from a sink pad must go to the same source pad and all routes
>> going to the same source pad must originate from the same sink pad.
>>
>> This does not cover all use cases. For example, if a device routes
>> all streams from a single sink pad to any of the source pads, but
>> streams from multiple sink pads can go to the same source pad, the
>> current flag is too restrictive.
>>
>> Split the flag into two parts, V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX
>> and V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX, which add the restriction
>> only on one side of the device. Together they mean the same as
>> V4L2_SUBDEV_ROUTING_NO_STREAM_MIX.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 17 +++++++++++++----
>>   include/media/v4l2-subdev.h           | 16 +++++++++++++---
>>   2 files changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index dff1d9be7841..bc3678337048 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1693,10 +1693,11 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>>   		}
>>
>>   		/*
>> -		 * V4L2_SUBDEV_ROUTING_NO_STREAM_MIX: Streams on the same pad
>> -		 * may not be routed to streams on different pads.
>> +		 * V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX: Streams on the same
>> +		 * sink pad may not be routed to streams on different source
> 
> nit: it was already like this, but as the flag checks for a condition
> that is forbidden I would use "Streams on the same sink pad -shall-
> not be routed to streams on -a- different source pad"

I'm fine with that. There were already other flags, so I'll change the 
wording for them too.

>> +		 * pads.
>>   		 */
>> -		if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
>> +		if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
>>   			if (remote_pads[route->sink_pad] != U32_MAX &&
>>   			    remote_pads[route->sink_pad] != route->source_pad) {
>>   				dev_dbg(sd->dev,
>> @@ -1705,6 +1706,15 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>>   				goto out;
>>   			}
>>
>> +			remote_pads[route->sink_pad] = route->source_pad;
>> +		}
>> +
>> +		/*
>> +		 * V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX: Streams on the same
>> +		 * source pad may not be routed to streams on different sink
>> +		 * pads.
>> +		 */
>> +		if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
>>   			if (remote_pads[route->source_pad] != U32_MAX &&
>>   			    remote_pads[route->source_pad] != route->sink_pad) {
>>   				dev_dbg(sd->dev,
>> @@ -1713,7 +1723,6 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>>   				goto out;
>>   			}
>>
>> -			remote_pads[route->sink_pad] = route->source_pad;
>>   			remote_pads[route->source_pad] = route->sink_pad;
>>   		}
>>
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 17773be4a4ee..a4331e0a5aeb 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1643,19 +1643,29 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
>>    * @V4L2_SUBDEV_ROUTING_NO_N_TO_1:
>>    *	multiple input streams may not be routed to the same output stream
>>    *	(stream merging)
>> - * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
>> - *	streams on the same pad may not be routed to streams on different pads
>> + * @V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX:
>> + *	streams on the same sink pad may not be routed to streams on different
>> + *	source pads
> 
> Same comment on s/may not/shall not/
> Up to you, really
> 
>> + * @V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX:
>> + *	streams on the same source pad may not be routed to streams on different
>> + *	sink pads
> 
> I would prefer the way it is described in the commit message:
> 
>          streams on the same source pad must originate from the same
>          sink pad

Hmm, yes... As the flags are negatives (_NO_), I tried to document them 
as negatives too. But perhaps it's clearer to use positive style in the 
docs.

Or how about "all streams on a source pad must originate from a single 
sink pad".

And for the sink side:

"all streams from a sink pad must be routed to a single source pad"

> 
>>    * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
>>    *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
>>    *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
>> + * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
>> + *	streams on the same pad may not be routed to streams on different pads
> 
>          streams on a pad shall all be routed to the same opposite pad

I think this would be better if it somehow emphasizes that it's both 
ways. But I can't come up with a good idea right now...

  Tomi

