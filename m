Return-Path: <linux-media+bounces-23184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD09EC9A9
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 10:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 775C3169C72
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2773C1E9B03;
	Wed, 11 Dec 2024 09:49:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90EC236FA9;
	Wed, 11 Dec 2024 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733910555; cv=none; b=QL5/lEZsY77DjYYnDHsNuaYLRrBuHFXHEuo4AC5opjsGBbiLWNtZ7M3Wz0eQto0lvUHkV0uYXNVq7pY2WKUDjYPs2+t4CUGFtA6mlOTvbGaXuCRi2NeCNS1xhok3UgXz6aFUsVSFkbH+zdzySMcDllYaRCynTx80zkBF3W+n6mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733910555; c=relaxed/simple;
	bh=ZUQ2IJvBnojUTDcKcS+ybMxTwUjg3Lso5sEdHoLrj/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rC+DENUw0FIlziZSheufmMKQ7VAYxSlFZp7BQWdDPWG8d9OtEFZ9nPzdrkrazFyJp6z9Riy/KWRzo8LKhUnJKf7oBTRvjwg12tE1b8vaxv6CXVyiT4bQsfDs5rl99nlSX3bnLw8BboA6gS2N0kwV1MkLR4xTw1KwDHCtSFdyfdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-300392cc4caso43217751fa.3;
        Wed, 11 Dec 2024 01:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910549; x=1734515349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hPj/BPEUjCTbTNbQyMrIM316Wmjv6S1W3Jo0zGaEmZ4=;
        b=kg41sz5HrXF46bG6wcjEVLlcgwrEa6jctoTcIdGfTqwY3cPbJJseDmtcUhKxVIiXCt
         WQkSI1rvr87wKKej7eteRcuTbAj29OunL1GMoCko0gAxYS1zJ9IN+TUU0Onga5mUYK/V
         N/YeoKPAf3sqy/hjWoGeCQyQIlfE3SnnbsqbppOqxuHji9lfNvnCTjS56D9tZjrWH1I+
         uMykqyH/HZOGKwePvXxekeZw2pIp2hwkqBhna/B9U1qiTRFSugFG+sDLcpvTENzy7Wfk
         MG6EyYWBtbZ/Swb+BJ2pJpkZV0KpeSrSb1A4HX4UGo0urWIsib/+k/xG1ntWnR4weGy4
         Jfyg==
X-Forwarded-Encrypted: i=1; AJvYcCV58ZgLyrvu1nj9Qgwi6CHosvjr1IG8VXTNasE4B8wNO2j8gN7lETMZdXEvXzZAw3Cn5lnRMcbFkz5IJ6aB@vger.kernel.org, AJvYcCWcLgw49Z47+K+HmwTr0SBxFG5sTH/nNiblgxBGKdABI3MQo3+RorbFfJ5hsievmEmVIc1fZPKswObmo/W+gA==@vger.kernel.org, AJvYcCXI4DSlCrenDHMwqPGm7R8ojWpznw91mO77ltdqD1zAkq9p7mg838CKhQe2EcbZbyZO9SDdE9hLIzUt@vger.kernel.org, AJvYcCXQMIGeCX4o+2dAP2bF5i0mMAgydTHWMxQ+hqiBhIPo0a215EmRX59dTZY6VbZjSQvg90AGcGmgBsGwuyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkrDQapWnTqYRu56ZVNb4B6ivNUixD65sy6GEelQMpEBtuUhvN
	use24rfk+IdjuHqaQ6sILXJEHSFhY9vufaobXCq8XUzSOlfWVQzr5i5Ys+sX
X-Gm-Gg: ASbGnctFFmoYpIpdEww2PoJSn23zsrYKlk6rnli4U0ZUm1dZHHcxP3L/G34/9ZA77s+
	M4NuFB+YfmdB8VqtLjC7BKTuOl4fxnk/0stCw/UsDenmYoVpz+jcrem7bTvsiVaH46W2NOu2+QB
	4BacEn1N8vnXAtUp4hI4Q2WCniM24+3iOXq/2dcPdV7npiAghPq4NL2pAsrWiPl8NZESSEwFI+4
	ldehv6pede4Exx9Fztx/11IgZG0dEA6UBIimj5GokToSBULNAEcookHPNGMU1ZpTYeAb0Re297k
	28YphxJOhLM=
