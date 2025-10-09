Return-Path: <linux-media+bounces-44064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C7BC859A
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 11:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB87F3E6906
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 09:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05DF2D73B1;
	Thu,  9 Oct 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnI724k1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920AB241CB7
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760003068; cv=none; b=h8Csu2iSim1wE1wlRQAGuV7DYx8QSOkGtSjKac3wuMQpN70xTb7bfZjRs9uTfQF6LZckxdQF4/wcj/uGjkJ/ZKrdzpMipGKPaJf6j+bZllioda2bAC7g3w9sGzF83XLx7oRSkcftK6kx3aYjircwb2d16YPRHcQTf+pwaAB3peg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760003068; c=relaxed/simple;
	bh=j9xXgkz3eSzq6xH/m7RR6G4rzSPqJOwfgqhzpTojWss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bx9cWmoawZRT/hQk6Qo504Kt2Zg8tAD3wMHMvKS4nlFX6cRb0OH6l9rnSNXir6snAmEsEPAn8jK2OJdcJQ+KSK5LuGsopOduqjNoDIxqrhJDXo/2NspGfS8jeENQfe5kQN/E8qlcONDQ05s9176lQE+f7DwdvTN3EI1gho8/tOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnI724k1; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-85b94fe19e2so76062785a.3
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 02:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760003065; x=1760607865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEaWJhyR+1Cxh6kukvq93ERE1E/OW+n2Fk6Q0lZRTbs=;
        b=jnI724k1QjMgsWAI1YJPvHJiGwm5BQxH5G61rgH3hk63WDaivv9jkhJkziV5I2dnCD
         1+H+iJ/sK1Mw5QLfQFhPaRqJ3YpYnmZas/C0kR3fakCAeELFdLatMfO6x8hdFHdxvhQ4
         UJzqpw1aHPGHKXOiGDvEYrx6LXrO7tcfsh1GrnKwwdwvWAuDBDHAjgzV5UtB56tDgidP
         LVrDg3eEN/puzjyaUJE7gup5cUH6CA0odHZTwnnxGwbz9IMt5jdt2jNBciRM9txT/3I6
         8uQkSIZfbw0t6QdPAnBhdmF548TQDk29JPp+ap2p3sZeKW1+0wEust4dNoAqHd65CIpP
         aNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760003065; x=1760607865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEaWJhyR+1Cxh6kukvq93ERE1E/OW+n2Fk6Q0lZRTbs=;
        b=ERM0Pj2w9bso14VARwfacct09iPBYtUQHJEi4j2hcKLWw2inGlsbv85BOVbi4+BWNJ
         6JPRW77ZY672+CTX9EoxL8JxQiiEbIkBj0bzvzi1bvZi/nGi0dohraW+eYF50d+pM1Ta
         lLKUHJKab7HNqAwpIlWWiFGPObIw5bDiFitxm2TNFVRPLECgJru56D7eadxnIFq/VIBz
         sjfmy6wCnnhmJ9xkQu2w19WOpHE4BSnhH2tpdKb/HHS4j+WmptC4mj8huansmKi8m6bz
         Wpi/YbvgG/35JGlY0asGmAuWHT5g6ilhW42XBMaKCaThp1Xofmvazw7rkqJwpJ5iAae+
         naLw==
X-Forwarded-Encrypted: i=1; AJvYcCXzH4LZZ513XzMZt8xs7maZ2B+P/sdC9TWtDRD4/+XRNi2/eeoYRQ5pLF/M22C+knx8LYU2OCZSPNMqZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfZ6q3qJjJ69i3yAL5w82ykmR4s3ZG1QKRgx5fj+h3SwB3u3Bg
	WBpvkxbAr5/0lhW0IdS9G72Wr0ry/Abpv+un/OQbV41zBWdzttekvOhsO/Qruh7Hd73v3EvjbDY
	NbudVEUPxqXoeNsvubg+1fc1rDBnMwxg=
X-Gm-Gg: ASbGncvOCMWGywy/nXNbpFPTvvjLFw78JjnS7kVyrnU7fXj0DqY/g8lcoWemZznRKtH
	v0Qp/zgp1nWKU6AoJ5T1XcXuci+GDzb5wyQh5gIkxdlwGVC35kD8JUzO+mn4X4FGvRIonxvd0eU
	7fbtz+n1+sU4FhD91zr10Ii81fpY5qOgxiXLJy3tHkcP2sV33If2CVNiFsLKUaIrvh91tapFWTO
	qKRetOGapWl9eXdZZhC8qFpENXS5iI=
