Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E6C30AE5A
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 18:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbhBARsV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 12:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbhBARsP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 12:48:15 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1622FC06174A
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 09:47:33 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id w20so10664495qta.0
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 09:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AgfUeIVe1jpb/M6F0P7bbhlcNBnqRJlGtPeSWlWrNwg=;
        b=H3FaZxxzyZuwtJZDw+X2VKJudCQdCMJ2ygYLi0Qf5V//mVWO6L7WqlcwQ9U8E9ond5
         RUDoDd46ns28Shvs5MmoCtde6j5hHJ8Rvk7xGfNqpMMeePmV6Q/98InzgoTcUVbVfEBi
         3HV9cQ6j/cTZM1ylVBX6OIA/aYVXfC5kUr2sh8swHJiuN7SOrhRitf9VHgyq4m8Mxmdr
         I1/lArVNRLNw0LfAk+Zce4cLwosv1bpImH2f2WQFNnVEMz5WS8LigXq7/PvsCEua1ofq
         4Ezuedv9Dm5gK6d7zUQvV6d3N4IjLBqaHWNK3+qVtk1QTWLB6DsmEdChP31AH4xxmITJ
         ZeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AgfUeIVe1jpb/M6F0P7bbhlcNBnqRJlGtPeSWlWrNwg=;
        b=n8S09q/Ndc1LcfClIsmdHOxWdtvlXhoNyUJiuGS6PUbKigyQVRFMiwH/DZwMaQujpj
         GQOQA2vswhRBbO4Nr+3Ywtl8OPvnSWjd65JnmdDARerAH/VQvPtxa7EV/qEIGp+caaSP
         HowswUmlixGI+Lb0lUXE9qIDzXSSudpxzbdKD0anrh0n1HyjbnuuBjmMpfitQLahG5dd
         TFOfyGAF+jApqkFMLoxc1Dmfxn2mzNcyHvVuNJOsjy8Qa2x1hwPLHqlv4bfDmBuutJb2
         bO+9L//eF9qOVopQfsHVQBUvmHELTSrpdOXXA0ymT0aQ/QXVum/rrJwrfg3YRy0i6Fur
         m3bQ==
X-Gm-Message-State: AOAM533UplyRO7Qp/kVP2Ue/WdGjNhp6WF/rFHEUUggInm1cUAoNSOLt
        x6p/dTIRvEvKbBhilJxoDxnUcJ3DOQD29rGva8P9hQ==
X-Google-Smtp-Source: ABdhPJxMOaZ0yLi1yAK38wxAgfwraVY6iPAY9diM58gAjj5k0njFutl/YoK2inviAy8R2Ly4etp6FDp3dTzQV9acQjM=
X-Received: by 2002:ac8:6f0f:: with SMTP id g15mr2486401qtv.322.1612201652050;
 Mon, 01 Feb 2021 09:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20210126204240.418297-1-hridya@google.com> <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com> <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
 <Fu3J-fHQvkd_umZraMnhxQhFJR_JCDmgUssMBA4GJgRwo4UpIPKvVSh51Os9FQkABkhSL6tmEAV4vwBZa7hFWFTgujmjaBmrgqJJ75KM8ZU=@emersion.fr>
 <CAO_48GEzi2b5M8Gv2E2L1s76VcPksA812ZqY1ihbpxkDkwb5_A@mail.gmail.com>
In-Reply-To: <CAO_48GEzi2b5M8Gv2E2L1s76VcPksA812ZqY1ihbpxkDkwb5_A@mail.gmail.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Mon, 1 Feb 2021 09:46:54 -0800
Message-ID: <CA+wgaPPfUcNGnW-GKZxtkzniMZcM=sNG7AHS+tUu=B2jCStOzw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Simon Ser <contact@emersion.fr>,
        Christian Koenig <christian.koenig@amd.com>,
        Android Kernel Team <kernel-team@android.com>,
        kernel test robot <lkp@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        Hyesoo Yu <hyesoo.yu@samsung.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 28, 2021 at 6:35 AM Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Hi Simon,
>
> On Thu, 28 Jan 2021 at 20:01, Simon Ser <contact@emersion.fr> wrote:
> >
> > On Thursday, January 28th, 2021 at 1:03 PM, Sumit Semwal <sumit.semwal@linaro.org> wrote:
> >
> > > Since he didn't comment over Hridya's last clarification about the
> > > tracepoints to track total GPU memory allocations being orthogonal to
> > > this series, I assumed he agreed with it.
> >
> > IIRC he's away this week. (I don't remember when he comes back.)
> >
> > > Daniel, do you still have objections around adding this patch in?
> >
> > (Adding him explicitly in CC)
> Thanks for doing this!
>
> Best,
> Sumit.

Thank you all for the help :)

Regards,
Hridya
