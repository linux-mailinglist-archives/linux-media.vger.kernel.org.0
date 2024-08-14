Return-Path: <linux-media+bounces-16271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E5951489
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 08:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDEFBB2389B
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 06:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE3D139D15;
	Wed, 14 Aug 2024 06:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRIORO3L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD99613A265;
	Wed, 14 Aug 2024 06:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723616970; cv=none; b=DMZY5v2Sfm9yEVzkDRPsqiTDKfOeyZhtSCtCtKu2azLP8aX8990pVYX0CP47l0mEGAhEo75h1oVsPJkO8AdKjM4bhxwUAJlheomSf1KB+g9k5R9fIiTsz/OqcswXWngDXJHwZwDthDReLtZ8N86PJ9CspFjjKBkdgpUBDZX5vCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723616970; c=relaxed/simple;
	bh=6Y5wNcHqv4RijldZVaSZP0YFJszQo0vY0Cs1Y9QYHek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nk5yhES33SWCYjLHSH5mLPRCHlMl30rqZGH/8/JVNRQjLkeND7hiXFy1AG4dOFzRgxm13H/cYi6c24boXUYwbcLbdr6N4fuNQUsgI4p+xb3fR2AhI80pA7TF9U26BD9ZRx3S0h9mE1/VLWv2EObIh/RzT2KWOZPJGv9XSNciwC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRIORO3L; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7afd1aeac83so417350a12.0;
        Tue, 13 Aug 2024 23:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723616968; x=1724221768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0/dPyc7sqRwp8j2DHrktfgc1+crSbA+gSKSi8WXN5w=;
        b=QRIORO3LqpC8D2I6ROsc4Ui/6IQO02gU6vUpEjQotClx75MuRKljatESsu5kBZ47wF
         RvonPocSTMzRFNs8IFXH1xfJM6Vn3Ijj+emxyHP2TNfCB3wBw9Z2DD0G3L85DoUkD/Fw
         aa8HJZPTxlXt0INvWdshig82sn21TyhzakNibYBMzt8j0C6vOSQYkKUvog2Vf99+TIEo
         s/6uvpk7ImOr/sUVCxfXuc1QBqtcRzt9NXBOA7QDpP2jib0r9RcOHfGKTzJXEYC+4MCR
         JdBL4cTJnxNOS9ANULMxhtaqJAtLnLMF68cUaddy9XfgxI5nSzUxdqQydomm4NUKDaTC
         nLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723616968; x=1724221768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0/dPyc7sqRwp8j2DHrktfgc1+crSbA+gSKSi8WXN5w=;
        b=sq5MISftnWFWyvpnCw99VqFTt6c6/k2TKXaWkOkGn9U2Ac8iNoy8viODBm0JKQ9j46
         04GZtxj4yD32WhVUrHcT++tltT1ETLWwnhvLVbgvt6h9uKy9Ym5BhID7sXhPNqQlet6K
         66eAl+S8oJrUjWJshO8w+muFtqdVDX0YnTksckGT/wXV6Hp5l0tU0oAHmIEo7Bt3SgG3
         U6MEMjY2HcagjAX4FSrOVf0ctiSw+ZAWu9bAAsngv/ROPC+ovmU5bGiUkLkHvQ5FlvgR
         VEaZEvXGSqcHwFqqUSL/2akjWBjOBuC+y7iHRaNJlQlEbK7iMPl3SQyibdcsKDO/wku5
         KF5A==
X-Forwarded-Encrypted: i=1; AJvYcCVz5bFB1DPulEdlIBjNRHW758bFjPqfYrCFD8F6vyFGELVwg6liCRLpgZU7igJ3R2TCDYfTCOn7gt8vY20y7FNYEGO3+G3p/yge0l6Dx+SOLKiWmbzQYZiPBHOmvbyEflx4MeuaRN5u
X-Gm-Message-State: AOJu0YwWBDDH7sJZgG4RJwGCJk2uasxl2vpsO8nDB/BHiZFNura2vDTV
	VzWSYdGPuEzWWtrnlTh+6W/1ClAR6LFu1HXacLv77imZfNV/B8az95gvpOShcc2RwCo7rBd36RY
	x3fy/fNZBQcQcqBoM33K/4Nrt+CM=
