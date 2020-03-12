Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8EF182CD0
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 10:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgCLJyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 05:54:45 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:51383 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726299AbgCLJyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 05:54:44 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CKY0jwJUBhVf8CKY3jM7i7; Thu, 12 Mar 2020 10:54:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584006882; bh=jZubs4ETqVe/3bzFNwkpGbFqx4SVVGp9/O0Cirq3tZI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Yin6Y205084N8fyWjyHKcMAcKeSM4ASA9vPJtTSOYxEmFWBZd9y5H84yb91h1umSW
         VyifTZo9nQ9y/pT0JUBYP6StIj3iZrJKmW8ZXlNNPkyVjHovAfHAXec6sZUirptHEv
         7JPZie2oGYpyb4ZchLQ4aYcJWVSxhWYSCzdqARC4DNhC+u3WIkWzOcbnmT8qYsfqMY
         nvTPJPTyiK5T8p8amtTtzV+8XABOtiz3keJr/RNfFqAUGzy2T0bgTYXyM23G1ZYkF/
         XAT5+cM/45eT7//wCc6PIZ4HjjYJUnaGHd6Bh3CwuGq0ijxQoS/05YNNUcfr002r93
         6PTrcyH8Qi7TA==
Subject: Re: [PATCH v2 0/1] Virtio Video V4L2 driver
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
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
 <c4d7622b-e396-3920-0e14-5a73a0225c0f@xs4all.nl>
 <CAD90VcZUqU0nVQEn1vNOQkcicR5GA+HzBGd+M7O_b69f2BCUxA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1ac18708-262f-c751-d955-267931270028@xs4all.nl>
Date:   Thu, 12 Mar 2020 10:54:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD90VcZUqU0nVQEn1vNOQkcicR5GA+HzBGd+M7O_b69f2BCUxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMYYZZwKPMJYIVGGZWniDP3vKDTg4C+HZk8fHqYaMI2Z0JCT7daYs3mb6F6r4/9OZqD8iXPRZAzem7ir/i7cr7b7/qQsnTsZxYER4ijqA4lUrkaYooUN
 Qku/Bga8GhbjP7wgV/ypxS2l+zcOFPTaAJdNfHKEIlH32XJIUyT/Lj1KTijswJvR6HQ/kc4Ok2aCqN2vmuzEi8Npfl+Ve6hbkBKCDU3zWad+bDAGUsJFTbjk
 GGK9f7lv6NpGiX6uuhNgI+HA9SHY2+CYMlRk6y90xQ7kCKnrU2ew/oBKxlALbr65ipi51q/gUvSt6lm1LwzUoeDWcacztj+68H0Ac2OsNmH94Ts7d1neYajA
 vt83m11QBE9l31t3YZkX2U4N3luz5epX4BYhUWJkv0y04Ibsi0Dxgyl5mh4RFDIXP05jN2AGmYKM27Ys9/Tsn9K3SiNwQB5DbqANTzMUVdaoCWpZ820jesWd
 FUcjjWm6S5EfBPaIuvtTG897HNtvE11cymdITkNtSBjADKRAwrPJWxmgSZ/SlvnuI+YqxdZ1GYseScVNS6HzW1Nw+uyhQ9IH9WyDytSfsUD+OsGqdLfoG096
 BZ7OCyXE2h7YiQk8/cvk5oAJwfxld2U6TSgw+WOPj7A8RyR5wzpk7xiAbQ0SzQKH0hbPZzHYjNGpLpjMoCKgWyWX5edkTwbORGo5/VvzvrtiwobXmSivqppl
 bP7B1w2CReIjrsG6EqveH9hwC4DZUUf728OCeTKddPx1bmoVQrFfQOiVo+EcDCxYwfEOBFeVhMhkRwFUg3llDQQUtm5b35jHJ+4W/y7qc2SqGRZkdpLUrwMP
 fA1FNwSLGug0/U93GVk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/12/20 10:49 AM, Keiichi Watanabe wrote:
> Hi Hans,
> 
> On Wed, Mar 11, 2020 at 10:26 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Dmitry,
>>
>> On 2/18/20 9:27 PM, Dmitry Sepp wrote:
>>> Hi all,
>>>
>>> This is a v4l2 virtio video driver for the virtio-video device
>>> specification v3 [1].
>>>
>>> The first version of the driver was introduced here [2].
>>>
>>> Changes v1 -> v2:
>>> * support the v3 spec (mostly)
>>> * add a module parameter to ask for pages from ZONE_DMA
>>>
>>> What is not implemented:
>>> * Plane layout flags should be used to propagate number of planes to
>>>   user-space
>>> * There is no real use of stream creation with bitstream format in the
>>>   parameter list. The driver just uses the first bitstream format from
>>>   the list.
>>> * Setting bitrate is done in a different way compared to the spec. This
>>>   is because it has been already agreed on that the way the spec
>>>   currently describes it requires changes.
>>>
>>> Potential improvements:
>>> * Do not send stream_create from open. Use corresponding state machine
>>>   condition to do this.
>>> * Do not send stream_destroy from close. Do it in reqbufs(0).
>>> * Cache format and control settings. Reduce calls to the device.
>>
>> Some general notes:
>>
>> Before this can be merged it needs to pass v4l2-compliance.
>>
>> I also strongly recommend adding support for V4L2_PIX_FMT_FWHT to
>> allow testing with the vicodec emulation driver. This will also
>> allow testing all sorts of corner cases without requiring special
>> hardware.
> 
> I agree that it's great if we could test virtio-video with vicodec,
> but I wonder if supporting FWHT is actually needed for the initial
> patch.
> Though it wouldn't be difficult to support FWHT in the driver, we also
> needs to support it in the host's hypervisor to test it. It's not easy
> for our hypervisor to support FWHT, as it doesn't talk to v4l2 driver
> directly.
> Without the host-side implementation, it makes no sense to support it.
> Also, if we support FWHT, we should have the format in a list of
> supported formats in the virtio specification. However, I'm not sure
> if FWHT is a general codec enough to be added in the spec, which
> shouldn't be specific to Linux.

Good point, I didn't know that.

Is it possible to add support for FWHT under a linux debug/test option?

It's really the main reason for having this, since you would never use
this in production code. But it is so nice to have for regression testing.

Regards,

	Hans

> 
> Best regards,
> Keiichi
> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> Best regards,
>>> Dmitry.
>>>
>>> [1] https://markmail.org/message/dmw3pr4fuajvarth
>>> [2] https://markmail.org/message/wnnv6r6myvgb5at6
>>>
>>>
>>

