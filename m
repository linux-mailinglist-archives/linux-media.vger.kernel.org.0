Return-Path: <linux-media+bounces-16423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C545F955E86
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 20:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 177C0B20D40
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 18:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40F1145A07;
	Sun, 18 Aug 2024 18:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXh+yM7E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1393BA49;
	Sun, 18 Aug 2024 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724006020; cv=none; b=Wa9qp6fFE+lLXjMOc6boEAgE5WenZUrQTN/rhe3yemV7pBVbCdoP/pwbBIApxEgU6D60aC8Yzrg8f28MYitBxnDbkd4wqla73ntuRqs6zS+tO7Z25TXGIi0QkdJ3riFH5PtbepUTv/ItJE/ilstqhi0Oa0dQi7vSsjyi+UeIVEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724006020; c=relaxed/simple;
	bh=WLfNB2hjnuXUi7ar/tjtRVxhvzUkUsg8LdXkRDpUIAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRCvDKrTfzjVsMfiTQgH7suoANxrimQCYB8HrTHbJMqwcZXG4spzhPWZjF/NmdQSNSkVKXD2vlymojT0TOYSg1lSZozDFcf7rGC+Ur61KG4qHhHPPc9/JxVNSwDs/2y+MCp6ZPfRKl3RT/JHO7iM6wkQbIlSRPtUXaH73MG2VB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXh+yM7E; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d3eda6603cso1725627a91.3;
        Sun, 18 Aug 2024 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724006018; x=1724610818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNqrC2SyS9w8+woH5OI0AUEQTcV1jIUuxeB51N4GQTw=;
        b=QXh+yM7EmLG1o0hLdiPIBOi3LDjKAwD5DxeolDtmfwDBGcDbNjV8A1P8vNyqDAaSEK
         GeTFxJZt0bUysUWji25mhJUzuOMykIUefLBILIQcOse3SKlhUxmwoD9IYlk0Rj52wHd5
         d3GOTdp7bL6N87A0OygSqaDUQAvMAdW3iysgn2pg9zgAf5hNRvrNnU6frXqNQ4KrZ15O
         LWov8O+Pbs8yLADCRcCcacWmA6N52hlujQ18Hb42oVZUM1z7GJGx+h2ga12ZpVgdy4Y4
         /9MQNZ0I6xOSUqAp3/NPfTuM7lTOyaC4e+Vw6MiiCtMJwmNoW2bfQFVquva+2MPNcBXO
         4J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724006018; x=1724610818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNqrC2SyS9w8+woH5OI0AUEQTcV1jIUuxeB51N4GQTw=;
        b=J2X7V7Az3QIQ57G296RhO3MQJi3dIDucw62185sUEFWDNVtbgk3kh5pzO30F1N2ASy
         AH+PKWYO1ZMmdmnAzezoCpqs9cSpYmhmPK7jkX5pruaEBnOm3+UKa4WFA68w3odVl85L
         vXUkOQEYpv0/nfn1oOXMNcGDbddoxEBCk1O6CG2ULbivw+S5i+wgfw30L1KMexvTTVq3
         RSUGcl0rzjpuV2dUoPNwjjCxAWVa9OVXvPxRxZz+TWg2sj9oRnjXnH6BRD1w634gmOek
         G+G75GsoEndKXbbvMyrr+OXS2f8DecJwbUUJlDVZkZu0Xox/UCSvCcMfCFzdAaJyDGru
         TlMg==
X-Forwarded-Encrypted: i=1; AJvYcCV878iF/JuHgwvgxSjPC4KWOpnmALvmLMRhH0agOlsefDihJCdW003x2JqqxfIYV7/Nw30BeMttHNO+1R0Jm/qHElRgO303t2ZV1XpuojHRYHdpa3YlEJAGcGUVIhYWL/KySUo9kWWG
X-Gm-Message-State: AOJu0YwRAoSpjzEMOeC0uHBN7kx4U0FMf2sWuOkB9newIzt8YLoroH2K
	Yw+QeS1jxoObbfnbGCfUIXMJTztouiTeMb4FqzGbbja+qSUBYphNLV87FPB2VGf9K3ViUUebypB
	CnnZy8RMpla63hbLpbsmeK6b9nv0=
