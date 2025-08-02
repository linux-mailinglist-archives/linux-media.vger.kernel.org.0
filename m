Return-Path: <linux-media+bounces-38805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1194B18DDE
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 12:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F04A8189F30E
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 10:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F641F78E6;
	Sat,  2 Aug 2025 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCxxiIlb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058A20C038;
	Sat,  2 Aug 2025 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754128805; cv=none; b=UMBgz9RDfaZNdYUU8FoT8+BQrrbVo9lhR24cVPfSHASwwAOhZ/mwaTw7u7coaroonymiuLoSHUhjPNNFsMy3F4qzJDtmoD9kBCs5P7cc0tA23ZMr3Cpd+Kw8R6LbgrMDhuuaOtdtAXac/qfQayB2R8ILPuIGaK68DcbQy3DzsC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754128805; c=relaxed/simple;
	bh=WayQJUQgwbK9qbfQNWW80s1Tl3LPJMIe/oqlIJwmTLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jahGfFbRPMRy/vda09O3u6jaUnKBElHh1y425DELpsTSXfKhyqJsX+uEUKk9FN2QEdAcoY6Kiuf1x4umAr3yTAOpERu/Vu0YA19X5c6a9XmqhQ0ZSQ6OiB9UNmQVIcAiNLDllcAHaenaso0UyAaFbuV4k5UP/G/C2R3j7tp6aug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCxxiIlb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-af93150f7c2so284941066b.3;
        Sat, 02 Aug 2025 03:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754128802; x=1754733602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feWlU5UHKzv3UI0KTDbYapRv72T2kY/BmRcgf+kQTWU=;
        b=NCxxiIlbIyNCor4dXKmQqz/qBF1nAdHlTdxNOb+M++TrqUC3Ll7KQtCL3PV4M27UvW
         BTIA0t+fMen6yHXc73KlP9iC7UR3wmvRr+HLAGkqEetYt5OyQg+ObgjzFnxjpwun0ZRL
         vFYUpK9hP5joREfWuFl89ItECL7/mFLGeslhMm+cmG0CSPRWgfrx6IuJZ25ZWmdfJ4uf
         HvCXCImNdn3s7ZMB4kwI2eoZ5MrY539OiGNiIJYocesAOVMf8to33gwaahe6sHi/16Gs
         Xq1fKbLWeSZGix71AGQlVk29/PPn0Lx20A/ElIl+AgUFbqrOID2hiBDb00PXL3lcpvYy
         zPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754128802; x=1754733602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feWlU5UHKzv3UI0KTDbYapRv72T2kY/BmRcgf+kQTWU=;
        b=G1VMENM+r3oH7vQFnedYIw0z4VBBVN+deyYgq6vHGy9EGt/KEgxxbCPx8a61t9rjwp
         jFtHgZzYtOLWPErPzL/obdyG3HWdiOTSIu0rdRi8yztm300g0JwyUtkeiajWZy1n/x5c
         qaoHUzdJGsZYSIivTCfv1CkPPvkTAx//YUPx3DkyOhHOliVXVTdwf5a2wMUC8sWW3s1a
         OBT0yxjZOk3413eb3LTBmB0QUAkiDTuzOj8p/xWoDGWqxZ1adIfCRxLoONuSVaFZkWEW
         ZnZvVhvs3u+eoIKVT+t/OKXio2oRxRIBcp7Ko+/Z3jdibZgfyeGd0WzPJJ9mosAE9uCH
         sTrg==
X-Forwarded-Encrypted: i=1; AJvYcCWFMfVOzByZYonLBh+yUTrt1NoOZ0Mv4LLOZJdoOb6zQkgdeW4lBbJmR0P59Y6yvCAtzPrZLBT1eKxJIiu+eSc=@vger.kernel.org, AJvYcCX5IjuaAmouadVLjwpBobJD25L6RFvijFAHjE8hLjMyxlMGBJw6aYJ05j4pJVNgDDRrjVZjzi25DBHtV1k=@vger.kernel.org, AJvYcCXXl8r2JsaklBXKkewkMaH0R7cnU+RjYQ7udH9CXXsQrI4QFkJb0PwrlDFT4BfEN6Htafbaz1nSSC9nBk2m@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Tz3JGc8TyYIV7mgT/8JA6/Fw+Rx9i6G3JkROImSnAZ9TYF6E
	DoFaHqoIyEZHXvSB8rbsNvb+xZwHUPVbShS/PYVyQoStglz8MTW38FnG2rfiYMtozeCn17GIExd
	boMBF4KAjjTF4s2d8dHKDl25eGm0H5k8=
