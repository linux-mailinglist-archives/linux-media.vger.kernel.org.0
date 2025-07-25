Return-Path: <linux-media+bounces-38463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4F4B11DB9
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A503A1CE25F5
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995A22E62BF;
	Fri, 25 Jul 2025 11:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TVMtxO3o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0D15746F
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443761; cv=none; b=JeSPizfZeNR6CLMdl3nhj9IEPVwTqRmWaQab09jEbvRonL74EUMxG1tVEfOFKEo4c1KZkNm0Ngu6VImP7zaTbQKLXFpng+Qm4fpR0/hjZKRMGjxrU/MfBA6o6tAPBnfCeJOX/xAahFNnwqHRFJaPJ2Rv3jwYAGOJFfh8+HdFy1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443761; c=relaxed/simple;
	bh=70cZJ5+MOSuyvoTc0hRAELy7cfRbFrHaFdQesC+yVH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2FAiNzbb0xTS2WCelS7o3C6CiO2yVoNxrQuxsj7odlOUdAmzuZPk8vGTLeRTfLrzwOSMbFOGuSswyIs/xOwM65vK3VNkmjZvWk1OVLpb3h1OBK+hbQ9PEGDNrNETWbH0bjW9FW3bnpjqkfYS98iy8ZFwhinLW9mcZ6qL9c37VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TVMtxO3o; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73e64e87d49so1196019a34.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443758; x=1754048558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
        b=TVMtxO3oDU7n+Ng/CICh9SPedbSU4livTcUsez2D5zyt/gGymTHHZUiud1HF1Hcf4p
         8HiW9wakYAsWeerxIMb4lf1vAmPvM09o8t5z22kQ3q5GkpF70Plnq4CalsRWUcdjMLdf
         qdjAT7Kf3ltamQlnmS46p4XldP6S1U2XYgRLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443758; x=1754048558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
        b=PXrYcoTT68hPQ54maccyrJYV8tPKwMp1KW/Y6zR/wbVgdH44HJOZabN22RxMLSCau0
         9nz4mmXdt3IkJx26X3feflIKP8zKeuevjmhdJ5M6ZL1VLOujWQDWoynFIZupJdcZenj2
         s+sNaDeq3NVYPVag5NEvglsWMDdvabPg3r1Y1fbWMTYsvdHNEpQJfmQEVf9tK8egjWsc
         /Qs4M+nfYR3knVfN9XA7gXJ+ZFSRLjWU8GPZelvngaDZ3jD9zcX5wiEIM5jbEuBLadZ0
         b5BH3p3qBYS9+AMwTXSM1B1EJ0XvKmXjUoUW8FwDBARiiQQ4qqgV0L38ykNI+NXj5NK4
         c8MA==
X-Forwarded-Encrypted: i=1; AJvYcCVXg3gHqUAIoW1kE/rJE2ekA887+WUzQZr7kMKvnvKBsilnWe6j/6+Mh9BTu1eNFmE9PHr29TrjUkQueQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tbRTgXZkKSNgAvd8t44OO2mYi5z2DXen311TV78seyCU+NiD
	HUtXZqqsYJ46Edwfsu+WmW+tWFWQKg5tn774mLIxi+mspwRCkhRdOt9xYyPtskXkc0r2sq4CFjS
	IW82dKA==
X-Gm-Gg: ASbGncuVoKiZrH/7EuiyTh0TKg/vXkNiEuDoH/sRhKZ4EuGViZoaCu51Ds4ImXsX1Ra
	P/+liL4ARRtNpXH3209/BIZIhzxX6tVpcXpC7b9JmPqra6ziC7hkYRr5EXzQXFsP289rH8Vnco8
	W4j28nxzFVJ+2b5DBIcrZ0vdMwtCjY5euaKWqxZZggXStC7d41V6MlPaZkAk7sjc8Fsut8nu/Mc
	7ItVeHSITTAuglRlHah4eI7zw92eUSmJSiMbm92Bf7Dr+tSjzB6O6WbEACQeo5nsxKnhzFrDtdp
	AMg5eIBzGFqZQB3WKtUgPX362WrX3finyFPSPF2/P0yWw1QC9GQkLCOxdzduN0xVXQp7rplMgRn
	0vdT+5w0CbPW9yFMXmSJxdS1RDFl3SBsWsyBHqwX/At2sAbWVBka8BMJf6g==
X-Google-Smtp-Source: AGHT+IHRBzhS6ljUPRkw0bEe39ioetvnw64PVvX22TIv13H8bJoUqxL+aRhvOy5ktblIp16xRIxpww==
X-Received: by 2002:a05:6808:152c:b0:405:6b13:ca55 with SMTP id 5614622812f47-42bb9919c97mr614936b6e.37.1753443758386;
        Fri, 25 Jul 2025 04:42:38 -0700 (PDT)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-42a32ca6ab5sm607092b6e.22.2025.07.25.04.42.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:42:38 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6159c26766fso1090370eaf.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:42:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW44jZWzYi1ziU3EZOI/Awzyd7jrjqmgRa4jutPcmVGeVvBphWmtivwv/aKm+Npit3HpDkoB+hPPqEVFA==@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:4eb:f003:a636 with SMTP id
 ada2fe7eead31-4fa3f8f1683mr313640137.0.1753440679035; Fri, 25 Jul 2025
 03:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:50:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
X-Gm-Features: Ac12FXxJVbrVgIPSlm6u4--DKBHxaHRjM_36IT45XEIgpl9bR5PM8dE-s5Wt-28
Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
Subject: Re: [PATCH 24/38] arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C
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

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The binding wants the node to be named "i2c-number", alternatively
> "i2c@address", but those are named "i2c-gpio-number" instead.
>
> Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
> dtbs_check warnings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

It'd be nice to mention in v2 (if needed) that this patch also drops
redundant #address-cells and #size-cells, but it's minor.

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/a=
rch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index ed79ad1ae871..6d2762866a1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -64,23 +64,19 @@ wps-key {
>         };
>
>         /* i2c of the left SFP cage (wan) */
> -       i2c_sfp1: i2c-gpio-0 {
> +       i2c_sfp1: i2c-0 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         /* i2c of the right SFP cage (lan) */
> -       i2c_sfp2: i2c-gpio-1 {
> +       i2c_sfp2: i2c-1 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         leds {
> --
> 2.50.1
>
>

