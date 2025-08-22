Return-Path: <linux-media+bounces-40781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FDEB31C40
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B88EB621A9
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC446313549;
	Fri, 22 Aug 2025 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a96PCwbn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6FD313532;
	Fri, 22 Aug 2025 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755873645; cv=none; b=aF1aELTcuzwSTzkQS8Fy1zXLmnRNdJjQKHSo/yeYquYMVaQytfm9Nn2PE6EF0NTCIPs/wLxNrI0gFldgmcKy30pMZM8BaIGd7ZKti9PUsMKQ71w+oKxJ5gIsIFQHJObIrB6HaCN3zd0IHOFZgaa2nmCZPZi7Lr5IxZm5kO72BXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755873645; c=relaxed/simple;
	bh=zj1rzy6SxpiP5UVa3GXGQh4rqI+RlENYyvwupRYye2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQTxV4NUkBIgAQTQ59/01gofxfRBYGZjk3wzamsWKB9P2gs7/zR2XyqlVHs/CkvyZrqtYI/LVWxAoQftExJ6TzZzRO9GVf4HTg9m1inCI0hZDL8PC0JSiPscDKrHY4CsczecXWyxZBq9l80Rnssg6SzxidB6dvA35rre+hTPgfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a96PCwbn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [205.220.129.245])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9890A446;
	Fri, 22 Aug 2025 16:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755873579;
	bh=zj1rzy6SxpiP5UVa3GXGQh4rqI+RlENYyvwupRYye2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a96PCwbnYqWy9NzgoA0H+Hu4BubTkJXJ9AEyZpFPhWugKANdrz9tW2LJoNkQZpo9S
	 EdJ/TSUDS5dk+nV22AwEfaEtaY5DYyNCM53HtsoB+x77heo5/KQGJ/b4qav2yw/vDi
	 YnenV043is+sSKtBZSEXYgdcFQ/YD9Rmw4PtpLcM=
Date: Fri, 22 Aug 2025 17:40:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 06/13] media: imx-mipi-csis: Use GENMASK for all
 register field masks
Message-ID: <20250822144000.GA22572@pendragon.ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-7-laurent.pinchart@ideasonboard.com>
 <aKh7DmnEB2KChVol@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKh7DmnEB2KChVol@lizhi-Precision-Tower-5810>

Hi Frank,

On Fri, Aug 22, 2025 at 10:13:34AM -0400, Frank Li wrote:
> On Fri, Aug 22, 2025 at 03:27:26AM +0300, Laurent Pinchart wrote:
> > Multiple register field mask macros use GENMASK, while other define the
> > mask value manually. Standardize on GENMASK everywhere, as well as on
> > the _MASK suffix to name the macros. This improves consistency and helps
> > with readability.
> >
> > No functional change is intended.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index ce889c436cb1..50f6f4468f7b 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -57,7 +57,7 @@
> 
> ...
> >
> >  /* ISP Image Resolution register */
> >  #define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
> > @@ -655,7 +655,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> >  	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> >  	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
> > -	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
> > +	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;
> 
> nit: if need create new verison, I suggest add "change MSK to MASK"
> informaiton at commit message.

The information is there already, the commit message already states
"Standardize [...] on the _MASK suffix to name the macros".

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> >  	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
> >
> >  	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_L,

-- 
Regards,

Laurent Pinchart

