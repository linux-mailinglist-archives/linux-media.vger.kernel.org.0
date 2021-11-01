Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE8C441CB4
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 15:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhKAOhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 10:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbhKAOhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 10:37:00 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24167C061714;
        Mon,  1 Nov 2021 07:34:26 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g10so64803098edj.1;
        Mon, 01 Nov 2021 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=59nj95Ekls7NUFeMKvDiJy4kys1zmNJidS9kCaGvrYA=;
        b=f+IwQowfOjztKU0XydoYUPi4XPmBa/szZSuymoPg6EF0G6E2hxrdSBnXJEP530Ogua
         /y4dGy5cvmKuQX7KaLXSDy8387/z9GJ5EkIxBpYbWj6WdhAlLz+gjt/1IZEryKmbDiKk
         11QfLPjdF6AhFMGYsbzVPMY9mJx52GSVAoNHrpMRO6kB0MKsugqIgGdKq6o3yoGLPVTZ
         ZOKv7XzZRss7nMKhQ6gQKhjq8twJlC1jsWtzaIOHGVbAefgbZ0ZDGicW7bOPak+YL+92
         8cMANW17ywrj9klkI6BaqNLN9tBJs+w1ZZCyiKzh1Ccas+llW5BAXl25yaCO1ihLEmk0
         VZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=59nj95Ekls7NUFeMKvDiJy4kys1zmNJidS9kCaGvrYA=;
        b=E/E0qQaKqbvHBumVJjErv8EGjqpdBoGNLssflZbLGdmbAvN1pnF6eI8QmoZiovgbb0
         V3e8H1dgOhDfu5Rmoid1aQXNuInNT3MHBlU1DWqOnXZg0JseXHy3oMtWaksadFJUR1Ew
         mwkTwQBikTqSimj7zQUEIM2kBiJ9YAICHZ7Q3BOC8bCaq8fxiV3M7Mqk+nT0U+WlteKD
         wy+1LE5ErBUOzkFK64m1OaogtR8UOYlo69cwSMYIQz1XhbCkQkFmVWV4KrJPZDOldtuL
         GH7kIDr6o0oDXc3Pk8gfV0aI3dCGUsI+3CCTsU0OaroS5IxR4cu8hpuraLtL7kKuIOoK
         RDJQ==
X-Gm-Message-State: AOAM531IPzPIhztBUD6CdNlKQ9p3p6js6HrxFEGGTWbqpgDSm4eB+kZi
        V07AYhx0PszyDnOOOAL72CgH5jUElNiNU7AG22g=
X-Google-Smtp-Source: ABdhPJzal1jolY22OJqYravZ/TUu+CHmsaxpaoWcQNMrjmf+EeUPwnpzsu2VLbOo/RyBVl1lYBzP9A+9AO5Qz4TohuM=
X-Received: by 2002:a17:906:4b57:: with SMTP id j23mr15349721ejv.563.1635777264261;
 Mon, 01 Nov 2021 07:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com> <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com> <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
 <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com> <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
 <20211101143004.GD2914@kadam>
In-Reply-To: <20211101143004.GD2914@kadam>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Mon, 1 Nov 2021 22:33:57 +0800
Message-ID: <CAD-N9QWifUWfYMW6Q7kBy8VFL2J63mnZj1ktcQfv_KapjEsXZw@mail.gmail.com>
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 1, 2021 at 10:30 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Nov 01, 2021 at 05:58:56PM +0800, Dongliang Mu wrote:
> > On Mon, Nov 1, 2021 at 5:43 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
> > >
> > > On 11/1/21 12:41, Dongliang Mu wrote:
> > > >> Hi, Dongliang,
> > > >>
> > > >> Did patch attached to my previous email pass syzbot's reproducer test?
> > > >> Unfortunately, I am not able to test rn :(
> > > >
> > > > Yes, it works. The memory leak does not occur anymore.
> > > >
> > > > But I am crafting another patch based on yours as there is a small
> > > > issue in the retval and I would like to make the error handling code
> > > > uniform.
> > > >
> > >
> > > Cool! Thank you for confirmation.
> >
> > Hi Pavel,
> >
> > Thanks for your advice. I have sent the patch and you are on the CC
> > list. Can you please take a look at and review my patch?
> >
>
> What's the Message-ID of your patch so I can b4 it.
>
> This whole thread has no patches.  I don't know why I'm CC'd when the
> only part I'm interested in is not included...  :/  Hashtag Grumble.
>

You are back to work already?

I forget to CC you in my `git send-email'. This thread asks for help
as I cannot figure out the root cause of this bug.

> regards,
> dan carpenter
>
