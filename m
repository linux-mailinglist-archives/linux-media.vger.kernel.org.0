Return-Path: <linux-media+bounces-38465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA665B11DE8
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 013DB560AF9
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128062E54B7;
	Fri, 25 Jul 2025 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZaqP3aAK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26119220F37
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444199; cv=none; b=OTNoRBZlv0bsm6XX4ET9WJAt+zjR1kx4rO8yubu34KiWuNq3KRF6+kIMD3zdskepv7QnPsSRnsomdPdMRar9HVSPH32aztNO3PNAMydO0t+zURG67JzzA0F+eIhoLXr+07V1Evnv8o7zfBfSI6KsyMYCB9lEj9BYPZoNh4T7LDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444199; c=relaxed/simple;
	bh=AyRroNoAAfZMLYMuOWzL5KFUvjXMr31GJOyZqB2g5AQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyBJ6RDVV77F27wK1gnaVCgJhgxt1drExyN3Ps884blPXF1ldkEqGPAcOuK8MA/pYXLkUUQNL/4HJCV8MHJsJmBdnMXEuXIxu34dOF1+JKBVg0Wt/rG18Ws5TBMi5ZbwXJM+ASmINMs+wjIm0PafxJ8uu8Pb8G+lpMract+SC4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZaqP3aAK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso2026147a91.0
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444197; x=1754048997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
        b=ZaqP3aAKRZY6gB6S7dB7jBgDhZ9VeiVPvSYmRCcfe3eoiuGouT2oCndMtHC9bjZbp3
         Ra8ONfEMTqPOhCJRe2dFp0/+5VQdx3BrD8BBUp1PjA2kvBJomndJUay211oSCGZwbSNh
         7hsfzJwjMpQZXNFLwVAM8JaA97mP2JFUbJMPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444197; x=1754048997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
        b=tP/p/ECGceaCS7L2polQBlmDLQ3ID9japUQ3UgiA90Dk7sUDWIAF7YC4huxhNoyV4d
         Un6FK6WB9nFaSCbh/vjiW+vPJ//zG1BqQ+tqaZEVi71zJw6QT7q4rgfURAHLjbLcZEo2
         t9FoqRd1izR52Lt6lxiJZUwblXtGclPUYVO88aj1kKdXS89dOA4LtbOzMj4nz8L/GivX
         3Rl3aOx0nw15g/oF8Z2/yXUPDbJ7T65m1xDiRCf4fvPDkzU0BIQv4lF3aQCZsb87Kf4r
         wHIYS4GmJglXhTj3y6G5jDtgJebzETL5JMYdpHMxrfx54+vClYyNo2KRB7qa5H1rDchy
         0LZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMVmhGJY2XjNIG/16rmcsyESMxGVQrMz8bUpWVXA781CcLnIZowAtZZ7Iixe6SBw6dScx1034rw8dK7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PD0O7XVMstwJbt0m23M/QdkJ4OQVstrX2nHSW6IFcnzpVcw4
	EmzxIFlfaxxgUnC/ISzJU0CqYj7PSl5OHiqBzLTqgdp5I4wfnDJVms9WRFtN303Q5/aWUkSWMEX
	8w6m/BwQD
X-Gm-Gg: ASbGncuP2MadkQIKjsMxC0aDPI/hZCXThXGY0bhZOVPZSd9+NLD01f7K6SOfavysXhv
	nvWmwcSZJsfZblkOHJByNRrTZ/RY1drMv+vsTmd5v3K3UK0KYqNsE1/tQUEcAE5svbXCn4g29Hy
	ButDTNWQf6imKrIMERDsgPBUBm8EN48i8veeLyketKH+nA5Gbzx0iy+lHtsdxQkt+OpUBB0jcGU
	nBx/5RPNGCp5o1TAE9R5hKc+iQKOf/lAtwqIokTDdXacfMP2XEGW1EI8haEWaaeRCoyOpynbGjB
	moFPsOAtaTx7KLOW1Ro2Y4cR81xQ85QBa9YKHrqU7eOeICMy95Z0m0nynSo5E18H4+9mUdj47e9
	qzlcbZpA0h/IYqXALn4c2Wsunllf7oLOknvzVS3l8ttI19LQmrSHYycBV6DHMFg==
X-Google-Smtp-Source: AGHT+IGXSWYt+oJw3R9bNZrL8k9+DUNDkzDIWpNXtmKU+cRx30SoWWghVuoATrLaOLyKYJOmhm8nYw==
X-Received: by 2002:a17:90b:224d:b0:313:279d:665c with SMTP id 98e67ed59e1d1-31e7773056dmr2381356a91.7.1753444197158;
        Fri, 25 Jul 2025 04:49:57 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f6c12628csm3265116a12.67.2025.07.25.04.49.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:49:56 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b31c84b8052so2322837a12.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 04:49:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtCDPlF7JPQDCsRrCsU5LGEY571IVbfPGfEiLk1Skc/qkwhRIieOcza3XKgkMh7T0x4OkkbtOCSVv46Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:4e6:67f6:e9af with SMTP id
 ada2fe7eead31-4fa3fa71860mr256656137.9.1753440125688; Fri, 25 Jul 2025
 03:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:41:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
X-Gm-Features: Ac12FXwspafB6XO0s33DaaDCIfXTapXC0TbPbPDsXvwxpmO6Wfy_iIb8kWhO-Rk
Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
Subject: Re: [PATCH 26/38] arm64: dts: mediatek: acelink-ew-7886cax: Remove
 unnecessary cells in spi-nand
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

On Thu, Jul 24, 2025 at 5:50=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> There is no need to specify #address-cells and #size-cells in a
> node that has only one non-addressable subnode, and this is the
> case of the flash@0 node in this devicetree, as it has only one
> "partitions" subnode.
>
> Remove those to suppress an avoid_unnecessary_addr_size warning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts =
b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> index 08b3b0827436..30805a610262 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> @@ -98,8 +98,6 @@ &spi0 {
>         flash@0 {
>                 compatible =3D "spi-nand";
>                 reg =3D <0>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <1>;
>                 spi-max-frequency =3D <52000000>;
>                 spi-rx-bus-width =3D <4>;
>                 spi-tx-bus-width =3D <4>;
> --
> 2.50.1
>
>

