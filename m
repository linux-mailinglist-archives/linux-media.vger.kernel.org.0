Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B833FF810
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 01:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343725AbhIBXwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 19:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhIBXwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 19:52:45 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11482C061575;
        Thu,  2 Sep 2021 16:51:46 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id jg16so5121850ejc.1;
        Thu, 02 Sep 2021 16:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FYWWTnOH3ThjySwLOVR2zq5Xp4qI+ZluH97RbvYfXvk=;
        b=BlylEioSEMGCscrvvWtbGcwEfH0vseaf2IlJkRr9n5e32SSLnKTylJ9NCQJ9fnjNmk
         F6bERCLpkIwaogOCrX40n9fbeBlnhYcHgUb5Zx0iip3PJlM79sHSFEGuccPUOU2N7LNp
         8cV+XIaQH6zIxv4XBnYI5ZbPTJstufJF8mzE1a6n22mAiuTdeaDPQd/2PCiylCAJVLSC
         Nj92LmpcNSDMh8Ka4K2I/x6Xl6wPn/c95nCO1xxkXxnYfg9HYdX3Gcz0rPYZJyjXuyVZ
         n/L48sKeaJXpiWSAgmKCSFE7XcUuZiUn8kYQG99KJs2gT4W3x+M0z5TSBGTf1dGUELrl
         q2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FYWWTnOH3ThjySwLOVR2zq5Xp4qI+ZluH97RbvYfXvk=;
        b=oigm47V4v51ZrNWiqm0DHaIdTXWUwmo9QlX1lCDUWzUX/lRKf8yVQW3GDnXMeH+r0z
         91MIyg3uLqWX3qCLO82yks3EoR9Ii9bVwp5Uci2+d5qG2nVLTX8+/RbkS23Wxt3mLh51
         VEWPQTvfwK7y4XPbT6pJeey81JyehOi6mCCXHr5Iy7XTDnc7i/V1k0NjyzIdiFuqBm3n
         QXgZHjdF7FmAJ/tLiQv6TcxcZHCi2t92YkWXIE2GC+V3Y1jGAEr0fVq6YDVtXQ+mSGJr
         wisgXswhNN2IO+X4R/LNXpXXfp+wahZhAZa2uZE+8tOW2ik+7PVF5bTrLtQe+GYL9C3t
         8iSg==
X-Gm-Message-State: AOAM533qTdxgtGHOQP3pNGaVuoVmPXuUKpx1d63REte8Eb1BtSQ+QeR4
        P8mmCl5junYBg2PRTNXA+sUhJ+tVF45aJzm1lDg=
X-Google-Smtp-Source: ABdhPJyJXP6h1uyPScZ+bceOKzFRfO7TRZYEX7ZXqkbO12kJa9oFwUjQHtFPpvFWBvEnAzvijuAyyPh9KiDmR1+HOAg=
X-Received: by 2002:a17:906:9b1:: with SMTP id q17mr834667eje.546.1630626704570;
 Thu, 02 Sep 2021 16:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
 <YTCp6d1umr7AXRZW@kroah.com> <20210902125416.1ad73fad@coco.lan>
 <CAD-N9QVZQo+YPjNwAUqg-kQ_fEwicLR=1am1E99h8oHi0aXocA@mail.gmail.com>
 <CAD-N9QXPJz60jKfHg1Yh6tnzJRBFAwkmV+LUoSY+f7cZ_5kYww@mail.gmail.com>
 <2c3e496a-fdc7-020b-4234-58441e766f7d@xs4all.nl> <CAD-N9QX7q3wTdTUC_b2fEn1txjEjdgmtx2eaX9ymxAp_vUfxiA@mail.gmail.com>
 <90aa8c94-da50-7023-0f1a-8df58449bd6d@gmail.com>
In-Reply-To: <90aa8c94-da50-7023-0f1a-8df58449bd6d@gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Fri, 3 Sep 2021 07:51:17 +0800
Message-ID: <CAD-N9QV-N3gS5ySHxRL5eSPYUygwaLF=g9Qczjr8B6p--tsNBA@mail.gmail.com>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 3, 2021 at 2:14 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 9/2/21 14:22, Dongliang Mu wrote:
> > On Thu, Sep 2, 2021 at 7:15 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 02/09/2021 13:10, Dongliang Mu wrote:
> >> > On Thu, Sep 2, 2021 at 6:59 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >> >>
> >> >> On Thu, Sep 2, 2021 at 6:54 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> >> >>>
> >> >>> Em Thu, 2 Sep 2021 12:39:37 +0200
> >> >>> Greg KH <gregkh@linuxfoundation.org> escreveu:
> >> >>>
> >> >>>> On Thu, Sep 02, 2021 at 06:23:36PM +0800, Dongliang Mu wrote:
> >> >>>>> On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >> >>>>>>
> >> >>>>>> On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >> >>>>>>>
> >> >>>>>>> stk_camera_probe mistakenly execute usb_get_intf and increase the
> >> >>>>>>> refcount of interface->dev.
> >> >>>>>>>
> >> >>>>>>> Fix this by removing the execution of usb_get_intf.
> >> >>>>>>
> >> >>>>>> Any idea about this patch?
> >> >>>>>
> >> >>>>> +cc Dan Carpenter, gregkh
> >> >>>>>
> >> >>>>> There is no reply in this thread in one month. Can someone give some
> >> >>>>> feedback on this patch?
> >> >>>>
> >> >>>> This is the media developers domain, not much I can do here.
> >> >>>
> >> >>> There is a high volume of patches for the media subsystem. Anyway,
> >> >>> as your patch is at our patchwork instance:
> >> >>>
> >> >>>         https://patchwork.linuxtv.org/project/linux-media/patch/20210714032340.504836-1-mudongliangabcd@gmail.com/
> >> >>>
> >> >>> It should be properly tracked, and likely handled after the end of
> >> >>> the merge window.
> >> >
> >> > Hi Mauro,
> >> >
> >> > I found there is another fix [1] for the same memory leak from Pavel
> >> > Skripkin (already cc-ed in this thread).
> >> >
> >> > [1] https://www.spinics.net/lists/stable/msg479628.html
> >>
> >> Ah, that's why I marked it as Obsoleted :-)
> >
> > Oh, I see. If that patch is already merged, please remark my patch as Obsoleted.
> >
> > Curiously, I did not get an email notification to mark my patch as
> > Obsoleted before. Why?
> >
> >>
>
> Hi, Dongliang!
>
> Yep my patch has been merged already (1 month ago, I guess).

Yes. When I submit this patch, your patch is still pending. I did not
know someone is already sending a patch with good quality.

So I am curious if there are any methods to notify people there are
already some similar patches in the patchwork or some other resources.

>
>
>
>
> With regards,
> Pavel Skripkin
