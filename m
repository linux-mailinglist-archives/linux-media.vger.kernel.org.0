Return-Path: <linux-media+bounces-41923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A3B47A35
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 11:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D98E73BF0A7
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 09:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55179222578;
	Sun,  7 Sep 2025 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ai+6Qnk6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141FC18859B;
	Sun,  7 Sep 2025 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757238215; cv=none; b=jAy2UQda0TU+6X1DAeM2sA/ggjy8/UZNUTqBHLZ2eyoHLHMQI8au0FKI41wq1IXbAKIEXvC9KYnlAZYKdnnNcTQCVvnChUjcQale0QJC/As3rgfV90qpdHxLsqomMuk9J1SU7r0y4Hborv2XHwpd1gUhLKpVs9ml5e3ms3vRxnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757238215; c=relaxed/simple;
	bh=TDwoEokmsEniRL5mzV7C3NbddClADMi8vSACqfJXWVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JfvoL7T+N5Am72/49hapkLyV8cc8ft8t+9Gm4Z2HdoTULHNrF4oz6R1lXqjx7wxc16PRXuPCMVeUYWBaCL+wu5Aj+qR/HBb7oQoQwYU4XdR1+YK52u8PdwJZsDx93V9f8EwLD2cl9Q5GYxzKyMbplkHvw6T1QSxF8VQlZ/zzqNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ai+6Qnk6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45de56a042dso781585e9.3;
        Sun, 07 Sep 2025 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757238212; x=1757843012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ/X6GOEUsW9+IFkzRBAiysCMqpUBrDHjoEhck1HoOk=;
        b=ai+6Qnk63Rp8rNYsCTVbWIM84CwcryJS89kXfWZwcqn2JWjTOUHCAREaNd+RUa1cua
         IDaE/2Yki9/VbS5OGOz7nCgnRM+CGOBK33Ir3UcU//JrKNX/dklO92rZl8qlKevUV0bo
         qVyvHB6Kmpf0EZSoxkz1WYzNmKGHJcDz6vkBcZZ/ZkyENEVEkM7JqTbVqVMbuqZKEuVU
         KuAhm5z+gSQJTC8mjizfTw0/JwzAcSat6wShjL06XHZIf1g+MiPMsnm9dxiGENUK4NO6
         iS98855/lL8wykV+LBkTuEBKsdDKaQjqNshuPaSD7lAaqdQYadAFO0d1gWI+/YZMcMFk
         XJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757238212; x=1757843012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ/X6GOEUsW9+IFkzRBAiysCMqpUBrDHjoEhck1HoOk=;
        b=BTZv3L1hr+Y889XSMcaOf3GkPCvJAAAbiOKbda6LHuSuDZonAy5u0aiNPBKnzRlr4b
         3wP2obZrlBear7xq6AppY/udqAo7Dqbpsq6v0GYYeamsaomek6EDPwN0nv3626MyPqlc
         y2AOJqbUS2EHuJuYKjRipkRoXCBU/+Gp/BI6rZyNL35FmzbC1MRQ41xW8t9OoYlZzlWR
         xE28i564KisnA0wXivUYFIC4dyVlDqkHmybnyFJDGzoE8a7S9PcmeQJtAq/+xw6llQQG
         fr39CHT4ZqZtrWdmWR5KoVmW1zGYTcAfciNyk0vN3BtjxBCXVKeml9ZV9f+sdu9GfttC
         upog==
