Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6BEB5863D3
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 07:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiHAF63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 01:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbiHAF62 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 01:58:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5507810FE9
        for <linux-media@vger.kernel.org>; Sun, 31 Jul 2022 22:58:26 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BD2648F;
        Mon,  1 Aug 2022 07:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659333503;
        bh=zXpfWXX+3PLV0E3pPoElpTOrXU/tAwOHvhujfWgXX3E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Z9ERobLunQKdzPK6g1KgsFeMTy4z5uMNKkpfKAZRNIxN0AUo1kDLAsoPGPCyTIyAE
         kEWxc7H9bHnBYM6xFdO7x3SiNZJmsLZ8qquxuaRHkSQU4KZQhhEqEsaq7+K0MtP3Fu
         0g+VkQ5BLBjyJm/TSm5olsVkeH+a3RYb0vuZMiqI=
Message-ID: <43a24a93-2b7d-f05e-4400-31de91c2b87c@ideasonboard.com>
Date:   Mon, 1 Aug 2022 08:58:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v12 02/30] media: mc: entity: Add iterator helper for
 entity pads
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-3-tomi.valkeinen@ideasonboard.com>
 <YuUR7eCOv/mqtji5@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YuUR7eCOv/mqtji5@paasikivi.fi.intel.com>
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

On 30/07/2022 14:11, Sakari Ailus wrote:

>> @@ -203,12 +204,12 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>>   	if (mdev)
>>   		mutex_lock(&mdev->graph_mutex);
>>   
>> -	for (i = 0; i < num_pads; i++) {
>> -		pads[i].entity = entity;
>> -		pads[i].index = i;
>> +	media_entity_for_each_pad(entity, iter) {
>> +		iter->entity = entity;
>> +		iter->index = i++;
>>   		if (mdev)
>>   			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
>> -					&entity->pads[i].graph_obj);
>> +					&iter->graph_obj);
> 
> I know it was wrongly aligned but fixing it would be nice here.

Ok.

>>   	}
>>   
>>   	if (mdev)
>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>> index a9a1c0ec5d1c..6b6fea6a713e 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -315,6 +315,18 @@ struct media_entity {
>>   	} info;
>>   };
>>   
>> +/**
>> + * media_entity_for_each_pad - Iterate on all pads in an entity
>> + * @entity: The entity the pads belong to
>> + * @iter: The iterator pad
>> + *
>> + * Iterate on all pads in a media entity.
>> + */
>> +#define media_entity_for_each_pad(entity, iter)			\
>> +	for (iter = (entity)->pads;				\
>> +	     iter < &(entity)->pads[(entity)->num_pads];	\
>> +	     ++iter)
> 
> It'd be nice to align the backslashes.

They are aligned. But aligning with tabs can get messed up visually in 
patches as there's a +/- at the front of the line.

  Tomi