X-Google-Smtp-Source: AGHT+IH8YV5sqo0iLIATUabyi+O4Fg2UxmsvGUjo0gdEMIfbv6RLSgKxxKUQLel+TVa0we7sJu+A4Uc5a3VqX+LH7R0=
X-Received: by 2002:a17:90a:c297:b0:2d3:ad05:7240 with SMTP id
 98e67ed59e1d1-2d3ad0573b6mr1696839a91.22.1723616967652; Tue, 13 Aug 2024
 23:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
 <4879631.GXAFRqVoOG@steina-w> <20240325204924.GY18799@pendragon.ideasonboard.com>
 <2929432.e9J7NaK4W3@steina-w> <CAHCN7xLFjJUZQZwPbj5xyxnprwAV3TOvd_6A6sBwOPK+V6uQPA@mail.gmail.com>
 <20240813222204.GA21831@pendragon.ideasonboard.com>
In-Reply-To: <20240813222204.GA21831@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 14 Aug 2024 01:29:16 -0500
Message-ID: <CAHCN7xL4+EqtbH-Pg6+wTYmjbE-7W=YSE0Pyp-mKDzQrJ9PV1A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Elder <paul.elder@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 5:22=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Sun, Jun 09, 2024 at 03:21:19PM -0500, Adam Ford wrote:
> > On Tue, Mar 26, 2024 at 2:14=E2=80=AFAM Alexander Stein wrote:
> > > Am Montag, 25. M=C3=A4rz 2024, 21:49:24 CET schrieb Laurent Pinchart:
> > > > On Mon, Mar 25, 2024 at 04:52:21PM +0100, Alexander Stein wrote:
> > > > > Am Montag, 25. M=C3=A4rz 2024, 16:13:39 CET schrieb Laurent Pinch=
art:
> > > > > > From: Paul Elder <paul.elder@ideasonboard.com>
> > > > > >
> > > > > > The ISP supports both CSI and parallel interfaces, where port 0
> > > > > > corresponds to the former and port 1 corresponds to the latter.=
 Since
