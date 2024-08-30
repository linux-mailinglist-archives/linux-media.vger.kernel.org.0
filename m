Return-Path: <linux-media+bounces-17214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E803F9659EB
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 10:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5A7428A116
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A517D16CD1D;
	Fri, 30 Aug 2024 08:16:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A529315C143;
	Fri, 30 Aug 2024 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005768; cv=none; b=UM7tgenR8W+KylbpRuCsZUzzXzVpR6koKw08/U/WVlYeo32NEIjfZwSd6WfBLoKHFMXYgAWmHNF3EXGaDZBFTt2tAMRpWGPvVlqe3RGVqIW2VB7DDXxiXBKr+Xt9Zo8MVweUP4jid33zknwSNogM213GeEbTPA37bQIpZiEiUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005768; c=relaxed/simple;
	bh=Usj4NDMMSuTQv4/ZNF1nZLx1UwIIHViFNSe98IS9hVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+lhpzPA599q6z1sybijYNISy5a7WSKJGlgNqh/BfbPBQ/2wjNRAmlInGzh+56ukvPp0ApyAK4keybaDGUZ0y4Cxb5yPhT+l/QVaxrLTlGuWNBHwy1H2VgzpFg1zTXTotQSEkVsKyvLJDnC1YSoVUnjGhMbFjZz95wLPOkkzeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e04196b7603so1553110276.0;
        Fri, 30 Aug 2024 01:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005765; x=1725610565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4Ql5/in0ZIVOL75Q1qx4NaZGeDqu/Tw36Q8q0H0JF8=;
        b=lXB6z/77QCyU/MXg9U4xW5mqizuw39XhOfwvF7tY7akTctsPjuzLdpY3jSoEJMYZ9T
         0yDzgJOWRScH9mhanS/qlaPONG1d3YjQPGW2LzOQAPKRKDYlbfJMxrgp8YlmYBD7Tw0x
         jqp4eVKCuCK031LLZCm9eDv910/LvKLO27FcFH/SS1W1X+2qRA5Eup0PoY8IwEoheojv
         BUXkaEZkWv216lfA0AbCQpEM4fBqhlAygxR9hnwIAdUGylwRLkM2G1MPZZq6j5t8glpf
         Wadzy7Qe+08j06seUvELRCB6clFHULi0Ri1Y0bjfn+VYDQksLLg/cyrZSOsp2UuX2n+0
         HfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh68GRaLgzVjIcBdKT3Db1XSi7Tl8YijQdRuPzXHTZfHt6SoDC+YgMjaBbUY8C9TPXrRfu0We38A5T@vger.kernel.org, AJvYcCVwbFUi5mD3Bcro5We0FiBHaB+2MotDvHnoui3QulRPp9vhzw//1dNyV8QZLwa/EQEIngKvxs4tCuv5qyNEYlE5hxM=@vger.kernel.org, AJvYcCX5ERNJosECQonBjLgG17qsjUPw+xThmH3sp1yYv214VrVnQVDzdB3UxYlEUyw9TMyuyukV+7hC1kC4fyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKzvqYzg901F9CxPSJdqInWpbGWgpe6tGkTJe9YeO3UKXd0Zyz
	pLjVUZyMeZmuPLEOFS8NtVgl0VI22JyKi0SMWBt1akBDVogo+Cuz4V+eC2Gv
X-Google-Smtp-Source: AGHT+IEdVjeEYAgvU+Ldb5lS/pERLG5CZqOULCrzmz+ayCalrbmGO5/GRyNCtPDvGxxp5JgaqOKf4Q==
X-Received: by 2002:a05:6902:10c7:b0:e11:7578:ffbb with SMTP id 3f1490d57ef6-e1a7a1a7dcdmr1489029276.36.1725005764753;
        Fri, 30 Aug 2024 01:16:04 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a6266ec15sm553172276.20.2024.08.30.01.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:16:04 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6b8f13f28fbso13748957b3.1;
        Fri, 30 Aug 2024 01:16:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhsCzqvBzq5b2XjzYNgaSC7WegU4GeIb16FqsI1HePMZHPMDk/ZVrmZIC6Nsn/Psy/t5rMOJSrJEDeVoY=@vger.kernel.org, AJvYcCVr/DJ5ec93ya5g30FViaACqDNJdeO6eQuK1/Q+tdjnAVkoUc98uHVI1q8XGnwFrUSDoPqolgg5zYuADMZCvmJ/8Vk=@vger.kernel.org, AJvYcCVwXJQ0oy8ohzYfuJ41QGj8MatRVcc2KF5lvoDsNd8lYG1UxOknSMSiEaLKqCIIHyUL7rmmuoUw2jkR@vger.kernel.org
X-Received: by 2002:a05:690c:6384:b0:664:4b9c:3de with SMTP id
 00721157ae682-6d40de67fbdmr12609087b3.13.1725005764298; Fri, 30 Aug 2024
 01:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se> <20240829165051.2498867-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240829165051.2498867-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Aug 2024 10:15:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGzK9EMneHzTJXPQiYRSpnTgP5A9_ZMeSc353ZwR4VKw@mail.gmail.com>
Message-ID: <CAMuHMdUGzK9EMneHzTJXPQiYRSpnTgP5A9_ZMeSc353ZwR4VKw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: staging: max96712: Document the DEBUG_EXTRA register
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Julien Massot <julien.massot@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, Aug 29, 2024 at 6:52=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The DEBUG_EXTRA register is not part of soon to be added MAX96724
> device. To make it easier to understand the differences when reading the
> code prepare for the addition by creating named defines for the
> register.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v2
> - New in v3.

Thanks for your patch!

> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -16,6 +16,10 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>
> +#define DEBUG_EXTRA_REG                        0x09
> +#define DEBUG_EXTRE_PCLK_25MHZ         0x00
> +#define DEBUG_EXTRE_PCLK_75MHZ         0x01

s/EXTRE/EXTRA/

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

