Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACA9B66C284
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjAPOof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbjAPOnn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:43:43 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD0135262
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:21:52 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id bj3so26064695pjb.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75qLQ4ZTy+zb7MfhuD6FB8jFBCO1xGIc9ZW9OCqfnxk=;
        b=RyYoFuA+EOCSHiG20L8pZ1EvjDdnC/oZIbxSwuIC/mk5MUFc5AmZfpuWFJ3mN97ePv
         q4hh3k0TuHNDOb4fEO/j5oA7GVjqCE2LQZWJXkqo7rs7sdqmekZyAob53c8hoB3cuuRz
         jCMX214WYudKTfkPs/YaCn4nq2B9+2xQNUnhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75qLQ4ZTy+zb7MfhuD6FB8jFBCO1xGIc9ZW9OCqfnxk=;
        b=NiMfQZiKGZ5dEAQ1ppTOXStPn31qgOMBM67cE7xr0tdzRsqUdIEuMCO03bPqOjvxdu
         Aq87bGCG5/zDWApvd/lYhoH7eObOEKAl50ixK9gSmHuzgYUXob+L/wvpc6VOUBlJJph4
         bjwPi6uUL4R0mzMSy1ya7AHVSFSKLOW2A5cRbN9y1IZvGlYymVUMU1fgheEkQzlzuZ+5
         anCQDVW0GG3Hdty+lhLO+dZXVaCRXqcPIrFrYq4gpds57dkSrKHrecnVTzSLAWjiXWNR
         WsUmYCkpk3fboFUgM4u3iRg8TAHi34KTDWlZE6Eh+dXwk4MpWb7gHpeTLR9rsNAnA8+7
         369A==
X-Gm-Message-State: AFqh2koAj2R1QjXGLpISqeGX0KYpiXX3L/qwXyIpo/+A42NAvWFStA10
        rZh7FtgOMBUWYqXLaCr8oUVG8pJY9sLUAd9EFQ8=
X-Google-Smtp-Source: AMrXdXuJJGrP3ltu8mwS3Uk0MrysD6zn+x7b7sL0NOhHUOtq+GZTDA/uBYmXDwiYuOjGG6l3Vx8SZw==
X-Received: by 2002:a17:903:32cc:b0:189:129e:92af with SMTP id i12-20020a17090332cc00b00189129e92afmr130737177plr.14.1673878911741;
        Mon, 16 Jan 2023 06:21:51 -0800 (PST)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com. [209.85.210.180])
        by smtp.gmail.com with ESMTPSA id t12-20020a170902b20c00b001931f232962sm17860089plr.112.2023.01.16.06.21.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 06:21:51 -0800 (PST)
Received: by mail-pf1-f180.google.com with SMTP id y5so21057263pfe.2
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:21:50 -0800 (PST)
X-Received: by 2002:a62:1501:0:b0:589:8362:c7ce with SMTP id
 1-20020a621501000000b005898362c7cemr2112397pfv.21.1673878910333; Mon, 16 Jan
 2023 06:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20230115205210.20077-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCvgxyRGw4EsGtGN5GxB_oCj2FpQgqr7tOUEyjwKSVRocA@mail.gmail.com>
 <Y8VbYq48+gmmd4rD@pendragon.ideasonboard.com> <CAL8NLXtDfhjRPy4EEE7Re+AkkbOo0Aeo-9kRd4CXsUKUHQ_yNw@mail.gmail.com>
In-Reply-To: <CAL8NLXtDfhjRPy4EEE7Re+AkkbOo0Aeo-9kRd4CXsUKUHQ_yNw@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 16 Jan 2023 15:21:39 +0100
X-Gmail-Original-Message-ID: <CANiDSCtO5G5aC2ZJyOz+vsyor1iO-HDQNdX7SBNLgA=D+nZg1w@mail.gmail.com>
Message-ID: <CANiDSCtO5G5aC2ZJyOz+vsyor1iO-HDQNdX7SBNLgA=D+nZg1w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4035
To:     =?UTF-8?Q?Kolbj=C3=B8rn_Jetne?= <kolbjorn@kodemaker.no>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Giuliano Lotta <giuliano.lotta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kolbj=C3=B8rn

