Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C059076E30F
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 10:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbjHCI2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 04:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234392AbjHCI1t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 04:27:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B9246A9
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 01:24:52 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EBF95A4;
        Thu,  3 Aug 2023 10:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691051026;
        bh=hnoh3++U5eUz3cE41p5Kxix1F2sFCbAU6LX18GOQvps=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZnRAaMX89bqApLWKgcQ4y8YP/g2BJnNaBniqcAUJhk/yAgMbzaGGZV3D3w/DNwRc6
         9TJMySghXLauOOIY993Awqbwg2K98i0b3tOPLdA8Suk6m0qEv6Bahetin+HNK+vVyF
         iaK6IfORQ4c18NgSWJT+NmmGfe4puqAfp8NPCgIg=
Message-ID: <9f438329-3052-a9b3-d4c3-45e47e031b74@ideasonboard.com>
Date:   Thu, 3 Aug 2023 11:24:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/9] media: mc: Add INTERNAL pad flag
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
References: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
 <20230802214556.180589-4-sakari.ailus@linux.intel.com>
 <ff86ce95-f776-fc52-3e0e-9cfd64e87480@ideasonboard.com>
 <ZMtjH+eaCj1IwTYM@kekkonen.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZMtjH+eaCj1IwTYM@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/08/2023 11:19, Sakari Ailus wrote:
> Moi,
> 
> Thanks for the review.
> 
> On Thu, Aug 03, 2023 at 10:56:35AM +0300, Tomi Valkeinen wrote:
>> On 03/08/2023 00:45, Sakari Ailus wrote:
>>> Internal source pads will be used as routing endpoints in V4L2
>>> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
>>>
>>> Also prevent creating links to pads that have been flagged as internal.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>    Documentation/userspace-api/media/glossary.rst             | 6 ++++++
>>>    Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
>>>    drivers/media/mc/mc-entity.c                               | 6 +++++-
>>>    include/uapi/linux/media.h                                 | 1 +
>>>    4 files changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
>>> index 96a360edbf3b..f7b99a4527c7 100644
>>> --- a/Documentation/userspace-api/media/glossary.rst
>>> +++ b/Documentation/userspace-api/media/glossary.rst
>>> @@ -173,6 +173,12 @@ Glossary
>>>    	An integrated circuit that integrates all components of a computer
>>>    	or other electronic systems.
>>> +_media-glossary-stream:
>>> +    Stream
>>> +	A distinct flow of data (image data or metadata) over a media pipeline
>>> +	from source to sink. A source may be e.g. an image sensor and a sink
>>> +	e.g. a memory buffer.
>>> +
>>>        V4L2 API
>>>    	**V4L2 userspace API**
>>> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
>>> index 0ffeece1e0c8..28941da27790 100644
>>> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
>>> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
>>> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
>>>    .. _MEDIA-PAD-FL-SINK:
>>>    .. _MEDIA-PAD-FL-SOURCE:
>>>    .. _MEDIA-PAD-FL-MUST-CONNECT:
>>> +.. _MEDIA-PAD-FL-INTERNAL:
>>>    .. flat-table:: Media pad flags
>>>        :header-rows:  0
>>> @@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
>>>    	  when this flag isn't set; the absence of the flag doesn't imply
>>>    	  there is none.
>>> +    *  -  ``MEDIA_PAD_FL_INTERNAL``
>>> +       -  The internal flag indicates an internal pad that has no external
>>> +	  connections. Such a pad shall not be connected with a link. The
>>> +	  internal flag indicates that the :ref:``stream
>>> +	  <media-glossary-stream>`` either starts or ends in the entity.
>>>    One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
>>>    must be set for every pad.
>>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>>> index 4991281dcccc..03a9e0b8ebab 100644
>>> --- a/drivers/media/mc/mc-entity.c
>>> +++ b/drivers/media/mc/mc-entity.c
>>> @@ -1071,7 +1071,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
>>>    	for (i = 0; i < entity->num_pads; i++) {
>>>    		if ((entity->pads[i].flags &
>>> -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
>>> +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
>>> +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
>>>    			continue;
>>>    		if (entity->pads[i].sig_type == sig_type)
>>> @@ -1094,6 +1095,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
>>>    		return -EINVAL;
>>>    	if (WARN_ON(!(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE)))
>>>    		return -EINVAL;
>>> +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE &&
>>> +		    source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL))
>>> +		return -EINVAL;
>>
>> What does this check?
>>
>> Shouldn't we check here if either sink or source is INTERNAL, then fail?
> 
> We shouldn't have any source pads that have the internal flag set, that was
> the intention here (but you can drop the source flag check). Also both
> pads can't have the internal flag, I'll add that for v3.

The function is media_create_pad_link(), isn't that about creating links 
between entities? Internal pads shouldn't be allowed on either side.

  Tomi

