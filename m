Return-Path: <linux-media+bounces-8493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E58969B9
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28066B24CD3
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 08:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48776E610;
	Wed,  3 Apr 2024 08:56:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD0A54675
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712134619; cv=none; b=TMeVrFcsfY9kmGM+B6yrLbso23Q45J3CPUlbsXnorwlxeIr5+2Qv/1MMYWtixP5DTT8q0/CWtphNcg3eOre/JlHuLHg7tSD5jY8Szs9Wv55Zpk3IMpJR7QxqZLN6z+z30cVLZkDWNhKbC0lfkfHqIvuF8Tp7VKF+TZX2kJHTWAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712134619; c=relaxed/simple;
	bh=x9tzEw08Di6kClzoZ9+wCsddgdkfXznMM1pMDQmQnNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIFU4kHwdsZFGDZ7LTax8FFz1zNZF5+nBepIUlzB+qx1T8mWfnJZFwlKoh/YJhngmxsFg6DSisPzSOkcbK/7NJMcQ7R6Doyv/K7EVizsNbj/cTNN48Uh0VQKX1ZHQlHGP++Zz3XPmZXifM/5vkoj8noUV/lbkd7olghMFqbUFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84310C433F1;
	Wed,  3 Apr 2024 08:56:57 +0000 (UTC)
Message-ID: <96853248-ff15-4676-a428-69889740bec3@xs4all.nl>
Date: Wed, 3 Apr 2024 10:56:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4l-utils] [PATCH 1/8] utils: media-ctl: Print MUST_CONNECT pad
 flags
Content-Language: en-US, nl
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Gregor Jasny <gjasny@googlemail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
 <20240402000033.4007-2-laurent.pinchart@ideasonboard.com>
 <20240403084034.GA4168@pendragon.ideasonboard.com>
 <129d17fc-a26d-4b79-adef-f76b0e457c00@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <129d17fc-a26d-4b79-adef-f76b0e457c00@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2024 10:43, Tomi Valkeinen wrote:
> On 03/04/2024 11:40, Laurent Pinchart wrote:
>> Hi Sakari,
>>
>> Thank you for the patch.
>>
>> On Tue, Apr 02, 2024 at 03:00:26AM +0300, Laurent Pinchart wrote:
>>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>
>>> Print the MUST_CONNECT pad flag for each pad.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>   utils/media-ctl/media-ctl.c | 50 +++++++++++++++++++++----------------
>>>   1 file changed, 28 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
>>> index 2081f111f2db..1b40552253f1 100644
>>> --- a/utils/media-ctl/media-ctl.c
>>> +++ b/utils/media-ctl/media-ctl.c
>>> @@ -368,26 +368,6 @@ static const char *media_entity_subtype_to_string(unsigned type)
>>>       }
>>>   }
>>>   -static const char *media_pad_type_to_string(unsigned flag)
>>> -{
>>> -    static const struct {
>>> -        __u32 flag;
>>> -        const char *name;
>>> -    } flags[] = {
>>> -        { MEDIA_PAD_FL_SINK, "Sink" },
>>> -        { MEDIA_PAD_FL_SOURCE, "Source" },
>>> -    };
>>> -
>>> -    unsigned int i;
>>> -
>>> -    for (i = 0; i < ARRAY_SIZE(flags); i++) {
>>> -        if (flags[i].flag & flag)
>>> -            return flags[i].name;
>>> -    }
>>> -
>>> -    return "Unknown";
>>> -}
>>> -
>>>   static void media_print_topology_dot(struct media_device *media)
>>>   {
>>>       unsigned int nents = media_get_entities_count(media);
>>> @@ -525,6 +505,25 @@ static void media_print_pad_text(struct media_entity *entity,
>>>           v4l2_subdev_print_subdev_dv(entity);
>>>   }
>>>   +static unsigned int weight(uint32_t word)
>>> +{
>>> +    unsigned int w = 0, i;
>>> +
>>> +    for (i = 0; i < sizeof(word) << 3; i++, word >>= 1)
>>> +        w += word & 1U;
>>> +
>>> +    return w;
>>> +}
>>> +
>>> +static const char *comma(uint32_t flag, uint32_t prev_flags, uint32_t flags)
>>> +{
>>> +    static const char *empty = "", *comma = ", ";
>>> +    if (!(flag & flags))
>>> +        return empty;
>>> +
>>> +    return weight(prev_flags & flags) ? comma : empty;
>>
>> Unless I'm mistaken, we can write this
>>
>>     return prev_flags & flags ? comma : empty;
>>
>> and drop the weight function.
>>
>>> +}
>>> +
>>>   static void media_print_topology_text_entity(struct media_device *media,
>>>                            struct media_entity *entity)
>>>   {
>>> @@ -567,8 +566,15 @@ static void media_print_topology_text_entity(struct media_device *media,
>>>       for (j = 0; j < info->pads; j++) {
>>>           const struct media_pad *pad = media_entity_get_pad(entity, j);
>>>   -        printf("\tpad%u: %s\n", j, media_pad_type_to_string(pad->flags));
>>> -
>>> +        printf("\tpad%u: %s%s%s%s%s\n", j,
>>> +               pad->flags & MEDIA_PAD_FL_SINK ? "Sink" : "",
>>> +               comma(MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SINK,
>>> +                 pad->flags),
>>> +               pad->flags & MEDIA_PAD_FL_SOURCE ? "Source" : "",
>>> +               comma(MEDIA_PAD_FL_MUST_CONNECT,
>>> +                 MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE,
>>> +                 pad->flags),
>>> +               pad->flags & MEDIA_PAD_FL_MUST_CONNECT ? "Must connect" : "");
>>
>> To be honest, this looks overly complicated. How about printing the
>> flags with a loop ?
> 
> I was just about to reply that this looks a bit too "smart" to me... I'd prefer just a simple loop here for readability's and maintainability's sake, even if it's not as optimal.

Same comment from me :-)

Regards,

	Hans

