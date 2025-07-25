Return-Path: <linux-media+bounces-38461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA75B11DB3
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 593FF5A3FDF
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DB42E5417;
	Fri, 25 Jul 2025 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aq0ISM4a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315F1BD4F7
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443492; cv=none; b=oEVFSD/K8hGe/7o1M8YclRvwtBry4vRieOxDkwT6XFgmG3rIRDZqEpPCf5Zq6E3o6lpbHVH/sBf5AhaVwshtz+ociC4jEcnuJpqJZtpfWVeatYmX7VfhF6id0YJ/rQAOoQ7VOctEfwh1koLgFhsPM05B9tIoSiQTeF13TlXW2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443492; c=relaxed/simple;
	bh=IU7jvnAwzmp5GuJHgplXAk58lqyd9tH4hjc214tIw4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXkHMPob4baIOf17mAVKBdMdcydec92Ffd7DlVOCdOLEPhEpWNWV7pbN/LDJwSi50Vb+sCvn4kJ+GRPPRRv7wXN0aEoco5liVrWH5ALob8ik/3JBPITqgYR/G8IKQdzPJBuBD6jNhLF6DoJjTdA/J63aD8j6ePOZnoIFw6s7qa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aq0ISM4a; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab58105261so35579431cf.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443490; x=1754048290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=;
        b=aq0ISM4amWNZMxQgUPbOYjLBuGO59nLqBSQscDQEsxAnrAm7jSAzW9ITsUlUa2kQFC
         uujnM5lHgxd6VKDhoFXIwjv1AoxI//blcC3R9p5XWygqgfCHmmkdUSGtP6qT8BYmYNFA
         ZysEfhXrZG5Hsb7amnhdl81rqtBuyTcQe0/Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443490; x=1754048290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=;
        b=jT/gAghUJjyYcvkNLUkQaDgscYRiNPijBpgl4D+uoJzT9zHq6sf+RhUcGGucIXnh4/
         AEl5Fj5Dg1mCwHUsFHWaWRojMrb1lRXqpRE4/CaWJW028SMve1gCyk3vfaiZtrk6ytyX
         SeRC8ODqHNOFddsc+FjJbE4GRcnl2Jz9vpf7ejBnKF1pFGEyshSOSH4KfOPWEqbuFS+J
         zC9G14eMiBRtU/iJcK4H1if2Lo6F8QWrXFZlpwZwDeMDgb+2TpvGL/1FXEjwNv6yqLQe
         hVD6y1UcIKWM7WHEavFkP5iUemNrFpJY6/CqyH0FvhqkEb+fjoxG1U2424PZa11Xlqaz
         5Zsw==
X-Forwarded-Encrypted: i=1; AJvYcCUArgHjmm1D68tBR5YeEuRHU0Rp85Wlq76EaDFSb+/2VAWa4MiKTsxNoF6dGljx0xIEKQfVTqoNqA7Prw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMSZNSM+g0iffcEypRPICYG2687f5QGCQbq4l2/hLie7ZAcm7E
	9LHsEPmkPWj4/P+r2y1geHUzzIZ29XHn2zfCntfH42mHJrp6i/T4djX5243Qtc38WOkdHqsBTIn
	h5yuupg==
X-Gm-Gg: ASbGncvCKuif4cunTL0euWCI2Bu5tiZEazTqh1GGXNui2KT2hIdYD/tmcpctHJeirBr
	HKC97qqGTMRyqXDKW8yQFmgXlQ98YiAeneu8GjLW0npUlHjIuGKUpRJa9xFlbFh28+NvlTLqeJS
	ifGLvHlHo7FfyAqWmenmbUOT7L4/K/9CknNgi9a3JmbsSF6hBg1rVwOSFyynkI5KkW9FuTfX/GT
	NXp+O+leWkhQaUOM6cN15mOteJBHWL5dHY8Uq7mVaGtctED3fBjSsfjgfi5n0B1O+mQ5DbDDO9v
	ufwsJXA0IBu9A66O+7UnHuUxEQIILWPyuJ7w2bnQKdh1ONQAiEdGHyr2ErdRV9srzxpeKG62RYd
	Vjg4pRFB8VOE8q5GZILMuvmPMDZKYQHDnEn8E//oOjVVZ82AWWtKZ7BtE2lDl+w==
