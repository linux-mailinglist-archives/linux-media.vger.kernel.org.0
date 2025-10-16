Return-Path: <linux-media+bounces-44730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1534BE348F
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 14:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F20A503AAC
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3263A2EBDCF;
	Thu, 16 Oct 2025 12:13:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A29431DD85
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760616834; cv=none; b=E/5zJnhPpFxLC6j9oyUfMz9j7RwICbq4VroJT9wtc2AeSkTO/so1SGXljPEq/g1ULfTfFZlAl09nP5DzxKa1TRYXRqjsOzEmWdNfrBouJkhCUnN2h9/E5l8eFm2M93czHoGES9eHCYWbe+H+9dkMr74Ww6PQwRxBDJtFsrSz6QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760616834; c=relaxed/simple;
	bh=Qljm2z2l5uF20OnzQWwo+pu0aWLXVl3TFALx6BWruW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBAI7b0N+KuB4xaVby7iMBDaOmqWe2oIbdX8ng8psAz8OUb3so8OMEBRQVT4tk5U+wtLzGNc8I3CAJAx9A/s1/+ZiuEbOM9IOipGL9AAstZISYLN0Mp0SiOgzAOUjFjZeliF175OuIq8Askh+/4AEDomGQJWvtT33iBaIGEoHcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-87808473c3bso140835985a.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 05:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760616832; x=1761221632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3GThzLUFjGbl3VuQITKYi7/BLSw+ups+ZHEY60Y/84=;
        b=rCHdaCafsaWtndx1h60yFsnm7i1NP1SqTIH+p1OG6cmCh4GwiiH8/slFcike4stDX2
         Ybw8i10kcM/T26U2ivf6lm/b2xBBCKR/9swqs9hw+Q5F2mNubs1QyMY//8CrRlv74KvO
         zFxqieI9d9InCc6Uutk7YehLvT3viP5zDQ0id/9Kkg4eAv8ipR2wE29e8SsoZUlJxs+1
         zfsbfJqUvZwpMtaONhcDlFIKtsepm11t+75rHGDUkH6hNVmZANQgm4WY0B4iTUs/gbbX
         8EQJXFxTJxHPKBEhIVL/4GtWxhhkoo34odhDPkip+n6YOn2xU6ywSdyf+4t34EYDKXNj
         zLBg==
X-Forwarded-Encrypted: i=1; AJvYcCUB66neQnzJhybAKJxT+wvpW0Ml8EiTJ0U59Yh73b4ax/Pxp+2JRv+ppZkDx7F64qohOmTcrPBfgXb3Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzob79NKussyuBgekMmgiDbBywuIdpKGp06W+wrLR3LCIBS2bLZ
	G3JMDpD5rHWxhuKPLqspHb1sMtt3ixbqhvoGB+YCwcDd0Onoa0XCkPJB92T7QdqL
X-Gm-Gg: ASbGnct4Ucx7vQIBaR0A3O8tJx3tW6IVJQNeh5GDfZgQAAE8k5MODx/tvHuqwjAulVx
	OfRVvy6+1hL5jGa7hsDG0pZ+bZoV2HX4TqbNg4fTXdaUrQSZSTVvWMeoGiJfVXlxBdHWwxLzNGs
	UGGhRr4zlIG3ANBGV2dSCjGDAnFf68CGA2Syho0u+EKB+KkT7gzJlgp4IzWZ79MotYm7+rByMVi
	vxbHO4qQHAvUrpAIb73SwXF5kym8JAzcTl+z1Exjy+3/tJh0qRJkxE5CLPJejPWwflE6v/PuLlr
	DnwRwcrZfkeMTC1cqU89LlZtj4ORqIWzAuKi4ZdTiEUxwcYP2Gwk5YqZcs3ePON/LIQqk4HTgFI
	7q9ck1N9jbBuNNipnIeu3DMi80bYWGssdAyekUW6xgCow+GOA1YdkxyvHYMSupqBEAW/ckE9zvs
	4tI0aOZQuIUVApKMBS/Wo7L73vHxn4Ggq2VEHpAo/hRqul2ImXSn4P
X-Google-Smtp-Source: AGHT+IFkBGIP7x3P3HfZBncVlCvepDrSn8kZVOm9c6xsrr6+GttrRBvEA2IhlpRulplFsCxZXfN0JA==
X-Received: by 2002:a05:620a:400c:b0:86f:40d1:642a with SMTP id af79cd13be357-88353b338b5mr3688605585a.46.1760616831980;
        Thu, 16 Oct 2025 05:13:51 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f38bf2e51sm185977185a.58.2025.10.16.05.13.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 05:13:51 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-863fa984ef5so141473085a.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 05:13:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLBoqDyj9vH5puL9/TRGWZTXWXIxeNXKR5t02tHW7P+qO2iAusDuEw56RnRFTcC8FavmEcXYcbzCVr8A==@vger.kernel.org
X-Received: by 2002:a05:6102:6c2:b0:4fb:ebe1:7db1 with SMTP id
 ada2fe7eead31-5d5e220448dmr12281536137.12.1760616407229; Thu, 16 Oct 2025
 05:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org> <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
 <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
In-Reply-To: <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 14:06:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUZaL6qyuTZPoRc11WSuqcoRUFNksXZNJoijTeL+vfKQ@mail.gmail.com>
X-Gm-Features: AS18NWBH0cbPp0cJrT4sY267e4E8JBEuMEr4tkAtjK9DVXEqfelKr3ZBbd1AYGI
Message-ID: <CAMuHMdUUZaL6qyuTZPoRc11WSuqcoRUFNksXZNJoijTeL+vfKQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: Rob Herring <robh@kernel.org>
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

Hi Rob,

On Thu, 16 Oct 2025 at 13:46, Rob Herring <robh@kernel.org> wrote:
> On Thu, Oct 16, 2025 at 2:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 16 Oct 2025 at 01:20, Rob Herring (Arm) <robh@kernel.org> wrote=
:
> > > yamllint has gained a new check which checks for inconsistent quoting
> > > (mixed " and ' quotes within a file). Fix all the cases yamllint foun=
d
> > > so we can enable the check (once the check is in a release). Use
> > > whichever quoting is dominate in the file.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > Thanks for your patch!
> >
> > Since you are mentioning mixed quotes, is one or the other preferred?
>
> I have a slight preference for single quotes.

OK, so outside human-readable descriptions, there should only be double
quotes in property values, i.e. on lines ending with a comma or a
semicolon.  Sounds like that can be scripted, or validated by scripting.

> > Shouldn't we try to be consistent across all files?
>
> I don't particularly care to change 915 files. And if the tools don't
> enforce it, I'm not going to do so in reviews.

Fair enough.

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

