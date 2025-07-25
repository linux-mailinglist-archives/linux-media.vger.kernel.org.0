Return-Path: <linux-media+bounces-38469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2747AB11E1A
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 14:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C809567D57
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 12:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECFA24467F;
	Fri, 25 Jul 2025 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LZFbxSk7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49DB242925
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753445074; cv=none; b=srMw16ffKCNZxZ+t7Lf922MVyIVdk8QzjmiHsHwertkqKJ4rpwY1+EDmT4k6E7Op2t8K8qqJALmQZudxAV4EPvJTiRXVd4dtH85cYtc1A/wI7AoFddHWflv5gHv0m5t2RG5S6BRrhuUCP+IEXKqih1ay/vT8rsRHNHfPiBuJwbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753445074; c=relaxed/simple;
	bh=V8hirrUVOWBBWHrhJ7nvVXSHaacevucbhSLPMWQvrV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPPkr1mEAO2TqLjuFt7Y0B9k5EbASSg86w5yx56HcgEKyPYzPXyGJFEg7s/BiiyLt4N699sHAcebimlVGjgNrKhOAH6ArxbR5CBfd9jUeI6jLaI/6x+Qe3I+IkhbNwgIyezkH/7JWYmNkJHmR0+sfLRB2xOHb7xTbQrOgTvacZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LZFbxSk7; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87f36c458afso1222409241.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753445072; x=1754049872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
        b=LZFbxSk7D7fPQ0Czo0A/Kmud3zDwAZ4nUdfwXd39hlJvQa8IPrLpOSoXugfDH3xhQr
         bjN9vu6qd11eXY+yKoR68XFrC2Xiz31gc5kWIpcKhgqeXn5soMBgx7OZD5qZao4t5EW9
         Odd703Wu/2f3tc2DR1F59kbv/ILA3PiY3UeQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753445072; x=1754049872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
        b=N4EHwQn2QD6pHeDyejvB5PLfoWJMkOOmM4kKnX2FUq4ww0+oA0g19FjWslpRB8Jn8S
         aLt/BMW2hm5bbczsP/UkDzpqamvSAcM8ZGrPIk/YdyFTnPr1aj6wdOOVxTFTk9DtNA18
         MZTx5cDE/HWJQrkBb0w6UsEmTq91kq3THK1lZdn1wZQvdEsEE6w8rx1uI/vYIjCYroZI
         D1rkjCnAbWTsw36t9KV60vl5PYV9qBQyWtGKDtK2QTMb61Bb+yyUsfHPQ0AtbnCygwq0
         Sd5yoAGCMPqc3GQd5EA5PO62pAPpIJRignMEILwnnKlwMqO8sx8/l/+OqUuU/Ob8knpJ
         XNcw==
X-Forwarded-Encrypted: i=1; AJvYcCU5etHJtzBxLIPAbfSABDzoGcL8TnYOjsa8DqhnYL9/dqfEzafLBzQpuZ5vfS0dJnlS+W3xfdtEE4bZUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2xY1SGCPtKVMuXm24D6nr7/mO32Capf7Nj8AE2I+6I//q2Gmj
	nBKXMEVHi/Njf1dO4gJQ4lO9zUjSXx9GLwSwaQDjZr9hh/IwYDMtXJXUrhV0mtfbZAOtsOobGd+
	o9tQ=
X-Gm-Gg: ASbGnctDg9N9vplDZSuKzQKKIKFuB6QejziKLYGprhf8D9wWZ09r1kCVBroye5gCsJs
	K4u9bTc1dSQFIX69B15D8oEAflAT2G4bPOcdvEomedUC/rFDORGLkZZmz5QXR+Z7l/SgjX8rRNf
	VVUkdCs7bbG7oxAvKG5y1W/Wl7CBe3ulo2GvnKT/wR+lIclVBMHCdg5mOJcl7tmHi88mNhei/DQ
	Jr5YQLhnYTb42VxHy+1A6pUJIj8SBgvcqez3bq8g/T/qDBPGaFKyrXWLxz17Yoi2TDWRM9LdXui
	vcGA7B3LBiLUutSCUheKvXuFeizBsD0cxKvDlnSiqHB6gqMTywNRzeIuNyVbYIeW0vWuzkFT3vA
	OlV1oJzi+WFZxVuZ4pD/z8lCk9gI9QO+8Vt9IndkyerjRI1xfomN1VLcaZw==
X-Google-Smtp-Source: AGHT+IEDLDDe0S2BzuUoEnHDAYXxVkZ4o7X9WKa0TJ+SrVjBIlH4kncZTbNqL8Md0eCOXXlUbmZoZw==
X-Received: by 2002:a05:6122:ca2:b0:537:765c:b31 with SMTP id 71dfb90a1353d-538db4f355cmr441306e0c.3.1753445071356;
        Fri, 25 Jul 2025 05:04:31 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-537bf643a67sm930877e0c.12.2025.07.25.05.04.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:04:31 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87f36c458afso1222403241.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 05:04:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpl53b/gMwpuIANzy0L0Gn9m+PhhMt238w59ygrbgeUGDpxNOzU/VKTBRCeHfkBjV95++2ViB+lcV3LQ==@vger.kernel.org
X-Received: by 2002:a05:6102:358c:b0:4e4:5df7:a10a with SMTP id
 ada2fe7eead31-4fa3fc6be93mr374132137.16.1753440996607; Fri, 25 Jul 2025
 03:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:55:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
X-Gm-Features: Ac12FXy6b-EYxcfTGxWYM-OfSnpWrsOFjS6YFWPk3kTV_ZIdvcSVvNebJ1JSwHk
Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
Subject: Re: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators,
 rtc, keys node names
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
> The node names for "pmic", "regulators", "rtc", and "keys" are
> dictated by the PMIC MFD binding: change those to adhere to it.
>
> Fixes: aef783f3e0ca ("arm64: dts: mediatek: Add MT6331 PMIC devicetree")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6331.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6331.dtsi
> index d89858c73ab1..243afbffa21f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> @@ -6,12 +6,12 @@
>  #include <dt-bindings/input/input.h>
>
>  &pwrap {
> -       pmic: mt6331 {
> +       pmic: pmic {
>                 compatible =3D "mediatek,mt6331";
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> -               mt6331regulator: mt6331regulator {
> +               mt6331regulator: regulators {
>                         compatible =3D "mediatek,mt6331-regulator";
>
>                         mt6331_vdvfs11_reg: buck-vdvfs11 {
> @@ -258,7 +258,7 @@ mt6331_vrtc_reg: ldo-vrtc {
>                         };
>
>                         mt6331_vdig18_reg: ldo-vdig18 {
> -                               regulator-name =3D "dvdd18_dig";
> +                               regulator-name =3D "vdig18";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
>                                 regulator-ramp-delay =3D <0>;
> @@ -266,11 +266,11 @@ mt6331_vdig18_reg: ldo-vdig18 {
>                         };
>                 };
>
> -               mt6331rtc: mt6331rtc {
> +               mt6331rtc: rtc {
>                         compatible =3D "mediatek,mt6331-rtc";
>                 };
>
> -               mt6331keys: mt6331keys {
> +               mt6331keys: keys {
>                         compatible =3D "mediatek,mt6331-keys";
>                         power {
>                                 linux,keycodes =3D <KEY_POWER>;
> --
> 2.50.1
>
>

