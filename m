Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED2B22F718
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 19:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgG0Ryj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 13:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbgG0Ryi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 13:54:38 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AEAC061794;
        Mon, 27 Jul 2020 10:54:38 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 5B00F263ACB
Subject: Re: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to use
 the same sensor
To:     kieran.bingham@ideasonboard.com,
        Kaaira Gupta <kgupta@es.iitr.ac.in>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
 <20200724121521.GA2705690@oden.dyn.berto.se>
 <20200724122104.GA18482@kaaira-HP-Pavilion-Notebook>
 <a6f4eabf-6cd5-950b-f2e3-853370c77629@ideasonboard.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <2a6cb067-283d-ca65-2698-1fae66a17d02@collabora.com>
Date:   Mon, 27 Jul 2020 14:54:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a6f4eabf-6cd5-950b-f2e3-853370c77629@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/27/20 11:31 AM, Kieran Bingham wrote:
> Hi all,
> 
> +Dafna for the thread discussion, as she's missed from the to/cc list.
> 
> 
> On 24/07/2020 13:21, Kaaira Gupta wrote:
>> On Fri, Jul 24, 2020 at 02:15:21PM +0200, Niklas Söderlund wrote:
>> Hi,
>>
>>> Hi Kaaira,
>>>
>>> Thanks for your work.
>>
>> Thanks for yours :D
>>
>>>
>>> On 2020-07-24 17:32:10 +0530, Kaaira Gupta wrote:
>>>> This is version 2 of the patch series posted by Niklas for allowing
>>>> multiple streams in VIMC.
>>>> The original series can be found here:
>>>> https://patchwork.kernel.org/cover/10948831/
>>>>
>>>> This series adds support for two (or more) capture devices to be 
>>>> connected to the same sensors and run simultaneously. Each capture device 
>>>> can be started and stopped independent of each other.
>>>>
>>>> Patch 1/3 and 2/3 deals with solving the issues that arises once two 
>>>> capture devices can be part of the same pipeline. While 3/3 allows for 
>>>> two capture devices to be part of the same pipeline and thus allows for 
>>>> simultaneously use.
>>>
>>> I'm just curious if you are aware of this series? It would replace the 
>>> need for 1/3 and 2/3 of this series right?
>>
>> v3 of this series replaces the need for 1/3, but not the current version
>> (ie v4). v4 of patch 2/5 removes the stream_counter that is needed to
>> keep count of the calls to s_stream. Hence 1/3 becomes relevant again.
> 
> So the question really is, how do we best make use of the two current
> series, to achieve our goal of supporting multiple streams.
> 
> Having not parsed Dafna's series yet, do we need to combine elements of
> both ? Or should we work towards starting with this series and get
> dafna's patches built on top ?
> 
> Or should patch 1/3 and 3/3 of this series be on top of Dafna's v4 ?
> 
> (It might be noteworthy to say that Kaaira has reported successful
> multiple stream operation from /this/ series and her development branch
> on libcamera).

Dafna's patch seems still under discussion, but I don't want to block progress in Vimc either.

So I was wondering if we can move forward with Vimc support for multistreaming,
without considering Dafna's patchset, and we can do the clean up later once we solve that.

What do you think?

Regards,
Helen

> 
> 
>>> 1.  https://lore.kernel.org/linux-media/20200522075522.6190-1-dafna.hirschfeld@collabora.com/
>>>
>>>>
>>>> Changes since v1:
>>>> 	- All three patches rebased on latest media-tree.
>>>> 	Patch 3:
>>>> 	- Search for an entity with a non-NULL pipe instead of searching
>>>> 	  for sensor. This terminates the search at output itself.
>>>>
>>>> Kaaira Gupta (3):
>>>>   media: vimc: Add usage count to subdevices
>>>>   media: vimc: Serialize vimc_streamer_s_stream()
>>>>   media: vimc: Join pipeline if one already exists
>>>>
>>>>  .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
>>>>  .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
>>>>  drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
>>>>  drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
>>>>  .../media/test-drivers/vimc/vimc-streamer.c   | 23 +++++++-----
>>>>  5 files changed, 73 insertions(+), 10 deletions(-)
>>>>
>>>> -- 
>>>> 2.17.1
>>>>
>>>
>>> -- 
>>> Regards,
>>> Niklas Söderlund
> 
