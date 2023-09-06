Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC857944E5
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 23:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244656AbjIFVBO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 17:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244647AbjIFVBN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 17:01:13 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2581BC7
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 14:01:01 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bdcade7fbso18497166b.1
        for <linux-media@vger.kernel.org>; Wed, 06 Sep 2023 14:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694034060; x=1694638860; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UQMwCTpNt+KxTz9xWXAiav+VDadxFYUSFtneEl0FIW0=;
        b=honQmJfnQNDn6f+lswnOQ9mS0rtdYNefJi5k482qV5WOOyOrjhXERyJL9EK3SJxIpn
         fn6Qw3nEcIZmFwhrmK/OXiUM95F4d0m8bU0tu/o838mt7OiON4V2OMqr0JC2fNn0ZFiT
         HbjYka5nCgmlyL+U4jsUYvI1Z8ibCIShQCO4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694034060; x=1694638860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQMwCTpNt+KxTz9xWXAiav+VDadxFYUSFtneEl0FIW0=;
        b=lNcxInEjMEk70+2zHoSXp4xkV8+4EcCoJz/vzSOiYNiclfQ0dVeQVUCafM5T7zjvCt
         sX4fFSUGTo7PyaWgmBNN05FrEySDAVjbwoNuIBkvdsCzrfj87RqVszfuI8t1rajfc3fI
         YKuhxMmaepLLu1Gkq1jlGibkh1MOxt4QfrXUuWuXBNi1b7EqqgxiF5XvCCwZjgbfq+hv
         gp+iBlJ0hYWfoHRCbYf93A8/AtTEP2j9vxCE+THOtLlw1odOwmfmhryCHO7nbPSbwOLH
         0xwmRm2zmF4POHhAvL1cPa8rtClsJpMq/iHt+QQzuLWPl3HVd8LLH85g5D3gilmjekcA
         8dtA==
X-Gm-Message-State: AOJu0YyU2zkV9n3Ipccb7Wr3wvJUUnXvXGFuTT6ibU/auHCYXKhYyVbP
        GXH5s4s0BCbBllnf3uqxZuE9i4v4z3A/kdH9X70=
X-Google-Smtp-Source: AGHT+IGFfKHiIpAmQz9+MpAHPQD37PttEOknuJg5vHGVqmeesbpzl3BG/WjXnLxJ99HEw6kAagvxSQ==
X-Received: by 2002:a17:906:4c9:b0:9a1:e371:e238 with SMTP id g9-20020a17090604c900b009a1e371e238mr2983244eja.64.1694034060080;
        Wed, 06 Sep 2023 14:01:00 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id r22-20020a170906365600b009a5f1d1564dsm9371694ejb.126.2023.09.06.14.00.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 14:00:59 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso309708f8f.3
        for <linux-media@vger.kernel.org>; Wed, 06 Sep 2023 14:00:58 -0700 (PDT)
X-Received: by 2002:adf:e70a:0:b0:315:8f4f:81b2 with SMTP id
 c10-20020adfe70a000000b003158f4f81b2mr3137778wrm.64.1694034057706; Wed, 06
 Sep 2023 14:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230817-chicony-v2-1-88335519989d@chromium.org> <20230906134435.GA24846@pendragon.ideasonboard.com>
In-Reply-To: <20230906134435.GA24846@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 6 Sep 2023 23:00:42 +0200
X-Gmail-Original-Message-ID: <CANiDSCv9wFPW32Y8TfxXWnOWyTtURg-D9F-AUmZeeLBfU1=p=A@mail.gmail.com>
Message-ID: <CANiDSCv9wFPW32Y8TfxXWnOWyTtURg-D9F-AUmZeeLBfU1=p=A@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix power line control for a Chicony camera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, 6 Sept 2023 at 15:44, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Tue, Sep 05, 2023 at 03:29:52PM +0000, Ricardo Ribalda wrote:
> > The device does not implement the control properly.
> >
> > Fixes v4l2-compliance error:
> >
> > info: checking control 'Power Line Frequency' (0x00980918)
> > fail: v4l2-test-controls.cpp(552): could not set valid menu item 3
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> This still applies :-)
>
> I've taken the patch in my tree and will push it for v6.7.

Thanks!
>
> > ---
> > This camera, like other Chicony devices, do not implement properly the
> > Power Line Frequency control.
> >
> > This time, I do not have direct access to the device, just to the
> > report, but since other devices from the same family are showing the
> > same error, it is safe to assume that the same fix will work here.
> > ---
> > Changes in v2:
> > - Fix IntefaceProtocol, the camera is uvc1.5
> > - I managed to write 0 to the control, so the proper quirk is uvc11 not
> >   limited
> > - Changes by Laurent:
> >       - Rename device
> >       - s/v4l/v4l2
> > - Link to v1: https://lore.kernel.org/r/20230817-chicony-v1-1-76bde4d6ff6b@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 08fcd2ffa727..4b5ea3501753 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2592,6 +2592,15 @@ static const struct usb_device_id uvc_ids[] = {
> >         .bInterfaceSubClass   = 1,
> >         .bInterfaceProtocol   = 0,
> >         .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> > +     /* Chicony Electronics Co., Ltd Integrated Camera */
> > +     { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > +       .idVendor             = 0x04f2,
> > +       .idProduct            = 0xb67c,
> > +       .bInterfaceClass      = USB_CLASS_VIDEO,
> > +       .bInterfaceSubClass   = 1,
> > +       .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> > +       .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_uvc11 },
> >       /* Chicony EasyCamera */
> >       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
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



-- 
Ricardo Ribalda
