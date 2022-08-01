Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485E95866E1
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 11:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiHAJdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 05:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiHAJdi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 05:33:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B41D31918
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 02:33:38 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 146032F3;
        Mon,  1 Aug 2022 11:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659346415;
        bh=YeDOveCjGHuKStYWY//faIB3d1rAxodYc1HEIrwJT7I=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JNwgQtbWGpjX5Wf2ayJHTl95gielxRHXtWaT5rWZ/2e1iyBHK5r3uS1zRocYTf3YH
         aIo17SDxyN+PgYvFYCWHE4ZKRScqYD1uQEhgEKKt6s6u3ow3npfHCSJWDhr+mmuGCs
         YPvKd2gYcc9TG916lP0WBGQ9iFIWT9gL7VYVJhhI=
Message-ID: <36d40a28-687b-4756-ee25-812fc86421a4@ideasonboard.com>
Date:   Mon, 1 Aug 2022 12:33:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [EXT] Re: [EXT] Re: [EXT] [PATCH v12 09/30] media: mc: entity:
 Rewrite media_pipeline_start() to support routes
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Satish Nagireddy <satish.nagireddy@getcruise.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-10-tomi.valkeinen@ideasonboard.com>
 <CAG0LG94ADymN_R0Mw0hSf-M0nwUcWW_Xtr8gLM=wsqdH7Ep2Wg@mail.gmail.com>
 <438685f9-1a18-31c3-ffbc-15e87ef7493d@ideasonboard.com>
 <CAG0LG94AUCng800b6GxaYcATdSJRKHiVdz8wrT83cLMDC0XOtg@mail.gmail.com>
 <ce6f1e9a-21d2-cb89-87fd-1ec09ee95c4f@ideasonboard.com>
 <CAG0LG96dncADM65ids6VMU=ym-j55fws6NOwLQM=or7pN4-d-g@mail.gmail.com>
 <47c925b2-2fa2-ce0b-0d43-5fc8fb048338@ideasonboard.com>
 <YuUcXJD/EXIumPac@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YuUcXJD/EXIumPac@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/07/2022 14:56, Sakari Ailus wrote:
> Moi,
> 
> On Fri, Jul 29, 2022 at 08:07:19PM +0300, Tomi Valkeinen wrote:
>> On 29/07/2022 20:00, Satish Nagireddy wrote:
>>> On Fri, Jul 29, 2022 at 3:27 AM Tomi Valkeinen
>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>>
>>>> On 29/07/2022 12:19, Satish Nagireddy wrote:
>>>>> On Fri, Jul 29, 2022 at 1:53 AM Tomi Valkeinen
>>>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>>>>
>>>>>> On 29/07/2022 11:45, Satish Nagireddy wrote:
>>>>>>
>>>>>>>> @@ -1011,7 +1342,7 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
>>>>>>>>
>>>>>>>>      struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
>>>>>>>>      {
>>>>>>>> -       return entity->pipe;
>>>>>>>> +       return entity->pads->pipe;
>>>>>>>
>>>>>>> I am not sure If it is always safe to return the pipe associated with
>>>>>>> the first pad. I think this will work with all the existing drivers.
>>>>>>> Let's say If pads of an entity are associated with different pipes,
>>>>>>> this function might require extending the support of returning
>>>>>>> pipe based on pad index. Please let me know your opinion.
>>>>>>
>>>>>> That's true. The kdoc for this function says:
>>>>>>
>>>>>>      * In general, entities can be part of multiple pipelines, when carrying
>>>>>>      * multiple streams (either on different pads, or on the same pad using
>>>>>>      * multiplexed streams). This function is ill-defined in that case. It
>>>>>>      * currently returns the pipeline associated with the first pad of the
>>>>>> entity.
>>>>>>
>>>>>> I did consider adding a warning if the function is called for entities
>>>>>> with more than one pad. But that probably would give false warnings,
>>>>>> e.g. for a simple entity with one sink and one source pad. In that case
>>>>>> both pads are always part of the same pipeline, and
>>>>>> media_entity_pipeline() works correctly.
>>>>>>
>>>>>> We could perhaps add a check here which verifies that all the pads in
>>>>>> the entity have the same pipe.
>>>>
>>>> Perhaps something like:
>>>>
>>>> struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
>>>> {
>>>>           struct media_pipeline *pipe;
>>>>           struct media_pad *pad;
>>>>
>>>>           if (entity->num_pads == 0)
>>>>                   return NULL;
>>>>
>>>>           pipe = entity->pads->pipe;
>>>>
>>>>           media_entity_for_each_pad(entity, pad) {
>>>>                   if (WARN_ON(pad->pipe != pipe))
>>>>                           return NULL;
>>>>           }
>>>>
>>>>           return pipe;
>>>> }
>>>
>>> The above code means that we do not support multiple pipelines per
>>> entity. Or leave the implementation as is now and
>>> this can be done as a different patch later, I will leave it to you.
>>> He is what I'm thinking, assuming that every media_pad has it's own pipe.
>>>
>>> struct media_pipeline *media_entity_pipeline(struct media_entity
>>> *entity, u32 pad_index)
>>> {
>>>            if (pad_index >= entity->num_pads)
>>>                    return NULL;
>>>
>>>            return entity->pads[pad_index].pipe;
>>> }
>>
>> Oh, I see now where the confusion is.
>>
>> media_entity_pipeline() is a convenience helper for the currently existing
>> drivers. They access entity->pipe directly (or when we move the pipe to pad,
>> entity->pads->pipe). So this function is just refactoring the direct access
>> away from the drivers, which makes it easier in the future to find those
>> drivers accessing the pipe, or change where the pipe is stored without doing
>> any changes to the drivers.
>>
>> A driver which supports streams should not use this function, as there's no
>> "pipe for entity". We seem to be missing a similar helper function for these
>> cases, media_pad_pipeline() or such. We can add when needed.
> 
> I think this could be done now, for consistency. Either the existing
> drivers could call it on entity->pads, thus assuming they only use a single
> pipeline for that entity. Or keep media_entity_pipeline(), but there's some
> chance for confusion on where the pipeline is bound. At least there should
> be a warning it's just for old existing drivers.
> 

I clarified in the kdoc that media_entity_pipeline() is only to be used 
by drivers that do not support multiple pipelines, and I added 
media_pad_pipeline().

  Tomi

