Return-Path: <linux-media+bounces-42442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 282A7B55102
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 16:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D027E178C6B
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD28314B75;
	Fri, 12 Sep 2025 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJxTEXYv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891E311C2D
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 14:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686847; cv=none; b=PAwCkOW83QfZyVvXieBJdA36oBk7X+ZrXl6gMUvRxyrfRfAw2G+lDKJ7ErgggBXRxa5e6rVScc8/WemlE4JhnMMEQhAxWEWLmOGHqYKckH8lzAUaNW8St2hK5B1gz2dNm546oUB52G70DvzklTeEbN5gymQPsWdVUvWFbLStnwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686847; c=relaxed/simple;
	bh=jr9vPW7mvkeyuX3NZoS0Z1cuJUAyUe184FUn8+qt+kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=feqSyUa35uPmt9qFqlFPd991Z3Xae5mCqbRimq73q9kJfr12/7uNUFoAf69wkdRi8JWXlKSWyEpGXqR59wKcpTpDO27aX9tYOvRUstAMeH00EU2lqiIkJVlbl8zKInqaNPf9eUARHoNsd80AGj+lkqNIIQtviUWLbtPBQyvTsJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJxTEXYv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso15166265e9.3
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 07:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686844; x=1758291644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lthXnEjSvsHbapckxRc04Ei+riXtEdUUKc9+Bt6m9I4=;
        b=dJxTEXYv9qM45gz9E4H1eXJZh1H+7cmokkEtN25rupjfnViARND4C7m9jB1SGRSg8w
         sPPM6aFtzdADEqEPOKsHRkI6F4Z/KLnMw+OYAQftQVNWoEDD3ks8ILT88tbuN4votYIh
         ED2ICF1MCr09JjU7+fkd0/YrjwWC8Tn7d45ezt7NHPkwV0D7aPuXNrh+DK8XNaeYAjYl
         5Nse31W9gFH9v6N+G+77+QTANe365aVZw7awvoFsOcPN2yN3V10L/HqQDK0hXvRuRkEA
         cang+PoStY9SHwW4pAoQurdb7X8E9WkmvTWkyrnHY9JybvPHnc4NGc/PnlKhfbBDZXVJ
         HADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686844; x=1758291644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lthXnEjSvsHbapckxRc04Ei+riXtEdUUKc9+Bt6m9I4=;
        b=Jb8ZKqaf+3VIQJE28Mg+S8s2MyTh+xULPmvs7uiaFiKwmygdfXgipu25wy4lj/Lww5
         TX9oWhhpo2tnN0VnPJy9YSspJuCWiVNN7ObHiaaU8fkEDtepvrAwPAI2awI9uaCRzgWP
         /v52DKUbu26VdcblhvMu278WpBHpXVLQ8t/usSLQGRlmzqkDNAP5GC3BmMPh/FL7XdzY
         OeIU1RlF1dt/IRR9950qbotg6YFqHs3oZBbzq/5/S+SbNVT6B3rCGjbTVCq0O7sgb5aI
         Gfb7Sfv58qzUzuBa8EBT3BET8kU+H7LLE/V/nhaj0lhy0G0YFdJddZLgtYu4QmJgcrmU
         FiUA==
X-Forwarded-Encrypted: i=1; AJvYcCVpNCJAFpwF8SxOUU8iao7TVH5/BiljvorH5ulXCyw6oamS96E2PS7JeBPryFQz3IzRW7dYA9KvacBueA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqb2tHv0rYssrYJ8pYprviXIlxG60lFkDF6mNRI0nPo1YlRfjy
	r3SZ31a3qS4HSmcFZMDNlr8AafF68aSBqgiPtBaGfN12a9OMxXzWN/Zt
