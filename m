Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B5D2DEC9C
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 02:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgLSBRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 20:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgLSBRv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 20:17:51 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42CEC06138C
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 17:17:10 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id h205so10149008lfd.5
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 17:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=kqfzYZjd8v2qCtr+CwGBLV3Vs/0PzggZH8o2lrmVRy4=;
        b=ls5MoaMqVOyX5M6LeJ7eYoWXDLcSL2zNpvZdCh8SldBLA67re9nR3vHyOr9Kk845sS
         EL3Ta6jkQM+r9MiA76QGqXSQN9M8bA1OAzpN4vxrPndmuVcBUIDqzCLU7Ehrxhy/qkJ8
         lSr9P+WugopXsX7cQ6F0rx08k2CPzs0XNLdixfRVDsPviFrVwtFzuKu+r8QAMqrSxkGl
         yaZZDujJhyMeX5FDAax0n1odd8tQAmYwOy9ca8sfIeuoQdSrqYzTHZEik8Lcu8D3+SHT
         QB8WMkr44X6wnzsjCZgUeNp17FOX/Ftfku/Ea+p9go1GbGHfSlfrj7dub0jmJpY2g/1A
         5hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=kqfzYZjd8v2qCtr+CwGBLV3Vs/0PzggZH8o2lrmVRy4=;
        b=oXkeNlNXI1ULVbg7GD1WQ7ReVbplAGFl1Lx0lRs/XbKs2r2CfwNOs5rnENrReJXa0b
         EY6lrHnoVt11DT5D3mEePZiBFIrYRhoRLAmiwDLmXgHj3JqvrX55MuRX1i5PNNBGnUpK
         LEkHwaptNGo9u9AfyrIFT6cvemwngu8l4pSISaW1MkdMD0c818nqIvSKdLavLBLxgHG7
         vBTehr3KTiy38lOucSvDfsU7cWYxAh9YzCXwgeByebeq8x09Ms33a1wtcw/9h5xfQ0XU
         uE6EmgmnPOVCMP1dvM2FBl1KsB79RSCNqLXF6KZHIsSMhFoyjd94w/QLGnCb93pSxKkM
         yAIw==
X-Gm-Message-State: AOAM530L9TMi2yEdN4062u81T83oLnhksJGu5AjMD23AZXK3vl4Uxgzz
        5RcOurSzcYIQO2RZuzIqWvgN6Zmysn/GqUPirCEF4w==
X-Google-Smtp-Source: ABdhPJz8IyC9TNugB6b1jNzXWdqS4aLXJgFDsDKLMZm3d17IGbYv/wBtt5j26wi/EUUufPG4L1ZhUKiFX7ma0puzRyg=
X-Received: by 2002:a05:6512:6c3:: with SMTP id u3mr2309354lff.204.1608340629119;
 Fri, 18 Dec 2020 17:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20201217230612.32397-1-john.stultz@linaro.org>
 <20201217230612.32397-2-john.stultz@linaro.org> <X9y+YZujWBTHMuH3@phenom.ffwll.local>
In-Reply-To: <X9y+YZujWBTHMuH3@phenom.ffwll.local>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 18 Dec 2020 17:16:56 -0800
Message-ID: <CALAqxLVtYVGSSYtFmMK6oM9JSEmY4RAXra89sECL2Z4YGPic0Q@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Hridya Valsaraju <hridya@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 18, 2020 at 6:36 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Dec 17, 2020 at 11:06:11PM +0000, John Stultz wrote:
> > Reuse/abuse the pagepool code from the network code to speed
> > up allocation performance.
> >
> > This is similar to the ION pagepool usage, but tries to
> > utilize generic code instead of a custom implementation.
>
> We also have one of these in ttm. I think we should have at most one of
> these for the gpu ecosystem overall, maybe as a helper that can be plugged
> into all the places.
>
> Or I'm kinda missing something, which could be since I only glanced at
> yours for a bit. But it's also called page pool for buffer allocations,
> and I don't think there's that many ways to implement that really :-)

Yea, when I was looking around the ttm one didn't seem quite as
generic as the networking one, which more easily fit in here.

The main benefit for the system heap is not so much the pool itself
(the normal page allocator is pretty good), as it being able to defer
the free and zero the pages in a background thread, so the pool is
effectively filled with pre-zeroed pages.

But I'll take another look at the ttm implementation and see if it can
be re-used or the shared code refactored and pulled out somehow.

thanks
-john
