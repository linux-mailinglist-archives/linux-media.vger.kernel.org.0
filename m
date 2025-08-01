Return-Path: <linux-media+bounces-38732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B433B188F2
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 23:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 525875A174A
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 21:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69C7222587;
	Fri,  1 Aug 2025 21:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DI3rps9/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9F420C00E;
	Fri,  1 Aug 2025 21:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754085503; cv=none; b=FTe4CnRjYQv7bnfahc3Fe+7ir9JLW1LLW++6NDArI9aKr+UhzWnhzEJJyErAD0+mYaAwiXjBNfFtSwtnjvtcIddF2IhdDGPTIWptjm/BrBT9AzXnNxnnd4I+B7jZD6ltpKNIcZzJKiQGPooiBM8vpvgSNt3Hf9jKh6ILWR3CQLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754085503; c=relaxed/simple;
	bh=9W9aLRKcskQT2G+1SL74xY98V8kvoY+yZ4RYwLfO4lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rpq0iSgCwL1eVQrX1c9TbFHBwECkKYfTOGnJt93exnB4T4gpBQ4IFYvUQtNR0YC+ozyODkIwz5/Udg2vcb5aP1XU4zRpww0p5fkJkrWRGLNkINMhCt9kjuDwdMlxQoFrsYwkWggQo74Ey4EVbqNvDs0yAxnPsvXpWNeL2HSYl08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DI3rps9/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af910372ab3so519741466b.1;
        Fri, 01 Aug 2025 14:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754085500; x=1754690300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9W9aLRKcskQT2G+1SL74xY98V8kvoY+yZ4RYwLfO4lQ=;
        b=DI3rps9/qk7TYFb2iUmxg9mEZQV12DpuZwyvRRSL/tjzjolpBHl5HOPr1KYq5Tilyr
         vY/noGPlqi4qqCbwiwbEGjOe1xewNRCDHB+MhksyCorhcfG7RMJ71ctsD4w4gK5C1zz4
         ++J/bZnMZj4cT1NChuXSb8hAo+bXiqeAwHPoArsxKYE1hD1pdfTFirox0TomqiG3e43Z
         4kTc00ZQ9XN4s92Icoc7O5rTnfG9i06ffr9UIVRn37bsyfaa/rQ/3cQ75fCtwhKBRNEb
         DAP3mrxaQl1GbmYyihGekPmfgQQ/Xz2BYyzkZ6ZR0asyLDyyoKqmrciYv8RmHScjwEUQ
         Q9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754085500; x=1754690300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9W9aLRKcskQT2G+1SL74xY98V8kvoY+yZ4RYwLfO4lQ=;
        b=e3aVZgZZby4F6Ntez+/2BYg1nNtlOMoJHBZQjCfsKx/VpaxZZ6EYDxFGRY1Uq1JAHs
         1ZIoaKznsm2VfrvoclnPqFMIjLVEsUTsgj0HQQZUqK45Mdzdbz0y/24/mGUEMKOM7z8g
         srJ3ix4HwDRaNDQaAKp7ZpKFqPR4uFsAA8YZpldeG6QtmvBgYqjxGqaQUaur3AmJlEXN
         a5gRmVFNBrp269MOkYJb3mf+HuMPZww2t46RdUlFf3Sz71cCK3wp52MDnD/pmf9glJDa
         ZV5jH3B6uy0sYJhZx9/W5zK551llBjwqV4mO8861Frl/SUq/ogqTWOKgWz9ys0RJoRR5
         JQ6g==
X-Forwarded-Encrypted: i=1; AJvYcCV3Kb0dvNFX4YnWP9WNz5QH9slaLd02w69Vly2Mxt4kgdrmhr/9op5vfMPk6bGOeTrYwII99ra2QT0V0zQV@vger.kernel.org, AJvYcCWqWYQSinSd+cQG/nVwuL2iY3A5BYoGmo9suvYbKTQsqS61UWfOb/5pRdygB9KcBuAr9zpeFbrX8V8VtyQ=@vger.kernel.org, AJvYcCXVoqqWcuaO+WLkZOz43LQ7kcAZoKdgKOyVaFxTJZFR0g/4kMqN1chKj9Sa36nD1OAEoIekjagZKbjsjKOrjWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PSJxCfSdCioqsosqrwBIU5bkUFcPVyxnSxiUVDpZ1xVHdgZG
	f90OMHJCsQCXqGJAdFkm4eMBDYRYciy5UnPdW6Sjy5oa9qlUkvTqz77ZQgf+UOr3MaB6ri020q0
	HhlPn1JqDeBBj8ohkz35tWHhF1zi6Mv0=
X-Gm-Gg: ASbGnctNwiJVDX8Ue1j4+cYVnxzu3GxVUI+48r3jagDhFiHwgyNPJL51Zn8AeYw/2XL
	j2CjrZBf7TqFjPxN0RvDsK4bUC8Q/6kuZaf2Xbu19/1sbAK+Dipxof7cEEBCgl+JwNhUry2dn9M
	CkA8vsrrjglS5DQ4jdAisKe9aLx0wbw4I7xRpTdAkIYUWmkmprWYBLVnvLiP7MGawn9X6fAo5Yf
	J8GMi1sDBpggaJko21m
X-Google-Smtp-Source: AGHT+IGRVGVyVuPJT5g+alark4GxiU9Zv8r0lEr7ASyTvdvyElIxZVu7IYlNYR9NTTG/h/hIC6BKUMEQv7AJTLW61rY=
X-Received: by 2002:a17:906:6a10:b0:af2:4690:9df3 with SMTP id
 a640c23a62f3a-af91beb7837mr862906366b.14.1754085499840; Fri, 01 Aug 2025
 14:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
In-Reply-To: <20250801160023.2434130-1-colin.i.king@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 1 Aug 2025 23:57:43 +0200
X-Gm-Features: Ac12FXymuCoCTkN9AJAJa7gXREI0nQIfvbT-NIqpDvHhaI6WuM_cL9u36xBUzHw
Message-ID: <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 6:01=E2=80=AFPM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> There are incorrect %u format specifiers being used to for signed integer=
s,
> fix this by using %d instead.

Both of them sound to me like the fix of the symptom and not the
cause. Can we simply make types of the iterators to be unsigned
instead?

--=20
With Best Regards,
Andy Shevchenko

