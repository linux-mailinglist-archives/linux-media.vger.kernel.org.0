Return-Path: <linux-media+bounces-38451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE106B11CCD
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 12:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D246B1C82F59
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 10:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B73F232368;
	Fri, 25 Jul 2025 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k9Fan013"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A17D14A4F9
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753440634; cv=none; b=QpTjgY7HBq1ii9NrODSKAn6+AVWCIO2bbbswvuv7OdyXX7+f8WWV2XcmTxilLbuLTfzOuC5/k4dzPYVVjf6pS2zdBO9No+gNz1aMyTzzcdQUmCDLM4a3TZI7gt4YwhV/YigNvXHBys7riRGGG14Toi8+9PmJvomEJVGu3QO90OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753440634; c=relaxed/simple;
	bh=KqH01V/ZQOGZhBJpHb3zgphhQB1Sh25Ttt4gkVmURXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jh1DoGMik2QCdWC6iA4BmV1fh2qNMLsBwCSe4Sg4NIbFNFfztk75Du40g9r5wGjh5Th7VOgcT/7Hq25nn2C+XzV2wErY1TYkboR4kL0qwnLhcHwwHfcxxD9YK7B1w1grK/hVTKmRBz18wn2hpfZX2z6uVYPSmU2R5s5uBAVaGlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k9Fan013; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2ea6dd628a7so1030178fac.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753440631; x=1754045431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
        b=k9Fan013uDi+I/DWhrFyVo5gem1XtaeBl/ErNgbXxuGJtVrM+GWpGm1xoJfTcELnvW
         ZP0pFJW26s5d2/Z0hE3rUMhUXI8tfj+xPUqHQ2Xu1Ncei5iBr1oR65Sr+AbyyeRdarxL
         /uXovwfnormfzUfQ3ug4ul/PbXtTUZJLt59I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753440631; x=1754045431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
        b=dKJwzu8T4A/LSrYqIqhrA/11qoJSkEiiXOet2ELTkzIn3zJz1FwvhapXkb0ec+YMdE
         2z+jm7T8FkK3WhLhaR1I5/5OISn3GYG2IVly+nSJMS8UOSDhBHSIlDwLMXgSmxg7qGAv
         4hEaD+s7hrrMkceMNVt3MoiQ+ABgNChgrodtoSNdAhkgQSEd241/reXH3HpLNSMWuQKE
         EFfmFAIGs4DH3OCkEzJeVEDwA4C9FMchso4Rum9QWpim6xiXaVIgXIBRq5eACHcNU1X5
         JaQuOuG5ReDgoEZds97b3sdOaDWlY7RdCDzyp3mCj4fi/K9XK67fQruc11KCZKY++7VE
         gP3g==
X-Forwarded-Encrypted: i=1; AJvYcCVsDEwwBD54YmAo4v7E3Kh2qwXVB8tDhcgxDcHB12p8qXj+kA+rHRQW9S4C9oYpxOsj8ATxx1c6xVq/Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxdp5c+wb6RAbRRIS4GZPxhrk0lUn2nux/OY6aUl1dnnZjwkok
	rG19IuIGTgUgeXzoJZtz44XOQqIJXcKzT7usS2+cYopZIWXpJghHGV2VE/2/rxiYJkl88QqZg4B
	kNxdCjw==
X-Gm-Gg: ASbGncs8vpY2SDVkTI2pnjU21U8WNu2ZF4pkNA4F3Rso1m1QMVeRaGsJ/NYvHiHU61B
	K41Fjf5t0nNjSEhzfhZ7fi+eG2jN+6+QEaC5zvv953LcQCVEuvIhR8OYz0OaQTKrcAkKV6nvdIy
	bDdHvxRk7d5TkxWlZ2js3s1zQF8RhyOToJfa2+UK99lm4ZBTRUNOJVorSwR7GfjbMNFGXtkQCBX
	jWdCbOBlRY4nBouQQ83R8aBRjpTLPXQxyakijBENktimedIqBDY/fzdRu8pnZvwtAUcWA/66vZI
	3MDHBCHdkEHOgUkv9ReJS9b3B3VevDoQt3pepy44KYDfC0r/ChY6KCQpQPKYSV74KRe8d4BrCUL
	XaWYBM+2VtmK4cbNhutL5RSRikcRLzQwZMEsCF/e8BihlxXltcwdkRj6M5Q==
X-Google-Smtp-Source: AGHT+IHtomJUPJe2q7SOb4edvocchB1skfd+z0xRUCmNpCmo2hBtkdNAO+tdsxYIHmrMma6kPlgp0A==
X-Received: by 2002:a05:6871:840a:b0:307:b28:48e3 with SMTP id 586e51a60fabf-3070b284d8bmr125553fac.18.1753440631150;
        Fri, 25 Jul 2025 03:50:31 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-306e1f8a7adsm990732fac.42.2025.07.25.03.50.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:50:30 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ea6dd628a7so1030168fac.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 03:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1pw7G0corBwvFvjQ/JYGvRgIJpcZJ0V3de3s7EeIlPsKQSLuQFXNoK142NVE8zyeqOMLq1VMaLIl83A==@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:4e9:b7e3:bdcd with SMTP id
 ada2fe7eead31-4fa3fad468amr285963137.12.1753440273293; Fri, 25 Jul 2025
 03:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:43:57 +0800
X-Gmail-Original-Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
X-Gm-Features: Ac12FXyc7RkTIKa4HnSlf_SM-GYdwIREUn6AcAkOBKhNuekdCdvFzy29o7Ufs68
Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
Subject: Re: [PATCH 23/38] arm64: dts: mediatek: mt7986a: Fix PCI-Express
 T-PHY node address
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

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The PCIe TPHY is under the soc bus, which provides MMIO, and all
> nodes under that must use the bus, otherwise those would clearly
> be out of place.
>
> Add ranges to the PCIe tphy and assign the address to the main
> node to silence a dtbs_check warning, and fix the children to
> use the MMIO range of t-phy.
>
> Fixes: 963c3b0c47ec ("arm64: dts: mediatek: fix t-phy unit name")
> Fixes: 918aed7abd2d ("arm64: dts: mt7986: add pcie related device nodes")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/=
dts/mediatek/mt7986a.dtsi
> index 559990dcd1d1..3211905b6f86 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -428,16 +428,16 @@ pcie_intc: interrupt-controller {
>                         };
>                 };
>
> -               pcie_phy: t-phy {
> +               pcie_phy: t-phy@11c00000 {
>                         compatible =3D "mediatek,mt7986-tphy",
>                                      "mediatek,generic-tphy-v2";
> -                       ranges;
> -                       #address-cells =3D <2>;
> -                       #size-cells =3D <2>;
> +                       ranges =3D <0 0 0x11c00000 0x20000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
>                         status =3D "disabled";
>
> -                       pcie_port: pcie-phy@11c00000 {
> -                               reg =3D <0 0x11c00000 0 0x20000>;
> +                       pcie_port: pcie-phy@0 {
> +                               reg =3D <0 0x20000>;
>                                 clocks =3D <&clk40m>;
>                                 clock-names =3D "ref";
>                                 #phy-cells =3D <1>;
> --
> 2.50.1
>
>

