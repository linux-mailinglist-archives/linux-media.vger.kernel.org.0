Return-Path: <linux-media+bounces-35920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E32AE935A
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 02:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B96077A7B30
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 00:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBB715B0EC;
	Thu, 26 Jun 2025 00:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DW7rl2da"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410252B9B9;
	Thu, 26 Jun 2025 00:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750897279; cv=none; b=R3wKJgO5HGB4e4ARXtcPMnLOHcR+Dti37W3D+OSPFEFm+NsEqy22FXK4su2GvFu9yApb7LrxwWQ7fRtfVS/rDky2Q2yj1DImu744aEt8uhDvNy340LdpUk9lCUcoF5RhG2HPTjXY8YtOokRZLTTzydzisbQ9uzWFFxbP9JiMg2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750897279; c=relaxed/simple;
	bh=U1ICztOIDUCyPeAYVX53i1F5GRZlw7dH50fsuIjkLmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTLtgYuZMCZRCmD1x3rjkXyBWK2Ja0ecM9GmJYWlG6KQesYZKy0j+3oEqoM7sckHv8uTbtxFSPFYwWgtHNpuRlzMjWaqUqciFY03smxSkPBmyOA5FMFfpRAHJSHOy94+POOSGKhv39SxgEktwgwSgNlJ+MxpbgiC3TXcX+yRtLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DW7rl2da; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AAF606AE;
	Thu, 26 Jun 2025 02:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750897257;
	bh=U1ICztOIDUCyPeAYVX53i1F5GRZlw7dH50fsuIjkLmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DW7rl2daZtr9GyL34OOAorSXxnABGt1BELfCR3m6Rli6Ho56iZ1uyXW3JAfoo1Byu
	 nP+ubCMj8+rQqwV7pJ4EG9J3KKLA/n2geVzeyvGa1Dlw48L7+L1hLIdvqPt13+w0Bu
	 mosqxUW8pvYDXznMZFbMY2YNzwWC90l9AcaNysTA=
Date: Thu, 26 Jun 2025 03:20:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <20250626002053.GA12213@pendragon.ideasonboard.com>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>

Hi Dan,

Thank you for the patch.

On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> This was returning IS_ERR() where PTR_ERR() was intended.
> 
> Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")

I'll add a

Cc: stable@vger.kernel.org

to obey the media subsystem CI rules.

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 6501843ae72d..3a4645f59a44 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -966,7 +966,7 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
>  
>  		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
>  		if (IS_ERR(base))
> -			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
> +			return dev_err_probe(dev, PTR_ERR(base), "Missing CSR register\n");
>  
>  		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
>  		if (IS_ERR(state->phy_gpr))

-- 
Regards,

Laurent Pinchart

