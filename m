Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7BD100787
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 15:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfKROhv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 09:37:51 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:45505 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfKROhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 09:37:51 -0500
Received: by mail-vs1-f68.google.com with SMTP id n9so11612804vsa.12
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2019 06:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=woIJlNyJu2t+gQeRwz4H45G+wmzi9EKkGO4M4jVnapg=;
        b=IRG3Svbt7lqiw2j6KUvvr/3Q/1M2itPlTMNuNoK/QiLilH+EaWiaZl9Ue0rIPOAx85
         FM1o/VW3gVbD0P6JRjYFdln3diAdO3b3mG+0pOAvvTOKfZpviMN+uJt3vQIbRH06L35P
         FUMC8wRGurMvUfSaMQeZZsIyO5KDcgb2ew977EKMsp9DO1k+1b5ci8I0L/sftXfsuIUL
         IEqRuM/DR+g2JqoYCbYVrO/Rz3/20IsAVYM7xMbFCHK1X+M97qGdNy+otwl69ZSD4HXD
         xVY+blqVCRvak0Hk5qBuKOBjHNq4rdPCGnxTj0pGY1bLR35Zr2ka1q4Ps8EqFXI3KhUV
         2Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=woIJlNyJu2t+gQeRwz4H45G+wmzi9EKkGO4M4jVnapg=;
        b=LD+lJ/3Oq1YvYptWApWtkwUTKTEXcmievK4iortrPVIeRg862mGism4ncJIJba5wNr
         6csBDG4h55q6gBkdmlcbT/VGr4b4m1AsacAywe4ot5i5nlsX8bGNB9wkrOzeOeHUWvUD
         omfwHaz2yDBLnTjo/ECBSFf4VaLiQC2uYAl2+gkQsDkxxwiVVvmNp/Y0nTPpA1YwgCBh
         9CcYCROEL8F4NXlysL5hUdATn23A4eiPrMhSUFIzzikyPS2SZa6DyGoHQdWxoYdvFv6i
         9kPBLVzYjdmQRzfLZ9UYi9Qywh2GJsLpAafT2+NIg/DBMxFkRq1yZZXOXKoOd31Gjq0B
         Pv/g==
X-Gm-Message-State: APjAAAVSy3FmSg5ZR2+RnqoJt5bKWaiaz9B43w8U9orkWFIe3ZhyJlJ+
        78Cs4xu932wbk/mWcnM6s3oAajzVz1FXTjEM8xPHFA==
X-Google-Smtp-Source: APXvYqx1BQQyFysfqbaRejfmQQXGhfnwMoOrtlfUV2Y8AbL7ngQjfi4ai2y8GdDNn9BU9qXdllFvz6aMV1LY4ZLVktU=
X-Received: by 2002:a67:f646:: with SMTP id u6mr18322938vso.47.1574087869030;
 Mon, 18 Nov 2019 06:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20191115161116.16304-1-dafna.hirschfeld@collabora.com>
 <CAAEAJfCpszObksiU7uZcX2Aw=oiuYCMEUgxU_ZC1zBPq+soQaw@mail.gmail.com> <ca94ffb1-5021-c3b2-5b7c-55d4d525427a@collabora.com>
In-Reply-To: <ca94ffb1-5021-c3b2-5b7c-55d4d525427a@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 18 Nov 2019 11:37:37 -0300
Message-ID: <CAAEAJfBk1KWBiZ2B58aK+w0Zm+E7nmud4bv92oOxv1ZRAFGa9w@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-core: set sd->devnode = NULL if
 v4l2_device_register_subdev_nodes fails
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 18 Nov 2019 at 11:15, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> On 11/15/19 11:12 PM, Ezequiel Garcia wrote:
> > Hi Dafna,
> >
> > Thanks for the patch!
> >
> > On Fri, 15 Nov 2019 at 13:13, Dafna Hirschfeld
> > <dafna.hirschfeld@collabora.com> wrote:
> >>
> >> In case v4l2_device_register_subdev_nodes fails, sd->devnode is
> >> unregistered and then released. Therefore the field is set to
> >> NULL so that the subdev won't hold a pointer to a released object.
> >> This fixes a reference after free bug in function
> >> v4l2_device_unregister_subdev
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >>   drivers/media/v4l2-core/v4l2-device.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> >> index 63d6b147b21e..468705c85e97 100644
> >> --- a/drivers/media/v4l2-core/v4l2-device.c
> >> +++ b/drivers/media/v4l2-core/v4l2-device.c
> >> @@ -250,6 +250,7 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
> >>                  if (!sd->devnode)
> >>                          break;
> >>                  video_unregister_device(sd->devnode);
> >> +               sd->devnode = NULL;
> >>          }
> >>
> >
> > You also need to clear devnode in v4l2_device_unregister_subdev, as we
> > discussed in IRC.
> > It would mean fixing a different issue that is triggered upon driver
> > removal/unbinding,
> I think that the right place to set devnode to null would be
> in the beginning of the function v4l2_device_release_subdev_node
> where it is freed. This ensures that the devnode is set to NULL always
> and only when it is freed.
> What do you think?
>

Makes sense. Or also, you can add this in
v4l2_subdev_release (called by v4l2_device_release_subdev_node)
since it's modifying the subdev, might as well do it there to keep
things even cleaner.

Thanks,
Ezequiel
