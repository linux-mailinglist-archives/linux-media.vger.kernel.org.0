Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7675338CEA3
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 22:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbhEUUJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 16:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbhEUUJp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 16:09:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B7AC06138B
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 13:08:21 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j10so31383469lfb.12
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 13:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xvfpVd2OzH4+o/D/vVDC31Zzvji7CpUDutlyGbWSS2M=;
        b=EbaAG9yK/DK3FcwWC04VW6QzRYN89xRqlD00mrvuESUFgBxV9HY8hkAXOyT5Lt0xpx
         PppMV5UTCm21S4B9qt/ncdmHkOMYb27DbVQ9WV5E09GdcFKA0hRbhSVghHeaEPPoJaSb
         dEcBcUUDgAw4ejb0yilsMouDiF0KWMY5GDKlYDPEhctNS87/jVTGh5VE5vDzRgUx3Q1P
         ImYqL0JyA4p95+SC38XbOoxlTbUyOgGY7+aBPyPpC6NgRTzAHg92siUlFxEhm3olReik
         2zNUFAEeFXvA/EXlg42qs5DoJCeGPD0efucoC+esFnELqjhO9qUj2rveosnwnT78ncVZ
         PUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xvfpVd2OzH4+o/D/vVDC31Zzvji7CpUDutlyGbWSS2M=;
        b=eQN4hG04FX2dLclyEdy79SypBA8PR4CQvS7lXrjMAwDeWNw6fL2xtwt44otxsu0rNY
         2qC2S/UvrNVVGFdLOd4YTM3Qw7D/rgcZ2UsLts+QEGCQXTj0u2DrmzXD9TE2V6pYHuzm
         q/AOZdeONyNOr6/ZfHgWKyZcYQ65aNUatO/POtCX1K6HXDYGbDdJn6J1xI3gY9FseIAZ
         u4lSQdr4KzFPcVGBGBdywenjStFdAvbb6+hwo8XXj+STFi972RSFldVSHiO3Ce/9IHZi
         ACRW0zD5TT56NqDt6Mnw/aTM9qL9Qq5Hfv/K9LzqSG+elyWJ2zlplaOnNSGaSAsukmJB
         sSuA==
X-Gm-Message-State: AOAM530fo+Kf+AEUxyPW0B0c1fVAslZbogE0XIrutIZSuCZiwD8LpqoH
        JC01qXMIHIi1kPt71JsJPzzbfus60rSFDiQbYLE6vQ==
X-Google-Smtp-Source: ABdhPJwkNqh6VetR4pQ9osWleGLD8Gu670e5ZwNiJj7gabab2EtxcbnJLTI/hP8824g6eoId8EW/5PjT89tzRHZhP7w=
X-Received: by 2002:a19:8083:: with SMTP id b125mr3166068lfd.204.1621627700167;
 Fri, 21 May 2021 13:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201110034934.70898-1-john.stultz@linaro.org> <CAF2Aj3iEUkBDyyWDT63iT_7KrquOcEo_L5rCteGF1OJg8Ux3ug@mail.gmail.com>
In-Reply-To: <CAF2Aj3iEUkBDyyWDT63iT_7KrquOcEo_L5rCteGF1OJg8Ux3ug@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 21 May 2021 13:08:07 -0700
Message-ID: <CALAqxLVPj_dhkME24hYc_fqMOfPRydQjVLSq26gKV+pEAWaw-g@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
To:     Lee Jones <lee.jones@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 21, 2021 at 2:40 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 10 Nov 2020 at 03:49, John Stultz <john.stultz@linaro.org> wrote:
>> This series reworks the system heap to use sgtables, and then
>> consolidates the pagelist method from the heap-helpers into the
>> CMA heap. After which the heap-helpers logic is removed (as it
>> is unused). I'd still like to find a better way to avoid some of
>> the logic duplication in implementing the entire dma_buf_ops
>> handlers per heap. But unfortunately that code is tied somewhat
>> to how the buffer's memory is tracked. As more heaps show up I
>> think we'll have a better idea how to best share code, so for
>> now I think this is ok.
>>
>> After this, the series introduces an optimization that
>> =C3=98rjan Eide implemented for ION that avoids calling sync on
>> attachments that don't have a mapping.
>>
>> Next, an optimization to use larger order pages for the system
>> heap. This change brings us closer to the current performance
>> of the ION allocation code (though there still is a gap due
>> to ION using a mix of deferred-freeing and page pools, I'll be
>> looking at integrating those eventually).
>>
>> Finally, a reworked version of my uncached system heap
>> implementation I was submitting a few weeks back. Since it
>> duplicated a lot of the now reworked system heap code, I
>> realized it would be much simpler to add the functionality to
>> the system_heap implementation itself.
>>
>> While not improving the core allocation performance, the
>> uncached heap allocations do result in *much* improved
>> performance on HiKey960 as it avoids a lot of flushing and
>> invalidating buffers that the cpu doesn't touch often.
>>
>
>
> John, did this ever make it past v5?  I don't see a follow-up.

So most of these have landed upstream already.

The one exception is the system-uncached heap implementation, as
DanielV wanted a usecase where it was beneficial to a device with an
open driver.
Unfortunately this hasn't been trivial to show with the open gpu
devices I have, but taking Nicolas Dufresne's note, we're looking to
enable v4l2 integration in AOSP on db845c, so we can hopefully show
some benefit there. The HAL integration work has been taking some time
to get working though.

So it's a bit blocked on that for now.

thanks
-john
