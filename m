Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29673462BD
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 16:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbhCWPZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 11:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbhCWPZi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 11:25:38 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CAFC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 08:25:37 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m12so27217481lfq.10
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=92a1gsExe+NbSoH43J0S+ebb5eR/4sS4gTC5JOKWQWU=;
        b=JOZqaJyyk3SQsn8d14eUPoz/8BV/S8ZdH0DmyQ2vvT5CA3XIc5/dDVe0REx+nGckP1
         rInh+AHdw07XVDNDm6eeoPgHuH3eOOTLLjRoP8SqHrFKH90mCu3Uj/E0MLvQH3M5RX+6
         TLxhsZj76z5HhrXXYNi6i8W1luDIDOTyyKQRdr7WQDWKenN0GrDj1qNGMY2VhiCK0wbt
         6DnULwhjtqgnM9H0QtRugPf5c14UDQIMldZGtsENyjtwS80rp84WeZYsdyc7uyto1/fn
         FLlqG2HKDr7ZfRnE8JOjKvaLqtpaofjkIG3CTZxUKPiclQuGn5tdZIoy9qCNuQk9wuZB
         AREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=92a1gsExe+NbSoH43J0S+ebb5eR/4sS4gTC5JOKWQWU=;
        b=lK0+tIZXogPnbczzUEk+RGRlO/DBmsm3XidDqEvGIU5gqIiF0ZW8iB5dRwL727uT9v
         Vc3srKheooly5gb1SIDjpIx9Fbx4B8ZAgcPwji59xIq4wC5ers85vaVU1BgddBXGucDr
         GyeSUfAG56NPC64VtcbhFXGLbIoJ9ZRZ3soedv+f1L22lNaj03jiBFsz6ngyDWLQVpP/
         jfHZRdWZboTVj+slk+pbfVmWjR+K75Y0r+/PA8kXZ8TFrD2OOu45fnTmgXfJH3BTx0Tz
         Ocd/mIidZdm8sr9zd1r0A3gH19TXndNfRNspB1GsHTl2ZkUJ8gfSFbq90kHuRIWev6Wc
         0dNg==
X-Gm-Message-State: AOAM533T64vfzfzNMI18dH+LJPYOvi5AiMYKrpJymXQWttWC+8oRsHX4
        ptw1euf4skibQmlhUw4M/8amPbsUxk+vu1SLJ/3hzd9gAhiqkw==
X-Google-Smtp-Source: ABdhPJwQa+6E7O4/6+TsmeDx7uKkMjfoxuC3F2vFIT03PRqm5y0TIEDnVPcngZDKkqvqEibhUujMPbgJy+leZoWj25Q=
X-Received: by 2002:a19:434a:: with SMTP id m10mr2829552lfj.2.1616513136057;
 Tue, 23 Mar 2021 08:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <347cdb4a-19a2-98ce-580f-5aba4abfb2fc@xs4all.nl>
In-Reply-To: <347cdb4a-19a2-98ce-580f-5aba4abfb2fc@xs4all.nl>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Tue, 23 Mar 2021 16:25:20 +0100
Message-ID: <CAPybu_34Zus8rSSEMsrxo0euQ+SFu-aZUmHRya7GFPJysp6TsQ@mail.gmail.com>
Subject: Re: [PATCH] uvcvideo: improve error handling in uvc_query_ctrl()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for the patch. I like how uvc is ending :)

On Mon, Mar 22, 2021 at 1:09 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> - If __uvc_query_ctrl() failed with a non-EPIPE error, then
>   report that with dev_err. If an error code is obtained, then
>   report that with dev_dbg.
>
> - For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
>   EACCES is a much more appropriate error code. EILSEQ will return
>   "Invalid or incomplete multibyte or wide character." in strerror(),
>   which is a *very* confusing message.
>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
> Ricardo, this too can be added to the uvc series.
> ---
>  drivers/media/usb/uvc/uvc_video.c | 44 +++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index b63c073ec30e..3f461bb4eeb9 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -68,7 +68,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>                         u8 intfnum, u8 cs, void *data, u16 size)
>  {
>         int ret;
> -       u8 error;
> +       u8 error = 0;
>         u8 tmp;
>
>         ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> @@ -76,35 +76,39 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>         if (likely(ret == size))
>                 return 0;
>
> -       dev_dbg(&dev->udev->dev,
> -               "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> -               uvc_query_name(query), cs, unit, ret, size);
> +       ret = ret < 0 ? ret : -EPIPE;
>
> -       if (ret != -EPIPE)
> -               return ret;
> -
> -       tmp = *(u8 *)data;
> +       if (ret == -EPIPE) {
> +               tmp = *(u8 *)data;
>
> -       ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
> -                              UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
> -                              UVC_CTRL_CONTROL_TIMEOUT);
> +               ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
> +                                      UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
> +                                      UVC_CTRL_CONTROL_TIMEOUT);
>
> -       error = *(u8 *)data;
> -       *(u8 *)data = tmp;
> +               if (ret == 1)
> +                       error = *(u8 *)data;
> +               *(u8 *)data = tmp;
> +               if (ret != 1)
> +                       ret = ret < 0 ? ret : -EPIPE;
> +       }
>
> -       if (ret != 1)
> -               return ret < 0 ? ret : -EPIPE;
> +       if (error)
> +               dev_dbg(&dev->udev->dev,
> +                       "Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
> +                       uvc_query_name(query), cs, unit, error);
> +       else
> +               dev_err(&dev->udev->dev,
> +                       "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> +                       uvc_query_name(query), cs, unit, ret, size);

If __uvc_query_ctrl and UVC_VC_REQUEST_ERROR_CODE_CONTROL failed,
error is 0. And I think that you want to show a dev_err in that case.
Maybe we can initialize error to 7 ?


>
> -       uvc_dbg(dev, CONTROL, "Control error %u\n", error);
> +       if (!error)
> +               return ret;
I think we do not want these two lines (read next comment)
>
>         switch (error) {
> -       case 0:
> -               /* Cannot happen - we received a STALL */
> -               return -EPIPE;
>         case 1: /* Not ready */
>                 return -EBUSY;
>         case 2: /* Wrong state */
> -               return -EILSEQ;
> +               return -EACCES;
>         case 3: /* Power */
>                 return -EREMOTE;
>         case 4: /* Out of range */

Maybe we want a dev_dbg if the error code is unknown and return ret?
> --
> 2.30.0
>


-- 
Ricardo Ribalda
