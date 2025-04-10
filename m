Return-Path: <linux-media+bounces-29951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB5BA84913
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 17:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19C0A4672CE
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA621EB5F0;
	Thu, 10 Apr 2025 15:54:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF01EA7FF;
	Thu, 10 Apr 2025 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744300482; cv=none; b=uFQZtH2BmrDx9Qw50jGv2K+3XC2h8Zdr79ZDFM+hHBa7s7Ua/0QvbC9Wq6RqueTmoZhp6KGtuMXFjMCQa2KaKzxJ7LciOuZsYyYIYFkSiqxCsYP54aCrDVwamYqyka8XAcv0hURbXi9l/gbnscexShEa9RMMb4NILq+CvosJmN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744300482; c=relaxed/simple;
	bh=KhOsM8lYKGHe+e9lVW1JH8UNk4dwd9a7eD/C4lSVpUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xm2lT6SgKEuKWyZ7ZirjAV2QNhzPE0X/dJbye+4Q+3ga3zhQaDa/P6C6meEt2lW7dwVoWmnYNvAdS90tp6ixWFIttvMLElNwpKMcVvIzsSDAFk6Lf7zkWWnd+zYBPHLsvJchhR2nI/GRkUtr7JyLE0euS99ZXtTznZMRRaLJXm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so391183241.2;
        Thu, 10 Apr 2025 08:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300478; x=1744905278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsN8ABF5klkRQT9Wv0eoKgDETwkDzvJmXw9fU1aTSZE=;
        b=ZDG1Pv+ZyNj90VeW7gGzK0EdCuro10ZqU0NWEoBb1mHZgIJfvHvXiNQw703iaftjzo
         M1qNYr7gJKKEw+ZfJgckB8jeNJ/YnoAQ9u4RkmRZnBMzrnv2EDHZOV4YZmDW6vI+aKoE
         Ysq9kL5gr80CTUruKsyRiRbiKfkx1fRTGvNi40rR+hVypr/VIkiVWI5AN09t9Oh0TOYu
         W0l+jNgDEpOH0sScjf3NXTVQ+eGx4pucjhu8A/xL8U/Ecd3SwPjbxPx9azh2KpoRuGBU
         a1Rw8qzPyF6OpADTFPBE3Yv9bb5mrItMPvGQg7RgM4qTraNzimRjO1lrLQk3SA8UhKOg
         Qm2w==
X-Forwarded-Encrypted: i=1; AJvYcCW1RwqYh1E2cCFWPqEu1m4c62Tzp7GBzriL23cx7WE65ubUQfWCvDXAnE0MLGDRAr5wI7egH5DuRc9JQLs=@vger.kernel.org, AJvYcCWbKuUCgAx3iNv4YnjB/zgQyAXCeRuO77A0abey8+/EbHZtM5LDb6o51ZCubRZmdG25fTZJA7nQZxse@vger.kernel.org, AJvYcCX4aeO97+c9/NVfe0iHXrOoPJ/3h9x0mXu94Ff2qvYBDRh0E9Pc2Sf9jOJ5F+AM/y/0P2gmgcPG2upMMdPjQDRD7IU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLa9iXY5tyA2+IQlP4s+SqmstYj4yLu/kQFvMrFdLk8IrK7zbI
	GmV02tstm+nlnyAIM98ji4Idqqq5cMNn82eJxdEGMV1nplrZQlx06duBeXisQLE=
X-Gm-Gg: ASbGncu5pO6Dh4YINfLWq9CHNTWfzMc+TzKkY08/hJTaFQpEQ8mM53Rha7y/UHWFOfZ
	Uvi8+why6vlmhu629N09fOhgYVw9JKbVqD+bCfPLoLZfzJfP5dRAS6wazzEM6o+bR5LNDi0/fKa
	fOZBpGphKna9R7chvKQqlWY8qw4hIlxdEr/hOJByKS0X+vmaKocNmcru+y9pF4WBSWvM+ejZjQq
	WA40yJxKcvsRhPv6ra6eHyiemh/7ULBTfYXUo2k8hNe65jVz7j9cIq0ig6+M/bGj2KjdImFLCn+
	NXjIOPHyupT7dZeieuoVWPaoCq+gWhYUECFZTv+mk9aBo+vdZ7mV793Y2lU5cdLQznh248ajZZy
	Bu7c=
X-Google-Smtp-Source: AGHT+IE5v9qA8oabmons58/v/OVeg/e3y7INSxEDHNZBfHIHsu18Wmjvr1ifW2M0ioI52dflT+froQ==
X-Received: by 2002:a05:6102:38ca:b0:4bb:c490:7d6c with SMTP id ada2fe7eead31-4c9d34ad613mr3118509137.9.1744300477967;
        Thu, 10 Apr 2025 08:54:37 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c9764a00sm621121137.11.2025.04.10.08.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:54:37 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso385332241.3;
        Thu, 10 Apr 2025 08:54:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvHyQvnY2FN5fzcZ7yZ30wZAhizedPKrp3ov8sx4Yczid8zxALm93oXq5QHbb1ORiCQ1ohGBVjyPOnaq4=@vger.kernel.org, AJvYcCW+xJXH8whU42p+VNSAOcSs3UGU31EzKmHgZvAEAQjPuJLwl/+o2sDGXvgD8saJgPbeQXBAUry4iUQF@vger.kernel.org, AJvYcCWN/WjtohVYOF4w2s7kYwF/z0virUZDXNa63336PTmZCeZyR1i1mm0Eff16jnSaKyhstNu5280evd88kOTz6meQQDE=@vger.kernel.org
X-Received: by 2002:a05:6102:1622:b0:4c1:8c7d:44ce with SMTP id
 ada2fe7eead31-4c9d3489aabmr2539060137.1.1744300477317; Thu, 10 Apr 2025
 08:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se> <20250315152708.328036-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250315152708.328036-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 17:54:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsU7uJVTM=U66pSO+wWLQWXkjxyvu572D+gSd6cyd2eg@mail.gmail.com>
X-Gm-Features: ATxdqUEEUYLBQVDJXVRoVcJo44FaZJhjh8cSS4jpLPuCFGPfVAz4KoFSsQouEpg
Message-ID: <CAMuHMdXsU7uJVTM=U66pSO+wWLQWXkjxyvu572D+gSd6cyd2eg@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: dts: renesas: r8a779a0: Add ISP core function block
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

On Sat, 15 Mar 2025 at 16:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> All ISP instances on V3U have both a channel select and core function
> block, describe the core region in addition to the existing cs region.
>
> The interrupt number already described intended to reflect the cs
> function but did incorrectly describe the core block. This was not
> noticed until now as the driver do not make use of the interrupt for the
> cs block.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -2588,13 +2588,20 @@ du_out_dsi1: endpoint {
>                 isp0: isp@fed00000 {
>                         compatible =3D "renesas,r8a779a0-isp",
>                                      "renesas,rcar-gen4-isp";
> -                       reg =3D <0 0xfed00000 0 0x10000>;
> -                       interrupts =3D <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks =3D <&cpg CPG_MOD 612>;
> +                       reg =3D <0 0xfed00000 0 0x10000>, <0 0xfec00000 0=
 0x100000>;
> +                       reg-names =3D "cs", "core";
> +                       interrupts =3D <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;

So we used to describe the "wrong" interrupt before, but it didn't hurt,
as the driver doesn't use it anyway?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queuing in renesas-devel is postponed, pending acceptance of the DT
binding changes.

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

