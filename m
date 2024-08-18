Return-Path: <linux-media+bounces-16422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C32955E82
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 20:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADF651C208CA
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 18:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B0914EC5B;
	Sun, 18 Aug 2024 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVo7w8oU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013F749630;
	Sun, 18 Aug 2024 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724005456; cv=none; b=oZIFK8JAKuZ+LrOfdUBOAfevDdrPCqgPTf40TZMsugh4bCIiZex0hJYO5XDzF9hvU0rfF75WbM2GpEbRmwHMCwK8dGK6rAcSzx8wLkD2C2zN0dajKR6haX+iK6ToVzR+KRvhBUuz0au4uAdWtwAo/2qh5ijgwCnyIDDF424fkiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724005456; c=relaxed/simple;
	bh=FvZ8kuAZWxMpIjQiOOdkwG/HNI1/9mgEBslJihXT+6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kRd1Ewzh1LWDnSOa9LgVQc98HBZLIHFYAKgNpwv+bjI5wvnIQ8uoZhA7e3g5I7rhjWDbQvDIEDsJEAxRADoykFP4AyXHDpYjkMQ7vbfTYgF25dO/huMq55JcXIclq0UzXgikBl1U3Tjau+JtXThmV2j1+7m4wfIDvrkKcrx8mhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVo7w8oU; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7c3e0a3c444so2316760a12.1;
        Sun, 18 Aug 2024 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724005454; x=1724610254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztdZKVXboTeh21wML9vQfK4sieO9DxbPhdkFttpUEeU=;
        b=jVo7w8oUXrHRzttB9I/6QsbLYq0oLo2aOjCe2puxCEVPC2X6hfb8TH7Qf2Ob1U0KTr
         0AaX9kbNfo9r996SbwSXxwQ9Iza5u4kw8NYacVVnck9DI+i7FUNpCU4JXYioxUn3j3OE
         8Nc9ORgxy+Gfe1tPKaZBvHuUFp+wo2cgGaABzxOBIAIn1ykyHKrtK7LlFHK/caiIRYRi
         LwF6L+TwLZ35e+E+4tm5FTGFYMPIiXZoqJKF/9d833VQNY1CqYSN3/QPVvr2FETaIKCC
         dLWivVylzXEADSBmkYmeRYK21NlfUqWWNLQhzObkHt7eFc7lqRNl+iaO5V8blDwdQTzu
         ckGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724005454; x=1724610254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztdZKVXboTeh21wML9vQfK4sieO9DxbPhdkFttpUEeU=;
        b=KsKZzBeCUboUipgeAxXNb2xhrP2h7OZWQWLWlM57ZmzwOeYWxsd9S2BGOmsEMt47h7
         XdqBkVsec5rQ9rQ/am5R2FEpAk2/9sTaSwiiGG9+w9DnsyTj/0XK2gBVmH7O9Q448RuP
         ICKd7DdnO/IB3GxinGZ5XwUfn6/hdXmeP3PKQI6ybig++uFtB/X5lF34F03Xg2rC6VjN
         xnzN6k4pHwjZCjXMn6KdeFlpTRbp16rAlEjmqVBr8+vcbXyA4F6Na4JCprTHbp5gSqMb
         sTB+XioSIYHx6eW4Sdj7emM5uzvPjvEi30QO9FdsZlZpqgpqq4qtzRz4795PA3Z8pWLw
         xsvw==
X-Forwarded-Encrypted: i=1; AJvYcCXIv2K6a2IR8keWHnSkvdL5Xji3s2vPGf0eSmdUCinAqNX1EXlUnGGxAYIqVSHayM6Ng7rnQUGSKmGIxP7ILEGKvooZvxZj/8izQLSaPP5EOr4s/Oyh/df3mc0cgQdrCphQhOx37SLj
X-Gm-Message-State: AOJu0Yz/hWHBWc9b/XRNLkZJiWXjNbOXaMwEVYgRMjeNQYvEQcOqSp+s
	Bjor3XVpoJlat8Vc11KF0MwZAHuCqpD6rrEKAzuGv0gl/rt7emZCp2WY0cp1UM/ahwT21jqKud7
	9dCfb8rMjwxRvMvWZ6ZobTrjOkWI=
