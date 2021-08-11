Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944183E8D5F
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 11:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236668AbhHKJmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 05:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236678AbhHKJmX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 05:42:23 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15130C0613D3
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 02:42:00 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso8670673pjb.2
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 02:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ET1+ZjzComT36ndSZVUKzhjE6lLi2eturMaqxLGm5O8=;
        b=ePOqM1Pw/3iTBXH81cLS6rrfbNInK4idxR4KGzIJxEFexp0L9Fu4L0Hjqha1giq9j5
         iF+ZxqxJv6mlVr8uZOFQiWimlcClZ2ojE7Ya9lQ5Aa1MzrqCAzdnrtkUMmJKQfK0YQrq
         F92rMiB2PKCmYomVyVotPwnUxumq59SldIvA4nXWI0oVxfRDk1WjuEGiNvv5DScTgjPw
         jt4ryfojp55ZSYKI/C9m4LslwkaHBhr/S/GrX3Qi81V3/kJ+Vt8lws73SDzo7ZsnxYuV
         KZrUE72+p8qM4yyVeb3UQptDzU1ITUxaaHfdWNt16bdBQNFmGMLQ7/fbkPp/ceu6nj7h
         KzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ET1+ZjzComT36ndSZVUKzhjE6lLi2eturMaqxLGm5O8=;
        b=eLJeySBpeSvEfq5M5KO5GuW7DXbqeCL00AuZG5d11MnjYVoF/nPmz1qLTpfl/rduMn
         N3p0X02x0BtfvwfC95B4LYEwQllv7x1ayMGqLqmxFfykqJjNLw8FTybqTmTRZ2o6YYx/
         Cu+5qJqXKUNuYff2z7twFmCwj1zl9aDvD7dFT3mqqvPYSomuJIsq4/FWK5libedgM7/k
         liUUauX5Kkgs2SkDN7q48dESnJd7zhQ0LQy2IOCNSnEOp57BqxV33GUXcwFYYhMz6A7s
         tWsyvI8IKPyMrWZNTv1ov77UL5RysPZi/s5fljMlyQIOiXqEnWh6QqPRbuspkW/8ymnm
         ymWQ==
X-Gm-Message-State: AOAM533nFoTscuiLceH9qhqHFOz+/UvsdKyNEVKnqLcUassHaelVDP43
        H2zDyFT8S4r+5bImyg5KsL/XZKfwVfMVeO9GpbUf/Q==
X-Google-Smtp-Source: ABdhPJxYgVxxqbLY47gEt/zvPvdFQD/c+j2VIRTiXnc9r1HKIEXV3Jite9T1g1lAykdBzTwD9KpUlN6GismQCJ/lQn4=
X-Received: by 2002:a63:f754:: with SMTP id f20mr99905pgk.385.1628674919479;
 Wed, 11 Aug 2021 02:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7@eucas1p2.samsung.com>
 <20210810103336.114077-1-robert.foss@linaro.org> <0b694e24-5cc8-4944-d3a2-115306ae7b89@samsung.com>
In-Reply-To: <0b694e24-5cc8-4944-d3a2-115306ae7b89@samsung.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 11 Aug 2021 11:41:48 +0200
Message-ID: <CAG3jFys+ch86Y7338-DH1+8Q4w5eK83revVsNwoVCugwXeqjmQ@mail.gmail.com>
Subject: Re: [PATCH v1] media: camss: vfe: Don't use vfe->base before it's assigned
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Marek,

Thanks for testing this.

On Wed, 11 Aug 2021 at 09:48, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 10.08.2021 12:33, Robert Foss wrote:
> > vfe->ops->hw_version(vfe) being called before vfe->base has been assigned
> > is incorrect and causes crashes.
> >
> > Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version needlessly")
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> With this patch applied on top of linux next-20210810 instead of the
> NULL pointer dereference I get following error on DragonBoard410c while
> loading kernel modules:
>
> [   18.480608] qcom-venus 1d00000.video-codec: Adding to iommu group 1
> [   18.536167] qcom-camss 1b0ac00.camss: Adding to iommu group 2
> [   18.600373] Internal error: synchronous external abort: 96000010 [#1]
> PREEMPT SMP

I'll spin a v2 asap.
