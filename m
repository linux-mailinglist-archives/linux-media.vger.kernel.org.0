Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75DD211557
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 10:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfEBIZf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 04:25:35 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42181 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725944AbfEBIZe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 04:25:34 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud9.xs4all.net with ESMTPA
        id M71yhvqSoNExlM722hmN6H; Thu, 02 May 2019 10:25:31 +0200
Subject: Re: [PATCH 00/20] drm: Split out the formats API and move it to a
 common place
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
References: <cover.8ec406bf8f4f097e9dc909d5aac466556822f592.1555487650.git-series.maxime.ripard@bootlin.com>
 <20190417154121.GJ13337@phenom.ffwll.local>
 <20190418062229.eyog4i62eg4pr6uf@flea>
 <CAKMK7uHwSjqXwWGt+wQ6oMFWoPqmBxYHL7r+vTOXdYt9KMCYLQ@mail.gmail.com>
 <20190418090221.e57dogn4yx5nwdni@flea>
 <CAKMK7uHN6QfYyzx4DjRT+7VLRi6N9DorQtw2GoDiNGTgie=DXA@mail.gmail.com>
 <20190418120143.4x7bvhgkh23mgsup@flea>
 <CAKMK7uFRptrYGScX-Ogxhanw6=6Q9Mf22axpafwceMybfYjBKQ@mail.gmail.com>
 <20190418205630.6i7cvfmtoyq5uhvl@flea>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <df496d32-a046-fce4-0124-8fd66d7dd478@xs4all.nl>
Date:   Thu, 2 May 2019 10:25:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418205630.6i7cvfmtoyq5uhvl@flea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHl0ctbsoEaBl266WpLrPWnha5iV1O7Z/F1zBlHoTqACvSHxaYWrE1f5/1AFYVwpx8xnAMk9rtnE5FhOXz1gaTT2qqRsXSkIlbB+FbYoZpJ8koU126sU
 CLLfMVuQMLPTIUf1iJ2OCxj9i6KMAEA350Q2bx32l7MhmeQ/P2YSBKWbefwcvnE/YjzDcpR2au+lSnIETb4Wbk3E7LnXQuyQTQV+xoSr/2+awXadCHIIz2Dl
 0Av2VTPzvUdfzbxw1C7MswI+FgcWXhMC/0W+AJnjl/NQwYSy/S3IkzyzgNL2N6DF6cGs/QuVW7Mv89TiMSjxKCPAfu5Uhgzh7WixSYCRLoerCgePI6bWpgZM
 cCl57jWwpz6sBUgCkudGIOk8sXp8hVB9Ym65hKaSaq8SXoBJpcx0CwIoasWCN67nb56C4NNJa62MGtMwqWnooRuRRV5WXgk3TglhwAmWrZboMDwiYEmuVACr
 PeZPQ0Y2muz8TXaBGlGb/W5QxgNbt52P3TBHmdDg+xBjs2KVdS8SIHShK1XBOwMGPoWYoz+NzvpSktfBOQuTSZJ3eE92XD7w38b+/eMN0M6hzheB2H38nrcM
 TMivP48VUTFOu2+3Cetl9LFdIzBEKsk6oDvQ5+1vuJV0UfDuMnfrLAgyIwuzvMSt7dwfD1oL26dJ1rswnJDbtTCRz0tEgxJoqRyARqLqRKfkTqr0kA1Asg3S
 mFj9xrhy6jVKL3x/Sdjf9bfkk2njFNcw+azNFTD8VgNU8Gf6mc1EPA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

Apologies for the late reply, most if this thread happened when I was on
vacation, and I missed that I should reply to it. Thank you for reminding
me.

Please let me know if I should reply to other mails in the discussion of
this patch series.

