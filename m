Return-Path: <linux-media+bounces-31634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57905AA774F
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 18:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8511893C1A
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FEF2609C9;
	Fri,  2 May 2025 16:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4TKzIOr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16B725F98B;
	Fri,  2 May 2025 16:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203443; cv=none; b=dxk9oetRpuQmyM2zAPHLSDM0itLxEt+vLkTM43D7EM4rF+3nBLq/VLHBbDng/2//yvK98yFk2Y+Ap4NglrH47jFzjoAIgYaR+3QnNmPSiir6At+y5T2zb7E5fh7Vx5fufT7egfC23EbS4HfPH0yeDG1dFYSbo+t1jqBgX9ydrN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203443; c=relaxed/simple;
	bh=GGGJaQnxnZ+/Qywxhcm3pMs8DHoqSjZXKNpRXJXqxNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Khpspj3vDYJi8YvPEeOrr8mNT6WE1F7QD73nVnnBO7ZT9gBMBGecA9vlyn9yt3k3Fo+uTMatMjUidaO+ufSQHAc2xgJvTYaddQ6NBXvI9BpA+AjRHOxYSa5SmouHnMysK6MIoy6opPW9A8fTufoPR2rvJj47A8sCd6RdXtPxLxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4TKzIOr; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso2878095a12.2;
        Fri, 02 May 2025 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746203441; x=1746808241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLgGDAzhbzi8zBfreiBGkw9+hq2PN6Kh7ZFPU4njLno=;
        b=A4TKzIOrMjGT7Ip0W/FBp0g0/+Dz7vf//Ohe7I4qz4KMmb9Ib9cQ/jEJInNoiv/JEd
         cmZ1JATDTaJ6bvKWXOwDBfmZrK7ZrKFP3nHTfNnszYqMPhylX1vgAxI9ALCvErv3oByM
         je/WCYjh1nETlCr4XKBUEQq7gBGnziai6+Krci0w1GEif3o8D5DmdOsrCn2b30mS+k0L
         HBvi9NxNPQpHIIYo5P0GX6BftG9vYS026V6qonabko72vUloweSDCVx5dhQo1hoTNCR8
         g10dtL5DpDuJpDbs98EtHupE5+G5QG6k5LnwNgWfccJVJM5gUrDjPfHurre0wdKiLTo2
         q9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203441; x=1746808241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLgGDAzhbzi8zBfreiBGkw9+hq2PN6Kh7ZFPU4njLno=;
        b=mx/+LdQpOsBrHCfvJ069aFbfyTwjdydoPYqNW+pP5pcxguiXx31IgP0Zj0ICMRVK2Q
         JvDm828IkYybFQtejRnEKtbZXweJ0LT0SgQ/S5ama8AOtYkS0+vJ0ye/pdjGb45v0NaW
         OFMnpf11P92+9gm67oZetBOa5UA/99miTSLmxP6lxL6zgX4Ew4Hi3gGEV9VsQccLCi8F
         eiP/42xcvD08SpTC3FEFLQMZE3wigUgjxvqeq2dq5U+Iko2psiMQjDVGl0OEeXi78aVy
         Zt5QyUW0pl+S5PRH3tLMRKpdBCXFb/ZBTJijJo9Aa8nIMImB+VqXUWo+Mkq8dXZNSvPd
         knhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxJQKU61tCdxm5/mFiICfUTPn3Pt0yTGTcTEBx/sBeUa4+JS+fUe6dupnL1yJqhzOdIjNJojBCtSI0LUQ=@vger.kernel.org, AJvYcCXTTdo7HQO87RAFh9b1RH48ggY5NJzXJhfCVlnzl96nOwkDWgnL3OHOj//pWuXQwN5+ThQ7iOrIx7l5@vger.kernel.org, AJvYcCXn8XxMkX1SKgB9a2jNNe2VFQQHvM+8Gw0nFNqpoH7txDFq6DYnB0UcUtedFItXZbUiAB8pepI/vwhmGKwS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ZiqGTaK/e4uGtW9MRAW0kNEp+s9LpXzw2TraDjs01xDubsXc
	8rR3xWMteJUkNjKkjjKQ0kEYCTlmv6IX7yq8HAWqa03Ih1xya2CwXqwMW2YHFhPGo/Fmvyi88ao
	BZIk8zrXCnVwGniwN5Y9+lingC58=
X-Gm-Gg: ASbGncvXgAZT0xcCVhKoUgabFEt4g43Qnp9BtOy7TbKFEEcC4IjK/Z8PwuikDwWb0hp
	coxrXgf9Ru7cmAc8sBk6afX29S5RhFFQTiD6Ip/pbUx5SzGJY4EaXP//Fq7ct2U83qyLh0n2/2G
	ykjSyh0IZrBWdntRP7q+g/tg==
X-Google-Smtp-Source: AGHT+IFD83mVdOJy5lpNuPlZVPmLooAoJbMjhC2ix2c3XVL7B+J+mwkKq3CJH7cJU97BTv0F3P0V/yqYXOccmyxktrA=
X-Received: by 2002:a17:90b:582e:b0:2ff:6608:78cd with SMTP id
 98e67ed59e1d1-30a4e5a5e10mr6554332a91.9.1746203440962; Fri, 02 May 2025
 09:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de> <20250502150513.4169098-6-m.felsch@pengutronix.de>
In-Reply-To: <20250502150513.4169098-6-m.felsch@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 2 May 2025 11:30:29 -0500
X-Gm-Features: ATxdqUGSLq9P6-CspNr6ECgbQeHdf383py-pp3cQ3WrpLLPzF-nJ74mtxVZrvag
Message-ID: <CAHCN7xJ5p+dwJD7i7caqwhmrz8+gZDVeqfdWA_=He-H+aTJgRg@mail.gmail.com>
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
It was my understanding that having this dependency ensures the order
of the bring-up, but maybe I am wrong.  Do you know if the 8MP
suspend-resume works properly?


Should this get a fixes tag?

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

