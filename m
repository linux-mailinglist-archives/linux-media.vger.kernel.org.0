Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822D6441988
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 11:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbhKAKNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 06:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbhKAKNn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 06:13:43 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A617C0AD95D;
        Mon,  1 Nov 2021 02:59:23 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id h7so63103911ede.8;
        Mon, 01 Nov 2021 02:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CgVIxgXPJqto+1GyJDRV5V4m1lHYgJ03cyDgZVbshDA=;
        b=HZbhNpdJr/66I7R4/BovtQEpejyFJ9Upf7lK+LjwBNXB06p+v8s783QzPk5eQN3WYB
         SFvEJ+CkaS9+3QwiebwmS98mx7s9DpLyJ7V5SlfBIto7dSuGmlatr6TIgGaeu/TZcBvT
         xmRskFToShPXPcflvw9SLQ7g5w1hLAHbPmEBBAsEuxnLHiIikurj2F8hjx5AYMeoF9+r
         WGI4bRORlCI4VQPpnBaYQa2vaErVUjHiKdfT9hPDSwipRSlgmmGFEz8rmlDwic4gfGyz
         dDO4aBqo/qHDsneMIgTrNXBg2h6vjLrWyco0BeiiR8DxbC07Q3xp5nMNbbSr5jEdLrQ9
         QcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CgVIxgXPJqto+1GyJDRV5V4m1lHYgJ03cyDgZVbshDA=;
        b=ZLnVh48HeEYKGvt2BaYA0b56BXWW6PKNXkz/2QG4n+dz7YBKmtDkRZ1sHdUnqsUuwJ
         zITj/VHxZ72r5/BGOoFeybYCF+noaueKOQl7YGpzCn4cbZNyw8aRINp+l0HrGyoqRNf2
         HneGxcreAblHwGtnrkYFVaKM7sE5Er5D/9VHXRugCz+mq5/kwSeHFlECQYrIj+j1PLkK
         1Ir8qS/NmgAM2rRrIqmTrlipAhBTjjut2pltV7L/zrNBRGu63PzankveGoL2S/RbIxDV
         6q+t3Fd+q4bLJQNWnnXEMKglpjvoKa8IZ2V4ZjrubcaFyCSeT32kjHTE3nqkcF5vkYyp
         NhRw==
X-Gm-Message-State: AOAM5320VUqM4gxPB3/BYqk5aT/cQxqwpmYg7nazHKH7avle6PamCRuT
        22ohl0PP2DY61Ull/wALhC4gzgBreY+2RAihL+k=
X-Google-Smtp-Source: ABdhPJzgRggZ7bqiDtGi2xeLUvn0fy66w5Qw/bS4IRmvBFVdfXhRK08STLRJY3E9lxwjMNUMNcX0Y0diRJHkdEzsVLM=
X-Received: by 2002:a17:906:6dd2:: with SMTP id j18mr35162242ejt.468.1635760762098;
 Mon, 01 Nov 2021 02:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com> <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com> <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
 <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com>
In-Reply-To: <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Mon, 1 Nov 2021 17:58:56 +0800
Message-ID: <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 1, 2021 at 5:43 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 11/1/21 12:41, Dongliang Mu wrote:
> >> Hi, Dongliang,
> >>
> >> Did patch attached to my previous email pass syzbot's reproducer test?
> >> Unfortunately, I am not able to test rn :(
> >
> > Yes, it works. The memory leak does not occur anymore.
> >
> > But I am crafting another patch based on yours as there is a small
> > issue in the retval and I would like to make the error handling code
> > uniform.
> >
>
> Cool! Thank you for confirmation.

Hi Pavel,

Thanks for your advice. I have sent the patch and you are on the CC
list. Can you please take a look at and review my patch?

It should cover your patch. But I am not sure if I introduce any new
issue in the patch.

>
>
> With regards,
> Pavel Skripkin