X-Gm-Gg: ASbGnct5YIdk9ndiTBpSGvKL5AsrUs6QPYJLl45q4NM5cmoRegDKlNDIwZRdTc5tFfw
	cVhZuz6WzltR4ndVqfvpIbNfFUEOGETbVlxotrd+c7ayydly7K6ztC+XFz9ZmgLglQSB+l0KMYU
	grvz1CYbtnBQp5j8OHpuMCMH/vJI1yg4xTBJ4h+DrQh6Uz+TVkiARz7e50t0a1KN4GJT2IbndwZ
	6r2VLlaF31DPOa5yALxsiJyrP3BbSZ6FKzjO6ne/A==
X-Google-Smtp-Source: AGHT+IG5TgeuLHpNv7s/LemmQexDxqYMgoidrE7ZLMIA81vr/4HVCfPj3/Rb6/9ZIVHsjd2OS5ljDfBbdV7yoto0yPs=
X-Received: by 2002:a17:907:3d9f:b0:ae3:d5f2:393a with SMTP id
 a640c23a62f3a-af9401a6d31mr287570266b.44.1754128801607; Sat, 02 Aug 2025
 03:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
 <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>
 <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain> <CAHp75VdfZwmRzGAeN7rLoab2oT8eKyUF1mUGj4d+y98jZS7EHA@mail.gmail.com>
 <934c7ffa-1386-45a0-a4e7-f2b93cca6370@suswa.mountain>
In-Reply-To: <934c7ffa-1386-45a0-a4e7-f2b93cca6370@suswa.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 2 Aug 2025 11:59:25 +0200
X-Gm-Features: Ac12FXydITqpLLTnCyxi2yPbs8KHbuNgdyPXStr15pFn8DAEsDgugG3s9wEt0rQ
Message-ID: <CAHp75VeHvGkPf_OHDNfB3aQ-196HHP0hddnPS6DVJsBsiBAMdg@mail.gmail.com>
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Colin Ian King <colin.i.king@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 11:02=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sat, Aug 02, 2025 at 10:45:49AM +0200, Andy Shevchenko wrote:
> > On Sat, Aug 2, 2025 at 9:32=E2=80=AFAM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:
> > > On Fri, Aug 01, 2025 at 11:57:43PM +0200, Andy Shevchenko wrote:
> > > > On Fri, Aug 1, 2025 at 6:01=E2=80=AFPM Colin Ian King <colin.i.king=
@gmail.com> wrote:
> > > > >
> > > > > There are incorrect %u format specifiers being used to for signed=
 integers,
> > > > > fix this by using %d instead.
> > > >
> > > > Both of them sound to me like the fix of the symptom and not the
> > > > cause. Can we simply make types of the iterators to be unsigned
> > > > instead?
> > >
> > > Making iterator unsigned by default only increases the rate of bugs.
> >
> > How? Please, make sure this is relevant to this case.
>
> You're suggesting that he should change:
>
> -       int i, j;
> +       unsigned int i, j;
>
> It's just bad advice.

I disagree with this statement. The code varies and in some cases it
should be negative, but those cases are not these one, or you are
talking about _this_ case? If you are talking in general, again I
fully disagree with your statement. One needs to use a common sense.

>  Making iterators unsigned makes the code less
> safe.  It leads underflow bugs when we do subtraction:
>
>         for (i =3D num - 1; i < limit; i++) {
>
> Now i starts at UINT_MAX.  Which I guess is fine in this example...

Depends on the num semantics. The main what one needs is a common sense.

> But it also leads to endless loops in the error handling:
>
>         while (i-- >=3D 0) {

How? Error handling usually takes i > 0. Bad example, try harder.

>
> Making iterators unsigned is a bad habbit

True when use in conjunction with the same statement for signed cases:
"Making iterators signed is a bad habit"

> and it's bad advice in terms
> of the data that we have with regards to bugs.

Disagree. Bugs are common because people do not understand the C
language and its integer rules, wrap-arounds, etc. I believe in many
cases using signed iterators "fix" the bugs due to other variables
also being signed instead of both being unsigned.

--=20
With Best Regards,
Andy Shevchenko

