Return-Path: <linux-media+bounces-38361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D978AB106EE
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 11:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6289188D2D3
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 09:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5F0255F2F;
	Thu, 24 Jul 2025 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hAueWPVh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F4D25485F
	for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350552; cv=none; b=sC7dzvwMmSfZntRJjcp63Ljqufkuyl9rGtw9AsPjkEtiBheCW7YrHbyr7p4PnucP5E/MSRzYeK6aA+WZeHtn49VaJaii8ZvLhG0xudPiz62pPASXtKpL6RrjHJuHQilNTW8i+90HjLPjkP3mSYmLnYBQnyIrWqTHvEE18PYfyRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350552; c=relaxed/simple;
	bh=U+rR1HNut0ExpbrnkcfOSPx36ou1vMZ071sRdAv5Ll0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJmVKyRNT82o+Oo6gbAmjjM2S1S3iuPtbWW2O/8pTPzv8Vigy2GcDzRFL8MD6oEOnmua22GdD97G+DFEu9YCNG61tI4o1qYfLyVcGv2PB8IXCkHN3aqUhYq8HvPAtIwk3oTH9/fptrmlX9pqGK1yyTebtJQinHuocGcAJ356p+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hAueWPVh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b584ac96so804568e87.1
        for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753350547; x=1753955347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9FQ9e+6QrSgFWR/zL+SarceeBtqf3W8b4WkgK0vUaU=;
        b=hAueWPVhBrHcHjcp7sHtqcL7blR0kQ3wezBo4znslxQY3yxLhfO9nbKIqI2zT9ghpv
         29n+MZ9tWq5FbpOzQwKvShx0J8XSjoRsV+hmW6cKBFb5VoLO9Ge5vXeFPQmpsUjEXI2r
         /2/+sMoZXFFBVQzQMVwe3HmJu7YMqmKR8cB50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350547; x=1753955347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9FQ9e+6QrSgFWR/zL+SarceeBtqf3W8b4WkgK0vUaU=;
        b=ESyKvQuj2AIIgFqCQMWFdCnYD9IsgvYd73knsHm3PQzUCIJSZBO5A3TYkr/5P1dAe4
         WMdkBKKDgMcAz79tClHaSiX++yMm1QTKjh7eT9TFJGWwLCtBcT7HTjSuapHISthwadi9
         KfV+AfAO443aOTSE0W2xoy7/ENyBiRaCBGz45rwoCaNgDLHDeIVDpAb/IO2ZddJoq3/E
         Tyt0u+/xX6OJzcTg+t98Bv4PiC4bwN4s+xEUFKNURjRcBIMqOPat+DptjMilNZ9Ax4fw
         w2/1zbc9BB4fd8p1mKV/ytrutfbSEVsc4ASWl6krm/9jJyzF1rEbi/jTJqa9v4rfu+hJ
         yikQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsEbFEVwTKRmg5XR5M71FbMc2YAFaHOrJamuz7gT1WCAF075QKtr9LBVF5JeXOfO2Yyb1mBxHuf+Nlog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBD5GMA47cOYzAUPu3neCCFEzfYaFiToae3a0smrmqf2hRABi
	wUfrxiGVLw4sSCYPZJH2UVsd0H/FPrkvybNPbtP6aUo4sKXaR3YtDmQg4OooaFxnbFfG80zk7Nc
	PNLPnsJVdi+jbPNXvPxRUjbUxZSqsaHGP2s403Ti0
X-Gm-Gg: ASbGncs/R1rSHQNEtK5XffA3D80vxfqeHg3ZuEtdBQzkm2vgxJWNpAQlFBV0VZevqvn
	JuEkqWdO1AG1FEf3KZt3Jk6csme19fC6h3j0iIWai51/1c0EIYINNi/tXucrB05AURboj8z2/Gd
	jb+LFETO/OJKVlW4+7xCW+s5Gs1U62Ia8a6fbW2/YeMaf2plcZDbuiOUFKIpW7MX51Pwco/EvGx
	dGRBZTSLazKHed0vhhJRLkVTQIT0v/gI4Q=
X-Google-Smtp-Source: AGHT+IGzfXywNqkl7ab0cE9pUdYYCcgre/IBfX1N5nV04X+BJ3rA6VLZb3GDp2uT00oIYqG6uR1IPA8f6Im9wahsv0o=
X-Received: by 2002:a05:6512:3084:b0:558:f694:a65e with SMTP id
 2adb3069b0e04-55a513b2e09mr1933097e87.34.1753350547115; Thu, 24 Jul 2025
 02:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-29-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-29-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:48:56 +0800
