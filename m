Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C886A29FCD9
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 05:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgJ3E4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 00:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJ3E4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 00:56:10 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6DCC0613CF
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 21:56:10 -0700 (PDT)
Received: from [IPv6:2804:14c:483:7e3e::1005] (unknown [IPv6:2804:14c:483:7e3e::1005])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9DA411F4590E;
        Fri, 30 Oct 2020 04:56:06 +0000 (GMT)
Subject: Re: [PATCH 1/2] media: media.h: Add a pad flag MEDIA_PAD_FL_METADATA
To:     Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200325212704.29862-1-dafna.hirschfeld@collabora.com>
 <20200325212704.29862-2-dafna.hirschfeld@collabora.com>
 <20200325222621.GX19171@pendragon.ideasonboard.com>
 <CAJ1myNS5jdqCXAtueA_j+ULkiioDxhegfCLQWFXrvL6_AYPwFg@mail.gmail.com>
 <20200327080858.GB23713@kekkonen.localdomain>
 <CAJ1myNTT8NGNpSU10pwjd6wTES22g28dNFLwRPjrYkNsXd_D5w@mail.gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <8adfde83-3545-2fa1-af9b-bbf86d3383df@collabora.com>
Date:   Fri, 30 Oct 2020 01:56:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <CAJ1myNTT8NGNpSU10pwjd6wTES22g28dNFLwRPjrYkNsXd_D5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 3/30/20 9:42 AM, Dafna Hirschfeld wrote:
> On Fri, Mar 27, 2020 at 9:09 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
>>
>> Dafna, Laurent,
>>
>> On Thu, Mar 26, 2020 at 08:59:04AM +0100, Dafna Hirschfeld wrote:
>>> On Wed, Mar 25, 2020 at 11:26 PM Laurent Pinchart
>>> <laurent.pinchart@ideasonboard.com> wrote:
>>>>
>>>> Hi Dafna,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Wed, Mar 25, 2020 at 10:27:03PM +0100, Dafna Hirschfeld wrote:
>>>>> Add a flag to the flags field of 'struct media_pad_desc'
>>>>> that indicates that the data transmitted by the pad is
>>>>> metadata.
>>>>>
>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>> ---
>>>>>  Documentation/media/uapi/mediactl/media-types.rst | 4 ++++
>>>>>  include/uapi/linux/media.h                        | 1 +
>>>>>  2 files changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/media/uapi/mediactl/media-types.rst b/Documentation/media/uapi/mediactl/media-types.rst
>>>>> index 3af6a414b501..4ca902478971 100644
>>>>> --- a/Documentation/media/uapi/mediactl/media-types.rst
>>>>> +++ b/Documentation/media/uapi/mediactl/media-types.rst
>>>>> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
>>>>>  .. _MEDIA-PAD-FL-SINK:
>>>>>  .. _MEDIA-PAD-FL-SOURCE:
>>>>>  .. _MEDIA-PAD-FL-MUST-CONNECT:
>>>>> +.. _MEDIA-PAD-FL-METADATA:
>>>>>
>>>>>  .. flat-table:: Media pad flags
>>>>>      :header-rows:  0
>>>>> @@ -381,6 +382,9 @@ Types and flags used to represent the media graph elements
>>>>>         configuration dependent) for the pad to need enabled links even
>>>>>         when this flag isn't set; the absence of the flag doesn't imply
>>>>>         there is none.
>>>>> +    *  -  ``MEDIA_PAD_FL_METADATA``
>>>>> +       -  This flag indicates that the data transmitted by the pad is of
>>>>> +          type metadata.
>>>>>
>>>>>
>>>>>  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
>>>>> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
>>>>> index 383ac7b7d8f0..ae37226eb5c9 100644
>>>>> --- a/include/uapi/linux/media.h
>>>>> +++ b/include/uapi/linux/media.h
>>>>> @@ -210,6 +210,7 @@ struct media_entity_desc {
>>>>>  #define MEDIA_PAD_FL_SINK                    (1 << 0)
>>>>>  #define MEDIA_PAD_FL_SOURCE                  (1 << 1)
>>>>>  #define MEDIA_PAD_FL_MUST_CONNECT            (1 << 2)
>>>>> +#define MEDIA_PAD_FL_METADATA                        (1 << 3)
>>>>
>>>> I think we need to reserve a few bits here. We'll have more than
>>>> metadata. Audio comes to mind, there will likely be more. Having
>>>> independent flags would not only waste a bit of space in the bitfield
>>>> (not that we're about to run out of bits, but still), but would make it
>>>> possible to specify invalid configurations such as MEDIA_PAD_FL_METADATA
>>>> | MEDIA_PAD_FL_AUDIO. And now that I've written this, I realize that
>>>> audio metadata could be a thing, so maybe a metadata flag is actually
>>>> the best option :-)
>>> hehe, ok, but drivers that set the METADATA flag should also set the media
>>> bus code to MEDIA_BUS_FMT_FIXED ? If yes then setting
>>> the METADATA flag with a different media bus is also an invalid configuration.
>>
>> That may be currently the case, but not all non-image data (metadata in
>> practice) will be using MEDIA_BUS_FMT_FIXED, for instance sensor embedded
>> data when we support that in upstream.
>>
>> Note that whether metadata flows over a pad is dynamic configuration. I
>> wonder if it is useful to tell this to the user, as the user, in many
>> cases, will be making the configuration affecting this. There definitely
> 
> Hi, you mean that there might be pads that can either support metadata
> or non-metadata?
> Currently there is no media bus for METDATA so with the flag userspace
> knows it is metadata.

Maybe this is a silly question, but why do we need a flag in the pads to
indicate metadata if we have mbus code MEDIA_BUS_FMT_METADATA_FIXED for this?
Aren't we adding redundant information?

Regards,
Helen

> 
>> are devices where this configuration would be static, but many of those
>> cases (ISPs in particular) have DMAs (i.e. video nodes) directly connected
>> over a link, where you'll find this information on the video node.
> 
>>
>> --
>> Regards,
>>
>> Sakari Ailus
> 
