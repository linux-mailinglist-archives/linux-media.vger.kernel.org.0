Return-Path: <linux-media+bounces-38464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486AB11DCC
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D375117F380
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36462E6D17;
	Fri, 25 Jul 2025 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AJJHGyps"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032C2E6D01
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443804; cv=none; b=BkxtNsdrP87cHGFF8KDh62xN2dDHDvbNmGEmN97m0JJGyneT8qsCFe0b01bpO9eYNqNHwByHuSyfn9nbqi8XEGtoVan4e7/ZEHyOZsOAn0nibygSOi+c39QjvsDG9ibw3NRpQOi2Rd3kbqoGGAhs6t+W4iU9xkIWRPyy2KPtamY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443804; c=relaxed/simple;
	bh=neLJ2LNFLvS6lJPQrIgKwy7onPWVY8g22J6pC1uMoyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUsFfIfOKHsLOfSC7FgdfK1wBu8AoQCcFT5zHsSK85yYNe33IY9Rxbi5rD8qZE5WqE6cRnWndtJ6BGxya+S0hc3A6m4N2eNN5H2eTLsmJvvBB/NLwl3CAvYEPJkh1GxMMzjaqJgtbEHYoZeNYE+fzjviivN2eOHEAoz9N/qxHBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AJJHGyps; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-700fee04941so19228796d6.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443801; x=1754048601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrirJd8VRiPqD9MKXgOuUU8KSWZo2kqc4pWOmW9YaxM=;
        b=AJJHGypsOU2F769H3WLjjQv1JSe7skUVy7ava9vMOhuT4ZxvMKxek35Yvfwg4BGJYf
         eCMJi7WSiT7r5CSeCqB5j9UcaAWqGsDRM+HYr+I5ns7Hu3nX/ginsCANVClAzWN7r3JX
         S5t/3ZBjJ37I7fWvjpP46MdJy9ppvGRq3BX/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443801; x=1754048601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrirJd8VRiPqD9MKXgOuUU8KSWZo2kqc4pWOmW9YaxM=;
        b=VmUrEvVofxsVisy/PuMO+t/Q2aSHKx0UYeGcvs0sxWzWenYHZNw61lS/XLSnF+nH0f
         r2xwK8iFjZ/02IMXpIBmz5nCH1/ICcg8HS4EbJaBPTLvhRR+s2sn2/HsGErFjcoiNsEa
         ttYBvozzAyWZzJ1IJJCUBV5DvyhChhjiwjX+lZlVSGrvvexoiRmg2GZVcwpZAsYQKgVu
         3cOMiRIIOmqvN8DUitw2IFkjTruHWdMlM9FAWf9SeQOqpSKLvLA3iIF0xDCf9XkgCgU/
         066TsIF+YtU3WsIW6sLtlrqb4rXZLOkRwHZYpnQHQsQ58jD+OOv5F+aMr0q4doBTtBUM
         VwJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYkXDZASdHldT3vaqHuit1YoEfd9Pm+gn1lVW4I2tmBIpTBYt04spoCV0uXTNP8GxdUxy0lgyAsJ+vyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMZoYju5EIMmVZ4GVH9skEQ4+BZbUdYqJRXudxhhUxV+3BvHs
	mXt/jshfAOxL+GUhRoxbEwk9wzi94+od9Elkwsbj/swcHvGg5tgRILKelcqyfivXVkVtSRnSm39
	OKl5FYA==
X-Gm-Gg: ASbGnct3We2hwWwNY3DnthOQyB/JpAP/11DDv2Hj29iofpF6O8rIOWwVGCniQRZOKVL
	bdNlHY58xpAZ63ZUnVhexAYPpHTZLhmVEwbiTrPVkJB2MHEOB4/AIOZOed9RszpVm5Qu04NOV3B
	1spJSNCeTLBELVvS0VzT9SjJ0+RbdPeQNJ1wiPdo4SDgaI4mVUSaqmZvezRkDbQ5/EKg+rRnlgV
	8BaguZn4HUK9Rq5Da55hpbrafnIESgdHUe5Osj0RiwQrdb1JcbZyhnZAqDkTdINgskw9/Ik+oll
	QZFUNRagG0f/2Evpo14/G8ms6XXwsTSLX6pRZTg16h87ajJOPQ5rw4IBW82AfwlJKfo5KWKzT5A
	qMZ9KtQs1C7A82FvylxomLWUpsFUWCrh++MDVKNkKZC/ML983gE3z2vT48lwqxh4YHqIkxry+
