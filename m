Return-Path: <linux-media+bounces-38449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEF9B11C43
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 12:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D79F5630C1
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 10:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600E92DE6EF;
	Fri, 25 Jul 2025 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e3rXWn4n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9C2DCF6B
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753439099; cv=none; b=tN754i0dDvMMGoTM3LbULMWhI2B4i7R8xCFl8tcOfwpIO1DqUf1ctqW2xOtB7QwQx+xPbi62iD3Jq7+vT8g+8hj2PV8+PYlO2DZOXPkGt5bp9m5VgV9iiHP27401IAU0xqdf8QxtutUWES5+GV4YTQRxDN7LbrGh8sNsogblPVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753439099; c=relaxed/simple;
	bh=2XXVnmKfKOuWrZjQTjDdYxCXEPvU5YjHEeLez+QHVDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/hHRIB+s+BjIkt1u6tywD1sFgidHD0GQlQKycTMlTk/1fc99XhP0tY4s/WqbQfACYle0Dz7bcHwQlLwSQEQsjJ4ZZEe8iFVLBw4iwLj2fOFXnGo5xYfawsF+vucEBSw5kynXA2kSiW4N9cUty+geNgtu5AvcyhcFPtJIZfMBBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e3rXWn4n; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2ffaa884a44so1016536fac.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753439097; x=1754043897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=;
        b=e3rXWn4nW8r7zi3CPJBHeAfyXrH3hFHn4byrR/lvbpY3Yp2MXflUxN+Bkp3XihKQsA
         Z6sBfFf0fPgw9g5OmSNkyVdVgGwQheBbA9j3PsHf5w5CR/64p2RAMgYurBqfGfebWQhN
         vevMppJu22YXCPff7KF+0iX0/bIr0tvbUuR2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753439097; x=1754043897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=;
        b=wAuEjHn8HPLc2jFVkNRzlhGI2KVO9A6Dh2db6LUdqlF5rOaCS+xfyQQleUZ8GNvoFq
         OExsDc7vhe7O/WstzYITsR0FGfESgs0cYbszgShClMkDlGwewwukgcCQTEBnbpZlmCNb
         kQQFmx8lKl4y8QAZLZsqp73e0212UFKjE9Rbm6CEJUMLU0rcfYZRUbaaHYcL6S9hhr96
         MNWVqCEsUT11oQByY+MRVB2OYoO6wB/PWZjer8NstB6tRVTddpNGmwOCeNrvpXS8tDvQ
         MdziHw+/aqxqvKD8B3OQ28qLGqYNdSnhrZHXvvlqoj+slz/YjG5L+pkrsfnbZB7QYX2t
         MWdg==
X-Forwarded-Encrypted: i=1; AJvYcCV5yIsDq5Fv8XoGhRSVZlnt+Xu9KRJdyw4ZVr/taKSygV8tzMz1KQpbPZAGWPFxOPnQetqga/EqbQR5YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNLylzTpWBLXKdF9dbwB4nVXhKsX2PLu+1sTdrOu4AOB56o743
	7hROU6IK9396oyoLDGFyralkqBEK/8r0MhjZL0313+ifAjdiZdFOE9kMsVEsoiRmlUBihrfL3zE
	JLWY=
X-Gm-Gg: ASbGncuVoM85cxx6oASzYJma2GxOUl6NWJaXhfsl36jOCpDt1Y7ZNL1et8vq08GGQ8E
	dnTAi0Bef3D1SSgPg2OerAPqb4tAZRhSbVDs5kcl6ciHtmWeT8cJMAHouLHH11PqJ3pG2jpWYXV
	MCki939lH7AAun8MzGqFJ0Pp6G+RcZCVKpWOuHpXsMRLfcI6N3NjbQJdyuf6aF70p2dY0xktK8Q
	7/LX9wq8Vz+OuU1Wy+b8bzZ0wA5AnyDfK1ytdeXtP3hQBiDGE7s5bnWFI2gihmch9RNVSWzFAVp
	LhHEJoRD7RBibdaSeM9YBKxiL4E0CGadQ0SDf3c2MVco9qeqFgAPr5+u65EBQZryom9jpflBPJi
	Es+XeNmFCVWVORGyHWwF0hCcIiU28JMO2JtwKvvaPwzy3rU6brFxyoP62Xg==
