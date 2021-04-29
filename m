Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A91336E9F2
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 14:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhD2MFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 08:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhD2MFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 08:05:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6459C06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 05:04:43 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6D0DBC0;
        Thu, 29 Apr 2021 14:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619697880;
        bh=cmxY6r3bd0Rs23Ss5wBd7nL1y7zIrSIkE4dhXOA4kEw=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=cMOBi2is3nJ/QvmIEjmi3jwhXHACEuOipx2yTKbdbTcbQs6qojFznsvoCrIsRN62T
         2wd/2Qd+zZz8JuOgRF5UWn0d/MfJGTgD0BcWn2QSOTca701LW/brxSq8QGn/qx1boy
         BfGcTNG7G9girFoE6lsvgmQcTbMTtuKyWVukpQT8=
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-13-tomi.valkeinen@ideasonboard.com>
 <YHx4U8F/g8dTusc+@pendragon.ideasonboard.com>
 <20210420114825.GN3@paasikivi.fi.intel.com>
 <YIoM/E938uHWMDaJ@pendragon.ideasonboard.com>
 <20210429115614.GU3@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 12/24] media: entity: Add an iterator helper for
 connected pads
Message-ID: <a23d4695-5629-034a-c9a0-804533518b9e@ideasonboard.com>
Date:   Thu, 29 Apr 2021 15:04:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429115614.GU3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/04/2021 14:56, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Thu, Apr 29, 2021 at 04:33:48AM +0300, Laurent Pinchart wrote:
>> Hi Sakari,
>>
>> On Tue, Apr 20, 2021 at 02:48:25PM +0300, Sakari Ailus wrote:
>>> On Sun, Apr 18, 2021 at 09:20:03PM +0300, Laurent Pinchart wrote:
>>>> On Thu, Apr 15, 2021 at 04:04:38PM +0300, Tomi Valkeinen wrote:
>>>>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>>
>>>>> Add a helper macro for iterating over pads that are connected through
>>>>> enabled routes. This can be used to find all the connected pads within an
>>>>> entity, for instance starting from the pad which has been obtained during
>>>>> the graph walk.
>>>>>
>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>>>>
>>>>> - Make __media_entity_next_routed_pad() return NULL and adjust the
>>>>>    iterator to handle that
>>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>>> ---
>>>>>   include/media/media-entity.h | 27 +++++++++++++++++++++++++++
>>>>>   1 file changed, 27 insertions(+)
>>>>>
>>>>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>>>>> index 73de1c335e4e..edd6f60ed6b4 100644
>>>>> --- a/include/media/media-entity.h
>>>>> +++ b/include/media/media-entity.h
>>>>> @@ -916,6 +916,33 @@ __must_check int media_graph_walk_init(
>>>>>   bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
>>>>>   			    unsigned int pad1);
>>>>>   
>>>>> +static inline struct media_pad *__media_entity_next_routed_pad(
>>>>> +	struct media_pad *start, struct media_pad *iter)
>>>>> +{
>>>>> +	struct media_entity *entity = start->entity;
>>>>> +
>>>>> +	for (; iter < &entity->pads[entity->num_pads]; iter++)
>>>>> +		if (media_entity_has_route(entity, start->index, iter->index))
>>>>> +			return iter;
>>>>
>>>> I'd use curly braces.
>>>>
>>>>> +
>>>>> +	return NULL;
>>>>> +}
>>>>
>>>> Does this need to be inlined ?
>>>
>>> I guess it doesn't have to. It's used inside loops and it's rather small so
>>> I think it should be fine that way.
>>
>> It may not be that small. I'd rather let the compiler decide whether to
>> inline it or not.
> 
> Works for me.
> 
>>
>>>>> +
>>>>> +/**
>>>>> + * media_entity_for_each_routed_pad - Iterate over entity pads connected by routes
>>>>
>>>> "routed" sounds a bit weird. Would media_entity_for_each_connected_pad()
>>>> be a better name ?
>>>
>>> "Connected" is often used in context of links. We're dealing with routes
>>> here, so I thought "routed" is appropriate to avoid confusion.
>>
>> I understand the confusion, maybe we can find a better term that would
>> be different than "connected". "routed" really sounds weird in this
>> context.
> 
> I'm fine with connected.
> 
>>
>>>>> + *
>>>>> + * @start: The stating pad
>>>>
>>>> s/stating/starting/
>>>>
>>>>> + * @iter: The iterator pad
>>>>> + *
>>>>> + * Iterate over all pads connected through routes from a given pad
>>>>
>>>> "from the @start pad"
>>>>
>>>>> + * within an entity. The iteration will include the starting pad itself.
>>>>
>>>> s/starting/@start/
>>>>
>>>> I wonder if it wouldn't be more logical to not include the start pad.
>>>> That wouldn't match the current usage patterns, which would need to be
>>>> adapted accordingly, but I'm worried that including the start pad will
>>>> lead to annoying bugs in the future. Maybe I worry too much.
>>>
>>> The aim here is to find all pads that are routed to another pad within the
>>> same entity. If you remove the start pad, it becomes a task harder than
>>> difficult.
>>
>> Intuitively, "all pads that are routed to another pad" doesn't include
>> the "another pad". I'm not opposed to including the start pad as that's
>> what the current usage patterns need, but we should then rename the
>> macro accordingly as its current name is counter-intuitive.
> 
> I'm certainly not opposed to that. But it shouldn't be too much longer than
> what's already there.
> 
>>
>>>> And now that I reread the patch, I also wonder if "start" is a good
>>>> name, as it implies we start the enumeration from a given pad, while we
>>>> enumerate all pads connected to a given pad. I'm not sure what a better
>>>> name would be though, maybe just pad ?
>>>
>>> There are two pads here. Therefore explicitly calling them something else
>>> makes sense IMO.
>>
>> Makes sense, but "start" isn't a good name as we're not starting
>> anything.
> 
> "start" is not a verb here. It's where the iteration *starts*.

Hmm, no, the 'start' is a filter here, isn't it? The macro iterates over 
all pads which have a route to 'start'.

  Tomi
