Return-Path: <linux-media+bounces-41438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68693B3E4EE
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E80301A84849
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 13:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5D131A062;
	Mon,  1 Sep 2025 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MJVrwvta"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159527602A
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733252; cv=none; b=IaGv/CJab+f7QKkpnK6V+w8dd4b99Z8IH7V5MnOewKgW5gn7ChZXmYLYShUvVRKAtzM5/SMWDrJ+QKZA1xt8vo9oxb1ENMtOwy1/ruTshblmeknEK3hVzMiFXVBtHPFb9kibCpjklXf0tYjnTPPXBBWlzi3c4R/9Xjvhu0sOBis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733252; c=relaxed/simple;
	bh=fNzrzBOmUfUkL+rdi+LGLcpV5MZwfFh11U0nDpLmcf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqC0MgAfybO1unQsVnmbuOVnoLQYLAreiTNzLrzZuV1nc5GU573qYkzwguFClFor6twUiW8w4lax+XlfhUx63W5WHBDAyl1FedrQlnAZE4lhAaYiKHRuHYejlz/xEZ0LkD01o3i44SoqBy0Yx8Rsftts9Piepoy1NqSSJnyM1a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MJVrwvta; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24af8cd99ddso2633925ad.0
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 06:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756733250; x=1757338050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jV51K7A1stp0fFZW7EXTK5PI5DR7Ti0Q40zH30E1jgU=;
        b=MJVrwvtaoNMMxm1t6q5fngNeW2ZDd5eqYQARjEncR5a0wu3rDvOcpBpvmxD4lT5SHK
         c/WpEwSfLRgnki85pQWbT6mcbWXfAoPzeDxIg4a5sENAG79TJOacIiXy97GPrYT3Eczn
         oTu09BCOaVdAstqXZvbrWIZBD4b5fotDvOJu6ypd2akBHVYeUxjLSWrtKxNRCexdkBYI
         THJ1th9vfCunKaMH3+uTG/qI2THWIQpmDVmVd6jiy5R6YwS1XkH53FxthkT2TyvKgCNX
         K2FNQ+JVRSe7vLRZSNR7jgZyaVMKghfYIofPHf9iBKPg0oJymaDKbEXQDW9fhSWbe+0r
         WyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733250; x=1757338050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV51K7A1stp0fFZW7EXTK5PI5DR7Ti0Q40zH30E1jgU=;
        b=ROoXyPBDuzcNcqXAxgYB6h3pYe1O48JKhuAorglyHtqvjKL7BxqZXyg8cdrxsJAEH5
         MC5DsAqIUrhG4l4WlqonzTYt2/B3DS011Zufju78BJFrPvlrZUIf6vhNOF9CGeyn7qVK
         neWt/2842TpfOUhMtjhsa8od3UQ1pVTcIIxPlMTtD3gDlwxEbpfrGiwFElxwpBmm0EyG
         nG1kY9szQ8LlqyyKsEU6DYZI0rHQDJVxLiwpN8QZo1YHVvzN0AcxtKKHE7z123zzNoQW
         i1oWED1UN37J3D8om8rHFgyRiTx0KXLiTmSJjuwB3Im8BeYtt+bDnBEsKi5x289K/tWl
         TTaw==
X-Forwarded-Encrypted: i=1; AJvYcCUxFmYzdL16FVP/dqmscrKjIS5Gcpf/VKGObvXDL/q4xELzTZenmQQaVEhlTxFOdRe5XWgbGxjLTL+2sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqCxzRnzMgq/JW+Gb36FcyKfxlkgAzz6bvDJncUuhYPwXwbSyS
	zZCjIgYVHNeItoRbx36oXe2o3B/kUgIulCMo4hGqElGpJEkjlRjWzH8xRKRN7XsspO2Va098Yp2
	6H5v83DuF69ySZDtW8Ow0pyX5W0KvQACi2Dj4DOZa
