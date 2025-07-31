Return-Path: <linux-media+bounces-38678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE63B16AD7
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 05:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE609624671
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 03:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51EDD23E33A;
	Thu, 31 Jul 2025 03:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2KGue2S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1876F23C4F8;
	Thu, 31 Jul 2025 03:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753932263; cv=none; b=Ar0IfJs0XHG8UCc9N/WeEDRL5y76oNXz7Pt7XpHJDNO76OLKfhD0XV9lR3vyWdB1JVWTs/VbAK+bkJxc+Jke+pZioNRV/8CqB5MRueKb4mJOO30K1NvRFJeJZKskCGwQzPxV7fhMIZRniO0c/GaTbzOO+HWnlRgKpeMwQHbyiwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753932263; c=relaxed/simple;
	bh=U6DkH/1QDDTd3JMxVGF5kKk4QFH+stGjJsLlnJmRzA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vew6FFxH9EWhXUK1EJg//uWY8oyaKX4IJLONynVsL/wvpSspxLyfFLdozvCOrTEzydy+gt0bn5ijf/zxcw7qkeinwT6E8RK61xfsq5lpxzDIBhiHbuj/XdH4h/7J0ud1YoeTf1ZswULBHbFU9geGKXE/H0spynWBLElqtzTVc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2KGue2S; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71a2a9ce01aso713887b3.2;
        Wed, 30 Jul 2025 20:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753932261; x=1754537061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6DkH/1QDDTd3JMxVGF5kKk4QFH+stGjJsLlnJmRzA4=;
        b=D2KGue2SwkAGfiwymei/erxrZ5n+CUUys0jcKQlIRGAlMb/z+9Po1slkLKgo1E+f6N
         oqHt4i2Q68wE2G/OkbMWCGcdRAbXxJ5P9WiodVbCSAODXt4RrI3Wgk0ko/qCqXlaCGZO
         HBEF8XdH0TcfvcHJOgvesUfi02rA48XUg2w/BYuhhpn4eruCefdpBVVauSch4zY0PUAv
         NGaRxgMBzCWxwAjaDdHeNYPaUwr4Xpu0oI/Sfj/6bKLKZQF/K2s+JC7T9WGB4lT+iVge
         b5bdCnfXeo/cyIh7U/P+FbFPJMD7cktzbdkI8laPNdD5ayUxxwaQmFDrTjKLOp/tPi0S
         OzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753932261; x=1754537061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6DkH/1QDDTd3JMxVGF5kKk4QFH+stGjJsLlnJmRzA4=;
        b=GU1M43gdf2A5n0Rw4E9xnX63YuQ/827bxoHg8WHZ2Q0dxZtf+Iew6ypj75UnpXzYNX
         Qs56xIvkdAu6ffs8QuQ/WdDRjtx4OkyGoNMZhKuFCXiqCc/oW5Halg8ev1yO2EFrRcP3
         x8ibxR70MKtvonOpf/TifafQB+l4u94ZIcFd9pWj8IG9nbK29WOya0wcet7+41UWYVyh
         c6oaVKifLFk/xKI9O+CxQT9IFhkunMh/HK69VLiBpSIbl8frFqCDfLTvmnlnNOgiwhjl
         YUqS3UxLSVerZXtBvNzngtPcRJngjtifwzDDaQ18N2eBHaZgY+O3sQburLXqXqkpvJZC
         t+3A==
X-Forwarded-Encrypted: i=1; AJvYcCVNGWxlv04p76mUitTM9yt2O+8blOe7pm9+UphktdO+l+nHwqwCUllne16NQAzfAbIDFDVWMIxm5bbHIfk=@vger.kernel.org, AJvYcCVvMNaPgtsyB7We11cWS+XpR0dqTgz2WXvbG1jr7WUJwlz4aJCic9b+yzISFnlOGIktQjQjQNw9qWNvZrE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Nj/24+9CHF1+R0FURtjyefJYSwtYIbHFkphCGBO+fPlzLTWa
	VEFUUA4QgA9A8F3iGwdBgvWVtjgJP9Ftan2jb0GwwfPt5X8uCFboDKe4suzHduD0a05GudzDQOw
	KnW6hrwoEPbNzFdDP/tU8zIxJLtuUVWQ=
X-Gm-Gg: ASbGncvKtY5ceIh85P8hABD1GSU+Ph2dYnRw2rAI34YyyT4bU9ZgbFLIxdcJ05jlxMs
	7hBWMAv/Ja5ynHQD4TLk4iIomOH7CY3H6fTmudhOGZhV2p/nVBglZ6T2aNc6Gb0upK+xfv6Bx9r
	Jl+rSFnOQfuFnvvEGoZG7TE4d5kIz6UETyyu6IRTHAaw6dfJ0qqhD/LhYXHZFCWLxnm4xBwkkUZ
	bxD7NfiwQ==
X-Google-Smtp-Source: AGHT+IGOd8+ZpJgg4qZ9tVXZE6w+6iB2zor3TqPJKna6z1lPau7qtj8Gdb7DMXXGYeelV5KrAnIDySwEhaUOXTq4jdw=
X-Received: by 2002:a05:6902:10c7:b0:e8d:d7b4:c8e with SMTP id
 3f1490d57ef6-e8e315bcf86mr658013276.8.1753932260833; Wed, 30 Jul 2025
 20:24:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
 <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain> <CAGn2d8Mkfdmd3Td3aKQwaa539nMfL0rmJ5d6tLr9A12HSkCUzg@mail.gmail.com>
In-Reply-To: <CAGn2d8Mkfdmd3Td3aKQwaa539nMfL0rmJ5d6tLr9A12HSkCUzg@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Thu, 31 Jul 2025 06:24:09 +0300
X-Gm-Features: Ac12FXy3UekZ9pooVRP9Ag5gzRdN_OhDyRgiHFhGiv1y5-7dvvMpoA2OO_WH4A4
Message-ID: <CAGn2d8O0TMqBR0wvBVbWzKKKqQyLWzn9Rn-8bhYTC6wR7-HwcA@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver AtomIsp
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maintainers,
I'm just bringing attention to this patch series as I have a lot of
other patches that build on it .
Thank you!

On Thu, Jul 17, 2025 at 4:35=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Hi Dan,
> Thanks for your feedback
>
> On Wed, Jul 16, 2025 at 9:21=E2=80=AFPM Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
> >
> > On Sat, Jul 12, 2025 at 10:13:22PM +0300, Abdelrahman Fekry wrote:
> > > Continuing the cleanup work that is being done on the AtomIsp driver,
> > > This series:
> > >
> > > - Process the error inside hmm_init().
> > > - Unifies the HMM init tracking method.
> > > - move hmm related function to hmm.c.
> > >
> > > Previously, These patches were sent individualy but they build on
> > > each other so i resent them as one patch series
> > >
> > > Suggested-by: Hans de Goede <hansg@kernel.org>
> > > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> >
> > These seem reasonable enough to me.
> >
> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> >
> > But it would be better if someone could test them as well.
> I tested this by building the driver and i really don't think further
> testing is needed
> since this series doesn't introduce any behavioral or functional change.
> >
> > regards,
> > dan carpenter
>
> Best Regards,
> Abdelrahman Fekry

