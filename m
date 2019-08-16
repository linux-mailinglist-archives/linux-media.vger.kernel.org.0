Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 639B58FDD1
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 10:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfHPIbR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 04:31:17 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45917 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726596AbfHPIbQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 04:31:16 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id yXddh13qWzaKOyXdihlM1I; Fri, 16 Aug 2019 10:31:14 +0200
Subject: Re: [ANN] Topics for a media summit in Lyon in October
To:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
 <8f49d24c-9074-a988-2ba4-23f4cd2e6fcb@xs4all.nl>
 <CAAFQd5APVAkFHA6Pk7zGhn5rSZ=4vTS3PW2VxE+_+krr2RL34Q@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9adc0b1b-3e8b-348d-e28f-8523c08fa122@xs4all.nl>
Date:   Fri, 16 Aug 2019 10:31:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5APVAkFHA6Pk7zGhn5rSZ=4vTS3PW2VxE+_+krr2RL34Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOb0Fh9FHR9NoxMFAC4bsZ1GF8dmoSmap0V9T2rAxhHGkxV/G3MbIIZeVHTtiBkgbKX8oQaGTCipZHWtxfqPD4vh21w/oozs61TT2Oe29KNy5OTPo7bj
 RcBBAfBsz8RrVFKeBQDqZpfV6bvXRGFp/CVKHhl/8PSNqkE6dSR9v8RT5oLYdIIROmh9QR5fmXw3aRWgTtN0ccQrHpNvmWJCOS81lXWs82AyScGI1oqaByHd
 es84KI5tWH+49DXR1qk2en+Kg8MmTGEEkCfGKJ9Y5VuKqp6QS/UzLuvelTvxChmP1hCcf4D/Rv0VoWnwgBvxWLj1gG4T6/JVSnmzpKbkkpuFgZ3lSWBXq/Gm
 fTL5xEyT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/16/19 10:22 AM, Tomasz Figa wrote:
> On Fri, Aug 16, 2019 at 5:10 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 8/16/19 10:06 AM, Hans Verkuil wrote:
>>> Rather then discussing topics for a meeting under the subject 'Lisbon'
>>> let's start a new thread referring to the right place :-)
>>>
>>> I will try to organize a room, either during the ELCE or (if that doesn't
>>> work) perhaps on the Thursday afterwards. If that's going to be a problem
>>> for someone, please let me know.
>>>
>>> I do need to know how many people I can expect. I have the following
>>> confirmed attendees (and please reply if you are not listed!):
>>>
>>> Alexandre Courbot <acourbot@chromium.org>
>>> Tomasz Figa <tfiga@chromium.org>
>>> Jacopo Mondi <jacopo@jmondi.org>
>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Hans Verkuil <hverkuil@xs4all.nl>
>>>
>>> I know there were more who mentioned on irc that they would attend,
>>> but it is easier to keep track if I have it in an email.
>>>
>>> Topics posted under the previous thread:
>>>
>>> Tomasz:
>>>
>>> I would want to discuss various v4l2_buffer improvements, e.g.
>>> - DMA-buf import with plane offsets,
>>> - unifying the buffer structs for M and non-M formats,
>>> - ability to import different FDs with offsets for non-M formats if the
>>> layout matches driver expectations, etc.
>>>
>>> Besides that, I would be interested in the general idea on handling
>>> complex cameras in the Linux kernel in spite of the remaining V4L2
>>> limitations, e.g.
>>> - combinatorial explosion of /dev/video nodes,
>>> - significant ioctl overhead,
>>> - huge amount of historical legacy making the driver and userspace
>>> implementations overly difficult and prone to repetitive mistakes,
>>> - the above also limiting the flexibility of the API - formats, frame
>>> rates, etc. set using distinct APIs, not covered by Request API, with
>>> non-failure "negotiation hell", etc.
>>> - lack of fences, etc.
>>
>> Tomasz, I am not sure if this is suitable for a media summit: my feeling
>> is that this is much more suitable for a three day brainstorming session.
>>
>> My 'roadmap' was to get the codec support sorted first, then start working
>> on this.
> 
> I mostly dumped the topics I had in my head, leaving out the codecs as
> the obvious thing that people are already planning to talk about.
> 
> That said, there's been more interest in having proper Linux drivers
> for camera capture IFs and ISPs and also a lot of feedback about the
> issues I listed above. I'm afraid that if we don't start looking into
> them early enough, we're going to end up in the same state as with
> codecs where we're few years too late or even in the worst case just
> the interest fading away. :(

I agree that this shouldn't wait too long. And my view is that we should
start working on this later this year. I suspect that I should be able
to spend time on this in 1-2 months since it looks like the codec work
should be mostly complete by then.

Regards,

	Hans

> 
> I guess we could try to organize a separate session on another day for
> this, though. +Sakari Ailus who might be also interested in this.
> 
> Best regards,
> Tomasz
> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> Jacopo:
>>>
>>> Apart from discussing libcamera and hope we could kickstart a review of
>>> its API, I would like to re-start discussing multiplexed stream support,
>>> but that would require Sakari to be there, something I'm not certain
>>> about. Sakari?
>>>
>>> Alexandre:
>>>
>>> If Collabora/Bootlin is there, I'd certainly want to discuss stateless
>>> codecs, in particular m2m codec helpers and finalize the specification
>>> in general.
>>>
>>> Regards,
>>>
>>>       Hans
>>>
>>