X-Google-Smtp-Source: AGHT+IEf2Ui4HNRNaVCs6S89BpH9IcoFqwFXSYEloSuS6c3VjlCxleH3qS45XnYClZ6d46SUWnxddAcgrsXTfF5NXaE=
X-Received: by 2002:a17:90a:db0d:b0:2cd:2992:e8e5 with SMTP id
 98e67ed59e1d1-2d3dffde884mr9321082a91.33.1724006017771; Sun, 18 Aug 2024
 11:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814161451.32119-1-laurent.pinchart@ideasonboard.com>
 <13578505.uLZWGnKmhe@steina-w> <20240817182546.GC29320@pendragon.ideasonboard.com>
In-Reply-To: <20240817182546.GC29320@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 18 Aug 2024 13:33:26 -0500
Message-ID: <CAHCN7x+LCeNpaDi65aiEAWTgukWY7YufCnBmym5OU6FAujAxbg@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Elder <paul.elder@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, 
	Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 1:26=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Alexander,
>
> On Thu, Aug 15, 2024 at 02:05:39PM +0200, Alexander Stein wrote:
> > Am Mittwoch, 14. August 2024, 18:14:51 CEST schrieb Laurent Pinchart:
> > > From: Paul Elder <paul.elder@ideasonboard.com>
> > >
> > > The ISP supports both CSI and parallel interfaces, where port 0
> > > corresponds to the former and port 1 corresponds to the latter. Since
> > > the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> > > receiver, set them both to port 1.
> > >
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v3:
> > >
> > > - Add comment regarding the IMX8MP_CLK_MEDIA_ISP clock rate
> > > - Fix assigned-clock-rates
> > > - Dropping Tested-by as the clock configuration has changed
> > >
> > > Changes since v2:
> > >
> > > - Assign clock parent and frequency in blk-ctrl
> > >
> > > Changes since v1:
> > >
> > > - Fix clock ordering
> > > - Add #address-cells and #size-cells to ports nodes
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 57 +++++++++++++++++++++=
+-
> > >  1 file changed, 55 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index d9b5c40f6460..f3531cfb0d79 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
> > >                             };
> > >                     };
> > >
> > > +                   isp_0: isp@32e10000 {
> > > +                           compatible =3D "fsl,imx8mp-isp";
> > > +                           reg =3D <0x32e10000 0x10000>;
> > > +                           interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL=
_HIGH>;
> > > +                           clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> > > +                                    <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> > > +                                    <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> > > +                           clock-names =3D "isp", "aclk", "hclk";
> > > +                           power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> > > +                           fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> > > +                           status =3D "disabled";
> > > +
> > > +                           ports {
> > > +                                   #address-cells =3D <1>;
> > > +                                   #size-cells =3D <0>;
> > > +
> > > +                                   port@1 {
> > > +                                           reg =3D <1>;
> > > +                                   };
> > > +                           };
> > > +                   };
> > > +
> > > +                   isp_1: isp@32e20000 {
> > > +                           compatible =3D "fsl,imx8mp-isp";
> > > +                           reg =3D <0x32e20000 0x10000>;
> > > +                           interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL=
_HIGH>;
> > > +                           clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> > > +                                    <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> > > +                                    <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> > > +                           clock-names =3D "isp", "aclk", "hclk";
> > > +                           power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> > > +                           fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> > > +                           status =3D "disabled";
> > > +
> > > +                           ports {
> > > +                                   #address-cells =3D <1>;
> > > +                                   #size-cells =3D <0>;
> > > +
> > > +                                   port@1 {
> > > +                                           reg =3D <1>;
> > > +                                   };
> > > +                           };
> > > +                   };
> > > +
> > >                     dewarp: dwe@32e30000 {
> > >                             compatible =3D "nxp,imx8mp-dw100";
> > >                             reg =3D <0x32e30000 0x10000>;
> > > @@ -1869,17 +1913,26 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> > >                             clock-names =3D "apb", "axi", "cam1", "ca=
m2",
> > >                                           "disp1", "disp2", "isp", "p=
hy";
> > >
> > > +                           /*
> > > +                            * The ISP maximum frequency is 400MHz in=
 normal mode
> > > +                            * and 500MHz in overdrive mode. The 400M=
Hz operating
> > > +                            * point hasn't been successfully tested =
yet, so set
> > > +                            * IMX8MP_CLK_MEDIA_ISP to 500MHz for the=
 time being.
> > > +                            */
> > >                             assigned-clocks =3D <&clk IMX8MP_CLK_MEDI=
A_AXI>,
> > >                                               <&clk IMX8MP_CLK_MEDIA_=
APB>,
> > >                                               <&clk IMX8MP_CLK_MEDIA_=
DISP1_PIX>,
> > >                                               <&clk IMX8MP_CLK_MEDIA_=
DISP2_PIX>,
> > > +                                             <&clk IMX8MP_CLK_MEDIA_=
ISP>,
> > >                                               <&clk IMX8MP_VIDEO_PLL1=
>;
> > >                             assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_1000M>,
> > >                                                      <&clk IMX8MP_SYS=
_PLL1_800M>,
> > >                                                      <&clk IMX8MP_VID=
EO_PLL1_OUT>,
> > > -                                                    <&clk IMX8MP_VID=
EO_PLL1_OUT>;
> > > +                                                    <&clk IMX8MP_VID=
EO_PLL1_OUT>,
> > > +                                                    <&clk IMX8MP_SYS=
_PLL2_500M>;
> > >                             assigned-clock-rates =3D <500000000>, <20=
0000000>,
> > > -                                                  <0>, <0>, <1039500=
000>;
> > > +                                                  <0>, <0>, <5000000=
00>,
> > > +                                                  <1039500000>;
> >
> > Unfortunately for some reason this reparenting doesn't work (on my plat=
form).
> > 'media_isp' is still below IMX8MP_CLK_24M.
> > $ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
> >     mipi_dsi_esc_rx                  0       0        0        24000000=
    0          0     50000      N      deviceless                      no_c=
