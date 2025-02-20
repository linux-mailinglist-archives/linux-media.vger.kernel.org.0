Return-Path: <linux-media+bounces-26480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4864A3DD3A
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A7E3A998F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034C21FE469;
	Thu, 20 Feb 2025 14:40:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1308A1FC7F5;
	Thu, 20 Feb 2025 14:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740062399; cv=none; b=Azo3S8GEvyEL0nPerVj45qkEDtTHtxbgB9kvdnTpip6nZXH+SfDTv/qZCKFPhKiBvK4miyKjzEeO1fdl2i8Pxiq1r+7UOcTws61Ljhj8cgS7vxagiVWU3weq/q9aZw/E8W8shXkEqRReSayWztJGt9Mb/nJIdRGdhWOMgKsr8eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740062399; c=relaxed/simple;
	bh=yOyxFcnQjo1tbshqOofKNICwGL4gI6eqsn4VKiwbu68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARgi8vuixLL4lPC5xiVeEwp1B86pwCnKTbfOiw9sCKe/K2kVwfsI/kE/h/orio1utCn4BZ1zjL8ElqQZBJQDg4O15TDNT1eci/f7pQrrIkBW/APESZD1EHb4f40IFe8tNGmHBPmHfFsyeHSOAbEGlEbZpewHjz9TZYk4fNkws5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-52098b01902so643871e0c.0;
        Thu, 20 Feb 2025 06:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740062396; x=1740667196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJo2T0INFBN8CdvT+pIiraJbdVrvgv9JeI3xz9LxrQ4=;
        b=ppIynFP84P8woLyg8p+5VpDEXsxouyad0CGyqI1iCzlYYc01BxXGQh78+e7fYAPX0d
         hXslamrO5/fWt+tyKjL/fzUBtjMLllG28Vft3a4UFO1Xdoieu76M0YzSaV/Qa6s9WiRK
         ia+Hf6WiPGMBmh5YtvoQPTe3G+KuPcOtYBVqJiMDPVI4JFO0xEFQdx1fy+qaSeyA5F+S
         rzn1HiB//4Iwe0c7Z2w3gllAs5k3M0KvoZ/j9MejLICujSqdDRj+qCz5aI7zROqGfO4X
         qr4h+k2YW9xftoZFkcAZZZ77MJkl5bxanF5ZM+4XjaOggZCA0fXvb5s+TSLVPj4E/KBr
         ojyA==
X-Forwarded-Encrypted: i=1; AJvYcCUCIt7W4V13lDI+94SKNS+xGfC9pdPjJobK2HYOTJuLSPAJSyuAHFLrpSEFw6LX3JavmQHHTgSNWjIRJjF7@vger.kernel.org, AJvYcCUNvMlV03REIcRZ8As3wqjcGVvkdSE85kK+XH97hmexzLh+C3U/H/a27MgD82NzJnfcAFqyYmrIGVUR@vger.kernel.org, AJvYcCUe03bbl+9Jalvh4J0Mp5A9eJMqvjHhVP2J6Q2/vCVEOQYUcpjFg0Fh3vVVK8sbAONuTecXTlxwcdZw@vger.kernel.org, AJvYcCW/ovhnx5PnBDIsbHCO1yjbkkcfYVNqaiWcDTBYZG5HBwCn0t14c04BV8qpfIZeetNr4bZqHCyZklvhtfnT9JwSJ+Y=@vger.kernel.org, AJvYcCWtzTQu//nm9gbVqI6n5PPtXdgcS9aInfvdAiGuL36GaCM09n6lOaF0NX3iKQteLWWgkID39PXYpFEoArc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNoe88wAshS2nEjcRw2nzlDfQR3xUKyAM8OpfN8/++p/xdXXJ6
	EtyzqP907avKG8/ZIDhCN0yCNip5mebOpnSbgDUohJTmIH0+WLjRUJuYELVY
