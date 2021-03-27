Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C157934B6F7
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 13:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhC0MBV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 08:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbhC0MBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 08:01:18 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C14DC0613B1
        for <linux-media@vger.kernel.org>; Sat, 27 Mar 2021 05:01:18 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id 19so7320978ilj.2
        for <linux-media@vger.kernel.org>; Sat, 27 Mar 2021 05:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SIMDPHXnJc4poV3DKrIm7RFRUBMc9NywN8NXzt4umxk=;
        b=YDR1mNp5BrE/gjrSZy1efWfV73zp8U1ihFzHdIcAXNCjB1AdgU4Lwm0GP5/taC6g3y
         uc31iy/AdZ3D5/n/qmQc6KLwOPNbxo7Oq7APscOsvp8tptMzMjVLc7bVEKgfmzCdg02/
         wiVmucF4BNJoapFvJH1LqOo1ldLjRJPsgZOtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SIMDPHXnJc4poV3DKrIm7RFRUBMc9NywN8NXzt4umxk=;
        b=e0ziKi8AaXOgLb/9ylTRQb1mFAn+I0l+78CbatJjy6VwXKhXyMbpypT/4MXT8lSfmK
         bylYhCKg5uz4bXWXzUDB2hIa/QT4tmpIYhUZvKo2KKtwMZRtgN2cu3aDtgz5UGhuG7Wm
         aXi+KGujWJRHM+F2Q/vEZFpSzBrE41YTVlRRisKncyGlleGtXdQa+QEuSS674j0LzmhS
         I5RkuA944/BL1caxUvSBy9odYWgIXt6xiwos94fFX7ZADo7jPoVPUvhANVUqeoPUoPUw
         HnMk44ASqdY/ROXZzucSVjKj8SZ1SjNcVEE7xvq5Atynr0UffxUJU+WkHFRga2J3KkSh
         QpaQ==
X-Gm-Message-State: AOAM531+6gd3zqoStdjNQS4bT3v4dORK91dhTwSo8JJdfUU3axx8xTUB
        vG47Oq0dGF5Y6YaPApK0PoWLcHVnI7D6Jw==
X-Google-Smtp-Source: ABdhPJwhjF2p3GZ3dZFZg7G3XTR96Yikc2JOzxgt7egUy0hS1cefvmbMGsvZPAS1bH7oBf3eAVnHrw==
X-Received: by 2002:a05:6e02:1a09:: with SMTP id s9mr13097710ild.60.1616846477157;
        Sat, 27 Mar 2021 05:01:17 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id k10sm5915607iop.42.2021.03.27.05.01.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Mar 2021 05:01:16 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id 19so7320946ilj.2
        for <linux-media@vger.kernel.org>; Sat, 27 Mar 2021 05:01:16 -0700 (PDT)
X-Received: by 2002:a92:6510:: with SMTP id z16mr13518318ilb.71.1616846476099;
 Sat, 27 Mar 2021 05:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210326095840.364424-1-ribalda@chromium.org> <20210326095840.364424-18-ribalda@chromium.org>
 <417be36b-850a-84b2-dc68-c1bec85e2edb@xs4all.nl>
In-Reply-To: <417be36b-850a-84b2-dc68-c1bec85e2edb@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Sat, 27 Mar 2021 13:01:05 +0100
X-Gmail-Original-Message-ID: <CANiDSCsikQaCMFKdrKfqYv=NuhCxy2v--QBUPd00c5jAo6OGnQ@mail.gmail.com>
Message-ID: <CANiDSCsikQaCMFKdrKfqYv=NuhCxy2v--QBUPd00c5jAo6OGnQ@mail.gmail.com>
Subject: Re: [PATCH v9 17/22] media: docs: Document the behaviour of uvcdriver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for your review!

On Sat, Mar 27, 2021 at 12:19 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 26/03/2021 10:58, Ricardo Ribalda wrote:
> > The uvc driver relies on the camera firmware to keep the control states
> > and therefore is not capable of changing an inactive control.
> >
> > Allow returning -EACESS in those cases.
>
> -EACCES

This british people that like to have a lot of double consonants :)

I have updated the series at:

https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/log/?h=uvc-compliance-v10

Will not post until there is more feedback to avoid spamming the list.

Thanks :)

>
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst      | 5 +++++
> >  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 5 +++++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
> > index 4f1bed53fad5..8c0a203385c2 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
> > @@ -95,3 +95,8 @@ EBUSY
> >
> >  EACCES
> >      Attempt to set a read-only control or to get a write-only control.
> > +
> > +    Or if there is an attempt to set an inactive control and the driver is
> > +    not capable of keeping the new value until the control is active again.
>
> keeping: 'caching' or 'storing' are better words, I think.
>
> > +    This is the case for drivers that do not use the standard control
> > +    framework and rely purely on the hardware to keep the controls' state.
>
> I would drop that last sentence. It is not relevant information to the users of
> the API.
>
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > index b9c62affbb5a..bb7de7a25241 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > @@ -438,3 +438,8 @@ EACCES
> >
> >      Or the ``which`` field was set to ``V4L2_CTRL_WHICH_REQUEST_VAL`` but the
> >      device does not support requests.
> > +
> > +    Or if there is an attempt to set an inactive control and the driver is
> > +    not capable of keeping the new value until the control is active again.
> > +    This is the case for drivers that do not use the standard control
> > +    framework and rely purely on the hardware to keep the controls' state.
>
> Same comments as above.
>
> >
>
> Regards,
>
>         Hans



-- 
Ricardo Ribalda