X-Google-Smtp-Source: AGHT+IFeEnLuWTqfaXtkqs9vsgKzAGzWK695ujMCHusxXFd0a3Yd/HNshVLnckIzq0f0aFZS/NBGSg==
X-Received: by 2002:a05:651c:1541:b0:302:1e65:f2ab with SMTP id 38308e7fff4ca-30240d08a91mr8226131fa.20.1733910548237;
        Wed, 11 Dec 2024 01:49:08 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3003a2e4575sm13680261fa.1.2024.12.11.01.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 01:49:07 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3003e203acaso36075701fa.1;
        Wed, 11 Dec 2024 01:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVH+21qHUv7NK+zp+9Er56RcbUKcCd4jw8mRGFOhyeZ89aIzAhNilwjkNDne7x972/mKZjiMOuRVGao@vger.kernel.org, AJvYcCVObjNmsKiuEF0/YbdrH5p2FayR7gZkdU1dLykm9Agkn9cnKVtV4XGJIyITHBSgyWIKCmcYnxfSfMVkIwA=@vger.kernel.org, AJvYcCX0+PvVezYbeg3RupXyJRAdPjfxTup34y5+p0nTFTAI8/v7YDHh3eZQpEcoJCo6ULk29L211cwjDWtbYXqfEg==@vger.kernel.org, AJvYcCXNRA0WewsEPIsRoe4/v9lRnwBUSKYrBNEB5QFJvEtdMSst7IG6yj0AQTMdjEfP4UYe+jkPQmtSDM6z0Ihm@vger.kernel.org
X-Received: by 2002:a05:651c:556:b0:300:3a15:8f1f with SMTP id
 38308e7fff4ca-30240d5d82amr7824591fa.32.1733910547069; Wed, 11 Dec 2024
 01:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211092509.34342-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241211092509.34342-1-krzysztof.kozlowski@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 11 Dec 2024 17:48:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v64bGgum7L2Fcg=FBru7ousCJgSyew7kr7VvYhM+ok_dKA@mail.gmail.com>
Message-ID: <CAGb2v64bGgum7L2Fcg=FBru7ousCJgSyew7kr7VvYhM+ok_dKA@mail.gmail.com>
Subject: Re: [RESEND PATCH] media: dt-bindings: trivial white-space and
 example cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ming Qian <ming.qian@nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>, Shijie Qin <shijie.qin@nxp.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Emil Velikov <emil.velikov@collabora.com>, 
	Del Regno <angelogioacchino.delregno@somainline.org>, 
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 5:25=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Minor cleanups without funcitonal impact:
>  - There should not be an empty blank line after SPDX tag,
>  - Convention is to indent DTS examples in coding style with 2- or
>    4-space indentation (4 is preferred),
>  - Drop unused labels in DTS examples.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Resending second time, because I missed previous Rob's review.
>
> I added now also Bryan's and Heiko's reviews from last resend.
> ---
>  .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  1 -

FWIW,

Acked-by: Chen-Yu Tsai <wens@csie.org>

>  .../bindings/media/amlogic,meson-ir-tx.yaml   |  1 -
>  .../bindings/media/amphion,vpu.yaml           |  1 -
>  .../bindings/media/fsl,imx6ull-pxp.yaml       |  1 -
>  .../media/mediatek,vcodec-decoder.yaml        |  1 -
>  .../media/mediatek,vcodec-encoder.yaml        |  1 -
>  .../media/mediatek,vcodec-subdev-decoder.yaml |  1 -
>  .../media/microchip,sama5d4-vdec.yaml         | 17 ++++----
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 41 +++++++++----------
>  .../bindings/media/qcom,msm8916-camss.yaml    |  1 -
>  .../bindings/media/qcom,msm8996-camss.yaml    |  1 -
>  .../bindings/media/qcom,sdm660-camss.yaml     |  1 -
>  .../bindings/media/qcom,sdm845-camss.yaml     |  1 -
>  .../bindings/media/qcom,sm8250-camss.yaml     |  1 -
>  .../bindings/media/rockchip,rk3568-vepu.yaml  |  1 -
>  .../bindings/media/rockchip-vpu.yaml          | 29 +++++++------
>  16 files changed, 42 insertions(+), 58 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-=
vpu-g2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-v=
pu-g2.yaml
> index a4f06bbdfe49..8ba5177ac631 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.=
yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.=
yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/allwinner,sun50i-h6-vpu-g2.yaml=
#
> diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.=
yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> index 377acce93423..6da8a6aded23 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/amlogic,meson-ir-tx.yaml#
> diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/D=
ocumentation/devicetree/bindings/media/amphion,vpu.yaml
> index 9801de3ed84e..5a920d9e78c7 100644
> --- a/Documentation/devicetree/bindings/media/amphion,vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/amphion,vpu.yaml#
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml=
 b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> index 84a5e894ace4..3f47744459aa 100644
