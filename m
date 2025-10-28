Return-Path: <linux-media+bounces-45846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA4C15E10
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A10C342430E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE7728850C;
	Tue, 28 Oct 2025 16:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIFfoUe3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57279257852
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669270; cv=none; b=fkRzjIzZLXsb0FUvqLcHbIEygWuARpvjQz7/42vtP+HB0Nlt8Ntd843OrC9r3skwhGG839tSgJfxNFdPuBd+Se0w73puUjXIMrdKpfWjTMBf6taDpZIdvb9nrYjQ0hz6Vs6Ejp3q2sSben6ZebAerX3jK96f4GADR4pLksz6pu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669270; c=relaxed/simple;
	bh=nLZzVqWT6437i+lJrFUuAfOcJrVuFxvGMvdzSvdoTpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPgkYs3DwbJc12q6MYetf6Ja90bPtt73hpHZ0k3G+emWdxETzNY2h9xlVlq4qv+oJnH702GPJKaPHr3DRvBcBHhOQ5L5Vha8Er/RMqYMm8Lh86VAot7ogTfiYC2mGR1A0AajnIBQsVlElBidSE4LXhyr9KTABkL0NedrwuT0K/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIFfoUe3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-427007b1fe5so5204035f8f.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761669267; x=1762274067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLZzVqWT6437i+lJrFUuAfOcJrVuFxvGMvdzSvdoTpw=;
        b=MIFfoUe3YkNgZB/ItjGc9q3Q+rTHu71cy3EhjXaexpCr15d1VZ0wsibH/1iwZ2G2O1
         zWKVZMP28F23VPghgBBX1w3wJ7Ld2NHJU44cV2pU+ngFRuPzA7Ohcl0b0l6G/Vylf+eR
         XBEzHUyikG7VaI8eTXDrmbRaJGBW/Y6V7lpn22tLJgO3MsrvwZE6SBMuz6VGVvAEqtct
         fJYj++OKQMpKRue8PlWBopsQ4WICdlORRJ+rmdskbCo6zaGcjnJflyfdQ6V3ZmKhaUwX
         IHKUjLGz0PzvOtGyEqtKw2kKJdoxu57Pi1NBJzab9rUglJ3PwCJnoA5UTsfQsOaiEm6i
         7Q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761669267; x=1762274067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLZzVqWT6437i+lJrFUuAfOcJrVuFxvGMvdzSvdoTpw=;
        b=Zd/6BH3OT+ml0/4VCV88MxbLiI24VGfOVap5yWbb0JRCwMFzyCaKu/m8pEfZlZnJ7C
         zQQXAozEms3KoZzJ0svyKCrtBkNyl0qo+LlOPtADuN7gPVVLohmTqV++sUe1yM4pI9Yq
         lLx5oBANJsV/S3HsVhg8clXBG9ltP73WQBpeghpI6PREx+YNH5T8bNMMlSbHKpqzYXpv
         du3bFHWsNS9Aa/v1k+P0q+WYS+rF0f1edObbVcsDeymVTF4Q8IkYiMIjk6aloQDEWM3+
         R0nTRKkpP4ccmacnf6MOXTiVy44vqcQp8LRv+0IUfx96hVGyoRaQL6b5bvqa+F9LEh0H
         3g8g==
X-Forwarded-Encrypted: i=1; AJvYcCVNdSE/veTbugRkTxRSO2jC5Me/KO1WDMmwaETld9H3XF0Ldaeq2u8TxdKd9I2KEK9YmAdfeRK//+cAdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRK2W/Hdq6eFSNUkdE2/vZ3czEjJ2/JGGeVR2bs/4naLyfF6zU
	mF+7FqEDFHA4VwbDopL48ewubC1sUYHC9mlWEKIoml2bXsjqO5vVeuyUEt0G0Zfg56/QH2tbhAU
	N5Y7A6LGC6SbXG+2LAUQ6dUVAaXaPGM4=
