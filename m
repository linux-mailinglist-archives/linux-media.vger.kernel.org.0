Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1753FEDFD
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 14:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344478AbhIBMtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 08:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344309AbhIBMtB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 08:49:01 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C72C061575
        for <linux-media@vger.kernel.org>; Thu,  2 Sep 2021 05:48:02 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Lm8KmGxJXy7WyLm8Lm7fNA; Thu, 02 Sep 2021 14:47:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630586878; bh=t8bym80BQV4vUgD1n6MjnG4KL1Vh+8AroymKJPXG7hg=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PBFclBFkEb5fKlb6WwfXJkwGp1klPzw7gGz/P0p3vzO8HKQLz5gCIcfr3evtBs7Fd
         s1WW16HKm/azv5K2imUFFKC9k6ZgAJLQyLjRO1cGyP25X2TIzAlbfGqR9qcQQ9+acU
         tQS5Wgejo0IQurtb4k9q6qlczXPLW3wGqOqCE4VpucCBZB8AhlMh8ntz9eh5ezqfaH
         IyfgZvDi5lJkf6uuCjBNaRuNaiqLtfI9wYnwLkoVjuGYFbphq3joIu164ou5lppEEM
         bF9Bml8P2K/R+O7x18+Xm8eJYpzCW0rm/VqPzgUNKLlpIBxRXAfePmSwgO1GKAN31x
         jHmYKbDAxNLIg==
Subject: Re: [PATCH 3/3] media: v4l2-ctl: Add support to VIDIOC_DQEVENT_TIME32
 on non x86_64 arch
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org, enric.balletbo@collabora.com,
        acourbot@chromium.org, hsinyi@chromium.org, eizan@chromium.org,
        Arnd Bergmann <arnd@arndb.de>
References: <20210728100624.16129-1-dafna.hirschfeld@collabora.com>
 <20210728100624.16129-4-dafna.hirschfeld@collabora.com>
 <305a4bb4-fc04-e773-33e6-3c6412949a4e@xs4all.nl>
 <9e491460-7fcd-28b2-68d9-9f022dd9f8ca@xs4all.nl>
 <YTCP/HwvU3F2rmL/@pendragon.ideasonboard.com>
 <e69821af-6f19-7b1c-2f0c-29ee1ddef986@xs4all.nl>
Message-ID: <9de24fce-0833-fe07-a48c-ddef9610f8db@xs4all.nl>
Date:   Thu, 2 Sep 2021 14:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e69821af-6f19-7b1c-2f0c-29ee1ddef986@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPoVNITGvyUJAPFhEE7HLizpdpb2Js9LRRrfOXVxerfcJIMG5whP+9KJPr0EayWksfGsAWGnNWv36h8Sv2E1mfsnfO2n674nVimLA1VaL/vfgxrREXE/
 qqMb5bd9KbkHIDz54jVI+xeWEyw10tXh8JlOaipQ5a2d7XIlfUwoxz3zyqRTytEPt5OQJSDhxf6EtsGXQSKJLwUJTJzjjRCCeGphvhynXOqhHDUBhX/1Tilq
 c0FQewzvFKwBpgYQK5NNE1bFm+gZ9jVIdFpYAHj09/fo5DgL8ObQPpz5ALG6x3uu3l88KC8hUB5MBMdmu2t3VmthtDUXavPooDAonX7ATURqiWUZ8RAGDv7/
 A2XptOMTljFoIVIXU0FyNiNqCcqFMKYoOvojSeJi06GN6+sgm0VXwY82DqQpDKLsLBdeDY8P1TuFdHfS3TA8aLloa4dpuBnAWRgfUWy9m6GE1bp1Izuy2xjU
 nxPrsnFADLECn86I9IlK8yNOxXUBfJ72LgL3kLO8/AxB6oWJRrXZlSgPKExiLlIwhvBHl3dIWLM/xnkbIlg1WpEyJIzxzrU7rBTOCVJ+umBXWPoeUP3IQVqv
 Kmmc4nfZhsmLRo6VLHG9z7AM4JOlHcqT1BCIGI0lmKmqTxhq58scXMuahKdJEMIzyjKWhCHYYFja6tTrtG+C0q1IQ34nwJkh2aX94R528asIf/5UDD8FSAj5
 SgnNc65NyyfZv2ZnLSx4imYr241HT/IOsHQAEKRLnSlcj/SSE+IDec/Uu5KmXMmTNQY8FCBL+RQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/09/2021 13:08, Hans Verkuil wrote:
> On 02/09/2021 10:49, Laurent Pinchart wrote:
>> (CC'ing Arnd)
>>
>> On Thu, Sep 02, 2021 at 10:39:46AM +0200, Hans Verkuil wrote:
>>> On 02/09/2021 10:24, Hans Verkuil wrote:
>>>> On 28/07/2021 12:06, Dafna Hirschfeld wrote:
>>>>> Currently, if the ioctl VIDIOC_DQEVENT_TIME32 is called on e.g. Arm-64
>>>>> the function 'v4l2_compat_translate_cmd' doesn't have a 'translation'
>>>>> for the cmd and so 'cmd' is returned as is. This cause
>>>>> a failure '-ENOTTY' in __video_do_ioctl.
>>>>
>>>> I don't really see how this would happen. As far as I can tell (and admittedly,
>>>> the code is hard to follow) on such a system there is no need for any 32-bit to
>>>> 64-bit conversion in v4l2-compat-ioctl32.c since struct v4l2_event_time32 is the
>>>> same for both architectures.
>>>>
>>>> And in v4l2-ioctl.c VIDIOC_DQEVENT_TIME32 is handled correctly as far as I can
>>>> tell. Where exactly does the return -ENOTTY happen?
>>>>
>>>> It definitely does not make sense to modify v4l2-compat-ioctl32.c if there is
>>>> nothing to convert between 32 and 64 bit. If there is a bug, then that should be
>>>> in v4l2-ioctl.c.
>>>>
>>>> Note that it is perfectly possible that there is a bug for arm64 and this ioctl,
>>>> since that's the one combination I've never tested since I don't have a test setup
>>>> for that.
>>>
>>> How did you test this anyway? With which libc/compiler? It would be nice if I could
>>> test this myself on e.g. a Raspberry Pi.
> 
> I added a test in v4l2-compliance and it appears that something is indeed wrong for arm64.
> I'll dig deeper into this. I don't get ENOTTY though, instead it returns 0 but the contents
> of the returned v4l2_event is garbled.
> 
> It works fine for x86_64, but not for arm64.

Actually, commit c344f07aa1b4 ("media: v4l2-core: ignore native time32 ioctls on 64-bit")
fixes this issue.

I was testing with an older kernel version on my RPi that didn't have this commit, and
then it failed. With the latest kernel it's fine.

I'm marking this series as Obsolete.

Regards,

	Hans
