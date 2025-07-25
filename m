Return-Path: <linux-media+bounces-38468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561DB11E0F
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 14:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A4EA1C27724
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 12:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEEF244EA0;
	Fri, 25 Jul 2025 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZH92rc4C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B141F242D93
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444864; cv=none; b=VFkQPRq8f5Xps8eDwznY98VFYcBraDlSNvaQ2AVoPj4ocCRZOqB3va0tcmfN92KvkMgVJgG43Fw4wPrE8Uu9Aq2utV5Emd75oc5/DpkPueV8DZCOj3u5jFb3MvmAJ8i7GJCzqgpQypo2mDXyL9ptMUwPIC7v7Rf73exXKfNI5Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444864; c=relaxed/simple;
	bh=wuFFxAizy2X1aAZ/SF2x06cfnVSKnpsKMko3UN4we2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScJF4nyhp4rlTamzKUxEJNvmdy8K4qkWPi1QBypJqRap2p4CbrPzo9BTUXiif4xX4hwbRzvB0jlJOVr3eXs7JK4CN8pYMvo+0/RHsP47Uqf4vYW6kpliwB8D+5+S+aTsb0O3zxybDsjvQofa5mqhOJtQ/8IhBJKcrFmIPUiD7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZH92rc4C; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-884f2b3bc2eso469472241.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 05:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444861; x=1754049661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaRYlYWMnL5FdToAvFBY21N9TEhebXI6JAmJStjizl0=;
        b=ZH92rc4CROBHrHDoSdRGEpz0J5YVngr2G5WpTpJrpOANGuYI0GerO6IUNmZsQUOrye
         oVQe8pdgGFaA5JgnqSseD1W+behkKCTqENVEk7zEdui/z1J0gYUVCIhBg1Xok1VNbfCq
         7Yx0WldxjbdPU5yRqA/7VvoKK7wrY++KZAlUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444861; x=1754049661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaRYlYWMnL5FdToAvFBY21N9TEhebXI6JAmJStjizl0=;
        b=t3STOceitJgBrABEdTKSkMAq4NJflQ11B+/FHaIC2hF3AIcU4phl9yyXOWmjVZKLEV
         0YBcpmNg2YLslmVodic5fDx/EYkawP0eTOIMolIGqzlefa8rz5iZ65pBht6GQzY9beW0
         SLpeOlncCfs1FXut2iJ/i652TPVA3sCyhEfzmwwTGLvuvq09sWn4kt5My6EYfnyd2E0L
         G3/HyspZkDNAEXvxRL8OSdlDCcew5Gkwzgl7X0ghCoaFGFRAE7Bl2z/944g4wUt5o4xu
         Nr0T6HQViX1xJXsw9svejL7ERT/QV3LYmFG3fVy6KjVkJyrHrTKT6DrOEGcRVNJ3a/1V
         Xl3w==
X-Forwarded-Encrypted: i=1; AJvYcCUwHGDgvBGN4xvcew3Kv1edny5QoHuw2ZF+Do3Wqs0T96cgg3oZtl5L1SE7sZ4RU1Gk+VwhY/f84a4k9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCbthXlMa3HhYMTuJPnY5YdzeJRIaqXea8YEPLAxpXtaN16fT
	c+EZgv+wnswNLuiWPP36IukR8Y/b4tZmkxboRWLl7BMfE8eJyub5D5LcgAGxeghoiPWqB9Zg3S+
	/9zQ=
X-Gm-Gg: ASbGncsav17FW5PdoxwmHh02BoEp+cfBOkyhEeINNlVFofyRxhd4RyGRbZaY9GUQXdD
	Vkufdm/0w174bAps4GOkFAUDaemZyeVBABNXnsT5G4Cslk3gu9Mt367y3eycksJhZrd/g96ke66
	MjTdmOsgdnP/tR5hudiu1efdzJ/6aZVIehEhnj0QAhqMCotz0jM8/sPpl4QEIcA5JzEusES3ILu
	XExFJ5zRTy/oxfZANuUR5DBMvEzJWBhAQVp50xUN0XiOsYLxo/84sXPqQoWgcXSOftuObaIKAHB
	RuLSgQbFBt6IGEuNRky1k4vqWMj4PMHC76QJAOe2ZGEwgJz1hm6LFv7OOdWF5V8qOmJrVICnwn2
	2MiNelzNrE/GGIIJkqBAvaB9l+UTRnePQUWaLgX6CKFKLqJO+zbEWxRmBspQrqw==