X-Google-Smtp-Source: AGHT+IFE7KTGKYCW0aKcG7Gcd19vGEbCKHHOmJ4pFL82v5RuI1GJzc6VMcjKAd8emJM+DkCXJp1e9w==
X-Received: by 2002:ad4:5d62:0:b0:704:8c06:a6ef with SMTP id 6a1803df08f44-707205411d5mr17123286d6.15.1753443800365;
        Fri, 25 Jul 2025 04:43:20 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7070fc9f711sm25634866d6.63.2025.07.25.04.43.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:43:20 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e346ab53d8so193543885a.0
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:43:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBsBm6yIueMXOULApj0LgiJPjfvvS3uqIYklhtSxpwihSnMF+4PRGfvB1Lu7YOSLMwBdxImGY42IEWuA==@vger.kernel.org
X-Received: by 2002:a05:6102:4189:b0:4e7:efa3:6475 with SMTP id
 ada2fe7eead31-4fa3feec1c3mr259497137.25.1753439904300; Fri, 25 Jul 2025
 03:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-30-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-30-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:37:48 +0800
X-Gmail-Original-Message-ID: <CAC=S1njj09KgrNa_3VX7VeaK3nsW+jqBZF7aEg_Umv6WLSRRDw@mail.gmail.com>
X-Gm-Features: Ac12FXxdd5uFk8-UFyXPvWwDifRa0isEQfedIYH5-7QbMGirM6GwiOfkuIBzx6U
Message-ID: <CAC=S1njj09KgrNa_3VX7VeaK3nsW+jqBZF7aEg_Umv6WLSRRDw@mail.gmail.com>
Subject: Re: [PATCH 29/38] arm64: dts: mediatek: mt8183: Fix pinctrl node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 5:50=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Fix the pinctrl node names to adhere to the bindings, as the main
> pin node is supposed to be named like "uart0-pins" and the pinmux
> node named like "pins-bus".
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  .../mediatek/mt8183-kukui-audio-da7219.dtsi   |  4 +-
>  .../mediatek/mt8183-kukui-audio-ts3a227e.dtsi |  2 +-
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 22 +++---
>  .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 16 ++--
>  .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 12 +--
>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 12 +--
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 78 +++++++++----------
>  7 files changed, 73 insertions(+), 73 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi =
b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> index 586eee79c73c..f69ffcb9792a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> @@ -39,8 +39,8 @@ da7219_aad {
>  };
>
>  &pio {
> -       da7219_pins: da7219_pins {
> -               pins1 {
> +       da7219_pins: da7219-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO165__FUNC_GPIO165>;
>                         input-enable;
>                         bias-pull-up;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dts=
i b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
> index 548e22c194a2..c4aedf8cbfcd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
> @@ -17,7 +17,7 @@ ts3a227e: ts3a227e@3b {
>  };
>
>  &pio {
> -       ts3a227e_pins: ts3a227e_pins {
> +       ts3a227e_pins: ts3a227e-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO157__FUNC_GPIO157>;
>                         input-enable;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 80888bd4ad82..f2afca63c75a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -395,14 +395,14 @@ &pio {
>                 "",
>                 "";
>
> -       pp1000_mipibrdg_en: pp1000-mipibrdg-en {
> +       pp1000_mipibrdg_en: pp1000-mipibrdg-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO54__FUNC_GPIO54>;
>                         output-low;
>                 };
>         };
>
> -       pp1800_mipibrdg_en: pp1800-mipibrdg-en {
> +       pp1800_mipibrdg_en: pp1800-mipibrdg-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO36__FUNC_GPIO36>;
>                         output-low;
> @@ -410,20 +410,20 @@ pins1 {
>         };
>
>         pp3300_panel_pins: pp3300-panel-pins {
> -               panel_3v3_enable: panel-3v3-enable {
> +               panel_3v3_enable: pins-panel-en {
>                         pinmux =3D <PINMUX_GPIO35__FUNC_GPIO35>;
>                         output-low;
>                 };
>         };
>
> -       ppvarp_lcd_en: ppvarp-lcd-en {
> +       ppvarp_lcd_en: ppvarp-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO66__FUNC_GPIO66>;
>                         output-low;
>                 };
>         };
>
> -       ppvarn_lcd_en: ppvarn-lcd-en {
> +       ppvarn_lcd_en: ppvarn-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO166__FUNC_GPIO166>;
>                         output-low;
> @@ -444,27 +444,27 @@ pins2 {
>         };
>
>         touchscreen_pins: touchscreen-pins {
> -               touch-int-odl {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO155__FUNC_GPIO155>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>
> -               touch-rst-l {
> +               pins-rst {
>                         pinmux =3D <PINMUX_GPIO156__FUNC_GPIO156>;
>                         output-high;
>                 };
>         };
>
>         trackpad_pins: trackpad-pins {
> -               trackpad-int {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO7__FUNC_GPIO7>;
>                         input-enable;
>                         bias-disable; /* pulled externally */
>                 };
>         };
>
> -       pp3300_mipibrdg_en: pp3300-mipibrdg-en {
> +       pp3300_mipibrdg_en: pp3300-mipibrdg-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO37__FUNC_GPIO37>;
>                         output-low;
> @@ -472,13 +472,13 @@ pins1 {
>         };
>
>         volume_button_pins: volume-button-pins {
> -               voldn-btn-odl {
> +               pins-voldn {
>                         pinmux =3D <PINMUX_GPIO6__FUNC_GPIO6>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>
> -               volup-btn-odl {
> +               pins-volup {
>                         pinmux =3D <PINMUX_GPIO5__FUNC_GPIO5>;
>                         input-enable;
>                         bias-pull-up;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index ff02f63bac29..472d4987615a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -304,35 +304,35 @@ &pio {
>                 "",
>                 "";
>
> -       ppvarp_lcd_en: ppvarp-lcd-en {
> +       ppvarp_lcd_en: ppvarp-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO66__FUNC_GPIO66>;
>                         output-low;
>                 };
>         };
>
> -       ppvarn_lcd_en: ppvarn-lcd-en {
> +       ppvarn_lcd_en: ppvarn-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO166__FUNC_GPIO166>;
>                         output-low;
>                 };
>         };
>
> -       pp1800_lcd_en: pp1800-lcd-en {
> +       pp1800_lcd_en: pp1800-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO36__FUNC_GPIO36>;
>                         output-low;
>                 };
>         };
>
> -       open_touch: open_touch {
> -               irq_pin {
> +       open_touch: opentouch-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO155__FUNC_GPIO155>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>
> -               rst_pin {
> +               pins-rst {
>                         pinmux =3D <PINMUX_GPIO156__FUNC_GPIO156>;
>
>                         /*
> @@ -349,8 +349,8 @@ rst_pin {
>                 };
>         };
>
> -       pen_eject: peneject {
> -               pen_eject {
> +       pen_eject: pen-pins {
> +               pins-eject {
>                         pinmux =3D <PINMUX_GPIO6__FUNC_GPIO6>;
>                         input-enable;
>                         /* External pull-up. */
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index da6e767b4cee..1b21e3958061 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -292,35 +292,35 @@ &pio {
>                 "",
>                 "";
>
> -       ppvarp_lcd_en: ppvarp-lcd-en {
> +       ppvarp_lcd_en: ppvarp-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO66__FUNC_GPIO66>;
>                         output-low;
>                 };
>         };
>
> -       ppvarn_lcd_en: ppvarn-lcd-en {
> +       ppvarn_lcd_en: ppvarn-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO166__FUNC_GPIO166>;
>                         output-low;
>                 };
>         };
>
> -       pp1800_lcd_en: pp1800-lcd-en {
> +       pp1800_lcd_en: pp1800-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO36__FUNC_GPIO36>;
>                         output-low;
>                 };
>         };
>
> -       touch_default: touchdefault {
> -               pin_irq {
> +       touch_default: touch-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO155__FUNC_GPIO155>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>
> -               touch_pin_reset: pin_reset {
> +               touch_pin_reset: pins-rst {
>                         pinmux =3D <PINMUX_GPIO156__FUNC_GPIO156>;
>
>                         /*
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/=
arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index 8b56b8564ed7..a85c73b43195 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -296,35 +296,35 @@ &pio {
>                 "",
>                 "";
>
> -       ppvarp_lcd_en: ppvarp-lcd-en {
> +       ppvarp_lcd_en: ppvarp-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO66__FUNC_GPIO66>;
>                         output-low;
>                 };
>         };
>
> -       ppvarn_lcd_en: ppvarn-lcd-en {
> +       ppvarn_lcd_en: ppvarn-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO166__FUNC_GPIO166>;
>                         output-low;
>                 };
>         };
>
> -       pp1800_lcd_en: pp1800-lcd-en {
> +       pp1800_lcd_en: pp1800-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO36__FUNC_GPIO36>;
>                         output-low;
>                 };
>         };
>
> -       open_touch: open_touch {
> -               irq_pin {
> +       open_touch: opentouch-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO155__FUNC_GPIO155>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>
> -               rst_pin {
> +               pins-rst {
>                         pinmux =3D <PINMUX_GPIO156__FUNC_GPIO156>;
>
>                         /*
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 400c61d11035..8f3a0e85b4ed 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -435,7 +435,7 @@ &mt6358_vsram_gpu_reg {
>  };
>
>  &pio {
> -       aud_pins_default: audiopins {
> +       aud_pins_default: audio-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO97__FUNC_I2S2_MCK>,
>                                 <PINMUX_GPIO98__FUNC_I2S2_BCK>,
> @@ -457,7 +457,7 @@ pins-bus {
>                 };
>         };
>
> -       aud_pins_tdm_out_on: audiotdmouton {
> +       aud_pins_tdm_out_on: audio-tdmout-on-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO169__FUNC_TDM_BCK_2ND>,
>                                 <PINMUX_GPIO170__FUNC_TDM_LRCK_2ND>,
> @@ -469,7 +469,7 @@ pins-bus {
>                 };
>         };
>
> -       aud_pins_tdm_out_off: audiotdmoutoff {
> +       aud_pins_tdm_out_off: audio-tdmout-off-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO169__FUNC_GPIO169>,
>                                 <PINMUX_GPIO170__FUNC_GPIO170>,
> @@ -490,22 +490,22 @@ pins-bt-en {
>                 };
>         };
>
> -       ec_ap_int_odl: ec-ap-int-odl {
> -               pins1 {
> +       ec_ap_int_odl: ec-ap-int-odl-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO151__FUNC_GPIO151>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>         };
>
> -       h1_int_od_l: h1-int-od-l {
> -               pins1 {
> +       h1_int_od_l: h1-int-od-l-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO153__FUNC_GPIO153>;
>                         input-enable;
>                 };
>         };
>
> -       i2c0_pins: i2c0 {
> +       i2c0_pins: i2c0-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO82__FUNC_SDA0>,
>                                  <PINMUX_GPIO83__FUNC_SCL0>;
> @@ -513,7 +513,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c1_pins: i2c1 {
> +       i2c1_pins: i2c1-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO81__FUNC_SDA1>,
>                                  <PINMUX_GPIO84__FUNC_SCL1>;
> @@ -521,7 +521,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c2_pins: i2c2 {
> +       i2c2_pins: i2c2-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO103__FUNC_SCL2>,
>                                  <PINMUX_GPIO104__FUNC_SDA2>;
> @@ -529,7 +529,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c3_pins: i2c3 {
> +       i2c3_pins: i2c3-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO50__FUNC_SCL3>,
>                                  <PINMUX_GPIO51__FUNC_SDA3>;
> @@ -537,7 +537,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c4_pins: i2c4 {
> +       i2c4_pins: i2c4-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO105__FUNC_SCL4>,
>                                  <PINMUX_GPIO106__FUNC_SDA4>;
> @@ -545,7 +545,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c5_pins: i2c5 {
> +       i2c5_pins: i2c5-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO48__FUNC_SCL5>,
>                                  <PINMUX_GPIO49__FUNC_SDA5>;
> @@ -553,7 +553,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c6_pins: i2c6 {
> +       i2c6_pins: i2c6-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO11__FUNC_SCL6>,
>                                  <PINMUX_GPIO12__FUNC_SDA6>;
> @@ -561,7 +561,7 @@ pins-bus {
>                 };
>         };
>
> -       mmc0_pins_default: mmc0-pins-default {
> +       mmc0_pins_default: mmc0-default-pins {
>                 pins-cmd-dat {
>                         pinmux =3D <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,
>                                  <PINMUX_GPIO128__FUNC_MSDC0_DAT1>,
> @@ -625,7 +625,7 @@ pins-rst {
>                 };
>         };
>
> -       mmc1_pins_default: mmc1-pins-default {
> +       mmc1_pins_default: mmc1-default-pins {
>                 pins-cmd-dat {
>                         pinmux =3D <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
>                                  <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
> @@ -643,7 +643,7 @@ pins-clk {
>                 };
>         };
>
> -       mmc1_pins_uhs: mmc1-pins-uhs {
> +       mmc1_pins_uhs: mmc1-uhs-pins {
>                 pins-cmd-dat {
>                         pinmux =3D <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
>                                  <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
> @@ -663,15 +663,15 @@ pins-clk {
>                 };
>         };
>
> -       panel_pins_default: panel-pins-default {
> -               panel-reset {
> +       panel_pins_default: panel-pins {
> +               pins-panel-reset {
>                         pinmux =3D <PINMUX_GPIO45__FUNC_GPIO45>;
>                         output-low;
>                         bias-pull-up;
>                 };
>         };
>
> -       pwm0_pin_default: pwm0-pin-default {
> +       pwm0_pin_default: pwm0-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO176__FUNC_GPIO176>;
>                         output-high;
> @@ -682,15 +682,15 @@ pins2 {
>                 };
>         };
>
> -       scp_pins: scp {
> +       scp_pins: scp-pins {
>                 pins-scp-uart {
>                         pinmux =3D <PINMUX_GPIO110__FUNC_TP_URXD1_AO>,
>                                  <PINMUX_GPIO112__FUNC_TP_UTXD1_AO>;
>                 };
>         };
>
> -       spi0_pins: spi0 {
> -               pins-spi {
> +       spi0_pins: spi0-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO85__FUNC_SPI0_MI>,
>                                  <PINMUX_GPIO86__FUNC_GPIO86>,
>                                  <PINMUX_GPIO87__FUNC_SPI0_MO>,
> @@ -699,8 +699,8 @@ pins-spi {
>                 };
>         };
>
> -       spi1_pins: spi1 {
> -               pins-spi {
> +       spi1_pins: spi1-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO161__FUNC_SPI1_A_MI>,
>                                  <PINMUX_GPIO162__FUNC_SPI1_A_CSB>,
>                                  <PINMUX_GPIO163__FUNC_SPI1_A_MO>,
> @@ -709,21 +709,21 @@ pins-spi {
>                 };
>         };
>
> -       spi2_pins: spi2 {
> -               pins-spi {
> +       spi2_pins: spi2-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO0__FUNC_SPI2_CSB>,
>                                  <PINMUX_GPIO1__FUNC_SPI2_MO>,
>                                  <PINMUX_GPIO2__FUNC_SPI2_CLK>;
>                         bias-disable;
>                 };
> -               pins-spi-mi {
> +               pins-miso {
>                         pinmux =3D <PINMUX_GPIO94__FUNC_SPI2_MI>;
>                         mediatek,pull-down-adv =3D <00>;
>                 };
>         };
>
> -       spi3_pins: spi3 {
> -               pins-spi {
> +       spi3_pins: spi3-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO21__FUNC_SPI3_MI>,
>                                  <PINMUX_GPIO22__FUNC_SPI3_CSB>,
>                                  <PINMUX_GPIO23__FUNC_SPI3_MO>,
> @@ -732,8 +732,8 @@ pins-spi {
>                 };
>         };
>
> -       spi4_pins: spi4 {
> -               pins-spi {
> +       spi4_pins: spi4-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO17__FUNC_SPI4_MI>,
>                                  <PINMUX_GPIO18__FUNC_SPI4_CSB>,
>                                  <PINMUX_GPIO19__FUNC_SPI4_MO>,
> @@ -742,8 +742,8 @@ pins-spi {
>                 };
>         };
>
> -       spi5_pins: spi5 {
> -               pins-spi {
> +       spi5_pins: spi5-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO13__FUNC_SPI5_MI>,
>                                  <PINMUX_GPIO14__FUNC_SPI5_CSB>,
>                                  <PINMUX_GPIO15__FUNC_SPI5_MO>,
> @@ -752,7 +752,7 @@ pins-spi {
>                 };
>         };
>
> -       uart0_pins_default: uart0-pins-default {
> +       uart0_pins_default: uart0-pins {
>                 pins-rx {
>                         pinmux =3D <PINMUX_GPIO95__FUNC_URXD0>;
>                         input-enable;
> @@ -763,7 +763,7 @@ pins-tx {
>                 };
>         };
>
> -       uart1_pins_default: uart1-pins-default {
> +       uart1_pins_default: uart1-pins {
>                 pins-rx {
>                         pinmux =3D <PINMUX_GPIO121__FUNC_URXD1>;
>                         input-enable;
> @@ -781,7 +781,7 @@ pins-cts {
>                 };
>         };
>
> -       uart1_pins_sleep: uart1-pins-sleep {
> +       uart1_pins_sleep: uart1-sleep-pins {
>                 pins-rx {
>                         pinmux =3D <PINMUX_GPIO121__FUNC_GPIO121>;
>                         input-enable;
> @@ -799,14 +799,14 @@ pins-cts {
>                 };
>         };
>
> -       wifi_pins_pwrseq: wifi-pins-pwrseq {
> +       wifi_pins_pwrseq: wifi-pwr-pins {
>                 pins-wifi-enable {
>                         pinmux =3D <PINMUX_GPIO119__FUNC_GPIO119>;
>                         output-low;
>                 };
>         };
>
> -       wifi_pins_wakeup: wifi-pins-wakeup {
> +       wifi_pins_wakeup: wifi-wake-pins {
>                 pins-wifi-wakeup {
>                         pinmux =3D <PINMUX_GPIO113__FUNC_GPIO113>;
>                         input-enable;
> --
> 2.50.1
>
>

