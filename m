Return-Path: <linux-media+bounces-35912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93396AE8F2C
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 22:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 932241899F7F
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 20:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558252D8760;
	Wed, 25 Jun 2025 20:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9bz8R/O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641A1FE47B;
	Wed, 25 Jun 2025 20:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882068; cv=none; b=glWN9RloGnWeGM7v8ngYt4ZXnSRN9NLAU/ZVtMP45x0zH5YCmBtSL+mciuNmhQlAnTEWuzmqQe+uMuMGEKk6FulNRSxscDy9B8y/mDrFwG/b65mBMn8PtC9fkcA/UUsT7Pl6RU8fiUC14rBjfJzIdmjZDHdO4WbLWZhgDIXJ6YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882068; c=relaxed/simple;
	bh=EjtCgjlPuYa9OqKtTw5kDeGLPeJpAT12j+uPFgv0rOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ER9dwClyMVB/ijm7g6K5AZLwYpqtnRJsWKXmaeFQnN9DCvzMwbJosCeb2HV6917925PfdfOuxmvP/Gu4/9CGpW3J1s1m7oogIAfKfsY8lVoZRZR4NCIPWK6jTQAoIUbAA9cBKP5UUx1Dof7SNdDSj6XzsP0n6HYgCX+6nfS3Otk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9bz8R/O; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-713ef518da4so300777b3.2;
        Wed, 25 Jun 2025 13:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750882066; x=1751486866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjtCgjlPuYa9OqKtTw5kDeGLPeJpAT12j+uPFgv0rOg=;
        b=P9bz8R/OkXKyfeOa1QLtYOYjMroeRBjA5od90IrReD4WXfx/pJexOXE5fq90S+uLvx
         Fcb94o3Q75j1LexftCGaRqu+lHwSDtVRNQmrSfFNC0Kaf8WRJGikWz6yq5K6HYqOpLFx
         /6gCMqSKkHn5MEzQqFHfbDN7/M9CFO4vyOwKIwUgJIdfR9oachbA2HXy1MfrcgY1YPbW
         5eguSRsCXCjwlh+bp0rCVivbvtBWo/HIEu42MQUp/K9yBVcNSLxFvQsNNS4clx2zsyDF
         XvoaQ0FB0xTWVLgTaIbMZ1qx7BVa0RITxW5wKVBfnGufvtWl6eHbahGblWSD9aq95Q5C
         JfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750882066; x=1751486866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjtCgjlPuYa9OqKtTw5kDeGLPeJpAT12j+uPFgv0rOg=;
        b=w05NrczEti724m4v2MgRbQ9s1awpMSkuqCE8lnraSZXh0uWB0t9utzA45grrSIxG6F
         4kvrCFJzpnVBOZM9xxJGMSx40jGprOd6o7pOWHzALGPqgSXGGUCRLA9RhuHpiofPy1O7
         jJdE5j9zE3DjyGRHTvqo8FRyn07mWE1lOcfoxnbOZiAJO3VmGNkCHcgtPPh5IStFD0nk
         0yFfSiZPgw2eTtMDdBjs3qNcTrvKWdvPu+Ly3/rTUj2LmSMmafNtFHuhc0Mh8XQgDcn6
         NBk2RuWcN4PN/Tv61T3DO2YdS+IXYIgXbMeof/PGmkykXqmgHsqZw/G6rwVMPRe6aTPC
         a0SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxWleyatHdUOVv56gP+UyUxKYw0BYYtBjp3BYA6QSURbMf7pTfd/1MXJRxbYgBMf57uiMF5zeaM/nj5R8=@vger.kernel.org, AJvYcCXRtWZPqlbCEz6z6TzcKfZyASR5W2UshnYVH2tcqXUHuFShLoJDSvnpHm7PtB5ihCbtAAXyrzqBtIEyH0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lSGsJf8A0jeCHO+W6VuL3HS0T7mndE+MzUHnXwgCvg7Afy3y
	OlDGDoiUAfgPWcCt5ltiV+VOZhb0klfbCnTlPP9fvej2eXGNbjM1pANsRzXHTNzci8DlBrVgrPC
	yh53D4/j2FZDiVRf1KhgVzRId2buN/GE=
X-Gm-Gg: ASbGncuoYIXRSwzf+1Ns3j2TzFcHia6ed8XNngQlhXUrQJvmJAZrG4G+ylMUxRTuyv2
	lez79Hv65zrBIwQtaVmNHC+uLzGlM19JF2AF8xb/xEV+hvcotFKn2UcL4WKpG+DyoVCsYEdK1Yj
	WMzDuEnmLK37SdtvAQenpnf6s/8ehCrf3ebLSAut9gQsk=
X-Google-Smtp-Source: AGHT+IGz4txyKPd7fSv+f9CzjEkDSNQgHwjMbV5Yhzz8B88moF+AakLXs8owD2LqNSjcS5hCDxId5lFVReEZt6ABDzE=
X-Received: by 2002:a05:690c:67c1:b0:712:cc11:af5 with SMTP id
 00721157ae682-71406b6599fmr29578827b3.0.1750882065681; Wed, 25 Jun 2025
 13:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com> <CAHp75VfL2uMpOP2xfa6zf=MAFrt0Phz87xo5w3bC21t0-TTQKg@mail.gmail.com>
In-Reply-To: <CAHp75VfL2uMpOP2xfa6zf=MAFrt0Phz87xo5w3bC21t0-TTQKg@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Wed, 25 Jun 2025 23:07:34 +0300
X-Gm-Features: Ac12FXzwVYZpPh2GdM0bP_aNvwstV2K-3UVsUmTB7suEGHiFt6UKlSIQ2Vw63lA
Message-ID: <CAGn2d8NmM3Jr+ZR=hj6KYyHdkx1Vc0-Q2RE7Y2o9RfQM1dPAog@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thanks for your review and most importantly your patience :)

On Tue, Jun 24, 2025 at 9:09=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> You really need to slow down with the new versions.
>
> On Tue, Jun 24, 2025 at 8:07=E2=80=AFPM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> >
> > The sysfs attributes active_bo and free_bo expose internal buffer state=
 used
> > only for debugging purposes. These are not part of any standard kernel =
ABI,
> > and needs to be removed before this driver can be moved out of drivers/=
staging.
>
> needs --> need
> can --> may
>
noted , will fix this
> > - Remove active_bo and free_bo attributes
> > - Remove group registeration calls form hmm_init() and hmm_cleanup()
>
> registration
>
noted , will fix this
> > Suggested-by : Hans de Goede <hansg@kernel.org>
>
> This is not a tag. Check Submitting Patches documentation and find the
> issue and fix it accordingly.
>
noted , i now know the issue and will fix it
> --
> With Best Regards,
> Andy Shevchenko

Best Regards,
Abdelrahman Fekry

