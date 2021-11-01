Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874CB441B17
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 13:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbhKAM0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 08:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbhKAM0a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 08:26:30 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F182C061714;
        Mon,  1 Nov 2021 05:23:57 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g14so1706754edz.2;
        Mon, 01 Nov 2021 05:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=byDMT2KgXrMfovwaSAreY2Cp1u1Q+kqI2ntbv1QgSr0=;
        b=WCovBYR7ewTEY4L5Yq7VlrzOf++vNA7jZPfEM+HglKj7Hyu4WeEXBuIpbR1NwuRWyW
         CRxwFHwZL/9KKX2hf9NrCrpMA9dw4VE+dppv2SMDabFafAfyw8v/fuzCqL14YD9eYoUe
         CngsdbAkXNmk/YAFrtKcdGscFsSQ/PLPijEvIho9IHEHjaLG402Wp40b+IqbQgjieJ00
         iJ9KPf4UqMSZ5/Ar6q9IY97TqY7pwQgPQnjafguBKpxLNoezsB9xFbedoWvhTYzZSEHn
         ctjICtNWM3w7q+lurmLoC8EHksk3NHUx8qYPXs10Zv32ijND5pmqmhbMfvVKCE9nl6W6
         1pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=byDMT2KgXrMfovwaSAreY2Cp1u1Q+kqI2ntbv1QgSr0=;
        b=I+KR2fcQBLBeQ3FGhsyToEtdnySRLbNvQtg2qSbgLioaImAteZZ6q7PVfeyaH6gVVY
         YsLM3iTz+bDeZENfZX3jTqmkE2hOYiPsRrErsCOIeHNgLWUNR3GsCxRpQZrRiCaB0ly2
         J2DIqT94L2hUaTqJECp3L5SoJ1bSOLud2SnUPCmSFCItHSCO4tBDiY8B5dupzESHjx/Y
         IZYMxHvIrozSd1wyMJNTzdmIv0ZrFV+M8xPKf2ONxf6D+sAyQGWZ1n6JLh/MZaikHsvL
         /J51fqX6rMTYCdKPVFKGxV58cUfRwBhScawE3NCQLflMmiS09GZ6/KUtF3ALvDEFFMaO
         8yag==
X-Gm-Message-State: AOAM532K9xSse18uJJlbD9UvBJuJx97zBJ9APrVB8FmxUTgnG+BfwC88
        YAc8g4ywqfmQnVuEzVx8ZTWjNQWOfxMkAuOBpec=
X-Google-Smtp-Source: ABdhPJyyYPfSyzKu3jVpm0y22TKiaQ3LAK8DGZsbTwJdq2Bq/jToREVoh7kIqz2/C+o8W4evzEBZ6uDJKHCgHHjeXHI=
X-Received: by 2002:a05:6402:3489:: with SMTP id v9mr17166813edc.80.1635769435960;
 Mon, 01 Nov 2021 05:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com> <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com> <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
 <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com> <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
 <28a3777a-7941-6ffc-07e5-38456372cfb3@gmail.com>
In-Reply-To: <28a3777a-7941-6ffc-07e5-38456372cfb3@gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Mon, 1 Nov 2021 20:23:29 +0800
Message-ID: <CAD-N9QUcoKnEWw98XnBJZkas3AkwPonNG0K-PMROOwn8kReT5g@mail.gmail.com>
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

On Mon, Nov 1, 2021 at 8:17 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 11/1/21 12:58, Dongliang Mu wrote:
> > On Mon, Nov 1, 2021 at 5:43 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
> >>
> >> On 11/1/21 12:41, Dongliang Mu wrote:
> >> >> Hi, Dongliang,
> >> >>
> >> >> Did patch attached to my previous email pass syzbot's reproducer test?
> >> >> Unfortunately, I am not able to test rn :(
> >> >
> >> > Yes, it works. The memory leak does not occur anymore.
> >> >
> >> > But I am crafting another patch based on yours as there is a small
> >> > issue in the retval and I would like to make the error handling code
> >> > uniform.
> >> >
> >>
> >> Cool! Thank you for confirmation.
> >
> > Hi Pavel,
> >
> > Thanks for your advice. I have sent the patch and you are on the CC
> > list. Can you please take a look at and review my patch?
> >
> > It should cover your patch. But I am not sure if I introduce any new
> > issue in the patch.
> >
>
> The patch LGTM, but I can't drop R-b tag, since I am not an expert in
> this driver. Anyway, there is 100% missing clean up, so, I believe, you
> don't introduce new bugs

drop? I do see some patches from local syzkaller will attach this tag
to assign credits to syzkaller/syzbot.

I think this form is good. Thus I copy this tag from them.

>
>
>
> With regards,
> Pavel Skripkin
