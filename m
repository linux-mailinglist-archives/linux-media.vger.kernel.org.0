Return-Path: <linux-media+bounces-12057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A48D14BD
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 08:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0697D283ED7
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 06:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09976E61F;
	Tue, 28 May 2024 06:54:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882C1BDD3;
	Tue, 28 May 2024 06:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716879250; cv=none; b=abRv5SyHqRulq/YaMvPqoAQE6I+IijujwPTyC2GtrUclnVu+xb9X0cb4WCw2JhRwaY+mrpa8SwD4L3wVH/lW5AZM2eExwEfzYJ11Sh80KqViFUH81QeYqh2YkT9fXdNM6zBKRsYAgjXozxGLH5O5x/mkBPKNY9jNHYLPpgi4fGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716879250; c=relaxed/simple;
	bh=SzVilEVlopjimZcTl5SpiQZbjNdlo6aENfulUH4JlSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKlQQcnezd0nH3rKDDHySLUZPnymOTL8a4XoEPAvpsbP/d73ieJ3QdTvSW5EmFglK9V0nrR9xFnIYGsnEArcLny5ELzIJBAeJcawdmHeK8aUUKvsibIHxxfclrkaAyV+BWVFZKOK9/NzYsO8QwONQAKjSTJmpL37CJ61H7+QcBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-627e3368394so4781467b3.2;
        Mon, 27 May 2024 23:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716879247; x=1717484047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXOxMy0/e1CGrNfUXa6fnwwGM2T0WrBuwcAdvF4sSso=;
        b=klln3aBn+TZ2yO8AQmupRSgbAHMtDAScxcTuke1PNhKWrfbOHZgNUUEGhJ0dZ9+86d
         iXOCEBCPNXJUEvhjALOtCQgVIqurf3b0q7nOAnl8fLRAjB6xfFfRdHc+ebcGPhz8GIyQ
         pgu8oKznIUXQ8v/6GL0MySxtb/jDsXvgi3QdhcmXWLMTB5/Dv7ikhBZR4NkKpArg5WoE
         0OFYQMazI2TFgtuIuhScsLME2xGK+mthMm6whXgLCdcWYUFUNQ3lXE17uw5Pjt9ZWPB5
         If9haM1I8RpNoYMlvqf+ih38pPvZuOsag2lexNJXeP0JlV9SWaPbD2llk2ken8M8EBSG
         ZlXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPoaTiXDw2ywn3VrfW7Ef/KKeAz6+IgHtZFl8bQ1dXS+/VNwekm3u0odaHEL40dMDp1OrK4LzUqZXo0e2FjqnV3AxgRCXrO5uc6vs8dzotspCALEWhiY4A+b0XLeDK5kzDZITksnfDDiEe9jjTXQ==
X-Gm-Message-State: AOJu0YyFmRqM06FOqPNRpxtbn7NVBj5TjDftxhtpmx/SSKx58YWZL8DS
	o/r6WgfPthTbIQEEMBi6uKwdKIT8pkufhXanvIZqYp1M2GmsmZOIJqGlafU1
X-Google-Smtp-Source: AGHT+IF/5/DiAgh5pJeF7J984kizZI1T5MUiaxlUhhuMzTP8ZxQBiJnBS7Up79c3DxGluYpAh6aFEA==
X-Received: by 2002:a81:431c:0:b0:627:972f:babe with SMTP id 00721157ae682-62a08eeddb6mr111100647b3.50.1716879245921;
        Mon, 27 May 2024 23:54:05 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a3f76e4sm19370157b3.51.2024.05.27.23.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 23:54:05 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-627efad69b4so4422217b3.3;
        Mon, 27 May 2024 23:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLxl6P+/Zh8fj9aMeF/RGnsKTJ6qR0lnSfNloJQ4nTXODnGJ2Ff2bslJvH0eVC3vZ/wdyHdpRVwsBidvepz8s5rTyPGMVLMVWyVX0mhkHm1u9qmqJtX4Xi9mRSCIqsdnS/R4Bb+gAmFWBCBSYQ9A==
X-Received: by 2002:a25:aaa3:0:b0:df4:d461:62c8 with SMTP id
 3f1490d57ef6-df7721e83femr10448198276.30.1716879245448; Mon, 27 May 2024
 23:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527132429.1683547-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240527132429.1683547-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 May 2024 08:53:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqan1-0VmHTrbWRzxU05xNFgsi36+YZc_hjByfb8tLEA@mail.gmail.com>
Message-ID: <CAMuHMdVqan1-0VmHTrbWRzxU05xNFgsi36+YZc_hjByfb8tLEA@mail.gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Add support for R-Car V4M
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, May 27, 2024 at 3:24=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add support for R-Car V4M. The V4M uses the ISP Channel Selector as its
> only possible video input source. Even tho V4M is not a Gen3 board the
> VIN interface is very close to the one found on the V3U, for this reason
> mark it as a Gen3 model internally.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1292,6 +1292,15 @@ static const struct rvin_info rcar_info_r8a779g0 =
=3D {
>         .max_height =3D 4096,
>  };
>
> +static const struct rvin_info rcar_info_r8a779h0 =3D {
> +       .model =3D RCAR_GEN3,
> +       .use_mc =3D true,
> +       .use_isp =3D true,
> +       .nv12 =3D true,
> +       .max_width =3D 4096,
> +       .max_height =3D 4096,
> +};

Unless I misread, this structure is identical to the existing rcar_info_r8a=
779a0
and rcar_info_r8a779g0 structures? Perhaps deduplicate and rename
to rcar_info_gen4?

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

