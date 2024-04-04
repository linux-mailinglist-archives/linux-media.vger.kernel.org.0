Return-Path: <linux-media+bounces-8607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA1898189
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 08:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A45D287B91
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 06:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330282E630;
	Thu,  4 Apr 2024 06:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YmHMrmdb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E8918E20
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712212534; cv=none; b=cqZJbPdVe3YGSEzUpI7YIlMWpaazC7yKeDgAmkdwDgSQnuywV2IaTONG3JkzxpweaM5eKpVVlZFs+s7QenF91u39EfdfIZXFNEvwnR5KV5BnBw9ImBhJce4Hpr/KNXHKs7hdlesAhovvmT50J/Fe6GbA+Vz5TkKTRhkyGPLpI3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712212534; c=relaxed/simple;
	bh=H9b5JJlTquQKI2VM9qJwXhoYJq+49fLigdSgodwpAeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaZh4ZVfO3gZF+zLdVpSUgWYNq1LM4+UdHwkIC4micycYVhNc4ks+zBvJ4Ueq3sPxWik+aJeFCS1zjrKv5CxeshMWd4fdd1Wj3VrJ534iTYQ5U7Phg+ktv1AZw8ol6t32hzlMoBDnF+3Tanl3FFowgXdYG8vHTzXpuFh+G45LMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YmHMrmdb; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6991e317e05so15843786d6.1
        for <linux-media@vger.kernel.org>; Wed, 03 Apr 2024 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712212531; x=1712817331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUS+OYnFgkVlJtdzc5TCv6ib1nQIE7c9RlYNdnpE+8c=;
        b=YmHMrmdb/HpI98l08cx9jfydLZhZEXfHmWtGpHfoy0ULLv+GlAhMvqWPtHbh4kuEnT
         0iO2yp52VMshW5XSbkUAgPmaRWXC3q2bRE/EqUQZWf9x9QUPOThmrdeVPPIolxJmdoY1
         GLcdfztDO5jleCo0NPZSeaH82I34vbsUO4y+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712212531; x=1712817331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUS+OYnFgkVlJtdzc5TCv6ib1nQIE7c9RlYNdnpE+8c=;
        b=OVoo6Tdfa264E0vYmOPyi62I7JDQRG0zOpkg/PI8Rhg5Xk/57AKMlLZTRHvlteuQi5
         MFV6FTvcNl/Ul6rnLhxyPT6pyxJS4HB1SRs5yVS2JxbV+mttbS2eSu2D1KmZrtNmTib3
         KblT49pJIIYSxEQz5RL5p0nO/cyGkQ6+7czyptGzBWTsjniRjOAtASk424wHPrlWFfBR
         jAtDMNv5lU4M27EnVbQ95WMWphc7OIxshpOG7MXuXLZeDbye0PJH1YkQWDKTx+WuBAwM
         qbI8YDLP/AS7xIBZszMvsZ896McnBNRq7RKuFzgNMbH6jrScxAXWpnM0ZiSJG2KLMFzx
         bQDw==
X-Forwarded-Encrypted: i=1; AJvYcCUTP46pn5hnroSIDxXn/yslMsrZDTlSaPn5W9JlEhd69xdqOZQgUPz2TV9BDAdw5hQtbpQfLIw30kZUwosLcE7M2y0tOx9/4+nral0=
X-Gm-Message-State: AOJu0YwxJixQ+O5fs7e8nlTnBBqfd/QDdectjMUg8HTuYBdw0n5aXDZi
	/1iGsKgZnsIbo5Hv4UHQI8Yoigprm98NsZf73smoJ0w8PEEGtBEfgQplPZl44NyCI9Rjt4c7TDC
	4RoL/
X-Google-Smtp-Source: AGHT+IGr1MWyuBrOvNMgwe6GyJHr5Kto+z7NpdpbjsB1Eb1Om1Uf8W1S1iBReD7s0q6V1mJuY2w4dg==
X-Received: by 2002:a05:6214:2388:b0:692:494f:f0aa with SMTP id fw8-20020a056214238800b00692494ff0aamr2777336qvb.9.1712212531386;
        Wed, 03 Apr 2024 23:35:31 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id 6-20020a05621420a600b006990b44228dsm3516721qvd.125.2024.04.03.23.35.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 23:35:30 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6991e317e05so15843636d6.1
        for <linux-media@vger.kernel.org>; Wed, 03 Apr 2024 23:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURIP/QfmeeUFE5vNuhxVUgP6SKGUPLPIGOlxW+xuUxJZ+j41FfBs7UgWGV8CdYC/tnUmfPt5hKvin+gcgiEi4FzP50cFt+P2S2TtY=
X-Received: by 2002:a05:6214:1ccf:b0:691:67f9:16e7 with SMTP id
 g15-20020a0562141ccf00b0069167f916e7mr2530909qvd.24.1712212529833; Wed, 03
 Apr 2024 23:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325142611.15550-1-oleksandr@natalenko.name>
 <6046664.lOV4Wx5bFT@natalenko.name> <20240404011120.GH23803@pendragon.ideasonboard.com>
In-Reply-To: <20240404011120.GH23803@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 4 Apr 2024 08:35:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCu5-coAyJZeiL5q3cPOdJ9Xaf1oE3VP90Sj_EycGr_QRQ@mail.gmail.com>
Message-ID: <CANiDSCu5-coAyJZeiL5q3cPOdJ9Xaf1oE3VP90Sj_EycGr_QRQ@mail.gmail.com>
Subject: Re: [PATCH] media/uvcvideo: add quirk for invalid dev_sof in Logitech C920
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent

On Thu, 4 Apr 2024 at 03:11, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Oleksandr,
>
> On Mon, Apr 01, 2024 at 06:45:16PM +0200, Oleksandr Natalenko wrote:
> > On pond=C4=9Bl=C3=AD 25. b=C5=99ezna 2024 15:26:11, CEST Oleksandr Nata=
lenko wrote:
> > > Similarly to Logitech C922, C920 seems to also suffer from a firmware
> > > bug that breaks hardware timestamping.
> > >
> > > Add a quirk for this camera model too.
> > >
> > > Before applying the quirk:
> > >
> > > ```
> > > 100 (4) [-] none 100 200717 B 212.919114 213.079004 33.727 fps ts mon=
o/SoE
> > > 101 (5) [-] none 101 200889 B 213.003703 213.114996 11.822 fps ts mon=
o/SoE
> > > 102 (6) [-] none 102 200926 B 213.035571 213.146999 31.379 fps ts mon=
o/SoE
> > > 103 (7) [-] none 103 200839 B 213.067424 213.179003 31.394 fps ts mon=
o/SoE
> > > 104 (0) [-] none 104 200692 B 213.293180 213.214991 4.430 fps ts mono=
/SoE
> > > 105 (1) [-] none 105 200937 B 213.322374 213.247001 34.254 fps ts mon=
o/SoE
> > > 106 (2) [-] none 106 201013 B 213.352228 213.279005 33.496 fps ts mon=
o/SoE
> > > =E2=80=A6
> > > ```
> > >
> > > After applying the quirk:
> > >
> > > ```
> > > 154 (2) [-] none 154 192417 B 42.199823 42.207788 27.779 fps ts mono/=
SoE
> > > 155 (3) [-] none 155 192040 B 42.231834 42.239791 31.239 fps ts mono/=
SoE
> > > 156 (4) [-] none 156 192213 B 42.263823 42.271822 31.261 fps ts mono/=
SoE
> > > 157 (5) [-] none 157 191981 B 42.299824 42.303827 27.777 fps ts mono/=
SoE
> > > 158 (6) [-] none 158 191953 B 42.331835 42.339811 31.239 fps ts mono/=
SoE
> > > 159 (7) [-] none 159 191904 B 42.363824 42.371813 31.261 fps ts mono/=
SoE
> > > 160 (0) [-] none 160 192210 B 42.399834 42.407801 27.770 fps ts mono/=
SoE
> > > ```
> > >
> > > Link: https://lore.kernel.org/lkml/5764213.DvuYhMxLoT@natalenko.name/
> > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/u=
vc/uvc_driver.c
> > > index 723e6d5680c2e..444d7089885ea 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2573,7 +2573,8 @@ static const struct usb_device_id uvc_ids[] =3D=
 {
> > >       .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > >       .bInterfaceSubClass   =3D 1,
> > >       .bInterfaceProtocol   =3D 0,
> > > -     .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRL=
S_ON_INIT) },
> > > +     .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRL=
S_ON_INIT
> > > +                                          | UVC_QUIRK_INVALID_DEVICE=
_SOF) },
> > >     /* Logitech HD Pro Webcam C922 */
> > >     { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > >                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > >
> >
> > Gentle ping on this one.
>
> Ricardo, could you include this in the next version of your hw timestamp
> series ?

There are no outstanding comments on the series
https://patchwork.linuxtv.org/project/linux-media/list/?series=3D12485

Do you need me to send a v11 with this patch? or you can take that
directly from your tree?

Thanks!

>
> > Also, should I have added:
> >
> > Fixes: 5d0fd3c806b9 ("[media] uvcvideo: Disable hardware timestamps by =
default")
> >
> > ?
>
> I don't think that's needed, no.
>
> > (it's not that this change re-enables HW timestamping, but
> > 5d0fd3c806b9 explicitly mentions C920 as affected)
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda

