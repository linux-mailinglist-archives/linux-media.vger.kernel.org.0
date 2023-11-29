Return-Path: <linux-media+bounces-1305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD287FCD5C
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 04:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAF19B2155C
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 03:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C585566F;
	Wed, 29 Nov 2023 03:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+LQl0K3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4961990;
	Tue, 28 Nov 2023 19:18:03 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6cd89f2af9dso3141167b3a.1;
        Tue, 28 Nov 2023 19:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701227883; x=1701832683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSpkPO6mTZBYtP6dAin29JDzMqWLZ10a/rujYdeVJco=;
        b=k+LQl0K3mxREL4/76iVeIuXcjNCivsVSEVcN2Tsu7RQwKRi6Vj3Ryti7LKqUDVeMJD
         XYNbRpyFePapQSwqjeVtfuHAuNTkT1HyIP0F3fT2wVez/OgxSVeNFXUN9p+BWIMAMg5u
         R6dnon5N1oQbciJX+Sq+77X/bzL04LVoHZZuezzSzPxxBKj0pdEboLZuaOV2tdHq4ksE
         BZijOQdqu2cHBayCb3HvN5nTSUYzg4LgZxgkGS291Eat/RV+jTADMGKQjTVfJbnYVh3n
         NLRJZpQAYbF+LL9iDMQpO8K+8BYIYsYCyEjuBEt0aYef/dXKjaC8ArNcofnhxLooKTSX
         TCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701227883; x=1701832683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSpkPO6mTZBYtP6dAin29JDzMqWLZ10a/rujYdeVJco=;
        b=wMZX0Bt9OGI37EpaxsDo5zgXnYM7Gd1Xgu9AgpsaIuE76NK1sQns36uhdphWIYrjc5
         SoLspuhWokwZxvXWN1t1m4q4D/eXWrGzPKLXjAKCHnONoQKNsdsPXMXHtnEIbqyyxMLf
         bc+QADnHX7BK0o+5kLGdLDuYrTFUWvbkkEmDGps78U+pxOAthRda7J+IzTGYstdYBRzn
         1I1nlCmaoC/uxLgsIJ874vdNm1rl8moaStdBTwT0Kxxpai/3itKJBRWNOR4BCXSykHK9
         UZvdyyhNUjHu4eOTWsMsP0ngjI5rRjFrH7gP5hZx/4Mq/sg6xIe6JGHl8XF1B5xKAdpn
         dxKg==
X-Gm-Message-State: AOJu0Yzommmeky5ULRqNHfrWDmMOTo9ithAdzYh/vcS5urOQB/MoOjrd
	STWPhHd4hPBy5X3VMo4qpfgCJPOO9Ej3Q9tR24A=
X-Google-Smtp-Source: AGHT+IEWDbBNmR0nirBoEL9DEds4xbi+UWqa34Xsn/yQiOPJ4jkWNHD5NUpZZkwLIrnhH7zrk+T8hEP/AmF9GEwRu6w=
X-Received: by 2002:a05:6a20:d704:b0:181:44c:d6a with SMTP id
 iz4-20020a056a20d70400b00181044c0d6amr26074616pzb.21.1701227882873; Tue, 28
 Nov 2023 19:18:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com> <20230417055627.16482-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230417055627.16482-2-laurent.pinchart@ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 28 Nov 2023 21:17:51 -0600
Message-ID: <CAHCN7x+kymRGO2kxvN2=zLiqRjfTc3hdf3VdNVkWjsW3La0bnA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mp: Add CSIS DT nodes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, 
	Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 1:01=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Add DT nodes for the two CSI-2 receivers of the i.MX8MP.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Laurent,

Sorry to dig up an old thread, but I have a concern about the clock
ratings and nominal mode vs overdrive mode.  I started investigating
the different data sheets amongst the various imx8m[mnp] families to
make the default device trees run at nominal mode while also creating
a separate dtsi file with settings for overdrive so boards who use it
can include them without having to duplicate the clock settings for
everyone who supports overdrive.

>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 60 +++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 2dd60e3252f3..2a374a4c14a2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1239,6 +1239,66 @@ ldb_lvds_ch1: endpoint {
>                                 };
>                         };
>
> +                       mipi_csi_0: csi@32e40000 {
> +                               compatible =3D "fsl,imx8mp-mipi-csi2", "f=
sl,imx8mm-mipi-csi2";
> +                               reg =3D <0x32e40000 0x10000>;
> +                               interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               clock-frequency =3D <500000000>;
> +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_APB_ROO=
T>,
> +                                        <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_=
ROOT>,
> +                                        <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1=
_REF_ROOT>,
> +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
;
> +                               clock-names =3D "pclk", "wrap", "phy", "a=
xi";
> +                               assigned-clocks =3D <&clk IMX8MP_CLK_MEDI=
A_CAM1_PIX>;
> +                               assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_1000M>;
> +                               assigned-clock-rates =3D <500000000>;

According to Rev 2.1 of the Data sheet (IMX8MPCEC), dated July 2023,
500MHz is listed as single-camera, overdrive mode.  Single-camera,
nominal mode is 400MHz, but there is more...
If configured for dual cameras, both CSI can only support up to
266MHz, but we have partially configured both albeit without the
actual camera sensors connected.

> +                               power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_MIPI_CSI2_1>;
> +                               status =3D "disabled";
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@0 {
> +                                               reg =3D <0>;
> +                                       };
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                       };
> +                               };
> +                       };
> +
> +                       mipi_csi_1: csi@32e50000 {
> +                               compatible =3D "fsl,imx8mp-mipi-csi2", "f=
sl,imx8mm-mipi-csi2";
> +                               reg =3D <0x32e50000 0x10000>;
> +                               interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               clock-frequency =3D <266000000>;
> +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_APB_ROO=
T>,
> +                                        <&clk IMX8MP_CLK_MEDIA_CAM2_PIX_=
ROOT>,
> +                                        <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1=
_REF_ROOT>,
> +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
;
> +                               clock-names =3D "pclk", "wrap", "phy", "a=
xi";
> +                               assigned-clocks =3D <&clk IMX8MP_CLK_MEDI=
A_CAM2_PIX>;
> +                               assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_1000M>;
> +                               assigned-clock-rates =3D <266000000>;

266MHz is correct for dual camera, but in single camera, the second
CSI is capable of 277MHz.

At a minimum, I'd like to fix the overdrive frequency to nominal, but
since we're plumbing in both cameras, I wonder if it would be better
to run both at 266MHz with a note on CSI0 that states it could run at
400 or 500 if the second CSI is disabled and a note on the second CSI
that it could run at 277 when the first one is disabled? What are your
thoughts?


> +                               power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_MIPI_CSI2_2>;
> +                               status =3D "disabled";
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@0 {
> +                                               reg =3D <0>;
> +                                       };
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                       };
> +                               };
> +                       };
> +
>                         pcie_phy: pcie-phy@32f00000 {
>                                 compatible =3D "fsl,imx8mp-pcie-phy";
>                                 reg =3D <0x32f00000 0x10000>;
> --
> Regards,
>
> Laurent Pinchart
>

