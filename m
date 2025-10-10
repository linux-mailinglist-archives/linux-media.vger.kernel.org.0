Return-Path: <linux-media+bounces-44182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366ABCDCA0
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 17:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9CAC3BBE49
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 15:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C202F90CE;
	Fri, 10 Oct 2025 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5tHERIN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D432F618B
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 15:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760109731; cv=none; b=YhNS+YwkPphb1SFz8jO61lhbOAdIamyR8x7mjOdKxXo4j+ETOtllA0rC07Y1/d2tDYWVyibaMGjjnTBlcQRH06/WCLyUrKM1hrLj1HpdaybGPlPhJ6olP3CqEMbKuBNeuUoYe70rqo46AZLffz4jZ87UDHOJmnsYul9NdHwOvbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760109731; c=relaxed/simple;
	bh=2PKdxMA1HganctX7RW/CB5o5Be6xSgi1KfvR5mJawfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUpPRZuVZBql3khrCSH4rSSMnhsBJBbSEBCaDmFbmnpbl3XQvvNYuEsPffTl/0D03gdwNVu3RSR+h7wVlwhcAlfwhSoE50EmmhK+bmJ/bRJpyXIw9kus8UO3z2id9l0IEVH4EhvmkjtZBlDg9nF8wy6QIJcmqoq4oicN7fV0q4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5tHERIN; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-7970e8d1cfeso28749546d6.1
        for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760109729; x=1760714529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBWojHDlaauN5nb0SQ3Tn1o+DkFRZqicGyLE19z7qRk=;
        b=g5tHERINTwFEHRpAI2mji4+ZruVFxvPY2dwES+QipdUcIUpaIUwKih0TIm6kcxIP5o
         xaADAScT8OqqjUQpifzKA+486rySyYLVaSxvMT3I/vtizluHSjzYa+jphjq4Roek7JV0
         Sl/xSQCQxE4NryfHKttUHSjpvtgrf6W4+c2czAXSyE/bDqlFEkmgnz3ktT01kbvrnhju
         8cCZkTPtDSJaTlTfZPUa8S0NNLoholzb37Cl2gPKAaAdEuPJDonetHr/84HeD4cFvlhG
         uCKnbz8KUEn7st7yAGpWiuGrrhJ+9oaygH8CZ67CM62o2nXuLhK7EZEyHV07i2nRAVF7
         DQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760109729; x=1760714529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBWojHDlaauN5nb0SQ3Tn1o+DkFRZqicGyLE19z7qRk=;
        b=hulge9mVLMCWup4iPo8yRd4/otYY1xa2ud24UnVe/6ir7jeT4YhpCWW0odMzknZbA0
         VHPtQl7aFpNykF8k+OjOxiIa3KiX5dSQLfSa4yQMSuLhrbas1xvYNsJHnNvwteADrMGC
         QJGJwEvIU5vX+qXwmtA0aq+atm4lk0uA74grxdjWEdItq4ofUpLrebGK+sO6eTF7QLsz
         MVE11k5hWJ0Ejxt4iGISOpQbZHR448YHi3Qb3lCcpk06mC1a3/9Qg8sGMfKTXH4npBrP
         fBxpMIzuwS/cmBABs3I84P71Fv61IIqPN4MMv2hViFtKJAO8agoc7OysqMpnu3Sypot+
         w9xg==
X-Gm-Message-State: AOJu0YxSTp2nSN63gVXcbALaqiI8AQFlAG+QhZnYQspkOpZ2JcsRelxp
	+zANxB1/0CL5ESsR7kjr1vDtwcv+FWvNZG+IoObiRT4loQNAWKxG4QA4Ln6mrlNErUDjLwTwV3b
	J83vMv3G3kj5ZYRBmWGKekA3IHbPjTEkDNeAKAJI=
X-Gm-Gg: ASbGncumWLLr/0zno5dnWR/8pGFHGxsCz1JZaB7VB0Jg/AUm4D9b+6saDq5T2hZicge
	1JlGXh5Fu37uZqi1oNWWkle4FYORv5k0upzRUvgjuiagWyiqzjJU38mm/As3CXBRr85oAZRPb6K
	pBI3crESonzFNuXg5c9UzQgszil8waQm7A6Kn3nL+/D0GhpI29+CxvbZAT6au4yMiwdvZPmV1hB
	v84DvLKEpO+j/qfHHXFBtllvEp0ZB2mOiFSFc+swVl+zC3L