> > > > > > the i.MX8MP's ISPs are connected by the parallel interface to t=
he CSI
> > > > > > receiver, set them both to port 1.
> > > > > >
> > > > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.=
com>
> > > > > > ---
> > > > > > Changes since v1:
> > > > > >
> > > > > > - Fix clock ordering
> > > > > > - Add #address-cells and #size-cells to ports nodes
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 50 +++++++++++++++=
++++++++
> > > > > >  1 file changed, 50 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mp.dtsi
> > > > > > index bfc5c81a5bd4..1d2670b91b53 100644
> > > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > > @@ -1616,6 +1616,56 @@ isi_in_1: endpoint {
> > > > > >                           };
> > > > > >                   };
> > > > > >
> > > > > > +                 isp_0: isp@32e10000 {
> > > > > > +                         compatible =3D "fsl,imx8mp-isp";
> > > > > > +                         reg =3D <0x32e10000 0x10000>;
> > > > > > +                         interrupts =3D <GIC_SPI 74 IRQ_TYPE_L=
EVEL_HIGH>;
> > > > > > +                         clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP=
_ROOT>,
> > > > > > +                                  <&clk IMX8MP_CLK_MEDIA_AXI_R=
OOT>,
> > > > > > +                                  <&clk IMX8MP_CLK_MEDIA_APB_R=
OOT>;
> > > > > > +                         clock-names =3D "isp", "aclk", "hclk"=
;
> > > > > > +                         assigned-clocks =3D <&clk IMX8MP_CLK_=
MEDIA_ISP>;
> > > > > > +                         assigned-clock-parents =3D <&clk IMX8=
MP_SYS_PLL2_500M>;
> > > > > > +                         assigned-clock-rates =3D <500000000>;
> > > > > > +                         power-domains =3D <&media_blk_ctrl IM=
X8MP_MEDIABLK_PD_ISP>;
> > > > > > +                         fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> > > > > > +                         status =3D "disabled";
> > > > > > +
> > > > > > +                         ports {
> > > > > > +                                 #address-cells =3D <1>;
> > > > > > +                                 #size-cells =3D <0>;
> > > > > > +
> > > > > > +                                 port@1 {
> > > > > > +                                         reg =3D <1>;
> > > > > > +                                 };
> > > > > > +                         };
> > > > > > +                 };
> > > > > > +
> > > > > > +                 isp_1: isp@32e20000 {
> > > > > > +                         compatible =3D "fsl,imx8mp-isp";
> > > > > > +                         reg =3D <0x32e20000 0x10000>;
> > > > > > +                         interrupts =3D <GIC_SPI 75 IRQ_TYPE_L=
EVEL_HIGH>;
> > > > > > +                         clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP=
_ROOT>,
> > > > > > +                                  <&clk IMX8MP_CLK_MEDIA_AXI_R=
OOT>,
> > > > > > +                                  <&clk IMX8MP_CLK_MEDIA_APB_R=
OOT>;
> > > > > > +                         clock-names =3D "isp", "aclk", "hclk"=
;
> > > > > > +                         assigned-clocks =3D <&clk IMX8MP_CLK_=
MEDIA_ISP>;
> > > > > > +                         assigned-clock-parents =3D <&clk IMX8=
MP_SYS_PLL2_500M>;
> > > > > > +                         assigned-clock-rates =3D <500000000>;
> > > > > > +                         power-domains =3D <&media_blk_ctrl IM=
X8MP_MEDIABLK_PD_ISP>;
> > > > > > +                         fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> > > > > > +                         status =3D "disabled";
> > > > > > +
> > > > > > +                         ports {
> > > > > > +                                 #address-cells =3D <1>;
> > > > > > +                                 #size-cells =3D <0>;
> > > > > > +
> > > > > > +                                 port@1 {
> > > > > > +                                         reg =3D <1>;
> > > > > > +                                 };
> > > > > > +                         };
> > > > > > +                 };
> > > > > > +
> > > > >
> > > > > The patch itself is okay. But you might not be able to
> > > > > configure the parent of IMX8MP_CLK_MEDIA_ISP if dewarp is enabled=
 before.
