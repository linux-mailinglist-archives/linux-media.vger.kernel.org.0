Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB29F290BA9
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 20:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403814AbgJPSr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 14:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393021AbgJPSr6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 14:47:58 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F132C0613D3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 11:47:58 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id n15so3333949otl.8
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 11:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/6ZPAavAgIBaIj1gBG4jv7Gu9L4sN03UOtnPoYPnkGM=;
        b=lP4NOv51TEXmx39salQG6uTSU8gkLmkF8p4KPDm1dBqsQhZGdByHYty0AxeWaPaWU8
         IMBNfFJZEqSvFcX/JetY+udEH2E82sSSdgfZuuppOCDvedBZJjGbifYxGHw+S7eNMkl7
         Q4yPOvK7BXm8r1/s/BzGQMn0sLvwN7kWFqYfrHSd+w3n665ToypEQlxLHvd/d1PUW4vB
         lOcigsbdkdaso/ojnZ9YEwwCJDkWy14nmMFgohf3GDceQCc+WNSA+0TELgk0n2HJ8reg
         s0X2GbNw/6VhfYupl1ci+c1/LDuzgv37IEaqsXpF4sHnYq/fMeKyFnBOZQamOHM/6axz
         243Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/6ZPAavAgIBaIj1gBG4jv7Gu9L4sN03UOtnPoYPnkGM=;
        b=rxyr1RgMqcHVRr02H802mPSr6w65S25Z/aSzXQOC32G8+AYfPlgasQt5JO/1YdoZkr
         DIfKHdE1nCbPPxAiLV0h9UCiaoXAuy5U5sR5q/jSt7HtF5iXFOBfwr+w8JGwoCvIg2Km
         cuFk+YOysLs0ue6nHl8VOmwRaCsUOpj44JFz2wpes4/ctS35dgiho1grCzhU7gex6qWh
         aXpEiUfUw1oskVMTkk4LenscQ2h3KfdXBLYZfgenrDuhF2pm7MHUTK1EB1v22zrXrRW3
         hKciNPvXWhNAOahF4OXwvFnKBbP1aqC5tlDBgIRbgxAQkvj/5TpyekIv6zhIpR3eWoRA
         wwQg==
X-Gm-Message-State: AOAM5326O7oXtMSz0JphSFwezKWLaqco1wkUJ39P19WSFppJMpxv7iiM
        4W2/b6xdE9/36a7wMtdn5FNTx2x2xxD3IX2U0lykJA==
X-Google-Smtp-Source: ABdhPJwH6XcBKPJDC1Mm7DKnG5P/EL1ztBMF0+cVOUi9cs5EKrO3sGguh+sEF+ZQIE3ke+UzdUEAW/qfG0BqWAz8nWs=
X-Received: by 2002:a9d:2d81:: with SMTP id g1mr3546671otb.352.1602874077645;
 Fri, 16 Oct 2020 11:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201003040257.62768-1-john.stultz@linaro.org> <20201008113602.n7ju2hu3j6qsaxve@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20201008113602.n7ju2hu3j6qsaxve@DESKTOP-E1NTVVP.localdomain>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 16 Oct 2020 11:47:44 -0700
Message-ID: <CALAqxLUbL4ci4Vnwe6UM1OEFfLyirsQOr57nmx5NSe8Bb_yAwg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
To:     Brian Starkey <brian.starkey@arm.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
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
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 8, 2020 at 4:36 AM Brian Starkey <brian.starkey@arm.com> wrote:
>
> Hi John,
>
> On Sat, Oct 03, 2020 at 04:02:50AM +0000, John Stultz wrote:
> > Hey All,
>
> ...
>
> >
> > I did add to this series a reworked version of my uncached
> > system heap implementation I was submitting a few weeks back.
> > Since it duplicated a lot of the now reworked system heap code,
> > I realized it would be much simpler to add the functionality to
> > the system_heap implementaiton itself.
>
> That looks like a neat approach to me. Referencing your previous
> thread, I like the separate heap (as you have done), rather than a
> generic "cached"/"noncached" flag on all heaps.
>

Sounds good! I really appreciate the feedback on this.

> > While not improving the core allocation performance, the
> > uncached heap allocations do result in *much* improved
> > performance on HiKey960 as it avoids a lot of flushing and
> > invalidating buffers that the cpu doesn't touch often.
> >
> > Feedback on these would be great!
>
> Minor nit: s/detatch/detach/ on both heaps, but other than that
> you can add my r-b to patches 1-5.

Doh! Thanks for the spelling catch! Thanks again!

> As you've said, it does feel like there's some room for
> de-duplication, but that will be easier to work out once the
> implementations settle.
>
> I've a couple of comments for the uncached heap, but I'm not confident
> I understand the implications of having the non-cached alias enough to
> say if it looks OK or not.

Thanks so much!
-john
