Return-Path: <linux-media+bounces-37424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB39B00D34
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 22:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D4B81894A57
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 20:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE9B28C016;
	Thu, 10 Jul 2025 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L81CRFpj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB5123BD13;
	Thu, 10 Jul 2025 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752179694; cv=none; b=hETpjzslk1CSaD94NQAmVvvJOBFxdbhZntybArAYEstjqgDanLbVvf4h0IlUStVU7jl6b6Qt5T4HbBLNY52p5a9m2wv8B1fNpKspz96gXVKTPiGFn50478+jp8QGe70bonz7S0lIiqtAQBBImqhET8In21idPwYipAV9RLUxHzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752179694; c=relaxed/simple;
	bh=gwm/BETqS9ZCGKtb3EIYk1BW28Lo76No90DkH2szew8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwnZsa12o0yT9x03g/64loqtoJjXOT8Al3OVjh1K4j6TaO/URyLeLQp48dMGbkAMr+BENYcco7Dtjbp4QVTghOmn6ytdA9ap32kZqCcG2Kde0TzFhtFSA36tuvK+37opUEFceThYWHRtvHd10EDCuPAOXr/iIsgQUO7iBinCfCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L81CRFpj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4F13D1A9A;
	Thu, 10 Jul 2025 22:34:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752179662;
	bh=gwm/BETqS9ZCGKtb3EIYk1BW28Lo76No90DkH2szew8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L81CRFpj5oL8/FjSvjjDbUsSOOXdnHVu8kack2zW22u7nofbm1lEVF5x0eiTUFDjt
	 WLg3cH2TO2Qa4TdTTkClKVP7yRjU6EDKQhTngYG+aG+Thfc/ajYbTVncCSbxiFsk0v
	 3SMEKP2/pfKNiWYlE89bTpRajJdUBDbe2BL9fW/s=
Date: Thu, 10 Jul 2025 23:34:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/72] ARM: dts: nxp: imx6qdl-wandboard: Replace
 clock-frequency in camera sensor node
Message-ID: <20250710203421.GC22436@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-7-laurent.pinchart@ideasonboard.com>
 <aHAgHygUe6rWB/TA@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aHAgHygUe6rWB/TA@lizhi-Precision-Tower-5810>

Hi Frank,

On Thu, Jul 10, 2025 at 04:18:39PM -0400, Frank Li wrote:
> On Thu, Jul 10, 2025 at 08:47:02PM +0300, Laurent Pinchart wrote:
> > The clock-frequency for camera sensors has been deprecated in favour of
> > the assigned-clocks and assigned-clock-rates properties. Replace it in
> > the device tree.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> > index 26489eccd5fb..e5ac78ffb31c 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> > @@ -136,8 +136,11 @@ camera@3c {
> >  		pinctrl-names = "default";
> >  		pinctrl-0 = <&pinctrl_ov5645>;
> >  		reg = <0x3c>;
> > +
> 
> unnecessary empty line here

There's often a blank line after the reg property. I don't mind dropping
it here if that's preferred. Same for the other patch you reviewed.

> >  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> > -		clock-frequency = <24000000>;
> > +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> > +		assigned-clock-rates = <24000000>;
> > +
> >  		vdddo-supply = <&reg_1p8v>;
> >  		vdda-supply = <&reg_2p8v>;
> >  		vddd-supply = <&reg_1p5v>;

-- 
Regards,

Laurent Pinchart

