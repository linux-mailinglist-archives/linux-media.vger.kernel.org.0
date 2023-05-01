Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3B76F3180
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 15:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbjEANWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 09:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbjEANWb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 09:22:31 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9228018E
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 06:22:29 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b57c49c4cso1784726b3a.3
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682947349; x=1685539349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=glaUzhFD2eYetcALzAJI/QUuDMV+7uhXozu/LBxtHaQ=;
        b=Tw32Ux/TjWUAe2l+XrrDDym4Wzhecc/KSWna9kRtm3yndNaavl//uCBn5Km1V0jBfG
         4xd/x5c4srbtyFe8wAXx6GJvmkQktQiS7J14RaI7wuVrQpzuY4Dak4ukCAbm2CQ5x05U
         vZLBz2WPho8rbqabo6XG9HPrLIr9vwNwXjNYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682947349; x=1685539349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glaUzhFD2eYetcALzAJI/QUuDMV+7uhXozu/LBxtHaQ=;
        b=ZueBbJsjTfYqOpSyvgEomFlNmtVpj43ZvdjRO7PyzyoxqTBPlcgqTbGZnYGGKoa6L2
         +qvF4MJziGwXEgIYx0OKl5e+CrXRegQdIfI0/5NCmm2L9j8FvnO5Ks3XONKwGmJXah25
         D/zJDmd1Pe8yH/bO0ajZfDp7oqbrhfH7Qff8IB9dsrfLaB8nXjYfMSjyuVWj3YhHOKLS
         1q3POYr18pK4DBaPOE4+03B7K0TZFWxMFuooOnIbGMTrIeD+DIMI+aTHwb3v6XtNprzC
         PJ4oWi+6qbMKP3QmO+y3Q6GT09ssg6aelalCs9K3iKbwLxWs/w8L/NFbJEdpGG9shiSS
         Zy1g==
X-Gm-Message-State: AC+VfDxtzs00kXSO1Pu19js3GmZZ0XDRowLQWU6yZiawMdwWz1ZRJYBi
        dNUHC6nV5x4wf3l7GRa1o0+8/eABbnJ/Xli3SLNF9w==
X-Google-Smtp-Source: ACHHUZ4qB7DF1csdIJ6S7FOJ3AM0GUAKyyW2CqWkv6eUURuBKOXtThqGqRo37B+Ra5thhAzkg0230Q==
X-Received: by 2002:a05:6a00:150f:b0:63f:1600:e711 with SMTP id q15-20020a056a00150f00b0063f1600e711mr18987956pfu.29.1682947348815;
        Mon, 01 May 2023 06:22:28 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id 69-20020a621948000000b00634dde2992bsm19854785pfz.132.2023.05.01.06.22.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 06:22:28 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5144043d9d1so1622846a12.3
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 06:22:28 -0700 (PDT)
X-Received: by 2002:a17:90a:2d86:b0:246:b8a5:b702 with SMTP id
 p6-20020a17090a2d8600b00246b8a5b702mr14535792pjd.29.1682947347680; Mon, 01
 May 2023 06:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230420100750.10463-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCvo4oX2DmdXApofiJybCrf+Dhj4-jtmUnmU+UfgUw0fhA@mail.gmail.com> <20230501120129.GB21559@pendragon.ideasonboard.com>
In-Reply-To: <20230501120129.GB21559@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 1 May 2023 15:22:16 +0200
X-Gmail-Original-Message-ID: <CANiDSCug07u1kHPm0Q1dHrTo_zZRqsHRKn42sFXpFjqkjAansg@mail.gmail.com>
Message-ID: <CANiDSCug07u1kHPm0Q1dHrTo_zZRqsHRKn42sFXpFjqkjAansg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Don't expose unsupported formats to userspace
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, 1 May 2023 at 14:01, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Mon, May 01, 2023 at 01:44:11PM +0200, Ricardo Ribalda wrote:
> > Hi Laurent
> >
> > I agree with the intent of the patch but am not sure that this will work.
> >
> > Regards!
> >
> > On Thu, 20 Apr 2023 at 12:07, Laurent Pinchart wrote:
> > >
> > > When the uvcvideo driver encounters a format descriptor with an unknown
> > > format GUID, it creates a corresponding struct uvc_format instance with
> > > the fcc field set to 0. Since commit 50459f103edf ("media: uvcvideo:
> > > Remove format descriptions"), the driver relies on the V4L2 core to
> > > provide the format description string, which the V4L2 core can't do
> > > without a valid 4CC. This triggers a WARN_ON.
> > >
> > > As a format with a zero 4CC can't be selected, it is unusable for
> > > applications. Ignore the format completely without creating a uvc_format
> > > instance, which fixes the warning.
> > >
> > > Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 13 +++++++++----
> > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index de64c9d789fd..25b8199f4e82 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -251,14 +251,17 @@ static int uvc_parse_format(struct uvc_device *dev,
> > >                 /* Find the format descriptor from its GUID. */
> > >                 fmtdesc = uvc_format_by_guid(&buffer[5]);
> > >
> > > -               if (fmtdesc != NULL) {
> > > -                       format->fcc = fmtdesc->fcc;
> > > -               } else {
> > > +               if (!fmtdesc) {
> > > +                       /*
> > > +                        * Unknown video formats are not fatal errors, the
> > > +                        * caller will skip this descriptor.
> > > +                        */
> > >                         dev_info(&streaming->intf->dev,
> > >                                  "Unknown video format %pUl\n", &buffer[5]);
> > > -                       format->fcc = 0;
> > > +                       return 0;
> > >                 }
> > >
> > > +               format->fcc = fmtdesc->fcc;
> > >                 format->bpp = buffer[21];
> > >
> > >                 /*
> > > @@ -689,6 +692,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> > >                                 &interval, buffer, buflen);
> >
> > For devices with unknown formats streaming->nformats will not be
> > valid, it will be higher than the actual formats on
> > streaming->formats.
>
> Indeed. I think this could be handled quite simply:

We will still be overallocating. I guess it is not a big deal...

But what about a helper function.  I think it will be less hacky


diff --git a/drivers/media/usb/uvc/uvc_driver.c
b/drivers/media/usb/uvc/uvc_driver.c
index 7aefa76a42b3..b49c2b911d03 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -483,6 +483,33 @@ static int uvc_parse_format(struct uvc_device *dev,
        return buffer - start;
 }

+static bool is_valid_format(unsigned char *buffer, unsigned int buflen)
+{
+       if (buflen < 2)
+               return false;
+
+       switch (buffer[2]) {
+       case UVC_VS_FORMAT_UNCOMPRESSED:
+       case UVC_VS_FORMAT_MJPEG:
+       case UVC_VS_FORMAT_DV:
+       case UVC_VS_FORMAT_FRAME_BASED:
+       {
+               const struct uvc_format_desc *fmtdesc;
+
+               if (buflen < 6)
+                       return false;
+               fmtdesc = uvc_format_by_guid(&buffer[5]);
+               if (!fmtdesc)
+                       return false;
+               return true;
+       }
+       default:
+               break;
+       }
+
+       return false;
+}
+
 static int uvc_parse_streaming(struct uvc_device *dev,
        struct usb_interface *intf)
 {
@@ -613,19 +640,15 @@ static int uvc_parse_streaming(struct uvc_device *dev,

        /* Count the format and frame descriptors. */
        while (_buflen > 2 && _buffer[1] == USB_DT_CS_INTERFACE) {
-               switch (_buffer[2]) {
-               case UVC_VS_FORMAT_UNCOMPRESSED:
-               case UVC_VS_FORMAT_MJPEG:
-               case UVC_VS_FORMAT_FRAME_BASED:
+               if (is_valid_format(_buffer, _buflen))
                        nformats++;
-                       break;

+               switch (_buffer[2]) {
                case UVC_VS_FORMAT_DV:
                        /*
                         * DV format has no frame descriptor. We will create a
                         * dummy frame descriptor with a dummy frame interval.
                         */
-                       nformats++;
                        nframes++;
                        nintervals++;
                        break;
@@ -679,11 +702,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,

        /* Parse the format descriptors. */
        while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
-               switch (buffer[2]) {
-               case UVC_VS_FORMAT_UNCOMPRESSED:
-               case UVC_VS_FORMAT_MJPEG:
-               case UVC_VS_FORMAT_DV:
-               case UVC_VS_FORMAT_FRAME_BASED:
+               if (!is_valid_format(buffer, buflen)) {
                        format->frame = frame;
                        ret = uvc_parse_format(dev, streaming, format,
                                &interval, buffer, buflen);
@@ -692,13 +711,6 @@ static int uvc_parse_streaming(struct uvc_device *dev,

                        frame += format->nframes;
                        format++;
-
-                       buflen -= ret;
-                       buffer += ret;
-                       continue;
-
-               default:
-                       break;
                }

                buflen -= buffer[0];


>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index d966d003632b..cc6608eb3ab9 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -679,7 +679,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         interval = (u32 *)&frame[nframes];
>
>         streaming->formats = format;
> -       streaming->nformats = nformats;
> +       streaming->nformats = 0;
>
>         /* Parse the format descriptors. */
>         while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
> @@ -695,6 +695,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>                         if (!ret)
>                                 break;
>
> +                       streaming->nformats++;
>                         frame += format->nframes;
>                         format++;
>
> What do you think ? I can submit a v2 with this change.
>
> > >                         if (ret < 0)
> > >                                 goto error;
> > > +                       if (!ret)
> > > +                               break;
> > >
> > >                         frame += format->nframes;
> > >                         format++;
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda
