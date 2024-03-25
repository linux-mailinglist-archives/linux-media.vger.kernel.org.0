Return-Path: <linux-media+bounces-7758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBFD88A8BB
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68C211FA06FD
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 16:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B7412B14D;
	Mon, 25 Mar 2024 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SGYFccrp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D435745E1
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376003; cv=none; b=oZIaXN9VNgd+5dX/QKSZe0aZocRSVHyGZZNCaOewAh1n96TSIfT8YXVZ2ms8v2YY+uZbLJPpwn2v6VVOsQhUnh5LkDIe9EtB4fToyDZnrJTJOUV1OP1Zh3+HubX6QQFV8nwmaGfFQD+ApK8kM/wE4UAH0kSckSKVu+DlSFB7vmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376003; c=relaxed/simple;
	bh=glAvtWW4x6uWkQgOynyaLO0XCJ5Wt8dqjtHIjr8nwUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixzH5kz39x/FG5bqbsdIYyrjvEpLB8Lk+t3I7S7irwzbg5Ag1EDa9VQKKi1YWwh+DIUpdh00hZtUndHjdCnDWzYpXeVZ8hEpaCkSNfbzx2dMpv8cx2AdsTcKa2BvUKTcL5t0HO4aqfaOPCUALPVc5WkVkoqsfxoiL9KrmwraTHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SGYFccrp; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e6d089f603so911960a34.1
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376001; x=1711980801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6LSkWu1zEpya3hK2FUeUI36TyXKSztZPzjsG0MOd64=;
        b=SGYFccrpa1o4XcN7YX4OI2XbYEX4LrdvMb6ajkUyTQ+KoWmhncGMIIUCOmarvSxP68
         +ihM7Z5ZSbVS5BYrs957ZrYfyFimthAVnPfEFplp1nuP7vMxMJnwFPLPVv3OYxxUAC/L
         V+v0ek1HgbzZKQGhb7mtq0EUcoUSphFRs08iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376001; x=1711980801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6LSkWu1zEpya3hK2FUeUI36TyXKSztZPzjsG0MOd64=;
        b=ZK5ypoNOflrEub1UKpjlBTP7tFHLz10P7ll9xnqg8P6EizlvPilR15aXeSn9YR1PxZ
         SS40QOwXEuDg5cttGMmIDxa7707YyEBZd7fgTYr/vqBVb9f6NIV0kjxr8RKxbUrI+nnX
         umpvqsPOf98rp5W69h7nkFllX91MLjKbXNRKz3ntsN5MwNV1m+TXsx00ijr6UpQKoQCv
         +s4jOfjIyZ8YQmKWf7mObWZkpUHTeGkGYmauAT5JGnB9K6sqg21+xcMv3X7wq84us3ed
         ShkIF8eYpw0BlQZHVdTit/ZJXxS9O/uQsF8/Q2ikY9hovD90lKr1g56yXeATf4eRn1a5
         bfpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeT/SqR7Hnrq+diri8Z7OjXFdC6VU/5+K+DpzfGQi2jXy9mQgoDQIyYAZSPoQrws6jgdp9yoOno8/BxT1ye6gX0B3SWGir9cXiD2E=
X-Gm-Message-State: AOJu0YwJRswswelwbl1YEKJ0EiHSgEpav1qTyNQYZSM3Eoj+7xFoaH1x
	/oITpbBibYWXGOYfZ9dACXFzkERzXbGGRUeFd0K1KZ6zMzoZNqf1FPeygcXnpevdcwvH9OJwGez
	WLg==