X-Gm-Gg: ASbGnctOokDUtxPXHcdRDbu8DxtCTmoMjpnr94mIySESYEMYYf/RNEjjQd3HgPT3QqI
	xEZSLNDRvBJPdM3wjG8KQQR0gzX03CuDMKUvYzBeMPyUgiyMImuAMcUjRWTlLbDEDNyU9e3n324
	IJNf4iveO99wGuLA/NTehSV4PmfTmmTnj1vCH238gb5yrLBY1BSbmB2SU0LsCrFO5ZBjjc+82CG
	Kj9hrENXjhhyY+Tdhqu/IN+O3KNf2qrplwHW745LF8Tr8AaJsEGH/MUiuK91A==
X-Google-Smtp-Source: AGHT+IEX5I591QpXv8WTQPRJrzjSy/1s0cdBzyA4QwuuXgbqMKHbqocUwStacqp8C/ZXIRb1NGu5PNOX+zqArLn1ZQE=
X-Received: by 2002:a05:6000:290d:b0:429:974f:2293 with SMTP id
 ffacd0b85a97d-429a7e92b11mr3503317f8f.52.1761669266519; Tue, 28 Oct 2025
 09:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819120428.83437-1-clamor95@gmail.com> <aLB_7YS9HsfzfadI@kekkonen.localdomain>
 <CAPVz0n1mXvdyzshei8Mbw7KVYCkQjziBA95ton4MKXPnPd0kbQ@mail.gmail.com>
 <aQDuOSUYbuoLoFbf@kekkonen.localdomain> <aQDvzKMXhVlR2G3J@kekkonen.localdomain>
In-Reply-To: <aQDvzKMXhVlR2G3J@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 28 Oct 2025 18:34:15 +0200
X-Gm-Features: AWmQ_bnFGdWWBG17RWYmTg8zrcdshLMPtCGqnVmjwv2gZfkw3zNr1YgO_-hVcMw
Message-ID: <CAPVz0n3E08Ft1q5QS-aT8WUQNmTe5uOs=d2VHovNH1BbdQWVRQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] media: i2c: add Sony IMX111 CMOS camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 28 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 18:3=
1 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 28, 2025 at 06:24:25PM +0200, Sakari Ailus wrote:
> > Hi Svyatoslav,
> >
> > On Fri, Aug 29, 2025 at 09:20:10PM +0300, Svyatoslav Ryhel wrote:
> > > =D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=
=BE 19:12 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > >
> > > > Hi Svyatoslaw,
> > > >
> > > > On Tue, Aug 19, 2025 at 03:04:25PM +0300, Svyatoslav Ryhel wrote:
> > > > > Add driver for Sony IMX111 CMOS sensor found in LG Optimus 4X and=
 Vu
> > > > > smartphones.
> > > >
> > > > Thanks for the set.
> > > >
> > > > I wonder how would the sensor work with the CCS driver. The registe=
r layout
> > > > appears to be very much aligned with that (I haven't checked whethe=
r there
> > > > are MSRs that depend on the mode).
> > > >
> > >
> > > After deeper testing I have found that imx111 may be nokia,smia
> > > compatible, at least most of general registers and CCS logic is
> > > applicable. Some of registers may cause issues, for example,
> > > "phy_ctrl_capability" =3D 0, 0x0 and some insane pll ranges. Maybe th=
at
> > > can be addressed with a firmware patch idk. The trickiest part is tha=
t
> > > each mode requires non-standard and non-common manufacturer code
> > > (0x3xxx ranges). If you can explain how to address these issues, I
> > > would love to add imx111 and a few other modules into list of CCS
> > > supported devices.
> >
> > On a closer look, only the image size related configuration and a littl=
e
> > more appears to be CCS-like. That's not enough to configure the sensor;
> > this is conveyed in the MSR space which indeed makes the sensor difficu=
lt
> > to control using the CCS driver, unfortunately.
>
> Ok, the driver appears to be doing quite a bit of register writes outside
> the register lists, which is good, and what's there appears indeed largel=
y
> CCS compliant. The MSRs remain an issue; it'd take quite a bit of reverse
> engineering to figure out what the registers are and how to configure the=
m
> in a generic way. I think that's doable but I'm not sure it is justifiabl=
e
> considering the expected effort.
>

I have deciphered a lot already since downstream provides only
register writing sequences. Everything that left is 0x3xxx which seems
to refer a vendor region and it is not documented anywhere.

> --
> Sakari Ailus

