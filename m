Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC4C33863A
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 07:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbhCLGwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 01:52:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhCLGvo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 01:51:44 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574F7C061574;
        Thu, 11 Mar 2021 22:51:44 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 184so5401505ljf.9;
        Thu, 11 Mar 2021 22:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A02n+NMAd8eL7DH8iNao8zcIag1ILDz80ELEqIyHHZo=;
        b=J36C5piggPIl7dd9yoqgznx8u7ngRlNKo2Pa32t1TywPcZPu09skaKUrDmQuXo7xW9
         6VnoiMPBre59TN9nEYzmiUFgeORkHpFrPsT2xi+Xdmpkdat99bDJwiJ1o/GJ8jeCE037
         GBrkdtsnnt2DNJ5NVvfGQaldTKVfc802rZHWwRtnyzqkz9IC+S6t8NBqOe8Lka286rD/
         kW04k7BR6LW/NNl/5SAmE2oqZWY0xJRdy053PMPG9UPqV/ZlM53HWL3itEeIjxnA9pZU
         tPPb6COS2nRqf0yejKp0wwfzVXFKkqnVrYdshUf0925fp5osJ9oVVpwUYYYgfqRDhp6+
         z09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A02n+NMAd8eL7DH8iNao8zcIag1ILDz80ELEqIyHHZo=;
        b=G8UPAr5YclS/Kl3GjPFcbAh7cypXh1xgfixNsgSRXmNk2yvXb0WL3GisFgWylagG4a
         XhcN3QYc2O+ZMhgTHtwjlFy0gbG2xZMfukunlE9BSMJ/f5gPam4kNcAMbVdImyWJ+sRd
         nx0JU39ZrJa4qi0zdfbNaFo4JC/a1fyodak2vrxckVWoWJbXGXm/laxAQVbQ2gRluGc1
         m7G6dEodDcNmY3jsFZt7Tn+qUr4UwA5JvHYuk1YX0MI0me7gu845zOUephJTdcSsou77
         fYF0clvBSkYZPIP3gC5w5DN1fCS0P+NZYuviurYlxp1oIDAxk31Ss7EhomwMp4AzE6cl
         5bOw==
X-Gm-Message-State: AOAM530Z1svgwawzJM6EaJXGYDfprPb1xVhrAbo5TmoxB4sZ1tGOTx7U
        vl3pClrp1rqsDnPWoTL0/BESuLmQFkArueZjCOg=
X-Google-Smtp-Source: ABdhPJwMrXrUdY9rDHk50mf/W++NSnpSBQ1pBOQOAXf6/w9+qK0X+o5+sPFXOHuvn0/NoRe4YANtg1fv0WApfz7nPcs=
X-Received: by 2002:a2e:6e0c:: with SMTP id j12mr1507938ljc.365.1615531902839;
 Thu, 11 Mar 2021 22:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-4-ribalda@chromium.org> <YEqevkojuvniSTFS@pendragon.ideasonboard.com>
 <CAPybu_2GF96ODzrkycAixiRg+L_BMCF40uW5jBhErND8v6STjA@mail.gmail.com> <YEqoBe5sQ+xP8PpY@pendragon.ideasonboard.com>
In-Reply-To: <YEqoBe5sQ+xP8PpY@pendragon.ideasonboard.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Fri, 12 Mar 2021 07:51:26 +0100
Message-ID: <CAPybu_11wgf4rdmWHvDRQUx0x8Z42KLrGeWzSEUTO=6A8L4BmA@mail.gmail.com>
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

On Fri, Mar 12, 2021 at 12:30 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Thu, Mar 11, 2021 at 11:59:27PM +0100, Ricardo Ribalda Delgado wrote:
> > On Thu, Mar 11, 2021 at 11:53 PM Laurent Pinchart wrote:
> > > On Thu, Mar 11, 2021 at 11:19:43PM +0100, Ricardo Ribalda wrote:
> > > > The device is doing something unspected with the control. Either because
> > > > the protocol is not properly implemented or there has been a HW error.
> > > >
> > > > Fixes v4l2-compliance:
> > > >
> > > > Control ioctls (Input 0):
> > > >                 fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
> > > >         test VIDIOC_G/S_CTRL: FAIL
> > > >                 fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
> > > >         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >
> > > The change looks good to me.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > Which of the error codes below do you get with your camera, and for
> > > which control ?
> >
> > Bus 001 Device 003: ID 05c8:03a2 Cheng Uei Precision Industry Co., Ltd
> > (Foxlink) XiaoMi USB 2.0 Webcam
> >
> > info: checking extended control 'White Balance Temperature' (0x0098091a)
> > Control error 7
> > info: checking extended control 'Exposure (Absolute)' (0x009a0902)
> > Control error 6
>
> :-S And what's the request (GET_CUR, GET_INFO, ...) ?

Failed to query (SET_CUR) UVC control 10 on unit 2: -32 (exp. 2).
Failed to query (SET_CUR) UVC control 4 on unit 1: -32 (exp. 4)
>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_video.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > index f2f565281e63..25fd8aa23529 100644
> > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -112,6 +112,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > > >       case 5: /* Invalid unit */
> > > >       case 6: /* Invalid control */
> > > >       case 7: /* Invalid Request */
> > > > +             /*
> > > > +              * The firmware has not properly implemented
> > > > +              * the control or there has been a HW error.
> > > > +              */
> > > > +             return -EIO;
> > > >       case 8: /* Invalid value within range */
> > > >               return -EINVAL;
> > > >       default: /* reserved or unknown */
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
