Return-Path: <linux-media+bounces-41459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE571B3EB03
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 884957A833A
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1622D5951;
	Mon,  1 Sep 2025 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EKiXZZw+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE3A32F748;
	Mon,  1 Sep 2025 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741016; cv=none; b=UORdILAgciL0tvN3v0WLDCdOaVkOfVYsIUiEXBnOYaQvC3bFjEdiNrgZZ5w+bxgzFJJCXRw8VCIXPbSkcH/BlXjX8Le9FZsiz6OzzPsXRPk1uNYI5PtUU5KB14OdDMOACJf+4yeyDWGKPysRhHErV0KX9/nsch1lEVE3WixVpH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741016; c=relaxed/simple;
	bh=JG/FmgDIqDX7Pla+FvRtTebcB0C0aiOljtqjKTBfLkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQiFPL7Vctyeczfh/9rOjqArYDgOV9+Ym9vSk7c5R4Cm+RU465ewqSV9v4J3deBCuEiC26DU99viCQ2e37IP0qEZdjmsEc+aoAC5qdbFZhInmQ/TqOuRtigPkNyPpqwUcWD0DOAjw2TaazZaCcdUNypLrehpg+9cq9InyQbRzvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EKiXZZw+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4DAADB63;
	Mon,  1 Sep 2025 17:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756740945;
	bh=JG/FmgDIqDX7Pla+FvRtTebcB0C0aiOljtqjKTBfLkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKiXZZw+1L6xfHznEGef9KgZOxr+v2EfyaEghsc+nhd3PwhWKlq+dfiA9Z/qY9w5j
	 uFUEQ3zSgaQAGjEGOIaQx0RGoQO2LE1kQZBl3JhHsYwhbaWvOz6HmNQnQy8aaqoP51
	 w3N3wDxa0jrMGM/kPZ6JX3/ozGtYUUHBC4/lLFNY=
Date: Mon, 1 Sep 2025 17:36:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Explicitly release reset
Message-ID: <20250901153632.GA13448@pendragon.ideasonboard.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-3-67964d1471f3@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901-csi2_imx8ulp-v5-3-67964d1471f3@nxp.com>

Hi Guoniu,

Thank you for the patch.

On Mon, Sep 01, 2025 at 02:25:31PM +0800, Guoniu Zhou wrote:
> Call reset_control_deassert() to explicitly release reset to make sure
> reset bits are cleared since platform like i.MX8ULP can't clear reset
> bits automatically.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 2bf11984690af2e687a3217e465697333d9d995d..6b83aa85af42e1dac25cf29056863680c1f89402 100644
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

What happened to this plan, would it be feasible to implement the
.reset() operation in the relevant drivers to be able to use
reset_control_reset() here ?

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

