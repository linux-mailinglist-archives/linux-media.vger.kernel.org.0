Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69F3231EF7
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 15:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgG2NFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 09:05:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57606 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgG2NFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 09:05:36 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFA7A31F;
        Wed, 29 Jul 2020 15:05:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596027933;
        bh=AzLKO77KWbr/8y6g0CVaDvlAnWmIwekxQCD79bHXYZ8=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OeVYuntPWPi1SVFEoOo2RZgSjA73mgmnQnFdX8aUCMkqsoNR+NPO5WT6V6/eWVEnX
         JOgMN5jZSaVWHf+zLh5/hWGbVUVMTd3M3K1jAx7ZEwxqLxTEQj+tvl1vBlXRuJPGmm
         JI8AwEsY9QVADsQE7cq+Bm/3XUEJV+xb+hM5We/8=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to use
 the same sensor
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
 <20200724121521.GA2705690@oden.dyn.berto.se>
 <20200724122104.GA18482@kaaira-HP-Pavilion-Notebook>
 <a6f4eabf-6cd5-950b-f2e3-853370c77629@ideasonboard.com>
 <2a6cb067-283d-ca65-2698-1fae66a17d02@collabora.com>
 <20200728113959.GA6350@kaaira-HP-Pavilion-Notebook>
 <3a9ac970-77b8-1bc5-536a-5b4f2bd60745@collabora.com>
 <b5fd3811-2f0e-7563-13fa-bb1e32189814@collabora.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <f2fc6d81-16a6-206b-6bb2-fb99d5a84f65@ideasonboard.com>
Date:   Wed, 29 Jul 2020 14:05:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b5fd3811-2f0e-7563-13fa-bb1e32189814@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 28/07/2020 15:00, Dafna Hirschfeld wrote:
> 
> 
> On 28.07.20 14:07, Dafna Hirschfeld wrote:
>> Hi
>>
>> On 28.07.20 13:39, Kaaira Gupta wrote:
>>> On Mon, Jul 27, 2020 at 02:54:30PM -0300, Helen Koike wrote:
>>>> Hi,
>>>>
>>>> On 7/27/20 11:31 AM, Kieran Bingham wrote:
>>>>> Hi all,
>>>>>
>>>>> +Dafna for the thread discussion, as she's missed from the to/cc list.
>>>>>
>>>>>
>>>>> On 24/07/2020 13:21, Kaaira Gupta wrote:
>>>>>> On Fri, Jul 24, 2020 at 02:15:21PM +0200, Niklas Söderlund wrote:
>>>>>> Hi,
>>>>>>
>>>>>>> Hi Kaaira,
>>>>>>>
>>>>>>> Thanks for your work.
>>>>>>
>>>>>> Thanks for yours :D
>>>>>>
>>>>>>>
>>>>>>> On 2020-07-24 17:32:10 +0530, Kaaira Gupta wrote:
>>>>>>>> This is version 2 of the patch series posted by Niklas for allowing
>>>>>>>> multiple streams in VIMC.
>>>>>>>> The original series can be found here:
>>>>>>>> https://patchwork.kernel.org/cover/10948831/
>>>>>>>>
>>>>>>>> This series adds support for two (or more) capture devices to be
>>>>>>>> connected to the same sensors and run simultaneously. Each
>>>>>>>> capture device
>>>>>>>> can be started and stopped independent of each other.
>>>>>>>>
>>>>>>>> Patch 1/3 and 2/3 deals with solving the issues that arises once
>>>>>>>> two
>>>>>>>> capture devices can be part of the same pipeline. While 3/3
>>>>>>>> allows for
>>>>>>>> two capture devices to be part of the same pipeline and thus
>>>>>>>> allows for
>>>>>>>> simultaneously use.
>>
>> I wonder if these two patches are enough, since each vimc entity also
>> have
>> a 'process_frame' callback, but only one allocated frame. That means
>> that the 'process_frame' can be called concurrently by two different
>> streams
>> on the same frame and cause corruption.
>>
> 
> I think we should somehow change the vimc-stream.c code so that we have
> only
> one stream process per pipe. So if one capture is already streaming,
> then the new
> capture that wants to stream uses the same thread so we don't have two
> threads
> both calling 'process_frame'.


Yes, I think it looks and sounds like there are two threads running when
there are two streams.

so in effect, although they 'share a pipe', aren't they in effect just
sending two separate buffers through their stream-path?

If that's the case, then I don't think there's any frame corruption,
because they would both have grabbed their own frame separately.


I don't think that's a good example of the hardware though, as that
doesn't reflect what 'should' happen where the TPG runs once to generate
a frame at the sensor, which is then read by both the debayer entity and
the RAW capture device when there are two streams...


So I suspect trying to move to a single thread is desirable, but that
might be a fair bit of work also.

--
Kieran



> The second capture that wants to stream should iterate the topology
> downwards until
> reaching an entity that already belong to the stream path of the other
> streaming capture
> and tell the streamer it wants to read the frames this entity
> produces.
> 
> Thanks,
> Dafna
> 
>> Thanks,
>> Dafna
>>
>>>>>>>
>>>>>>> I'm just curious if you are aware of this series? It would
>>>>>>> replace the
>>>>>>> need for 1/3 and 2/3 of this series right?
>>>>>>
>>>>>> v3 of this series replaces the need for 1/3, but not the current
>>>>>> version
>>>>>> (ie v4). v4 of patch 2/5 removes the stream_counter that is needed to
>>>>>> keep count of the calls to s_stream. Hence 1/3 becomes relevant
>>>>>> again.
>>>>>
>>>>> So the question really is, how do we best make use of the two current
>>>>> series, to achieve our goal of supporting multiple streams.
>>>>>
>>>>> Having not parsed Dafna's series yet, do we need to combine
>>>>> elements of
>>>>> both ? Or should we work towards starting with this series and get
>>>>> dafna's patches built on top ?
>>>>>
>>>>> Or should patch 1/3 and 3/3 of this series be on top of Dafna's v4 ?
>>>>>
>>>>> (It might be noteworthy to say that Kaaira has reported successful
>>>>> multiple stream operation from /this/ series and her development
>>>>> branch
>>>>> on libcamera).
>>>>
>>>> Dafna's patch seems still under discussion, but I don't want to
>>>> block progress in Vimc either.
>>>>
>>>> So I was wondering if we can move forward with Vimc support for
>>>> multistreaming,
>>>> without considering Dafna's patchset, and we can do the clean up
>>>> later once we solve that.
>>>>
>>>> What do you think?
>>>
>>> I agree with supporting multiple streams with VIMC with this patchset,
>>> and then we can refactor the counters for s_stream in VIMC later (over
>>> this series) if dafna includes them in subsequent version of her
>>> patchset.
>>>
>>
>> I also think that adding support in the code will take much longer and
>> should not
>> stop us from supporting vimc independently.
>>
>> Thanks,
>> Dafna
>>
>>>>
>>>> Regards,
>>>> Helen
>>>>
>>>>>
>>>>>
>>>>>>> 1. 
>>>>>>> https://lore.kernel.org/linux-media/20200522075522.6190-1-dafna.hirschfeld@collabora.com/
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Changes since v1:
>>>>>>>>     - All three patches rebased on latest media-tree.
>>>>>>>>     Patch 3:
>>>>>>>>     - Search for an entity with a non-NULL pipe instead of
>>>>>>>> searching
>>>>>>>>       for sensor. This terminates the search at output itself.
>>>>>>>>
>>>>>>>> Kaaira Gupta (3):
>>>>>>>>    media: vimc: Add usage count to subdevices
>>>>>>>>    media: vimc: Serialize vimc_streamer_s_stream()
>>>>>>>>    media: vimc: Join pipeline if one already exists
>>>>>>>>
>>>>>>>>   .../media/test-drivers/vimc/vimc-capture.c    | 35
>>>>>>>> ++++++++++++++++++-
>>>>>>>>   .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
>>>>>>>>   drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
>>>>>>>>   drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
>>>>>>>>   .../media/test-drivers/vimc/vimc-streamer.c   | 23 +++++++-----
>>>>>>>>   5 files changed, 73 insertions(+), 10 deletions(-)
>>>>>>>>
>>>>>>>> -- 
>>>>>>>> 2.17.1
>>>>>>>>
>>>>>>>
>>>>>>> -- 
>>>>>>> Regards,
>>>>>>> Niklas Söderlund
>>>>>

-- 
Regards
--
Kieran