X-Gm-Gg: ASbGncvDsZHGR6acwuIT+W4OOE0ZB3Sh2FQ7KlBzPWYzPeijwke1kbD1wYa/sqGMt2E
	XMeBpHpQNwugFnCo/cKvg27PcXc+Ug41leoHqUHZ4qIZ3sqIAKnvAvfIyxephmq5e1bLqDJbX75
	dFT4sIjUkOM+6t2VIw+p435NFEBDWjU4ReIQdqbBTpDihgzJuLHVAARGLgNt/NQ4pbmZwJRRHBF
	faKUJbSINMu5dzJAyPvdXkiVsMPKal/Imnd76bT+bdLBsD4NP2EgdUItGk32veoS8K8+IO9F+Qb
	xk/6WOWGPbFJR4UzVjy3CpsEZjURWSeRHZuC8BAhN/uCsXpSeV1jt7A5/fZppLlNmLubIY35ipj
	dHRlCN7SCuZp0cyqwgX1hEKT+LdPBGoegI5vSdMsT/prdNcwFqgzq
X-Google-Smtp-Source: AGHT+IFqrxlW5v3Vy46wYJ2sE/wtXVC2vb0Byrr7NgxSOjj9QTmCoTJsKTMUA+e1n+AH0Kve613Tyw==
X-Received: by 2002:a05:600c:6b06:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-45f211d0795mr28833695e9.10.1757686842371;
        Fri, 12 Sep 2025 07:20:42 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d7595sm63116405e9.24.2025.09.12.07.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:20:41 -0700 (PDT)
