Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE363337FF4
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 22:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhCKV5F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 16:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbhCKV4m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 16:56:42 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D58FC061574;
        Thu, 11 Mar 2021 13:56:42 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id u20so4136429lja.13;
        Thu, 11 Mar 2021 13:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWm0wKkXQwN2wluhR+JEh82ryi4ERiPiZTL62C5iNLE=;
        b=D0sGPmc8ut4NgyybrDcApICctWyDw+dtiu1w9POpd7XkPydnwtHE1jJz/ImGsWSG98
         fzwrdW6DIrzhrsJsXi/XBcpcnkDs/yLxt+bngA9zq9AQwkAQ0VXj+KLSSW4FR5s/7+tZ
         u5U6leDdbmcYrJtBAAMj5VTGZUTx+cYN/J7Xrc8TIhZslrCg4MH3S8hfCb3wIkaYzd7l
         nyeFDbI6Cnyik0CMPv/bLp4H1ViyhhemrCiVuQ3zxgzleMVHvYx06fFkImgC6Uy606et
         By/dm3/+MUBfwNj1TTtttURcm9ZtCdPvpy3Z7IQRWt9utxw0irZD52Wamw32rUoMdnPo
         ZvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWm0wKkXQwN2wluhR+JEh82ryi4ERiPiZTL62C5iNLE=;
        b=FOsQlT5GNV7OlvyqCG1JrFXFhF77XLAZWuDglEESn03k/1u1gdx0um30wwQdvxQVPA
         ilkVYl70dqSxea5nvvzOa9u8zJmv3jhAlY3n9w/6HhC1DA6WEIsEjOoixrN3BWlqX4SJ
         3gG17B/dlgUuxbX8uu3OcgRqOUtNIF3aSiNsAAMuk8N1qJ3VN7AYU+ral6c6bdSlcMKQ
         vp5NBGvyIsb1LZdFLHRdjfSH2LCn3jQBHmCeLmFxdnTi6trQuU1CPB/pSmesrVQGO9wd
         yVP60uizzlz/I1yy3v7SlQyqJpQRTP42idauhzJF5KfKFBy2wDJsIzqHPeed2ASeuVtK
         DacQ==
X-Gm-Message-State: AOAM533QZPfWIB8QdO+Ade87SKVK7JvEGTqMSRQVnGmde4KtMkMi1EMK
        iXxvbf/s0eWgEF9x9PRnmOYM9SsS0r8Gmq9VHteE1UwwcdQ=
X-Google-Smtp-Source: ABdhPJy7V6Xx2odgQ34tdZANKTdrzPe5fNy8bzrJylql/8t1anaeqHlGoGIlNv6HreSyq2OGY0ZRlJLr63t50NbtAyk=
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr523355ljp.495.1615499798776;
 Thu, 11 Mar 2021 13:56:38 -0800 (PST)
MIME-Version: 1.0
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-5-ribalda@chromium.org> <CANiDSCtw2q7UxMoZSMeE545WCxMs-WSHR2xbjG+xWL9CaBE3Aw@mail.gmail.com>
 <YEo95GqO0XEX4Cg0@pendragon.ideasonboard.com>
In-Reply-To: <YEo95GqO0XEX4Cg0@pendragon.ideasonboard.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Thu, 11 Mar 2021 22:56:22 +0100
Message-ID: <CAPybu_2k8DQ2aT0eZUo39XMiiYZWQUw1mTc0Ji08aYNY_mUGGQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] media: uvcvideo: Return -EIO for control errors
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Mar 11, 2021 at 4:59 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Mar 11, 2021 at 03:08:22PM +0100, Ricardo Ribalda wrote:
> > As discussed in the IRC with Hans
> >
> > We need to specify in the commit message that this is most likely due
> > to hw error.
> >
> > On Thu, Mar 11, 2021 at 1:20 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > Fixes v4l2-compliance:
> > >
> > > Control ioctls (Input 0):
> > >                 fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
> > >         test VIDIOC_G/S_CTRL: FAIL
> > >                 fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
> > >         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
>
> As this isn't supposed to happen, how do you reproduce this ?

Just run v4l2-compliance in my notebook camera.

>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index f2f565281e63..5442e9be1c55 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -113,7 +113,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > >         case 6: /* Invalid control */
> > >         case 7: /* Invalid Request */
>
> For cases 5-7 I think -EIO is fine, as the driver should really not call
> this function with an invalid unit, control or request. If it does, it's
> a bug in the driver (we can check the units and controls the device
> claims to support, and the requests are defined by the UVC
> specification), if it doesn't and the device still returns this error,
> it's a bug on the device side.
>
> > >         case 8: /* Invalid value within range */
>
> For this case, however, isn't it valid for a device to return an error
> if the control value isn't valid ? There's one particular code path I'm
> concerned about, uvc_ioctl_default(UVCIOC_CTRL_QUERY) ->
> uvc_xu_ctrl_query() -> uvc_query_ctrl(), where it could be useful for
> userspace to know that the value it sets isn't valid.
>

Will fix in v2

Thanks!

> > > -               return -EINVAL;
> > > +               return -EIO;
> > >         default: /* reserved or unknown */
> > >                 break;
> > >         }
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