X-Google-Smtp-Source: AGHT+IHQ/Qmr4UGf9/1gp4Ggt+akgb+Y9qPfEU4LoGT6blngqYpX3jziV8yPlwImuhIdVyFpg89LhQ==
X-Received: by 2002:a05:6102:374b:b0:4e5:a83a:3ceb with SMTP id ada2fe7eead31-4fa3ff7b424mr390449137.20.1753444860521;
        Fri, 25 Jul 2025 05:01:00 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632d61a38sm236363385a.26.2025.07.25.05.01.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:01:00 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ab3d08dd53so18806371cf.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 05:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUB0N5BCgt3Dhu91YW09oDSGC6bGbd8YnpxBpWWkMCzD/HVi8JqylTcztRDquWeELyXosCPWO4nXg2OfQ==@vger.kernel.org
X-Received: by 2002:a05:6102:cce:b0:4e6:4e64:baeb with SMTP id
 ada2fe7eead31-4fa3ff55fbamr323634137.17.1753441040390; Fri, 25 Jul 2025
 03:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-18-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:56:44 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh5bF6kZe7TFA_EGPGt8Xp_rfuc-rkeXgjRCU=QEtZQiw@mail.gmail.com>
X-Gm-Features: Ac12FXw-hSTS0fHSbHXeHNK-nhzfyTLOXfpWf3gYQQXz8LA0IhEjugCIp682sPw
Message-ID: <CAC=S1nh5bF6kZe7TFA_EGPGt8Xp_rfuc-rkeXgjRCU=QEtZQiw@mail.gmail.com>
Subject: Re: [PATCH 17/38] arm64: dts: mediatek: mt6797: Fix pinctrl node names
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

On Thu, Jul 24, 2025 at 5:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change the pinctrl node names to adhere to the binding: the main
> nodes are now named like "uart0-pins" and the children "pins-bus".
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi | 40 ++++++++++++------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6797.dtsi
> index 0e9d11b4585b..be401617dfd8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -135,71 +135,71 @@ pio: pinctrl@10005000 {
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>
> -               uart0_pins_a: uart0 {
> -                       pins0 {
> +               uart0_pins_a: uart0-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO234__FUNC_UTXD0>,
>                                          <MT6797_GPIO235__FUNC_URXD0>;
>                         };
>                 };
>
> -               uart1_pins_a: uart1 {
> -                       pins1 {
> +               uart1_pins_a: uart1-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO232__FUNC_URXD1>,
>                                          <MT6797_GPIO233__FUNC_UTXD1>;
>                         };
>                 };
>
> -               i2c0_pins_a: i2c0 {
> -                       pins0 {
> +               i2c0_pins_a: i2c0-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO37__FUNC_SCL0_0>,
>                                          <MT6797_GPIO38__FUNC_SDA0_0>;
>                         };
>                 };
>
> -               i2c1_pins_a: i2c1 {
> -                       pins1 {
> +               i2c1_pins_a: i2c1-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO55__FUNC_SCL1_0>,
>                                          <MT6797_GPIO56__FUNC_SDA1_0>;
>                         };
>                 };
>
> -               i2c2_pins_a: i2c2 {
> -                       pins2 {
> +               i2c2_pins_a: i2c2-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO96__FUNC_SCL2_0>,
>                                          <MT6797_GPIO95__FUNC_SDA2_0>;
>                         };
>                 };
>
> -               i2c3_pins_a: i2c3 {
> -                       pins3 {
> +               i2c3_pins_a: i2c3-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO75__FUNC_SDA3_0>,
>                                          <MT6797_GPIO74__FUNC_SCL3_0>;
>                         };
>                 };
>
> -               i2c4_pins_a: i2c4 {
> -                       pins4 {
> +               i2c4_pins_a: i2c4-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO238__FUNC_SDA4_0>,
>                                          <MT6797_GPIO239__FUNC_SCL4_0>;
>                         };
>                 };
>
> -               i2c5_pins_a: i2c5 {
> -                       pins5 {
> +               i2c5_pins_a: i2c5-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO240__FUNC_SDA5_0>,
>                                          <MT6797_GPIO241__FUNC_SCL5_0>;
>                         };
>                 };
>
> -               i2c6_pins_a: i2c6 {
> -                       pins6 {
> +               i2c6_pins_a: i2c6-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO152__FUNC_SDA6_0>,
>                                          <MT6797_GPIO151__FUNC_SCL6_0>;
>                         };
>                 };
>
> -               i2c7_pins_a: i2c7 {
> -                       pins7 {
> +               i2c7_pins_a: i2c7-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO154__FUNC_SDA7_0>,
>                                          <MT6797_GPIO153__FUNC_SCL7_0>;
>                         };
> --
> 2.50.1
>
>

