Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0FF34935D
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 14:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhCYNzH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 09:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhCYNyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 09:54:41 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF584C06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 06:54:41 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id x16so2009188iob.1
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RAEOlYgpnnIYtnpihZtbBWp/TA6l4Ck/OBKwCqfJMX4=;
        b=U9ApAVqWbo+VbJJpaUguYJQm3e60DFIMBmd8EJ3uFVw58OCUV6UomksLLO3Mve1j3t
         f7sxIKgGcuF54pHvwQJCfyE3ppJW944sO6Z6M0AQcSLS2C9DJ+nfynLpz/GlSv7RAPUg
         nbtRS3s0YX9ojeTNH1sfftfe53B4HXwMRDWTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RAEOlYgpnnIYtnpihZtbBWp/TA6l4Ck/OBKwCqfJMX4=;
        b=IpARdqsvr8eV9SLOaujkKRdSztHH9oJKNzqwqlQ7JoILrtRToSsPEjbun0exffhqf9
         CuJjBLPmxzYp1C0zeN5u4JNmBZ7BMGoWgoFM5b2LcrVPW4VWFTvQNeftM2Ww21ivrytT
         6HOe4jHzH/FILLRfPhXkzKWUDBm0lA3PfhrHOk/GheLl8U87TU22qXItn39lAdm9UnSe
         qad2zsulic71SSFGknC0jlcFIJHKZ2bZUJt1KvEzEd8Z74XfpOJetz7AFrm337kNOXdm
         QCbXz7w5F769nTFdfmwL/MgfeascyRV1fEHq59ZanqZY8nJW5XaBjSGl/5rm6q8uaqNX
         Zc3w==
X-Gm-Message-State: AOAM533u1aTnfEQhj1YHsmhwJR1jWkGAvp+qLRk5k0jgT2YlRQZ02U+J
        Hq5HaAvGneI45bzB0BcnXNh10hN3D0Ew8A==
X-Google-Smtp-Source: ABdhPJwkZfmFRwbQ6795Ekb1yesTrvmWbjtaj/SRx4nNiCin9iSoA10+G/pMb5LSeRG6Flz9LMEAvA==
X-Received: by 2002:a05:6638:2711:: with SMTP id m17mr7719458jav.115.1616680480971;
        Thu, 25 Mar 2021 06:54:40 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id g16sm2348673ilk.22.2021.03.25.06.54.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 06:54:40 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id j11so2139194ilu.13
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 06:54:40 -0700 (PDT)
X-Received: by 2002:a05:6e02:2182:: with SMTP id j2mr7073912ila.89.1616680479497;
 Thu, 25 Mar 2021 06:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <347cdb4a-19a2-98ce-580f-5aba4abfb2fc@xs4all.nl>
 <CAPybu_34Zus8rSSEMsrxo0euQ+SFu-aZUmHRya7GFPJysp6TsQ@mail.gmail.com> <35f1fa6e-a498-9217-5359-82b58dec61f6@xs4all.nl>
In-Reply-To: <35f1fa6e-a498-9217-5359-82b58dec61f6@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 25 Mar 2021 14:54:28 +0100
X-Gmail-Original-Message-ID: <CANiDSCvWG-iyj9wAaKKKT-6n=ngEW8dN0Mx0VcTWTktzt7nCdw@mail.gmail.com>
Message-ID: <CANiDSCvWG-iyj9wAaKKKT-6n=ngEW8dN0Mx0VcTWTktzt7nCdw@mail.gmail.com>
Subject: Re: [PATCH] uvcvideo: improve error handling in uvc_query_ctrl()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi Hans

