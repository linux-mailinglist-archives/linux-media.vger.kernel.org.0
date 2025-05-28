Return-Path: <linux-media+bounces-33487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7DAC5FA4
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 04:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8E1F1665C3
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 02:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA651D63D8;
	Wed, 28 May 2025 02:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyjx3bCz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0160199931;
	Wed, 28 May 2025 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748400041; cv=none; b=Ay30IeGSjTinHUAPyFigo/vVdbDVizT7h6Oyd/B+Cg5MVSBZwR46Q8KdiYdiea0tYoOEZL6Ut/YrH4Q2E7raXwl5l74JBmAB9BVe7nflpQDkuFxpCgYkLYkLyhSrD87fJRBskYszCcZNotjtPkqtp+wmuWODkx7BzQiXCPe1utk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748400041; c=relaxed/simple;
	bh=xeew4UJ9cUvyxRfAk3dWvxm1O9LehVnmfgtli5kLkLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJw5bChuwsmG2yiyWa/22OP48NfUp9qY1P8RY7VEPLU47W5iSHsyPNyNK1zWOpvej7L7T26573jcy8DphG6ZwWOAu1G5YRDxTStWivorqRaI3Gn0+9Mz5NxGA6sslXSdK6/3Z/pnuYid7ebsaYiTZBDiXakSCTLvYzqP++2FBbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyjx3bCz; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so2381461a12.2;
        Tue, 27 May 2025 19:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748400039; x=1749004839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QVCrwFga7VCzG3Y0sAuFXlGZgCRKGevrmncrDPwjQQ=;
        b=cyjx3bCzJ6EpUz9nllbKjWuM6ct9JN3RyMbc2aBJ4eYX8dBqvC54mzDz+z1PmZeRES
         cyxbCWoCpIUMD7zru3qpyTI3q0Aexhzqg8ylqzq83D5vUXuCC9wzvPPKXtmO80k3Gs2t
         yBZGjkVcKY4fAmPwZ0H1AMp1pfNTc/8PpTDKRu/xjldcbUYnkO9jcKxfhrL414FMT9n4
         pdzi5gJhyCTdIoPc5r4dnF6KYoFTQ8jLQi/f+hSZ4R9LPX1rM8lfHI8g1wLKMW+H4J3/
         ElCWom9UCWlQlDOa2jUTe7aLK6o/bYeDMgoJ4kENe6ce1NCPhkn6cGiXa51Nob/dhqh6
         5cfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748400039; x=1749004839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QVCrwFga7VCzG3Y0sAuFXlGZgCRKGevrmncrDPwjQQ=;
        b=ZIUuUiSEF1C8R7nfRHoKoxT/DNBQQ5sAWgnotQD/SmPIN5AOaBSROMd1+0Pf8/m6jj
         SdbvYUG4DmFX/vuQmr7GT409LWwY62XDJvSi6/t3CHXIhfn635JQNvFpOku2uJiK2VPL
         tV6xflYWpF4p5iC8F6Tkrxx5rLJXo9zKpuwHILUau/cIpuYAUZDD8uEgfjeoJAusdVx6
         EuIoDopOEPmna3e+0VkucF8QrmsZslUSzk4uwMhRvPyVznDBdBX/qYnhBsXAP7/NtZKq
         MLSrRjhosgg3hkLne12D5Xby/5zbblzEKkKfUsartD+JPKWmZ53UE9JGEvhzjUruanxd
         w1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCV0IaBq/c0SKVS2zffsTCKQUr+Brqz7e5uXFOPEtjz6omDOnQWPVUPX9+u9w/4D931JexPz3dDOaQd7@vger.kernel.org, AJvYcCW6Vb3sk3ZPytKmuZvBMP6VeDIHbLquUZwvNrCFwV9/8GDKlxImOgxETp2S7556FgZqdMyQWTLv/d2ksJk=@vger.kernel.org, AJvYcCWteuCagOswg/lRQchtcbKNzKLW8l58tfedhzAuzfj/T0Jz82DDoiHO+UCctsJRdF66gSQc3P5noDndEJY6@vger.kernel.org
