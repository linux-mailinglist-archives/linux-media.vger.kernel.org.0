Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA1618C931
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 09:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgCTIuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 04:50:35 -0400
Received: from mail.netline.ch ([148.251.143.178]:51038 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgCTIuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 04:50:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id B834F2A6016;
        Fri, 20 Mar 2020 09:50:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id RaTPwCQfUc8e; Fri, 20 Mar 2020 09:50:32 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch [83.76.80.252])
        by netline-mail3.netline.ch (Postfix) with ESMTPSA id 2838A2A6042;
        Fri, 20 Mar 2020 09:50:32 +0100 (CET)
Received: from localhost ([::1])
        by thor with esmtp (Exim 4.93)
        (envelope-from <michel@daenzer.net>)
        id 1jFDM7-0007vl-16; Fri, 20 Mar 2020 09:50:15 +0100
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
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
 <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
 <20200319105129.GF2363188@phenom.ffwll.local>
 <CAAxE2A4-YocvFctj7x4mHe=hMx4Q6DBzjPBisbi+Tmh1UMjCpg@mail.gmail.com>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <0b547156-ea58-90ab-1ad0-36d8cc433f90@daenzer.net>
Date:   Fri, 20 Mar 2020 09:50:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAAxE2A4-YocvFctj7x4mHe=hMx4Q6DBzjPBisbi+Tmh1UMjCpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-03-19 8:54 p.m., Marek Olšák wrote:
> On Thu., Mar. 19, 2020, 06:51 Daniel Vetter, <daniel@ffwll.ch>
> wrote:
>> 
>> Yeah, this is entirely about the programming model visible to
>> userspace. There shouldn't be any impact on the driver's choice of
>> a top vs. bottom of the gpu pipeline used for synchronization,
>> that's entirely up to what you're hw/driver/scheduler can pull
>> off.
>> 
>> Doing a full gfx pipeline flush for shared buffers, when your hw
>> can do be, sounds like an issue to me that's not related to this
>> here at all. It might be intertwined with amdgpu's special
>> interpretation of dma_resv fences though, no idea. We might need to
>> revamp all that. But for a userspace client that does nothing fancy
>> (no multiple render buffer targets in one bo, or vk style "I write
>> to everything all the time, perhaps" stuff) there should be 0 perf
>> difference between implicit sync through dma_resv and explicit sync
>> through sync_file/syncobj/dma_fence directly.
>> 
>> If there is I'd consider that a bit a driver bug.
> 
> Last time I checked, there was no fence sync in gnome shell and
> compiz after an app passes a buffer to it.

They are not required (though encouraged) to do that.


> So drivers have to invent hacks to work around it and decrease
> performance. It's not a driver bug.
> 
> Implicit sync really means that apps and compositors don't sync, so
> the driver has to guess when it should sync.

Making implicit sync work correctly is ultimately the kernel driver's
responsibility. It sounds like radeonsi is having to work around the
amdgpu/radeon kernel driver(s) not fully living up to this responsibility.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