On 4/18/19 10:56 PM, Maxime Ripard wrote:
> On Thu, Apr 18, 2019 at 02:32:14PM +0200, Daniel Vetter wrote:
>>>>>> Unifying the formats themselves, and all the associated metadata is
>>>>>> imo a no-go, and was a pretty conscious decision when we implemented
>>>>>> drm_fourcc a few years back.
>>>>>>
>>>>>>> If we want to keep the current library in DRM, we have two options
>>>>>>> then:
>>>>>>>
>>>>>>>   - Support all the v4l2 formats in the DRM library, which is
>>>>>>>     essentially what I'm doing in the last patches. However, that
>>>>>>>     would require to have the v4l2 developpers also reviewing stuff
>>>>>>>     there. And given how busy they are, I cannot really see how that
>>>>>>>     would work.
>>>>>>
>>>>>> Well, if we end up with a common library then yes we need cross
>>>>>> review. There's no way around that. Doesn't matter where exactly that
>>>>>> library is in the filesystem tree, and adding a special MAINTAINERS
>>>>>> entry for anything related to fourcc (both drm and v4l) to make sure
>>>>>> they get cross-posted is easy. No file renaming needed.
>>>>>
>>>>> That would create some governing issues as well. For example, if you
>>>>> ever have a patch from one fourcc addition (that might or might not be
>>>>> covered by v4l2), will you wait for any v4l2 developper to review it?
>>>>
>>>> None of this is fixed by code renaming or locations. Either way we
>>>> need to figure that out.
>>>>
>>>> And yes part of the reasons for not moving this out of drm is that I'm
>>>> not a fan of boutique trees for small stuff. If sharing means we need
>>>> to split the drm_fourcc code and library out of drm trees, I'm not
>>>> sure that's a good idea. We're already super liberal with merging
>>>> anything through driver trees with acks, and integrating them quickly
>>>> into drm-next. This would still be workable if v4l sends regular pull
>>>> requests to drm-next (every 1-2 weeks, like the other big gpu trees
>>>> do). If we can only sync up once per merge window with a shared
>>>> boutique tree for formats only, life is going to be painful.
>>>
>>> I don't get why we want to turn DRM into some kind of a black hole
>>> that would pull everything. We don't have to, really. And at the same
>>> time it carries the message that v4l2 is less important than DRM for
>>> some reason, which I'm really not comfortable with.
>>
>> Make another tree somewhere that pulls in trees more often than every
>> merge window, and I'm happy. It's the coordination effort of lots of
>> trees that creates the black hole, not the other way round. Yes topic
>> trees work, but if topic trees are persistent something with the
>> organization of trees is wrong and needs to change. This very much
>> looks like we'll end up with a perpetual topic branch for format stuff
>> between drm and v4l.
> 
> Well, if v4l2 sends a PR to DRM every 1 or 2 weeks, that definitely
> looks like a topic branch to me. And on a far more frequent basis than
> when we will merge a format description.
> 
>> The other shared stuff (like hdmi infoframes) seems to change a lot
>> less often, so the occasional patch hasn't been a pain. But drm_fourcc
>> related stuff sees a lot of work, both in adding new formats and in
>> refactoring the library to keep up with all the new use-cases.
> 
> When was the last time a refactoring that changed the API happened?
> 
> Most of the changes will be new format descriptions, and I guess that
> would only concern a single tree.
> 
> And really, we're doing this all the time, so I'm not sure what the
> big deal is here.
> 
> I feel like there's something that you don't really like about this,
> but you're not saying this out loud.
> 
> Sure, the exact process needs to be figured out, and everyone needs to
> agree upon that process. But that's pretty much it, and it's nothing
> out of the ordinary.
> 
>> And yes I think an overall gfx-like-stuff.git tree for drm and v4l and
>> the few other bits really makes tons of sense. Not as a tree where
>> people commit, but as the 2nd-level integration tree (like drm.git
>> right now for gpu stuff).
>>
>>> And I don't really get why you're against this in the first
>>> place. When you have some code in a single driver that would benefit
>>> more driver, you create a helper and move it into the core.
>>
>> It's a feature that drm doesn't share that much code with other parts
>> of the kernel, it makes backporting the gfx stack to lts kernels a lot
>> easier. Until someone fixes the upstream kernel release model to no
>> longer need large scale gpu driver backports, we need to keep that.
>>
>>> In this case, we have some code used by a framework that more
>>> framework could use, and we move it to a core-er place. How is that
>>> different?
>>
>> Imo core sharing for code sharing's sake is overrated. If we already
>> have drm and v4l tightly integrated as a community, then code sharing
>> becomes a lot easier, and a lot more reasonable to do.
> 
> At least Laurent, Boris, Ezequiel, Gustavo and I have been working on
> v4l2, so I'm not sure how not integrated we are.
> 
>> Plus we can then just stuff code int drivers/gpu or drivers/video
>> (or merge these two because really it's all the same). But my
>> understanding is that integrating more tightly with the drm folks is
>> a very contreversial topic in v4l
> 
> So, I sent the RFC expecting that kind of feedback.
> 
> Hans replied mainly to that patch https://patchwork.freedesktop.org/patch/293043/
> 
> "
> If we are creating a common library then I think we should change that rule
> to: "unless they are in use by a DRM or V4L2 driver". And when new formats are
> added, and they exists already for DRM or V4L2, then we should use the same
> fourcc for the other subsystem.
> 
> I.e. if pixelformat V4L2_PIX_FMT_FOO was already defined, then add a:
> 
> #define DRM_FORMAT_FOO V4L2_PIX_FMT_FOO
> 
> rather than creating a new fourcc.
> 
> We could even start looking at redoing the whole scheme in a unified way, but
> that's something for the (far) future.
> 
> This is already a big step forward.
> "
> 
> So, not controversial at all.
> 
>> and until that's resolved I don't see a huge need or benefit in
>> sharing tons of code.
> 
> That's mostly tons of data though. The code is pretty small and
> trivial.
> 
>> And the format stuff is a lot more central to kms than e.g. the
>> infoframe helpers.
>>
>> Au contraire, I think forcing this has a lot of potential for
>> needless fights between drm and v4l.
> 
> We're all reasonable, so I'm not sure why we would need to fight here.
> 
>> Hence my suggestion to try a minimal format conversion library
>> between the drm format world and the v4l format wolrd, and see how
>> that goes. That contains a lot less risk than going all in right
>> from the start.
> 
> And it's really not about getting access to the DRM fourcc. It's about
> getting access to DRM's format description, so I'm not really sure
> what there is to convert, we just want a lookup.

I see this patch series as a first step towards further integration
between drm/v4l (at least in this area). That said, the V4L API has some
serious limitations at the moment when it comes to describing these formats,
and until that is fixed there is no point in doing more than what this series
does. I certainly don't expect a lot of patches, and I am happy for drm to
maintain this for now.

Work has started on improving how V4L2 handles formats (1) but this will take
quite some time before this is ready. In part because we are working on
things that have a higher prio (HW codec support). But the intention is to
become much closer to how drm handles this to simplify format matching between
the two subsystems.

Once that's in place (next year?) it will become much more interesting to
look at further integration between drm and v4l.

Note that that is just my personal opinion. Others may very well disagree.

So in my view this series is a first solid step towards further integration.
And initially it should be fine to have the most common formats available in
this new lib. That should solve most of the current problems.

Regards,

	Hans

(1) https://www.mail-archive.com/linux-media@vger.kernel.org/msg146075.html
