Return-Path: <linux-media+bounces-30903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEFDA9A477
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BEF4176365
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 07:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C2C2080C4;
	Thu, 24 Apr 2025 07:37:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3CD1F4736;
	Thu, 24 Apr 2025 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480221; cv=none; b=G46eFptvbFDZOcJuK2dMFGLtmB0gWyKREhth0soGR7OsX4a2HnADsMT0AohR0fbPGVl+IdENLsQZSRolqCfd7zJTiu+aFMLJ+5QN2NiJLxZJdnUmAMpEdr0mX363zt+/PiCMiX2SbmqR9n8wDJl5hh+z3UGrQTMLkOHglkGk/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480221; c=relaxed/simple;
	bh=tZBFuHNqbZhb2H/3CAcXJdwpckqNkfiym7GWwRfaOwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWatwPKt8uQZQ8j9mYMGhF60LFi3rkhivIEX8gkuE7CR5XEFCTHyCvclr6oY9CVOhdiam+1+cRM2nI8IJZHjguFSltroMw7x2bLV4sVK0gcJyDd7nMnF5X2A4oXRCietQlqxONdV1KAY/QqxdNnqRdxJswriklRJWuzXnKziBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86ba07fe7a4so719727241.2;
        Thu, 24 Apr 2025 00:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745480218; x=1746085018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDUiICoejbRnCSysgoRYEQvEcNomvYDTM59S5WQew9Y=;
        b=vAfhpmgeOWoKuqWFha7Y9amqm2H70/KyrImH/kcwF0tKWac8cgvsbWJQCl6xelsnzw
         jpSq4E3TZEqPfiXQBLCBm/Nl62frqkbUzqrILm+hsWQJ009NFMsuIPefDf0TB3bK7vY7
         hrSqZwbRBmX0K58TQSwBKZiRYqZoulvQC07UQb9hU6HlT2043HebxW6B1Wm0+cApdtDE
         YyOOlwJhSqXbDxl98gPVWTxixFm4L1afUIB9LEt71CLdPpha/Zzmt3VJodrOpp4DfUfn
         FBEGk0NxqcI5O1c4qeCaL37Ex0HGL59YRegv+bHGB5pI84tlaw4Y+agEE1nqhE9t5+JT
         7RGg==
X-Forwarded-Encrypted: i=1; AJvYcCX45QmMZRED7qPZeaaJazCyne/YVkRShwIOQmZaZu6IPRj4AlDcNmu8Ip5hZCX7FTuP6J9idTwbwBhV@vger.kernel.org, AJvYcCXOuCjlhKaLWSPbz2M6Aw81Fe3/7/veVhFjYvQY4PIFSCazXLbV+NdZ2CcLhSGLxOklGXz733GxMexQSPo=@vger.kernel.org, AJvYcCXR9DYc6ay3pMdE5R89w4RyFyOu0KXPKcMfGnJBIx/wFUHPHyR6sZ7HxzZmFBNhyBWyaqnw7W+ZTUWGkHuQR/+pLSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJl/rGQ4cucdergpm4FZ9p9VvcE3AZK2yZ/lW+OFq+8xNAiNXc
	ImWIiWpRjaisG0cYAZznBiQPGXTUO0hOsE3HkSBKGQ52khDXK0/eRqwYesqT
X-Gm-Gg: ASbGnctzO4gThJmChHhg2Efg8KVEfKpkjULEckFvd+Nc76M39zqpqjyKdEG6rp2rvfy
	6DQXVlR8Gvz6YqJvIqHGPYWlcUS/qMXFHEqhzZ+aNaOVjiF4sLKEykOlp21OcjEdCCjIIm9NBmX
	WuuFT4gHnxD5WEbNE1O/0BcvJ4icjbNx8lTmn2KqoasTGQ60gdI6g5cRovjXnH7Yzo9ZhykwO3D
	BrVXaz5ZFjUWufAhCDN8gkXz6E37OZN5kpIQJXpT5MZ0evFXSditNYpikVManeoBzYSpAar1SRg
	0xZZbY9dQKbTwY5Qskzn1XXvhu0CoW1AgtbZY5N8yBV3/tA+e6gjx16ebagl/3BiHFdkxvQM1gA
	anneZ0WA=
X-Google-Smtp-Source: AGHT+IHIu5qhkggBRErm+NLtFbUvwKt5sTwPHxRPflOOqXS50cxXmegcrYuJqtyXtqCgKDysNU73Ig==
X-Received: by 2002:a05:6102:292b:b0:4c1:a15c:ab5c with SMTP id ada2fe7eead31-4d38ebe8f73mr1156304137.20.1745480217969;
        Thu, 24 Apr 2025 00:36:57 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4d3d49a9108sm151192137.5.2025.04.24.00.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 00:36:57 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-524168b16d3so738090e0c.0;
        Thu, 24 Apr 2025 00:36:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3VfI6LMYjfqUkgHNykNsc0+/jwuh8F7cV1kv76jdJbdo1gvi3pk1Z98HA/IbngPSUErMzkYVPRQuh@vger.kernel.org, AJvYcCXYQ6puhHVWWkvHAYX0D61yrJ4Bjc3WpAccw/e1XiRQPIkk0UDV6732h3XSWLYKsbhRYbzLnakeuY6n+Lw=@vger.kernel.org, AJvYcCXbmqZFBjD54GfFTOvB7K7ljDcsuFGscPtGaS0T8ZaWCE2RrzxbMvgTRk5j+kqqNPXfqTsds/KaexpaPhltgi6Krwo=@vger.kernel.org
X-Received: by 2002:a05:6122:3290:b0:520:61ee:c821 with SMTP id
 71dfb90a1353d-52a7823defcmr1049664e0c.3.1745480217386; Thu, 24 Apr 2025
 00:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Apr 2025 09:36:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcvVvgfaXnom3bKVebOnYnfDvHyv-w7+3-zUkMxO394Q@mail.gmail.com>
X-Gm-Features: ATxdqUEshBTo9viGCXB3rHbxEJom9jufEbZaKOEmr2t4PPjBHGmfMlnAsU_IzE0
Message-ID: <CAMuHMdVcvVvgfaXnom3bKVebOnYnfDvHyv-w7+3-zUkMxO394Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] rcar-isp: Prepare for ISP core support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, 23 Apr 2025 at 18:33, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This series prepares for adding support for the ISP core functionality
> found on some R-Car ISP instances. No core support is however added in
> this series, the focus is to get the easy changes out of the way to
> avoid conflicts of fixes and new features being added in parallel on top
> of this.
>
> Patch 1/7 extends the dt-bindings to allow describing both the CSISP and
> ISPCORE blocks. Patch 2/7, 3/7 and 4/7 updates the existing bindings to
> match the new style. While the change breaks the dt-bindings the driver
> is compatible with both styles.
>
> Patch 5/7 prepares for the addition of the ISP core functions that will
> span multiple files by moving the driver implementation from a single C
> file to a directory where it can grow. The intent is to get this out of
> the way without bikeshedding the real ISP core work so fixes and such
> can be based on the new file structure as early as possible.
>
> Patch 6/7 and 7/7 prepares the driver for dealing with two regions for
> when the ISP core work is integrated.
>
> There is no functional gain in this series apart from correctly
> describing the hardware in dt.
>
> See individual patches for changelog.
>
> Niklas S=C3=B6derlund (7):

>   arm64: dts: renesas: r8a779a0: Add ISP core function block
>   arm64: dts: renesas: r8a779g0: Add ISP core function block
>   arm64: dts: renesas: r8a779h0: Add ISP core function block

Thanks, I will queue these three in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

