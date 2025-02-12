Return-Path: <linux-media+bounces-26092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F2A33079
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 21:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D3663A5201
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 20:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE0220100D;
	Wed, 12 Feb 2025 20:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nOx3ZAuy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E36B2010E1
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 20:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390886; cv=none; b=SOPSaq0wcK/UTCNKVBlDCv21yk/SnXKcw8+dDiAyulnkA0jOqQYMuitJl2MO+vUTez62qCXGek7ifsgb3ON+VcoJzJrAWKyf/Uc/+mFsOeFi19Wspu9ly24YTskhyPNgXnGdLC1pJu3iJ9cKPgAk/GIQn14itXfi2GVHlGrPdIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390886; c=relaxed/simple;
	bh=khSDGr/HZLTO+nneeIVjM+UO5LunJkeAXO6VcsfdNmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BiP8Zyylyx0rXdhv7YyP4rNgo5BHnixQpVVZhZSJX5lDTEddNHg44X48wvrQ9083O6Rsf8wcnl4u8pwV1OjkFTfc9MQ4MUXbqkgwU4YRel8P0NEfowgVVkGEDIvqbTA4348vtQkGIh/nm2H45VDqoe5V7VP+SspA40YN2ZfrAdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nOx3ZAuy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7bccf51e7so2468966b.2
        for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739390882; x=1739995682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iu/7BkGsGBE91wCLd243z0DyD6Dxurxs3l5CaDlz+Xg=;
        b=nOx3ZAuyrVPg+boOfaZepRm5Se9iANC+ddRiLCglXx3jqlFkex5K7qWKMgjAxibS9L
         GTz2C4j9UXc5yNCTmD2qJ0a6Y1X3NnENUsF7VGuZH95zwCsA3OEXatmynKu502cQA0Ww
         LBQyZ0VGu9CjS/pl7fMcqNvEfL1saenGzhS8RfoKuaMjGBWHsP5FrVagdGY9Q9VPr6a5
         irc8OMKXJE2PgWtQEaz+HeeF5AbqXCZUHHbUKDhTt5UR3umPB1bNirXORymTUFqQbcoC
         arkKrmL8uqlSSv5tXLIjgSv9gp433TkrZgTnWlIDqjgXg4titxEQtCy76m/BMM1FLMUi
         XceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390882; x=1739995682;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu/7BkGsGBE91wCLd243z0DyD6Dxurxs3l5CaDlz+Xg=;
        b=MBdrUbOjBwLGRIP57VngylpCj8zIm81EKIFbc+u+JEjnYHLgfrWHbDvAYmLv9SSkGe
         ruNymGwktMM1WBVy22BmhobIL6VvhT2dNKnmR0QZJ6veT48jPBNl85+U1ulfWlHv+tPP
         34pnLNjtQtB4kAgybOhNyBh/n9dA1GpYnBdND1Isrk5uCzcIDxCATg6wJmNdEUtGNDcj
         PqySGQoY3A/nHUHgFmyEzd+If9qTb9ofAWOb4x4a/NdXGTD2gwGPcgHDT66PXUNBrI8i
         y+eui1Dzr2uKGKF3gtm5abLQAYeLiu7lTHNS/b+sOxp5BgeTB1tDz1htjMVoEJw5ieDn
         fOmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNSLnAglcrU9t6HasnZJ57Jq6212dEAGcD4mOvx9xpHgPC/cJmZu3MxBJA0HCGtOpAJjQTFQMEtdT4Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaiK1ocDvYBDsyF5kpDskRWZ0oIDVo0878OpA+Hyj546b1mft2
	UQOutFucjWEOOjKzKGrKDteE01Mj8wuAGTxUebVRhoIwx14gtPZGpG/2cxkWuH4=
X-Gm-Gg: ASbGncvIoCmvM8lHc6IyDlW1SPWQBTCDYnIEtGYeObc/goVVBSCZc0EnX19Of1ZStR7
	c4YsLg9oggcx96eZjsuqNH9uPV9xT1yn0NnTPbfQ8d7pSpyayVHt9PXBGhNQXZzIZvymMMMVDGG
	H0AGbJB4vJvXMVrF3Ojnm6naJTAE8L0AbIqJ03w9QnCN5L8jGZxf0YYKsJYktwASoyKsWc0miTL
	px+/99YzMBBMAb9ojKnYW3Ahz+LEApscytp/f/lkRwnXAGLI3wJNQtuj6CUrolFJ3b3CZtuxsIo
	0NQ92KQaW0bGAIr+H4rr+qmivlVhxOos6fY=
X-Google-Smtp-Source: AGHT+IGJXdMoTs2hWEXInTR+ltJbHmJj8H/ju9vPMe3A99qcrdj0eyslJQbPiSzl9wG+clAd5ieZpw==
X-Received: by 2002:a17:907:3da5:b0:aae:b259:ef5c with SMTP id a640c23a62f3a-ab7f31906bdmr184163766b.0.1739390880917;
        Wed, 12 Feb 2025 12:08:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cf46bf57sm539299666b.165.2025.02.12.12.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 12:08:00 -0800 (PST)
Message-ID: <ab2394be-fe1c-46c1-9940-53b4ee1afc5b@linaro.org>
Date: Wed, 12 Feb 2025 21:07:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
To: Sebastian LaVine <slavine@d3embedded.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav <vaishnav.a@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>,
 Thakkar Devarsh <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
 Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-2-slavine@d3embedded.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250212195656.69528-2-slavine@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2025 20:56, Sebastian LaVine wrote:
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XCLR (System Reset) pin.

s/Specifier for the GPIO connected to the//
But you could say that it is active low, for example.

> +
> +  error0-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XWRN pin.

The same.

> +
> +  error1-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XERR pin.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: ../video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        clock-frequency = <400000>;

Drop, not really relevant.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx728";
> +            reg = <0x1a>;
> +
> +            clocks = <&fixed_clock>;
> +            clock-names = "inck";
> +
> +            reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
> +            error0-gpios = <&sens_exp 1 GPIO_ACTIVE_HIGH>;
> +            error1-gpios = <&sens_exp 2 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                camera1: endpoint {
> +                    remote-endpoint = <&vin1a_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 575f0e6f0532..50bff3558d7d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21885,6 +21885,12 @@ T:     git git://linuxtv.org/media.git
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:     drivers/media/i2c/imx415.c
> 
> +SONY IMX728 SENSOR DRIVER
> +M:     Stuart Burtner <sburtner@d3embedded.com>
> +L:     linux-media@vger.kernel.org
> +S:     Odd Fixes


Hm, why only odd fixes? If you don't care about driver, we also kind of
might not care and remove it soon.


> +F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:     Maxim Levitsky <maximlevitsky@gmail.com>
>  M:     Alex Dubov <oakad@yahoo.com>
> --
> 2.34.1
> 
> Please be aware that this email includes email addresses outside of the organization.


Obviously. Please drop it. You can use b4 relay if you need to escape
corporate junk.

Best regards,
Krzysztof

