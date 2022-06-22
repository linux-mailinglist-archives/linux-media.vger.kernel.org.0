Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E440D554816
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240811AbiFVJkf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237574AbiFVJke (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:40:34 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6530E39B86
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:40:33 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id s1so22539209wra.9
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7mq9fxr6elbTazZuR+ozm0N4kV0+Ja1PblKExY6OgEc=;
        b=dOsBnO+SxpI6LbGU0hmJizI4+GfP8tSufHtg6juUrujSyfYm8iZY1+z0OuN30ChNAc
         6S5B7AJqYOU31U0YdlCPLEEAywg8ES+ZEKuYtr8LZ14f2//QqkAuu4LQyCpDl5sLmHh1
         106E6ceGixQxU5G5MOcXxVG5pya/6NUWxMIas7C/QbHal89P90SQxcQg3a5SWPxQMp2W
         wao1fV7sVeTDQ/iCUXklpM6sxVp2fuizRT73DtpoFEfuURm6n3k7nkiigxA5r4K1DKnk
         jXEF9afwjlJd/wRsGadeL1l4mawy7KIzeyu5oJKGqEAYEZSjK5wpMZeIMoPme77sOopl
         Z+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7mq9fxr6elbTazZuR+ozm0N4kV0+Ja1PblKExY6OgEc=;
        b=2kSf7EJ68DCqnvyuLbVJOxDShAQja1pBdcyD+t9ktnpVazlWMIiapzcBauG1rHKOWf
         nRNNqKABKvi3iuzQ+MV0AHN5Pc0v3egvw9OWq+ClBI1mOfRoK8onleBg7rVDinUT1r+W
         klYruQvPxf9pBVDg40LN++6pe7iu/B9t8l0upPRsfqHxn58+0cqvN28Uw0jwd8iWEKIx
         dfMAcjbApPKvO7t4qfdluG7LpUDuLjoI/AordKoXHZulvw/hPg5+BJ2lxvE8l4GAk1z/
         dB3kCVysQCnFbC3jskSsRpM7XD9U9ItDezM6XwTkHPWv73OoL/IMg/2ng8DfIXT/bA00
         ckhw==
X-Gm-Message-State: AJIora/ZYrq+ndT1zxvqcdzw470ezIRCyIYQk5iulLD/o3tnr5TspF+y
        ADKndrd4B0WoXVD3UFCCK6g=
X-Google-Smtp-Source: AGRyM1sWRDRipUr77H5Frsp+y8PxXVBiRtGua+rU1Swn2bFw6bbfJ9NAIrHUY88UULEh8cQ15Ibrlg==
X-Received: by 2002:adf:fb91:0:b0:21b:89b5:20 with SMTP id a17-20020adffb91000000b0021b89b50020mr2339676wrr.74.1655890831837;
        Wed, 22 Jun 2022 02:40:31 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm17919054wrj.6.2022.06.22.02.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 02:40:31 -0700 (PDT)
Message-ID: <5ee98dc7-6e9f-d993-8ec2-4931626c4efd@gmail.com>
Date:   Wed, 22 Jun 2022 10:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] media: media-entity.h: Add iterator for entity data
 links
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com
References: <20220621163457.766496-1-djrscally@gmail.com>
 <20220621163457.766496-2-djrscally@gmail.com>
 <20220622090859.xdmi5aldtqihgjve@uno.localdomain>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <20220622090859.xdmi5aldtqihgjve@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On 22/06/2022 10:08, Jacopo Mondi wrote:
> Hi Dan
>
> On Tue, Jun 21, 2022 at 05:34:56PM +0100, Daniel Scally wrote:
>> Iterating over the links for an entity is a somewhat common need
>> through the media subsystem, but generally the assumption is that
>> they will all be data links. To meet that assumption add a new macro
>> that iterates through an entity's links and skips non-data links.
> Do you foresee usages of a similar iterator but for ancillary (or
> interface) links ?
>
> In that case you could add a 'link_type' flag to
> __media_entity_next_data_link


Ooh this is a great idea - I'm not sure we'd need it for the ancillary
links right now but in the future when the flash gets linked then it
could crop up. I'll add the flag, thanks.

>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  include/media/media-entity.h | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>> index a9a1c0ec5d1c..b13f67f33508 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -550,6 +550,32 @@ static inline bool media_entity_enum_intersects(
>>  				 min(ent_enum1->idx_max, ent_enum2->idx_max));
>>  }
>>
>> +static inline struct media_link *
> Isn't this a bit too much for inlining ? Also I heard many times that
> it's not worth anymore trying to outsmart the compiler and inline is
> discouraged in most cases ? (and it kind of makes sense to me, but I
> sometimes wonder if that's some form of cargo cult..)


Probably - I'll move the function to media-entity.c instead.

>
>> +__media_entity_next_data_link(struct media_entity *entity,
>> +			      struct media_link *pos)
>> +{
>> +	if (!pos) {
>> +		list_for_each_entry(pos, &entity->links, list)
> nit: coding style requires you to have braces
>
> ------------------------------------------------------------------------------
> from Documentation/process/coding-style.rst:
> Also, use braces when a loop contains more than a single simple statement:
>
> .. code-block:: c
>
> 	while (condition) {
> 		if (test)
> 			do_something();
> 	}
> ------------------------------------------------------------------------------


Good point, thanks :)

>> +			if ((pos->flags & MEDIA_LNK_FL_LINK_TYPE) ==
>> +			    MEDIA_LNK_FL_DATA_LINK)
>> +				return pos;
>> +
>> +		return NULL;
>> +	}
>> +
>> +	list_for_each_entry_continue(pos, &entity->links, list)
>> +		if ((pos->flags & MEDIA_LNK_FL_LINK_TYPE) ==
>> +		    MEDIA_LNK_FL_DATA_LINK)
>> +			return pos;
>> +
>> +	return NULL;
> I wonder if the same could be achieved with list_for_each_entry_from() ?
>
> 	pos = pos ? list_next_entry(pos, list)
> 		  : list_first_entry(&entity->links, typeof(*pos), list);
>
>         list_for_each_entry_from(pos, ...) {
>                 if (...)
>                         return pos;
>
>         }
>
>         return NULL;
>
> If I'm not mistaken the two versions are functionally equivalent..


Yes that's much better - thanks!

>
> The iterator seems a good idea. Do you plan to use it for
> "media: rkisp1: Don't create data links for non-sensor subdevs" too,
> or changing the list of subdevs to iterate is enough there ?


No it's a slightly different problem there actually, I'm going to switch
that to the list of async subdevs in the same way the ipu3-cio2 works as
you suggested instead.


> Thanks
>    j
>
>> +}
>> +
>> +#define for_each_media_entity_data_link(entity, pos)		\
>> +	for (pos = __media_entity_next_data_link(entity, NULL);	\
>> +	     pos;						\
>> +	     pos = __media_entity_next_data_link(entity, pos))
>> +
>>  /**
>>   * gobj_to_entity - returns the struct &media_entity pointer from the
>>   *	@gobj contained on it.
>> --
>> 2.25.1
>>
