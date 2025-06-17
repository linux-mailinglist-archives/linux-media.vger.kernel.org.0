Return-Path: <linux-media+bounces-35091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8754AADCF91
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC5083BF01A
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B202ECD2A;
	Tue, 17 Jun 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7efYNGP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8572E3AF7;
	Tue, 17 Jun 2025 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169474; cv=none; b=kc2ycmisoqJZ6d5IfubVblIuJFCEB0OaRJFD4KpeoPnXYsxCQ6yW67uIK2KFIZIUDmYlXo8WNxp4gLXjOHjv3HDTbFvaSDDlWjRT95JSYjpzaxpnClUOhSpk7stNztUdQZadegzjhtlPqEpZVrAyyTCckWLb3gomMgvj3HUyv3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169474; c=relaxed/simple;
	bh=9WlmfZQ67G1lNxxsfGnJ+OQDIWmTzBZZJbPLdnS48As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQdCTLZlkDhonV3DCRmjb0OcuZdFKRe8gOSS2xoKCI7x1matzW2SllNtXF3OVvH04dlf4NIeq6NiG0E/gUDPKbMe0vzRZiPuaJMyFtzKphvRgJzDpUsE9ja7jUJfOSfpzLYjuj8gEQ020zi2M2LUWbk1dq1v3btQ+8bnHhYnMr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7efYNGP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F27BC4CEE3;
	Tue, 17 Jun 2025 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750169473;
	bh=9WlmfZQ67G1lNxxsfGnJ+OQDIWmTzBZZJbPLdnS48As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7efYNGPtpmIAYzfZU+BTn6ATN9Xa+7W4sseA7c+4857g9AGPqvGZaLTI0RRoQO2G
	 geTOS7cctwmIl4NJtKDEVpY7EvBUaXzrKayUPJcaUm6XbjtPjljrW/jkTw4H9ZnETc
	 JS7RCB9IL/tNH36/CQBpNf1pA96EAa99EzzQKqHoF0/N0R+hjBAxKMEAHFHRZC49id
	 FdSoBwGl66PXTUmzOC3mFHHgHwAU6ehxMo0lh4bn85bRTiojGlOySqOk5Q7KTF+lhV
	 ZnsWuR1NNytfNNhwlHjYbRfcmgqqnUE9ci1aS5WpUyCippczEzM5MHkeAJkSKj4+9A
	 Op/fSSo/68ogw==
Date: Tue, 17 Jun 2025 09:11:12 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 04/13] media: nxp: imx8-isi: Use
 devm_clk_bulk_get_all() to fetch clocks
Message-ID: <20250617141112.GA2051217-robh@kernel.org>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-4-ef695f1b47c4@nxp.com>
 <20250421211438.GN17813@pendragon.ideasonboard.com>
 <aBQZjFsExJh2uRfK@lizhi-Precision-Tower-5810>
 <20250502155747.GB20093@pendragon.ideasonboard.com>
 <aBylKcZyFInlKQAR@lizhi-Precision-Tower-5810>
 <20250611141449.GA24607@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611141449.GA24607@pendragon.ideasonboard.com>

