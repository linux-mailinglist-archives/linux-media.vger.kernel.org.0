Return-Path: <linux-media+bounces-31636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B2AA77CA
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 18:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF6441C20543
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2832690CC;
	Fri,  2 May 2025 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOgNXoes"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CC7268C48;
	Fri,  2 May 2025 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204789; cv=none; b=jKkkByB0+GncdLn4+1OQIzECEP/MbgBTan4QEQVWS4DrOlhGvQTMrI0rSiwJ5WuOdtPvxksRK7ZWZbF8oRLvTc6Yq4hD61PMo6ZYCXw++y6V6yJ1SixUZuAzVP3eIwTuqFHXnjiuUam6dojHbyGOqoMqLBjgcSQW5ZXCZOjPYGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204789; c=relaxed/simple;
	bh=g4VUCjRthehjpe2xs+A0+SCTnyPwxFun1Jy7XN11WVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oc3gdVhSlHMCvDCqzweePL9pMqe9wg9OvQjR3nprWDRomw119LGCnHr4Aq3kRKR7jAwZ5DyFzQ38wvRMFao7HNRVC62j3EnUjbnA5jy5jc4g5Ob6c5mapep0IA+D4io5FzdqNqGFwQfNtr+tBxpI3VkNj5cEE9kXbcc6/qL/3OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOgNXoes; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30820167b47so2379962a91.0;
        Fri, 02 May 2025 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746204787; x=1746809587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7UI2Y6MBJpdKB31fdutcaWyVKKdFp08Cn0ReKUGIo8=;
        b=dOgNXoesIB7QCjUEDBpYQWErykfMD1g+l+5wlV8mz5rwY07rXOdkWQupPxvqpmDtKZ
         QgPL3uBMQ/b+tuFTeSh+X8uWHJZoeX4F69JTQ9FCzhBs4HykOo+TtdQwqRsjatYFw6LJ
         oCL5QVoIJTUF/pA61gYKzw3pCbAShLl24kppM+29Rnp4oWdSS1xMdP8z8/YF6QEiJy0O
         zKGAHN+dSvX2hk07RYy7jqo12DeJiTUL3ZciGex2dO1wFm6zFwHNn1hyLvfW7CmEYoW8
         N5353EAokrXt0t/kmrXCCC+oY2JySDtJGnDq7KWU8L/9Sos6DQP0cdBhhV9mEyxhYLqn
         tskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204787; x=1746809587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7UI2Y6MBJpdKB31fdutcaWyVKKdFp08Cn0ReKUGIo8=;
        b=Tx+8MJkQAaE1RVnle+xe8NSyi8jBdQJyZaMEq0G8hh4iAPFEXVsGYrGrQX/K7i1CRi
         u9+9d6vEKfIOeN1hf15EG1XGMH7Kxn6/i2f2nwx6oaaGXnd5Bfw5xNeke1FeCzBiBem9
         EGz0QmMfF4Gnp72hwRWkyJf97cs5uL7cqIPmgqK+k9tdLGKmsyDNiuZvppZaOgXXL2W1
         Le18q4jZbhw3MPWcjcnQHsqe3A1o5bj6khUW9Fcwu//RuEknPgtA3kE3TW+Qiy0nP46e
         s8xQtuk7ny0bPd76Blm+EZScVu2B1p2SorGWiAvgmsvlD/pPropz8b7IIIv0qMqmU6Oz
         b1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqNMEPC2HX4byDJ9hlLwTyl5Pd/AxndIlz2fqyO1yLn2suXz2hz1IVo7DWtAm7gyAlWVxQAPlAK3C7GRc=@vger.kernel.org, AJvYcCWvgfmQr4u1KisA8EUUlfdd1FzcMxQDSuQY7ERGUX+h0nrc6D+QgZBA8fcJYJ3wmt0GQdDAnJgjObvp@vger.kernel.org, AJvYcCXnwHVj9emEcuX6eoQ8eAmupTCEWdh+A/FgU70TbL0ukUAOST159qm1U3iUEhT7lBK3BmJ41QLgsJdZt2Hg@vger.kernel.org
X-Gm-Message-State: AOJu0YwF53Glky94WkKAFS3rc5sejXOl4WG85HVWGXCfFIT1n1eKbQgP
	+wNXwoIdX1SrGsWRP1EJMgijNAs+yezhcZ+lTwOfX9S9zbgOyzVyexPgbeB1wMf3gJ5SzdHk/R5
	LMRXyYyKUVK/R0UWWnXhDgIidJlroNLDATQ0=
X-Gm-Gg: ASbGncsW5RuElAGMECInupXQRnTEBKa+hl2x1kk4Dedyc3dPAieaX12hIVtZMQKAaEr
	/jCQoRlt/+Xe0z/jv4j5Cn+N4tYnwvw2oe2WxEPq1hvaniXaay+oVt0Pkb5XJ4iKa7sltQIKrKb
	Fpu5FfRzVLXTIdbEgDzkPY/g==
X-Google-Smtp-Source: AGHT+IHGTYOtyWFxjXS9Ul06M6JVtewP0QqLDSWygChMn5nReUMS9WxVTU7k4hPxbBaUObqwnTWe5V/cpuVhKJnX2Y4=
X-Received: by 2002:a17:90b:254d:b0:302:fc48:4f0a with SMTP id
 98e67ed59e1d1-30a4e04c98dmr5766332a91.0.1746204787157; Fri, 02 May 2025
 09:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de> <20250502150513.4169098-8-m.felsch@pengutronix.de>
In-Reply-To: <20250502150513.4169098-8-m.felsch@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 2 May 2025 11:52:55 -0500
X-Gm-Features: ATxdqUE-GbFHdhVzbDY9mw-AkKfv1gk9sfEHekiKJv7IfKQ5yld-yg7UXiz-NTw
Message-ID: <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
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
> The VPU_PLL clock must be set before the VPU_BUS clock which is derived
> from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 97b09b647ec7..7f4bdefb3480 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
>                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
>                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
>                         clock-names =3D "g1", "g2", "vc8000e";
> -                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_BUS>, <&=
clk IMX8MP_VPU_PLL>;
> -                       assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL_O=
UT>;
> +                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&clk =
IMX8MP_CLK_VPU_BUS>;
> +                       assigned-clock-parents =3D <0>, <&clk IMX8MP_VPU_=
PLL_OUT>;
>                         assigned-clock-rates =3D <600000000>, <600000000>=
;

I think there was a move to make the default be overdrive [1]  and [2]
and use a 'nominal' device tree for those who are not in overdrive
mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
values here should be 800MHz and if we should add the nominal values
of 600MHz to the imx8m-nominal.dtsi file.

adam

>                         interconnects =3D <&noc IMX8MP_ICM_VPU_G1 &noc IM=
X8MP_ICN_VIDEO>,
>                                         <&noc IMX8MP_ICM_VPU_G2 &noc IMX8=
MP_ICN_VIDEO>,


[1] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/arch/arm64/boot/dts/freescale/imx8mp.dtsi?h=3Dnext-20250502&id=3D9f75=
95b3e5ae0ead20a74a5f2a8f0434b3254ac5

[2] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi?h=3Dnext-20250502&i=
d=3D4b98bf3bff7353d94824c4d874ff2d7f38acc49a

> --
> 2.39.5
>
>

