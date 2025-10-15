Return-Path: <linux-media+bounces-44519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA7BDD2B0
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E00B505B68
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB9D22156A;
	Wed, 15 Oct 2025 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WRAp6xul"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88544311966
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760513638; cv=none; b=eH7FqGhvWmTWF6xTpLrJNccmXk8BXHsDlSPSfudmZoo1ALNUhwgDaRvG+3YuFUxLuu3YvRpRqIA9rSmc/StMCa/QUhDhwY8ejkCTDa1sOSoVz/9kB1NPkNoGnkA2LBBhJGtliSEeaxVN6HCX0BHmPe1wDGNwbZ4c/KtBpzbNdRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760513638; c=relaxed/simple;
	bh=45HM6drHPjeXjt/LBUhL9wMbf/mH4ryZx0ziOuqJeMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/vjw7kQSkkrT6jjZ6nThznU05deCrihMd6GqwLd0igYMvB6a4y2s3gcQhuFa/l73qjtNl5Z1+CqYTnsbFEGnX4hJJ8Yp5cv1uVY1Aa67SlQg/1rneHXfX4b4hBKJXMmYOZ+C9ka2EjVJAvvaxtUhgI3t/LV7U45G2KVO+cvow4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WRAp6xul; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57a960fe78fso7028099e87.2
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 00:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760513634; x=1761118434; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3jdoENbhx6SecniHkE8uMx2hK2+MI3awNH17hg+n4I=;
        b=WRAp6xul1jPItWAjoiLUD+OYczrUfiIVsGu4QWWAJyCzYzCIGXkOzW/g2nYo/UhujN
         EVpkcPIuwXuB4l5LvhPTgX2nPXOBkkBdOBWOiJvS5CbWsrjo4hM6IEhNxPCV3cHz4gRc
         uHSoJI2rx4e3tblQr+PzTpv1Dmkk2FcadL4IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760513634; x=1761118434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3jdoENbhx6SecniHkE8uMx2hK2+MI3awNH17hg+n4I=;
        b=PFlJ1TLItxriHPhwQNUE9fs7QBXB36MgSVENr/3pebOKrhvq9Ub83jPuSlVRC4cxkV
         ThhP97iQEGX4udHz5ukxgC9wlshtSqtPNHLe44nKhS66vIe4Gs+nDuxQEKgpPDFTKivw
         a4/gg2XLXe22nseOcm8CQGWwGJ2ztTVg91k/BrpWpPbg1OGQtjh5Kro3/zfiA8EK6OW4
         0ToMI0KXZWLwPy5q+LtHP0IDw9yM6pNjufv6y50Z37dCV/F15PP+jTrTMqQAwYUqXzJf
         7LEH/8xWao+HlYu3eQ+wQC1eLMVd98JJ6jN9GndE9wbsy9CKI694PlG/iU4f6ntGyjN+
         /V7A==
X-Gm-Message-State: AOJu0YzfelSI+tmXzEbpuXXXIKoetXTkB3hHcOTygP+uAQk95x29zzWL
	L0nN/USvyCIB5BhjQ2NeuiDQTsRqCa+SvSUYZ/RDPzRGvLw8Apd/1i4+MJMCOch0b4p9wIZ7Ihn
	CeKI=
X-Gm-Gg: ASbGnct2z1vpJ6zZgf61VNTcQRF6KicKNWuN5Zsz9n3cUc19lePcB31T61VrmrX35e8
	2NMfOwcchf/anK+LouLpdVxfHTDlmYduKIXnfMKlw44Bq3LtpxW/hhpkfh9RXVuqTpBBjtyJNDM
	sNPuN7NQjdvwfhN6dKvU+heTiWnZHzYr8iCXPOk8bmpiBOy+ute7N40c00fgR28++BssUsn4fqt
	pFcZ9mDtKjtVUIQZjfC3wTMD9TbOhlJb456HXIUxL2duhiqqoMtqV5Uk7nBshdNiUHuR4AOO7xf
	HkREXqeA8SNYMaq8WGwHKM0eufWV2IXPYgjJjODfwhN2sf7PmohFH571QREfFX0440A14AmAuEd
	edzyqWcnvCPxVqWXOFC95zpXnUOOMAx0lWSaqElrbVmGHLfDCaS+UWuSMqD2K8Eohgmqyelj0Fs
	Tn67lWSO7o3YLsuw==
