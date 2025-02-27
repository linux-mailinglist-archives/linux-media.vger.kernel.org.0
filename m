Return-Path: <linux-media+bounces-27165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 353FCA4800E
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 14:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB1A916B46A
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 13:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961B923719E;
	Thu, 27 Feb 2025 13:46:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B015023644A;
	Thu, 27 Feb 2025 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740664001; cv=none; b=usT9NoiXAlDtwn0dZ8TyOR/RBoywvucJapRNwltJtsm3o/onwGDF6ZyYisnLAtCNNoV9gdAOKBtfUHVPt5Yxs2ndpEV2x/5TcA6U7hmNXp3DmbTwYOGc0lzE5OHX+r19BqAVPDfjrkUQ+vv7zTd6pMdkiy1cIPDyAPVBWR8m9JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740664001; c=relaxed/simple;
	bh=oqW2O11sQjvCOSq4fu1Oo19LGijE78rGyJ0285FezA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nT6F2xi438RNKlm4SBN/yqYChQXEytxXcKPL486GSa/y0Suu+Mh4poeTTuY0ELaedQFPQNNRQxL4XOqYhsLlSStvoaN6PVtFMFDvhNvEKnQ2DD2ifncBe+vF6y3JtgdXzGIqsV1/BJ36w7ros3pZIZCD7ACjG3G4ZgZ6BPKD+tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52086f114b4so367012e0c.2;
        Thu, 27 Feb 2025 05:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740663997; x=1741268797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/59hbZ1QGqkBthwovz3/f4gQlGhEoAzUBCq23J1+2o=;
        b=ilKGXpOuALt7YCi/0LAhiXKr9uRPIVMLBsL4wXviT4ZYFr1+EJ4OG8aJpub1j6oAxt
         2z/na6p8SUaQttUmhWqnVJ0c0FWt5pnTNYvvn+LPC6zibIgUjHEwO28szmu8sMRH+SnX
         GYlpxZiW1ULBRuQWXHUSAYBdiorpyL/vc5VNQIxmUDuRO7FyqqrhETPW+XPa95b3ODqB
         2MtovrblThCBLSxcw/BaF75jj8EOkcY/tp4VZjnkHiLUhRHpxrtSDOflzEQBOFQ0nfLZ
         iwC9XB7GaT7NDKHunyCZ1Xgfjb53ANd6mza1i9VrfgUv+jR5M07xYUfYpyMMx/CqKT0K
         UeZA==
X-Forwarded-Encrypted: i=1; AJvYcCVgK7PTT33Z8jeC4QtCHx28F8BO/T1qcrCVRbMR9nNxiO0Gz/YesGRztBPoq/JzrZrDRTFmFvupLl6mkw==@vger.kernel.org, AJvYcCXzR9fCvdenbmg074KfBcOv2M+KdkN6V/MV9+1hVE31pkgXQ3OETNeRPs8bmSCT4cHxR/JIGDybgcGtXF0RXIBlad0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhvN855psPAQz7s+OFC4ydmGb6QDpTwBTxvA119vvdYgwTdGQL
	8GIAh1GD/9oU3gL/aevZYThOMgXEZy4ZarERZhENhwZndaAMHHUOPrzVRqZm
X-Gm-Gg: ASbGncvPGz3EUncCRBhWSoWRUdL6HP/96NiovujFOkpsLasTAfeTiMvXFAFDPj1Iwxe
	V5sNgOXBb3gR0YXWj8SPq/lvJmYp1F2ya6DR5CWzujB7Z62G+t+zxhG0c7+civdjv1a5AOkgT4z
	bU2zRb96EJfN+L2rWSqssHFa6qbJFr/ag5aRf/l491l6UT21R6zm4IkvjUXQtmKNDpr75X1rl8c
	ybX6UOELumteB6hq/uS7XVgYACa344Rkg7kLEo6hYMXuIxsQUJqQGe9p5JkyQzJl6HrVnd1cAxR
	45Yw+GwbbtbSI97CqNFUIGwSTXrNDZyyinYpuc8x5yyfp+y3trg5IiPVn4zVa6qgKTWT
X-Google-Smtp-Source: AGHT+IFY0derDkztIdtg7MwVJ6tlTHNl1SCdUXEaBWQt1Wq7/k+JCDBUDQRVH1Lphe3OC9WGVDE7Kg==
X-Received: by 2002:a05:6122:4007:b0:520:5185:1c77 with SMTP id 71dfb90a1353d-521ee4202c8mr13432700e0c.7.1740663997642;
        Thu, 27 Feb 2025 05:46:37 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5234bf068fesm220523e0c.14.2025.02.27.05.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 05:46:36 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52086f114b4so366985e0c.2;
        Thu, 27 Feb 2025 05:46:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYRain0waaKEikaF86ZSv/KV32PuGM9wB8j1ck4iCXpU1lZ2VRhjHabWQGiiS+wq7fK2YbkNMYftv7RYCJJHV4f2E=@vger.kernel.org, AJvYcCX/SuK/YTI/HMQOS9RgJWOfIw0Iy17PFCy7DITRqq3iV3HR0Q1N4OSxJKQF8ITG/kU1Y4Qp1pBPa4RJ8Q==@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4bfc0277734mr14102535137.22.1740663996408; Thu, 27 Feb 2025
 05:46:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224183938.3800317-1-niklas.soderlund+renesas@ragnatech.se> <20250224183938.3800317-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250224183938.3800317-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 14:46:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwnhVuhpawg_KVbe-h1ikoqXcy88M3JJy-nnS6dpH3kA@mail.gmail.com>
X-Gm-Features: AQ5f1Jpk5Rbrc1sTgtyzfwAPIjAOIicCbuMO7ATDOiwn_l50PpJb2CneruspEAU
Message-ID: <CAMuHMdVwnhVuhpawg_KVbe-h1ikoqXcy88M3JJy-nnS6dpH3kA@mail.gmail.com>
Subject: Re: [PATCH 3/6] media: rcar-vin: Generate a VIN group ID for Gen2
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, 24 Feb 2025 at 19:40, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Prepare to move Gen2 and earlier models to media controller by
> generating a unique VIN group id for each VIN instance. On Gen3 and Gen4
> it is important to have a specific id in the group as media graph routes
> depend on this. On Gen2 and earlier models all that will matter is to
> have a unique id in the range.
>
> Break out the id generation to a own function keeping the logic for Gen3
> and Gen4 while generating a sequential id for Gen2 models.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -114,23 +114,41 @@ static void rvin_group_release(struct kref *kref)
>         mutex_unlock(&rvin_group_lock);
>  }
>
> +static int rvin_group_get_id(struct rvin_dev *vin)
> +{
> +       struct device_node *np;
> +       unsigned int count;
> +       u32 id;
> +
> +       switch (vin->info->model) {
> +       case RCAR_GEN3:
> +               if (!of_property_read_u32(vin->dev->of_node, "renesas,id"=
, &id))
> +                       return id;
> +               break;

Please insert a blank line here.

> +       default:
> +               count =3D 0;
> +               for_each_matching_node(np, vin->dev->driver->of_match_tab=
le) {

This is a rather expensive operation.
What about calling ida_alloc() instead?
And probably moving the code to obtain the ID to rcar_vin_probe()?

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

