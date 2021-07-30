Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F35D43DB27C
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 06:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhG3Ewi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 00:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhG3Ewh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 00:52:37 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC17C061765
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 21:52:32 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h2so15318084lfu.4
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 21:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ngOm50/YMKcUx0bA3+RSYUsPg/JdRRvBdoD4piFXpKk=;
        b=C8Jp7VhFjs0rnaOQ+PhARQZcXBqL3li1M1opg2ctxUM+UW431Xc6w3HRU9jqMEn9J8
         mjRiwwt+tWiXsLMDZKwx5ZLEtcnwodMbSLh35X6Dl8KI5jfLdkHovCiYFvU9yLOXdVzm
         T56dTYyum/xZim2C5bWj64K+N+jV8WY66Rg5/Bwn91Sn/snbwb/x3RlTxcAU29gmNhjl
         KgwS2oOAfASo09QS8QxiHdsYQiVobP5e9jTXOpOAtTaaFBAO8bP4tgRSWo5PZXJaTFyV
         bU5CM0EvtNCO+75RkPo/2Iit3ZJTxAR2kkb3LF3KCQ+AcEjKYyubIAL6gsTqWn2Kh4aO
         Xr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ngOm50/YMKcUx0bA3+RSYUsPg/JdRRvBdoD4piFXpKk=;
        b=AUIA0GQAHdpbbPLPRNpzDmJzXl0hix5sN9UyMy+Wii2AU4Bn29eLKbqtbI6IG8N5nb
         i/3e21FthKgmE8mOTochliQ9uRAYn4DdgT8Qis4KyB+cf2y2GbST16y6vCbONMi6HRwi
         w3zKm4s07x0mX1gx+7FyNMfPhrnBDDmuB8cyxe+z9OREGdgeU3nxc1AZi/fEeIM3j0O3
         pZykn//bmqQv3+4i2B7lDH4dixPT/waPIM5lowM1SFOdD0U6jcg06cM8ieoXVZRk7oyr
         mrQP8WMHvbL6o4cJgoK3JxVg5RsVL1k7prM5StFQBYVo79wSvFWX7H8PG8EGTWLhVidl
         q1iw==
X-Gm-Message-State: AOAM532oYuNcjFS7zl3TzVRShd9cYjemc/ZdXGVWXgYCrXefNBDpeUiV
        26R4GVjhk+/5vi6T2ZdEmPLFS5EyNjpPCcmXSDF6rA==
X-Google-Smtp-Source: ABdhPJzDU5NmVnsCGCr2QxJh2cy55utwKVijKkr1tTD5MHrq+mqK18bOqc1KLFYSb9qZZ3DlCCOrI4gJHyxXUU4u7Zw=
X-Received: by 2002:ac2:4a8d:: with SMTP id l13mr426511lfp.626.1627620751019;
 Thu, 29 Jul 2021 21:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210729070330.41443-1-christian.koenig@amd.com>
 <20210729070330.41443-3-christian.koenig@amd.com> <YQJXi2JNZdH5DaR2@phenom.ffwll.local>
In-Reply-To: <YQJXi2JNZdH5DaR2@phenom.ffwll.local>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 29 Jul 2021 21:52:19 -0700
Message-ID: <CALAqxLVN7RVz3+z1ZvkRHeb2=Y4KbpbTOw-8St0D+Lzt5U-cFw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dma-buf: nuke SW_SYNC debugfs files
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        Alistair Delva <adelva@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 29, 2021 at 12:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jul 29, 2021 at 09:03:30AM +0200, Christian K=C3=B6nig wrote:
> > As we now knew controlling dma_fence synchronization from userspace is
> > extremely dangerous and can not only deadlock drivers but trivially als=
o the
> > whole kernel memory management.
> >
> > Entirely remove this option. We now have in kernel unit tests to exerci=
se the
> > dma_fence framework and it's containers.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> There's also igts for this, and Android heavily uses this. So I'm not sur=
e
> we can just nuke it.

Eeeeh... I don't think that's actually the case anymore. As of
android12-5.10 CONFIG_SW_SYNC is not turned on.
Further, Android is disabling debugfs in their kernels as it exposes
too much to userland.

That said, there still are some references to it:
  https://cs.android.com/android/platform/superproject/+/master:system/core=
/libsync/sync.c;l=3D416

But it looks like the actual users are only kselftest and igt?

Adding Alistair, Hridya and Sandeep in case they have more context.

thanks
-john
