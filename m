Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3ED243D966
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 04:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhJ1Cjn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 22:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhJ1Cjh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 22:39:37 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA711C061570
        for <linux-media@vger.kernel.org>; Wed, 27 Oct 2021 19:37:10 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b32so7153022lfv.0
        for <linux-media@vger.kernel.org>; Wed, 27 Oct 2021 19:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Asrvf8VKIa9PPc0PcDfVcEUpJs3EokG9pVSaXKxHXk=;
        b=nSO8B/yA59Gwn6Wv3e74FdSXTK2cV4tH7evpbsbTVUD+2g6JyuUdT/4TM4CJmJ7ieO
         PfTCUF9sSDSAZun5z+6UPxfVH2aBGt7+k2FBNikDZsGG90LQJxC1oZ1S5XEzzejdZ6F0
         3+MgSj6OO/Grk/UZTepbHgzl3fe0HOhFSm1p4HG2ln67Zu+FpMUy0MXuqEbI4KLJSQvg
         hSNoH34CFp9owrupPuUAY3WbVZBCiNFnsmUPN1h5rkf0LZjUHOJYGM+w/mhur45wC28R
         FjzvqFK8CXQxIiUdsffw39c0bbptQyKKlwJM1VcDQZuSISj+PsBSz1dksMyVCyu+z0oD
         /skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Asrvf8VKIa9PPc0PcDfVcEUpJs3EokG9pVSaXKxHXk=;
        b=XxRMCH/jhm65CX1gPnKU1suAzvmQsfBdP3syDo4cKktbZv4M3s/7dL9vwdH9sfKaLM
         SKiVZOU8si/Ppsp7dW/9eweXvFIOWe5LDXoyM517Cn41+vK3WeUqX1DENnSs4v6KuBMN
         1QgZxBCcJjDXGsA4F0QT9nXn/UJkz0/wpLtAKrmZ1KJhw0nCtB5ksHr6sk5rLwaFytrb
         u6jhNC8RmGuXKxT9VPNyIdGXMWz9JzLd/ua6mPqT2Rn2/g0MbZPTe69Vf2RSPyLqV0gY
         ke2xak/EuZp1WmyKot/UsMXLzJwVffV4KJ12fNFVTb4iAAM7pFqS6SwcJWEBIzx8G1F+
         O/bw==
X-Gm-Message-State: AOAM533tVRpTXp/c9xMe97A62wdL6CYQ0Ce27IMzvdXIZCEYunSyem8J
        vD3CpxECbmGNS6nOD7WX8gLco7INHDWk5YPGPuUcBQ==
X-Google-Smtp-Source: ABdhPJwbkWHrBR3Txzie7bFm6VY0aB2rJomt26Se7hlzs0ULD1c+bKST9SpunaEM+xqGVmFAubOKxOkwV0AoORjNGzQ=
X-Received: by 2002:a05:6512:2399:: with SMTP id c25mr1432339lfv.298.1635388627753;
 Wed, 27 Oct 2021 19:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
 <CALAqxLXjh9o925G9smW+uwWqKDarsvrBuzr+UL1CsQc4m7W+oQ@mail.gmail.com> <5c3d9b0a-8c68-feec-74b6-59f2e29b1d11@linaro.org>
In-Reply-To: <5c3d9b0a-8c68-feec-74b6-59f2e29b1d11@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 27 Oct 2021 19:36:56 -0700
Message-ID: <CALAqxLVn0ZARrj1Syvie30Tw__NdNN4-KUCdm8wSfc9aWha3kQ@mail.gmail.com>
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and enc/dec
To:     Tadeusz Struk <tadeusz.struk@linaro.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 27, 2021 at 5:19 PM Tadeusz Struk <tadeusz.struk@linaro.org> wrote:
>
> Hi John,
> On 10/27/21 17:01, John Stultz wrote:
> >    Thanks so much for sending this out, I definitely would like to see
> > these crashes sorted!
> >
> > Unfortunately this patch causes some odd behavior when I use it with a
> > modular config.  The display does not start up and trying to reboot
> > the board ends up with it hanging instead of rebooting.
> >
> > And booting with this patch in my non-modular config, it just seems to
> > get stuck during bootup (I suspect waiting on firmware that's not yet
> > mounted?).
> >
>
> Thanks for trying the patch. With this patch I was able to boot android13
> running 5.15.0-rc4-mainlineon on my Dragonboard 845c with the default
> config common/build.config.db845c. Without it it was crashing.

Hrm.. For my module enabled build I'm using the current
android-mainline as well w/ AOSP.

Still seeing some odd behavior, but I'm trying to isolate what change
in your patch is causing it (as it's not obvious).

thanks
-john
