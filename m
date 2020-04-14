Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D311A7716
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 11:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437470AbgDNJLy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 05:11:54 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:43033 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437407AbgDNJLs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 05:11:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id OHbXjOwV37xncOHbaj18OP; Tue, 14 Apr 2020 11:11:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1586855503; bh=cV6rP1iyH/3Yeqg+oY4es8P8CV4SBQy6yjtagsjRCjk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=guF/b8VJ2mB54v4vRyV8VJjJqDaNO/kCVQVU9a1GyunSRud0yABeb5QS6Riwu9bjL
         IYdudIt2vhn9IX6tQEOJN5sCe8449vMfeqa9ERoN78i/i2VWI8sx0gnkhlIE1y1ua0
         j7gQySDyMVv0c8u278n76ogswC8b+wUcrxa92ZH6Q9qEtpT34++pNNu4k3ckMvfFkL
         D7iqnjmjEF2zftZyC6aF29hj3ACrT94wXtDTmTM/+3jk1pxO3gCoFjugyjX/MI6IC7
         E+V5NOoqvgSoF289EBTRCCw3tt56NSLLsasxJ8fsCKFfmdLh+fmOksk64dotYx+TIP
         kmq3+XpwCXBgA==
Subject: Re: [PATCH] Minimal libv4l2 support for complex cameras
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     sean@mess.org, mchehab+samsung@kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
References: <20200323114727.GA31063@amd>
 <20200323115753.GC12103@pendragon.ideasonboard.com>
 <20200323122216.GA18697@duo.ucw.cz>
 <20200323122442.GD12103@pendragon.ideasonboard.com>
 <20200323131922.GA719@duo.ucw.cz>
 <20200323135248.GI4768@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ba3c5d2a-79f4-6336-9656-29151a01a145@xs4all.nl>
Date:   Tue, 14 Apr 2020 11:11:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200323135248.GI4768@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKyKGRKvC157LNmxGOxElqZh7x5izuDYOgvsTHdGssX9crnfVW6ek2IoqgywJQY2bjgiIJqTfiFmpJa1A8PUxL9ucoUPHmfLDWks8OmYHSymSiRSOnUU
 WuxLj1lcIExUgVmqfIDTL0pf6fatxAk1UQ3+JCCKqttC/ekw9y+AR+idyo5s8XK7EfO5Zv233ogbODK91zOji6aJJsSGL7cMFEpZzrJ386B8792xmRWr22Lu
 U9CbA0Z4UIQjhDxH2YafnyKrf8i6TWrfZQTg/WZln71+yZfXLGbtkvac9RxfHpXBF6UyCcj/oUED8yUKagWgi5NrISEB6xlD5xRlE89wuf6kjgdIUNtzrFvj
 dcaec2+Ko5UuXh75If/w2rYBQ9pF2czcb816t2fiAnLp7UO8BfU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2020 14:52, Laurent Pinchart wrote:
> Hi,
> 
> On Mon, Mar 23, 2020 at 02:19:23PM +0100, Pavel Machek wrote:
>>> On Mon, Mar 23, 2020 at 01:22:17PM +0100, Pavel Machek wrote:
>>>>> On Mon, Mar 23, 2020 at 12:47:27PM +0100, Pavel Machek wrote:
>>>>>> Hi!
>>>>>>
>>>>>> We now have easy-to-install support for complex camera in form of
>>>>>> Maemo Leste on N900.... Unfortunately we don't have anything in
>>>>>> userspace that can be used to work with the camera.
>>>>>>
>>>>>> This attempts to be minimal solution to get libv4l2 to work.
>>>>>
>>>>> libv4l2 is mostly deprecated. How about contributing an OMAP3 ISP
>>>>> pipeline handler to libcamera instead ? :-)
>>>>
>>>> Why should it be instead?
>>>>
>>>> I need something for kernel testing, and there is ton of apps using
>>>> it. Let me do this. libcamera might be future, but...
>>>
>>> Sure, if it's useful for you, I won't prevent you from developing any
>>> code you want :-) But there's very little chance of getting it merged,
>>> and it would be useful to more people to have a support for that
>>> platform in libcamera. It's really your decision, and I'm not blaming
>>> you.
>>
>> When you have libcamera ready, you'll still need some hardware and
>> kernel to work with it. Do you have something more suitable than
>> N9/N900? Droid 4 has separate CPU to run the camera, Librem 5 camera
>> does not have autofocus (and I believe nor has PinePhone).
> 
> OMAP3 is great as a test bed for camera opinion. It's widely available,
> has amazing documentation, and even though the hardware is aging a
> little bit, it's still very decent and has a nice ISP. Even better,
> there's good kernel support for it, so it's a really good platform in my
> opinion. The only reason we don't support it yet in libcamera is lack of
> spare time, I would really love to see that happening, and it would be
> first-class citizen in the code base.
> 
>> My patch is not complex, and libv4l2 is full of similar hardware
>> support code. What would be reason not to merge it?
> 
> It has to be reviewed and maintained. From a V4L2 community point of
> view, I don't think it makes sense to invest time on a dying component
> (I'm talking about libv4l2, not OMAP3). But from a personal point of
> view, if you find libv4l2 useful to develop code for the OMAP3 and
> experiment, I see no issue with that. If other reviewers and maintainers
> of libv4l2 disagree and want to invest their time in this, I won't stop
> them, but I wanted to warn that this is a dying project.
> 

It's not so much the reviewing/maintaining part that is a concern for me,
it is the fact that this would create yet another way to support complex
cameras, when we made the decision to use libcamera for that instead.

I don't want two APIs, and vendors certainly don't want two APIs.

I agree with Laurent that adding OMAP3 support to libcamera would be much
more useful than adding a libv4l hack.

Regards,

	Hans
