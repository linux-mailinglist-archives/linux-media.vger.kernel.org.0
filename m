Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9198572C60
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 12:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfGXKe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 06:34:58 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:34543 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726070AbfGXKe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 06:34:58 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qEbeh3OofLqASqEbhhN3tW; Wed, 24 Jul 2019 12:34:56 +0200
Subject: Re: [RFC PATCH 0/5] Add enum_fmt flag for coded formats with dynamic
 resolution switching
To:     Maxime Jourdan <mjourdan@baylibre.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
 <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
 <3dc4d551-0628-5c74-c223-4afe64a701d8@xs4all.nl>
 <CAMO6nawAyxV=kK5PWOM2658DQqyoPZGYaSGbwfn6ReiDbOW1DQ@mail.gmail.com>
 <6450d9d6-70bf-6a8d-5f73-e4fe57557539@xs4all.nl>
 <CAMO6naxJDopbY6LA+J4Ts4KzPSyodaXWVjKWsB27Ntm13Daikw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0d38eaa1-7496-74ef-985c-86f7c489a4e7@xs4all.nl>
Date:   Wed, 24 Jul 2019 12:34:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMO6naxJDopbY6LA+J4Ts4KzPSyodaXWVjKWsB27Ntm13Daikw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJCbYDWhACLpWxOxmRJ5230RqlQiVZMUn4ktLlo1i7lbiB4HPUQY/tXiDt33fozWyc8ctXnD9QJS8Qx5yfoljUtMQjXLaVJv7mfZ6PM/6BfdeoaREfv/
 ER89TgAtdwsoSTPaepHQbyLnvCcX6b3+9GCLdO05pWBkeSev5lnks3iCvL2A1Rtqe7nHSRqTKdf6zNeojeNHpbLrscAyUf9+B8LioL8rl7YQms7cSpmAdyyr
 AZVYIUJxBELxqPHhxaaNuj1HEbt/hDNnofwdOIl1AzA0vpSXzSIfrrXhB2tUNowbk/nswVpWHQ+36kvMKeC02P1SNKa/UOVfsob/OT2kXHi1xhFIENW5cnTK
 dXryh9CTC6hOpPMM+o7qjhRgjs924H97lSseyWsJ/FGY3aOYfLM9rjeylxdrGwjxSfCkFAWBsjGOfbHeNrov4ITsaPW+cSPdSWn/yW29mrD1nfsWK8QQceoo
 uZoRCTdlzDrDyIZ31QiuGU/b914XttRCvWFghe3mVam3tQz04uomaJ89SvYxLhrh+EfQWcRZ7jVXms92Mc0aJCcw7suZKBmR4/0tfWefPsv+cNb/nbGKWwAQ
 RXHNSU72B54LidZBXpt9dVTh
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/24/19 12:32 PM, Maxime Jourdan wrote:
> On Thu, Jul 18, 2019 at 11:22 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 7/18/19 10:39 AM, Maxime Jourdan wrote:
>>> On Mon, Jul 15, 2019 at 2:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>
>>>> On 6/11/19 10:13 AM, Hans Verkuil wrote:
>>>>> On 6/9/19 4:38 PM, Maxime Jourdan wrote:
>>>>>> Hello,
>>>>>>
>>>>>> This RFC proposes a new format flag - V4L2_FMT_FLAG_DYN_RESOLUTION - used
>>>>>> to tag coded formats for which the device supports dynamic resolution
>>>>>> switching, via V4L2_EVENT_SOURCE_CHANGE.
>>>>>> This includes the initial "source change" where the device is able to
>>>>>> tell userspace about the coded resolution and the DPB size (which
>>>>>> sometimes translates to V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).
>>>>>
>>>>> Shouldn't the initial source change still be there? The amlogic decoder
>>>>> is capable of determining the resolution of the stream, right? It just
>>>>> can't handle mid-stream changes.
>>>>
>>>> I've been thinking about this a bit more: there are three different HW capabilities:
>>>>
>>>> 1) The hardware cannot parse the resolution at all and userspace has to tell it
>>>> via S_FMT.
>>>>
>>>> 2) The hardware can parse the initial resolution, but is not able to handle
>>>> mid-stream resolution changes.
>>>>
>>>> 3) The hardware can parse the initial resolution and all following mid-stream
>>>> resolution changes.
>>>>
>>>> We can consider 2 the default situation.
>>>>
>>>> In case of 1 the SOURCE_CHANGE event is absent and userspace cannot subscribe
>>>> to it. Question: do we want to flag this with the format as well? I.e. with a
>>>> V4L2_FMT_FLAG_MANUAL_RESOLUTION? I think just not implementing the SOURCE_CHANGE
>>>> event (and documenting this) is sufficient.
>>>>
>>>
>>> I think that not implementing SOURCE_CHANGE is sufficient as well. The
>>> issue (in my case), is that the amlogic decoder _does_ support the
>>> event (case 3) for anything recent (H264, HEVC, VP9), but not for e.g
>>> MPEG 1/2 (case 1).
>>>
>>> A possible solution would be to create 2 separate devices, one
>>> implementing the event, the other not. Do you think this is reasonable
>>> ? This would discard the need for all the proposed flags, unless there
>>> are other decoder drivers that fall in case 2.
>>
>> I don't think it is a good idea to create two device nodes, that's really
>> confusing. Instead I think we just need a V4L2_FMT_FLAG_MANUAL_RESOLUTION
>> flag.
>>
> 
> I guess I just feel bad about adding a flag (MANUAL_RESOLUTION) for
> what is basically a problem with one compression standard for one
> driver, with the root cause being bad firmware design. Then again I
> don't see a way around it, and case 1 & 2 are indeed two possibilities
> that need their own flag.
> 
> I'll prepare 2 new patch series if that is okay with you:
>  - DYN_RESOLUTION format flag updated series (in this current RFC,
> there are issues with the explanation of the flag in the doc)

Wait with this: I'm about to post a consolidated series with all
outstanding patches for codecs. That includes this series.

>  - Adding MANUAL_RESOLUTION format flag
> 
>> BTW, what happens if the application sets the format to e.g. 640x480 but
>> the MPEG file is a different resolution? Does the decoder fail to produce
>> anything? Or does it internally parse the resolution from the bitstream
>> and start decoding it? What if the bitstream resolution is larger than the
>> resolution set with S_FMT? Does it check for the buffer size?
>>
>> I just want to make sure it won't write past the end of the buffer.
>>
> 
> I tested this case a long while ago.The DMAs are programmed with the
> allocated VB2 buffers, so you get cropped pictures (and no DMA
> overflow).

Good to know.

Regards,

	Hans

> 
> 
>> Regards,
>>
>>         Hans
>>
>>>
>>>> In case of 3 the format sets the V4L2_FMT_FLAG_DYN_RESOLUTION flag.
>>>>
>>>> What do you think?
>>>>
>>>> Regards,
>>>>
>>>>         Hans

