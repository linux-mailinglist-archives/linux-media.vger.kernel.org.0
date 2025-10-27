Return-Path: <linux-media+bounces-45597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915FC0B891
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 01:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 677714E5BD7
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 00:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3284F30E0F3;
	Mon, 27 Oct 2025 00:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G6xa5BwV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CE1E5018;
	Mon, 27 Oct 2025 00:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761525777; cv=none; b=KIIy6lGeB53j1i1GQuYqjZNrW65bM1iTzmjrkMDRmLmRjAvDDOjIuHCnzWXoTSyhniOeloj4YseZsGbNrj+FgaDFi2NY9GLBMlSxOjZ8fceWi7PQ7XAQgcTsgt/HYC5bvtPxBEBvCW/8eL0ueZ0xsE6LsFfLumnv6Nf2D3kC3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761525777; c=relaxed/simple;
	bh=ql+9l2OIUe012ZMtNpJEMb1HFYAsPP+D4QtZAHzeetA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQxpTp0YQ809PfcWj1xtTVvBo6c+Tnby//TM3HqYm5DGS68yxSauu8agJ0dOd+3/uKiUBLW8rrBdukVway5speSYXLAF41/Mq7PEwkp9dPTROvkeR7uuV4gWcKEypqVTY3OprWVcsm5vDwTS4HVwwJzq4TKSdnYfEZTrlbIEwYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G6xa5BwV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 50D9F177B;
	Mon, 27 Oct 2025 01:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761525666;
	bh=ql+9l2OIUe012ZMtNpJEMb1HFYAsPP+D4QtZAHzeetA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6xa5BwVhhNpPPy76K2KrkE0H4OMjorlFTUcqeMi17nbo7fdC4ihgfpkRkCteqi/a
	 HH01nziHav5NKjZT+Ap0VGM0KoCh40OV9KUxZfoSNAexvnf+ceNeoi/kj4hLKBh/Vt
	 wq8SVBvvCprQS5fK8uFfj24V2wL/n3ME6tpFgJ5Q=
Date: Mon, 27 Oct 2025 02:42:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v7 3/5] media: imx8mq-mipi-csi2: Explicitly release reset
Message-ID: <20251027004239.GO13023@pendragon.ideasonboard.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-3-5ecb081ce79b@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251023-csi2_imx8ulp-v7-3-5ecb081ce79b@nxp.com>

On Thu, Oct 23, 2025 at 05:19:44PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Call reset_control_deassert() to explicitly release reset to make sure
> reset bits are cleared since platform like i.MX8ULP can't clear reset
> bits automatically.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index fd202601d401145da8be23df4451f6af660642c5..fd788a7f48e5feeff658e3d2347db6fefca5d0cf 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -337,18 +337,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
>  {
>  	int ret;
>  
> -	/*
> -	 * these are most likely self-clearing reset bits. to make it
> -	 * more clear, the reset-imx7 driver should implement the
> -	 * .reset() operation.
> -	 */
>  	ret = reset_control_assert(state->rst);
>  	if (ret < 0) {
>  		dev_err(state->dev, "Failed to assert resets: %d\n", ret);
>  		return ret;
>  	}
>  
> -	return 0;
> +	/* Explicitly release reset to make sure reset bits are cleared. */
> +	return reset_control_deassert(state->rst);
>  }
>  
>  static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
Regards,

Laurent Pinchart

