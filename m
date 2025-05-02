Return-Path: <linux-media+bounces-31638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B3AA77DF
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 18:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A31B716E186
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04B2266B6B;
	Fri,  2 May 2025 16:55:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0918E3F
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 16:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204958; cv=none; b=XYexMiqojVU09Fy2wxTRoC7yW34HMNWosSv9eEc7p9sVxI6B03TVbce41kh2ci82oz3yBaSPc92LOQGLyEM9SJchgUN8h83JXWt8N+9A4M2EIy5E34rGsgJgKcvd40W8YL1F4sI3OzJsDIMT6r7UC2GiSjxkqS3xpaWAHb9/Ars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204958; c=relaxed/simple;
	bh=vNqGUwYfp5kGOVOtzGXafZB7iPsvFgYgPqP2eNAkolw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maCJef5FOGLhyEPihbsHm8Y26AI7f6V0esL/xZDvdtaCTUIsh1EICPZucdmGEBFDCCvAapNG3sqCaxjIz9b+H5c8d6M4nOZuHVEVokDtOpQ5hfuAabanW+ZSsAqD2OuBurzjZHxU14JshV/p4eEPvDPYGpGD9obtW7UX7a+U7tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAtfk-0006vQ-DD; Fri, 02 May 2025 18:55:36 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAtfj-000mM7-2r;
	Fri, 02 May 2025 18:55:35 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAtfj-00Gai4-2R;
	Fri, 02 May 2025 18:55:35 +0200
Date: Fri, 2 May 2025 18:55:35 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paulk@sys-base.io, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, sebastian.fricke@collabora.com,
	ming.qian@nxp.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
Message-ID: <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-8-m.felsch@pengutronix.de>
 <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On 25-05-02, Adam Ford wrote:
> On Fri, May 2, 2025 at 10:10 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > The VPU_PLL clock must be set before the VPU_BUS clock which is derived
> > from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index 97b09b647ec7..7f4bdefb3480 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> >                         clock-names = "g1", "g2", "vc8000e";
> > -                       assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
> > -                       assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> > +                       assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> > +                       assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> >                         assigned-clock-rates = <600000000>, <600000000>;
> 
> I think there was a move to make the default be overdrive [1]  and [2]
> and use a 'nominal' device tree for those who are not in overdrive
> mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
> values here should be 800MHz and if we should add the nominal values
> of 600MHz to the imx8m-nominal.dtsi file.

You're right, Ahamd and Lucas did change this. I will adapt it later on.

Regards,
  Marco

