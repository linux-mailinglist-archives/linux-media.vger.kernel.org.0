Return-Path: <linux-media+bounces-44725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BACEBE3266
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F7AA19C4E19
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 11:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E480431D73B;
	Thu, 16 Oct 2025 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVASFOd8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349CD2D320B
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760615177; cv=none; b=VbPiV4INpSvTvTcyr14ZRxkBUYOxvD9LnhD3oKC5x1CaHbvqos0RGA3z1CajSa6cpSbH+g0ZII4cEa3lXoUoK9eszxGvtH0weQGIc6pHD2R4ifN5/Oo/JSSjgu9dxHlEbrxirstpJSIqp0BjHwpC3UYuEzgM0/V2h36Gtjon/o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760615177; c=relaxed/simple;
	bh=PZizulifq2HVUabPYk3xuoVBwllBTb+3Td/PKhrD1JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ioj2mpk/CYgjomRiMXbRtUToRv5LMaIOI0XG2TrRpuNI2plOqWXl+jKTT9H5nG216kZmODGNsM1Vbgqo8T4PDtBLUwYy7Ym4MvZexua7lu5u/j/tikBGLBVrq0wudxeR2qHU/2V1qakueKKQh4+uMEJqalZG5Hg7b6CQpxLAGAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVASFOd8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93B6C2BC87
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760615176;
	bh=PZizulifq2HVUabPYk3xuoVBwllBTb+3Td/PKhrD1JE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eVASFOd8Ywqe6KQNNwIc5W99wHDhxMRKImkDDotqZhGfqTqo7WZv7EpFgufnGXg98
	 JH71O97kUeMbKxS8dK8TarWgbulGDPG/N2osi7PB/ojtJuHmlrHJipQhJK1fGQIqx8
	 op6BUxlQydtozthCzk1GkU+Z3xEyU2pJ07NmKzV3wJgQe358X8/mJd5VrRKTvZKzl+
	 +9FQpN9xIDocbbmTswT52JCnNKVhQThGt3s6bdIntcRH2MwGnePaTwIuWYel9QlktR
	 HIEBISbSt0jVuOZKcib3uQCDBxbXZ82Ji+VD8qp8E1NGjRdxSMw+Et1p/mpAswLeL7
	 3l+fyNXce0nKg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b5b823b4f3dso105766466b.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 04:46:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkrAuaeSaxqSwfXPmJvM55Isz0h/Bf7I1dkI9S3i0fTDqqenIg9RxQ17qcpeRMfSTL5vnekqgR46in7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YySS20H5mNHgkKcUWKkjC19kaJhUhX6bQwcRMXlinp2mdpg7uDo
	wq/BZcH9KnFhT27jQqMrW785T5WucVNp2m+OxADAj5/kyGnMUO3xmnxuIGxkjLUg2Fwk3eoZ53Z
	8Lypb2y0T/UDYba5G69+bQ+duZoLD1Q==
X-Google-Smtp-Source: AGHT+IG/cukXQVGNzPUMXsg5+RoCAkU44f3RdQmcvQZOd/ZrFBQ7UEz32fqOhzDQMAOYnE1PB3ZCi0DPIcgQtV+P3zk=
X-Received: by 2002:a17:907:7e96:b0:b3d:d6be:4cbe with SMTP id
 a640c23a62f3a-b50aa8a9063mr3962097166b.18.1760615174961; Thu, 16 Oct 2025
 04:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org> <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
In-Reply-To: <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Oct 2025 06:46:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
X-Gm-Features: AS18NWBW0tx10CGZVgmCxHc_hmn_UbUIH_yG162ZfRbVO05hKCLDAYOsOpbWm_A
Message-ID: <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <f.fainelli@gmail.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 2:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Rob,
>
> On Thu, 16 Oct 2025 at 01:20, Rob Herring (Arm) <robh@kernel.org> wrote:
> > yamllint has gained a new check which checks for inconsistent quoting
> > (mixed " and ' quotes within a file). Fix all the cases yamllint found
> > so we can enable the check (once the check is in a release). Use
> > whichever quoting is dominate in the file.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Thanks for your patch!
>
> Since you are mentioning mixed quotes, is one or the other preferred?

I have a slight preference for single quotes.

> Shouldn't we try to be consistent across all files?

I don't particularly care to change 915 files. And if the tools don't
enforce it, I'm not going to do so in reviews.

> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > @@ -129,7 +129,7 @@ additionalProperties:
> >
> >      - type: object
> >        additionalProperties:
> > -        $ref: "#/additionalProperties/anyOf/0"
> > +        $ref: '#/additionalProperties/anyOf/0'
> >
> >  examples:
> >    - |
> > @@ -190,7 +190,7 @@ examples:
> >
> >              sdhi0_pins: sd0 {
> >                      groups =3D "sdhi0_data4", "sdhi0_ctrl";
> > -                    function =3D "sdhi0";
> > +                    function =3D "sdhi0';
>
> Huh?

One too many search and replace. Fixed.

Rob

