Return-Path: <linux-media+bounces-40642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5A9B30068
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 18:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40245A24F91
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE7A2E336B;
	Thu, 21 Aug 2025 16:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UkVD6LzP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539D42DFA2A;
	Thu, 21 Aug 2025 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755794560; cv=none; b=YjyoO+pfw8ByDr2fHKZQSKXKTNjKGLmpg2QP9gwNdaAk2cGGSYINpk+rQtEGCKIXW5PYeBlyQ/ClHmQxMP4Fm89XHdcRKDWDv3huQcZo1vBisM5/dxWWJ/2Gx5AwpLuwgn9LRzIDF6Gl0z5ZMLpc5sUJMOCF/GFdWJhCZaBYIZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755794560; c=relaxed/simple;
	bh=mz/fzJfmTWZ3LEOoonwuE3DtZoZyUjRc0Upb01ff0/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gz/2oH7I5ztfy/z7Y1HRhwXFAOVvEJchXzCi4TwjBNOXUOuxj40qFTxgc8yI5067YciWgqCEFvncqP0LkFSRjFpwqNq67298A5DjmwoSh++bHCip+/K/z07/kSR6APHG2aZvzNWcrr11qBlI6O+YfNldDvUDksFjUdi6VBe+pqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UkVD6LzP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 90996250;
	Thu, 21 Aug 2025 18:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755794495;
	bh=mz/fzJfmTWZ3LEOoonwuE3DtZoZyUjRc0Upb01ff0/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkVD6LzPl7FviU9HWcFXl+NqtHgD8s/cXbhJhTU0pUpl9UP78ZfzW6Z0AA/9CEj9S
	 lrPPftwEJ2KHqe7VOKaJjxgmATDyX92cRxpcokCc6ic9cxPZ8zA4sUckubRjexP6LW
	 LXI5VgowhlmEXMyFB2eGzm84WdvPUJ+LQ3tcOR54=
Date: Thu, 21 Aug 2025 19:42:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 12/12] arm64: dts: imx8mp: Specify the number of
 channels for CSI-2 receivers
Message-ID: <20250821164211.GC29629@pendragon.ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-13-laurent.pinchart@ideasonboard.com>
 <aKdCp9INuUeQVFbV@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKdCp9INuUeQVFbV@lizhi-Precision-Tower-5810>

On Thu, Aug 21, 2025 at 12:00:39PM -0400, Frank Li wrote:
> On Thu, Aug 21, 2025 at 03:09:44AM +0300, Laurent Pinchart wrote:
> > The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
> > in the device tree, to enable support for more than one channel in
> > drivers.
> 
> dt descript hardware, not driver

Yes, but the whole point is to make use of the information in drivers
:-)

I'll just drop the "in drivers" part.

> Specify this to reflect actual hardware feature.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index bb24dba7338e..1e52840078df 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1764,6 +1764,7 @@ mipi_csi_0: csi@32e40000 {
> >  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
> >  							 <&clk IMX8MP_CLK_24M>;
> >  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> > +				fsl,num-channels = <3>;
> >  				status = "disabled";
> >
> >  				ports {
> > @@ -1799,6 +1800,7 @@ mipi_csi_1: csi@32e50000 {
> >  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
> >  							 <&clk IMX8MP_CLK_24M>;
> >  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> > +				fsl,num-channels = <3>;
> >  				status = "disabled";
> >
> >  				ports {

-- 
Regards,

Laurent Pinchart