> --- a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> +++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-deco=
der.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.=
yaml
> index b401c67e3ba0..d726d141a434 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yam=
l
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yam=
l
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-enco=
der.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.=
yaml
> index b45743d0a9ec..110e8f5f1f9e 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yam=
l
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yam=
l
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index a500a585c692..5865e6f0be89 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.=
yaml#
> diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vd=
ec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.ya=
ml
> index 59b805ca47c5..ede086d55add 100644
> --- a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#
> @@ -36,12 +35,12 @@ additionalProperties: false
>
>  examples:
>    - |
> -        #include <dt-bindings/clock/at91.h>
> -        #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
>
> -        vdec0: vdec@300000 {
> -                compatible =3D "microchip,sama5d4-vdec";
> -                reg =3D <0x00300000 0x100000>;
> -                interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 4>;
> -                clocks =3D <&pmc PMC_TYPE_PERIPHERAL 19>;
> -        };
> +    vdec@300000 {
> +        compatible =3D "microchip,sama5d4-vdec";
> +        reg =3D <0x00300000 0x100000>;
> +        interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 4>;
> +        clocks =3D <&pmc PMC_TYPE_PERIPHERAL 19>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml =
b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 3d58f02b0c5d..19528262810a 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/nxp,imx8mq-vpu.yaml#
> @@ -44,26 +43,26 @@ additionalProperties: false
>
>  examples:
>    - |
> -        #include <dt-bindings/clock/imx8mq-clock.h>
> -        #include <dt-bindings/power/imx8mq-power.h>
> -        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/power/imx8mq-power.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> -        vpu_g1: video-codec@38300000 {
> -                compatible =3D "nxp,imx8mq-vpu-g1";
> -                reg =3D <0x38300000 0x10000>;
> -                interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks =3D <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
> -                power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
> -        };
> +    video-codec@38300000 {
> +        compatible =3D "nxp,imx8mq-vpu-g1";
> +        reg =3D <0x38300000 0x10000>;
> +        interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
> +        power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
> +    };
>    - |
> -        #include <dt-bindings/clock/imx8mq-clock.h>
> -        #include <dt-bindings/power/imx8mq-power.h>
> -        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/power/imx8mq-power.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> -        vpu_g2: video-codec@38300000 {
> -                compatible =3D "nxp,imx8mq-vpu-g2";
> -                reg =3D <0x38310000 0x10000>;
> -                interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks =3D <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> -                power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
> -        };
> +    video-codec@38300000 {
> +        compatible =3D "nxp,imx8mq-vpu-g2";
> +        reg =3D <0x38310000 0x10000>;
> +        interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> +        power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> index 9cc0a968a401..3469a43f00d4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> index 5cb0e337ea6e..644646de338a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> index 584106e275f6..68d8670557f5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index d32daaef1b50..289494f561e5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index 06db2c1e6079..a372d991e652 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu=
.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> index 947ad699cc5e..d246f5d38427 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/rockchip,rk3568-vepu.yaml#
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/=
Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> index 719aeb2dc593..8c2501634080 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
> @@ -92,18 +91,18 @@ additionalProperties: false
>
>  examples:
>    - |
> -        #include <dt-bindings/clock/rk3288-cru.h>
> -        #include <dt-bindings/interrupt-controller/arm-gic.h>
> -        #include <dt-bindings/power/rk3288-power.h>
> +    #include <dt-bindings/clock/rk3288-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3288-power.h>
>
> -        vpu: video-codec@ff9a0000 {
> -                compatible =3D "rockchip,rk3288-vpu";
> -                reg =3D <0xff9a0000 0x800>;
> -                interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> -                             <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> -                interrupt-names =3D "vepu", "vdpu";
> -                clocks =3D <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
> -                clock-names =3D "aclk", "hclk";
> -                power-domains =3D <&power RK3288_PD_VIDEO>;
> -                iommus =3D <&vpu_mmu>;
> -        };
> +    video-codec@ff9a0000 {
> +        compatible =3D "rockchip,rk3288-vpu";
> +        reg =3D <0xff9a0000 0x800>;
> +        interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "vepu", "vdpu";
> +        clocks =3D <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
> +        clock-names =3D "aclk", "hclk";
> +        power-domains =3D <&power RK3288_PD_VIDEO>;
> +        iommus =3D <&vpu_mmu>;
> +    };
> --
> 2.43.0
>
>

