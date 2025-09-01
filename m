Return-Path: <linux-media+bounces-41435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C5B3E3A4
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDC4A188559F
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 12:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B50332778A;
	Mon,  1 Sep 2025 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o3ABb0gM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534B2EF650
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756730821; cv=none; b=K/hc59XA9x2CDUx8OBu46ClEyrXV22xHglppGvxZwjD3qI/lFulC/a5QRhCgL+v5dNir3PKCo3Mr1HA8zRhlHJTt1C0N0YFcShso9PncK1UgZ82lpFrCfSs/TzpEV/Ekb/6cuCT8PYgLfw8Azd2f6X/QZ4Sk1/qgJNkhuI5+568=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756730821; c=relaxed/simple;
	bh=wvRHqi3dScj15IsjLi+ATrCVMUE7d9PpbVx2eGPnx4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpXUJycJDM+yK/pgYq/fk5w9h/zUwouK7kSQTTSoU+Emh+ewL7wokU0wgYil9iK7a3qlxocA1yJ9mrys8udcjEAJIwGgWE0AAQ9nbCK5BbuxXLemAOxFJeN673T7ujKgSVvSUvJg2mavIXXJ2dzLPi+3WNcuWHYHSLid6sGxCZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o3ABb0gM; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so4241191b3a.0
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756730819; x=1757335619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7y07yor/pAlX2cJEQqvfRVMWVvqV9hnsGNfw0TS32c=;
        b=o3ABb0gMorxpktNDLmFcNgXrqiViu8hI6Vrks+rXrRkdGfAjTgAyFYlrHIbzn7A6+h
         mayazLpXjjFp+dbZ23k+UwtBHt06A8Hvo1bEKjXAGEb5ICOjo1I5hcwupuXZVJK18zz/
         tyewI5Ld+RQCmD4y6pOyXyYWraYhGUTyo4dDrF7bMguhOkKEmRnxqeythECZMhmK7Un6
         YAnfCHiggvKD4PxKG1Qg9QO/38d+FYAb+BDAMXQE8kDS0DGwtXhUj2h7n4w41QKexpTy
         5Mbjj4ZAZQHACdTdHwGLrtOAjwLrBd4fb9aXRIOI9zfqwnvBidxhpNUzYC95MuKWvmSa
         1xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730819; x=1757335619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7y07yor/pAlX2cJEQqvfRVMWVvqV9hnsGNfw0TS32c=;
        b=cpjjJqi4EpQQP4EEGoAyXnNLBy5wFk/l0l/MrTf5HkfQCExH8/JhlJcNTAkw74VHSm
         Cd5ZhC/26EAtOA5WIw7nLKfNTsKXVQwUUlCWUfk/skzceRYDM2JltwxGSSntaVn1eupS
         yj+psCVyxfOfBAm2j+mYbirFMogphm30m7t2i+9bRJxl5qw6SwxJicMNftVYzfCLg9jP
         fu8zCVX+vdYjyPU5fmza5BA43dFYI1Pxnm3wdkBRSFkZG+uOFeS1EQ6QGmXE0PJC8bsS
         6/aeXSmIQ8Pm64N0xW0z7bw2Rkt/B9Z+Tm9Hkqu82v2NNhdB50Lt7Y1kHU4P3lPTbIn2
         jXFg==
X-Forwarded-Encrypted: i=1; AJvYcCWyPgdg9/AFRWwkv2gflrVhT02V0Axld5kgeKztFoxC3+Knqv1LF0M6Jv5csLLDafgSj5dVW9PKMBlV8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM/Yxb0ZqJWnGFS3gzUf5dUW82AChsoiDqLtTgD5FcDQPfP8uz
	KJxoPD+0+t3lMq7d1t+LfQ1objczeX3z5bs/zkz9Z+PQcZCdJpoO2iAZmMtATJ5K/ZHVjzvf7su
	C1G4KWHuSHhZ7wyJK7NSXyoO3A80sF+3I6x3mWm/8
X-Gm-Gg: ASbGnctqHclnLkJKnfU9sIVF/qC2rMHLZV6r1U5xZAAJVze3idtysxIFevkDMgYRF40
	222XftWd+09xYSngHMvTIpo4wJF/C90EYk3wIs+U3epu7CfBndh/C5wLf9ZM6FI1mtkmEtHTSib
	4U/TuqXzq9AK1+5WG0bUEnw5j7chFFx+irzgfNc9CZFxF1Wc4N2RntON9aafEStP3bo0wL1YerO
	Z2vQl+qPi4qz9Pm2v0dwCVP9r8JOiZ7qXibmqyO+za8xzJ87+6Tdg==
X-Google-Smtp-Source: AGHT+IHzcBc4YYJpeDDugGdalUGLmOoVhyxPLPgnjb0HlKXSlALfB0fjTWzTMuWcnleuXqTacq9sgKTJ1OxjVOmND00=
X-Received: by 2002:a17:903:4b0d:b0:24a:aedb:1915 with SMTP id
 d9443c01a7336-24aaedb1b81mr55675215ad.9.1756730819298; Mon, 01 Sep 2025
 05:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901091050.1935505-1-abarnas@google.com> <20250901091050.1935505-3-abarnas@google.com>
 <aLWQSAX1ZKg6IiTb@smile.fi.intel.com>
In-Reply-To: <aLWQSAX1ZKg6IiTb@smile.fi.intel.com>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Mon, 1 Sep 2025 14:46:47 +0200
X-Gm-Features: Ac12FXyc3n7Z0qCXdSTjDfMBIr2AbkPj7jLdgKKqBvKbDUlmPSbbyJWBW9Lvlfk
Message-ID: <CAATBrPHpLnsWb-Ua0z2Nmv7To_yXeosoV8+nGzcWfGUVPFq1Xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging:media: atomisp: Whitespaces cleanup in vmem.c
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 2:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Sep 01, 2025 at 09:10:50AM +0000, Adrian Barna=C5=9B wrote:
> > Whitespaces cleanup to conform with kernel style and improve readabilit=
y.
>
> Strange...

You mean the commit description? Should I reword it?

> >  /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[00=
000000xxxx]LSB */
> > -static inline unsigned long long
> > -subword(unsigned long long w, unsigned int start, unsigned int end)
> > +static inline unsigned long long subword(unsigned long long w, unsigne=
d int start,
> > +                                      unsigned int end)
> >  {
> >       return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
> >  }
> >
> >  /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xx=
xx0000xxxx]LSB */
> > -static inline unsigned long long
> > -inv_subword(unsigned long long w, unsigned int start, unsigned int end=
)
> > +static inline unsigned long long inv_subword(unsigned long long w, uns=
igned int start,
> > +                                          unsigned int end)
> >  {
> >       return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << sta=
rt) - 1));
> >  }
>
> These two were just "fixed according to the kernel coding style" and here
> again. This is odd.
>
> Note, the style after the first patch is okay. I dunno what's wrong with =
it.

Those were not violate the kernel code style indeed, but it looks more
consistent this way for me.
Should I revert those?

> ...
>
> > -void isp_vmem_load(
> > -    const isp_ID_t           ID,
> > -    const t_vmem_elem        *from,
> > -    t_vmem_elem              *to,
> > -    unsigned int elems) /* In t_vmem_elem */
> > +void isp_vmem_load(const isp_ID_t ID, const t_vmem_elem *from, t_vmem_=
elem *to,
> > +                unsigned int elems) /* In t_vmem_elem */
>
> Please, (re)move trailing comments somewhere else.

Those comments are also in header so in my opinion we could get rid of
them here.

Thank you for a review
Adrian Barna=C5=9B

