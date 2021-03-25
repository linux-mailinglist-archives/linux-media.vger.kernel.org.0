Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8098A349392
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 15:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhCYODI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 10:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbhCYOC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 10:02:58 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7110BC06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 07:02:58 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id l5so2190101ilv.9
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Trl5VOXw+aId25eogjZHm//lRIKRAlAdHZI6uUP4ps=;
        b=iTG1EVd156hJlJ3+CXGgj5XztJw3QV5MpFY+VFMwsz+4LXVvvoqgbQhNyk5fh7ykBK
         Y4uMMyNfXcLHaUbNIK2W7GYJWsSunnzv/CHIxK+f+nSsd9CsO34kP4MkhPIGA7VNeOlR
         hg87O9mkJKmP9OjD+56NPzDdxXwTrXo4bx2lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Trl5VOXw+aId25eogjZHm//lRIKRAlAdHZI6uUP4ps=;
        b=o1XzlRZJWOhAAo1IAggtZb4aHmdHIo5EQrTMRNsFFmHHOrxmYZ0q0PQZTwZrCiNVoW
         CfwsEFl4itMChjp3IAUVc5xA+YmBJ1jfkRqwHFE7MWbo5BhcmOMdJ5737M8SC22ni1f8
         ywbJWi1GDl9usxJGRW7ng2CpQny6yKMXa8blvKIZATkC4X6zCRjUBIgl+gy/fpd+Bdfv
         WTYGjoFbrOCX0TrVB2g8P4cihFAMaipcyAFzcn4dN7Qj/RPVmnDG9NdO7lxXJXWuN7FU
         yLbNlwdU66h4SrERZrP+qSnrDnQL3T8xRVYdk56BZAGPXZiG5GJhYsKOJYaTdIj7rFbB
         PNGQ==
X-Gm-Message-State: AOAM530kdZ9E5vjFT6qemF7KgMg9KBoGxMjQj7oxvVAABT2DL9wQ5yci
        dn78JygrkZ0vewVGtr2fd0BGKkwcC5sTOg==
X-Google-Smtp-Source: ABdhPJw3oOOXgxa2lwaiow5+Li5TS1fswsfhBaKOu8oyG9cXiuadEScr8t4/eeezS89lMBt+yujFhw==
X-Received: by 2002:a92:c611:: with SMTP id p17mr6595313ilm.54.1616680977562;
        Thu, 25 Mar 2021 07:02:57 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id l14sm2840238ilc.33.2021.03.25.07.02.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 07:02:57 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id r8so2195458ilo.8
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 07:02:56 -0700 (PDT)
X-Received: by 2002:a92:3648:: with SMTP id d8mr6359874ilf.69.1616680976507;
 Thu, 25 Mar 2021 07:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <347cdb4a-19a2-98ce-580f-5aba4abfb2fc@xs4all.nl>
 <CAPybu_34Zus8rSSEMsrxo0euQ+SFu-aZUmHRya7GFPJysp6TsQ@mail.gmail.com>
 <35f1fa6e-a498-9217-5359-82b58dec61f6@xs4all.nl> <CANiDSCvWG-iyj9wAaKKKT-6n=ngEW8dN0Mx0VcTWTktzt7nCdw@mail.gmail.com>
 <8a265a15-c9f6-bea4-1a38-df675a977e8c@xs4all.nl>