X-Google-Smtp-Source: AGHT+IFOvsVOGOjFRuiZqBURay/NymewroJok8z0yMIbXZqj/i62A9vFRXqfouzgnJNVR9WlTIHLIw==
X-Received: by 2002:a05:6870:1586:b0:2da:b440:5b1 with SMTP id 586e51a60fabf-30701ef7532mr789091fac.5.1753439097106;
        Fri, 25 Jul 2025 03:24:57 -0700 (PDT)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-306e1cb5578sm997518fac.19.2025.07.25.03.24.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:24:56 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-615913ff67fso1067911eaf.0
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 03:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDLMjeFe9lStXMMnlzB6Y/uM3XvAn418CQ6fSf1Q0Ff66lxkdnrZem4g2RlVw4KjdO8wdYg8EwCRBKCw==@vger.kernel.org
X-Received: by 2002:a05:6102:1623:b0:4fa:dd4:6877 with SMTP id
 ada2fe7eead31-4fa2eb0ce5dmr2502816137.4.1753438693359; Fri, 25 Jul 2025
 03:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:17:35 +0800
X-Gmail-Original-Message-ID: <CAC=S1niM4ddPSaOM9uMRQuUS8HwPw+gtxe9kGUggWQx6uio5eA@mail.gmail.com>
X-Gm-Features: Ac12FXzF0-E5XCOaIf5MFeMvqjYMvWSzSdwqzh1uEwhsUpfXPcd-rqBecXNopmU
Message-ID: <CAC=S1niM4ddPSaOM9uMRQuUS8HwPw+gtxe9kGUggWQx6uio5eA@mail.gmail.com>
Subject: Re: [PATCH 30/38] arm64: dts: mediatek: pumpkin-common: Fix pinctrl
 node names
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
>  .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm6=
4/boot/dts/mediatek/pumpkin-common.dtsi
> index a356db5fcc5f..805fb82138a8 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -198,8 +198,8 @@ &usb_phy {
>  };
>
>  &pio {
> -       gpio_keys_default: gpiodefault {
> -               pins_cmd_dat {
> +       gpio_keys_default: gpio-keys-pins {
> +               pins-cmd-dat {
>                         pinmux =3D <MT8516_PIN_42_KPCOL0__FUNC_GPIO42>,
>                                  <MT8516_PIN_43_KPCOL1__FUNC_GPIO43>;
>                         bias-pull-up;
> @@ -207,7 +207,7 @@ pins_cmd_dat {
>                 };
>         };
>
> -       i2c0_pins_a: i2c0 {
> +       i2c0_pins_a: i2c0-pins {
>                 pins1 {
>                         pinmux =3D <MT8516_PIN_58_SDA0__FUNC_SDA0_0>,
>                                  <MT8516_PIN_59_SCL0__FUNC_SCL0_0>;
> @@ -215,7 +215,7 @@ pins1 {
>                 };
>         };
>
> -       i2c2_pins_a: i2c2 {
> +       i2c2_pins_a: i2c2-pins {
>                 pins1 {
>                         pinmux =3D <MT8516_PIN_60_SDA2__FUNC_SDA2_0>,
>                                  <MT8516_PIN_61_SCL2__FUNC_SCL2_0>;
> @@ -223,21 +223,21 @@ pins1 {
>                 };
>         };
>
> -       tca6416_pins: pinmux_tca6416_pins {
> -               gpio_mux_rst_n_pin {
> +       tca6416_pins: tca6416-pins {
> +               pins-mux-rstn {
>                         pinmux =3D <MT8516_PIN_65_UTXD1__FUNC_GPIO65>;
>                         output-high;
>                 };
>
> -               gpio_mux_int_n_pin {
> +               pins-mux-intn {
>                         pinmux =3D <MT8516_PIN_64_URXD1__FUNC_GPIO64>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>         };
>
> -       ethernet_pins_default: ethernet {
> -               pins_ethernet {
> +       ethernet_pins_default: ethernet-pins {
> +               pins-eth {
>                         pinmux =3D <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
>                                  <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
>                                  <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,
> --
> 2.50.1
>
>