> > > > > This is due to IMX8MP_CLK_MEDIA_ISP_ROOT being enabled in 'pgc_is=
pdwp'
> > > > > power domain. Reparenting is not possible anymore in this case.
> > > >
> > > > Good point.
> > > >
> > > > > Something like
> > > > > ---8<---
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > @@ -1837,11 +1837,13 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> > > > >                                                   <&clk IMX8MP_CL=
K_MEDIA_APB>,
> > > > >                                                   <&clk IMX8MP_CL=
K_MEDIA_DISP1_PIX>,
> > > > >                                                   <&clk IMX8MP_CL=
K_MEDIA_DISP2_PIX>,
> > > > > +                                                 <&clk IMX8MP_CL=
K_MEDIA_ISP>,
> > > > >                                                   <&clk IMX8MP_VI=
DEO_PLL1>;
> > > > >                                 assigned-clock-parents =3D <&clk =
IMX8MP_SYS_PLL2_1000M>,
> > > > >                                                          <&clk IM=
X8MP_SYS_PLL1_800M>,
> > > > >                                                          <&clk IM=
X8MP_VIDEO_PLL1_OUT>,
> > > > > -                                                        <&clk IM=
X8MP_VIDEO_PLL1_OUT>;
> > > > > +                                                        <&clk IM=
X8MP_VIDEO_PLL1_OUT>,
> > > > > +                                                        <&clk IM=
X8MP_SYS_PLL2_500M>;
> > > > >                                 assigned-clock-rates =3D <5000000=
00>, <200000000>,
> > > > >                                                        <0>, <0>, =
<1039500000>;
> > > >
> >
> > According to the i.MX8MP Data sheet, the nominal speed for
> > MEDIA_ISP_CLOCL_ROOT is 400MHZ with 500MHz being allowed in overdrive
> > mode.
> >
> > I think this clock rate should drop to  the nominal value of 400MHz
> > and those boards who support overdrive can increase it to 500MHz to
> > avoid stiability issues and/or running out of spec.  I created an
> > imx8mm and imx8mn-overdrive.dtsi file.  If there is interest, I can do
> > the same for the 8MP as well.
>
> I've experimented with this, and lowered the ISP clock to 400MHz by
> selecting IMX8MP_SYS_PLL1_400M as the parent. I couldn't capture images
> anymore :-S
>
> The camera sensor I'm using outputs a 74.25 Mpix/s pixel rate, which is
> way below the maximum in either normal or overdrive mode. The reference
> manual states, regarding the CSI-2 receivers,
>
> - When one ISP is used, MIPI CSI interface 1 supports:
>   - Pixel clock up to 400MHz at nominal voltage and 500MHz at overdrive
>     voltage
> - When two ISPs are used, both MIPI CSI interfaces supports:
>   - Pixel clock up to 266MHz at nominal and overdrive voltage
>
> The datasheets for both the CEC and IEC variants give slightly
> different information:
>
> - For single Camera, MIPI CSI 1 can support up to 400/500 MHz pixel
>   clock in the Nominal/Overdrive mode.
> - For single Camera, MIPI CSI 2 can support up to 277 MHz pixel clock.
> - For dual Camera, both MIPI CSI can support up to 266 MHz pixel clock.
>
> The also list the maximum clock frequencies as
>
> - MEDIA_ISP_CLK_ROOT: nominal 400 MHz, overdrive 500 MHz
> - MEDIA_CAM1_PIX_CLK_ROOT: nominal 400 MHz, overdrive 500 MHz
> - MEDIA_CAM2_PIX_CLK_ROOT: nominal 277 MHz, overdrive 277 MHz
>
> (On a side note, the revision history indicates the revision 2.1 of the
> datasheet changed MEDIA_CAM2_PIX_CLK_ROOT from 266/266 MHz to 277/277
> MHz, but the 277 MHz frequency has been listed since revision 0.)
>
> The MIPI CSI-2 RX (MIPI_CSI) receives data for the camera sensor at the
> CSI-2 link frequency rate. It reclocks the data stream using an internal
> FIFO, with an output pixel rate selected by the
> IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT (for the first CSI-2 receiver) or
> IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT (for the second CSI-2 receiver). Those
> clocks support the following parents, with the following frequencies on
> my system:
>
> - 24M_REF_CLK           24 MHz
> - SYSTEM_PLL1_CLK       800 MHz
> - SYSTEM_PLL1_DIV3      266 MHz
> - SYSTEM_PLL2_CLK       1000 MHz
> - SYSTEM_PLL2_DIV4      250 MHz
> - SYSTEM_PLL3_CLK       600 MHz
> - AUDIO_PLL2_CLK        361.2672 MHz
> - VIDEO_PLL_CLK         400 MHz
>
> This makes it easy to configure the CAM PIX ROOT clock to 266 MHz or 400
> MHz easily. Achieving 277 MHz or 500 MHz would I assume require
> modifying some of the PLL configurations. I'm not sure how the clock
> tree was designed to be configured for overdrive mode.
>
> imx8mp.dtsi configures the CAM1_PIX and CAM2_PIX clocks with
>
>         assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_CAM1_PIX>;
>         assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>;
>         assigned-clock-rates =3D <266000000>;
>
> and
>
>         assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_CAM1_PIX>;
>         assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>;
>         assigned-clock-rates =3D <266000000>;
>
> This is misleading as it selects the SYSTEM_PLL2_DIV4 parent, with a
> clock frequency of 250 MHz. I'll send a patch to set the assigned clock
> rate to 250 MHz to avoid misunderstandings, we can in parallel decide if
> the parent should be set to SYSTEM_PLL1_DIV3 instead.
>
> As the CSI-2 transmits, as far as I can tell, one pixel per clock cycle
> to the ISP for raw sensors, this is well within the hardware limits.
>
> The clock domains of the ISP are briefly described in the reference
> manual as follows:
>
> - Core Clock (clk) - Core clock is the main clock domain used by the ISP
>   modules and is the biggest clock domain in the ISP.
> - Sensor Clock (sclk) - The sensor clock domain is selected from the
>   sensor interface and is the data input clock.
> - AHB Clock (hclk) - The AHB Clock is the AHB Interface clock.
> - AXI Clock (m_hclk) - The AXI Clock is the AXI Interface clock.
>
> Additionally, the reference manual states that
>
>     The communication between the different domains in ISP occurs mostly
>     by way of asynchronous FIFOs. All clocks are asynchronous to each
>     other. There is no communication between AHB and AXI clock domains.
>
> The sensor clock (sclk) is the clock received by the ISP, which is the
> MIPI_CSI output clock (MEDIA_CAM[12]_PIX_CLK_ROOT). This clock isn't
> listed in the ISP DT node, as it isn't controlled directly by the ISP.
> It isn't clear where the transition to the core clock (clk) happens, I
> would assume quite early in the ISP pipeline. That clock is the
> MEDIA_ISP_CLOCK_ROOT, which that patch configures to 500 MHz. My
> assumption is that the core clock frequency needs to be at least as high
> as the sensor clock, but as configuring the ISP clock to 400 MHz breaks
> image capture, there's something I'm missing.
>
> As the 500 MHz ISP clock frequency is exactly twice the sensor clock
> frequency in my setup, I wondered if there could be a x2 relationship
> between those two clocks. I have tried to increase the CAM1_PIX clock to
> 266 MHz, and the ISP then operates correctly with a 500 MHz ISP clock.
> There must thus be something else.
>
> I'm not sure how to move forward. There's no further information I could
> find in the datasheet or reference manual that would hint how to operate
> with a 400 MHz ISP clock frequency. We may require help from someone at
> NXP. In the meantime, could we merge this patch with a 500 MHz ISP
> clock frequency (setup in the blk-ctrl@32ec0000 node instead of the isp
> nodes) ?

