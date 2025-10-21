Return-Path: <linux-media+bounces-45127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B64EBF67C1
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 14:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40A5E4F1139
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 12:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1D932ED5C;
	Tue, 21 Oct 2025 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IXuFI9KG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B43D32E73C
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761050463; cv=none; b=obkyKccCCjiCQ54+K8OrSvYNW8S+oSuinKvA3R4PONy1+8CaJebCwfhK5WMceIlSNwt+ZqC/fVlephIpjqzRLr1Ih2QWUIGn4/lI5OpyqVefV3oW2ky1WyTbeqiCcmM5JB9RPCSrFRzgK4RiVKgpJS2w+D8UShlNGrq88FnB3FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761050463; c=relaxed/simple;
	bh=yuVQZTDGjvvcPalMUgTg4epkdUaGdD4g6/GxObBxEI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAIgK9+17jF2pN1RqtMrTsixrCbw7DczcT4YANzpoDt+SqghEopnkfkmd2gYA6v39rvODuVVDGwBmQcsgJ+29prBbCCW+3QXNuG5q5RsF3zHDrFB/v8Cdd4N7FCxAMBCj9/JajaepGM5dSHRFL3PbPIqS5ZPUN7EJT/bAfQjaQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IXuFI9KG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso6341738e87.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761050459; x=1761655259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWb3L2HC5GL7gJV88qPeFIZPSp/OKkdc2F2PK/9kqwo=;
        b=IXuFI9KG4A3E4U5Fibyo6SAZNeh861N5dZ2edgvOUXsjhDgufvCVHz/9zsQZEjK3BW
         MjdzfFJgfVaycKMJmwOmMDVjWwXkD7nlGV67Jf8zvmtPIwiJnQ2Hi16/68lWT3XbNX0q
         7UCzdCkaXSC/d6+2uyK1aPWErerdzs6Igm9Tb1vs/sYCNuAVd6bEm8yBMPW3HV7o+6lR
         oKyQWdMb9O1alofphP99ZmDTFd+Qzv6AnI2dCfLRhj8HNObmEMBPQTn+FgswF+1mdw56
         trf8UoHLlB9JpJl1xWI4L0iPsJJXVTFXUuRVtCxZ3EA8ysrGASRUvQ/StiZWJHbSyx4X
         GBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761050459; x=1761655259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWb3L2HC5GL7gJV88qPeFIZPSp/OKkdc2F2PK/9kqwo=;
        b=TXURPzra5WhuKrggeU16uZx+7nSrqS0DrCGwFVB/V45e2eDDQq4T0Nt5d1uNfFaUVY
         N3r/HvAuIo1yNp0KB2xdzoBj8taiYJLIffmqSZ84c73uY+rKT4CkFEe8Kelkr/RyWMFU
         O9muiqmNw0XjA+APnh1hkuhU9Z5ls0+KBToZq9vrWrcjnOSGmUld+rC2AB8pbavM4Oa5
         M13dDXanuhpbV3EEwbzT6Y0m+uH+qAL8dHmXi3NdxngTTpaJG85j3U6yRuH5FotuEinq
         OHDnXYEgJr0ZYgeBQtThkuGZ60b5FGSk9RrRT7tUeHmsk3NStRrBO+qYOwsVRG7Vhy4b
         Vy5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpL7auGrM3N8TC4BfJnClFMJliIBSuTYie9SvheduBF4ozdtNImVak5HnGe7GH4xcXkXmtE4LNN5FOaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbwUAyJ50wM9gfF734Lr1zIGUahy2ygdIwv9RdfAgNjV+YIU0a
	/tc07LkRUnzaNW8lqreQDzuoO3GkttlmzVc/Va9V3mUUb7iosH7WldbH3K1AvnvWI4BQxs5oC0z
	EPSZwVvnAMIk6deeFxcGHRcOlDVQkmcArF9hZZjWS6w==
X-Gm-Gg: ASbGnctwkegTgI6s9QAWrMMPsH1ifYxnNYqpqZlVflsFmgk96n2ituqahlmqhWtWvPr
	fOaDjJSp7hzYTJcmLggKfzwvmdhdR+OeExe0DOAkjLjuxmJlrSHXsRCwzRA6LGxSl3wfM6joKdP
	ZtBzjNHjZPtH2zd90j3hbQp7cPWyLOFUlYAWue6JVDtAatsEyf9TalIQBRh+pmU6cBAxm7zmbDI
	+BDd4927qn3ScpPj7BrUWH9XXWq8T73q45MR3lcLItESFJ1cvk4kz70HjZDoi7XjMgOIcUuRz/E
	i9xZfiMww/AfpMGD53/mYcHW+LE=
X-Google-Smtp-Source: AGHT+IHJJi40QO2j+AEEIXG+FSVZbH+WW1DwyjfojmvqVA8OuBIji8cOMNjvhsKfbFVOj/fVZy/UensL3Bqq96jG85U=
X-Received: by 2002:a05:6512:3b0c:b0:57a:310:66a8 with SMTP id
 2adb3069b0e04-591d85773ffmr5098755e87.55.1761050459418; Tue, 21 Oct 2025
 05:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:40:47 +0200
X-Gm-Features: AS18NWCQWmhq7gNfZEHIkGW0O-gEdDRZh4gksyliLmXKxwOZhptAVz-Dcd8I0sA
Message-ID: <CAMRc=Mf++cYPVrFH5_1KggTQi2Tew_MaeHMHSiczkVfM+=Y4rg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
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

On Thu, Oct 16, 2025 at 1:20=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../arm/altera/socfpga-clk-manager.yaml       |  4 ++--
>  .../bindings/clock/nvidia,tegra124-car.yaml   |  8 ++++----
>  .../bindings/clock/nvidia,tegra20-car.yaml    |  6 +++---
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    |  9 +++++----
>  .../bindings/gpio/snps,dw-apb-gpio.yaml       |  4 ++--
>  .../bindings/iio/temperature/adi,ltc2983.yaml | 20 +++++++++----------
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 16 +++++++--------
>  .../mailbox/xlnx,zynqmp-ipi-mailbox.yaml      |  2 +-
>  .../bindings/media/fsl,imx6q-vdoa.yaml        |  2 +-
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   |  4 ++--
>  .../devicetree/bindings/mfd/ti,twl.yaml       |  4 ++--
>  .../bindings/net/ethernet-switch.yaml         |  2 +-
>  .../pci/plda,xpressrich3-axi-common.yaml      |  2 +-
>  .../bindings/phy/motorola,cpcap-usb-phy.yaml  |  4 ++--
>  .../pinctrl/microchip,sparx5-sgpio.yaml       | 12 +++++------
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 10 +++++-----
>  .../bindings/pinctrl/qcom,pmic-mpp.yaml       |  6 +++---
>  .../bindings/pinctrl/renesas,pfc.yaml         |  4 ++--
>  .../bindings/pinctrl/renesas,rza1-ports.yaml  |  2 +-
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 +-
>  .../pinctrl/renesas,rzv2m-pinctrl.yaml        |  2 +-
>  .../bindings/power/renesas,sysc-rmobile.yaml  |  4 ++--
>  .../soc/microchip/atmel,at91rm9200-tcb.yaml   |  8 ++++----
>  .../soc/tegra/nvidia,tegra20-pmc.yaml         | 12 +++++------

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

