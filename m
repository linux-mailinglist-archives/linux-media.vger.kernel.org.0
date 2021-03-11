Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65810338103
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 00:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhCKXAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 18:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbhCKW7p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 17:59:45 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B3FC061574;
        Thu, 11 Mar 2021 14:59:45 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id a1so4323325ljp.2;
        Thu, 11 Mar 2021 14:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=avlbXSr4K9M39N0jqaeKNrXLupfW89I8m5I+d07Bgy4=;
        b=gSm/nnvOGdZI6sFzwqZWh7HPpHbVQ0AGQOGF88WM0Pela6vrDZzJUNLv5HK6jb8eC4
         QgNaivc/TgEHWr59w9pEjnXbRGnb46GW/+tiT0hSWOLO3AYfVG2r7WTmVyLKeATZrmcI
         I9tCay7UHBkkX0c5STT398fa+lKwdnTjalamlHXmcFPIVpYdQhnT7iEJh1PLQ4s/RhwI
         JBOCJX5oGavWEpLkoJ5fvZ6J07eXz5NahPanlq0jW7e1I4szLU4yfG8N4fm5znK+yg/G
         l46HnRBeD2e5O9qdQ7W4XzMi7Za7vMhxSRTBUA+lSjdEAzCronHGBcL3vl3FIYpIa1nr
         b2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=avlbXSr4K9M39N0jqaeKNrXLupfW89I8m5I+d07Bgy4=;
        b=ABWH03RMp//vpEQkc87QjhnVZyZVYClnDUtvAdJxY8+DsGJOsbPfR4jYRtA4zGbfu+
         3DRk/X52QxI2/epuC/Yz8PQlgfjJHEfk7l7dTHbmH+CJ6nWLlXfTooPERDtUimYpm+Nq
         anFYz47P00cH2TSxwYyRKpmqo5oYKaltGIP4YIcx6kyCvo2YrWsvv+AfOROIItX/XX2d
         ZpW2hvFUeHiKaq1m/nEkud3xkb8i6dHEUE+n/rgAQPuIz8QXg79TKdwycS6u05WAx3bp
         70QDG0+jJ1n1nNSnLwljoSV5CTBB6BatHoQwXsxU6vQR97RQKS2eYV8co2Xq4Mpa3J8X
         YLbA==
X-Gm-Message-State: AOAM533AGTp1AyOHVMH65OoDjN3b88q4u702+40ilINX9M2jIL+kvGE2
        a6SVyK/Cs4G0PrOL2phDPQ7KFQkPAcvSUoH35Ek=
X-Google-Smtp-Source: ABdhPJwmhJosghyrEdq+XnttmxhhVUrZ9GssCtr29C+dzlIUcL+eJ6LR7/kKe00gR5wIB5PAIYqgQARgc/gIEoUt2Wc=
X-Received: by 2002:a2e:6e0c:: with SMTP id j12mr652702ljc.365.1615503583894;
 Thu, 11 Mar 2021 14:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-4-ribalda@chromium.org> <YEqevkojuvniSTFS@pendragon.ideasonboard.com>
In-Reply-To: <YEqevkojuvniSTFS@pendragon.ideasonboard.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Thu, 11 Mar 2021 23:59:27 +0100
Message-ID: <CAPybu_2GF96ODzrkycAixiRg+L_BMCF40uW5jBhErND8v6STjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] media: uvcvideo: Return -EIO for control errors
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Mar 11, 2021 at 11:53 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.

Thank you :)
>
> On Thu, Mar 11, 2021 at 11:19:43PM +0100, Ricardo Ribalda wrote:
> > The device is doing something unspected with the control. Either because
> > the protocol is not properly implemented or there has been a HW error.
> >
> > Fixes v4l2-compliance:
> >
> > Control ioctls (Input 0):
> >                 fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
> >         test VIDIOC_G/S_CTRL: FAIL
> >                 fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> The change looks good to me.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Which of the error codes below do you get with your camera, and for
> which control ?

Bus 001 Device 003: ID 05c8:03a2 Cheng Uei Precision Industry Co., Ltd
(Foxlink) XiaoMi USB 2.0 Webcam

info: checking extended control 'White Balance Temperature' (0x0098091a)
Control error 7
info: checking extended control 'Exposure (Absolute)' (0x009a0902)
Control error 6


>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index f2f565281e63..25fd8aa23529 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -112,6 +112,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >       case 5: /* Invalid unit */
> >       case 6: /* Invalid control */
> >       case 7: /* Invalid Request */
> > +             /*
> > +              * The firmware has not properly implemented
> > +              * the control or there has been a HW error.
> > +              */
> > +             return -EIO;
> >       case 8: /* Invalid value within range */
> >               return -EINVAL;
> >       default: /* reserved or unknown */
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
