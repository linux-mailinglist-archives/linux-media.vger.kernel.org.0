Return-Path: <linux-media+bounces-36146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB6EAEC46F
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 05:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 747234A0FF6
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 03:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224F021A94F;
	Sat, 28 Jun 2025 03:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f44yNolg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C933136A;
	Sat, 28 Jun 2025 03:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751080622; cv=none; b=aTBgEMHkvmoF5FyNqO/bBU75C60dY51HrSD3/KsppDwldz6IHOyIRZ+9vYKjpRq0tOryyrhj0xTyxWIpeSREhfmQOGlsqU71NF/HyMDrE4FhFler5Ehk0cHG6CE86iD+iDLNOI0aSdtjAKT1HckkZnwu8cxVONOO143A7qsd8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751080622; c=relaxed/simple;
	bh=6mAPUo5M30mh/gfv/HY1yAxEErHGF9CWTrvu3RVcfe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owqNHpGciyerwLnvSvupkQyyzgZjiIVS1nGQO/bVvL8MQhwrD/gMsc9ILU9a3QHLRdhpMiiZAyqRavUEfwi3W1VNr2CaUltpOMHLHqID6wTTl1L/eW3siOE/ijcQhNQXs9JJe+4QMWH/hgB1xoRGAgyzjp2bKQTSwa8PjqbG+Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f44yNolg; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0df6f5758so70899166b.0;
        Fri, 27 Jun 2025 20:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751080619; x=1751685419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9dPAwsn+P9UsNtzqpwYoo0ORtcX9rmxgV7CliMPtZM=;
        b=f44yNolgOnPM4niuN40VPwPzyxLYXcQoOhMsiO3K7mvp9rw2D11WGi+kcT5vmKS+sJ
         VI3Uqjn2wEOFUzJV0u6MSBCA+QzUg7CgZIFOQLRIUMxjpFuqVAE23fo9Lnc7Jy6X/Zlk
         HJB3wPrF18MiOrdj/Sy0F1787gilsY30nFX70ySlFLaSStFs2aDrwqw/xGMnFDiDb1Nm
         HWBtyCKDN6X+JmtpPE1pbjm6NlQ6GJsHeYm5QC44qisYmMoppjx6gItywybLLMlQJsUH
         vk+h0eCmN9vZi72sgGfRmPq6o7+FXKWWt3YIHk6gj9o3AQuBGdb1km5rOdPjaFsR9yp9
         MTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751080619; x=1751685419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9dPAwsn+P9UsNtzqpwYoo0ORtcX9rmxgV7CliMPtZM=;
        b=rjEmmnsQjDkPXXClkYzF+tUnlax9wIXXkBWfgNGPO/qDBFS296X7rrPY1/ok963DWJ
         BD2McjqdkWNLIXafDqwcuoLK3Mr3qipRCG8i1994M4V2znBTsvbhG2C1y8NHLp2VacAf
         MZQcPxkVSUSe80eW5VMCUR53vBFeixvvEKvgzJqakEetPK+IdinkVreIfHShb1D2fj80
         IPX5NuYDB3y2VoJQCqAMHwjz0s4x4JZ4ijI8GUlBSDoNwVtSgTC7GkSxJ6tAyQmoxU0Y
         9AXdnl2v4JzCvZZg6y1sCybY/6oz/ydNtNxqoDmkNb3i9QoSL+VwVCt9nOZ/VAP6mxmv
         oZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCWAQvbFZ+AF6fpi8SnteN0i0g5oJTHpK0gelwvFAhve7uIkV8QiiDLJh0sE5BULD1tXpSIwE/SkpKKqZQw=@vger.kernel.org, AJvYcCWw9zuCjXPgeGn7bcXTW+2vUL1I+fsFBdF5hHVIO0OI2iJJr/eH7wzHgh6BYILssAbFlhew2tGbUEXeCmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTTz2XqR7NomaWxZ+qm9PB4esW3tPN7mDgT1to4OyaUeqEnBkZ
	DsetrKgzsuppPuViRbolBySZ2n4K37g4GY7K3k+gNic04GhtXeDb3lnT/z/ZzJmeuVsGHYydry1
	SEVxl/PHZZSzzOLfGlQ4j2COSRxtDm7w=