X-Google-Smtp-Source: AGHT+IGhb/gQZHU2jFBBJgrklD0+z0LOH1xKN7HHi0wGFpYK4zNTL7wmtFgqn0TgoM0YQGEIiHoHwA==
X-Received: by 2002:a05:6512:3ba0:b0:579:f0fc:46f7 with SMTP id 2adb3069b0e04-5906de89a6bmr8064519e87.56.1760513634308;
        Wed, 15 Oct 2025 00:33:54 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590880631e3sm5989565e87.0.2025.10.15.00.33.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:33:53 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-591c98ebe90so479678e87.3
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 00:33:53 -0700 (PDT)
X-Received: by 2002:a05:6512:e93:b0:58b:8f:2cf3 with SMTP id
 2adb3069b0e04-5906dc2dab5mr7726527e87.21.1760513633325; Wed, 15 Oct 2025
 00:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010030348.it.784-kees@kernel.org> <68ed624c.050a0220.3ba739.64ea@mx.google.com>
 <D1CBCBE2-3A54-410A-B15C-F1C621F9F56B@kernel.org> <CANiDSCu6xZAuSF5_M-4BMRc52hbSh_1QfDQqaeGR4iD5fdQjQg@mail.gmail.com>
 <202510141344.E0ABCD2C7@keescook>
In-Reply-To: <202510141344.E0ABCD2C7@keescook>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 15 Oct 2025 09:33:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCsBAq3Yx4ybarUb_1NkQ-bvfXvWqb-DfqXatkiYJFZWiQ@mail.gmail.com>
X-Gm-Features: AS18NWABMkXk00VBzGEAB6Lz910Tnzxu4PyT1r-8UGsY14p9fZu3iRa4oasfK50
Message-ID: <CANiDSCsBAq3Yx4ybarUb_1NkQ-bvfXvWqb-DfqXatkiYJFZWiQ@mail.gmail.com>
Subject: Re: [v2,0/3] module: Add compile-time check for embedded NUL characters
To: Kees Cook <kees@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org, 
	Patchwork Integration <patchwork@media-ci.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Tue, 14 Oct 2025 at 22:45, Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Oct 14, 2025 at 08:24:00AM +0200, Ricardo Ribalda wrote:
> > Hi Kees
> >
> > Thanks for the report.
> >
> >
> > On Tue, 14 Oct 2025 at 07:41, Kees Cook <kees@kernel.org> wrote:
> > >
> > >
> > >
> > > On October 13, 2025 1:34:20 PM PDT, Patchwork Integration <patchwork@media-ci.org> wrote:
> > > >Dear Kees Cook:
> > > >
> > > >Thanks for your patches! Unfortunately the Media CI robot detected some
> > > >issues:
> > > >
> > > ># Test static:test-smatch
> > > >
> > > >drivers/media/usb/usbtv/usbtv-core.c:157:1: error: bad constant expression
> > >
> > > Where can I find what this test actually does?
> > >
> > > >For more details, check the full report at:
> > > >https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.htm .
> > >
> > > This webserver appears to be misconfigured to send compressed output without the right headers? I can't actually view this URL.
> >
> > I will follow-up with fdo maintainers to figure out what happened.
> > there. On the meantime you can use these url that seems to work:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.txt
> > https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/85913398
> >
> > Basically sparse/smatch do not seem to understand the constant.
>
> Yeah, I managed to find the actual scripts that are run for the
> static-sparse/smatch tests. It looks like those tools aren't correctly
> handling string literals for __builtin_strlen(), which is a constant for
> constant arguments.
>
> So, that's a C parsing bug in those tools (GCC and Clang are fine).

Could you take a look at this patch:
https://patchwork.linuxtv.org/project/linux-media/patch/20251010030610.3032147-3-kees@kernel.org/

Seems that sparse/smatch are not very happy about __builtin_strlen()

Could you fix support for __builtin_strlen() in your tool?

Once Kees lands his patch it will break all the CIs using
sparse/smatch, including media-ci.

Eg:

drivers/media/pci/zoran/zr36060.c:33:1: error: bad constant expression
drivers/media/usb/pvrusb2/pvrusb2-dvb.c:19:1: error: bad constant expression
drivers/media/usb/pvrusb2/pvrusb2-dvb.c:19:1: error: bad constant expression



Thanks :)


>
> -Kees
>
> --
> Kees Cook



-- 
Ricardo Ribalda