X-Google-Smtp-Source: AGHT+IH8MNmh+Dob6GRO6qpaqicp8WJvCXkoghUcgid2cN6I1wiSRB01A4iSxWCvu5gRC7oiIAq/zct27GnmniEKul8=
X-Received: by 2002:a17:90a:f696:b0:2c9:7343:71f1 with SMTP id
 98e67ed59e1d1-2d3e45d3fa0mr13074786a91.14.1724005454124; Sun, 18 Aug 2024
 11:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813234004.17807-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240813234004.17807-1-laurent.pinchart@ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 18 Aug 2024 13:24:01 -0500
Message-ID: <CAHCN7xJULS-mR_2KoikzMt7piGWvaLHAfMbMkJtgESW-6pfv8g@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Paul Elder <paul.elder@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, 
	Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 6:40=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Paul Elder <paul.elder@ideasonboard.com>
>
> The ISP supports both CSI and parallel interfaces, where port 0
> corresponds to the former and port 1 corresponds to the latter. Since
> the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> receiver, set them both to port 1.
>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Adam Ford <aford173@gmail.com> # imx8mp-beacon
> ---
> Changes since v2:
>
> - Assign clock parent and frequency in blk-ctrl
>
> Changes since v1:
>
> - Fix clock ordering
> - Add #address-cells and #size-cells to ports nodes
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 51 ++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index d9b5c40f6460..09f1e27ee220 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
>                                 };
>                         };
>
> +                       isp_0: isp@32e10000 {
> +                               compatible =3D "fsl,imx8mp-isp";
> +                               reg =3D <0x32e10000 0x10000>;
> +                               interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> +                                        <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> +                               clock-names =3D "isp", "aclk", "hclk";
> +                               power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> +                               fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> +                               status =3D "disabled";
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                       };
> +                               };
> +                       };
> +
> +                       isp_1: isp@32e20000 {
> +                               compatible =3D "fsl,imx8mp-isp";
> +                               reg =3D <0x32e20000 0x10000>;
> +                               interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> +                                        <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> +                               clock-names =3D "isp", "aclk", "hclk";
> +                               power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> +                               fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> +                               status =3D "disabled";
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                       };
> +                               };
> +                       };
> +
>                         dewarp: dwe@32e30000 {
>                                 compatible =3D "nxp,imx8mp-dw100";
>                                 reg =3D <0x32e30000 0x10000>;
> @@ -1873,13 +1917,16 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
>                                                   <&clk IMX8MP_CLK_MEDIA_=
APB>,
>                                                   <&clk IMX8MP_CLK_MEDIA_=
DISP1_PIX>,
>                                                   <&clk IMX8MP_CLK_MEDIA_=
DISP2_PIX>,
> +                                                 <&clk IMX8MP_CLK_MEDIA_=
ISP>,
>                                                   <&clk IMX8MP_VIDEO_PLL1=
>;
>                                 assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_1000M>,
>                                                          <&clk IMX8MP_SYS=
_PLL1_800M>,
>                                                          <&clk IMX8MP_VID=
EO_PLL1_OUT>,
> -                                                        <&clk IMX8MP_VID=
EO_PLL1_OUT>;
> +                                                        <&clk IMX8MP_VID=
EO_PLL1_OUT>,
> +                                                        <&clk IMX8MP_SYS=
_PLL2_500M>;
>                                 assigned-clock-rates =3D <500000000>, <20=
0000000>,
> -                                                      <0>, <0>, <1039500=
000>;
> +                                                      <0>, <0>, <0>, <50=
0000000>,

Is the insertion of the extra <0> here correct?  You inserted one
clock above for IMX8MP_CLK_MEDIA_ISP, but it appears you inserted two
here.
I think this might break the IMX8MP_VIDEO_PLL1 rate and not set the
IMX8MP_CLK_MEDIA_ISP as expected.

Am I missing something?

adam

> +                                                      <1039500000>;
>                                 #power-domain-cells =3D <1>;
>
>                                 lvds_bridge: bridge@5c {
>
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> --
> Regards,
>
> Laurent Pinchart
>

