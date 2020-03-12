Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0E1182DE8
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgCLKhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:37:07 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:53159 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726028AbgCLKhH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:37:07 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CLD2jwVkXhVf8CLD5jME1m; Thu, 12 Mar 2020 11:37:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584009424; bh=aGrg7qZfZCYGh0cHGrNmxeV1OrTKKhJ8HGddZQHHCWE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Dab3J+8Rfm555gsj5nHTYvT6ydnuJfdCEE6gzVrhm9jErKAifpchNrIHoxFKxCuu1
         JxPfk+W/4hMK6T9PWaLHxertQCthJvr/kHr7sIw4fFKffp5FYtZMqtLnyZK7sMb80J
         cr7cCHlywKAOI8i57zRhdumCKVqpK4ZCfmzmSevOsSCqTn6wrvchttQkqR6o3riAXg
         8WJSP++tbOe7WmXGTnhnT+oRw8yDAolGpIbIKdIl7iwKFMNmL34S7rAC93mLJ6Iczj
         xr/fvbQKwRuKKVIcVSlkBm6k3eUc5E6YsetiRGwrBsayuu0fC6rZVCQACe9qCAC47T
         /vSMPrv6pnp2w==
Subject: Re: [PATCH v2 0/1] Virtio Video V4L2 driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
 <CAD90VcZUqU0nVQEn1vNOQkcicR5GA+HzBGd+M7O_b69f2BCUxA@mail.gmail.com>
 <1ac18708-262f-c751-d955-267931270028@xs4all.nl>
 <1799967.VLH7GnMWUR@os-lin-dmo>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <645df052-7fbb-386a-d620-9d1908773896@xs4all.nl>
Date:   Thu, 12 Mar 2020 11:37:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1799967.VLH7GnMWUR@os-lin-dmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHKnbDE2aNxmEnKvUaMCZpBjREJu2qNDYIaZrBjcvZSOSjjYFNMFZ9vBFnf3EGl9r9eE5QSwfA7lPfPpy8t8voZ3Ms88iRo79ekoBExt6+oS+y+77vkm
 nHd/2dCiQJAXJSGjp8LUpp+X6ViPP7H/B7ltslbB7wQfBnKUwWUT1QZE+Gx7IVknVh9dzOSGX7+BTMs60HCuPuJ51m0FZaGbxgOqzRPnbP4SsHqFjX9dTD43
 LcMZu82Uj+d4G/vLXD773+ATCAFO5vo4mu2ZuZHMsM9vPBFSw0iQhDrT7C1lhbwWLOK/L5LmD1o1x3v9VbAV3bXlMhZe59iXCNwAj7xXgQshokhsmNF3unTM
 m2uxRlQdNJSETeGRr6B3HtC27OKtwG7AVUXgEywldshREm/RPoPUKrGxY7p3c8fIBzV3Ej/yBqPN+8PVLLOYJpWTHJggjhD6BCUrRQjm0Sb/vg+3gqIaYV5F
 VfhAA1R7hpO4c5w7ogVYukUeZrKcVLpJOGp51Y6wk/wRYGqqIvejcrwnIlBvpxOaHXkgd5QNJC7x/9REwVM5l8f2DwYvMNbdNAUFX7dCn8P89vVE7eoMEmaD
 FYH8X/rfSvaJuEHSsSvMaHYnZRLVb+9UdvocSRjZ3Opq+9ClCY13aRS/00zApuDEiCJD83B6el9cvhmDoEIYMC++XQQewZ3JATufBtNw2dGGvp8zQrwmBzZr
 +/FKh2IoQ7M5IudHmXguSQNcihDEG4Fm0VnK9zAgMUCgUPQJW+vJJHY3uXbC0nT/BTJ2qmFzk9hP3nKt8zMVGS8EPrMtlN6K8Az8GWg/84s5BjHqWdRhzAK/
 /v2jVQwJVLBVr2Tm3TQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/12/20 11:29 AM, Dmitry Sepp wrote:
> Hi Hans,
> 
> I'm not sure about crosvm, for us it is probably still feasible to implement 
> FWHT in the device (but it is unfortunately not supposed to be upstreamed 
> yet).
> 
> The main question is what would be the proper user-space tool to test that? Is 
> v4l2-ctl OK for that? As for gstreamer, AFAIK it does not respect the v4l2 
> Video Decoder Interface Spec and we have seen some issues with it.