X-Google-Smtp-Source: AGHT+IH18YpjeOcVzvk5vowSR7Zvpw+W1qi0Pf8gbT4Wy6+KNAT4Tb2bKRlRmnXvh4+wttKxPzQbf1eBer78a1HUVGA=
X-Received: by 2002:a05:620a:372c:b0:87c:a34c:a621 with SMTP id
 af79cd13be357-88352d96fffmr873485385a.85.1760003065317; Thu, 09 Oct 2025
 02:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>
 <CANiDSCst6-1g2vPSF4YnEbH6DFcz+WYEwGHc08kGyuH4OZ+adA@mail.gmail.com>
 <CAOzBiVv2yzmawqLk-womOJFpx_dAWW9z6EmSqxADyVOPHTaymw@mail.gmail.com> <20251009092926.GC29493@pendragon.ideasonboard.com>
In-Reply-To: <20251009092926.GC29493@pendragon.ideasonboard.com>
From: Angel4005 <ooara1337@gmail.com>
Date: Thu, 9 Oct 2025 12:44:14 +0300
X-Gm-Features: AS18NWDJQTCfU_b0oDFAT_aaO81nfGbXF6ofMB3E8EjEywwyL5I0alvCqH7YKPw
Message-ID: <CAOzBiVspo5fsWpPL930TDDXzQCnv45BvuzQUQ7kv2WY9Td+ibQ@mail.gmail.com>
Subject: Re: [REGRESSION] uvcvideo: Grandstream GUV3100 (2bab:0011) broken on
 recent kernels (including LTS)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, 
	linux-uvc-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My Grandstream GUV3100 camera is easy to buy. It is not a rare or
exclusive camera. It can be purchased from about 30 local online
stores in my country.

=D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 12:29=
 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 09, 2025 at 12:22:57PM +0300, Angel4005 wrote:
> > Hello,
> >
> > Thank you very much for your quick and helpful responses!
> >
> > I confirm that the problem seems to be related to duplicate IDs in the
> > descriptor of my Grandstream GUV3100 device.
> >
> > Unfortunately, I was unable to test the proposed patch, as kernel
> > building is beyond my current capabilities. I am not experienced in
> > such matters and do not want to risk the stability of my system.
> >
> > The exact breaking point when the camera stopped working was found:
> >
> > * Last known WORKING kernel (GOOD): 6.12.50-1-lts
> > * First known NON-WORKING kernel (BAD): 6.12.51-1-lts
> >
> > I hope this information will help pinpoint the commit that caused the
> > regression.
>
> We know which commit caused the regrassion, but it's hard to fix the
> issue properly without being able to test on the device. That's why
> Ricardo asked if the camera can be easily bought from somewhere.
>
> > Thank you very much for your help, guidance, and understanding!
> >
> > =D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 0=
9:55 Ricardo Ribalda <ribalda@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Hi Angel
> > >
> > > Thank you very much for the detailed report.
> > >
> > > Your device has two entities with the same id:
> > > VideoControl Interface Descriptor:
> > >         bLength                31
> > >         bDescriptorType        36
> > >         bDescriptorSubtype      6 (EXTENSION_UNIT)
> > >         bUnitID                 4
> > >
> > >
> > > ideoControl Interface Descriptor:
> > >         bLength                 9
> > >         bDescriptorType        36
> > >         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> > >         bTerminalID             4
> > >         wTerminalType      0x0101 USB Streaming
> > >         bAssocTerminal          0
> > >         bSourceID               3
> > >         iTerminal               0
> > >
> > > And that confuses the code. We have recently introduced a change that
> > > has probably triggered the regression
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/drivers/media/usb/uvc?id=3D0e2ee70291e64a30fe36960c85294726d34a103e
> > >
> > > Do you know the commercial name of the device and if it is available =
to buy?
> > >
> > > Could you try this patch and let me know if it fixes the issue?
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > > b/drivers/media/usb/uvc/uvc_driver.c
> > > index fa61f1d0ea2c..81937501fb0c 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -167,11 +167,23 @@ static struct uvc_entity
> > > *uvc_entity_by_reference(struct uvc_device *dev,
> > >
> > >  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev=
, int id)
> > >  {
> > > -       struct uvc_streaming *stream;
> > > +       struct uvc_streaming *stream, *last_entry;
> > > +       unsigned int count =3D 0;
> > >
> > >         list_for_each_entry(stream, &dev->streams, list) {
> > >                 if (stream->header.bTerminalLink =3D=3D id)
> > >                         return stream;
> > > +               count +=3D 1;
> > > +               last_entry =3D stream;
> > > +       }
> > > +
> > > +       /*
> > > +        * If the streaming entity has an invalid id, but it is the o=
nly
> > > +        * one available, use it.
> > > +        */
> > > +       if (count =3D=3D 1 && id =3D=3D UVC_INVALID_ENTITY_ID) {
> > > +               dev_err(&dev->intf->dev, "Heuristics triggered\n");
> > > +               return last_entry;
> > >         }
> > >
> > >         return NULL;
>
> --
> Regards,
>
> Laurent Pinchart

