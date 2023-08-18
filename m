Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2071E7806FF
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 10:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358526AbjHRIS6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Aug 2023 04:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358528AbjHRIS3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Aug 2023 04:18:29 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3511726BC
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 01:18:27 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-64723bb9e25so8538706d6.0
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 01:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692346707; x=1692951507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vbd50sC6d9YNA2CFlSsL+HcGC3OFpjFlTXRkR7YTq+Q=;
        b=HBt53BKee1fcXtwmATkcRv7McKm4Ni8clLiCcPDJQefkvWhLtPHLMbbltqfpvJ2r+y
         NFYGtGj7FFbs5VgAHapSZSKGMdl597Es5kRjwxjfe3xp9GGmkZu/orp30xbhw+3g51SX
         i3rn8Rh9TS7keukqs6nQIjun4jOjhewzpE7UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692346707; x=1692951507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vbd50sC6d9YNA2CFlSsL+HcGC3OFpjFlTXRkR7YTq+Q=;
        b=NLh55YfCCU4qfXX3e75nLjS60YbU+/VvAQeDLpyhRpT5BdubDDYxCdOA3gq/MHW4Ie
         gLZl07Gb13IPjeMlGT3MtsSkfOdt94rb7ucSA1eInl7n9L2CPaFu5OExzo/kzV9t+gYq
         k7jO2NTlGAZnxVRjv+yXKcpRabF26iQ2a6XGLDZ0yDdkI+JySrzd5bpdOIK96r+OsieI
         d/yhqydmQfe3YhUeBIDgeTUuf3LYMHCogEkM7rK6+rX4YrV4iMh8WXT1RcVZVhre76FZ
         HtrviJDXkioCE5pdK5toz9Uj+k+Nnt+3obVD2Pbrw0fefpcAxQEh4bRVPTJaHwa7eES6
         moZg==
X-Gm-Message-State: AOJu0YwcUB2M02WOzonu7NsyrQ3s3+Iavuhp5gXfXf3GkRnzE4G9drsT
        PAso8wHN3X32UIcPRNp0XbeuajIDhIr7vi72mSI=
X-Google-Smtp-Source: AGHT+IEm82gvYELg4uoIS9VnwSoPC+Ae7UN9jUXLSkwso5r1IrBMXuTJr2hxpftcv9aQWZP6uyRYVA==
X-Received: by 2002:a05:6214:d64:b0:636:3f18:4c2b with SMTP id 4-20020a0562140d6400b006363f184c2bmr7208763qvs.29.1692346706846;
        Fri, 18 Aug 2023 01:18:26 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id t25-20020a0cb719000000b0064a7e9ca8b2sm512161qvd.105.2023.08.18.01.18.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 01:18:26 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6424c61c80eso2961316d6.1
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 01:18:26 -0700 (PDT)
X-Received: by 2002:a0c:c981:0:b0:647:2b24:9708 with SMTP id
 b1-20020a0cc981000000b006472b249708mr2765883qvk.3.1692346706111; Fri, 18 Aug
 2023 01:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230817-chicony-v1-1-76bde4d6ff6b@chromium.org> <20230818081546.GA26285@pendragon.ideasonboard.com>
In-Reply-To: <20230818081546.GA26285@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 18 Aug 2023 10:18:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCtEU2cq5AphSCEsCkkZy8FWSrtZSC_ooaj_vSgarWe0FQ@mail.gmail.com>
Message-ID: <CANiDSCtEU2cq5AphSCEsCkkZy8FWSrtZSC_ooaj_vSgarWe0FQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix power line control for a Chicony camera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Fri, 18 Aug 2023 at 10:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Aug 17, 2023 at 12:38:04PM +0000, Ricardo Ribalda wrote:
> > The device does not implement the control properly.
> >
> > Fixes vl2-compliance error:
> >
> > info: checking control 'Power Line Frequency' (0x00980918)
> > fail: v4l2-test-controls.cpp(552): could not set valid menu item 3
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > This camera, like other Chicony devices, do not implement properly the
> > Power Line Frequency control.
> >
> > This time, I do not have direct access to the device, just to the
> > report, but since other devices from the same family are showing the
> > same error, it is safe to assume that the same fix will work here.
>
> Why, =C3=B4 why does UVC not provide a way to query this dynamically ? :-=
( Of
> course, even if it did, I'm sure vendors would get it wrong... It sounds
> like the Windows UVC compliance test suite must be a joke.
>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index 08fcd2ffa727..db2556e95b72 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2592,6 +2592,15 @@ static const struct usb_device_id uvc_ids[] =3D =
{
> >         .bInterfaceSubClass   =3D 1,
> >         .bInterfaceProtocol   =3D 0,
> >         .driver_info          =3D (kernel_ulong_t)&uvc_ctrl_power_line_=
limited },
> > +     /* Chicony Electronics Co., Ltd */
>
> I'll write
>
>         /* Chicony Electronics Co., Ltd Integrated Camera */
>
> as that's what the descriptors expose. Is this integrated in a
> chromebook by any chance ? If so, could you share which model the camera
> is found in, and can I add that to the comment ?

It is a non-chromebook running ChromeOS Flex.
https://chromeenterprise.google/os/chromeosflex/

I believe it is a thinkpad, but I am not sure the exact model.

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +     { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > +       .idVendor             =3D 0x04f2,
> > +       .idProduct            =3D 0xb67c,
> > +       .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > +       .bInterfaceSubClass   =3D 1,
> > +       .bInterfaceProtocol   =3D 0,
> > +       .driver_info          =3D (kernel_ulong_t)&uvc_ctrl_power_line_=
limited },
> >       /* Chicony EasyCamera */
> >       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >                               | USB_DEVICE_ID_MATCH_INT_INFO,
> >
> > ---
> > base-commit: 4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
> > change-id: 20230817-chicony-9c35f2046c6f
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda
