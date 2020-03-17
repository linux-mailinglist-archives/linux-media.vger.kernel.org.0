Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E223187DAB
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 11:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgCQKCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 06:02:03 -0400
Received: from mail.netline.ch ([148.251.143.178]:41830 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgCQKCC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 06:02:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id 4E8EA2A6042;
        Tue, 17 Mar 2020 11:01:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id DxoYdUv3L313; Tue, 17 Mar 2020 11:01:59 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch [83.76.80.252])
        by netline-mail3.netline.ch (Postfix) with ESMTPSA id 91A072A6016;
        Tue, 17 Mar 2020 11:01:58 +0100 (CET)
Received: from [::1]
        by thor with esmtp (Exim 4.93)
        (envelope-from <michel@daenzer.net>)
        id 1jE92r-000epK-Rh; Tue, 17 Mar 2020 11:01:57 +0100
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Jason Ekstrand <jason@jlekstrand.net>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        linux-media@vger.kernel.org
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
 <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
 <CAAxE2A5D2HaqjS52jymMbwOUEsaXG_cMeeA9_esqaC54-52Kgw@mail.gmail.com>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
Date:   Tue, 17 Mar 2020 11:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAAxE2A5D2HaqjS52jymMbwOUEsaXG_cMeeA9_esqaC54-52Kgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-03-16 7:33 p.m., Marek Olšák wrote:
> On Mon, Mar 16, 2020 at 5:57 AM Michel Dänzer <michel@daenzer.net> wrote:
>> On 2020-03-16 4:50 a.m., Marek Olšák wrote:
>>> The synchronization works because the Mesa driver waits for idle (drains
>>> the GFX pipeline) at the end of command buffers and there is only 1
>>> graphics queue, so everything is ordered.
>>>
>>> The GFX pipeline runs asynchronously to the command buffer, meaning the
>>> command buffer only starts draws and doesn't wait for completion. If the
>>> Mesa driver didn't wait at the end of the command buffer, the command
>>> buffer would finish and a different process could start execution of its
>>> own command buffer while shaders of the previous process are still
>> running.
>>>
>>> If the Mesa driver submits a command buffer internally (because it's
>> full),
>>> it doesn't wait, so the GFX pipeline doesn't notice that a command buffer
>>> ended and a new one started.
>>>
>>> The waiting at the end of command buffers happens only when the flush is
>>> external (Swap buffers, glFlush).
>>>
>>> It's a performance problem, because the GFX queue is blocked until the
>> GFX
>>> pipeline is drained at the end of every frame at least.
>>>
>>> So explicit fences for SwapBuffers would help.
>>
>> Not sure what difference it would make, since the same thing needs to be
>> done for explicit fences as well, doesn't it?
> 
> No. Explicit fences don't require userspace to wait for idle in the command
> buffer. Fences are signalled when the last draw is complete and caches are
> flushed. Before that happens, any command buffer that is not dependent on
> the fence can start execution. There is never a need for the GPU to be idle
> if there is enough independent work to do.

I don't think explicit fences in the context of this discussion imply
using that different fence signalling mechanism though. My understanding
is that the API proposed by Jason allows implicit fences to be used as
explicit ones and vice versa, so presumably they have to use the same
signalling mechanism.


Anyway, maybe the different fence signalling mechanism you describe
could be used by the amdgpu kernel driver in general, then Mesa could
drop the waits for idle and get the benefits with implicit sync as well?


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
