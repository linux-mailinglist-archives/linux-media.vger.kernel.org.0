Return-Path: <linux-media+bounces-30564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC783A941A0
	for <lists+linux-media@lfdr.de>; Sat, 19 Apr 2025 06:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEE167A89D8
	for <lists+linux-media@lfdr.de>; Sat, 19 Apr 2025 04:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB4F165F13;
	Sat, 19 Apr 2025 04:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EU7oswLU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208AB13C9D4;
	Sat, 19 Apr 2025 04:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745038775; cv=none; b=g7V3H2BCtfMI2kQqcNfaabw8gb2ExZOq8Esl9gWgasvK0hc0RWGq6RFNurZXg4o2H7z2xV8p+K9v8rkuxDNSmTIzwbBsrsoQQy8VNXq1aPNkhI9GMJY1596LnJdzzn7dU/Li3c/lDRN/I9ot/VIEJ3pNqNx4P22hWumAXeyNp2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745038775; c=relaxed/simple;
	bh=qHZWn1UhqRvPf8+rwyKrJZXAu5Z3WRQeUL+l18ANOG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORW6bInhddDQXXP2bhai34eyMMPsXYwlayyOCqjO63rTynpNIunHdFP/0Gma2+rznU+2nKhjItWgmdX7ldN/vWqXGG+r8i0X0l/y2GXtaa2X10bhb+lOQUP1JhFuLz5hjicnqZ6HSIJLHQgx9xbP7esjHjNjt1+8Rt0JRvo2tko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EU7oswLU; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abbd96bef64so400492266b.3;
        Fri, 18 Apr 2025 21:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745038772; x=1745643572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHZWn1UhqRvPf8+rwyKrJZXAu5Z3WRQeUL+l18ANOG8=;
        b=EU7oswLULdSmgXbHZpUeRIZPWhgibwt9xo/yCjk8UlD6f1Dbw4OiEgH0q1FXsuWCfs
         KvXD7v5mbFNrJRr8FRMpnwVjPRWCGy9gTs8z/7r0bOC7kRRQO9HukSMZ8Yv0uOwIcVRD
         RK7//FJmRi94dU9i8aN92BHKvPhwIDU/D+CnPQMSwp0i+YJ5cJ7YIsHO9gGQkxUQcnCG
         OUiQe/H3AyW7tn40gpZVGjEuwHtUHI4x5OnvsQX6P90DbQtXGRSOJ7uQBFJtkPis4T0d
         Y6ekCBJZEXfWg0cNJdI3djYBi35wF+PVhCngRM6EEeefDhvBMU/RoCObMmxtt1pPQZ3P
         HYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745038772; x=1745643572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHZWn1UhqRvPf8+rwyKrJZXAu5Z3WRQeUL+l18ANOG8=;
        b=Jk8EMjHRvVYFPHXCgaWW0kpNDToVvTLkWnjxKde604DeBTPjwDtEbo0GdGnAgYu9IL
         w6ZETXHUlCzZHIyLg65ASazwASG89zFBk5PaCfYO5pTVebxLzfUQomr5oPGtNZLH0II5
         VzU3ggYXjaJj9amkMb8ChRzMiZjBsehynmVUfgBI6TnsTm2A1xWh2WHpbrMGbKPYpDg7
         vW7yRzt472occXJcAzO6BfmhYLi0Bz2BzxFOe7to/k6faX4iu1rg70DyRls0HZ3MrcH/
         6N2gfd/4ovC1hHp+2qLahTwSl0onzV2GYNpigfdcOimzfPgtErnF4ff5yRl0kZUokrLl
         AFIw==
X-Forwarded-Encrypted: i=1; AJvYcCUAw6zrzOAB0JcAhRdfewlXZRMvXqK3ACFA4db9Sb9GhYsiAkNOrNFpHEslFeHcmXzh0raaEpKRIeAU6Nk=@vger.kernel.org, AJvYcCX2/r59JWvJC9SWpD+GLmztSCNq1C+ff6GFOjtn4RSBetFlVHUMd20+fa6o+DY2Rn4YGwLKv40aFx6Q+og=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZac7l9BeqUw0uw/olsip5T6wAdbkGfmkMlqQwRbICgDwcrDcH
	gUeXZmNbD0UpiWgM2PQKkpyeYCZ4MRHbept7kbLotcXDeUCHDllhbsqFHMObe1pPzdtOt5XimFa
	+lke95pxZf6keu+Zt3U1QRhHe4OA=
X-Gm-Gg: ASbGncsbBWfTff5o8aYFh/OzWPfLYFnqSZnuvheoPgmF889mTjSiQJsIMmhKGgP909V
	dP0rxIYqGnYmfJfZ12oG2C5O1d+UgQn0yy+hL3a/bu5E19bryW68fY5Sxut4AhLCcCGcBQ/xKac
	BYmpGiaXyu3XyGKYHVdfAdKQ==
X-Google-Smtp-Source: AGHT+IGMkcYZ/YdE+K24G/+Kjd4y2a3YOIz8t0Yrf1XtL1usxdov64Xo9A55mQWRRu0uO6CZgIWYLz02cnfYBzj3nHE=
X-Received: by 2002:a17:907:608d:b0:aca:c9b5:31a8 with SMTP id
 a640c23a62f3a-acb74dbf0femr333405266b.45.1745038772145; Fri, 18 Apr 2025
 21:59:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io> <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 19 Apr 2025 07:58:55 +0300
X-Gm-Features: ATxdqUFN74IX6AOi4xAvzGjvs_88RQj1Pju-KRMnjUvE_gct6csdr-C8Sa_wBzg
Message-ID: <CAHp75VePHnr7fVnO43Vhc59_CQKQ1TfaAxzj3dd_t0nqvzFRdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: atomisp: Remove unused atomisp_compat_ioctl32()
 declaration
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: andy@kernel.org, sakari.ailus@linux.intel.com, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 10:19=E2=80=AFAM Hardevsinh Palaniya
<hardevsinh.palaniya@siliconsignals.io> wrote:
>
> Since its definition was deleted in a previous patch[1]

This is odd. Previous patch from you? The Link is to Arnd's one, which
is quite too old to be "previous patch".

> and there are no remaining users of this function in
> the codebase.

> Link[1]:https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd=
@kernel.org/
>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>

Same comment as per previous patch.

> ---

Overall I don't know why it's a separate patch and can't be squashed
with the first one. Whatever, it's staging and it's fine that we get
rid of dead code.

--=20
With Best Regards,
Andy Shevchenko

