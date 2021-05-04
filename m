Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B533725FB
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 08:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhEDGyo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 02:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbhEDGyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 02:54:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44910C061574
        for <linux-media@vger.kernel.org>; Mon,  3 May 2021 23:53:48 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9459D58E;
        Tue,  4 May 2021 08:53:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620111225;
        bh=KNPTj4me1gpq0KKKXKgkI9YyYN+G9oDWto4CFW22ZLE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=uvjZKslypLk7Fy8ZjdujOrwbVhce8hIHUZYIUPm1Kf4RvlNvJNdiAfBdSYg/db+HZ
         wyR+RHaNhb9Y3CVdrABzHdT4hHDP87j7GDUat6ciMXTEnBayDk8n8mT3ZSKiVkzOPl
         VwcknHWg4W5tuzC1fvz6MElLBZuJAcFLBi+pRhC0=
Subject: Re: [PATCH v6 12/24] media: entity: Add an iterator helper for
 connected pads
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
 <20210427124523.990938-13-tomi.valkeinen@ideasonboard.com>
 <YIoXkYXC+yN7tM1P@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <666ac625-c0f3-1513-be63-a03fbd293486@ideasonboard.com>
Date:   Tue, 4 May 2021 09:53:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIoXkYXC+yN7tM1P@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/04/2021 05:18, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Apr 27, 2021 at 03:45:11PM +0300, Tomi Valkeinen wrote:
>> Add a helper macro for iterating over pads that are connected through
>> enabled routes. This can be used to find all the connected pads within an
>> entity, for instance starting from the pad which has been obtained during
>> the graph walk.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>
>> - Make __media_entity_next_routed_pad() return NULL and adjust the
>>    iterator to handle that
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   include/media/media-entity.h | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>> index f8fa952fa38e..42193d6c58e9 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -916,6 +916,34 @@ __must_check int media_graph_walk_init(
>>   bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
>>   			    unsigned int pad1);
>>   
>> +static inline struct media_pad *__media_entity_next_routed_pad(
>> +	struct media_pad *start, struct media_pad *iter)
>> +{
>> +	struct media_entity *entity = start->entity;
>> +
>> +	for (; iter < &entity->pads[entity->num_pads]; iter++) {
>> +		if (media_entity_has_route(entity, start->index, iter->index))
>> +			return iter;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * media_entity_for_each_routed_pad - Iterate over entity pads connected by routes
>> + *
>> + * @start: The starting pad
>> + * @iter: The iterator pad
>> + *
>> + * Iterate over all pads connected through routes from the @start pad
>> + * within an entity. The iteration will include the @start pad itself.
>> + */
> 
> I still think a better name would be, well, better :-) Let's continue
> the discussion in the v5 thread to avoid splitting it.

I removed the inlining of __media_entity_next_routed_pad and renamed 
'start' to 'root'. If anyone has a better name idea, let's hear it =). 
But I think this at least removes the confusion of the parameter somehow 
defining the start pad.

  Tomi

>> +#define media_entity_for_each_routed_pad(start, iter)			\
>> +	for (iter = __media_entity_next_routed_pad(			\
>> +		     start, (start)->entity->pads);			\
>> +	     iter != NULL;						\
>> +	     iter = __media_entity_next_routed_pad(start, iter + 1))
>> +
>>   /**
>>    * media_graph_walk_cleanup - Release resources used by graph walk.
>>    *
> 

