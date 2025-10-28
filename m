Return-Path: <linux-media+bounces-45849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD85C16039
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F5081A60C4A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25F728A3EF;
	Tue, 28 Oct 2025 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afwzdFN5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A083A2D0611
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670526; cv=none; b=mFk+Fv5nMa5Qe2c+ch23oLlBbJ1oqoI0wX2mzvHRmTrhvNOsFqe1x3mB1ANDXiKe/UhBDmZxOVmxwZfBkehZX1VFozTqcEIcdRql4Wdx4KAJfgd8feEwpdNYJqslKd736s4hjsVgQ57WSRdP2NgciIEWnbRHHBeRBgRNtiyYTMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670526; c=relaxed/simple;
	bh=1lNH7T0PILTID+kDI3qtSiK0ORHRtuJtQXANKLw0Nzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ozc+cGfh4aFQDBldvY1NEfLO+l+jV7AZmuyQCOKDF8PABb3OZ5dUC6gVCtPx0fpNPOTQPfIqz6/kuLJeeyi06XZI/u50Ek+LzozrWfdqFMwHXzL2L5noFrxTy9LQ8LBR7cOD/Hu8Gg7KN2EDUbIV1T6kNA/FMkJqh/ypvfeW8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afwzdFN5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4270a3464bcso4793947f8f.2
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670523; x=1762275323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lNH7T0PILTID+kDI3qtSiK0ORHRtuJtQXANKLw0Nzw=;
        b=afwzdFN5fn8CgbfH+u0BKj/3clEdYp1Rq15jHxbDeD0hSBwkZ8WTcvulP9wqQ/SqTl
         m8AkAwzTb8vI8aOwYLIDpVx/1lMlm1GYddnArN8lEG3YYLEjnoTW9FnJC+4PL+KkfK2m
         AKIrnL6KKCN1jh1Yk2laRzoQpFObVKaDIICz99JmqYMcJtpWoCCU3ZNp877dvBccr2j4
         uUzT4a4dVEV3PttKusMNhnKtQ2eRT9Da9Z5X9WMRczTEj/rboeW1fjaMYeM1HWmL2e6j
         sbzmEfVWNGu/6xDS+GsywRJ2XRp3KFlKJndmeTKe2dPWKeYCi6X1mspMrAaHN+KwmI0w
         GEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670523; x=1762275323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lNH7T0PILTID+kDI3qtSiK0ORHRtuJtQXANKLw0Nzw=;
        b=Odw8R66bOk/twsU131AXyFPJWYbSQxvV/EPyxjum1jvNgovK0+hZuyE+dtFD+u4N8O
         qXgshuDwpThYUEAersgs4wfFeWvg8UTMMd8cFTA55QNiK+1Mj+XXNBRCqg8bRnOrAqxF
         P8zUtvKuBufpaSg902grIHnnNDPa2iEfDo1yR4AzhCPFHmysnTCHhEZIMjtrv4mEk7VO
         RjKJXh5iq/tTqQlAQF5kkE1uGhhUWenl4CuxX6K6fTynnjLTn4LTtMgsXEXvLfqWQT1U
         NxUo9BNrSbhsebZT/f529qJVGyHwrXI90r2Di2IMa9KSS0YfiL/YwCW6pP8aHmwmNvwa
         fkqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn3IuBm9Q3dYg/Hs468wM3LxhX7KF5w5D8JnQX7zwU2NJHlH/ByLWmx1zOKREBTYT8frIYIvVeWcLHRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhYw9RmT4J1nBZu0cSt9EREmwdODNGDf8Jiw1sMIaLrTeU+6ws
	uOodM1bn45+kkDfpV6n4tFsQ7qasFuO8pOpngefK2MBrc5CS0uA6Psh/IAEAMbAg9trUTVdGLau
	4f51hNnUf0q8CLFYJbbvvUW5CbSS00jU=
X-Gm-Gg: ASbGncsISq5vQabh80BoYug3/SAfhkPEfrm9yptwDlKxepTCN+96awhlcbAOSueg9nM
	+ujtyUOG0S75uGmyOSnUMtrf3Nr5DT19TqaweZNo/gr7iU3MFHhiPkOkbibCtSwQMJFTnB0nl+h
	6r3uZrS5OCiv2/7loGFbpv7OCq19scGIIkMwySSUkOQFHgk2wY8HUrHn15TmqxVFGWcl/rEWRIo
	TrFBi0ng7/PEDi5tlg3OLyYnAtshvRFE1o8SwpXu9o2QCE+zcsa3y2HJ7bpRA==