Message-ID: <3b3197b7-3e60-4a1a-b6bb-3a0a0ef1fdd4@gmail.com>
Date: Fri, 12 Sep 2025 16:13:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/38] arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 xsFNBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABzSlNYXR0aGlhcyBC
 cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPsLBkgQTAQIAPAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCWt3scQIZAQAKCRDZFAuy
 VhMC8WzRD/4onkC+gCxG+dvui5SXCJ7bGLCu0xVtiGC673Kz5Aq3heITsERHBV0BqqctOEBy
 ZozQQe2Hindu9lasOmwfH8+vfTK+2teCgWesoE3g3XKbrOCB4RSrQmXGC3JYx6rcvMlLV/Ch
 YMRR3qv04BOchnjkGtvm9aZWH52/6XfChyh7XYndTe5F2bqeTjt+kF/ql+xMc4E6pniqIfkv
 c0wsH4CkBHqoZl9w5e/b9MspTqsU9NszTEOFhy7p2CYw6JEa/vmzR6YDzGs8AihieIXDOfpT
 DUr0YUlDrwDSrlm/2MjNIPTmSGHH94ScOqu/XmGW/0q1iar/Yr0leomUOeeEzCqQtunqShtE
 4Mn2uEixFL+9jiVtMjujr6mphznwpEqObPCZ3IcWqOFEz77rSL+oqFiEA03A2WBDlMm++Sve
 9jpkJBLosJRhAYmQ6ey6MFO6Krylw1LXcq5z1XQQavtFRgZoruHZ3XlhT5wcfLJtAqrtfCe0
 aQ0kJW+4zj9/So0uxJDAtGuOpDYnmK26dgFN0tAhVuNInEVhtErtLJHeJzFKJzNyQ4GlCaLw
 jKcwWcqDJcrx9R7LsCu4l2XpKiyxY6fO4O8DnSleVll9NPfAZFZvf8AIy3EQ8BokUsiuUYHz
 wUo6pclk55PZRaAsHDX/fNr24uC6Eh5oNQ+v4Pax/gtyyc7BTQRd1TlIARAAm78mTny44Hwd
 IYNK4ZQH6U5pxcJtU45LLBmSr4DK/7er9chpvJ5pgzCGuI25ceNTEg5FChYcgfNMKqwCAekk
 V9Iegzi6UK448W1eOp8QeQDS6sHpLSOe8np6/zvmUvhiLokk7tZBhGz+Xs5qQmJPXcag7AMi
 fuEcf88ZSpChmUB3WflJV2DpxF3sSon5Ew2i53umXLqdRIJEw1Zs2puDJaMqwP3wIyMdrfdI
 H1ZBBJDIWV/53P52mKtYQ0Khje+/AolpKl96opi6o9VLGeqkpeqrKM2cb1bjo5Zmn4lXl6Nv
 JRH/ZT68zBtOKUtwhSlOB2bE8IDonQZCOYo2w0opiAgyfpbij8uiI7siBE6bWx2fQpsmi4Jr
 ZBmhDT6n/uYleGW0DRcZmE2UjeekPWUumN13jaVZuhThV65SnhU05chZT8vU1nATAwirMVeX
 geZGLwxhscduk3nNb5VSsV95EM/KOtilrH69ZL6Xrnw88f6xaaGPdVyUigBTWc/fcWuw1+nk
 GJDNqjfSvB7ie114R08Q28aYt8LCJRXYM1WuYloTcIhRSXUohGgHmh7usl469/Ra5CFaMhT3
 yCVciuHdZh3u+x+O1sRcOhaFW3BkxKEy+ntxw8J7ZzhgFOgi2HGkOGgM9R03A6ywc0sPwbgk
 gF7HCLirshP2U/qxWy3C8DkAEQEAAcLBdgQYAQgAIBYhBOa5khjA8sMlHCw6F9kUC7JWEwLx
 BQJd1TlIAhsMAAoJENkUC7JWEwLxtdcP/jHJ9vI8adFi1HQoWUKCQbZdZ5ZJHayFKIzU9kZE
 /FHzzzMDZYFgcCTs2kmUVyGloStXpZ0WtdCMMB31jBoQe5x9LtICHEip0irNXm80WsyPCEHU
 3wx91QkOmDJftm6T8+F3lqhlc3CwJGpoPY7AVlevzXNJfATZR0+Yh9NhON5Ww4AjsZntqQKx
 E8rrieLRd+he57ZdRKtRRNGKZOS4wetNhodjfnjhr4Z25BAssD5q+x4uaO8ofGxTjOdrSnRh
 vhzPCgmP7BKRUZA0wNvFxjboIw8rbTiOFGb1Ebrzuqrrr3WFuK4C1YAF4CyXUBL6Z1Lto//i
 44ziQUK9diAgfE/8GhXP0JlMwRUBlXNtErJgItR/XAuFwfO6BOI43P19YwEsuyQq+rubW2Wv
 rWY2Bj2dXDAKUxS4TuLUf2v/b9Rct36ljzbNxeEWt+Yq4IOY6QHnE+w4xVAkfwjT+Vup8sCp
 +zFJv9fVUpo/bjePOL4PMP1y+PYrp4PmPmRwoklBpy1ep8m8XURv46fGUHUEIsTwPWs2Q87k
 7vjYyrcyAOarX2X5pvMQvpAMADGf2Z3wrCsDdG25w2HztweUNd9QEprtJG8GNNzMOD4cQ82T
 a7eGvPWPeXauWJDLVR9jHtWT9Ot3BQgmApLxACvwvD1a69jaFKov28SPHxUCQ9Y1Y/Ct
In-Reply-To: <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> The binding wants the node to be named "i2c-number", alternatively
> "i2c@address", but those are named "i2c-gpio-number" instead.
> 
> Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
> dtbs_check warnings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index ed79ad1ae871..6d2762866a1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -64,23 +64,19 @@ wps-key {
>   	};
>   
>   	/* i2c of the left SFP cage (wan) */
> -	i2c_sfp1: i2c-gpio-0 {
> +	i2c_sfp1: i2c-0 {
>   		compatible = "i2c-gpio";
>   		sda-gpios = <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>   		scl-gpios = <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>   		i2c-gpio,delay-us = <2>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
>   	};
>   
>   	/* i2c of the right SFP cage (lan) */
> -	i2c_sfp2: i2c-gpio-1 {
> +	i2c_sfp2: i2c-1 {
>   		compatible = "i2c-gpio";
>   		sda-gpios = <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>   		scl-gpios = <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>   		i2c-gpio,delay-us = <2>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
>   	};
>   
>   	leds {


