Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E7223CCC3
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 19:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgHERBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 13:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbgHERAT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 13:00:19 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA044C0F26C8;
        Wed,  5 Aug 2020 08:24:12 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id E7AA6292E4F
Subject: Re: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to use
 the same sensor
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kieran.bingham@ideasonboard.com,
        Kaaira Gupta <kgupta@es.iitr.ac.in>
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
 <f2fc6d81-16a6-206b-6bb2-fb99d5a84f65@ideasonboard.com>
 <cd1d18ef-d4ff-8240-e9dd-2d9f9c7c5a45@collabora.com>
 <a2ae2dba-6076-0abc-f620-9047a52b513c@ideasonboard.com>
 <5faeed28-75b2-48d8-4a48-c38418fd89f2@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <506b930a-8d34-f180-0ca2-51c21248b409@collabora.com>
Date:   Wed, 5 Aug 2020 12:18:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5faeed28-75b2-48d8-4a48-c38418fd89f2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/29/20 12:24 PM, Dafna Hirschfeld wrote:
> 
> 
> On 29.07.20 15:27, Kieran Bingham wrote:
>> Hi Dafna, Kaaira,
>>
>> On 29/07/2020 14:16, Dafna Hirschfeld wrote:
>>>
>>>
>>> On 29.07.20 15:05, Kieran Bingham wrote:
>>>> Hi Dafna,
>>>>
>>>> On 28/07/2020 15:00, Dafna Hirschfeld wrote:
>>>>>
>>>>>
>>>>> On 28.07.20 14:07, Dafna Hirschfeld wrote:
>>>>>> Hi
>>>>>>
>>>>>> On 28.07.20 13:39, Kaaira Gupta wrote:
>>>>>>> On Mon, Jul 27, 2020 at 02:54:30PM -0300, Helen Koike wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 7/27/20 11:31 AM, Kieran Bingham wrote:
>>>>>>>>> Hi all,
>>>>>>>>>
>>>>>>>>> +Dafna for the thread discussion, as she's missed from the to/cc
>>>>>>>>> list.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 24/07/2020 13:21, Kaaira Gupta wrote:
>>>>>>>>>> On Fri, Jul 24, 2020 at 02:15:21PM +0200, Niklas Söderlund wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>>> Hi Kaaira,
>>>>>>>>>>>
>>>>>>>>>>> Thanks for your work.
>>>>>>>>>>
>>>>>>>>>> Thanks for yours :D
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 2020-07-24 17:32:10 +0530, Kaaira Gupta wrote:
>>>>>>>>>>>> This is version 2 of the patch series posted by Niklas for
>>>>>>>>>>>> allowing
>>>>>>>>>>>> multiple streams in VIMC.
>>>>>>>>>>>> The original series can be found here:
>>>>>>>>>>>> https://patchwork.kernel.org/cover/10948831/
>>>>>>>>>>>>
>>>>>>>>>>>> This series adds support for two (or more) capture devices to be
>>>>>>>>>>>> connected to the same sensors and run simultaneously. Each
>>>>>>>>>>>> capture device
>>>>>>>>>>>> can be started and stopped independent of each other.
>>>>>>>>>>>>
>>>>>>>>>>>> Patch 1/3 and 2/3 deals with solving the issues that arises once
>>>>>>>>>>>> two
>>>>>>>>>>>> capture devices can be part of the same pipeline. While 3/3
>>>>>>>>>>>> allows for
>>>>>>>>>>>> two capture devices to be part of the same pipeline and thus
>>>>>>>>>>>> allows for
>>>>>>>>>>>> simultaneously use.
>>>>>>
>>>>>> I wonder if these two patches are enough, since each vimc entity also
>>>>>> have
>>>>>> a 'process_frame' callback, but only one allocated frame. That means
>>>>>> that the 'process_frame' can be called concurrently by two different
>>>>>> streams
>>>>>> on the same frame and cause corruption.
>>>>>>
>>>>>
>>>>> I think we should somehow change the vimc-stream.c code so that we have
>>>>> only
>>>>> one stream process per pipe. So if one capture is already streaming,
>>>>> then the new
>>>>> capture that wants to stream uses the same thread so we don't have two
>>>>> threads
>>>>> both calling 'process_frame'.
>>>>
>>>>
>>>> Yes, I think it looks and sounds like there are two threads running when
>>>> there are two streams.
>>>>
>>>> so in effect, although they 'share a pipe', aren't they in effect just
>>>> sending two separate buffers through their stream-path?
>>>>
>>>> If that's the case, then I don't think there's any frame corruption,
>>>> because they would both have grabbed their own frame separately.
>>>
>>> But each entity allocates just one buffer. So the same buffer is used for
>>> both stream.
>>
>> Aha, ok, I hadn't realised there was only a single buffer available in
>> the pipeline for each entity. Indeed there is a risk of corruption in
>> that case.
>>
>>> What for example can happen is that the debayer of one stream can read the
>>> sensor's buffer while the sensor itself writes to the buffer for the other
>>> stream.
>>
>>
>> So, In that case, we have currently got a scenario where each 'stream'
>> really is operating it's own pipe (even though all components are reused).
>>
>> Two questions:
>>
>> Is this acceptable, and we should just use a mutex to ensure the buffers
>> are not corrupted, but essentially each stream is a separate temporal
>> capture?
>>
>>
>> Or B:
>>
>> Should we refactor to make sure that there is a single thread, and the
>> code which calls process_frame on each entity should become aware of the
>> potential for multiple paths at the point of the sensor.
>>
>>
>> I suspect option B is really the 'right' path to take, but it is more
>> complicated of course.
> 
> I also think option B is preferable.