X-Gm-Gg: ASbGnctNF0kORYiA5VFbDQ7WRZH2jJs5fe3pgy5WXvr88zOFubStayn0rGoQgEaj+GA
	wXHoQW2qfq7c7TtofjPGqG2L7vCgojFe98c28Q+jDsJx5R4QHKdv3DI/ELs5u8/IvcWPuJ2KuV4
	C+2SBE0AkSahF749Wk3D5JSyHXhMwQCg4iAmKrH66oTVWD9g==
X-Google-Smtp-Source: AGHT+IEteJajU9ian7N9eS7scey4zLc0G1Nzpgd7jSI+mWoqHjDGRUZ49Gk9VxMXNJBvOtj/Mpn85MpDdpYDRfRKTW0=
X-Received: by 2002:a17:907:720f:b0:ae0:c86a:12c2 with SMTP id
 a640c23a62f3a-ae35018f413mr583112166b.53.1751080619216; Fri, 27 Jun 2025
 20:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com> <e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org>
 <aF7EEAxXsurLvIt9@smile.fi.intel.com>
In-Reply-To: <aF7EEAxXsurLvIt9@smile.fi.intel.com>
From: =?UTF-8?B?546L6Imv5Lie?= <zaq14760@gmail.com>
Date: Sat, 28 Jun 2025 11:16:47 +0800
X-Gm-Features: Ac12FXxsU5dpiPb917Qnz6Mirm0LCeuQaVZZ2cq-H5v4MpNZKgpLGFZPrQY3-yk
Message-ID: <CAKEtaPCibkPWtkRi5xJr8__jzsoPwrrb7LaG3p7_kTK-R5p6gQ@mail.gmail.com>
Subject: Re: [PATCH v6] staging: media: atomisp: apply clang-format and fix
 checkpatch.pl errors
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Hans, Andy, and all,

Thank you for the detailed feedback.

I understand the patch is too large and unreviewable in its current
form. I also see now that splitting the clang-format changes and the
manual checkpatch.pl ERROR fixes into separate patches would make it
clearer and easier to review. I will also avoid touching any files
under drivers/staging/media/i2c/ and any other parts where future
plans involve rewriting or upstream work.

For the next version (v7), I plan to:

Separate the clang-format automated changes into a standalone patch.

Place the manual checkpatch.pl ERROR fixes into another patch.

Remove any changes in drivers/staging/media/i2c/ and leave those untouched.

Ensure that style changes such as macro alignment or tab changes
respect the existing code style and preferences.

I appreciate your guidance on this and will prepare the updated series
accordingly.

Best regards,
LiangCheng Wang

Andy Shevchenko <andriy.shevchenko@intel.com> =E6=96=BC 2025=E5=B9=B46=E6=
=9C=8828=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8812:18=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On Fri, Jun 27, 2025 at 06:05:08PM +0200, Hans de Goede wrote:
> > On 27-Jun-25 4:56 PM, LiangCheng Wang wrote:
>
> ...
>
> >       for (i =3D 0; i < count; i++) {
> > -             err =3D i2c_smbus_write_byte_data(client, reglist[i].reg,=
 reglist[i].val);
> > +             err =3D i2c_smbus_write_byte_data(client, reglist[i].reg,
> > +                                             reglist[i].val);
> >               if (err) {
> > -                     dev_err(&client->dev, "write error: wrote 0x%x to=
 offset 0x%x error %d",
> >
> > The original line here had a length below 100 chars, so it was fine
> > and log messages are allowed to go over the length limit
>
> Actually I tend to agree with clang-format on this case and that's why:
> until V4L2 becomes less pedantic and fanatic about 80 characters
> limit, the 100 is not applicable for this driver to be moved under
> their umbrella.
>
> > +                     dev_err(&client->dev,
> > +                             "write error: wrote 0x%x to offset 0x%x e=
rror %d",
> >                               reglist[i].val, reglist[i].reg, err);
> >                       return err;
> >               }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