On Wed, Jun 11, 2025 at 05:14:49PM +0300, Laurent Pinchart wrote:
> Hi Rob,
> 
> On Thu, May 08, 2025 at 08:35:53AM -0400, Frank Li wrote:
> > On Fri, May 02, 2025 at 06:57:47PM +0300, Laurent Pinchart wrote:
> > > On Thu, May 01, 2025 at 09:02:04PM -0400, Frank Li wrote:
> > > > On Tue, Apr 22, 2025 at 12:14:38AM +0300, Laurent Pinchart wrote:
> > > > > On Tue, Apr 08, 2025 at 05:53:02PM -0400, Frank Li wrote:
> > > > > > Use devm_clk_bulk_get_all() helper to simplify clock handle code.
> > > > > >
> > > > > > No functional changes intended.
> > > > > >
> > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > ---
> > > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 46 +++-------------------
> > > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 +-
> > > > > >  2 files changed, 6 insertions(+), 43 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > > index ecfc95882f903..015350c6f2784 100644
> > > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > > @@ -275,11 +275,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
> > > > > >  	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
> > > > > >  };
> > > > > >
> > > > > > -static const struct clk_bulk_data mxc_imx8mn_clks[] = {
> > > > > > -	{ .id = "axi" },
> > > > > > -	{ .id = "apb" },
> > > > > > -};
> > > > > > -
> > > > > >  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> > > > > >  	.model			= MXC_ISI_IMX8MN,
> > > > > >  	.num_ports		= 1,
> > > > > > @@ -287,8 +282,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> > > > > >  	.reg_offset		= 0,
> > > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v1,
> > > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > > >  	.buf_active_reverse	= false,
> > > > > >  	.gasket_ops		= &mxc_imx8_gasket_ops,
> > > > > >  	.has_36bit_dma		= false,
> > > > > > @@ -301,8 +294,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
> > > > > >  	.reg_offset		= 0x2000,
> > > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > > >  	.buf_active_reverse	= true,
> > > > > >  	.gasket_ops		= &mxc_imx8_gasket_ops,
> > > > > >  	.has_36bit_dma		= true,
> > > > > > @@ -315,8 +306,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> > > > > >  	.reg_offset		= 0x0,
> > > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > > >  	.buf_active_reverse	= true,
> > > > > >  	.has_36bit_dma		= false,
> > > > > >  };
> > > > > > @@ -328,8 +317,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
> > > > > >  	.reg_offset		= 0,
> > > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > > >  	.buf_active_reverse	= true,
> > > > > >  	.gasket_ops		= &mxc_imx93_gasket_ops,
> > > > > >  	.has_36bit_dma		= false,
> > > > > > @@ -386,7 +373,7 @@ static int mxc_isi_runtime_suspend(struct device *dev)
> > > > > >  {
> > > > > >  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
> > > > > >
> > > > > > -	clk_bulk_disable_unprepare(isi->pdata->num_clks, isi->clks);
> > > > > > +	clk_bulk_disable_unprepare(isi->num_clks, isi->clks);
> > > > > >
> > > > > >  	return 0;
> > > > > >  }
> > > > > > @@ -396,7 +383,7 @@ static int mxc_isi_runtime_resume(struct device *dev)
> > > > > >  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
> > > > > >  	int ret;
> > > > > >
> > > > > > -	ret = clk_bulk_prepare_enable(isi->pdata->num_clks, isi->clks);
> > > > > > +	ret = clk_bulk_prepare_enable(isi->num_clks, isi->clks);
> > > > > >  	if (ret) {
> > > > > >  		dev_err(dev, "Failed to enable clocks (%d)\n", ret);
> > > > > >  		return ret;
> > > > > > @@ -414,27 +401,6 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
> > > > > >   * Probe, remove & driver
> > > > > >   */
> > > > > >
> > > > > > -static int mxc_isi_clk_get(struct mxc_isi_dev *isi)
> > > > > > -{
> > > > > > -	unsigned int size = isi->pdata->num_clks
> > > > > > -			  * sizeof(*isi->clks);
> > > > > > -	int ret;
> > > > > > -
> > > > > > -	isi->clks = devm_kmemdup(isi->dev, isi->pdata->clks, size, GFP_KERNEL);
> > > > > > -	if (!isi->clks)
> > > > > > -		return -ENOMEM;
> > > > > > -
> > > > > > -	ret = devm_clk_bulk_get(isi->dev, isi->pdata->num_clks,
> > > > > > -				isi->clks);
> > > > > > -	if (ret < 0) {
> > > > > > -		dev_err(isi->dev, "Failed to acquire clocks: %d\n",
> > > > > > -			ret);
> > > > > > -		return ret;
> > > > > > -	}
> > > > > > -
> > > > > > -	return 0;
> > > > > > -}
> > > > > > -
> > > > > >  static int mxc_isi_probe(struct platform_device *pdev)
> > > > > >  {
> > > > > >  	struct device *dev = &pdev->dev;
> > > > > > @@ -457,11 +423,9 @@ static int mxc_isi_probe(struct platform_device *pdev)
> > > > > >  	if (!isi->pipes)
> > > > > >  		return -ENOMEM;
> > > > > >
> > > > > > -	ret = mxc_isi_clk_get(isi);
> > > > > > -	if (ret < 0) {
> > > > > > -		dev_err(dev, "Failed to get clocks\n");
> > > > > > -		return ret;
> > > > > > -	}
> > > > > > +	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
> > > > >
> > > > > This prevents validating that the DT contains the expected clocks, which
> > > > > could cause hard to debug issues. Isn't it a problem ?
> > > >
> > > > It is checked by dt-binding. Now no warning by DTB_CHECK under arm64 freecale.
> > > > CHECK_DTB should be enough to find expected clocks.
> > >
> > > Yes, the DTB check will catch issues at build time, but the driver will
> > > not enforce that. I'm not sure if there's a clear policy here, and if
> > > ensuring at runtime in drivers that the expected clocks are present is
> > > considered as a good practice by the DT maintainers. Rob, Krzysztof,
> > > Conor, do you have an opinion ?
> > 
> > Rob:
> > 	can you comment this?
> 
> Rob, any comment on this ?

My preference is to not do validation of the DT in the kernel. Unless 
you need greater control of the clocks, I would use 
devm_clk_bulk_get_all(). 

Rob

