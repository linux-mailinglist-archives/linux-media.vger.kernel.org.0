Return-Path: <linux-media+bounces-31637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60017AA77D0
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 18:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D147F4E4F5E
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425D7266EF9;
	Fri,  2 May 2025 16:54:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB9A1A3156
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 16:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204864; cv=none; b=ZApH4w/Scf7Leb3Rb64mjMOXK4CyuJHiFjzoBY6CWveLQHHzdCFdLwY9v7SAIxouup/TDZ2PsiJCNQeh599uPnLCrN7157Y1YbKvFrOI2Fq2n6FJDlNEKqDy3aKgSgpussVYYstjWMrW6cPQpkholn4Pbzrm3xd3+W7ZK59P8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204864; c=relaxed/simple;
	bh=3M12KVAiXepaMce8WCfsepjU54GrGCHwMIvFLVFLQ2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYBoKYoArai+IynxcVNUlHpzZF9WUqSy+74jfaQIiER4KLF80Y73pZO3q0Fugxk4r99Vv98SDAfmSqmAs0mwMekNiZsvka11x28Rz5uX4OZ8qktrBWQa55mZo6Q+gbDAOnSgWNONs5fjat6XXIAOKh4LibYm91YKX93tAMLrkOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAteA-00065d-2h; Fri, 02 May 2025 18:53:58 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAte9-000mLr-0c;
	Fri, 02 May 2025 18:53:57 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAte9-00GahR-07;
	Fri, 02 May 2025 18:53:57 +0200
Date: Fri, 2 May 2025 18:53:57 +0200
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
Subject: Re: [RFC PATCH 05/11] arm64: dts: imx8mp: drop gpcv2 vpu
 power-domains and clocks
Message-ID: <20250502165357.ncuve25xwvydhxz3@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-6-m.felsch@pengutronix.de>
 <CAHCN7xJ5p+dwJD7i7caqwhmrz8+gZDVeqfdWA_=He-H+aTJgRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xJ5p+dwJD7i7caqwhmrz8+gZDVeqfdWA_=He-H+aTJgRg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On 25-05-02, Adam Ford wrote:
> On Fri, May 2, 2025 at 10:10 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
> > VPUMIX power-domain nor their module clocks since the power and reset
> > handling is done by the VPUMIX blkctrl driver.
> >
> It was my understanding that having this dependency ensures the order
> of the bring-up, but maybe I am wrong.  Do you know if the 8MP

If that is true, the 8MM should be broken.

> suspend-resume works properly?

No I didn't test suspend/resume.

> Should this get a fixes tag?

It's just a cleanup, therefore I didn't add the fixes-tag.

Regards,
  Marco


> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index e0d3b8cba221..cf9b6c487bd5 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -879,24 +879,17 @@ pgc_mediamix: power-domain@10 {
> >
> >                                         pgc_vpu_g1: power-domain@11 {
> >                                                 #power-domain-cells = <0>;
> > -                                               power-domains = <&pgc_vpumix>;
> >                                                 reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
> > -                                               clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> >                                         };
> >
> >                                         pgc_vpu_g2: power-domain@12 {
> >                                                 #power-domain-cells = <0>;
> > -                                               power-domains = <&pgc_vpumix>;
> >                                                 reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
> > -                                               clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> > -
> >                                         };
> >
> >                                         pgc_vpu_vc8000e: power-domain@13 {
> >                                                 #power-domain-cells = <0>;
> > -                                               power-domains = <&pgc_vpumix>;
> >                                                 reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
> > -                                               clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> >                                         };
> >
> >                                         pgc_hdmimix: power-domain@14 {
> > --
> > 2.39.5
> >
> >
> 