X-Gm-Gg: ASbGncvCx3ngq519KhAo6BLtW5g0UJ3Qm8JdrTWwZ6FvgjHLAlq24p28hiVgF1ExHCo
	rXCuTTqK8oVuesMt+0f+xhS4aJjRcA5BfLZxmPjUA457MWCe8ujFC15XF3pRpd7wKGB3ISseaUu
	2hNG/WVFP5ykS4c7SSMT0cwVczZTL9qP9WIJ0VhHcHE09JrzYt6a0jVBewQNLT6cQibalf2Ay4E
	bhdoF7JwhmjsGl5BWO8CLMudspEfhZaYLd03maExgBoUezK91eiDaxKFY5ks0XP
X-Google-Smtp-Source: AGHT+IE69FGO0OzzXMwhaoMRS2q4IeFD8qIfXTVJo75C49xHY1FRbDwJQDcNEfx9CtcjyMh4JkjZAHZ3bTFwzj9tY+A=
X-Received: by 2002:a17:903:3c45:b0:248:f762:865b with SMTP id
 d9443c01a7336-24944b196e1mr101515255ad.28.1756733250370; Mon, 01 Sep 2025
 06:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901091050.1935505-1-abarnas@google.com> <20250901091050.1935505-2-abarnas@google.com>
 <aLWS9QsvmzZW4Bak@smile.fi.intel.com>
In-Reply-To: <aLWS9QsvmzZW4Bak@smile.fi.intel.com>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Mon, 1 Sep 2025 15:27:19 +0200
X-Gm-Features: Ac12FXzx9PEJF0qZBZJFJPWNQrrMGW9HgVOcnLKTWsob1RafNAi2Th3uDaSy3dU
Message-ID: <CAATBrPFnSnxwzBQTOdbt0h=epXW7G5Rj8Sr_erKKzUzCH6xC5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: atomisp: Remove typedefs for basic
 types in vmem.c
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 2:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Sep 01, 2025 at 09:10:49AM +0000, Adrian Barna=C5=9B wrote:
> > Cleared typedefs hiding unsigned long long type, to align with
> > kernel coding style.
>
> ...
>
> > -static inline hive_uedge
> > -subword(hive_uedge w, unsigned int start, unsigned int end)
> > +static inline unsigned long long
> > +subword(unsigned long long w, unsigned int start, unsigned int end)
> >  {
> >       return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
> >  }
> >
> >  /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xx=
xx0000xxxx]LSB */
> > -static inline hive_uedge
> > -inv_subword(hive_uedge w, unsigned int start, unsigned int end)
> > +static inline unsigned long long
> > +inv_subword(unsigned long long w, unsigned int start, unsigned int end=
)
> >  {
> >       return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << sta=
rt) - 1));
> >  }
>
> Also consider to simplify the above (in a separate change).
>
> static inline unsigned long long
> subword(unsigned long long w, unsigned int start, unsigned int end)
> {
>         return (w & GENMASK_ULL(end, 0)) >> start;
> }
>
> static inline unsigned long long
> inv_subword(unsigned long long w, unsigned int start, unsigned int end)
> {
>         return w & (~GENMASK_ULL(end, 0) | GENMASK_ULL(start, 0));
> }
>
> ...if I'm not mistaken, so double check all these.
>
> At least in my case the end =3D=3D 64 is not allowed while it seems the o=
riginal
> code allows it to be equal to the end =3D=3D 63 case. Needs testing anywa=
y...

Those functions works odd:
when (end =3D 8, start =3D 0) it affects bits 0...7

This should make the same results, will check twice if i not missed
anything and post v2:

static inline unsigned long long _subword(unsigned long long w,
unsigned int start,
unsigned int end)
{
return (w & GENMASK_ULL(end-1, 0)) >> start;
}

static inline unsigned long long _inv_subword(unsigned long long w,
unsigned int start,
unsigned int end)
{
return w & (~GENMASK_ULL(end-1, start));
}


Thank you for a review
Adrian Barna=C5=9B

