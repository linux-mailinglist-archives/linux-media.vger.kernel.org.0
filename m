Return-Path: <linux-media+bounces-36461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C63AF0264
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 20:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9390E17AC1B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 18:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A6227FB03;
	Tue,  1 Jul 2025 18:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iH5/25C6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFAB1E32D3;
	Tue,  1 Jul 2025 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392854; cv=none; b=IYIR0tJ8A9QlQTes1ha0/vVYC8ssAJFZC5MOI2umM22B4mAUOEdYgPzEAPU0zatuvccBSEAF5WNKDqq59M5EUEnKC6HhbNpMGVmph8VQFDSksItpx0/Gf4UzCKfH/SzxHbAZPbcaU12OWNHhphY2Kj0VV86+Lj2cCiap7YfCWEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392854; c=relaxed/simple;
	bh=/FvRPSO7fYdAbOf1AN0zfBLd5lZSWiwNpXWHXWxVGcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyNuB4WD6JlfEsuesApAO6AwP2xiG9T9IlaMKIXkN8j9gkznmb0ALLGVAdSvTC3ptVbG2YGxIp+sWLUgy8Va4Xg5OsPqanKc6YOtpvlYVDNokk3NUgZzo7rnBF6AQD43/gM5NAGUqWpGXTSnhTOQ5jKXpI/AxI94PUkRTGspNX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iH5/25C6; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a16e5so7550666a12.0;
        Tue, 01 Jul 2025 11:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751392851; x=1751997651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FvRPSO7fYdAbOf1AN0zfBLd5lZSWiwNpXWHXWxVGcU=;
        b=iH5/25C6/91EingCUYUFV4sZFXq8iZoyIXRMlqinmzaVto93du2t4/IIgd4YwBt67/
         eN4nc7Sq12P7k/E9dKxyxb47bMv2sLdOFIEpMIDL1PqUe5nFIeu1rlT/YWigB/x/Z5Tw
         r6MVJFO41na6mb1ZM48UnWgun7zTynyFMfJVtrpk6TDAhxiaBVIcFmK80lAINeS0xb/9
         eV/s1m3UOZeG6mRziMB2s7jOdm9xWmQ1oX5F1yAy7rGHLDkSK9SuguDGDfGJcnynhvVP
         kWx0Yj1yahWyw17oUcMzPCocBLCc1pnJXOpidkBx/olhhUsbotpubPL525VJi/Li0uDZ
         0yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751392851; x=1751997651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FvRPSO7fYdAbOf1AN0zfBLd5lZSWiwNpXWHXWxVGcU=;
        b=r0zHm6pLmXnWAmdLgdpVCaskRqpfmz2wv6do2Mcg9ixjSYyskJ8svno4ENrvXH36a1
         8WpY3YyYq5PY0guecnghPzl4KVfJuas79DAu9cltDPgC7Krtsu1m+UxSOgeaKiC2V2hI
         Arq+0jK34+JUhCP14WhjeVHqDohNQ780qYwh3XHMxt1eD6g/Kefgoq72mjjb+htTl+qp
         6QPgSgw3MuLj07K/fhOpomSbdDGF45gF05LxjlHONetstzIo6/NwfGRJ0rrR5Ec3+8fi
         x0nLp77CqqydDbRYWLq9mF+57glMn0rqUK0uwleX2QBTZbeC02jme/3oiReOHLbFsRsD
         /E6g==
X-Forwarded-Encrypted: i=1; AJvYcCWG5JLNDN/010lbeGs36miO9p0pwl1yKTxw0cTbF63g77U2SpLOB+Q/dUJbgE+PwBPUJ9CtqcpP9bCAIZQ=@vger.kernel.org, AJvYcCXIK7uD2+w1lcwBEdIb1FVIvAWEeQ2Bqc+jp6FRhEHmz6EZc5vYK5MIkGGJ9Sm1VEhr55ZAkGlTAAVwTWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn3M+b1RwlKhyQejD5vq+f0rmRD3NaG5MkwhZdBIb+pFcRB9ie
	1noUzgZIBFlv6AjER6HkREhc9APYKrhva97y7JVXlTgA1kCE1sc1LCg19Hgr4Vj4MB6lwzyA/pl
	sDY5YhLcyjxQUmT4ZDLYnQBig7gP75Uo=
X-Gm-Gg: ASbGncuUXI5mSlA8jBK9/n8WDyJMqwP5Kzw0ZHhmJ7tX6zuJQ3/q4xSNiHSOuvFLlG0
	iwa8ZHOCsV6Dds0zwu1tQqQ3RjbojcK8XCrOKpvpj51hpfEb/+NuFO3o600ntNxb5mIJvflcb1h
	NBKW/gNp5JZVs1bHWQItE25Jg0o0gu2Cf0XtyITIk2v8Q=
X-Google-Smtp-Source: AGHT+IF1zakzJA5dtJuHwh7QhZ+pI+p9A9orFtQ+5iXRAt2oZyf2Tj/MGdbjQO4QKJtIfzKiJY4EpQ3Q9kP2DEfk4nE=
X-Received: by 2002:a17:907:9403:b0:ae0:d38e:5852 with SMTP id
 a640c23a62f3a-ae350109a6dmr1846115666b.39.1751392850229; Tue, 01 Jul 2025
 11:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
 <aGPYZhK65LaD0wVO@smile.fi.intel.com> <CAGn2d8ONZpOHXex8kjeUDgRPiMqKp8vZ=xhGbEDGphV1t7ZEFw@mail.gmail.com>
In-Reply-To: <CAGn2d8ONZpOHXex8kjeUDgRPiMqKp8vZ=xhGbEDGphV1t7ZEFw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Jul 2025 21:00:12 +0300
X-Gm-Features: Ac12FXyY3nlETi8UNrfw8VulBztQXHnJGHYlKQEWXzgW8R1ZzAhAnNFBHla1BgE
Message-ID: <CAHp75Veo_GYecergPLjSY9k4fsEnxOQLq9rx2N+rBk6u1LzOHw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 6:34=E2=80=AFPM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Hi andy ,
> On Tue, Jul 1, 2025 at 3:45=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
>
> > > > Nice. Can you make some fault injection (temporary by modifying the
> > > > code to always fail, for example) and actually prove this in practi=
ce?
> > > > If so, the few (important) lines from the given Oops would be nice =
to
> > > > have here.
> >
> > > I have been trying to test it without having any intel atomisp
> > > hardware and failed continuously, do you have any tips or maybe some
> > > resources on how i can test this driver.
> >
> > So, the easiest way as I can see it is to ask people who possess the HW=
 to
> > test, but you need to provide a testing patch (which can be applied on =
top
> > of this one, for example).
>
> Well, after several hours of trial and error, I finally managed to
> find a workaround that allowed me to test the scenario. As expected,
> the system crashed exactly at the point we discussed. I was able to
> capture the kernel panic log, which is shown below.

Thank you for the effort! I think we are good to go with the change,
maybe Hans can add a summary of this test into the commit message when
applying. Or Link tag might be enough, dunno.

--=20
With Best Regards,
Andy Shevchenko