On Mon, 16 Jan 2023 at 15:16, Kolbj=C3=B8rn Jetne <kolbjorn@kodemaker.no> w=
rote:
>
> I have no idea about the reason for being involved in this conversation..=
.
My bad

I tried finding the email of this user:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2000947/comments/22

and I thought it was you. Sorry about that!

>
> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> Kolbj=C3=B8rn Jetne
> Daglig leder
> +47 957 45 096
>
> KODEMAKER
> www.kodemaker.no
>
>
> man. 16. jan. 2023 kl. 15:12 skrev Laurent Pinchart <laurent.pinchart@ide=
asonboard.com>:
>>
>> Hi Ricardo,
>>
>> On Mon, Jan 16, 2023 at 02:05:28PM +0100, Ricardo Ribalda wrote:
>> > On Sun, 15 Jan 2023 at 21:52, Laurent Pinchart wrote:
>> > >
>> > > The Quanta ACER HD User Facing camera reports a UVC 1.50 version, bu=
t
>> > > implements UVC 1.0a as shown by the UVC probe control being 26 bytes
>> > > long. Force the UVC version for that device.
>> >
>> > Don't we also want to include 4035:4033 ?
>>
>> I've asked for the lsusb output for that device, I'll send a separate
>> patch when I get it.
>>
>> > I am curious about the PowerLine Control (does it have one?) will it
>> > behave like 1.1 or 1.5
>>
>> Good question. Hardcoding the version to 1.0a will not cause an error,
>> but may prevent the auto mode from being supported.
>>
>> An alternative would be to automatically fall back to the UVC 1.0a video
>> probe and commit control when the size returned by GET_CUR differs from
>> the value expected from UVC 1.5. That would be a generic fix that won't
>> require quirks. What do you think ?
>>
>> > Would it be possible to get the output with uvc_debug enabled?
>>
>> I'll let you tell Giuliano how to provide that :-)
>>
>> > > Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
>> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > > ---
>> > >
>> > > Giuliano, I believe you've successfully tested this patch. If so, co=
uld
>> > > you reply with a Tested-by tag ? Just copying the following in your
>> > > reply will do:
>> > >
>> > > Tested-by: Giuliano Lotta <giuliano.lotta@gmail.com>
>> > >
>> > >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>> > >  1 file changed, 11 insertions(+)
>> > >
>> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/=
uvc/uvc_driver.c
>> > > index 1a186abeb4fa..742eeaff333e 100644
>> > > --- a/drivers/media/usb/uvc/uvc_driver.c
>> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
>> > > @@ -2429,6 +2429,17 @@ static const struct usb_device_id uvc_ids[] =
=3D {
>> > >           .bInterfaceSubClass   =3D 1,
>> > >           .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
>> > >           .driver_info          =3D (kernel_ulong_t)&uvc_ctrl_power_=
line_limited },
>> > > +       /* Quanta ACER HD User Facing */
>> > > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
>> > > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
>> > > +         .idVendor             =3D 0x0408,
>> > > +         .idProduct            =3D 0x4035,
>> > > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
>> > > +         .bInterfaceSubClass   =3D 1,
>> > > +         .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
>> > > +         .driver_info          =3D (kernel_ulong_t)&(const struct u=
vc_device_info){
>> > > +               .uvc_version =3D 0x010a,
>> > > +         } },
>> > >         /* LogiLink Wireless Webcam */
>> > >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
>> > >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>> > >
>> > > base-commit: fd957081cff04668f390c6f290bdcc7fc009a0f1
>>
>> --
>> Regards,
>>
>> Laurent Pinchart



--=20
Ricardo Ribalda
