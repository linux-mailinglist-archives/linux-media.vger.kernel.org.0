Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E215365C7ED
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 21:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236687AbjACUPy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 15:15:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236249AbjACUPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 15:15:52 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DADD2FB
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 12:15:50 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 36so20843917pgp.10
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 12:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=esKJZOAdoKH01EXFZn0RTggrMST0Kf6kP0re/bpYhc0=;
        b=OfeGseDvSphQvZsc10IC9gwIKgya8ySVQc5XT+xt24v19l9iVApPdN6GR2j6U3itDf
         uIRu1rpHNR6oWE6fTu8b/gwMDoRMsHdeSpjXlduJ06bh8pmQfwksYyAtyPR65DJY4l8q
         /0EqGDPDb4K3WNp27bgSelbDRYna9xAHX/+Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esKJZOAdoKH01EXFZn0RTggrMST0Kf6kP0re/bpYhc0=;
        b=pT579IUZ/U0Hu7jwRmFfTQ5MH3HmE20OKxrCO/Z4snYOX20JeCJ0i+Nrv4kF6sDXK0
         29y9uuYlMC8Zps3XwTir7zrJ/SATh18m0hedj7WT+r1X9S9QIKh5hxqMAVHBuLQjNkPh
         +v3gDrLltmVBzADSFLeP26Xs6qzZjp7ttpO3OR++UUiaQMkS58CGgL/Q/LA3EiipQsEz
         7+ID9Qi8L23T7VcS0eS1SXkWxTIt/iuQaAJtEQLyadtAwDRT5+i0ClgUOxQ8VsI8yVj/
         nFvKaD1X8iEk4P0gU2uA4rTS1e2rcEKHFhH213hfCAKj94zqc6ZuIG//FSLrrsScguTW
         J/HA==
X-Gm-Message-State: AFqh2kpeROkfuTfPPnQWE/gp6osgATTm/n3QPwPgg9sHjk3vBiDIYM4D
        mZafFV9Sj7BofIdWylhgXkVYjd2jkNBCsBacHZQ=
X-Google-Smtp-Source: AMrXdXsk1P/x3WmcZGphUEpojKyMEorlRbUDOXfbDCSmRROh2dvjJZbDWTlGLsyjly3w+Nuzi3atpg==
X-Received: by 2002:aa7:9486:0:b0:581:e756:76a8 with SMTP id z6-20020aa79486000000b00581e75676a8mr22552694pfk.19.1672776949925;
        Tue, 03 Jan 2023 12:15:49 -0800 (PST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id d12-20020aa797ac000000b0056bb36c047asm10941494pfq.105.2023.01.03.12.15.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 12:15:48 -0800 (PST)
Received: by mail-pj1-f54.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso36927208pjp.4
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 12:15:48 -0800 (PST)
X-Received: by 2002:a17:90a:c984:b0:219:8132:70db with SMTP id
 w4-20020a17090ac98400b00219813270dbmr4312642pjt.183.1672776947474; Tue, 03
 Jan 2023 12:15:47 -0800 (PST)
MIME-Version: 1.0
References: <20220920-resend-v4l2-compliance-v3-0-598d33a15815@chromium.org>
 <20220920-resend-v4l2-compliance-v3-2-598d33a15815@chromium.org> <Y7SMcMNwg1eflyCj@pendragon.ideasonboard.com>
In-Reply-To: <Y7SMcMNwg1eflyCj@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 3 Jan 2023 21:15:36 +0100
X-Gmail-Original-Message-ID: <CANiDSCvgrScOzeCBmccC_SbGCZQp=dKbb43rQd=4L8oiHmRrvg@mail.gmail.com>
Message-ID: <CANiDSCvgrScOzeCBmccC_SbGCZQp=dKbb43rQd=4L8oiHmRrvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] media: uvcvideo: improve error logging in uvc_query_ctrl()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, 3 Jan 2023 at 21:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Tue, Jan 03, 2023 at 03:36:20PM +0100, Ricardo Ribalda wrote:
> > From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >
> > Standard use of the driver may result in error messages on the kernel
> > ring buffer. This can hide other more important messages, and alert
>
> I assume you meant log (or log buffer), not ring buffer. I'll fix that
> when applying.

I tried to use the best term. And I found this:
https://man7.org/linux/man-pages/man1/dmesg.1.html

seems that kernel ring buffer is the correct term (but I might confess
that I use dmesg or simply log)

In this case, anything works for me ;)

Thanks!

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > unnecessarily the user. Let's keep dev_err() for the important
> > occasions.
> >
> > If __uvc_query_ctrl() failed with a non -EPIPE error, then report that
> > with dev_err. If an error code is obtained, then report that with
> > dev_dbg.
> >
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index d2eb9066e4dc..6b20a23bc3cf 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -79,13 +79,14 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >       if (likely(ret == size))
> >               return 0;
> >
> > -     dev_err(&dev->udev->dev,
> > -             "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> > -             uvc_query_name(query), cs, unit, ret, size);
> > -
> > -     if (ret != -EPIPE)
> > +     if (ret != -EPIPE) {
> > +             dev_err(&dev->udev->dev,
> > +                     "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> > +                     uvc_query_name(query), cs, unit, ret, size);
> >               return ret;
> > +     }
> >
> > +     /* Reuse data[0] to request the error code. */
> >       tmp = *(u8 *)data;
> >
> >       ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