On Thu, Mar 25, 2021 at 1:18 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 23/03/2021 16:25, Ricardo Ribalda Delgado wrote:
> > Hi Hans
> >
> > Thanks for the patch. I like how uvc is ending :)
> >
> > On Mon, Mar 22, 2021 at 1:09 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> - If __uvc_query_ctrl() failed with a non-EPIPE error, then
> >>   report that with dev_err. If an error code is obtained, then
> >>   report that with dev_dbg.
> >>
> >> - For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
> >>   EACCES is a much more appropriate error code. EILSEQ will return
> >>   "Invalid or incomplete multibyte or wide character." in strerror(),
> >>   which is a *very* confusing message.
> >>
> >> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> >> ---
> >> Ricardo, this too can be added to the uvc series.
> >> ---
> >>  drivers/media/usb/uvc/uvc_video.c | 44 +++++++++++++++++--------------
> >>  1 file changed, 24 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> >> index b63c073ec30e..3f461bb4eeb9 100644
> >> --- a/drivers/media/usb/uvc/uvc_video.c
> >> +++ b/drivers/media/usb/uvc/uvc_video.c
> >> @@ -68,7 +68,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >>                         u8 intfnum, u8 cs, void *data, u16 size)
> >>  {
> >>         int ret;
> >> -       u8 error;
> >> +       u8 error = 0;
> >>         u8 tmp;
> >>
> >>         ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> >> @@ -76,35 +76,39 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >>         if (likely(ret == size))
> >>                 return 0;
> >>
> >> -       dev_dbg(&dev->udev->dev,
> >> -               "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> >> -               uvc_query_name(query), cs, unit, ret, size);
> >> +       ret = ret < 0 ? ret : -EPIPE;
> >>
> >> -       if (ret != -EPIPE)
> >> -               return ret;
> >> -
> >> -       tmp = *(u8 *)data;
> >> +       if (ret == -EPIPE) {
> >> +               tmp = *(u8 *)data;
> >>
> >> -       ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
> >> -                              UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
> >> -                              UVC_CTRL_CONTROL_TIMEOUT);
> >> +               ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
> >> +                                      UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
> >> +                                      UVC_CTRL_CONTROL_TIMEOUT);
> >>
> >> -       error = *(u8 *)data;
> >> -       *(u8 *)data = tmp;
> >> +               if (ret == 1)
> >> +                       error = *(u8 *)data;
> >> +               *(u8 *)data = tmp;
> >> +               if (ret != 1)
> >> +                       ret = ret < 0 ? ret : -EPIPE;
> >> +       }
> >>
> >> -       if (ret != 1)
> >> -               return ret < 0 ? ret : -EPIPE;
> >> +       if (error)
> >> +               dev_dbg(&dev->udev->dev,
> >> +                       "Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
> >> +                       uvc_query_name(query), cs, unit, error);
> >> +       else
> >> +               dev_err(&dev->udev->dev,
> >> +                       "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> >> +                       uvc_query_name(query), cs, unit, ret, size);
> >
> > If __uvc_query_ctrl and UVC_VC_REQUEST_ERROR_CODE_CONTROL failed,
> > error is 0. And I think that you want to show a dev_err in that case.
> > Maybe we can initialize error to 7 ?
>
> I'm confused, if error == 0, then it does show dev_err.

My bad.

Ignore the message.

Can we write it as ?:

if (!error) {
  dev_dbg(&dev->udev->dev,
 "Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
 uvc_query_name(query), cs, unit, error);
 return ret;
}

dev_err(&dev->udev->dev,
"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
uvc_query_name(query), cs, unit, ret, size);



>
> >
> >
> >>
> >> -       uvc_dbg(dev, CONTROL, "Control error %u\n", error);
> >> +       if (!error)
> >> +               return ret;
> > I think we do not want these two lines (read next comment)
> >>
> >>         switch (error) {
> >> -       case 0:
> >> -               /* Cannot happen - we received a STALL */
> >> -               return -EPIPE;
> >>         case 1: /* Not ready */
> >>                 return -EBUSY;
> >>         case 2: /* Wrong state */
> >> -               return -EILSEQ;
> >> +               return -EACCES;
> >>         case 3: /* Power */
> >>                 return -EREMOTE;
> >>         case 4: /* Out of range */
> >
> > Maybe we want a dev_dbg if the error code is unknown and return ret?
>
> Make sense.
>
> Regards,
>
>         Hans



-- 
Ricardo Ribalda
