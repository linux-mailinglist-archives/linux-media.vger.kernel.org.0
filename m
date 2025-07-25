Return-Path: <linux-media+bounces-38467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0045CB11DFF
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 278887ADDDD
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB42B2E7628;
	Fri, 25 Jul 2025 11:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G8gNcfov"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABF52D131A
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444668; cv=none; b=qFmzQ+jWEv+Itvbxt8+NCfuvaoqYPokSY1bL4qzxsUqt3Y2b5aYv8yiqbZixE1T1ZcPDe7YsFMSwVmNwh9r5z34dIw0mPqPjoC8uYCAPwyQCNKHIc/ftQEErtQf/+eUofWafDxK9c93aADb2LppRYuytkaoS3+0VuW9ar3vXwes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444668; c=relaxed/simple;
	bh=7Lq+L8ybIKzJFE7aCP8K4OUgb0w5TEGi1D/8HV86VOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyZMm85laeZP1TjLubIvAEWqBp0yHjvqWllKfHxccilhwolkuvzsjpEeig+TKy1ZaEKhZqisS1R1QxXlNmfO6IT2rzj8YKaAVxJhZ5XWL3q9UuvIgJ/Q7gYrwWkvrBmOxSX6i/6WYcQ0Ru7/LPwVkytdkavyxpJto3/wHt4IKyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G8gNcfov; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e62a1cbf81so287931985a.0
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444666; x=1754049466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
        b=G8gNcfovYtr3FdNLMAkQwO77bPpSQIc2tlv56lC46i2rHIQjG6KvDG6NopcKIasASz
         KmK23IbSc/1RWwkht+f4ebuYJdEVT9iCCv1t24ABRItrYPcubvlpzrEbnVhu1Y4cDsvi
         zO0RBqquqjGBu+aDfOoY+LP79hVnL0NZxc7A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444666; x=1754049466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
        b=eStfV23nFS8KBhsG3ZiLXYd58mZ/J9gwEUzxDZ/0xbagDCQqzmkvnVy+3MyBt9P8Pl
         S9nR/ZuNUEHDHZTYf27nyPiW9QNBFaZYeYQcgUnjEeZp/AZ5F/aOZiLaXM620z4ADc9c
         jTvI7WdgySQwhx7pYea/pX1M0FULWTIDI4nG3ORO6DMfF9So8aICQ93DLgP9bBqcZUbJ
         m1lTLWavAkrrpPhG5BlRK35HuaWigLPrCS7umt8HPMQtH1Lk2LPwsTsMAa2PkI5jnPJ6
         /IPKdVpem15ep3eJEt6oCEoZI0Q6RPtdseLiTBpAPbVfT0LXF2l041ZMmJ35yx0QuSlM
         tIuA==
X-Forwarded-Encrypted: i=1; AJvYcCUDWF9WSChQh60VFV7frCrkfNQgl+npjmWu1L91XbVg+bLOcCmAp08brKNWt3EwS1BstvGRgJBZWMxTNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9MJ/CdIS9w3NyzllVj0FGVbk4xQlpl0bI+v2DI83LHh4dT3Ef
	7oREo7LLr83jdlVrDrEH9zVXkoQNJKD7uO6VoLOzCeX021QizqAcGDasAbCnNQlPAsI6Zm8ArCr
	v0Uo=
X-Gm-Gg: ASbGncu+pSLZfmLVzcKfNL6JZJLpC26nPHhaV1MNbBe4bWzhwvvZf14Yo+nrS0Dl6XO
	4OkxZF1H3QjB+8362IjDxhkVhQkHXKOgCJcWoMuqsvrxxMDK/Pzlz/Km6q5tS3dkYfKMLXVz2wQ
	UdzmwI4iuf9ut+AVpLRz2ihXo6O6q7MVx7ZV2R7knDWwL3Dl84E9/EDtGiL8sswT0wrBCoLsvBP
	vKDLSvQJUpDxJ7W8+2GjxNLISmYXFbPMWSsKLvZg6dAkUiLmfH+Ue1Df2y/eDCArynoPwGHOJ5X
	080C2wi38YrvpFYYCnx8kT/0A3sSG8ZEGSRb6ZkGYQUX2jKQVwbY4DxZDFr6eiRHPgmeUjMZ+fq
	0SDfbeXC1kxfpDSW5gs/G0qvtjPPpiG+muoVoqQMbAEKEnEJNgKsGJ0mWDKbwoQ==
X-Google-Smtp-Source: AGHT+IHoeY/Cb2XjYo0L3gkIJbbbFTQTszyjFepVXV2YfGa5VBPg6xUfgC4uwfLdjplmIJSoSC5d5Q==
X-Received: by 2002:a05:620a:2552:b0:7d4:3ac2:4c4 with SMTP id af79cd13be357-7e63c1b7768mr153739285a.50.1753444665496;
        Fri, 25 Jul 2025 04:57:45 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632e38538sm240329385a.73.2025.07.25.04.57.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:57:45 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e623a12701so306579085a.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:57:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/nBG59E8E0dROZrfBOPaGJV8fQTVeXOSh08Ef3XYxkXl9Zj1YbaBsHsoP+zIRh3Evfhs1XKqEzbthVA==@vger.kernel.org
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr316348137.17.1753440787376; Fri, 25 Jul 2025
 03:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:52:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
X-Gm-Features: Ac12FXzhNEGCOc6TL2wVpoG5kEXhC599YdNWu941VvXlO0dL7_W9Jc4if8EyMHA
Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
Subject: Re: [PATCH 19/38] arm64: dts: mediatek: mt6795: Add mediatek,infracfg
 to iommu node
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
> The "M4U" IOMMU requires a handle to the infracfg to switch to
> the 4gb/pae addressing mode: add it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6795.dtsi
> index e5e269a660b1..38f65aad2802 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -427,6 +427,7 @@ iommu: iommu@10205000 {
>                         clocks =3D <&infracfg CLK_INFRA_M4U>;
>                         clock-names =3D "bclk";
>                         interrupts =3D <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
> +                       mediatek,infracfg =3D <&infracfg>;
>                         mediatek,larbs =3D <&larb0 &larb1 &larb2 &larb3>;
>                         power-domains =3D <&spm MT6795_POWER_DOMAIN_MM>;
>                         #iommu-cells =3D <1>;
> --
> 2.50.1
>
>

