Return-Path: <linux-media+bounces-45585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1D7C0B542
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 23:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 099663B741F
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 22:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A30D283FE5;
	Sun, 26 Oct 2025 22:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N3fUNtwK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0851E1D90DF;
	Sun, 26 Oct 2025 22:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516729; cv=none; b=BkUcL7GnFeavVvk1PlUrycagE/8QzXcV+/qZpIIY/NnOeD0DUmtXF/A5mzPXMg+wd8iH8EGRaF3S9sV5+CQ9xqcjZV+vRASQdbrXB16HN9XqkOAQcr2kAlCpowRllexREHDR3Bxp/VvXJkeuHXa3GZN4ekqRFHgpEg+fmxfuRJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516729; c=relaxed/simple;
	bh=2FItP0Jr2f51sPq6GWmj36Vulpiy8YWMunvCKYHvpME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuW9d/Hqt9LLo4NC0LrjcXZpFwHnC9TN893nN7KVp6OM+HhOS0k8WSHq4FJ+g47wvKhHA8+gCL2Gu6AE+BLsFrt/02GopgbZU87mFnpKicNYDONSCqW3UaTfZE2vIxRTNqFeTwP6Oj1swCFKsBE8K3lWtqf58QFY5g9mLw7N3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N3fUNtwK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DD2EA1F0E;
	Sun, 26 Oct 2025 23:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761516618;
	bh=2FItP0Jr2f51sPq6GWmj36Vulpiy8YWMunvCKYHvpME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3fUNtwKJBmAVHGQzv0Xh1/8neLjL3T4tJVOxQHLUNcOEiS5jmGXuIdzTm4lq8aTV
	 mL5SyqSe9TKkk67L5lzXHsmls9HbvezFzy7lF1VhlzJBrRso+NDiXmXSzYmsBSN1Rr
	 08yIf6p1xYtyQ/nwbMmAz1lhZwQuMXaMAa2abYmE=
Date: Mon, 27 Oct 2025 00:11:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/3] media: nxp: imx8-isi: Keep the default value for
 BLANK_PXL field
Message-ID: <20251026221149.GH13023@pendragon.ideasonboard.com>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-2-3ad1af7c3d61@nxp.com>
 <aPuCHltyz9Ed7wcF@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aPuCHltyz9Ed7wcF@lizhi-Precision-Tower-5810>

On Fri, Oct 24, 2025 at 09:41:50AM -0400, Frank Li wrote:
> On Fri, Oct 24, 2025 at 05:46:53PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> >
> > The field provides the value of the blank pixel to be inserted in the
> 
> The field BLANK_PXL provides
> 
> > image in case an overflow error occurs in the output buffers of the
> > channel. Its default value is 0xff, so no need to set again.
> >
> > Besides, the field only exist in i.MX8QM/XP ISI version. Other versions
> > like mscale series, remove the field since it won't send data to AXI bus

What's the mscale series ? Is that i.MX 8M ?

> > when overflow error occurs and set the field as reserved. i.MX9 series
> 
> mark BLANK_PXL as reserved. i.MX9 series use it for other purposes.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > use the field as other purposes.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > index 9225a7ac1c3ee7e42e64983982eb4b6c27e356fe..0187d4ab97e8e28fca9013f6864a094e08f2c570 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > @@ -309,8 +309,8 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
> >
> >  	val = mxc_isi_read(pipe, CHNL_CTRL);
> >  	val &= ~(CHNL_CTRL_CHNL_BYPASS | CHNL_CTRL_CHAIN_BUF_MASK |
> > -		 CHNL_CTRL_BLANK_PXL_MASK | CHNL_CTRL_SRC_TYPE_MASK |
> > -		 CHNL_CTRL_MIPI_VC_ID_MASK | CHNL_CTRL_SRC_INPUT_MASK);
> > +		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
> > +		 CHNL_CTRL_SRC_INPUT_MASK);
> >
> >  	/*
> >  	 * If no scaling or color space conversion is needed, bypass the
> > @@ -323,8 +323,6 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
> >  	if (pipe->chained)
> >  		val |= CHNL_CTRL_CHAIN_BUF(CHNL_CTRL_CHAIN_BUF_2_CHAIN);
> >
> > -	val |= CHNL_CTRL_BLANK_PXL(0xff);
> > -
> >  	/* Input source (including VC configuration for CSI-2) */
> >  	if (input == MXC_ISI_INPUT_MEM) {
> >  		/*

-- 
Regards,

Laurent Pinchart

