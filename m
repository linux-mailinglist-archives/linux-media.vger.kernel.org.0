Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448B1441B2E
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 13:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbhKAMeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 08:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbhKAMeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 08:34:09 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A432C061714;
        Mon,  1 Nov 2021 05:31:36 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id f4so5582226edx.12;
        Mon, 01 Nov 2021 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qto1d5JIXD/QqDsIJGSoCTbsHoPtJJlBHj7tkgHwuus=;
        b=Aj4dfOmh19Kyot7MDw1kYbovj7X49JqrptseqihRmAwB2uv1pvqGNWJD6dJqdzj9Zg
         XAB3Jl2+/zvaQJphV1fHQfa3+vckdXdys5zxFm7NZ9ETe6xb3TixfFlhMLxalgf2qXXh
         pDgNrt3C6ybGrQrZgsf38swcqaMnW4vW91fvxjLuMG8DzgIrhxh5z1pvPQxREa1nPii5
         6kxT7nihcfjb4cQR/CoMUKkGUjZVpMA3eGCP6O86Pdrcr4fk6/RoXIQPtYoFiumVDIZ+
         EAl6w2PuHYifrIjnSr0A9oxboA0wiq+BZhxIwkEMT6M3tTACJaCZJoPNVotRBKSA0z6t
         9WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qto1d5JIXD/QqDsIJGSoCTbsHoPtJJlBHj7tkgHwuus=;
        b=WGW/ATM0/o1n2ckgoKMxP/deJ6dZ/OPyIBDoleRFXhJoWk2sCEW0NSs2fKphTiFdzQ
         KBVPTU+yVVnPfZAGK9K2vyXqb32vlS0jbIYSmHWExN1T7hV1YFhvmDkgAcS1yjWx1oVq
         y72drj36NRJX5TBsGoIBTDLaGJNedAPUMZGw2xYw076Q6Yzt5CMDlHBogkjYsNFQsSwW
         LfVRj+EsU8RX6C5GwCpoETxKvs7Okxqe69lMblecxPmJ/Vb4RUYJ6xaC3GHzCwB7RAWm
         N4DNV8u2L85MCW2IlxJg5RuXh608/AGyIs+oZdYdKbO+Jg8Ukwl8Qut08C3Hup5HXV6/
         hQ3w==
X-Gm-Message-State: AOAM5306N5lHHaG126dy/4zOXaQzHyVvA/aS1jZa3xSA0WqGN+mJaYoS
        9MJD2XfoyWBtz2TrR624evlRK/1mSgRKQ3IGzgM=
X-Google-Smtp-Source: ABdhPJzOd0419V+6gM1oTF3TtGEEChdGS0y+0AmBCD8PFYmtCJhYguMrXOTCReJarv64RxztdyX0ScIyn90QiWhT6ng=
X-Received: by 2002:a05:6402:b0f:: with SMTP id bm15mr26844026edb.302.1635769894774;
 Mon, 01 Nov 2021 05:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com> <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com> <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
 <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com> <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
 <28a3777a-7941-6ffc-07e5-38456372cfb3@gmail.com> <CAD-N9QUcoKnEWw98XnBJZkas3AkwPonNG0K-PMROOwn8kReT5g@mail.gmail.com>
 <613828ef-085c-acbb-f54e-7819dc22c769@gmail.com>
In-Reply-To: <613828ef-085c-acbb-f54e-7819dc22c769@gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Mon, 1 Nov 2021 20:31:08 +0800
Message-ID: <CAD-N9QXHGRZugX9wMygZV=FzKgrKt1ZgDSbh+h9CbWBy5DUWJg@mail.gmail.com>
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

On Mon, Nov 1, 2021 at 8:26 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 11/1/21 15:23, Dongliang Mu wrote:
> > drop? I do see some patches from local syzkaller will attach this tag
> > to assign credits to syzkaller/syzbot.
> >
> > I think this form is good. Thus I copy this tag from them.
> >
>
> Sorry for not being clear :(
>
> I mean, I can't send my "Reviewed-by" tag to the patch. Missed that
> "R-b" can be also decoded as Reported-by

OK. It's fine. Just want to make sure we don't introduce any new
issues in the patch.

>
>
> With regards,
> Pavel Skripkin
