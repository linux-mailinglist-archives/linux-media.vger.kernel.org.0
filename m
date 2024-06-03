Return-Path: <linux-media+bounces-12467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C54448D8408
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2850E28E417
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 13:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C759B12D75C;
	Mon,  3 Jun 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lGqCruZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70A415C3
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421665; cv=none; b=SsJNY6IyssRSCtKkVu4/qrVlVmZxOL2xHLjRkwTd/z5ehM7MXK7hIb7vJJs9uJM81DF2NjL2YUgkZ+APD7Tu5751Yo4Apuqf2MwIo0x+2seu9q1FAJ8m4bi6OolAuSYLY90Smbo3VSzfeHuDvMTaYCqBngfSWrnHHbUZv9aWDH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421665; c=relaxed/simple;
	bh=971v2fsqgIf4fy+Ft3PL2BUEI2aahIJeXykzQyEbSOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Gsr6PR992C1s5EzQPv0YPCEx2B5/lfGHnAOb0UzSoMi2zzGYwBXq7G7EPCtAQpU5jIFWfUPB4iLbRawAY5Lly002yonXZ8Gz+m7Qq47Vsr/BsMQAOHUcYhIl5EP2PMHhVXha73AV/533aUwg4hM3jBwUKu9XAWhODtJ7NE9itYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lGqCruZ5; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-794ab181ff7so289875685a.2
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2024 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717421662; x=1718026462; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzer1sQCYH/P6/rHuP58O/PfGpP6dQVdWkRnt0N4CYk=;
        b=lGqCruZ5dxBI1Cv/qxPG3pqjtBpVr/hX/IP+/e59lsLukOnw2VZTqCROVEmh2Bgsnt
         lWifo7hMlcWksH13hBW3miiGj31Y1dgQ/iB8REWPCAeZ0otOHoumfhF+BEMHZmHEa4/f
         FL0wt3NhaUKD55KesRKdlvCmp2aybC3Sq1PYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421662; x=1718026462;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzer1sQCYH/P6/rHuP58O/PfGpP6dQVdWkRnt0N4CYk=;
        b=jI1sh92fBm+bpPTg2T0YwYLBXRYeEEtyICTbeoS4PVKBv8rAl+x2rN8wSCAe/mrGYh
         EXy3n9XGvpxhDcW6fYDcXZo4NFKZ6pF7xGFoMXSxSuVNg2NtK/cK4ba39atXFW8cMxPz
         SmpdYf4pmUIm+jDxu/VApGDIrc72qLGls7Hg5vLHj8JifZQyh3MIKqOV1PnpbWCxcrhc
         Uwn/O9RUM1+rD7IH55irJPJnhOk/CwXFSRX/+lL6Vp4QkADxw9xbc9cRDvbhD5hvUbyI
         czSkHTJ4Q5LN9ttPgikjFrN/kDyCkIIdiPhlPFrNUoyLKjuRGt/omwjGxF14faJbTc7p
         LwVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7H5gQAHXpexxOWIDwTkfa73THQHkMjvgSlDVKCtlwq5wOpbO6A3KnV40EY0XKYYcLhsjFASZPdq5Ljhe5BocqZre/9w8aBtm8Fm0=
X-Gm-Message-State: AOJu0Yz0Gm59UoAm8iPRlNOxfSdNrHwsoJ+T0/kXYX14U+uY8WjBlyVU
	xlgithS62u3RRDpZiM+nNKvNJCpvvlX/4/9+Oy2Sc9Est5oRgbRKHJKXGszwDBmg38bQu9Cecwj
	nAQ==
X-Google-Smtp-Source: AGHT+IEwSziJOVYH4JnKtfDwq7CLglvIq1OZP/K3CtNqzH0l5bEXRugmvqZoK/E7Pv+n9ea1AXQK1Q==
X-Received: by 2002:a05:6214:4611:b0:6a0:c962:a2be with SMTP id 6a1803df08f44-6aecd6c85c7mr131582016d6.39.1717421662199;
        Mon, 03 Jun 2024 06:34:22 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6afb9a067c3sm13029706d6.77.2024.06.03.06.34.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 06:34:21 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6af5b9137a9so8104036d6.1
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2024 06:34:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWv2TCOUC32k38giPOkOJIzuKUTdQLDCy56sx9JlKTBYF9xsdCtckNYPV8uq9x+9UHqmRAtkqm8ylwAWaW8nXRXvKHhirdGXMJK8so=
X-Received: by 2002:a05:6214:4611:b0:6a0:c962:a2be with SMTP id
 6a1803df08f44-6aecd6c85c7mr131581246d6.39.1717421661034; Mon, 03 Jun 2024
 06:34:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425132334.18546-2-localevil3@gmail.com> <CANiDSCv89CcxMW=fA2LBR-qgZmhOcO4J--go6wsCMbGsN+Zf0A@mail.gmail.com>
 <e6f15a58-085c-4969-a035-16510006d0b6@gmail.com>