onnection_id
> >     media_isp                        0       0        0        24000000=
    0          0     50000      N      deviceless                      no_c=
onnection_id
> >        media_isp_root_clk            0       0        0        24000000=
    0          0     50000      N         32e10000.isp                    i=
sp
>
> Hmmm... I get
>
>                 sys_pll2_500m        3       3        0        500000000 =
  0          0     50000      Y                  deviceless                =
      no_connection_id
>                    media_isp         0       0        0        500000000 =
  0          0     50000      N                     deviceless             =
         no_connection_id
>                       media_isp_root_clk 0       0        0        500000=
000   0          0     50000      N                        32e10000.isp    =
                isp
>
> > I have to add this diff for isp_0 (and isp_1 if you use it):
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1683,6 +1683,9 @@ isp_0: isp@32e10000 {
> >                                 clock-names =3D "isp", "aclk", "hclk";
> >                                 power-domains =3D <&media_blk_ctrl IMX8=
MP_MEDIABLK_PD_ISP>;
> >                                 fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> > +                               assigned-clocks =3D <&clk IMX8MP_CLK_ME=
DIA_ISP>;
> > +                               assigned-clock-parents =3D <&clk IMX8MP=
_SYS_PLL2_500M>;
> > +                               assigned-clock-rates =3D <500000000>;
> >                                 status =3D "disabled";
> >
> >                                 ports {
> >
> > Now clock is setup properly:
> > $ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
> >                 sys_pll2_500m        3       3        0        50000000=
0   0          0     50000      Y                  deviceless              =
        no_connection_id
> >                    media_isp         0       0        0        50000000=
0   0          0     50000      N                     deviceless           =
           no_connection_id
> >                       media_isp_root_clk 0       0        0        5000=
00000   0          0     50000      N                        32e10000.isp  =
                  isp
>
> I'm not sure why that's the case, I don't have assigned-clock*
> properties in the ISP nodes in my device tree and things still work
> properly. Would you be able to investigate ?


For what it's worth, when I remove the extra <0> clock reference on my
board like:

--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1927,7 +1927,7 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
                                                         <&clk
IMX8MP_VIDEO_PLL1_OUT>,
                                                         <&clk
IMX8MP_SYS_PLL2_500M>;
                                assigned-clock-rates =3D <500000000>, <2000=
00000>,
-                                                      <0>, <0>, <0>,
<500000000>,
+                                                      <0>, <0>, <500000000=
>,
                                                       <1039500000>;
                                #power-domain-cells =3D <1>;


I am able to get:

                sys_pll2_500m        1       1        0
500000000   0          0     50000      Y                  deviceless
                    no_connection_id
                   media_isp         0       0        0
500000000   0          0     50000      N
deviceless                      no_connection_id
                      media_isp_root_clk 0       0        0
500000000   0          0     50000      N
32e10000.isp                    isp


The video pll is also  set to 1039500000

adam
>
> > >                             #power-domain-cells =3D <1>;
> > >
> > >                             lvds_bridge: bridge@5c {
> > >
> > > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > > prerequisite-patch-id: ad2bbccf3b0f27415fb14851cec52c431ccb354f
>
> --
> Regards,
>
> Laurent Pinchart

