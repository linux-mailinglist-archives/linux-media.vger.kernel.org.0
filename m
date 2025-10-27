Return-Path: <linux-media+bounces-45598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AFAC0B8BB
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 01:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67AB63B9587
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 00:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B9C258CF0;
	Mon, 27 Oct 2025 00:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WbMhkCGB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA3E2A8C1;
	Mon, 27 Oct 2025 00:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761525863; cv=none; b=qCfv54V6ix1Z6jtrBsEh2kkfWR5b5PCtg7o0pkP6q/s09lVZ8de79IFdonNeslhyXZdtOD6+IprcaA8SZnNdCA4MJJXU37+iL+/zsOHeyZCspALULgNEuFRJUUxFQFHt+S+z2yDiEFGEaOH1eNR7njIReJZnwisqHBYr/i8fwOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761525863; c=relaxed/simple;
	bh=oGBJ70fWGuRrs7V1TNX5HTXmxCDYsiN9FlE25l3M+Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxrevwApeQFwIfcHBxqnQaak6ScboFGFMQzmLz76pVwDeF1d2gDgAV/iQDVd3AVknBmsR+7huyJQCQUPNrmkNHUneEclBaiK5iLaMzXrwM1Hw/QqiFSgTSb52AsxgNPTXmNVrcVr2YXNM/O2VBuH6aHj7WiYvItCck5FkmjPscI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WbMhkCGB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9014D16AE;
	Mon, 27 Oct 2025 01:42:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761525752;
	bh=oGBJ70fWGuRrs7V1TNX5HTXmxCDYsiN9FlE25l3M+Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WbMhkCGBzud5YNDDtv2InQzvhXDW+1cRob5q2lKZbeYAgBbenRdiU09GHOzZNeyh9
	 yjVcx/S4Sbt/1cq2UWOh4BGcQoMD6yeraACi8w2RX2YzYdJrmRI0a9GenptR6hN9RW
	 QTS2l7Mqa/no3gJcRHSJM2Phb/9zwWnpTfvgx4Ds=
Date: Mon, 27 Oct 2025 02:44:06 +0200
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
Subject: Re: [PATCH v7 4/5] media: imx8mq-mipi-csi2: Add support for i.MX8ULP
Message-ID: <20251027004406.GP13023@pendragon.ideasonboard.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-4-5ecb081ce79b@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251023-csi2_imx8ulp-v7-4-5ecb081ce79b@nxp.com>

On Thu, Oct 23, 2025 at 05:19:45PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The CSI-2 receiver in i.MX8ULP is almost same as i.MX8QXP/QM except
> clocks and resets, so add compatible string for i.MX8ULP to handle
> the difference and reuse platform data of i.MX8QXP/QM.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index fd788a7f48e5feeff658e3d2347db6fefca5d0cf..d8fadb0f1b6b670110ee98a74cffd56a6c96592b 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -1069,6 +1069,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
>  static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
>  	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
> +	{ .compatible = "fsl,imx8ulp-mipi-csi2", .data = &imx8qxp_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
Regards,

Laurent Pinchart