X-Google-Smtp-Source: AGHT+IF32buUre6ENtGCSXXEAr7QDlIdIBteHp7TWr2u1kPlp8rTgKvU3v44Pva2UtoJVojhxxOvBQ==
X-Received: by 2002:a05:6830:329a:b0:6e6:a3e0:5c54 with SMTP id m26-20020a056830329a00b006e6a3e05c54mr8120449ott.27.1711376001007;
        Mon, 25 Mar 2024 07:13:21 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id z20-20020a05683020d400b006e66e9ac835sm1141289otq.2.2024.03.25.07.13.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:13:20 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e6e3eadec8so10792a34.0
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 07:13:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUjfLS7ucBmPXbNvt7oYjQJyBkjpJcbjJDS7aZ4026tCx6lLff38ICqVLL5A1SSliB0VNm4W7n56uP/xBnUqxdZd6Jgfsf9EHFkDQ=
X-Received: by 2002:a05:6830:4426:b0:6e6:e19e:3f1 with SMTP id
 q38-20020a056830442600b006e6e19e03f1mr1089961otv.35.1711375999889; Mon, 25
 Mar 2024 07:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <12403186.O9o76ZdvQC@natalenko.name> <CANiDSCuma7aGxq7T2uYMgn_JEW223LdR4as83UT2Aj3QmVu4ig@mail.gmail.com>
 <5764213.DvuYhMxLoT@natalenko.name>
In-Reply-To: <5764213.DvuYhMxLoT@natalenko.name>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 15:13:03 +0100
X-Gmail-Original-Message-ID: <CANiDSCvAY8wYZi6QTrjq_ehu4qsHCrq_dTqZQV2=KUCuP+aZYg@mail.gmail.com>
Message-ID: <CANiDSCvAY8wYZi6QTrjq_ehu4qsHCrq_dTqZQV2=KUCuP+aZYg@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] media: uvcvideo: Quirk for invalid dev_sof in
 Logitech C922
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr

That looks good :) !