X-Gm-Message-State: AOJu0YxBSfdTbQ6ALZEiVBESzFp8moIdTJhrGCJoPbrYrWY/zpcwu1Gy
	faH2UWu6Cji8E8x9AL5jP6MpbDLYEBd7Ng4R6ZYN+50uT0Xgry2SZIGzhn2lu/ZFtBORfoMzy6+
	hp0GZdQXMGjKBeNYlGBHmImvKhYL8Ylo=
X-Gm-Gg: ASbGnctvqaM3axwuDMkr0LUruEQhYCWZ/L2PzqZi98ebmQmgP1+j9kw/6Fn3VG3U8TM
	cUdNOEtKRU2KNfLo1paD/1NJ3LJP2/XHJyUb6a8h/+03qoD1uzt3Clpcf5PELhOKodEmHWn3mSS
	vDugchvC/yl/T/B8/FsW5MTSfIMPYLPrNO
X-Google-Smtp-Source: AGHT+IHRMZo43pEeAtLI78ACPEQsq81r4IdJpe7xwrqhoPqeVeSetdh3kIm1Bu4kbG/AqnuQglUbFQNYsL16HqS/f2o=
X-Received: by 2002:a17:90b:350f:b0:311:b3e7:fb3c with SMTP id
 98e67ed59e1d1-311e7470ad2mr865718a91.31.1748400038884; Tue, 27 May 2025
 19:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de> <20250502150513.4169098-6-m.felsch@pengutronix.de>
In-Reply-To: <20250502150513.4169098-6-m.felsch@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 27 May 2025 21:40:27 -0500
X-Gm-Features: AX0GCFtDk6wBi6zhuoVYcuypl9PXHMAr0D_EC9JmX8PK8nOKUAJQE21kF0uG_U0
Message-ID: <CAHCN7x+KiZKwN6hHji38xqid8A-wLVSFgqrbx0jkj+KyjvuKhg@mail.gmail.com>
Subject: Re: [RFC PATCH 05/11] arm64: dts: imx8mp: drop gpcv2 vpu
 power-domains and clocks
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, paulk@sys-base.io, 
	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	sebastian.fricke@collabora.com, ming.qian@nxp.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 10:10=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
> VPUMIX power-domain nor their module clocks since the power and reset
> handling is done by the VPUMIX blkctrl driver.
>
Using fluster, I wanted to test this.  I didn't test fluster before this:

./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 57/61 tests successfully               in 7.059 secs

./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 129/135 tests successfully               in 45.741 secs

Both of these outperformed the tests I ran a while ago on the imx8mm
running at 600MHz.  I haven't updated my clocks to run at overdrive
rates yet, but if you want, I could help with that.  Either way, I
think you could push submit patch as a stand-alone or with some clock
updates even before the adding the encoder stuff.

Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit

> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index e0d3b8cba221..cf9b6c487bd5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -879,24 +879,17 @@ pgc_mediamix: power-domain@10 {
>
>                                         pgc_vpu_g1: power-domain@11 {
>                                                 #power-domain-cells =3D <=
0>;
> -                                               power-domains =3D <&pgc_v=
pumix>;
>                                                 reg =3D <IMX8MP_POWER_DOM=
AIN_VPU_G1>;
> -                                               clocks =3D <&clk IMX8MP_C=
LK_VPU_G1_ROOT>;
>                                         };
>
>                                         pgc_vpu_g2: power-domain@12 {
>                                                 #power-domain-cells =3D <=
0>;
> -                                               power-domains =3D <&pgc_v=
pumix>;
>                                                 reg =3D <IMX8MP_POWER_DOM=
AIN_VPU_G2>;
> -                                               clocks =3D <&clk IMX8MP_C=
LK_VPU_G2_ROOT>;
> -
>                                         };
>
>                                         pgc_vpu_vc8000e: power-domain@13 =
{
>                                                 #power-domain-cells =3D <=
0>;
> -                                               power-domains =3D <&pgc_v=
pumix>;
>                                                 reg =3D <IMX8MP_POWER_DOM=
AIN_VPU_VC8000E>;
> -                                               clocks =3D <&clk IMX8MP_C=
LK_VPU_VC8KE_ROOT>;
>                                         };
>
>                                         pgc_hdmimix: power-domain@14 {
> --
> 2.39.5
>
>