A combo of v4l2-ctl and v4l2-compliance. In v4l-utils you find a test-media
script in contrib/test that tests the various virtual v4l2 drivers, including
vicodec.

Basically you want to run the same (or at least as much as possible) vicodec
tests for this virtio driver in a linux guest VM.

The script uses the vicodec encoder to create test streams, but in the VM you
can also load vicodec and use it to do the same thing, which can then be fed
to the virtio driver who passes it to the vicodec instance running on the host,
and the result goes back to the VM.

It would be a great setup to check the corner cases and verify the results of
the codec. And it can be added to kernel-ci and my own daily regression test.

Regards,

	Hans

> 
> Best regards,
> Dmitry.
> 
> On Donnerstag, 12. März 2020 10:54:35 CET Hans Verkuil wrote:
>> On 3/12/20 10:49 AM, Keiichi Watanabe wrote:
>>> Hi Hans,
>>>
>>> On Wed, Mar 11, 2020 at 10:26 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>> Hi Dmitry,
>>>>
>>>> On 2/18/20 9:27 PM, Dmitry Sepp wrote:
>>>>> Hi all,
>>>>>
>>>>> This is a v4l2 virtio video driver for the virtio-video device
>>>>> specification v3 [1].
>>>>>
>>>>> The first version of the driver was introduced here [2].
>>>>>
>>>>> Changes v1 -> v2:
>>>>> * support the v3 spec (mostly)
>>>>> * add a module parameter to ask for pages from ZONE_DMA
>>>>>
>>>>> What is not implemented:
>>>>> * Plane layout flags should be used to propagate number of planes to
>>>>>
>>>>>   user-space
>>>>>
>>>>> * There is no real use of stream creation with bitstream format in the
>>>>>
>>>>>   parameter list. The driver just uses the first bitstream format from
>>>>>   the list.
>>>>>
>>>>> * Setting bitrate is done in a different way compared to the spec. This
>>>>>
>>>>>   is because it has been already agreed on that the way the spec
>>>>>   currently describes it requires changes.
>>>>>
>>>>> Potential improvements:
>>>>> * Do not send stream_create from open. Use corresponding state machine
>>>>>
>>>>>   condition to do this.
>>>>>
>>>>> * Do not send stream_destroy from close. Do it in reqbufs(0).
>>>>> * Cache format and control settings. Reduce calls to the device.
>>>>
>>>> Some general notes:
>>>>
>>>> Before this can be merged it needs to pass v4l2-compliance.
>>>>
>>>> I also strongly recommend adding support for V4L2_PIX_FMT_FWHT to
>>>> allow testing with the vicodec emulation driver. This will also
>>>> allow testing all sorts of corner cases without requiring special
>>>> hardware.
>>>
>>> I agree that it's great if we could test virtio-video with vicodec,
>>> but I wonder if supporting FWHT is actually needed for the initial
>>> patch.
>>> Though it wouldn't be difficult to support FWHT in the driver, we also
>>> needs to support it in the host's hypervisor to test it. It's not easy
>>> for our hypervisor to support FWHT, as it doesn't talk to v4l2 driver
>>> directly.
>>> Without the host-side implementation, it makes no sense to support it.
>>> Also, if we support FWHT, we should have the format in a list of
>>> supported formats in the virtio specification. However, I'm not sure
>>> if FWHT is a general codec enough to be added in the spec, which
>>> shouldn't be specific to Linux.
>>
>> Good point, I didn't know that.
>>
>> Is it possible to add support for FWHT under a linux debug/test option?
>>
>> It's really the main reason for having this, since you would never use
>> this in production code. But it is so nice to have for regression testing.
>>
>> Regards,
>>
>> 	Hans
>>
>>> Best regards,
>>> Keiichi
>>>
>>>> Regards,
>>>>
>>>>         Hans
>>>>>
>>>>> Best regards,
>>>>> Dmitry.
>>>>>
>>>>> [1] https://markmail.org/message/dmw3pr4fuajvarth
>>>>> [2] https://markmail.org/message/wnnv6r6myvgb5at6
> 
> 

