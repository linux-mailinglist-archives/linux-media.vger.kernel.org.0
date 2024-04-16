Return-Path: <linux-media+bounces-9518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688588A6C9C
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 15:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 229EF284773
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 13:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5541912CD81;
	Tue, 16 Apr 2024 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UD3ioQS0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B4012882C
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274526; cv=none; b=YgewIp0ywlRRLhV7q/nVlaGZzeUJ3Zq/fK0Ebpm8i7j7sNHttuGMlPSr3sJ0L4K6t3aBbROnjsaOOTSIkWkpIy1Di3PxdX+LRSr1hKhA1PlZOaqosX0SGikxp8s+xdukQbLV2cSef6O9zdE44R3zaKK+CRdCwSzsJCOmmljWAsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274526; c=relaxed/simple;
	bh=y+g0z3zxFZxLp0z5QxoMl9zaVkT4hRiFtrf0ogeyKh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSVSJ9StpTNxNgeD2AzxZu1vMbYccFmgblxgUPMVFwb1/1NOm3IiSqGTb0W0KEM7zywv8nUn5Wv0XJKMOJ1aAFDh0V2QHqDZxB5clAuZgpYr2LezQ3O7D46/GU/VC59mTovkTVAi3kEfabi3g/AMUCyrRscM7UsYtQbDvQY0NRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UD3ioQS0; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso4948400e87.2
        for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713274522; x=1713879322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iK/T7s8p/J0tu3z/h2XGg5wnqrBObLuxU45NTGwIAWI=;
        b=UD3ioQS0+azlOkuJNdQfHbktp9FEZFihlKjyxTM8qHI+cLuuzs5yWdpd5bQZ7827LR
         +CpHokQdnryynkiggNBimowCTJyaosBoZ2fRY2pGzMjzq08yq6m4yfyp3mDjhnxEEVIb
         Dbi/rpiZ6S0lc0RhKXIl7XWTm16R6dMS0bCxBBROImv4b3Md184aDWwKgiIGFtOZMnSC
         WjXhwV7nIbSOvkQQ3oZWdQDbXubZGSOLAOJMdBa5JxRKnN+04Hx2MlVdNyCi1GiN5jBM
         t/byGsA3/5zT3RWojIMpLE5+py8z/D/xXpif2vKrR6eLZymROR6Pd1oErzknfp5F9X8O
         mkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713274522; x=1713879322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iK/T7s8p/J0tu3z/h2XGg5wnqrBObLuxU45NTGwIAWI=;
        b=Cu7SR62Ta+e/g4i7weV3arOqlxlpcTpDn+NDvdgDwUmrQoEyxVXifOpjn/VZZEWhVG
         KYlCq3lZF2nBTx8/DqclYuSsQIxq4cGy+DmB9eVw+dbGUmijlver7c9uSZajkl4VjgFw
         7N14eg/vRKSrCtm4Z4JfJm/7+J7X7sQK07av09Wad3PNi9MnTs/t42Vaa8Z2uDuFlgGW
         7ElGR422Zra3ku9Yw7MgAUwaEd9b0wMC3tUWXmzNJbGT5eONnmNAmVpwu54DiDtizmqt
         wdFuk+DWMdXlHupkv4JFOfkXEai3zIvfIHybSFcz/DFCVQd/tzDVASnyFSbSR4JP1vQO
         78mw==
X-Forwarded-Encrypted: i=1; AJvYcCV38Qwo970er7XL8Sq/6QCDwSEh7S6ZBDMkVYeZ3Ed0XKH4Y1IWwmVgYXi5fjDm/AmcXvoxvf78Fd+QcZFeexalC3Je52DWQsv/GXE=
X-Gm-Message-State: AOJu0Yyxd2vn2Lugyxniq3/KKon4Ycv/arPFi3nUw8OgbW2051bZzbtg
	l/p2RbMDWLDxV02trGfwBFdfBGDzVAuUyB8gtw5FZ01XyLUyWw431dvyRX6KAAicMe3xnY+o6AT
	kWT7CMbA7m+7zWd6Swk2Pco5aIXgjVIya+vE=
X-Google-Smtp-Source: AGHT+IFLiUPfBwTtuyUr7Nvw85J0Jz0AtFa2fGp3hfYUPqnHfo0TiAlwEmXX1j5BN2GT9YFe4fi97wxIyBC9mrq60+8=
X-Received: by 2002:a05:6512:48c8:b0:515:acda:77f0 with SMTP id
 er8-20020a05651248c800b00515acda77f0mr10269158lfb.29.1713274522065; Tue, 16
 Apr 2024 06:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415120220.219480-1-hdegoede@redhat.com> <20240415120220.219480-12-hdegoede@redhat.com>
 <Zh08SP60QytSz3aQ@smile.fi.intel.com> <294058a6-72dd-4973-95ee-eaed0c908131@redhat.com>
In-Reply-To: <294058a6-72dd-4973-95ee-eaed0c908131@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Apr 2024 16:34:45 +0300
Message-ID: <CAHp75Ve2tyqYM0ChjW=ETjJ27xNmtJ3dDK-2pneanuQEwyFRxg@mail.gmail.com>
Subject: Re: [PATCH 11/23] media: atomisp: Remove test pattern generator (TPG) support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 12:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
> On 4/15/24 4:40 PM, Andy Shevchenko wrote:
> > On Mon, Apr 15, 2024 at 02:02:08PM +0200, Hans de Goede wrote:

...

> >>              unsigned int hblank_cycles =3D 100,
> >>              vblank_lines =3D 6,
> >>              width,
> >
> > Urgh... These comma operators probably is subject to replace with separ=
ate
> > definitions or being grouped on a single line (as it suppose to be in t=
his
> > case).
>
> That indeed is ugly, but fixing this is out of scope for this patch,
> so I've added an extra patch to the set to address this:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=
=3Dmedia-atomisp&id=3D48d93af9d9b0fd40a21a656cb8cd8e25700bfed5

WFM, thanks!

Btw (yes, I see you tagged that already, so just FYI then)
(1 + (stream->config.pixels_per_clock =3D=3D 2));
is an interesting way of using

 (stream->config.pixels_per_clock =3D=3D 2) ? 2 : 1);

which likely can produce slightly better code (due to use of constant
2 twice), although it is a pure speculation by me.

--=20
With Best Regards,
Andy Shevchenko

