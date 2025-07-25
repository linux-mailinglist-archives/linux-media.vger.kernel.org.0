Return-Path: <linux-media+bounces-38470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 231BFB11E4C
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 14:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C2611CE337D
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 12:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F9323AB87;
	Fri, 25 Jul 2025 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bvI2sRWj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4201C6BE
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 12:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753445730; cv=none; b=lBn21mV5LEG5Kf9gQhmjbYPe3isriK6p8wUUFcHMjNVsm6hJsCRDjyvBNTpu5npD0AUEpO+f6FFZMf65K45RkCheTqsDjkFSHWlI7/H+e0/B+cJ/cgD1qEYkcw6+smwGKWPtDrUOGfoccdaPjF4n9FzshLkMBdP3VyS+5xaNlDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753445730; c=relaxed/simple;
	bh=DZf8o481vjpJ7QSUoolpwJajFBT1Vwo8xHyfUgSq//c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgXJx6/nnt+EJnhhf74VtAid3/UfHhyi1fQ6Ds7hQCO9Pcrwo+FNXNhCKTBc5wDC9xxpkvbke/THVoJEnAIeIxnsZiM5ATI32vz2ZID5XpIYImktBf6fD6kvyJ2n0a+v12zZaZj2qyuPR0vLv6j3BwpkbZFfoOnNcqfMZjUepMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bvI2sRWj; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e33d36491dso280327485a.3
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753445728; x=1754050528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
        b=bvI2sRWjDflri1Aw9VXPsQhs3qCIsD/N8yj/EZ3Eqtz2Bo1t8uPMjtj1z8Eu5MVMkI
         59RMmyjpq/hJ65bXi1U+qReVoo5QWwoogSHoqvGHOadI612v3GD7B7sEJwu8cE7KEbvj
         ywHTLTmLMff2r2FXilAQ+FMXM3AaagcteDPJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753445728; x=1754050528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
        b=B4tlBem3O6YQ3b67IpT3TVFnI/6+YR0VxY2gxR7Px0TdTDD77uoamlQocKk+qWM9Hq
         24QApnH+u7WDR43B7a4m6pbIV1cvlzYx2UwZMtaXs+LsO/8ml3MuH9IGildIMwnmeLhk
         uFOTG86WN2OQ5e/3OuvBS08TjRceeQPtooc/tBeyS4B3oR40Ib1OrasTa28XRaMndwf5
         MzSZXnT0Dm0xXf9GYtv42mk6UDYJkPpqddIvaOJdoGrld99mau7Kwiv8QWh3nzuksPwZ
         PIwPmQdacLH2zJ0qHV0a4MW+wlFbTXRP0ZfwYOMxj1xSGGML0AH9P7A2wQjKX68g0Zf2
         F+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8CfG6/eaKWMBelyuETKqonBWbLDhSWl60N8XlmjFUQ3+eVod4skF+kP5SxGfdQaIYiO5xXSXa0XelAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoIvHFLZdKZbWioY++c5H87P2FCa+WcNV4Mr0j1oRAC0E4zeOz
	a+hwxH6CbPvvZ3L1f+djzkOS2QDzKf6vFZQZcYpxsk7vDdfMOJClQQV0oQ2e58RW/upACsF3den
	WV6U=
X-Gm-Gg: ASbGncu4V36hCP0RwHJGBXRfmVVVvUZrpVIAf3AprKIgXog8Caf6vqkZZ4PgwANtn3R
	y+kze9i+G+lnUkpz3ciiEnljNdHPlKCBaQRwZQVHTCdTyG9Hj+FsJRIJ3ysDa5P3913Ik7eyV2y
	cSWDenxFmeBiYelYVrV3TnzhG5HfFRdBbIbWyz3dCcOJWN17hr5GouljMfGmKwP5W9gYLPk3xHq
	cBvJvLvq107nD//n0qcanpr6fIFZQLEm93+UU5n4IIqg5qABH0MScH+ARKH4WAG3OH5IWRZH9Fk
	IAlZdMVjKGU7ZJG1HBPrJSPrjR53FumG+50HDVSCgSgqCeSg6J4tzxe3GDsG7s6nhgrjuZwXH6+
	zy4ik5RCCAdTiVAvbZZ/IgVFsXzAXGyZLGvXUJaWXQRg/hx7oD3nkumB9pDJp9g==
X-Google-Smtp-Source: AGHT+IGZ1UNOojYZ3j4sarrIMlXaJWpMoUlmJ7Y1159r39Gx3CXIWobDBNAezOINZBhvmfD2ihfoBg==
X-Received: by 2002:a05:620a:a502:b0:7d3:99da:bdbc with SMTP id af79cd13be357-7e63bfb3353mr176648585a.36.1753445727761;
        Fri, 25 Jul 2025 05:15:27 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632e25b29sm237178385a.49.2025.07.25.05.15.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:15:27 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ab58105261so36081471cf.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 05:15:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSQrYS/slB5gtGWJp4LKWgNi4XLFVuHzXyve+TUMjC6d1rGPP7wlq5ViMIyGrt/awAZVNDAHyJFvpk5Q==@vger.kernel.org
X-Received: by 2002:a05:6102:4a8f:b0:4e9:a2bd:b456 with SMTP id
 ada2fe7eead31-4fa3feb1976mr334393137.12.1753439957846; Fri, 25 Jul 2025
 03:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:38:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
X-Gm-Features: Ac12FXzORC58mPF_B982fHDjnhtiL_-5O2nAq5PI4bkUJDNwvq8vw0VlaVEnRW8
Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
Subject: Re: [PATCH 38/38] arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible
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

On Thu, Jul 24, 2025 at 5:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This devicetree contained only the SoC compatible but lacked the
> machine specific one: add a "mediatek,mt8516-pumpkin" compatible
> to the list to fix dtbs_check warnings.
>
> Fixes: 9983822c8cf9 ("arm64: dts: mediatek: add pumpkin board dts")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts b/arch/arm64=
/boot/dts/mediatek/mt8516-pumpkin.dts
> index cce642c53812..3d3db33a64dc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> @@ -11,7 +11,7 @@
>
>  / {
>         model =3D "Pumpkin MT8516";
> -       compatible =3D "mediatek,mt8516";
> +       compatible =3D "mediatek,mt8516-pumpkin", "mediatek,mt8516";
>
>         memory@40000000 {
>                 device_type =3D "memory";
> --
> 2.50.1
>
>

