Return-Path: <linux-media+bounces-48641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8390CB69DE
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 18:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F356630334E5
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 17:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2F9307AF0;
	Thu, 11 Dec 2025 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PPZoVqsE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D066630F922
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765472622; cv=pass; b=E8UuRAawXvW1XYo5Ra3XjBIoeDGZNWyUKFcgG2p6/tshFHdFv9j1jbVNMm6uAVV9GPhaB5CzFns7gmoQPxS1iHYosA6whaCEOxLzMG5+8Bli26N+qs5ffUvG06aRsWFrjw8VZnqOyUO7e/46QuFMPNN19FQ1uvkfM9GBaU4DsDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765472622; c=relaxed/simple;
	bh=dhK4Q7kDIu3zi/kAqk5vEc3dRn/z99FEvKqsdSQw3vU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLy2wM4rdk4aHSXRwwMo2VrL+KVy2HMSWwPrplek98BCn0UyBuL2hUsjblJ14PSrwOxBFkQ/0r+PIvN7NpNzMVmOAoG0mwG4TzuLOzm8BMKqdMa8oFrFsPmus6Klbp0A4+7gVSANKsqBOZfyk4iae++0JTckCTLKZWhnAu/lG60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PPZoVqsE; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64969e4c588so11717a12.1
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 09:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765472619; cv=none;
        d=google.com; s=arc-20240605;
        b=T62KOG04F79sjMtPrfDbIAH11n50uOlg/m/iH4tkhYsH+pQ2Cw7jro7U5h2ojwU5zw
         hBXkf+PkL8Ulhix7VlhLhxFfJ32DJjyepqD+thwIBYtO8BZx5JRXOZLUZYbT3DxrZQX1
         reR9lsmqVeuoNkZspamShjxXK1p22UxSf/Oyf8hAPF+Bqejcn5j7pc4bRSMjAciYr8NX
         B+csGfjXZRz00FqDthUPI4YhPXS+vHZl8A0BwpLn1OeW7FAhbCxC1Z1sKXFxxDZKXzY0
         1tSQyuscKsJ/1gn2l+ABI6G5zfZ77PCtwOaH8dWZp9S68mUGs5QCSZpaFh7dY7ABhmSN
         SBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PVdcC9AVWtN6X0R2G6LEfvI3W7plOZrvAmF1E2ynVb4=;
        fh=PdzOFGIxzP8wvq/x2ei7LGH0LEm+V4u3fWKJc5TOkyY=;
        b=Ocd1/1Iyp8JUXTad9qCSFgkEYlCSzFVWa3ja7RNQhx1ihE1SX0mvSazJDBk3MS6U5b
         TyP4hjhq7g2r97nWyPV3sLOUN4SDMl08CnYxU5P1+VTIF4z8j2itPRbxWI2XzOBJQ+gs
         Mb7N4TAJCYTCtEZvomuHVHoqXVnxK1PasE6//yrJPyfxS1FgLPDJmaVxkpxgHHqnqpDl
         k6BNYd9RE5MdQAFujr5ZeCBIRwKpSCW/0fLsM/yBS1Cm/TuBRb1PiVSQIwnns8orhWjD
         D+BiDBSGgUZ1z96b4/oS4PQWpAHeHbTUOaRx1gUY2ZVI5DvI9KhXBroTrcxsVoxpUYb8
         8a/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765472619; x=1766077419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVdcC9AVWtN6X0R2G6LEfvI3W7plOZrvAmF1E2ynVb4=;
        b=PPZoVqsEZhurkULXCRc7AZUKzcXInkbTplhWtlxNZQ1WXEXlWBz8AVOTi4zSNj/rtb
         +AGcVOuDKhLCmcbrN/NOWYaypGHfvuI42h8qoGlk2BD4buODzmRBsdckMLATAqNJzIDI
         V/MksXyDFHSGT6ulp/LmXtj5AuDm9ZZHap6IeCz0E37BBkxXC9SRekqbDTzroKAhIuSo
         bsqK9YIRqfqrOtWB7wdNxeGZbOBoB04g+1xBzaN/bP16JET6+/7kW1jKCjLP/ix3Pmkj
         OqOsLvgizq1cpQZtWLU8hbA9q0qAgTULxKb9Am/XHb1LhFMVxK896fzzWS5s55FhXkXk
         3MOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765472619; x=1766077419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PVdcC9AVWtN6X0R2G6LEfvI3W7plOZrvAmF1E2ynVb4=;
        b=cEdYEvDRntj1LI+AFJAy+UJZvJMA4HY4IkPECUTJZQgWN7tdu2Cv0E2rELGuDcHzWf
         h+3EXqS/es/snZosdONr/2cEElKi4X5yp76u8wB8FVJPkB4q33vTp5OWRBMYtTp6+5+9
         0xD4eLCYpR8wtoiBlPHI8v3zhcpIQLU0y4jZsAydj64QXl7F8V033wFXa02B82DI6M/m
         1RIG+fWdPd+IVO5gk453iEIHUfvRKz73koo5TWEie8P8boE3OOla4eAMxEvXX47r5a+7
         MIP12dlFUAe0VnyrBvWswLnNM2jwfxh6GOmC9LWNHaTi46Fyh/0NTpLSFoTPEYXd/aJy
         Iu/A==
