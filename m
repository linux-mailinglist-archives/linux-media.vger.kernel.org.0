Return-Path: <linux-media+bounces-40429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A02B2DEB1
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AF621BA6E7E
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5376275111;
	Wed, 20 Aug 2025 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vK37rISs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA6E2749DC;
	Wed, 20 Aug 2025 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755698540; cv=none; b=DUTreFtxNUiep+haXEUSKshafWMbkXF2MWupLjKp25Vos7lYDg9OHkdCzwUGk5qcKFMoXgl3e/3eTPmOaEy/dp1v5rUrf5CFSvFV/qpUMdn6fw7FUG8YwyRdNCpNZ0p7qUp5mFtKvsjq8LMZzvGyTbQxUqsg9JGqMzmew/+rt6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755698540; c=relaxed/simple;
	bh=w8ezJzqhy8n68dXoxVBN52WAlnF5mf3hrGaTfYPHzog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiyY9wUP7SpSVA6tQs3IXOXePzZYWr1vO7PB/ieN/ez/lXHNva//D2FoInB/fwMNCBzK3F6AWzlqoES3ChPUuZ7B/ZAgFKTeohNP/ASWs+IFPlJ2xjDIQWxGXhdbFXab4xJsvImE1GJE4GYGrpdpFt+8j82HNtIR4IaMxe0Cygo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vK37rISs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A7AEF1AE2;
	Wed, 20 Aug 2025 16:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755698478;
	bh=w8ezJzqhy8n68dXoxVBN52WAlnF5mf3hrGaTfYPHzog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vK37rISs1SJDLKpEXy9hm3UXw3azhPo/yxiXwH65pfq7HGWSUbI6go821MobIMKZI
	 DFgkd6IjfJyS+sVYqBRF4hhPiU0qMPnztPVoICUeQVCMw39nUMaRGBzo0F+ECYVnSp
	 SU/t4m8bX4+CXHTmIPXsVttddfJIajeImUPV9UYI=
Date: Wed, 20 Aug 2025 17:01:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: maudspierings@gocontroll.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Check whether pad is non-NULL
 before access
Message-ID: <20250820140154.GB6190@pendragon.ideasonboard.com>
References: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>

Hi Maud,

On Mon, Aug 18, 2025 at 02:31:43PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> media_pad_remote_pad_first() can return NULL if no valid link is found.
> Check for this possibility before dereferencing it in the next line.
> 
> Reported/investigated in [1]:
> 
> Link: https://lore.kernel.org/all/1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com/ [1]
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> I'm not sure if this should be a dev_dbg(), just following the pattern
> around it for now, also not sure if EPIPE is the correct error.

I've submitted
https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pinchart@ideasonboard.com,
which should fix this issue in a more generic way.

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index ede6cc74c0234049fa225ad82aaddaad64aa53d7..1ed8b031178b7d934b04a8752747f556bd1fc5a9 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -160,6 +160,13 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
>  	}
>  
>  	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> +
> +	if (pad == NULL) {
> +		dev_dbg(xbar->isi->dev, "no valid link found to pad %u\n",
> +			sink_pad);
> +		return ERR_PTR(-EPIPE);
> +	}
> +
>  	sd = media_entity_to_v4l2_subdev(pad->entity);
>  	if (!sd) {
>  		dev_dbg(xbar->isi->dev,
> 
> ---
> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> change-id: 20250818-imx8_isi-954898628bb6

-- 
Regards,

Laurent Pinchart

