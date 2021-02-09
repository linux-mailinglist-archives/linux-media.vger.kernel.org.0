Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEE131558D
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 19:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbhBISAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 13:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233340AbhBIRw3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 12:52:29 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C74FC0613D6
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 09:51:44 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id v5so27517994lft.13
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 09:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lPHiyshAYwDQMHuL6XjRLdFg31CtAL5tyF9gpmIlpuY=;
        b=HJ5GboupBRdvDYdE3+c+BbR5L/+b2RNlFkvzE9cvoL6wUi5kai3keCUCA7nryHiCd9
         KZ3EkSj8HtcF5NHOacJ2DKgRbJq7+2M2OkSkGrKJZ1QfDuumWkiM3g/4k2dCJKJwKSa5
         6wTjChskPuNHFsigYkPnA1oqTgJysg4meINj2mKinshoP6WLM8uhnsSlEReEmV/goHKq
         +PA2MVXgPDi77Br/AHMo2t9XdIQaZ/R4zYEYcjcjrTWHaJakWPlCa0sRm5a9pKAkO8rE
         g+xankyDbezGdQby6sGXMuEhWWxnBLn6k0/eCMRPS1k2QJ3Lfp+whhovYPf58UBCPywU
         YZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lPHiyshAYwDQMHuL6XjRLdFg31CtAL5tyF9gpmIlpuY=;
        b=JGqc2RF0L0NYsgvnaNWc8k8/A3fSdEE00mS1o/ToPuwZYOV20Uw956iMVZYuIWQBN2
         DXK3kMBRRBT1VVOx+ke9bABKOYfO8rcB7mJmA+quvZEwTiBWxp4cdwRs+Yxun8ri4JAQ
         pdTM6dfhyBjwl42Zl2z5X/5NWm0Amjdb8n58upyjxDTGAgnD5LGZbjvU7oo1dZt6ufgH
         iCkaRhWNcq9LKgRibQklrKf8Ec/Kp86bucwTCd423q2WZb/qL85mcmwNHn1WhErtRsAc
         PvxGxkJ9lUSpifhgFgYOw1OEbjwFuN7pvJLkiybzNgIsawP8olspcUPtPtboEQ5cIS5U
         fTmQ==
X-Gm-Message-State: AOAM532a8XbsxXSxB7kHScNgcbNg3jAtMvFx8zOAPwr4Qs8szffsleMn
        tltHzdoQfzxTscFp/9hWe7unqdWX9kwTPFN+0A2/OQ==
X-Google-Smtp-Source: ABdhPJyNwqJrbPEm56X5Fd4wgWqY/yJveLKo+1aKW+tRmsIXUbv7TTBoyddE0ravmqPusmp1ermnDhlEtsPwsnQQS8w=
X-Received: by 2002:ac2:5590:: with SMTP id v16mr13571451lfg.626.1612893094231;
 Tue, 09 Feb 2021 09:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org> <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com> <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
In-Reply-To: <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 9 Feb 2021 09:51:19 -0800
Message-ID: <CALAqxLVDY6HkTZpXtJ1+V9E-shgtxXn4A5MB5nAaCbwr8AQV6g@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool implementation
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 9, 2021 at 4:11 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
>
>
> Am 05.02.21 um 21:46 schrieb John Stultz:
> > On Fri, Feb 5, 2021 at 12:47 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 05.02.21 um 09:06 schrieb John Stultz:
> >>> diff --git a/drivers/gpu/drm/page_pool.c b/drivers/gpu/drm/page_pool.=
c
> >>> new file mode 100644
> >>> index 000000000000..2139f86e6ca7
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/page_pool.c
> >>> @@ -0,0 +1,220 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >> Please use a BSD/MIT compatible license if you want to copy this from
> >> the TTM code.
> > Hrm. This may be problematic, as it's not just TTM code, but some of
> > the TTM logic integrated into a page-pool implementation I wrote based
> > on logic from the ION code (which was GPL-2.0 before it was dropped).
> > So I don't think I can just make it MIT.  Any extra context on the
> > need for MIT, or suggestions on how to best resolve this?
>
> Most of the DRM/TTM code is also license able under the BSD/MIT style
> license since we want to enable the BSD guys to port it over as well.
>
> What stuff do you need from the ION code that you can't just code
> yourself? As far as I have seen this is like 99% code from the TTM pool.

Yea, it evolved into being mostly logic from the TTM pool (or code
that was very similar to begin with), but it's not where it started.
My old days at IBM makes me wary of claiming it's no longer the Ship
of Theseus.

So instead I think I'll have to just throw out my patch and rewrite it
in full (so apologies in advance for any review issues I
introduce/reintroduce).

thanks
-john
