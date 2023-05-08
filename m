Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDDC6FAFA3
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 14:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233184AbjEHMHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 08:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbjEHMHj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 08:07:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C06631EF4
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 05:07:37 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11576755;
        Mon,  8 May 2023 14:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683547649;
        bh=irPNjqbCQvTLmC8QV8q6VYnZ+P40B749u4zsLO4Qh8s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=iAQGJHllwQTFeeHUTlExIUOFiktCXFjenBdCVTfZuZ1LCNZLZ3O4FCp+cTCFYQZZ8
         ShKtnWHYNWdF6MyFijEZGWBs6sBWuzC0FUDr1FQOy+s/CYXXVoKI6A9WL4ywXoRYIL
         M53TO3B8PNwQdbdqMK3SBDblHUjxeQp/Pb4WDD+s=
Message-ID: <568aea8d-4173-218e-5315-6aa02bef8121@ideasonboard.com>
Date:   Mon, 8 May 2023 15:07:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 1/7] media: mc: Add INTERNAL_SOURCE pad type flag
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-2-sakari.ailus@linux.intel.com>
 <e41293d2-2b2b-1c3a-e3e9-1384369b1fcc@ideasonboard.com>
 <ZFjlQ9oKmjuLRf+4@kekkonen.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZFjlQ9oKmjuLRf+4@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/05/2023 15:04, Sakari Ailus wrote:
> Hi Tomi,
> 
> Thank you for the review.
> 
> On Mon, May 08, 2023 at 12:52:24PM +0300, Tomi Valkeinen wrote:
>> On 06/05/2023 00:52, Sakari Ailus wrote:
>>> Internal source pads will be used as routing endpoints in V4L2
>>> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
>>>
>>> Also prevent creating links to pads that have been flagged as internal.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>    .../userspace-api/media/mediactl/media-types.rst          | 7 +++++++
>>>    drivers/media/mc/mc-entity.c                              | 8 +++++++-
>>>    include/uapi/linux/media.h                                | 1 +
>>>    3 files changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
>>> index 0ffeece1e0c8..c724139ad46c 100644
>>> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
>>> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
>>> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
>>>    .. _MEDIA-PAD-FL-SINK:
>>>    .. _MEDIA-PAD-FL-SOURCE:
>>>    .. _MEDIA-PAD-FL-MUST-CONNECT:
>>> +.. _MEDIA-PAD-FL-INTERNAL-SOURCE:
>>>    .. flat-table:: Media pad flags
>>>        :header-rows:  0
>>> @@ -382,6 +383,12 @@ Types and flags used to represent the media graph elements
>>>    	  when this flag isn't set; the absence of the flag doesn't imply
>>>    	  there is none.
>>> +    *  -  ``MEDIA_PAD_FL_INTERNAL_SOURCE``
>>> +       -  This flag indicates an internal pad that has no external
>>> +	  connections. Such a pad may not be connected with a link. The internal
>>
>> "must not"? Or "shall not"?
> 
> I think "may not" is appropriate. I'd be fine with shall, too, albeit it
> wouldn't change the meaning in practice.

Ok. I don't speak standardize, and I'm not a native English speaker. But 
to me "may not be connected" sounds like it is possibly not connected, 
but also that it is possible for it to be connected.

  Tomi

