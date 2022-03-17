Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603EE4DC2F1
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 10:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbiCQJgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 05:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiCQJgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 05:36:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03E616BCE8
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 02:35:37 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 351F9493;
        Thu, 17 Mar 2022 10:35:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647509734;
        bh=Ktri54/MGhM0m1nqdBoL6n5Z1jUHnX+3IiosfvaJM8w=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=KE+Es84VknKSaYBMoMAXXEwcEzbUO6FfLLOxAehNgnKdfEtvj78RjcSfIW43xO60V
         PwI67TMAx6xFku5Oe7S0xuielyzqOiPCfNRrfOR+2otQ+lHtQ3YqMT7GSD2nbbYIY1
         ERbxnq+JNlYM2DKt9/iXoWv2AAquzd9hySpnQGhw=
Message-ID: <755a62aa-21bb-bb68-7acb-f411702bbc70@ideasonboard.com>
Date:   Thu, 17 Mar 2022 11:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 34/36] media: v4l2-subdev: Add
 v4l2_subdev_state_xlate_streams() helper
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-35-tomi.valkeinen@ideasonboard.com>
 <20220316112615.yaib5gokpxjslkur@uno.localdomain>
 <4735624b-5684-cea0-2cfd-d0ec8bb6ef16@ideasonboard.com>
In-Reply-To: <4735624b-5684-cea0-2cfd-d0ec8bb6ef16@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2022 11:27, Tomi Valkeinen wrote:
> On 16/03/2022 13:26, Jacopo Mondi wrote:
>> Hi Tomi,
>>
>> On Tue, Mar 01, 2022 at 06:11:54PM +0200, Tomi Valkeinen wrote:
>>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>> Add a helper function to translate streams between two pads of a subdev,
>>> using the subdev's internal routing table.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   drivers/media/v4l2-core/v4l2-subdev.c | 25 +++++++++++++++++++++++++
>>>   include/media/v4l2-subdev.h           | 23 +++++++++++++++++++++++
>>>   2 files changed, 48 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c 
>>> b/drivers/media/v4l2-core/v4l2-subdev.c
>>> index e30338a53088..6a9fc62dacbf 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -1529,6 +1529,31 @@ 
>>> v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state 
>>> *state,
>>>   }
>>>   EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
>>>
>>> +u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state 
>>> *state,
>>> +                    u32 pad0, u32 pad1, u64 *streams)
>>> +{
>>> +    const struct v4l2_subdev_krouting *routing = &state->routing;
>>> +    struct v4l2_subdev_route *route;
>>> +    u64 streams0 = 0;
>>> +    u64 streams1 = 0;
>>> +
>>> +    for_each_active_route(routing, route) {
>>> +        if (route->sink_pad == pad0 && route->source_pad == pad1 &&
>>> +            (*streams & BIT(route->sink_stream))) {
>>> +            streams0 |= BIT(route->sink_stream);
>>> +            streams1 |= BIT(route->source_stream);
>>> +        }
>>> +        if (route->source_pad == pad0 && route->sink_pad == pad1 &&
>>> +            (*streams & BIT(route->source_stream))) {
>>> +            streams0 |= BIT(route->source_stream);
>>> +            streams1 |= BIT(route->sink_stream);
>>> +        }
>>> +    }
>>> +
>>> +    *streams = streams0;
>>> +    return streams1;
>>
>> I'll probably learn how this is used later, but I found it hard to
>> immagine how the returned mask should be used.
>>
>> To a sink stream mask that contains multiple streams a source maks
>> with multiple entries will be associated
>>
>> In example, the sink stream mask might look lik
>>
>>          sink_stream_mask = {1, 0, 1, 0}
>>
>> So we are interested in translating stream 0 and 2
>> Assume 0->4 and 2->1 in the routing tabe, the resulting source stream
>> mask will be
>>
>>         source_stream_mask = {1, 0, 0, 1}
>>
>> How should the caller know what stream goes where ?
> 
> The use case for the function is for cases where all the streams go from 
> one pad to another. Probably the main use is in subdevs with a single 
> source and sink pad. This makes it easy to implement enable_streams() 
> op: you just basically call v4l2_subdev_state_xlate_streams() to get the 
> streams on the other side, and call v4l2_subdev_enable_streams(). Here's 
> a version from ub913:
> 
>> static int ub913_enable_streams(struct v4l2_subdev *sd,
>>                 struct v4l2_subdev_state *state, u32 pad,
>>                 u64 streams_mask)
>> {
>>     struct ub913_data *priv = sd_to_ub913(sd);
>>     struct media_pad *remote_pad;
>>     u64 sink_streams;
>>     int ret;
>>
>>     if (streams_mask & priv->enabled_source_streams)
>>         return -EALREADY;
>>
>>     sink_streams = v4l2_subdev_state_xlate_streams(
>>         state, UB913_PAD_SOURCE, UB913_PAD_SINK, &streams_mask);
>>
>>     remote_pad = media_entity_remote_pad(&priv->pads[UB913_PAD_SINK]);
>>
>>     ret = v4l2_subdev_enable_streams(priv->source_sd, remote_pad->index,
>>                      sink_streams);
>>     if (ret)
>>         return ret;
>>
>>     priv->enabled_source_streams |= streams_mask;
>>
>>     return 0;
>> }
> 
> 
> 
>>> +}
>>> +
>>>   int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct 
>>> v4l2_subdev_state *state,
>>>               struct v4l2_subdev_format *format)
>>>   {
>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>> index 1eced0f47296..992debe116ac 100644
>>> --- a/include/media/v4l2-subdev.h
>>> +++ b/include/media/v4l2-subdev.h
>>> @@ -1497,6 +1497,29 @@ struct v4l2_mbus_framefmt *
>>>   v4l2_subdev_state_get_opposite_stream_format(struct 
>>> v4l2_subdev_state *state,
>>>                            u32 pad, u32 stream);
>>>
>>> +/**
>>> + * v4l2_subdev_state_xlate_streams() - Translate streams from one 
>>> pad to another
>>
>> Could we stress out that pads are on the same entity and this is not
>> meant to translate over media links ? Is this necessary ?
> 
> The streams on both sides of a link are identical, so there can be no 
> translation in that case.
> 
> The doc below explains the use, I'd rather not try to squeeze in a 
> longer explanation in the title.
> 
> But I think we should emphasize that this only makes sense on a simple 
> routing case.

Ah, never mind. The function can be used in multi-pad cases too, so we 
don't need to emphasize the above.

The function tells how a set of streams from pad A translate to a set of 
streams on pad B. So you only know the set of streams, not how a single 
stream goes. For that you need to look at the routing table.

  Tomi