X-Forwarded-Encrypted: i=1; AJvYcCXhV/jU/yWSFLJdChiZ+c1WXU7s5ggkGXWCsSsJtjnsIMLb4sYw1NbdbEqE+Da92Z4sz6sz/NJs1TsQzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkDbeFgOQ/uewxZ7mu/qjxKU8ZQJUJdpR064UYznKsaXg78EY4
	fR47bDGDYBOreCBnw749ThO1c+KaCCX+C2tDFoTq5TO75UwpVYTod3diUe7CE9au8uQm7wzqqod
	Lu6KLYYtb+428MGdu4NEe5x2dZ48ehaGJHCQ1v8/j
X-Gm-Gg: AY/fxX5zhzokEbb3ihFonDlG1GkhaTNL8VqpFIyX4Q5KYeD+40L/GrMtYP1o9GroA3g
	pJanTdF4xDJuSbNFqa6P/dVuFXVc0oAEcPKLUqoPruN+AngdqB+C5u0uzxjlYqzVeoeDRQFt+ae
	30qAPfnJUTxa5cVOiEc6C6yB6xHzgfLisPxbzlM+U8tgON273qS2s5dvhqSFjgWe+CuXbPoq/Dm
	cWffPYqWWKuwm7euL+uf0HohtkTgJzaEgRVhLhQAmIbL8MfvILx1SD7SUuXIlqDSH1XL/QrfeZU
	oF8=
X-Google-Smtp-Source: AGHT+IE1/twXkBw6T9ZDd804UY8hfxB7e6+cB8iDcmq/fCjHoXaBhqis+kpZHtSWJX+Enpr6HBPUEcW+9sWfx502HIc=
X-Received: by 2002:aa7:cb82:0:b0:645:21c1:28f9 with SMTP id
 4fb4d7f45d1cf-6498600598amr51468a12.17.1765472618955; Thu, 11 Dec 2025
 09:03:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008033844.work.801-kees@kernel.org> <20251008035938.838263-3-kees@kernel.org>
 <aTc9s210am0YqMV4@agluck-desk3> <20251209001139.GA7982@quark>
 <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org> <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3> <aThqcq0iGge1pQCr@agluck-desk3>
 <20251210010020.GA2522829@google.com> <aTn0WdVv-S_EpQmS@agluck-desk3> <aTqAxfiVCR2ch4I5@stanley.mountain>
In-Reply-To: <aTqAxfiVCR2ch4I5@stanley.mountain>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 11 Dec 2025 09:03:02 -0800
X-Gm-Features: AQt7F2oUBa6EQ75AaBiCKmXyExf-Brdy_futQsfDUwAYhQV22rWe0uokYAyYkCc
Message-ID: <CABCJKufWw4VQA_k6Deuf5Bn6401cbYv_St8VV_0-LAau6F0nTw@mail.gmail.com>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL characters
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, Chris Li <sparse@chrisli.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, 
	Petr Pavlu <petr.pavlu@suse.com>, 
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, Malcolm Priestley <tvboxspy@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 12:28=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Wed, Dec 10, 2025 at 02:29:45PM -0800, Luck, Tony wrote:
> > > diff --git a/expand.c b/expand.c
> > > index f14e7181..71221d35 100644
> > > --- a/expand.c
> > > +++ b/expand.c
> > > @@ -535,6 +535,8 @@ static int expand_compare(struct expression *expr=
)
> > >                     expr->taint =3D 0;
> > >                     return 0;
> > >             }
> > > +           if (left->flags & CEF_ICE && right->flags & CEF_ICE)
> > > +                   expr->flags |=3D CEF_SET_ICE;
> > >             if (simplify_cmp_binop(expr, left->ctype))
> > >                     return 0;
> > >             if (simplify_float_cmp(expr, left->ctype))
>
> I'm not an expert in the C standard, but this feels correct to me.

It only fixes comparisons though, the problem still exists for other
expressions. For example, while `_Static_assert(__builtin_strlen("")
=3D=3D 0);` works with this change,
`_Static_assert(!__builtin_strlen(""));` still fails. Perhaps there's
a better way to fix this than changing each expression expansion
function to handle this flag?

Sami

