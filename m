Return-Path: <linux-media+bounces-23964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85C9F9C82
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 23:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5DDF16760F
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 22:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F49227565;
	Fri, 20 Dec 2024 22:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUVrP8ak"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AD71A840E;
	Fri, 20 Dec 2024 22:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734732046; cv=none; b=dj/Bd539JPsZThTgLKAajdQh6Xf9kCFZfHJc1YEl5dtxweXuB1/Z733kVGirjmRjDZV/tnC+tes1wWcVcatPpZ/K9j/kaJigDRGoAaejeyWugwg8v0+QXZBDygl/SFMXCHhWsQUovNSBCE0YuZb/Y4oEWiuCTrctwpdQRiixcr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734732046; c=relaxed/simple;
	bh=l+VkQkyF3IIP/DkDeyyk2LDIGDQYOMIoQmWdd9a7Cyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGGmX3bFBNoT1GBpqmJl7rmcnw6HRTZ8x+H87NgPMoxjS8cXKMPCVB1Y8CWWaDhBkJmTpFb6b28fLCI4v7eV80r+/zPrddwiDlAhPQD7hZJuhXQD56NjJokdNfGznZO5lEd76fepaE9KRr3J5KuWyYPqcQXFUoB1JNBQseXWtRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUVrP8ak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D43C4AF09;
	Fri, 20 Dec 2024 22:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734732045;
	bh=l+VkQkyF3IIP/DkDeyyk2LDIGDQYOMIoQmWdd9a7Cyo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sUVrP8akTvgHKS+vMzpOLca0Lw6fomgKVk1f4cWk6kzFobVksA3MnoOABwBqtVhKd
	 nOLa6eTZHsZh1Bc9QUlPWwHtcyupRJCwPDqlOCmSUkb0wE3Lsgq2qfSI9pKlVDrq0O
	 S+K8uTkDxYVy9tzUoXKnf+xVmjYHiOz74vRMjCENulsMUi3SRYGqOIVv2Ivi6R3CL6
	 cKL2zJei0Tz9JzrDhRY1uny+xEVjkHUUt+f8WJON9mYS4gSravN4cVTAAGjduMGtzg
	 tsMTgQ4U9imFdgXCGb07EYg1f9Ipzut1dO0ko1f+72w4ed/JZUJFADTelwoMYfP/k2
	 HWRk6VKNj5j8g==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ef4b6719d1so21314337b3.2;
        Fri, 20 Dec 2024 14:00:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhqyxhvXY/C5EqudG1J++wLlO/gnXcnrLARSiG/dYNWsH/IAdktS/p3Krrrmy64f8MF6VkmjIJUJXxFFw=@vger.kernel.org, AJvYcCWlCg7kmfN5hmlpULokLUI4435f75Xd0kM5/w+pXDit3IbRnihXRKg+u7pt6wdG86FCXyZw5WepxCdW@vger.kernel.org, AJvYcCWvHeiwi/drphMjfSKBmxvXTMmbj5xhAa29dZtkhhxds4qcFkBQbUUkqaYqlWK8zvJ1FDTL3AHTCiWC@vger.kernel.org, AJvYcCX7zEDnjZ9shOJMl0SxyePaCMbkfBh0r2XuZtMCM0lH9DKjeIjjYuBLo6JRQY3Rn13h9r58y9HyDvVjmErz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8/97r/v5EKZbR6VfJf7iR0DwmHVS0QkhFoGN00uUzzDpeetwD
	B1Ii9bnvGxs0ggM/YH87URmuA1kuzd04zx7eLtTTD7/sDjzkzKf7msm1fkEPaxxNklhxSylLhRa
	lnyZnfQ2dGpghudRk8X+Fzmb+Cw==
X-Google-Smtp-Source: AGHT+IHa9m2dBS1rVJp2vWGrKyHOr+BVmsYWGYuP9AqSkL4NyRF559gCdMbhGLGzsDAEHN6VWgZnPLmZGDvMEpaejOM=
X-Received: by 2002:a05:690c:6e8c:b0:6e7:e340:cd36 with SMTP id
 00721157ae682-6f3f824f97fmr37942517b3.40.1734732044884; Fri, 20 Dec 2024
 14:00:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
 <20241217145612.GA1652259-robh@kernel.org> <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
 <20241219122453.GA4008177-robh@kernel.org> <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
In-Reply-To: <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 20 Dec 2024 16:00:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLON5xKoYtowKdk49s-YHbk9bq9akZSH1kHdQ_9vxKSQQ@mail.gmail.com>
Message-ID: <CAL_JsqLON5xKoYtowKdk49s-YHbk9bq9akZSH1kHdQ_9vxKSQQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 6:42=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> On Thu, 19 Dec 2024 at 13:24, Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Dec 17, 2024 at 04:24:27PM +0100, Ricardo Ribalda wrote:
> > > Hi Rob
> > >
> > > On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> > > > > For some devices like cameras the system needs to know where they=
 are
> > > > > mounted.
> > > >
> > > > Why do you need this and why only this property and not the dozens
> > > > others ACPI has?
> > >
> > > Userspace needs that information to correctly show it in the UI. Eg;
> > >
> > > - User facing camera needs to be mirrored during preview.
> > > - The user facing camera is selected by default during videoconferenc=
es
> > > - The world facing camera is selected by default when taking a photo
> > > - User facing camera have different parameter defaults than world fac=
ing.
> >
> > We already have "orientation" defined for this purpose.
>
> Do you mean orientation from
> bindings/media/video-interface-devices.yaml ?
>
> I see a couple of issues:
> - Orientation has a very specific meaning for USB typeC. I'd prefer if
> we could avoid using that word.

Yes, but this is tied to the class of the device, not the bus. I find
defining the position for USB devices confusing.

> - For other applications different than cameras it might be useful to
> know the positions top, bottom, left, right, which are not available
> in video-interface-devices

Other devices may need some of the 20 other properties in the ACPI
table as well.

> - The value "external" does not makes too much sense for listed usb devic=
es

Then don't use it.

> - It makes our lives easier if dt and acpi have the same meaning (less
> conversion)

We have little to no input into what ACPI does. If we're just going to
copy ACPI, then just use ACPI instead.

> All that said, for my specific usecase, reusing orientation from
> bindings/media/video-interface-devices.yaml works... So if that is
> what you all prefer I can send a v2 with that.
> Let me know what you think

We already have something for cameras. Use it.

Rob