In-Reply-To: <8a265a15-c9f6-bea4-1a38-df675a977e8c@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 25 Mar 2021 15:02:45 +0100
X-Gmail-Original-Message-ID: <CANiDSCvy_FyxQXv+04u0b9vp1mF7TB_e6XGmSWYM6VoYVrDPHA@mail.gmail.com>
Message-ID: <CANiDSCvy_FyxQXv+04u0b9vp1mF7TB_e6XGmSWYM6VoYVrDPHA@mail.gmail.com>
Subject: Re: [PATCH] uvcvideo: improve error handling in uvc_query_ctrl()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Thu, Mar 25, 2021 at 2:57 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 25/03/2021 14:54, Ricardo Ribalda wrote:
> > hi Hans
> >
> > On Thu, Mar 25, 2021 at 1:18 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 23/03/2021 16:25, Ricardo Ribalda Delgado wrote:
> >>> Hi Hans
> >>>
> >>> Thanks for the patch. I like how uvc is ending :)
> >>>
> >>> On Mon, Mar 22, 2021 at 1:09 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>>>
> >>>> - If __uvc_query_ctrl() failed with a non-EPIPE error, then
> >>>>   report that with dev_err. If an error code is obtained, then
> >>>>   report that with dev_dbg.
> >>>>
> >>>> - For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
> >>>>   EACCES is a much more appropriate error code. EILSEQ will return
> >>>>   "Invalid or incomplete multibyte or wide character." in strerror(),
> >>>>   which is a *very* confusing message.
> >>>>
> >>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> >>>> ---
> >>>> Ricardo, this too can be added to the uvc series.
> >>>> ---
> >>>>  drivers/media/usb/uvc/uvc_video.c | 44 +++++++++++++++++--------------
> >>>>  1 file changed, 24 insertions(+), 20 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> >>>> index b63c073ec30e..3f461bb4eeb9 100644
> >>>> --- a/drivers/media/usb/uvc/uvc_video.c
> >>>> +++ b/drivers/media/usb/uvc/uvc_video.c
> >>>> @@ -68,7 +68,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >>>>                         u8 intfnum, u8 cs, void *data, u16 size)
> >>>>  {
> >>>>         int ret;
> >>>> -       u8 error;
> >>>> +       u8 error = 0;
> >>>>         u8 tmp;
> >>>>
> >>>>         ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> >>>> @@ -76,35 +76,39 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >>>>         if (likely(ret == size))
> >>>>                 return 0;
> >>>>
> >>>> -       dev_dbg(&dev->udev->dev,
> >>>> -               "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> >>>> -               uvc_query_name(query), cs, unit, ret, size);
> >>>> +       ret = ret < 0 ? ret : -EPIPE;
> >>>>
> >>>> -       if (ret != -EPIPE)
> >>>> -               return ret;
> >>>> -
> >>>> -       tmp = *(u8 *)data;
> >>>> +       if (ret == -EPIPE) {
> >>>> +               tmp = *(u8 *)data;
> >>>>
> >>>> -       ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
> >>>> -                              UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
> >>>> -                              UVC_CTRL_CONTROL_TIMEOUT);
> >>>> +               ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
> >>>> +                                      UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
> >>>> +                                      UVC_CTRL_CONTROL_TIMEOUT);
> >>>>
> >>>> -       error = *(u8 *)data;
> >>>> -       *(u8 *)data = tmp;
> >>>> +               if (ret == 1)
> >>>> +                       error = *(u8 *)data;
> >>>> +               *(u8 *)data = tmp;
> >>>> +               if (ret != 1)
> >>>> +                       ret = ret < 0 ? ret : -EPIPE;
> >>>> +       }
> >>>>
> >>>> -       if (ret != 1)
> >>>> -               return ret < 0 ? ret : -EPIPE;
> >>>> +       if (error)
> >>>> +               dev_dbg(&dev->udev->dev,
> >>>> +                       "Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
> >>>> +                       uvc_query_name(query), cs, unit, error);
> >>>> +       else
> >>>> +               dev_err(&dev->udev->dev,
> >>>> +                       "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> >>>> +                       uvc_query_name(query), cs, unit, ret, size);
> >>>
> >>> If __uvc_query_ctrl and UVC_VC_REQUEST_ERROR_CODE_CONTROL failed,
> >>> error is 0. And I think that you want to show a dev_err in that case.
> >>> Maybe we can initialize error to 7 ?
> >>
> >> I'm confused, if error == 0, then it does show dev_err.
> >
> > My bad.
> >
> > Ignore the message.
> >
> > Can we write it as ?:
> >
> > if (!error) {
> >   dev_dbg(&dev->udev->dev,
> >  "Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
> >  uvc_query_name(query), cs, unit, error);
> >  return ret;
> > }
> >
> > dev_err(&dev->udev->dev,
> > "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> > uvc_query_name(query), cs, unit, ret, size);
>
> Sure! Just take this patch as inspiration :-)

Do you mind if I modify it before resend?
>
> Regards,
>
>         Hans
>
> >
> >
> >
> >>
> >>>
> >>>
> >>>>
> >>>> -       uvc_dbg(dev, CONTROL, "Control error %u\n", error);
> >>>> +       if (!error)
> >>>> +               return ret;
> >>> I think we do not want these two lines (read next comment)
> >>>>
> >>>>         switch (error) {
> >>>> -       case 0:
> >>>> -               /* Cannot happen - we received a STALL */
> >>>> -               return -EPIPE;
> >>>>         case 1: /* Not ready */
> >>>>                 return -EBUSY;
> >>>>         case 2: /* Wrong state */
> >>>> -               return -EILSEQ;
> >>>> +               return -EACCES;
> >>>>         case 3: /* Power */
> >>>>                 return -EREMOTE;
> >>>>         case 4: /* Out of range */
> >>>
> >>> Maybe we want a dev_dbg if the error code is unknown and return ret?
> >>
> >> Make sense.
> >>
> >> Regards,
> >>
> >>         Hans
> >
> >
> >
>


-- 
Ricardo Ribalda
