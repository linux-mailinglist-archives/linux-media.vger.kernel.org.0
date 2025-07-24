Return-Path: <linux-media+bounces-38366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47071B10748
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 12:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 426C71899F62
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB6B25F787;
	Thu, 24 Jul 2025 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V/vPM8Rb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85AB255F4C
	for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351337; cv=none; b=bPzyl1ZBegJW9nNzZek5kR/i52CelQ5sAzldTTo6rfXEKdN8rw9+KIVrH3sT6rVQ9uVyl76qV5i/AwXi80Z1QepoeVIxmTkn3zUyeL0WLRpSSkHdB85nYmc0t1PRXl3Mza6xwVfofLz9lnvVgxXz/PnlGcuA+KvqJmfxarF4+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351337; c=relaxed/simple;
	bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IG+aVryfoSPBV17Zx9P/BKsmS2XT30K+WiyCYjrg6nTmx4l9WKvWWurovLNtYbBku0FSrT+ID/ZnA8JKGfhJgeklZMsepq1qEid7DwDIslOgV3tsActrYImzOlfU6Gv8Yriqbj9kbfkoRkqjG2K1tjMSZ+4tWV+/cPCTlmSuu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V/vPM8Rb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-555024588b1so815835e87.1
        for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753351332; x=1753956132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
        b=V/vPM8Rb1cbKAv+XnKhAJOmIjhQO4tB4NYqtbMsIQL7++wi1r1fweGMRbtHgsBo/Fm
         zYyyOLRDr8faufcUrwibj8Spaz00uUBCsmQ+qSzgCbek0JhsssboISKnyBfMp/3C/YPn
         njKEMYZwFYlJuwY7yQU3VSUy3nc9MBGEtQqBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351332; x=1753956132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
        b=K76MaWRZDM3VfF0yGsGNQkYABOCD5Fkr8Puy1reY0Yn9muNAvELLJQv7iVrKyPGAIB
         4SqwM0Wr/0j1eWcvx1CEpZMaDm7LMhIMvNZXukGBwPgw5+eDxB2JbiN7gq4Tcmn/dwhF
         ZuHJRmC2T+HkSlEXJLB8ohN2H+xgrEMtgrsmJ23MGiiFW3XMl/tpbp2Sil3YLyg1U4HT
         jVIaVVLjmdtN0DkMQNlSiVUtJylBnSFHAsIMmEBQbd4ph4v1Yf1LHnS26KQAxZxz4zel
         ZwzEXHEl5yPszw3Szjd/ap4BR7Uj7nEggmQh2fxJjDUbEty2b+/Ntw6Ojqm0CH3z2d8h
         3ffQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGQmOFf+sx0QLRhjiijx3tJvnIOo8S0lr52duUfVI7OUHkupFOSTfcVYwKvCU0fwqfSbCP9+i3vDpUhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkNP4zCD4xADcP1pw+OG+EWXV+FEo+7GaUYZH4h/2+nY97DqbM
	O7475j/z47GD5H0C2Mz8Lnrgbq88dKDCWeS1XmSeRzRpKmAbN4zp/OUWfx66ytscf+ghe8Oscvv
	TU68EJKyfgJRyVD1WW6eA396dADdlxL4Icz6sJQtB
X-Gm-Gg: ASbGncsF8eX02/i0efNwK5ruBJJ4AHOuljPlMvdalxA5gRsH52EsAP01efL1zZ1Z/TP
	nluLJOsfSaSAQPTjKch26/gYa4sASEX3ZjMr779m28j10Z1fOVgGMVriKmwKBvEhtf8KT/3820L
	R9NxrwjghKDesPnsX6KzVVx81cvocjcpqxfWJhs/ZmieURmOuCdK8KNBuFDUovf0opj6Qc80PBW
	TI8AeG3x5QyxDpsH4VWbQL1xL9qqtUfCVg=
X-Google-Smtp-Source: AGHT+IESUy0W5d8sN6DOxHQC9VYSfHke7csoBbtn4oiuNMESAIIOLfvRI9EoIcZqqzK+oAmlqA1BtKODIpYwZl1nk3k=
X-Received: by 2002:a05:6512:b06:b0:55a:4b25:b33b with SMTP id
 2adb3069b0e04-55a513879f4mr2300615e87.15.1753351331794; Thu, 24 Jul 2025
 03:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 18:02:00 +0800
X-Gm-Features: Ac12FXxwmEtskk9yW4VS4U_sXrqKN7rxCsdJIjp0VaKRTEqFbUzw8Bs63nu9Nbw
Message-ID: <CAGXv+5Gar47gRZoT6DUDpPRabjzoSE==Zi0wrR76A7g-SJL1=A@mail.gmail.com>
Subject: Re: [PATCH 35/38] arm64: dts: mediatek: mt8195-cherry: Move
 VBAT-supply to Tomato R1/R2
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Move the VBAT supply to mt8195-cherry-tomato-{r1,r2} as this power
> supply is named like that only for the Realtek RT5682i codec.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

