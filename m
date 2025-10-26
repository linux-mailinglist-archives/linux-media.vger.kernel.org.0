Return-Path: <linux-media+bounces-45593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C624CC0B801
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 00:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F1353BD349
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 23:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7042730217B;
	Sun, 26 Oct 2025 23:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qPigjbWl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331B735965;
	Sun, 26 Oct 2025 23:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761522624; cv=none; b=bWNgQ72OrjxfIoyjl2FLONKv6TZGfZm2nD1s8Aol+6X9MP7TMLse23k1icNIsHhXFTmP8XS5mGBcP6GVVJ5RRjfP8/tutQA/dJDk2yCqCrW8GeMYNjb7awcCOhZULYUz8CQhwOZkkJpSwIeo4gmCuLOeg42IWhuXyIjczOpjQnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761522624; c=relaxed/simple;
	bh=8Ka4KDuKSKR42vpWKdt7GFbxhPMHhPwGK1RFzHHs4nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmwCRkjdoFp33VJNF/SCJzqOMmkHyIw4sLUHoXAB5LrjqSyHZKZy9lDEyOCK/n4xEep8Cpv5YlX5ujMcYsWK+pWwu7XUzSPbdAwiJdmpb4pKAViOlho12XljrRGUngwidH16hwyqjum/7rs0n7YMECLxZ48Va3ioGTJMY9c+rHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qPigjbWl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 46579E77;
	Mon, 27 Oct 2025 00:48:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761522513;
	bh=8Ka4KDuKSKR42vpWKdt7GFbxhPMHhPwGK1RFzHHs4nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPigjbWltVZE8/Mr7XP81ImDEVEkv8Z+Pgr0VaS2RBysqHPXxaPl/ZpRVMKHbajTv
	 CkHbISjneiKi9JInf+q9Vd8m70MJDYog2uvC1AfNO9QciMrPppNz6STNKoWUkTxy3M
	 B5irh0C5gKbUrWHWgKHJvdynxS6sJVahxgFUVEB4=
Date: Mon, 27 Oct 2025 01:50:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Add RGB format support
Message-ID: <20251026235006.GK13023@pendragon.ideasonboard.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
 <20250820-csi2_imx8mq-v5-3-e04a6fc593bd@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820-csi2_imx8mq-v5-3-e04a6fc593bd@nxp.com>

On Wed, Aug 20, 2025 at 07:04:58PM +0800, Guoniu Zhou wrote:
> Add format RGB565 and RGB24 support.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index ad7adc677e389e0f35b0cf63195279e197907f8c..529928b94a193e02177f8773a0e68375b59b0a08 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -306,6 +306,13 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	}, {
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>  	},
> +	/* RGB formats */
> +	{
> +		.code = MEDIA_BUS_FMT_RGB565_1X16,

There's ongoing discussions regarding what format is appropriate for
CSI-2 RGB565, see
https://lore.kernel.org/all/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org/.
Let's see what the outcome will be.

> +	}, {
> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.output = MEDIA_BUS_FMT_RGB888_1X24,

This looks right.

> +	},
>  };
>  
>  static const struct csi2_pix_format *find_csi2_format(u32 code)

-- 
Regards,

Laurent Pinchart

