Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAA83FECDD
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 13:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245183AbhIBLYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 07:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233850AbhIBLYE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 07:24:04 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506BCC061575;
        Thu,  2 Sep 2021 04:23:06 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id x11so3577037ejv.0;
        Thu, 02 Sep 2021 04:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bA3KMNCP9BXiZxejsxnWqc0d9EYiWZElfEzOCuWentM=;
        b=ABtUgCe9VKFRhX8EWEuH2OFMqROtWMQvOQKK0UYMjDs60tlzup0QSpQqijqN91szXe
         W5xWVUqnB1tQuXsoxOndiic7p2rx0e7WDD8ozKE6Tz4/RwDv+jbqNyglAwpLOV2SINR1
         mljpReBPxhzRUZ/Jy1LXaQiAsGjvjIZQ7gVUP+aQUjhfewmFKjFTu8psOFezcn81vlqh
         9zZDdqC1ozCtDgpc6lwEJnR3BALk/ajnG5/iXsWB+mMnCX3qFPfdGLenYJaWBQNjZ5Cn
         +0sTTajNZmLxC8oEvVQCXce5CtL6K7Fw/Dgd+7f4Lfz9jru+L2UZCHIyAhhOeMwF8cd1
         452A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bA3KMNCP9BXiZxejsxnWqc0d9EYiWZElfEzOCuWentM=;
        b=Z/WFqvijVqWIrXgXwuKBbLYcwDO9sxmy/DmvnIymijzzdaSIPIuq4zR1QJkMA2tgl3
         uxFMeokpMbUuwoOk7mC4Rnvp7l65ECWfbD4EeG5i/XA/TgInqr6TpfqbIDeafuyZKHEj
         gdwJROMeXQffF4YsRzDODoRGxCB41lLct/9phqgLUtjNxyj1HkSCOucQCEk6qoKcicUG
         /Mj7viZ1t0ATwqrz3go6kY22w4LxROliz/wZkO22GvNThQ9aOMW7xN+bERE/h577Vn6Q
         Somqdc0KRlVjix3/1aAmg+K+/XgOlosjBjjaMeIpv6TR5eTvXYIS9C+QTu0vXC9ndN8c
         nkGQ==
X-Gm-Message-State: AOAM530f4p9XFEhduQwPJtoKBgFdzVseVjpkfFy3643h1+UbvedNAyMG
        gLj/JW0aOHyiISkpZgKvjrdc3hvs98wKoWnOgcM=
X-Google-Smtp-Source: ABdhPJxQz6IhBsVj7dVlr3w4kxOx+GTP4wWqcVCqugA3BWC6SUSXKeqp0vfDHtD0Cx4AwYzwlO7WTarg2u5EZwsXwx4=
X-Received: by 2002:a17:906:5950:: with SMTP id g16mr3245400ejr.135.1630581784830;
 Thu, 02 Sep 2021 04:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
 <YTCp6d1umr7AXRZW@kroah.com> <20210902125416.1ad73fad@coco.lan>
 <CAD-N9QVZQo+YPjNwAUqg-kQ_fEwicLR=1am1E99h8oHi0aXocA@mail.gmail.com>
 <CAD-N9QXPJz60jKfHg1Yh6tnzJRBFAwkmV+LUoSY+f7cZ_5kYww@mail.gmail.com> <2c3e496a-fdc7-020b-4234-58441e766f7d@xs4all.nl>
In-Reply-To: <2c3e496a-fdc7-020b-4234-58441e766f7d@xs4all.nl>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Thu, 2 Sep 2021 19:22:38 +0800
Message-ID: <CAD-N9QX7q3wTdTUC_b2fEn1txjEjdgmtx2eaX9ymxAp_vUfxiA@mail.gmail.com>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 2, 2021 at 7:15 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 02/09/2021 13:10, Dongliang Mu wrote:
> > On Thu, Sep 2, 2021 at 6:59 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >>
> >> On Thu, Sep 2, 2021 at 6:54 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> >>>
> >>> Em Thu, 2 Sep 2021 12:39:37 +0200
> >>> Greg KH <gregkh@linuxfoundation.org> escreveu:
> >>>
> >>>> On Thu, Sep 02, 2021 at 06:23:36PM +0800, Dongliang Mu wrote:
> >>>>> On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >>>>>>
> >>>>>> On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >>>>>>>
> >>>>>>> stk_camera_probe mistakenly execute usb_get_intf and increase the
> >>>>>>> refcount of interface->dev.
> >>>>>>>
> >>>>>>> Fix this by removing the execution of usb_get_intf.
> >>>>>>
> >>>>>> Any idea about this patch?
> >>>>>
> >>>>> +cc Dan Carpenter, gregkh
> >>>>>
> >>>>> There is no reply in this thread in one month. Can someone give some
> >>>>> feedback on this patch?
> >>>>
> >>>> This is the media developers domain, not much I can do here.
> >>>
> >>> There is a high volume of patches for the media subsystem. Anyway,
> >>> as your patch is at our patchwork instance:
> >>>
> >>>         https://patchwork.linuxtv.org/project/linux-media/patch/20210714032340.504836-1-mudongliangabcd@gmail.com/
> >>>
> >>> It should be properly tracked, and likely handled after the end of
> >>> the merge window.
> >
> > Hi Mauro,
> >
> > I found there is another fix [1] for the same memory leak from Pavel
> > Skripkin (already cc-ed in this thread).
> >
> > [1] https://www.spinics.net/lists/stable/msg479628.html
>
> Ah, that's why I marked it as Obsoleted :-)

Oh, I see. If that patch is already merged, please remark my patch as Obsoleted.

Curiously, I did not get an email notification to mark my patch as
Obsoleted before. Why?

>
> Regards,
>
>         Hans
>
> >
> >>>
> >>>>>>> Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> >>>>>>> Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
> >>>>>>> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> >>>
> >>> If you're the author of the patch, it doesn't make much sense to
> >>> add a "Reported-by:" tag there. We only use it in order to give
> >>> someone's else credit to report an issue.
> >>
> >> I see. Someone told me this rule in another thread. I will update this
> >> in the next version.
> >>
> >>>
> >>> Thanks,
> >>> Mauro
>