X-Google-Smtp-Source: AGHT+IGuT5rDPP7pBF0lH7KLD51Bwkf91eAhkAk46Umuzlb9bzaVKJCxGGTByCLo4f1fcUqJMKvnrtXeSYHxAWjXkfk=
X-Received: by 2002:a5d:5f94:0:b0:425:7406:d298 with SMTP id
 ffacd0b85a97d-429a7e35cf6mr4661170f8f.5.1761670522624; Tue, 28 Oct 2025
 09:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819120428.83437-1-clamor95@gmail.com> <aLB_7YS9HsfzfadI@kekkonen.localdomain>
 <CAPVz0n1mXvdyzshei8Mbw7KVYCkQjziBA95ton4MKXPnPd0kbQ@mail.gmail.com>
 <aQDuOSUYbuoLoFbf@kekkonen.localdomain> <aQDvzKMXhVlR2G3J@kekkonen.localdomain>
 <CAPVz0n3E08Ft1q5QS-aT8WUQNmTe5uOs=d2VHovNH1BbdQWVRQ@mail.gmail.com> <aQDxeXV37IHpKeKX@kekkonen.localdomain>
In-Reply-To: <aQDxeXV37IHpKeKX@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 28 Oct 2025 18:55:11 +0200
X-Gm-Features: AWmQ_bneDRcfVAMTu_XZQmORGNufJK8Rg55m2bX5Zib7AOKSUA93LeLJ_p1DYkg
Message-ID: <CAPVz0n2UzvivdUdX5QapduYZ=+LbZp+LPJnSKJmd3WRe35BwaQ@mail.gmail.com>
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
8 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 28, 2025 at 06:34:15PM +0200, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 28 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE =
18:31 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Tue, Oct 28, 2025 at 06:24:25PM +0200, Sakari Ailus wrote:
> > > > Hi Svyatoslav,
> > > >
> > > > On Fri, Aug 29, 2025 at 09:20:10PM +0300, Svyatoslav Ryhel wrote:
> > > > > =D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =
=D0=BE 19:12 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > > > >
> > > > > > Hi Svyatoslaw,
> > > > > >
> > > > > > On Tue, Aug 19, 2025 at 03:04:25PM +0300, Svyatoslav Ryhel wrot=
e:
> > > > > > > Add driver for Sony IMX111 CMOS sensor found in LG Optimus 4X=
 and Vu
> > > > > > > smartphones.
> > > > > >
> > > > > > Thanks for the set.
> > > > > >
> > > > > > I wonder how would the sensor work with the CCS driver. The reg=
ister layout
> > > > > > appears to be very much aligned with that (I haven't checked wh=
ether there
> > > > > > are MSRs that depend on the mode).
> > > > > >
> > > > >
> > > > > After deeper testing I have found that imx111 may be nokia,smia
> > > > > compatible, at least most of general registers and CCS logic is
> > > > > applicable. Some of registers may cause issues, for example,
> > > > > "phy_ctrl_capability" =3D 0, 0x0 and some insane pll ranges. Mayb=
e that
> > > > > can be addressed with a firmware patch idk. The trickiest part is=
 that
> > > > > each mode requires non-standard and non-common manufacturer code
> > > > > (0x3xxx ranges). If you can explain how to address these issues, =
I
> > > > > would love to add imx111 and a few other modules into list of CCS
> > > > > supported devices.
> > > >
> > > > On a closer look, only the image size related configuration and a l=
ittle
> > > > more appears to be CCS-like. That's not enough to configure the sen=
sor;
> > > > this is conveyed in the MSR space which indeed makes the sensor dif=
ficult
> > > > to control using the CCS driver, unfortunately.
> > >
> > > Ok, the driver appears to be doing quite a bit of register writes out=
side
> > > the register lists, which is good, and what's there appears indeed la=
rgely
> > > CCS compliant. The MSRs remain an issue; it'd take quite a bit of rev=
erse
> > > engineering to figure out what the registers are and how to configure=
 them
> > > in a generic way. I think that's doable but I'm not sure it is justif=
iable
> > > considering the expected effort.
> > >
> >
> > I have deciphered a lot already since downstream provides only
> > register writing sequences. Everything that left is 0x3xxx which seems
> > to refer a vendor region and it is not documented anywhere.
>
> That's what I'd expect, too, with the possible exception of the datasheet=
,
> but even sensor datasheets often omit a lot of information.
>

There is no commonly available datasheet for this model. From what I
have seen from similar models, 0x3xxx is vendor region and as you said
"datasheets often omit a lot of information" which is the case.

> I believe you're already aware of
> <URL:https://www.mipi.org/specifications/camera-command-set>?
>

Yes, but since this module is from pre-CCS era or was created right
before this standard was introduced, the module lacks a quite a bit of
registers and configurations required by CCS. Keep in mind that sensor
is used in the phone from 2012.

> --
> Sakari Ailus

