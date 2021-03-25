Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54668349636
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 16:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhCYP4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 11:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbhCYP4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 11:56:41 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA950C06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 08:56:40 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id m12so3236051lfq.10
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8lQPXW1iKZ4L43EHiXEacLc8bcZOagDnYs52fxy+4jw=;
        b=jE2JpebDizggU6dTG3z4tEsy27xK2UV9s/8zHMAUGLnKdi2sqlsxDzqkWyzyRg5Ihu
         FKcj8w151ebDmhr4Dx5xdrtS7m0HVe7xNMCuDiEb4vv2bgtEbQcm//kPYehV7ubJYgN0
         qrx2SI/ONqKHymJ9bW1OZob7WJfujXb3WAkhvRdeKk5xEKStVVmarrKoCWqcp7ah2MPi
         ptR3a+3U0763NVx6jlwWYOA1JKGFAAqCA/mTt2z3DxlUbdJOp0maCjJqMTMGeZ1jwMRn
         w6tY6Frni3duV63K1rjpQOhSL5jcnjkN81iSJPntig2LY6hxdl9DT1s2S9ucRMp3DjiI
         U1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8lQPXW1iKZ4L43EHiXEacLc8bcZOagDnYs52fxy+4jw=;
        b=T01JPgikNwBhI4kVjGgvT3fCorHrQ9JrQtGH21o8AjcN+O4Vt2uit3OsWXjIGclIcf
         Uawq8sxkaVwoOz4VDtftcLotwWEAbKh/Un/uWjlxmg/FR7ZXHFyC4Bx/JyH12OSJEN+0
         /qf6SyoMUqhsTQ+PIyFBOe67nA1E5YGdHkJzBa73HEhjQuzCtXYOUbEC1xa4JELxV8Ht
         3tPs1WZ2UnIZ+PoZvyx07Vda/EEFaV4rdZekXpSqMTDEEy+CCPYeSZARGGjhThU270ui
         ryR5w0MwIopVg258aA1rK9vfA8AeACmn7pvAf9AbnflwdHuLI0B1SS6f0TqpW7AXdqAX
         INhA==
X-Gm-Message-State: AOAM533sWcH0TPE35n4gp+ctQUkWAeM7BkEJM00PGHDDVb8hkawUvKz8
        Y3PdMw0lJBjg1Pz+8vSpQVq2nl1DP/aTa5TiZ3TJ6MxUnVxDRQ==
X-Google-Smtp-Source: ABdhPJzcSexdzEuE8ZMnbMMs6XCzuVXYQtl8AMtF3Khq8nfez5d8WZ3Ecq1Olddnal6v6jRytNKmeHttkthhXNA5au4=
X-Received: by 2002:a19:380a:: with SMTP id f10mr5303635lfa.294.1616687799226;
 Thu, 25 Mar 2021 08:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <347cdb4a-19a2-98ce-580f-5aba4abfb2fc@xs4all.nl>
 <CAPybu_34Zus8rSSEMsrxo0euQ+SFu-aZUmHRya7GFPJysp6TsQ@mail.gmail.com>
 <35f1fa6e-a498-9217-5359-82b58dec61f6@xs4all.nl> <CANiDSCvWG-iyj9wAaKKKT-6n=ngEW8dN0Mx0VcTWTktzt7nCdw@mail.gmail.com>
 <8a265a15-c9f6-bea4-1a38-df675a977e8c@xs4all.nl> <CANiDSCvy_FyxQXv+04u0b9vp1mF7TB_e6XGmSWYM6VoYVrDPHA@mail.gmail.com>
 <fa87cc48-db19-fa22-a7fe-4eb9d7483cfe@xs4all.nl>