X-Forwarded-Encrypted: i=1; AJvYcCVo4xVxV+XzxOOjpncfK2TVmjrxN8sydiXen26Igq4fF26wawDqE+W+WH+GzGWv1cdSaEozlThtgytorr/4@vger.kernel.org, AJvYcCWAf3v6wr6WAeT3Y5jFuBlAFvZtyMSOsPQhak5NsiWCC23v5yf9r6LdpNtl3EW5PX5xSGJovNougFB6@vger.kernel.org, AJvYcCXA+U1bZai8GrBEyx+WkG/eVJbE26n9+Qv39ZateYIW/kW56K3odM9vOLwTcpGgQHgoJB/koxN2PSgM@vger.kernel.org, AJvYcCXVTFVN3IXOwy4aTrNz895U8NHQi03nhxhzfislvT9WVNVgZrXUVg+9S2WCaHJ/I3OP750sKwxnx7I6dqo=@vger.kernel.org, AJvYcCXxKw1bzQF9yD3nmsZ/iqljp7/jCysDmFtzz2HrcAXWXruzkLaO+y2ZcHkOtGC9sBvzPVL3zuvKjBtrMck=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJPhBUjNoEn0IcXHZWcJs/GxxTZbVqXGlgfAT0e72iedk64Spy
	LTDe4Uh9gv1psPhizSqaZgpga1Xvd1spouxxFypX7xg7a4d8zCsXTInoti3x0heSoPYWqEhZQbt
	jh2Orr8Szw0079yzirLCIeDly5Z6PK90=
X-Gm-Gg: ASbGnctVJG21w+jI9IA7rwU9PvGwvIuSmYTJrwlTvzFs421pM3xQnwUKjKKPY96K5TV
	MilSZrLyXpk2RmfoUUL2rSOEyupcPYh4vWqK/s/CV3O240oKE1AW4PWXhuzVBCOMHt0XcwBQDze
	aFtOwqqwkVuTSmH8cUlKv96+DAP6/gtmVSmuyu1dRiki02t4kQTNez3YQrYkjY98q6QnkQJ0lP4
	QVO/wIi
X-Google-Smtp-Source: AGHT+IFPqig/UhEDyt4I8/2ZJlpITCSmd+DYWg5033ITXHJTPMBD050/gyXsr+9sNyIaTUs7NwKlwoEiYgPtX0PKgHs=
X-Received: by 2002:a05:600c:3b25:b0:45b:9a41:5d58 with SMTP id
 5b1f17b1804b1-45dddea60cbmr35564895e9.4.1757238212151; Sun, 07 Sep 2025
 02:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-3-clamor95@gmail.com>
 <20250907-arboreal-aquatic-gopher-686643@kuoka>
In-Reply-To: <20250907-arboreal-aquatic-gopher-686643@kuoka>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 7 Sep 2025 12:43:20 +0300
X-Gm-Features: AS18NWARBXRzhLtN6n3ce6WfDFCnzLq5yKlMbMSeV1CuL4QdfN0Ud8kVvzMMu8Y
Message-ID: <CAPVz0n0obwSFDup2n9R9SQNsOZw1Dm0G=2ifv=D7zyw=89+uYQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/23] dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 7 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 12:34 Krzys=
ztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Sep 06, 2025 at 04:53:23PM +0300, Svyatoslav Ryhel wrote:
> > Tegra30 has CSI pad clock enable bits embedded into PLLD/PLLD2 register=
s.
> > Add ids for these clocks. Additionally, move TEGRA30_CLK_CLK_MAX into
> > clk-tegra30 source.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/clk/tegra/clk-tegra30.c         | 1 +
> >  include/dt-bindings/clock/tegra30-car.h | 3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-te=
gra30.c
> > index ca367184e185..ca738bc64615 100644
> > --- a/drivers/clk/tegra/clk-tegra30.c
> > +++ b/drivers/clk/tegra/clk-tegra30.c
> > @@ -53,6 +53,7 @@
> >  #define SYSTEM_CLK_RATE 0x030
> >
> >  #define TEGRA30_CLK_PERIPH_BANKS     5
> > +#define TEGRA30_CLK_CLK_MAX          311
>
> Unused define drop.
>

Specify, your comment is not clear.

> Also, don't mix bindings and drivers. You cannot create such
> dependencies.

I literally did what you told me to do! TEGRA30_CLK_CLK_MAX was
removed from binding, but it is used by the driver, so how you propose
to handle this without redefining TEGRA30_CLK_CLK_MAX and breaking
build with missing TEGRA30_CLK_CLK_MAX?

>
> Best regards,
> Krzysztof
>