Thank you for your detailed analysis.  If the ISP doesn't work at
400MHz, it doesn't make sense to me to clock it at 400MHz.  Maybe NXP
can clarify this.  If 500MHz is the only operating point, I have no
objection, but I think having a comment in the device tree node where
the clock is set to 500MHz as what it is this way might be in order so
someone in the future doesn't go in a arbitrarily set it to 400MHz
based on a document without doing some testing.

adam
>
> > I haven't gone through all the clocks to determine if/what clocks are
> > being overdriven.
> >
> > > > With an assigned clock rate here too then ?
> > >
> > > You are right. This posted diff is what I was using for a while now t=
hough.
> > > Apparently the clock frequency was still correct.
> > >
> > > > >                                 #power-domain-cells =3D <1>;
> > > > > ---8<---
> > > > > is needed.
> > > >
> > > > Sascha, are you OK with this approach ?
> >
> > This patch appears to have gone stale.  Is there any way we can push
> > this forward?
> >
> > > > > >                   dewarp: dwe@32e30000 {
> > > > > >                           compatible =3D "nxp,imx8mp-dw100";
> > > > > >                           reg =3D <0x32e30000 0x10000>;
> > > > > >
> > > > > > base-commit: 4cece764965020c22cff7665b18a012006359095
>
> --
> Regards,
>
> Laurent Pinchart