In-Reply-To: <e6f15a58-085c-4969-a035-16510006d0b6@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 3 Jun 2024 15:34:04 +0200
X-Gmail-Original-Message-ID: <CANiDSCtDBSb5_rcR4bb_KUiOyQAGD3Jjxu=jnxxMVbzjOTqehQ@mail.gmail.com>
Message-ID: <CANiDSCtDBSb5_rcR4bb_KUiOyQAGD3Jjxu=jnxxMVbzjOTqehQ@mail.gmail.com>
Subject: Re: [PATCH] Add "Quanta ACER HD User Facing" devices.
To: =?UTF-8?B?0JjQu9GM0Y/RgSDQrdGA0LXQtNC20LXQv9C+0LI=?= <localevil3@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi =D0=98=D0=BB=D1=8C=D1=8F=D1=81

On Wed, 29 May 2024 at 23:05, =D0=98=D0=BB=D1=8C=D1=8F=D1=81 =D0=AD=D1=80=
=D0=B5=D0=B4=D0=B6=D0=B5=D0=BF=D0=BE=D0=B2 <localevil3@gmail.com> wrote:
>
> Hi Ricardo
>
> I thought he was on the list of people who should see this patch.

Adding him as CC: ot To: should be enough.

Signed-off-by: means that the person has reviewed and approved the
patch, it can only be added by the actual person who did the review

>
> I asked Laurent how to send a patch correctly.
>
> Do I need to send a new letter that is signed only by me?

Yes please, and I think that you should only add 0x4033, there is a
patch already under review for 0x4035.
https://lore.kernel.org/linux-media/20230115205210.20077-1-laurent.pinchart=
@ideasonboard.com/


When you send the patch, please add the output of lsusb -v of the device.

Thanks!


>
> On 5/29/24 14:08, Ricardo Ribalda wrote:
> > Hi Ilyas
> >
> > On Thu, 25 Apr 2024 at 15:27, Ilyas Erezhepov <localevil3@gmail.com> wr=
ote:
> >> This patch adds two built-in video cameras for Acer laptops.
> >>
> >> Signed-off-by: Ilyas Erezhepov <localevil3@gmail.com>
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > May I ask where Laurent reviewed the patch?
> >
> > I am trying to find it in linux-media and I am not able to find it
> >
> >
> >> ---
> >>   drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++++++
> >>   1 file changed, 23 insertions(+)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uv=
c/uvc_driver.c
> >> index 08fcd2ffa727..502c03b6dabe 100644
> >> --- a/drivers/media/usb/uvc/uvc_driver.c
> >> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >> @@ -2454,6 +2454,29 @@ static const struct usb_device_id uvc_ids[] =3D=
 {
> >>            .bInterfaceSubClass   =3D 1,
> >>            .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
> >>            .driver_info          =3D (kernel_ulong_t)&uvc_ctrl_power_l=
ine_limited },
> >> +       /* Quanta ACER HD User Facing  0x4035 */
> >> +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> >> +         .idVendor             =3D 0x0408,
> >> +         .idProduct            =3D 0x4035,
> >> +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> >> +         .bInterfaceSubClass   =3D 1,
> >> +         .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
> >> +         .driver_info          =3D (kernel_ulong_t) &(const struct uv=
c_device_info ) {
> >> +               .uvc_version =3D 0x010a,
> >> +         }
> >> +       },
> >> +       /* Quanta ACER HD User Facing 4033 */
> >> +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> >> +         .idVendor             =3D 0x0408,
> >> +         .idProduct            =3D 0x4033,
> >> +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> >> +         .bInterfaceSubClass   =3D 1,
> >> +         .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
> >> +         .driver_info          =3D (kernel_ulong_t) &(const struct uv=
c_device_info ) {
> >> +               .uvc_version =3D 0x010a, }
> >> +       },
> >>          /* LogiLink Wireless Webcam */
> >>          { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >>                                  | USB_DEVICE_ID_MATCH_INT_INFO,
> >> --
> >> 2.44.0
> >>
> >>
> >



--=20
Ricardo Ribalda