X-Google-Smtp-Source: AGHT+IGAz0iQ5pDP+E16RxYq2nI2RkvXRrBQ9tsXrAj87aEPvRtJI6auIgKxu18x0WEDkdN4g6rjJAppnBG5H0ndmPw=
X-Received: by 2002:ac8:7757:0:b0:4e6:eabe:60f3 with SMTP id
 d75a77b69052e-4e6ead77147mr136575901cf.44.1760109728439; Fri, 10 Oct 2025
 08:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB-99LvD2cCmPt91Kh-1Zj69=_xczV6oUA7soAfFXQBcZxA+pQ@mail.gmail.com>
In-Reply-To: <CAB-99LvD2cCmPt91Kh-1Zj69=_xczV6oUA7soAfFXQBcZxA+pQ@mail.gmail.com>
From: Forest Crossman <cyrozap@gmail.com>
Date: Fri, 10 Oct 2025 10:22:00 -0500
X-Gm-Features: AS18NWCt8ca6-UfnI0GYk4ZMZgYfUPhRhwMxXyF2o-PHWS2h-UaXgyXBN28BjHs
Message-ID: <CAO3ALPx9FK=ayO8WWt7zguTfaA=e5q2wxUPc1ojpPFqFvstxBA@mail.gmail.com>
Subject: Re: Support for Mygica A681B (ATSC/QAM USB tuner)
To: Michael Goffioul <michael.goffioul@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 8:46=E2=80=AFPM Michael Goffioul
<michael.goffioul@gmail.com> wrote:
>
> Hi,
>
> I have a Mygica A681B USB tuner and I'm wondering whether there's any
> hope to have it supported by the Linux kernel. I've attached the lsusb
> output for the device at the end of this email.
>
> So far, I've downloaded the Linux driver from Geniatech web site. This
> is made for Ubuntu 20 and kernel 5.4. From what I can tell from the
> driver sources, the device 1f4d:692f seems to use a mxl692 frontend
> driver, but it uses a binary-only mxl692_fe.o module, without
> providing the source code for it. Kernel 6 includes its own mxl692
> driver, however it appears to use a different interface/API (and
> apparently also a firmware blob that does not look to be easy to
> find...).
>
> Any help or hint would be greatly appreciated.
>
> Michael.

Hi, Michael,

I've recently submitted some patches [1] to enable support for the
A681B and its more-compact USB-C sibling, the PT682C. The patches are
not yet ready for mainline (hence why I marked them "RFC"), but
they're good enough to get the hardware working and streaming TV from
over the air. If you're willing to patch your kernel, the patches
should get you up and running while you wait for support in mainline
or your distro's kernel.

Also, while the cover letter for the patch series contains a link to a
script I wrote to download and extract the firmware image from the
Windows driver, I recently learned that the firmware can simply be
downloaded directly from here [2].

I hope this helps!

Forest

[1]: https://lore.kernel.org/linux-media/20251001051534.925714-1-cyrozap@gm=
ail.com/T/
[2]: https://github.com/LibreELEC/dvb-firmware/blob/90261ae2934329f6ca84dd6=
c72d10d0777bf4b0e/firmware/dvb-demod-mxl692.fw


> =3D=3D=3D
>
> Bus 001 Device 008: ID 1f4d:692f G-Tek Electronics Group USB Stick
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0 [unknown]
>   bDeviceSubClass         0 [unknown]
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x1f4d G-Tek Electronics Group
>   idProduct          0x692f USB Stick
>   bcdDevice            8.00
>   iManufacturer           1 Gen
>   iProduct                2 USB Stick
>   iSerial                 3 2017.12.09
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x002e
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          4 Def
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              500mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           4
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      1 [unknown]
>       bInterfaceProtocol      1
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x86  EP 6 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass            0 [unknown]
>   bDeviceSubClass         0 [unknown]
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> Device Status:     0x0000
>   (Bus Powered)
>

