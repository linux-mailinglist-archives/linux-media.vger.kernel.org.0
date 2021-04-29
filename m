Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966B636E7E2
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 11:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbhD2JX4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 05:23:56 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60515 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231135AbhD2JX4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 05:23:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id c2swlaHMhk1MGc2t0lPzyk; Thu, 29 Apr 2021 11:23:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619688187; bh=s3ipDlypoNm3vwhR/M4/sqd3vCeKq1dZfzYQUWfDnww=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mVQHIgGq0384Yi1ZV8aZ4i859z1cLY20+TE/NAzh1lmOPXb2TYuE3JYbak5otfwbc
         h1Awdq8jaxjJGd9KOjLo4rMh7hhpWHD3ojTgaAbiI35bPVC1x9lvJPdZrYp5qlONvY
         jR0PmXIbLTPFBnSRxi3j8M5e1tcInFwTV6ZlYqCs2ucu4c1yuAWIaC31kzqgbqCOvc
         iWzNvveZcDByjJbfoH5GcOmzemNNg/Ve/eDeMcHa8NFpD2oVcIiaiaUvO06AAO07yJ
         +dKGuIun4BeGRXtQuAEmq+2lMUZnUtFAWJyR0tihTzF0kQlaqicW6i+6nHmPNmndv6
         5nxF46hgD48IA==
Subject: Re: [RFC RESEND 0/3] vp9 v4l2 stateless uapi
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com
References: <20210421100035.13571-1-andrzej.p@collabora.com>
 <23a4ed00-0993-3567-2664-1fcc643915ab@xs4all.nl>
 <e7b55d3f58a6067ccd68d0e1d772e70bb3c92c93.camel@ndufresne.ca>
 <CAAEAJfB_UdGKnfMRdwu=LRaW+Ujv5pShHYm9i=KO5KaB08JSuA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <463d2636-6de9-112b-3536-5cef38ef6093@xs4all.nl>
Date:   Thu, 29 Apr 2021 11:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfB_UdGKnfMRdwu=LRaW+Ujv5pShHYm9i=KO5KaB08JSuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIKdM0al2i9WC6E+tLeoxaVsRwrsxJX3pVO98NS+Efa7vX3ZT/LIEJzDdOX8hab2OXIwbIvTyQrawHXdcYNMLSLmfWEkoq0GEubsU+CyfpxPyUgCjTLi
 Art65U2mDLk4QfL5IJj4Dyuc3kfy/mF3tseCDITX+Qom2Mf4S8BK1A3v2RAeSONMRZas1JNjYICUle7FlEE7QabIXI1yhM1wMfDlSQ1JIZfLXpyXg0RiImfm
 DbgEavQrkYbMm2oNJEatC/IxaNL4GT2lD1WI6YnVVXXpxougl8TKnZvNcSEhZCBUYEnvR1Gj1cU6DSn9nCuNw6T1C/NIruJWA47OzKrk2bQBnL1EtY1v1NNF
 lpkxYgX3dW/3ataQiNC1Nm6Z2LMMTaL6Hb6z/qj2HJKqF89b1A8nkYlS6l6/QV2GoVlxQj2lwBVDYhX5Hewmw5AW7wPPMfiaN6040jRqO6zU+THbWGA6FRvC
 wf2oIWv3cSVKCRMM/R+rzuh5AeUsf22x54OzZOgojqC7SFWDRXVlQRF0efQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/04/2021 01:34, Ezequiel Garcia wrote:
