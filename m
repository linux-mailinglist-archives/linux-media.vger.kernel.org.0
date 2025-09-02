Return-Path: <linux-media+bounces-41588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E252CB40223
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05BDF189CDE1
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427F92DCF58;
	Tue,  2 Sep 2025 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WrwYiCTC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475AA28031D
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818669; cv=none; b=nLx+fcUjmo5R9dRj+GvYbHUAnk0stZ4kIAZHLUkf7GZOoQbogwWLcDJNcu0VW+U8Y+L0QAd9GUe4PlbSKTib8MooJQsfxnhZ6zQVtKxHpkBKolP9/gRk6veV0Z9tfz1SCiyCAihw7fh9dUNEyBrf6IJx9YgntHLVeb5++RMvQXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818669; c=relaxed/simple;
	bh=a6+7H71onDG4ZfaCBC69FB5SY12ev/7tff0d25FMAG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQbZz1hndvO2nFmPn3pOJtScM08o8vNeyIZMWCVKrT7EWFzBkHgef4XF1sExN5qbcH+Su4Bav8+n0Z4C49KTIzDVYu/nedn7lovhKMKcaE0/oLLle8M9jGBCteQkTHPzMwq6G6ptZcAonT7Rn6iVpE/Ra4tOi/X49X8nrXS8lCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WrwYiCTC; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4e84a61055so1613700a12.0
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 06:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756818667; x=1757423467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rm8LYWgbBbSoxzsUxJyqmS94JWyK2thOVWLaY84JeS8=;
        b=WrwYiCTCGAvJoqUkACxFSAvaOAK1GOH+8zPJFwD/tJD774Fw8WQwHKtDnm6akDx657
         Dh7aFqvU/h1yOy+7b6+vEDQPDzvAVdF8RtiCpIBaLLFdUNTwr1EhjJAt6bN+dHoCRE63
         h3nQHod5hLtAxcVId3lcuKv07lzqyvxC1tW610L5r0ZyoRdUsi+snlT0nY0RIF2xntU0
         pWIj7CZMsYrCp1XG8mvg1RSk2ifF6zC6g/ckPzMXTIZ620hjfdC3Y5bJOqlC8r44qpt1
         fvoD7Q4D/fGAWBHVhbo+euC7hIn6VoNsDM4CqUzlk+QraRDnuj68sngJC0z5IB+GNwfU
         LTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756818667; x=1757423467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm8LYWgbBbSoxzsUxJyqmS94JWyK2thOVWLaY84JeS8=;
        b=GfHt6I4rCi2jknWOriICCg7p3mHFr38Pznnk9A77pHh6lwFhwx1Xn2nE6mNXD0Ifw+
         IMuOJ4rT7PPqXEyxgZpHo3Cr4GeVFzcRApaVAw4FI1N9yB9XSkZhmbkGMoVg/KVPVJ9H
         2wFEMQcYfwToBj/zh2WRGJr4lvPe981qLNnLhR3mbXOeGICZ0JRtgSjWHB+pHOTPTyej
         N2IC+9TRjlaMVO2n6Sgso6nEFRqZRw8ZSGScEpHe6IYooUXRcDzJ0jp52w2S13K+9PQI
         lEDDkZCKTHVQICRkI6yefhdjr5ndWQ7CpfACB7Lvv8BR6LwiJcPbdXn0+/PzoeiZDd/i
         OxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqaDPug+GKd5nAGJJjSU5O2SFwIS7pcx0otn9NQ/alJMdWJpVGJsMGxG38zU1G/Z/zqae/90jqiR4O3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4szct/6dUYwqmfeadA6tl0HVHZNq8pUcpmFETxPN9gBLrr9wG
	aSr/ErExvx2N0WewZFhK+m9+aSdzDB9hgrWNuERVMAbHY4MrZrjLggtu3jIh9hofnXRG+g72mz7
	87vrmPbpvUf+8KyuJTF2ydxGWALT0Sufjv0M5+VfB
X-Gm-Gg: ASbGnctdmIzQKLKuHeOuuRT+M+5V4WxFume63cahaZ4/i1ViIAKRt+3xHINobLP4eSc
	VxHUGyI2TVBtI9vMH45eEynvYBZCG1dQrdJHeSM3Q0E642QeeKW/70pOMXPyGve6X4UexP4q7hT
	gyraRfvo+s/NlzmRVYsSO6uhXAWqLO7Dqax5nZqH7pZxQ5f8yvRRTNuuIGV7nHFyG08nViyxKpj
	7PGAI9cm8zmXdGmnrgISLyAf257KkTRU+lQ
X-Google-Smtp-Source: AGHT+IEajt5n7miuhpVNgaVc7Q6fAs6vdDGW7Ft6PJ5otEsVyTncI7dUQga6YoFZNasinGVO2qLjbv1bEw5pg8a7acU=
X-Received: by 2002:a17:902:ce03:b0:248:cd0b:3454 with SMTP id
 d9443c01a7336-24944873445mr133817985ad.9.1756818667376; Tue, 02 Sep 2025
 06:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902073841.2338568-1-abarnas@google.com> <aLaypTjukJJloGuL@stanley.mountain>
In-Reply-To: <aLaypTjukJJloGuL@stanley.mountain>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Tue, 2 Sep 2025 15:10:55 +0200
X-Gm-Features: Ac12FXwTsBas7UmElXIeqiXIRz_1zSROWnkOhZSndPGsKtOskJgJVh0CaFvpYhg
Message-ID: <CAATBrPEsea2GfK26W5eg4ZFm=hJLO1pLNax85vvXZ8hb=iGaFQ@mail.gmail.com>
Subject: Re: [RFC] staging: media: atomisp: Simplyfy masking bit logic
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> These are supposed to be opposites, right?  Subword and inverse Subword.
> You could dress them up to make them look more opposite.

In fact this name is misleading as well. For me it should be named
`clear_subword()`. It is zero-ing the "subword" provided with low and
high bit boundary (start, end), to be then easily replaced with binary
or operation.
And this operation is not an inverse of extracting a subword using the
subword function.

> The problem is (and actually with the (end-1, start) above that it might
> generate a really bad code on some CPUs, so I really, really prefer the w=
ay
> when _at least_ one of the parameters is constant.

It would be  easier to create a bitmask sing GENMASK_ULL and just
reverse it but if it is not safe, this is what looks fine for me and
works the same as previous function:

// Added a helper to create a mask
static inline unsigned long long subword_bitmask(unsigned int start,
unsigned int end)
{
        return GENMASK_ULL(end - 1 , 0) & ~(GENMASK_ULL(start, 0) >> 1);
}

/* inverse subword bits move like this: MSB[xxxx____xxxx]LSB ->
MSB[xxxx0000xxxx]LSB */
static inline unsigned long long
clear_subword(unsigned long long w, unsigned int start, unsigned int end)
{
        return w & ~subword_bitmask(start, end);
}

Best regards
Adrian Barna=C5=9B