X-Gm-Gg: ASbGncu5Lpdlcz6wP7bG4WwxJpXCqrwAQXVTUv7zGaIbXPjGZatYS9RrDQFBBsG7zqS
	bG/oeKfhiZfNYw1fiiQwo/r/Ttkh3k5X/Oa8DGnf/tCf9f8uH+ttsPNIIoWPSltLt1JzEqE94py
	j5v4UZkMUNxU3+ouDjLIaB59x3a8kM9K185nESM7xyqnyZosOt3iGn3+bUtqzB4PCTPKn8r4qe5
	OQTjpenHT1jeJJE+0DGEH8BvL1mivfZ7VLPKUvEsTDDJQN/9Sa+L8XmHyyewHgctJgFFReOv/m0
	cjOlmk4wFozPhEXkjJ1GDN/Hsol3QBbnLmu7c06dzI1dDtdZ1xBbQQ==
X-Google-Smtp-Source: AGHT+IH3/0+QNRd4RigimZHoDXInmhbeyF8ttOjkypl7rFBhYpozJxd+3vkmb2JaY9TjeKV0t4Mx3Q==
X-Received: by 2002:a05:6122:3783:b0:520:b76d:f3c9 with SMTP id 71dfb90a1353d-521dcd709b4mr2023335e0c.1.1740062395635;
        Thu, 20 Feb 2025 06:39:55 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86bce70sm3320621241.27.2025.02.20.06.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 06:39:55 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4be78f8255fso1391377137.1;
        Thu, 20 Feb 2025 06:39:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiFBHGYW6X1mSV3J9WKGKC4YYGiyNYsnzFnSN7LECllrLuOMWpxgnEsPpBw+/ACtfz9sRQ2aLNfbasP2o=@vger.kernel.org, AJvYcCUs2DM6CCbI8b3OD3yukUoGX/0PPJp2lvSL904Hso9WP25H37GuOyBwnuWe/UmVXrkNwhkDnzQPSkw7@vger.kernel.org, AJvYcCVRprS1DyygFOKEj7QqsXlp4Tv6We05Hu36rCzUdgRgylUtJZwhowr7V9YNtApp/JKVN23Bgjc6EeU42MP1ekGZ2T4=@vger.kernel.org, AJvYcCWWV6BVvjofrapqjHvpdgL4IDpbeL/AEH9wV2odICXP+bE3P5njZ+iSegk7ikSng10aF/BMgj3yBtefbkuD@vger.kernel.org, AJvYcCXcYuig/cQV9F/RYdL8DoFjEiNnA3EqK9+zTkQbwaHrccpZUEXGQtg3qxM130HUs3fK3KrUB02nMa/X@vger.kernel.org
X-Received: by 2002:a05:6102:5090:b0:4bc:d2d7:3e9c with SMTP id
 ada2fe7eead31-4be9930df0cmr1840246137.12.1740062395334; Thu, 20 Feb 2025
 06:39:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-2-tommaso.merciai.xr@bp.renesas.com> <TY3PR01MB1134607367DA9D2B689E6562986F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134607367DA9D2B689E6562986F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 15:39:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4XixfSsi-=FmFtuxqoKY2bH_s8DDyhNxcP61Zuds8YQ@mail.gmail.com>
X-Gm-Features: AWEUYZmMFYua9ZuRn4WqoSFzYx7XcuqDWv5SwNUrf2ZCE8T3mAmPrGsjSVhjiN0
Message-ID: <CAMuHMdU4XixfSsi-=FmFtuxqoKY2bH_s8DDyhNxcP61Zuds8YQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] clk: renesas: r9a09g047: Add support for CRU0 clocks,
 and resets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 10 Feb 2025 at 12:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Tommaso Merciai <tomm.merciai@gmail.com>
> > Sent: 10 February 2025 11:46
> > Subject: [PATCH 1/8] clk: renesas: r9a09g047: Add support for CRU0 clocks, and resets
> >
> > Add support for CRU0 clocks and resets along with the corresponding divider.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> > --- a/drivers/clk/renesas/r9a09g047-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> > @@ -49,6 +53,12 @@ static const struct clk_div_table dtable_1_8[] = {
> >       {0, 0},
> >  };
> >
> > +static const struct clk_div_table dtable_2_4[] = {
> > +     {0, 2},
> > +     {1, 4},
> > +     {0, 0},
>
> Not sure {0, 2}, {1, 4}, {0, 0}, to make lines shorter?

All SoCs from the RZ/G2L and RZ/V2H families use this formatting style:

    git grep -wW clk_div_table -- drivers/clk/renesas/r9a0*

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