In-Reply-To: <fa87cc48-db19-fa22-a7fe-4eb9d7483cfe@xs4all.nl>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Thu, 25 Mar 2021 16:56:23 +0100
Message-ID: <CAPybu_0kZr_Q6BByJ_OEFFO846U+Ti8cY0TAOfMPs=O2Tt0tOQ@mail.gmail.com>
Subject: Re: [PATCH] uvcvideo: improve error handling in uvc_query_ctrl()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Thu, Mar 25, 2021 at 3:03 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 25/03/2021 15:02, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > On Thu, Mar 25, 2021 at 2:57 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 25/03/2021 14:54, Ricardo Ribalda wrote:
> >>> hi Hans
> >>>
> >>> On Thu, Mar 25, 2021 at 1:18 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>>>
> >>>> On 23/03/2021 16:25, Ricardo Ribalda Delgado wrote:
> >>>>> Hi Hans
> >>>>>
> >>>>> Thanks for the patch. I like how uvc is ending :)
> >>>>>
> >>>>> On Mon, Mar 22, 2021 at 1:09 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>>>>>
> >>>>>> - If __uvc_query_ctrl() failed with a non-EPIPE error, then
> >>>>>>   report that with dev_err. If an error code is obtained, then
> >>>>>>   report that with dev_dbg.
> >>>>>>
> >>>>>> - For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
> >>>>>>   EACCES is a much more appropriate error code. EILSEQ will return
> >>>>>>   "Invalid or incomplete multibyte or wide character." in strerror(),
> >>>>>>   which is a *very* confusing message.
> >>>>>>
> >>>>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> >>>>>> ---
> >>>>>> Ricardo, this too can be added to the uvc series.
> >>>>>> ---
> >>>>>>  drivers/media/usb/uvc/uvc_video.c | 44 +++++++++++++++++--------------
> >>>>>>  1 file changed, 24 insertions(+), 20 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> >>>>>> index b63c073ec30e..3f461bb4eeb9 100644
> >>>>>> --- a/drivers/media/usb/uvc/uvc_video.c
> >>>>>> +++ b/drivers/media/usb/uvc/uvc_video.c
> >>>>>> @@ -68,7 +68,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >>>>>>                         u8 intfnum, u8 cs, void *data, u16 size)
> >>>>>>  {
> >>>>>>         int ret;
> >>>>>> -       u8 error;
> >>>>>> +       u8 error = 0;
> >>>>>>         u8 tmp;
> >>>>>>
> >>>>>>         ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> >>>>>> @@ -76,35 +76,39 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >>>>>>         if (likely(ret == size))
> >>>>>>                 return 0;
> >>>>>>
> >>>>>> -       dev_dbg(&dev->udev->dev,
> >>>>>> -               "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> >>>>>> -               uvc_query_name(query), cs, unit, ret, size);
> >>>>>> +       ret = ret < 0 ? ret : -EPIPE;
> >>>>>>
> >>>>>> -       if (ret != -EPIPE)
> >>>>>> -               return ret;
> >>>>>> -
> >>>>>> -       tmp = *(u8 *)data;
> >>>>>> +       if (ret == -EPIPE) {
> >>>>>> +               tmp = *(u8 *)data;
> >>>>>>
> >>>>>> -       ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
> >>>>>> -                              UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
> >>>>>> -                              UVC_CTRL_CONTROL_TIMEOUT);
> >>>>>> +               ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
> >>>>>> +                                      UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
> >>>>>> +                                      UVC_CTRL_CONTROL_TIMEOUT);
> >>>>>>
> >>>>>> -       error = *(u8 *)data;
> >>>>>> -       *(u8 *)data = tmp;
> >>>>>> +               if (ret == 1)
> >>>>>> +                       error = *(u8 *)data;
> >>>>>> +               *(u8 *)data = tmp;
> >>>>>> +               if (ret != 1)
> >>>>>> +                       ret = ret < 0 ? ret : -EPIPE;
> >>>>>> +       }
> >>>>>>
> >>>>>> -       if (ret != 1)
> >>>>>> -               return ret < 0 ? ret : -EPIPE;
> >>>>>> +       if (error)
> >>>>>> +               dev_dbg(&dev->udev->dev,
> >>>>>> +                       "Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
> >>>>>> +                       uvc_query_name(query), cs, unit, error);
> >>>>>> +       else
> >>>>>> +               dev_err(&dev->udev->dev,
> >>>>>> +                       "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> >>>>>> +                       uvc_query_name(query), cs, unit, ret, size);
> >>>>>
> >>>>> If __uvc_query_ctrl and UVC_VC_REQUEST_ERROR_CODE_CONTROL failed,
> >>>>> error is 0. And I think that you want to show a dev_err in that case.
> >>>>> Maybe we can initialize error to 7 ?
> >>>>
> >>>> I'm confused, if error == 0, then it does show dev_err.
> >>>
> >>> My bad.
> >>>
> >>> Ignore the message.
> >>>
> >>> Can we write it as ?:
> >>>
> >>> if (!error) {
> >>>   dev_dbg(&dev->udev->dev,
> >>>  "Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
> >>>  uvc_query_name(query), cs, unit, error);
> >>>  return ret;
> >>> }
> >>>
> >>> dev_err(&dev->udev->dev,
> >>> "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> >>> uvc_query_name(query), cs, unit, ret, size);
> >>
> >> Sure! Just take this patch as inspiration :-)
> >
> > Do you mind if I modify it before resend?
>
> No problem, feel free!
>
Something like?

https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=uvc-compliance-v9&id=aaf96b6cab88059d4d70346669d26cde09276586

Will probably repost the series tomorrow.

Thanks!

>         Hans
>
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>>
> >>>
> >>>>
> >>>>>
> >>>>>
> >>>>>>
> >>>>>> -       uvc_dbg(dev, CONTROL, "Control error %u\n", error);
> >>>>>> +       if (!error)
> >>>>>> +               return ret;
> >>>>> I think we do not want these two lines (read next comment)
> >>>>>>
> >>>>>>         switch (error) {
> >>>>>> -       case 0:
> >>>>>> -               /* Cannot happen - we received a STALL */
> >>>>>> -               return -EPIPE;
> >>>>>>         case 1: /* Not ready */
> >>>>>>                 return -EBUSY;
> >>>>>>         case 2: /* Wrong state */
> >>>>>> -               return -EILSEQ;
> >>>>>> +               return -EACCES;
> >>>>>>         case 3: /* Power */
> >>>>>>                 return -EREMOTE;
> >>>>>>         case 4: /* Out of range */
> >>>>>
> >>>>> Maybe we want a dev_dbg if the error code is unknown and return ret?
> >>>>
> >>>> Make sense.
> >>>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>>
> >>>
> >>>
> >>
> >
> >
>


-- 
Ricardo Ribalda
