Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5530E3FECA3
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 13:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242667AbhIBLHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 07:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhIBLHa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 07:07:30 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF0FC061575;
        Thu,  2 Sep 2021 04:06:32 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id e21so3358182ejz.12;
        Thu, 02 Sep 2021 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KOq4nllLh5nZXSivVcNUZtzqdNbccqG98u+Oh9OcI7c=;
        b=kgrlG1MlMqTFVM4smTwIwF0VzikXT0jLePq+LZWcErE7Nn/SpNupepUznxJw8Gj6Vm
         aFMGSJ/mGI1Rmf26vjQ1Jv5PyUdCMjfcDoYPAzOit0qn2nqMV+sTkry1ea4lxvzVOEkW
         LemewKUmGuN+yO9XpWDDN+jGTyHO8JNYkuU3tz75nJ6uXpwdwwGLM/b/m3E9lEGysJWd
         QHKHHFNCBWVQtObpo7YHoFFjprkEAzdg5PGpiAQEFNhnvWouByNE1ojIu5SEwX5j3XhV
         ShxRiL3ee0DL/ODgcHotH5enfGp7EzucbdYWfjTXxQnSpfmmGFulonCyIt3lC/DoDxMM
         P/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KOq4nllLh5nZXSivVcNUZtzqdNbccqG98u+Oh9OcI7c=;
        b=FSFZKJFWiBhcb0P2Q9I3DNZkfIcsS6ZaLNf/3lMJte6CKwWj4uPPskvv7msZJv3LKz
         PJQrGZTet0lPpIqicnjs0zSZxpuk4zVOW9pXxkivp3UKArBgpHzHtDi3YpbRoJhxCrU7
         zrk/jwgBwp9kdikCEHP6JWWm6YPeCwZwt0V8jf8K9CtwI2eLZT7PoYhmTgv0CpVGQMpw
         zMO0Zo3aPCYBKLBuoMSsHqgmNGigJB957vMInkNkgytYMegSlrWVgjq1naJLU6pfznAr
         1Y8Ybuyg+J/Azf/h5a24u3n23v03Bh6q5KTGMcUm0m6RfPSpv6GLjaqJLR7/5XuCnAh3
         MZ0Q==
X-Gm-Message-State: AOAM530saWUWlPX9hG5fL01id3QLcxoseawIS8PzuPACu6HF5JPYfnqK
        gxs6nC08WeUPGZUPVAN23G6Fks+bSWG2fCzsYUI=
X-Google-Smtp-Source: ABdhPJz/DJX8bdvnC1e01R+sEzQaBmOtn5ih0e6ilGJD2B+OcInDz+zMKfEGFdzjDJvu0wW3vBlq87l0hVAZBI2VD50=
X-Received: by 2002:a17:906:31ca:: with SMTP id f10mr3333730ejf.73.1630580791214;
 Thu, 02 Sep 2021 04:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com> <911af8f1-d654-b4e1-1aac-c8a7ff94f6da@xs4all.nl>
In-Reply-To: <911af8f1-d654-b4e1-1aac-c8a7ff94f6da@xs4all.nl>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Thu, 2 Sep 2021 19:06:04 +0800
Message-ID: <CAD-N9QXNEOzqBtsTjeqYog4u3xP1r10ZC2hJWOxhLPFP-5-Stg@mail.gmail.com>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 2, 2021 at 6:49 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Dongliang,
>
> On 02/09/2021 12:23, Dongliang Mu wrote:
> > On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >>
> >> On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >>>
> >>> stk_camera_probe mistakenly execute usb_get_intf and increase the
> >>> refcount of interface->dev.
> >>>
> >>> Fix this by removing the execution of usb_get_intf.
> >>
> >> Any idea about this patch?
> >
> > +cc Dan Carpenter, gregkh
> >
> > There is no reply in this thread in one month. Can someone give some
> > feedback on this patch?
>
> I saw that it was marked as Obsoleted in patchwork, but I might have confused
> this patch with similar, but not identical, patches for this driver.
>
> I've moved the state back to New.
>
> Comments follow below:
>
> >
> >>
> >>>
> >>> Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> >>> Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
> >>> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> >>> ---
> >>>  drivers/media/usb/stkwebcam/stk-webcam.c | 1 -
> >>>  1 file changed, 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
> >>> index a45d464427c4..5bd8e85b9452 100644
> >>> --- a/drivers/media/usb/stkwebcam/stk-webcam.c
> >>> +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
> >>> @@ -1311,7 +1311,6 @@ static int stk_camera_probe(struct usb_interface *interface,
> >>>
> >>>         dev->udev = udev;
> >>>         dev->interface = interface;
> >>> -       usb_get_intf(interface);
>
> Even though this increments the refcount (which might well be unnecessary),
> it is also decremented with usb_put_intf. So is there actually a bug here?
>

Yes, if the increment and decrement of refcount are balanced, it's fine.

But this probe function only increases the refcount, but forgets to
decrease the refcount.

> And if this is changed, then I expect that both get_intf and put_intf should be
> removed, and not just the get.
>
> Regards,
>
>         Hans
>
> >>>
> >>>         if (hflip != -1)
> >>>                 dev->vsettings.hflip = hflip;
> >>> --
> >>> 2.25.1
> >>>
>
