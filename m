Return-Path: <linux-media+bounces-35535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 015C7AE2B31
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 20:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A9031768C1
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 18:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DE626A1C4;
	Sat, 21 Jun 2025 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqhWYUlH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2015318BC3B;
	Sat, 21 Jun 2025 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750530423; cv=none; b=Kh/3j2I4875uaQQSSghpmu86KnH1ik57XK0O2igvhOiAMm4Ce6rg5ZKjz0+ferADLBqNKzasEuOoV5CNq0lvcc2VUdVpEa0LMsUWfzKb7NlFmCtvsjbSWAAYmoAevjShIBj8OqcW+Z0ECpNEDgoSYlEHbO5AJIW8jmvD8o3cEzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750530423; c=relaxed/simple;
	bh=U9YZoYYImG0JaaXjf+TZhZLctBrJrquR7CQZjMxBEvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifAFIrfAmdjnKtkLbNMcUUXmM4v2RylkjLEu8itXSEcOpL+iJL32EHxopM/aGw+j9OcBDiOarqv+0SdBHmCmq2jPpFJaGJyKkbwxzB4yDj24YMdacsl0c1fVlaaDso4Pt2CNWRuDzMoF3dyHaCM6uqDxL+u9hFD3IX0pe2ehW88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqhWYUlH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so584979266b.0;
        Sat, 21 Jun 2025 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750530420; x=1751135220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpscXX20zvGpci4UxXWKpwL6hXgbJYya1UIZqa9ZRN8=;
        b=ZqhWYUlHzMBC2yGxTK5Iqs2Z5qL8VUwxmD8bstj6r5u3QwGhkM+SHXLIYhXhzq+ViU
         ngfto8lT2n7EHRdsVD1ffaNs71Uy3j5vqKvp+6+jyCfg/zRN6kj9Dod9gUHgxo1HRPig
         /cojv86CxQbowZmaJ4EcDtkqFJ3BWdjdznaLtUbYea3rGIkAGZRqOy+hawQzsuw8iDSu
         mLli6rqhhA+NH6AcCZaZ4FegDv0BYeiAB99sQoJwkZk+V6bglhvdb4iw8098i/woJ7eE
         2rqvcS2gVtk6sI18jbCOwQpNni8XOdYt0O/cxABASDOtZAHweez+kFBmnlql5DOmttfw
         e8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750530420; x=1751135220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpscXX20zvGpci4UxXWKpwL6hXgbJYya1UIZqa9ZRN8=;
        b=fALEP54xQKgTgv+7rQ16jQ+7/bcp1Ka9vZQZ5J791W2dXxdQRSRp0YZbIyu9qmy0IY
         1XNMOhC4NnPbwoyVJaayTxvuM6McEDPM+nvrJu/g3uf6wRn4sEUCzKJTUlMFviyNqUFT
         qjkGyKfdCo7xsql2yGbbS6N7Lw2/USxWVpMAWzkKmCTnjPUkMsih+tuP2ByRPRPD6nXQ
         xSXrh5gdvRsNFMUckCk8MpcY2/SdE0F4i2nyCl3Khs+ll1sf6/XnkFu78QkJM/vHX9U1
         PhbqMOI/6V6TwT2P0pIWYy0aVwQSySm9MKXaEr7jGRr3q7L3pfZaDJEUT6ht2EoSPuw1
         xr3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkh03p8Sba8jXYMGz6OTrW6nhSbDV0chrAeD+Y76eP4Vs8Y/7kR1d//ejd/gyUklCmnaCT+pQNY//acWU=@vger.kernel.org, AJvYcCWxZ263gzhkytuDr3/SSeK04h6xL2ah4Gzod2tK0J2fONKj1uk28X0tSlAlHRfwIqhzBTvos5wDLbWxJ2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydv/ds1tc4fYNDU1oqyvwqVAtTpr9Ns6e/c5l02LXxjvMLArw9
	56p9J+9q1xCuaLzw1s2rMl6nRC5eDFCy8kh7Gm4UF2le23bowLeeWbYtlA5y3ZJIJS31xjBoJ3x
	9EwmeT8bvTqZwBmpsstuld+gGO+6HTn1DB/9DxCc=
X-Gm-Gg: ASbGncue+g1IvKoKlon3GJlC27amra/uoaFxI2OmKYRsM2NYvKrqv3cBH1MmyYhkb01
	5H9xnf4OrwTbOyhWVJ5KfJ+u7HNsRvNBayEYUJFtYuuE02VWW7x+LHUHCwi9VhyT2RRUWGezuu4
	flORkOoIZzlKIdfw0eka4F6nELyyS05Zvtixrkz/z9hvU=
X-Google-Smtp-Source: AGHT+IEHRptkqa+LGu4XawDI9fo1KWyDHv5bRmJNTBeBg61tk2jM2Adf8P6lwsID7iXnW0w7sSxC/nB1sBA+Dhnmbxs=
X-Received: by 2002:a17:907:9603:b0:ad8:9c97:c2da with SMTP id
 a640c23a62f3a-ae057f6473bmr662798966b.40.1750530420340; Sat, 21 Jun 2025
 11:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621-bar-v2-1-4e6cfc779614@gmail.com>
In-Reply-To: <20250621-bar-v2-1-4e6cfc779614@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 21 Jun 2025 21:26:24 +0300
X-Gm-Features: AX0GCFv2R4o5HgTkGeyad_hvoppFVtnZrW6opZBkdmWRJfshAUZag9Jj25RzrnQ
Message-ID: <CAHp75VdHAYvTHJwZs0NL5uHEkUtQ2Gyp1Y5GC5JY68h8XS7pvQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: fix coding style in ia_css_output.host.c
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 5:32=E2=80=AFPM LiangCheng Wang <zaq14760@gmail.com=
> wrote:
>
> Fix two checkpatch.pl ERRORs:
> - Use tab instead of space for indentation
> - Move trailing statement to next line after if statement

...

>  int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,

And what about this big space between 'g' and '*'?

> -                         const struct ia_css_output1_configuration *from=
,
> +                         const struct ia_css_output1_configuration *from=
,
>                           unsigned int size)

--=20
With Best Regards,
Andy Shevchenko

