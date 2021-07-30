Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C433DC000
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 22:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbhG3Urb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 16:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbhG3Ura (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 16:47:30 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56A2C0613C1
        for <linux-media@vger.kernel.org>; Fri, 30 Jul 2021 13:47:24 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id a93so18090174ybi.1
        for <linux-media@vger.kernel.org>; Fri, 30 Jul 2021 13:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/0jhFaIN74qXsSiikohXu8cl1HOkpOoIv692ywasfb4=;
        b=f5K+q+/Oav1k+ND8XrBFrsylqIwwScjanXzx54x+wWsM1L30VD11ldf0yyGhC6g7KY
         DkQgH6qE9CkgcEjm6N3PPIKFeHC51RjCMNgjyCK/Ku+wzxIs2V8vvlseAhpSTeH2FyQh
         FwdDA+Xe5Iv+cqI/5Vz1svm6MMJWWO1MlXmmhFOVpuVQSBvop2X4AiHx9Nx5TO2JzdOv
         X2p1LiNz4owqBu0jMURSKY8F5ohal27/DFW7J839MGvrGXWNDKKBqiE5SY0SdNQnxmIC
         ugOf4UlvuhnYk10moYg/rK2MR5989RxMz4VkdYixaorPPCX435aCyGqionTt7tHiylWv
         9XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/0jhFaIN74qXsSiikohXu8cl1HOkpOoIv692ywasfb4=;
        b=KKgOtS5C7ckNX5FT8doCFi/sNpAKOtzn9x/KQN20YnOIuePKFrrJ9/P1nq4vs1NAAj
         vccxPfgx7GRfta0oUFnWLNCP+RfFR/xp1eLiyiGiK8IkjNcT+JMqsnK+8Pk9hmv/9JLy
         zyNN+qY5aNf+iRbTEkYZDu6vlufz8G9UY/7NiNqqi85p9C1JIRKipyzVDV1sBkqIj9oe
         Nu4XdUrudCxcisobEkh6vqQIlB3ynOEz/sf5eTcO14/ENFZYFLAe8tIt38+72AbnwWVX
         IjQ1PMHsWpJauw1M+sRGyMNvGU+FCGO+/04dzIdjSI5Bn70/DIEujJ25mdO2nn2yPkDU
         vvDg==
X-Gm-Message-State: AOAM530jDDc7ihxDtaeZb+Nfgj7r5vherqru1Lp0JokIX+k7LJPSESS/
        LxLLPxDParQXp+OfCTLH4VIBD9E45q6wpxYygiv22g==
X-Google-Smtp-Source: ABdhPJx/oaMRUi+rJ7Z7rv6fnGibfQ0yMvYpuQi7W+qHjbMi+UQmXv0MyKu1dcrOKPeHXBs23Hd2JO/NCMi+ib63UCE=
X-Received: by 2002:a25:2155:: with SMTP id h82mr5794127ybh.177.1627678043828;
 Fri, 30 Jul 2021 13:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210729070330.41443-1-christian.koenig@amd.com>
 <20210729070330.41443-3-christian.koenig@amd.com> <YQJXi2JNZdH5DaR2@phenom.ffwll.local>
 <CALAqxLVN7RVz3+z1ZvkRHeb2=Y4KbpbTOw-8St0D+Lzt5U-cFw@mail.gmail.com>
In-Reply-To: <CALAqxLVN7RVz3+z1ZvkRHeb2=Y4KbpbTOw-8St0D+Lzt5U-cFw@mail.gmail.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Fri, 30 Jul 2021 13:46:48 -0700
Message-ID: <CA+wgaPNVp4ci1otArWNA1k+TGdHYgwz-ObWR0M8YO5j+gCfmQQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] dma-buf: nuke SW_SYNC debugfs files
To:     John Stultz <john.stultz@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        Alistair Delva <adelva@google.com>,
        Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 29, 2021 at 9:52 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Jul 29, 2021 at 12:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jul 29, 2021 at 09:03:30AM +0200, Christian K=C3=B6nig wrote:
> > > As we now knew controlling dma_fence synchronization from userspace i=
s
> > > extremely dangerous and can not only deadlock drivers but trivially a=
lso the
> > > whole kernel memory management.
> > >
> > > Entirely remove this option. We now have in kernel unit tests to exer=
cise the
> > > dma_fence framework and it's containers.
> > >
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > There's also igts for this, and Android heavily uses this. So I'm not s=
ure
> > we can just nuke it.
>
> Eeeeh... I don't think that's actually the case anymore. As of
> android12-5.10 CONFIG_SW_SYNC is not turned on.
> Further, Android is disabling debugfs in their kernels as it exposes
> too much to userland.
>
> That said, there still are some references to it:
>   https://cs.android.com/android/platform/superproject/+/master:system/co=
re/libsync/sync.c;l=3D416

Hello,

Like John mentioned, CONFIG_SW_SYNC is not turned on for the *-5.4 and
newer branches in the Android Common Kernel. The references in AOSP
are only in place to support devices with older kernels upgrading to
newer Android versions.

Regards,
Hridya

>
> But it looks like the actual users are only kselftest and igt?
>
> Adding Alistair, Hridya and Sandeep in case they have more context.
>
> thanks
> -john