On Mon, 25 Mar 2024 at 13:51, Oleksandr Natalenko
<oleksandr@natalenko.name> wrote:
>
> On pond=C4=9Bl=C3=AD 25. b=C5=99ezna 2024 10:25:51, CET Ricardo Ribalda w=
rote:
> > Hi Oleksandr
> >
> > On Mon, 25 Mar 2024 at 10:23, Oleksandr Natalenko
> > <oleksandr@natalenko.name> wrote:
> > >
> > > Hello.
> > >
> > > On pond=C4=9Bl=C3=AD 25. b=C5=99ezna 2024 8:52:57, CET Ricardo Ribald=
a wrote:
> > > > Hi Oleksandr
> > > >
> > > > On Sat, 23 Mar 2024 at 13:16, Oleksandr Natalenko
> > > > <oleksandr@natalenko.name> wrote:
> > > >
> > > > >
> > > > > How do I check whether C920 (046d:082d) is affected too? I have g=
ot one, I can run tests on it as long as those will not blow the webcam up.
> > > > >
> > > > > Thanks.
> > > > >
> > > >
> > > > First of all you need to enable the hwtimestamps in the driver. You
> > > > could do that with
> > > >
> > > > ```
> > > > rmmod uvcvideo; modprobe uvcvideo hwtimestamps=3D1
> > > > ```
> > >
> > > ```
> > > $ cat /sys/module/uvcvideo/parameters/hwtimestamps
> > > 1
> > > ```
> > >
> > > > Then capture some frames with yavta
> > > > ```
> > > > yavta -c /dev/video0
> > > > ```
> > > >
> > > > After around 5 seconds all the frames should have a stable fps, the
> > > > fps is not stable then your camera is affected with this bug.
> > >
> > > ```
> > > $ ./yavta -c /dev/video1
> > > Device /dev/video1 opened.
> > > Device `HD Pro Webcam C920' on `usb-0000:0f:00.3-3.4' (driver 'uvcvid=
eo') supports video, capture, without mplanes.
> > > Video format: MJPEG (47504a4d) 1920x1080 (stride 0) field none buffer=
 size 4147200
> > > =E2=80=A6
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
> > > 168 (0) [-] none 168 200914 B 215.183707 215.347066 33.676 fps ts mon=
o/SoE
> > > 169 (1) [-] none 169 201141 B 215.271693 215.379066 11.365 fps ts mon=
o/SoE
> > > 170 (2) [-] none 170 201005 B 215.303449 215.415057 31.490 fps ts mon=
o/SoE
> > > 171 (3) [-] none 171 201195 B 215.335295 215.447062 31.401 fps ts mon=
o/SoE
> > > 172 (4) [-] none 172 200933 B 215.557731 215.479072 4.496 fps ts mono=
/SoE
> > > 173 (5) [-] none 173 200973 B 215.587033 215.515063 34.127 fps ts mon=
o/SoE
> > > 174 (6) [-] none 174 200698 B 215.616811 215.547063 33.582 fps ts mon=
o/SoE
> > > 175 (7) [-] none 175 201290 B 215.646196 215.579075 34.031 fps ts mon=
o/SoE
> > > 176 (0) [-] none 176 200807 B 215.675857 215.615073 33.714 fps ts mon=
o/SoE
> > > =E2=80=A6
> > > ```
> > >
> > > Does the above mean the webcam is affected?
> >
> > Looks like it.... could you try applying this patch and run with
> >
> > rmmod uvcvideo; modprobe uvcvideo hwtimestamps=3D1 quirks=3D0x4000
> >
> > to see if that fixes it for you?
>
> On top of v6.8, I've applied the whole v10, and also applied the followin=
g change instead of providing `quirks=3D`:

Could you send the patch to the ML, so Laurent can apply it on top of my se=
t?

You could add the result of the experiment to the commit message

With those changes

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks!

>
> ```
> commit 884a61751d979ee9974c08a71c72e88e73bdd87e
> Author: Oleksandr Natalenko <oleksandr@natalenko.name>
> Date:   Mon Mar 25 10:28:00 2024 +0100
>
>     media: uvcvideo: Quirk for invalid dev_sof in Logitech C920
>
>     Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 723e6d5680c2e..444d7089885ea 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2573,7 +2573,8 @@ static const struct usb_device_id uvc_ids[] =3D {
>           .bInterfaceClass      =3D USB_CLASS_VIDEO,
>           .bInterfaceSubClass   =3D 1,
>           .bInterfaceProtocol   =3D 0,
> -         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRL=
S_ON_INIT) },
> +         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRL=
S_ON_INIT
> +                                              | UVC_QUIRK_INVALID_DEVICE=
_SOF) },
>         /* Logitech HD Pro Webcam C922 */
>         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>
> ```
>
> Now I see this:
>
> ```
> 154 (2) [-] none 154 192417 B 42.199823 42.207788 27.779 fps ts mono/SoE
> 155 (3) [-] none 155 192040 B 42.231834 42.239791 31.239 fps ts mono/SoE
> 156 (4) [-] none 156 192213 B 42.263823 42.271822 31.261 fps ts mono/SoE
> 157 (5) [-] none 157 191981 B 42.299824 42.303827 27.777 fps ts mono/SoE
> 158 (6) [-] none 158 191953 B 42.331835 42.339811 31.239 fps ts mono/SoE
> 159 (7) [-] none 159 191904 B 42.363824 42.371813 31.261 fps ts mono/SoE
> 160 (0) [-] none 160 192210 B 42.399834 42.407801 27.770 fps ts mono/SoE
> 161 (1) [-] none 161 192235 B 42.431824 42.439806 31.260 fps ts mono/SoE
> ```
>
> without dips in FPS.
>
> What do you think?
>
> >
> > Thanks!
> >
> > >
> > > Thank you.
> > >
> > > >
> > > >
> > > > Thanks!
> > > >
> > >
> > >
> > > --
> > > Oleksandr Natalenko (post-factum)
> >
> >
> >
> >
>
>
> --
> Oleksandr Natalenko (post-factum)



--=20
Ricardo Ribalda