With this options we would force both stream to the
same frame rate, which I guess it make sense, since the sensor is producing frames
in a given pixel rate, the rest of the pipeline follows.

> 
> Maybe we can add a bool field 'is_streaming' to struct 'vimc_ent_device'
> The stream thread can do a BFS scan from the sensor up to the captures
> and call the 'process_frame' for each entity if 'is_streaming == true'.
> When a new capture wants to stream it sets 'is_streaming = true'
> on the entities on his streaming path.

I agree, we can have a BFS scan to build the array stream->ved_pipeline[]
in vimc_streamer_pipeline_init() with all the entities in the connected graph.

Or, if it is easier to implement, it doesn't need to be a BFS search, it could be one
pipe after the other from a join point, E.g.:

      /->e3->e4
e1->e2
      \->e5->e6

then ved_pipeline[] = [e1, e2, e3, e4, e5, e6]
Or ved_pipeline[] = [e1, e2, e5, e6, e3, e4]

Anyway would work.

Then you can check use_count (from patch 1/3)  to decide to call ".process_frame()" or not
on that entity.

So, if you start the stream on e4 only, you would have:
e1 - use_count = 1
e2 - use_count = 1
e3 - use_count = 1
e4 - use_count = 1
e5 - use_count = 0
e6 - use_count = 0

And if you start the stream on e6 later, all "use_count"s would be greater then 0,
so you just call .process_frame() when "use_count" > 0

You'll probably need to add a ".get_frame()" callback for each entity, and "process_frame()"
can call the "get_frame()" from the entity connected in its sink pad, so you don't need to
pass one frame from one entity to the next inside the thread as a parameter for .process_frame().

So I suggest:

- Refactor .process_frame to call .get_frame() from it's sink pad, instead of receiving the
frame as parameter (we are assuming we won't have an entity with more then one enabled sink pad).
- Update patch 1/3 to put the use_count on struct vimc_ent_device
- Update vimc_streamer_thread() to only call .process_frame() when use_count > 0
- Refactor vimc_streamer_pipeline_init() to build a proper ved_pipeline[] array with all the
entities in a pipe


What do you think?

Regards,
Helen

> 
> Thanks,
> Dafna
> 
> 
>>
>> -- 
>> Kieran
>>
>>
>>
>>
>>> Thanks,
>>> Dafna
>>>
>>>>
>>>>
>>>> I don't think that's a good example of the hardware though, as that
>>>> doesn't reflect what 'should' happen where the TPG runs once to generate
>>>> a frame at the sensor, which is then read by both the debayer entity and
>>>> the RAW capture device when there are two streams...
>>>>
>>>>
>>>> So I suspect trying to move to a single thread is desirable, but that
>>>> might be a fair bit of work also.
>>>>
>>>> -- 
>>>> Kieran
>>>>
>>>>
>>>>
>>>>> The second capture that wants to stream should iterate the topology
>>>>> downwards until
>>>>> reaching an entity that already belong to the stream path of the other
>>>>> streaming capture
>>>>> and tell the streamer it wants to read the frames this entity
>>>>> produces.
>>>>>
>>>>> Thanks,
>>>>> Dafna
>>>>>
>>>>>> Thanks,
>>>>>> Dafna
>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> I'm just curious if you are aware of this series? It would
>>>>>>>>>>> replace the
>>>>>>>>>>> need for 1/3 and 2/3 of this series right?
>>>>>>>>>>
>>>>>>>>>> v3 of this series replaces the need for 1/3, but not the current
>>>>>>>>>> version
>>>>>>>>>> (ie v4). v4 of patch 2/5 removes the stream_counter that is
>>>>>>>>>> needed to
>>>>>>>>>> keep count of the calls to s_stream. Hence 1/3 becomes relevant
>>>>>>>>>> again.
>>>>>>>>>
>>>>>>>>> So the question really is, how do we best make use of the two
>>>>>>>>> current
>>>>>>>>> series, to achieve our goal of supporting multiple streams.
>>>>>>>>>
>>>>>>>>> Having not parsed Dafna's series yet, do we need to combine
>>>>>>>>> elements of
>>>>>>>>> both ? Or should we work towards starting with this series and get
>>>>>>>>> dafna's patches built on top ?
>>>>>>>>>
>>>>>>>>> Or should patch 1/3 and 3/3 of this series be on top of Dafna's v4 ?
>>>>>>>>>
>>>>>>>>> (It might be noteworthy to say that Kaaira has reported successful
>>>>>>>>> multiple stream operation from /this/ series and her development
>>>>>>>>> branch
>>>>>>>>> on libcamera).
>>>>>>>>
>>>>>>>> Dafna's patch seems still under discussion, but I don't want to
>>>>>>>> block progress in Vimc either.
>>>>>>>>
>>>>>>>> So I was wondering if we can move forward with Vimc support for
>>>>>>>> multistreaming,
>>>>>>>> without considering Dafna's patchset, and we can do the clean up
>>>>>>>> later once we solve that.
>>>>>>>>
>>>>>>>> What do you think?
>>>>>>>
>>>>>>> I agree with supporting multiple streams with VIMC with this patchset,
>>>>>>> and then we can refactor the counters for s_stream in VIMC later (over
>>>>>>> this series) if dafna includes them in subsequent version of her
>>>>>>> patchset.
>>>>>>>
>>>>>>
>>>>>> I also think that adding support in the code will take much longer and
>>>>>> should not
>>>>>> stop us from supporting vimc independently.
>>>>>>
>>>>>> Thanks,
>>>>>> Dafna
>>>>>>
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Helen
>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>> 1.
>>>>>>>>>>> https://lore.kernel.org/linux-media/20200522075522.6190-1-dafna.hirschfeld@collabora.com/
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Changes since v1:
>>>>>>>>>>>>       - All three patches rebased on latest media-tree.
>>>>>>>>>>>>       Patch 3:
>>>>>>>>>>>>       - Search for an entity with a non-NULL pipe instead of
>>>>>>>>>>>> searching
>>>>>>>>>>>>         for sensor. This terminates the search at output itself.
>>>>>>>>>>>>
>>>>>>>>>>>> Kaaira Gupta (3):
>>>>>>>>>>>>      media: vimc: Add usage count to subdevices
>>>>>>>>>>>>      media: vimc: Serialize vimc_streamer_s_stream()
>>>>>>>>>>>>      media: vimc: Join pipeline if one already exists
>>>>>>>>>>>>
>>>>>>>>>>>>     .../media/test-drivers/vimc/vimc-capture.c    | 35
>>>>>>>>>>>> ++++++++++++++++++-
>>>>>>>>>>>>     .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
>>>>>>>>>>>>     drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
>>>>>>>>>>>>     drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
>>>>>>>>>>>>     .../media/test-drivers/vimc/vimc-streamer.c   | 23
>>>>>>>>>>>> +++++++-----
>>>>>>>>>>>>     5 files changed, 73 insertions(+), 10 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> -- 
>>>>>>>>>>>> 2.17.1
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> -- 
>>>>>>>>>>> Regards,
>>>>>>>>>>> Niklas Söderlund
>>>>>>>>>
>>>>
>>
