Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4DA62F0AA
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 10:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241791AbiKRJMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 04:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241820AbiKRJMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 04:12:24 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE858C0A1
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 01:12:18 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id y6so3374485iof.9
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 01:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NLsExkTQRD/KnCK+VgZa80ipWuwDokxoxfdxECYJsw=;
        b=k514VFb7op0zkhFildJQXj/PR0qQCyUXaviqec2rGZ5m3ibzB77sNI+6k94AvMal+m
         2DF5idsx4KJsOfJX4q5eFZNYLCuZRb6JKJhEMJhKdS8qSdPGkpOPpml/iOoWzowfs99/
         oeQR99VlpUPuof25iTCBQV+ogXZmS1t/HVUCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NLsExkTQRD/KnCK+VgZa80ipWuwDokxoxfdxECYJsw=;
        b=tdPYfXp76AERz/3tgQRY0T0iuFXGoRZ1E6qRDEhxswixQOrfNbywl+Quv9bOVUQ2nx
         PepZUWG/2XV6NCFgcGcj2VajmU67IjsAasMXup5scCeBF35pMdliyr+mgh4Y3wSUIqmw
         +YIP4RSLvKdyTuvgGalyqoOdwhE8+JLOvJiW6Hd+0E6hMgV0eCZXZRxWEHw3BJN5MHzi
         b929eXopMGYNLUNjhn0HB8by1MfRvGASvSwSXA2EQXPsqEUr9Ol8UtFoNsVd6jwC3KwK
         I2/Fu28fHQ1ZDzMEAKZDeSh8PmaumP+UjfgCzVgmuPHJM9Q+mAXzYWkcVNOr4UKw2acr
         Gt5Q==
X-Gm-Message-State: ANoB5pmzMuu7yC8WXK+grssOsGrMRBtHbIXgN31XKNRsiS3GSVK3FkFN
        AVSVRBBvClA7yxZuiLZhWCDwOokQEvh1WA==
X-Google-Smtp-Source: AA0mqf6kdoFTG6Ls+LwD7Zp630nTFzmjs8FHkLVIPDXYwuFxy5XJF7CseWLYFjO5LTVh7cf0ng/eOw==
X-Received: by 2002:a05:6638:3e13:b0:374:32e6:4b3c with SMTP id co19-20020a0566383e1300b0037432e64b3cmr2765523jab.197.1668762737544;
        Fri, 18 Nov 2022 01:12:17 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id y6-20020a92d0c6000000b0030258f9670bsm1102843ila.13.2022.11.18.01.12.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 01:12:16 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id r2so2235726ilg.8
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 01:12:16 -0800 (PST)
X-Received: by 2002:a05:6e02:c61:b0:300:f4ed:47f8 with SMTP id
 f1-20020a056e020c6100b00300f4ed47f8mr2831778ilj.243.1668762735853; Fri, 18
 Nov 2022 01:12:15 -0800 (PST)
MIME-Version: 1.0
References: <19g9yqb7lrp-19gb8o4mnli@nsmail6.0>
In-Reply-To: <19g9yqb7lrp-19gb8o4mnli@nsmail6.0>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 18 Nov 2022 10:12:05 +0100
X-Gmail-Original-Message-ID: <CANiDSCs2y6zOu09sxU60NX7se-N=wq3Z6USQz+XckQt7rC=3xg@mail.gmail.com>
Message-ID: <CANiDSCs2y6zOu09sxU60NX7se-N=wq3Z6USQz+XckQt7rC=3xg@mail.gmail.com>
Subject: Re: Re: [PATCH v3] media: uvcvideo: Fix bandwidth error for Alcor camera
To:     =?UTF-8?B?6Im+6LaF?= <aichao@kylinos.cn>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ai

On Fri, 18 Nov 2022 at 10:09, =E8=89=BE=E8=B6=85 <aichao@kylinos.cn> wrote:
>
> Hi Ricardo
>
>
> > 3072 is smaller than 0x1000.
> > It is ok to have values between 1024 and 0x1000 (4096) ?

Wouldn't it make more sense ?
  ctrl->dwMaxPayloadTransferSize =3D 0x1000;


The value 1000 seems a bit random, specially when your compare your
range with 4096
>
>
> Yes,  for some new device which requested 3072 B/frame bandwidth,  that t=
he camera preview normally.
>
>
>
>
> ----
>
>
>
>
>
>
> =E4=B8=BB=E3=80=80=E9=A2=98=EF=BC=9ARe: [PATCH v3] media: uvcvideo: Fix b=
andwidth error for Alcor camera
> =E6=97=A5=E3=80=80=E6=9C=9F=EF=BC=9A2022-11-18 16:15
> =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9Aribalda@chromium.org
> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A=E8=89=BE=E8=B6=85
>
>
> Hi Ai
>
> Thanks for your patch!
>
> On Fri, 18 Nov 2022 at 03:23, Ai Chao <aichao@kylinos.cn> wrote:
> >
> > For Alcor Corp. Slave camera(1b17:6684/2017:0011), it support to
> > output compressed video data, and it return a wrong
> > dwMaxPayloadTransferSize fields. This is a fireware issue,
> s/fireware/firmware/
> > but the manufacturer cannot provide a const return fields
> > by the fireware. For some device, device requested 2752512
> >  B/frame bandwidth. For some device, device requested 3072
> >  B/frame bandwidth. so we check the dwMaxPayloadTransferSize
> >  fields,if it large than 0x1000, reset dwMaxPayloadTransferSize
> > to 1024, and the camera preview normally.
>
> 3072 is smaller than 0x1000.
>
> It is ok to have values between 1024 and 0x1000 (4096) ?
>
> Thanks
>
> >
> > Signed-off-by: Ai Chao <aichao@kylinos.cn>
> >
> > ---
> > change for v3
> > - Add VID/PID 2017:0011
> >
> > change for v2
> > - Used usb_match_one_id to check VID and PID
> > ---
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/=
uvc_video.c
> > index d2eb9066e4dc..1260800ef8bd 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -135,6 +135,10 @@ static void uvc_fixup_video_ctrl(struct uvc_stream=
ing *stream,
> >         static const struct usb_device_id elgato_cam_link_4k =3D {
> >                 USB_DEVICE(0x0fd9, 0x0066)
> >         };
> > +       static const struct usb_device_id alcor_corp_slave_cam =3D {
> > +               USB_DEVICE(0x1b17, 0x6684),
> > +               USB_DEVICE(0x2017, 0x0011),
> > +       };
> >         struct uvc_format *format =3D NULL;
> >         struct uvc_frame *frame =3D NULL;
> >         unsigned int i;
> > @@ -234,6 +238,13 @@ static void uvc_fixup_video_ctrl(struct uvc_stream=
ing *stream,
> >
> >                 ctrl->dwMaxPayloadTransferSize =3D bandwidth;
> >         }
> > +
> > +       /* Alcor Corp. Slave camera return wrong dwMaxPayloadTransferSi=
ze */
> > +       if ((format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> > +           (ctrl->dwMaxPayloadTransferSize > 0x1000) &&
> > +            usb_match_one_id(stream->dev->intf, &alcor_corp_slave_cam)=
) {
> > +               ctrl->dwMaxPayloadTransferSize =3D 1024;
> > +       }
> >  }
> >
> >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > --
> > 2.25.1
> >
>
>
> --
> Ricardo Ribalda



--=20
Ricardo Ribalda
