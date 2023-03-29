Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40A926CEEBF
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 18:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjC2QHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 12:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjC2QHV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 12:07:21 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDBB469C
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 09:06:36 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so19046405pjp.1
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680105970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RGeLND7CqNFElzj+KkwONKJwoCGzjwKOWHOimvr2vj4=;
        b=dEY+jYtIsCskXn4yrVQKzXxJC4HO5IXF7ys7nIF2JgIK56FLpAZFcmvRdHb9rNKs8/
         uNwZEWcvfOAWOSTUsVQ+ksf9XpXhLeNvGxtk7GYqu2uYtKLU9ReXV+M5Tmakhh9KNZvJ
         tO29jH2j0HYJX87tWo4XuHeuxP23u7/uK3TJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGeLND7CqNFElzj+KkwONKJwoCGzjwKOWHOimvr2vj4=;
        b=3HuAT75fzJAanJyim+5Q6FfOdx+qkVPV700VfHsHY8RQ35QdJcnmAVeHX8ATegfB5Y
         rV5RCS+s1PXHX1fVOzCsHZWet9xJ0VTgNG6AAm7DpoRXkRFf4xE/y2CvfBZ1w+rv8pcI
         3mbJtNX9HDKmj6z6s8S5MQ2KgQ8xxWrx992+gJTiq8feDNjfGkm/78DSICrRzWrT+zdG
         1eZtQtY7zXscUwag+KT6+8bivL6yYW3rNr4He7G09yCcGsXKYoE8znvSIwGWLJe0n1Rn
         YopO1ETU/YMAkkTfwDaabf49CY97rA3p9qhXTWnRji6LP8ag3RTg63cKe/pX97ZzpTGU
         GlrQ==
X-Gm-Message-State: AAQBX9cXcadmFP2uYSE7jHpcpGd1m2j7g7EbEMGHzJEvROVaVU7W1Xi+
        l7rE1CaVnrTU8p1dZ+xMaIQTNyT4d55vexa6O0c=
X-Google-Smtp-Source: AKy350aWqcSsTT5KoitAAdI6qGyo2zjkFILV5I11Efy1MMmQatABS82QbUaRvdoTncepKct5l1pkDw==
X-Received: by 2002:a17:902:d0d1:b0:1a2:73d8:5a87 with SMTP id n17-20020a170902d0d100b001a273d85a87mr1935838pln.5.1680105970208;
        Wed, 29 Mar 2023 09:06:10 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id j1-20020a17090276c100b00195f0fb0c18sm23180081plt.31.2023.03.29.09.06.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 09:06:09 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id d13so14518976pjh.0
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 09:06:09 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:1a0:4321:920e with SMTP id
 f3-20020a170902ce8300b001a04321920emr7390726plg.12.1680105969005; Wed, 29 Mar
 2023 09:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
In-Reply-To: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 29 Mar 2023 18:05:57 +0200
X-Gmail-Original-Message-ID: <CANiDSCuiHLw6FBu8GV93Mm2WK5suCnGk8PBUDfn_krtMfPwdaw@mail.gmail.com>
Message-ID: <CANiDSCuiHLw6FBu8GV93Mm2WK5suCnGk8PBUDfn_krtMfPwdaw@mail.gmail.com>
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown pixelformats
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        regressions@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for the patch.

I believe the user can fetch this info from lsusb, so this is kind of
duplicated info, and this is why it was removed.

Is there an app that uses this unknown format code ? Or the only
complaint is that WARN() is too loud for the user?

Regards!

On Wed, 29 Mar 2023 at 14:39, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> If the fcc is 0 (indicating an unknown GUID format), then fill in the
> description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
> ---
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7aefa76a42b3..2f1ced1212cd 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 } else {
>                         dev_info(&streaming->intf->dev,
>                                  "Unknown video format %pUl\n", &buffer[5]);
> +                       snprintf(format->name, sizeof(format->name), "%pUl\n",
> +                                &buffer[5]);
Don't we need at least 38 chars for this?

https://docs.kernel.org/core-api/printk-formats.html#uuid-guid-addresses


> +
>                         format->fcc = 0;
>                 }
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 35453f81c1d9..fc6f9e7d8506 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>         if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>                 fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
>         fmt->pixelformat = format->fcc;
> +       if (format->name[0])
> +               strscpy(fmt->description, format->name,
> +                       sizeof(fmt->description));
> +
>         return 0;
>  }
>
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9a596c8d894a..22656755a801 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -264,6 +264,8 @@ struct uvc_format {
>         u32 fcc;
>         u32 flags;
>
> +       char name[32];
> +
>         unsigned int nframes;
>         struct uvc_frame *frame;
>  };
>


--
Ricardo Ribalda
