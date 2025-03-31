Return-Path: <linux-media+bounces-29044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A1A763BA
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 838D63A3EE9
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DECA1DF747;
	Mon, 31 Mar 2025 10:00:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7236A86338;
	Mon, 31 Mar 2025 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743415206; cv=none; b=QfBEpqmslf6J+j6EnB9VVZk4rh8xDarCn4qGd8ySRDumuN9r3i2iVFaUSEPUg+Sg8ZxGu0ZJKuJWLasH8ogkizxJ5V49X0HUzwmmGhu0VzNajz1r7efmMymB7Nd5HZQRznba2hb/Leg3QK+4Kg4izlycFJPHdcHYdfVRaimxcpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743415206; c=relaxed/simple;
	bh=RYhb5eHwn7GiR8GFxnjY8qU2kO/mpQDTuFA9lv5gM6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQfEr7M14tu2x4scIINt3nL/NasWptvM4J18hy5+cKEAa74jUXze5qarXYHfy+aCUTmFLN12Rmc9ErXHws/rf0ZGnOPYzHCTpmY0fvLePwzPffxc/O0BUzzlPd0Lh9GnTcZzzgrHm9moR8V+Y5SwfrWShW/DFn6NHtHsuywtjFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523d8c024dfso1726543e0c.3;
        Mon, 31 Mar 2025 03:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743415202; x=1744020002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHHpQ0fy6841VegCJOINr5C7Mb1mxyzeTX09RBlZJPE=;
        b=qD4rGg+iNimkBj+bEySt1QAelmdUaLYamHXjDh2o5CbB4iPI5dN7o/GncrUInI3jcp
         CcNKNmdWT6K9jk+5PRGyLFa9KoKBQrMdLkV+quAyLccmIoja0u0kS5B68kMTlkTksXia
         0bnGhOrAiDBdJkpIWRjDt8LeKG9/BoayAdQ1KS/DHmEPs0kIZArzZB9qwMpPyuHS7aYJ
         1SWPsD0F5TAMQ6DwNeHQo61BCpZGwRo55XsYu+M4n7MlXASGIj5er3SuO53YBPF9HTLz
         wrbFtWw/d7yuOCMoJ2aimcGBkPXNCvPdq7mv6z9sy/NZAXb44o8Tn45qAawZd2ot6nBi
         6Y4w==
X-Forwarded-Encrypted: i=1; AJvYcCVHuNcqzyMC/gOT3nWbKOP7H7llqSLgWOwBYNyPB3WQYCL3vt+b8JK46305oJCK8ZKyhlgGN9e4OaxDyrot@vger.kernel.org, AJvYcCWTwYt6Lh64rX3raopibHWqnS7WYantcvrGC3Hvl4qBhofKMyYxeVzJSvXAZPWiGh2NRgQDZT6xlYzq@vger.kernel.org, AJvYcCX8WFkHRi1lax5vp6cjKQxzQilvcCcvN2fXb7aRQF7jYcbZO3UyVzfirRQUMp0ZhyvjMrtymynMgL8r@vger.kernel.org, AJvYcCXfpE0o11lFszimtLec/h26a2ACCSD2olbGL2LWxW17pe2eF88xqRY1K65Gtxyv0PkwORadXjwf3Di2Ji8=@vger.kernel.org, AJvYcCXk5x4voaOV9fJwzrYA4ZZsBrUZ9ey5RSmezOfpLBcvhC1weYyHbyjtJAJLFP5Chuy/E9b+rotikry/FkedwYDt8W8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQHU4SDWuMat539mNF5Pf/ozApl5McQVR1oVv9fC6hzLt/Src+
	JLX7g8YIWXstdaLzpbbZQR2s9Ay/bOdJPzHDYnrb0BuRNX3Q9qiO1lbKJb5c
X-Gm-Gg: ASbGnctOstp1W6yyUuGbYO3Rll64NvVU8XknL6RhZo/szxSczOofCXbt3wHWGRtBl8F
	RV4LHPEGTo23vDvAT9OPvcfcLMXgzvZCZzId0kRdqKLhRIC+3BMLmm8J6eoPag8QX8aqrW8Iluk
	WSeRt8enXgIwbPXsq31FZnE9TVQNtPAWufyBTcF0uADjQRhi1lSdZ8JiqU+BJOn3TM8k03fIzIF
	iFdJq2LZbd5I4Mk00u9jwbrlNGllKSK572rGpINQ2oAgUtZ//RJSvRVCrz6+dhFH+ZwBM9/sRQO
	/YPf/18kwYQOxRSyueh3rvoFt4GXj5iYADdROtJuxjuC+ngRPDyRfOWSyM+hg63WvEMT9aANJHh
	wzyavyayPBqc=
X-Google-Smtp-Source: AGHT+IGEHtbpeJpXxn1AP0GsA5A7d2oyCMLrXejHUj6Bez09FoVRmKBg86HI6ZZpQ6qPAKwKC+qmTw==
X-Received: by 2002:a05:6102:2b88:b0:4bb:e8c5:b172 with SMTP id ada2fe7eead31-4c6d3887c1emr4533100137.8.1743415201914;
        Mon, 31 Mar 2025 03:00:01 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-871a33b141fsm1495226241.28.2025.03.31.03.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 03:00:01 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so2164511e0c.2;
        Mon, 31 Mar 2025 03:00:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGWbbiBYw5izBVSuenSH45hfwaHSphLOAkjmrhiFjcsDOOO4hLCLC9EL/Q5N86JGktCox27zncVP9arrb+@vger.kernel.org, AJvYcCURDvqAygdGCLVs2LAUNjAsRplEV0Y8iD49w5CnQFKyWXb4uFl1A82VbGzVJC8AOZUBMTGzB1Cou5TDC10=@vger.kernel.org, AJvYcCV/THnhSvAB5UDewnSSoXu4Ej/x8VWglzTtaVTVFrj85PL1SpjqF04IEsbm8JED27F289HjPcT+Bx7W@vger.kernel.org, AJvYcCVDAOi9NktOsgwpfy/FSYfVIYcabc4Nqn7ougWvFPyeQz/MhNf17zZOS3lh2kggUiXZql9zNg0Tm963@vger.kernel.org, AJvYcCVu2i5qbA2C5EYEP76UijMEnXxIYf8JyeFmkuPpu3bdhHiT1vUvivwqjzco3ivEGwdythRbQoreajU97S19kmd1GuY=@vger.kernel.org
X-Received: by 2002:a05:6102:54a9:b0:4b9:bd00:454b with SMTP id
 ada2fe7eead31-4c6d38ce35emr3497230137.13.1743415200600; Mon, 31 Mar 2025
 03:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 11:59:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVd0K_w+vPDBcmCzxFJ3JgyXfUd+h0OTCdcjmj8D0trA@mail.gmail.com>
X-Gm-Features: AQ5f1JpCL3EXQypQSgdlAcFOZc5JnfHR7qY1OVfeJ2JHPtlkNAoLdw5F_dFliuY
Message-ID: <CAMuHMdWVd0K_w+vPDBcmCzxFJ3JgyXfUd+h0OTCdcjmj8D0trA@mail.gmail.com>
Subject: Re: [PATCH 00/17] Add support for DU and DSI on the Renesas RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your series!

On Sun, 30 Mar 2025 at 23:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> Note, the clock patches aplly on top of the following patch series:
> - https://lore.kernel.org/all/20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> - https://lore.kernel.org/all/20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Same comment as on "[PATCH 0/6] clk: renesas: rzv2h: Add clock and
reset entries for USB2 and GBETH".

The first patch series was ultimately ignored because it was not clear how
it related to other similar patches for the same driver; the
second patch series is new, and depends on it.  So please coordinate
and resend, based on renesas-clk-for-v6.16, or even better, v6.15-rc1
next week.

I may still review some clock patches (the ones that do not depend
on pending new constructs) in this series this week, if time permits,
but I won't apply them.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

