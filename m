Return-Path: <linux-media+bounces-1510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ABB8025CF
	for <lists+linux-media@lfdr.de>; Sun,  3 Dec 2023 18:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BBC11C208DB
	for <lists+linux-media@lfdr.de>; Sun,  3 Dec 2023 17:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EB1168B4;
	Sun,  3 Dec 2023 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k9fwLMPl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C288EB
	for <linux-media@vger.kernel.org>; Sun,  3 Dec 2023 08:59:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15A2D149B;
	Sun,  3 Dec 2023 17:59:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701622754;
	bh=Wll7qA2nBllPjDux3ZIC+rA/HpAF7oXRAYjRWwWyufw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9fwLMPlu26j9n6YEs+kkObh2xcTKF1+O5WFahMbsLv+jSyibsYe5c+gygjSzBl8e
	 EqOQJx0KS7P+wNLSMpXTfy6hBH7IXM6ue6EtiiCTHv/sOL4Jsn3L7bgecp3X+o9JHS
	 vdCRV+196ocsZ6niQ91jjKNXumrO0XM1Ojlpzmlc=
Date: Sun, 3 Dec 2023 18:59:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: nxp: isi: Check whether pad is non-NULL before
 access
Message-ID: <20231203165959.GA22111@pendragon.ideasonboard.com>
References: <20231201150614.63300-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201150614.63300-1-marex@denx.de>

Hi Marek,

Thank you for the patch.

On Fri, Dec 01, 2023 at 04:06:04PM +0100, Marek Vasut wrote:
> The pad can be NULL if media controller routing is not set up correctly.
> Check whether the pad is NULL before using it, otherwise it is possible
> to achieve NULL pointer dereference.

Could you share more information about how to misconfigure the routing ?

> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 792f031e032ae..44354931cf8a1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -160,8 +160,14 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
>  	}
>  
>  	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> -	sd = media_entity_to_v4l2_subdev(pad->entity);
> +	if (!pad) {
> +		dev_dbg(xbar->isi->dev,
> +			"no pad connected to crossbar input %u\n",
> +			sink_pad);
> +		return ERR_PTR(-EPIPE);
> +	}
>  
> +	sd = media_entity_to_v4l2_subdev(pad->entity);
>  	if (!sd) {
>  		dev_dbg(xbar->isi->dev,
>  			"no entity connected to crossbar input %u\n",

-- 
Regards,

Laurent Pinchart