> On Mon, 26 Apr 2021 at 14:38, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>>
>> Le lundi 26 avril 2021 à 09:38 +0200, Hans Verkuil a écrit :
>>> Hi Andrzej,
>>>
>>> Thank you for working on this!
>>>
>>> On 21/04/2021 12:00, Andrzej Pietrasiewicz wrote:
>>>> Dear All,
>>>>
>>>> This is an RFC on stateless uapi for vp9 decoding with v4l2. This work is based on https://lkml.org/lkml/2020/11/2/1043, but has been substantially reworked. The important change is that the v4l2 control used to pass boolean decoder probabilities has been made unidirectional, and is now called V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS.
>>>>
>>>> In the previous proposal, to queue a frame the userspace must fully dequeue the previous one, which effectively results in a forced lockstep behavior and defeats vb2's capability to enqueue multiple buffers. Such a design was a consequence of backward probability updates being performed by the kernel driver (which has direct access to appropriate counter values) but forward probability updates being coupled with compressed header parsing performed by the userspace.
>>>>
>>>> In vp9 the boolean decoder used to decode the bitstream needs certain parameters to work. Those are probabilities, which change with each frame. After each frame is decoded it is known how many times a given symbol occured in the frame, so the probabilities can be adapted. This process is known as backward probabilities update. A next frame header can also contain information which modifies probabilities resulting from backward update. The said modification is called forward probabilities update. The data for backward update is generated by the decoder hardware, while the data for forward update is prepared by reading the compressed frame header. The natural place to parse something is userspace, while the natural place to access hardware-provided counters is the kernel. Such responsibilties assignment was used in the original work.
>>>>
>>>> To overcome the lockstep, we moved forward probability updates to the kernel, while leaving parsing them in userspace. This way the v4l2 control which is used to pass the probs becomes unidirectional (user->kernel) and the userspace can keep parsing and enqueueing succeeding frames.
>>>>
>>>> If a particular driver parses the compressed header and does backward probability updates on its own then V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS does not need to be used.
>>>>
>>>> This series adds vp9 uapi in proper locations, which means it is a proper, "official" uapi, as opposed to staging uapi which was proposed in the above mentioned lkml thread.
>>>
>>> Why? I rather liked the way that the other codec APIs started life in a private header
>>> (like include/media/vp8-ctrls.h) and were given time to mature before moving them to
>>> the uAPI. Is there a reason why you think that VP9 doesn't need that?
>>
>> I'll be honest, I accepted early code into GStreamer for H264, and it ended up
>> in a nightmare for the users. We now have a released GStreamer that supports
>> kernel API up to 5.9, a blackwhole at 5.10 and finally master catched up and can
>> support 5.11+. It is so complicated for packagers to understand what is going
>> on, that they endup wasting a lot of their time for a single feature in their
>> OS. Same breakage is happening for VP8 in 5.13, even though VP8 has been working
>> great all this time. I will for sure for now on ignore any contribution that
>> depends on staged uAPI.
>>
>> As for FFMPEG, even though now H264 API is table, the maintainers just simply
>> ignore the patches as they have been bitten by the reviewing stuff based on
>> unstable APIs and downstream work.
>>
>> I believe the staged uAPI has been used wrongly in the past. Stuff has been
>> staged quicky right before associated project budget for it was exhausted, so it
>> was in the end a way to look good, and someone else had to pick it up and finish
>> it. Going straight for final API put more pressure on making good research from
>> the start, doing more in-depth reviews and avoiding delaying for multiple years
>> the support. I believe the staging API are confusing even for the Linux
>> projects. Going straight to stable here is a commitment to finish this work and
>> doing it correctly.
>>
>> This specially make sense for VP9, which is a very Open CODEC and were all HW
>> implementation are Google/Hantro derivatives. Also, unlike when this work all
>> started, we do have multiple HW we can look at to validate the API, with more
>> then enough in-depth information to make the right decisions.
>>
> 
> +1
> 
> Although I can understand how, from the kernel point of view, it's
> tempting to merge
> the uAPI as staging first and then de-stage it, I have to say that I
> agree fully with
> Nicolas, the experience wasn't really good for the userspace.

It was a completely new API and it took quite a long time to really understand
what was needed and how to get it right. Not to mention implement it for
different platforms. Both H264 and MPEG-2 saw major changes. VP8 was the exception,
so it might well be that VP9 is equally good at the first attempt.

> 
> I really hope we can do better than this for at least VP9. So, let's make sure
> the hardware decoders that are currently available (Rockchip,
> Verisilicon, Mediatek)
> are covered, as well as any future features (dynamic frame resize).

Sure, if we can have this supported on several platforms and it is well reviewed,
then I am not opposed to merging it as a public API without going through
staging. We have build up a lot of experience by now.

> 
> A well-thought, honest effort for a sane uAPI is IMO the right way,
> and if we find out
> something is missing (which may happen, as we are all humans), we can still
> introduce another API control (V4L2_CID_STATELESS_VP9_V2) and use it
> to supersede the current API. If I understand correctly, this should work,
> and allow backward compatibility without issues.

Yes, but it is something we'd like to avoid. You need to have sufficient
confidence that the uAPI has been well tested and is in good shape. If you
have that, then great, we can merge it without going through staging.

In particular, if 1) we support at least two HW platforms, and 2) testing
with test suites (I assume those are available for VP9) passed on those
platforms, then I'd be happy to merge.

Regarding the 'userspace mess': why did support for staging APIs end up
in released gstreamer/ffmpeg implementations at all? What did you expect
would happen? Released versions of those applications should only support
public APIs, not staging APIs. Unless perhaps if you explicitly enable it
with some test config option that is by default off. And once a codec API
becomes public, rip out the old code.

I don't use gstreamer/ffmpeg myself, so I hadn't noticed. I thought people
were testing using test branches of those apps. It's staging for a reason,
you are completely on your own if you use it.

I wonder if I should make a patch that issues some really serious messages
in the kernel log if someone attempts to use these staging APIs.

Of course, ideally you would have a perfect API from the beginning, but that
wasn't an option here, and keeping everything out of the kernel entirely until
we're happy with the uAPI would be almost impossible to maintain.

Regards,

	Hans