X-Gm-Features: Ac12FXyvTWPQD4hmzcW0ijsxU85GUvKBlnETlBmcYtQk6_oa7dGsCrwzhdueCNE
Message-ID: <CAGXv+5FvqKNB5Ufx65p5QnueKgEYwNW20tahVPg-kG5N3t+WGQ@mail.gmail.com>
Subject: Re: [PATCH 28/38] arm64: dts: mediatek: mt8173: Fix pinctrl node
 names and cleanup
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Fix the pinctrl node names to adhere to the bindings, as the main
> pin node is supposed to be named like "uart0-pins" and the pinmux
> node named like "pins-bus".
>
> While at it, also cleanup all of the MTK_DRIVE_(x)mA by changing
> that to just the (x) number.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  34 ++---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 138 +++++++++---------
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  60 ++++----
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  28 ++--
>  4 files changed, 128 insertions(+), 132 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> index dfc5c2f0ddef..1004eb8ea52c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> @@ -5,6 +5,14 @@
>
>  #include "mt8173-elm.dtsi"
>
> +&hdmi_mux_pins {
> +       pins-mux {
> +               pinmux =3D <MT8173_PIN_98_URTS1__FUNC_GPIO98>;
> +               bias-pull-up;
> +               output-high;
> +       };
> +};
> +

Should probably mention that a duplicate path reference was fixed.

>  &i2c0 {
>         clock-frequency =3D <200000>;
>  };
> @@ -67,26 +75,16 @@ trackpad2: trackpad@2c {
>         };
>  };
>
> -&mmc1 {
> -       wp-gpios =3D <&pio 42 GPIO_ACTIVE_HIGH>;
> -};
> -
> -&pio {
> -       hdmi_mux_pins: hdmi_mux_pins {
> -               pins2 {
> -                       pinmux =3D <MT8173_PIN_98_URTS1__FUNC_GPIO98>;
> -                       bias-pull-up;
> -                       output-high;
> -               };
> +&mmc1_pins_default {
> +       pins-wp {
> +               pinmux =3D <MT8173_PIN_42_DSI_TE__FUNC_GPIO42>;
> +               input-enable;
> +               bias-pull-up;
>         };
> +};
>
> -       mmc1_pins_default: mmc1default {
> -               pins_wp {
> -                       pinmux =3D <MT8173_PIN_42_DSI_TE__FUNC_GPIO42>;
> -                       input-enable;
> -                       bias-pull-up;
> -               };
> -       };
> +&mmc1 {
> +       wp-gpios =3D <&pio 42 GPIO_ACTIVE_HIGH>;
>  };
>
>  &touchscreen {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/bo=
ot/dts/mediatek/mt8173-elm.dtsi
> index 0d995b342d46..9ec930058b92 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

[...]

> -       bt_wake_pins: bt_wake_pins {
> -               pins1 {
> +       bt_wake_pins: bt-pins {

Nit: I think the original name is better, because IIRC this is
using the RX pin as a GPIO interrupt to wake the system from suspend.

> +               pins-wake {
>                         pinmux =3D <MT8173_PIN_119_KPROW0__FUNC_GPIO119>;
>                         bias-pull-up;
>                 };
>         };
>

[...]

>
> -               pins_ds {
> +               pins-ds {
>                         pinmux =3D <MT8173_PIN_67_MSDC0_DSL__FUNC_MSDC0_D=
SL>;
>                         drive-strength =3D <MTK_DRIVE_10mA>;

Missed one here.

>                         bias-pull-down =3D <MTK_PUPD_SET_R1R0_01>;
>                 };

[...]

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boo=
t/dts/mediatek/mt8173-evb.dts
> index 9fffed0ef4bf..51118a4149d8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts

[...]

> @@ -245,20 +245,29 @@ pins_cmd_dat {
>                         bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;
>                 };
>
> -               pins_clk {
> +               pins-clk {
>                         pinmux =3D <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_C=
LK>;
>                         drive-strength =3D <2>;
>                         bias-pull-down =3D <MTK_PUPD_SET_R1R0_01>;
>                 };
>
> -               pins_rst {
> +               pins-rst {
>                         pinmux =3D <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_=
RSTB>;
>                         bias-pull-up;
>                 };
>         };
>
> -       mmc1_pins_uhs: mmc1 {
> -               pins_cmd_dat {
> +       spi_pins_a: spi0-pins {
> +               pins-bus {
> +                       pinmux =3D <MT8173_PIN_69_SPI_CK__FUNC_SPI_CK_0_>=
,
> +                               <MT8173_PIN_70_SPI_MI__FUNC_SPI_MI_0_>,
> +                               <MT8173_PIN_71_SPI_MO__FUNC_SPI_MO_0_>,
> +                               <MT8173_PIN_72_SPI_CS__FUNC_SPI_CS_0_>;
> +               };
> +       };
> +
> +       mmc1_pins_uhs: mmc1-uhs-pins {

Wrong order?

> +               pins-cmd-dat {
>                         pinmux =3D <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_=
DAT0>,
>                                  <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DA=
T1>,
>                                  <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DA=
T2>,

[...]

Once fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