X-Google-Smtp-Source: AGHT+IG7GfgtRW4w3m7T+NM2bhOVLikTnPLHbz67K9rWrKiLyiANEowKUOymkAr88fMEp9b7znLRug==
X-Received: by 2002:ac8:7d42:0:b0:4aa:939b:2e75 with SMTP id d75a77b69052e-4ae8ef545a9mr15974381cf.5.1753443489466;
        Fri, 25 Jul 2025 04:38:09 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae7e5185a9sm22586921cf.39.2025.07.25.04.38.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:38:09 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e623a12701so304590885a.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:38:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7t7T04kOlbLjL6vjps1EzawSD4G3SwhVSmUHUc9v2/G2G6EemB3lWyKdK/NA7oCE+katL3WYzPUchLQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr308667137.17.1753440019738; Fri, 25 Jul 2025
 03:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:39:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1njv7qrL0LyhZsp=HVdxxDo2bA7FbCkMVqJ9R9qpg-0hMw@mail.gmail.com>
X-Gm-Features: Ac12FXzAeqGgOrEJjRR1J4ryO0U3L8RJWv4_H_TyT4RYPsIpmGY3ViSbTr41uno
Message-ID: <CAC=S1njv7qrL0LyhZsp=HVdxxDo2bA7FbCkMVqJ9R9qpg-0hMw@mail.gmail.com>
Subject: Re: [PATCH 37/38] arm64: dts: mediatek: mt8395-kontron-i1200: Fix
 MT6360 regulator nodes
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
> All of the MT6360 regulator nodes were wrong and would not probe
> because the regulator names are supposed to be lower case, but
> they are upper case in this devicetree.
>
> Change all nodes to be lower case to get working regulators.
>
> Fixes: 94aaf79a6af5 ("arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dt=
s b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> index 4985b65925a9..d16f545cbbb2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> @@ -352,7 +352,7 @@ regulator {
>                         LDO_VIN2-supply =3D <&vsys>;
>                         LDO_VIN3-supply =3D <&vsys>;
>
> -                       mt6360_buck1: BUCK1 {
> +                       mt6360_buck1: buck1 {
>                                 regulator-name =3D "emi_vdd2";
>                                 regulator-min-microvolt =3D <600000>;
>                                 regulator-max-microvolt =3D <1800000>;
> @@ -362,7 +362,7 @@ MT6360_OPMODE_LP
>                                 regulator-always-on;
>                         };
>
> -                       mt6360_buck2: BUCK2 {
> +                       mt6360_buck2: buck2 {
>                                 regulator-name =3D "emi_vddq";
>                                 regulator-min-microvolt =3D <300000>;
>                                 regulator-max-microvolt =3D <1300000>;
> @@ -372,7 +372,7 @@ MT6360_OPMODE_LP
>                                 regulator-always-on;
>                         };
>
> -                       mt6360_ldo1: LDO1 {
> +                       mt6360_ldo1: ldo1 {
>                                 regulator-name =3D "mt6360_ldo1"; /* Test=
 point */
>                                 regulator-min-microvolt =3D <1200000>;
>                                 regulator-max-microvolt =3D <3600000>;
> @@ -380,7 +380,7 @@ mt6360_ldo1: LDO1 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo2: LDO2 {
> +                       mt6360_ldo2: ldo2 {
>                                 regulator-name =3D "panel1_p1v8";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
> @@ -388,7 +388,7 @@ mt6360_ldo2: LDO2 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo3: LDO3 {
> +                       mt6360_ldo3: ldo3 {
>                                 regulator-name =3D "vmc_pmu";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <3300000>;
> @@ -396,7 +396,7 @@ mt6360_ldo3: LDO3 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo5: LDO5 {
> +                       mt6360_ldo5: ldo5 {
>                                 regulator-name =3D "vmch_pmu";
>                                 regulator-min-microvolt =3D <3300000>;
>                                 regulator-max-microvolt =3D <3300000>;
> @@ -404,7 +404,7 @@ mt6360_ldo5: LDO5 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo6: LDO6 {
> +                       mt6360_ldo6: ldo6 {
>                                 regulator-name =3D "mt6360_ldo6"; /* Test=
 point */
>                                 regulator-min-microvolt =3D <500000>;
>                                 regulator-max-microvolt =3D <2100000>;
> @@ -412,7 +412,7 @@ mt6360_ldo6: LDO6 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo7: LDO7 {
> +                       mt6360_ldo7: ldo7 {
>                                 regulator-name =3D "emi_vmddr_en";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
> --
> 2.50.1
>
>

