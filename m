Return-Path: <linux-media+bounces-35117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EC8ADE09D
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 03:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E708A3A9DD3
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 01:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2AE191F6A;
	Wed, 18 Jun 2025 01:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="baO4eGtq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1D3219EB;
	Wed, 18 Jun 2025 01:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209561; cv=none; b=Vxe0DOSVc8OjsYGZh35a/XE4q7WMg1f0PSXamb0WKaN2Fepm9PnbCATHMqjnyckZjdd4dPqP4ovXkF5/8wR5vOhH8ggN+5SHSD/RXqMjdOAv4Kb8l5mm8yNYM4iDucj9GdgIH7D1lE3y0XLIpiZ0D/cnh80N+HeYuTW5tIAV3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209561; c=relaxed/simple;
	bh=SU9kQUyq7HRHODtQj8/4ejzrvCox7SLiRfBjeOp8Td0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oalWNH1hrPkCOXWPQ8o+AeNWsuTpBkDOqsBDz/UAzdnxcVkx6OQ71L0eN2UMzd6gFOuZBHLIoQ27lPKzAdVZPHrcVcsd33ZUd+Cm1DzDxWLYwGMFHQEGIubocaU/ysf3erJ9fdzprcQTQ2ZosTZMqKWboOcCpNQ3sw2XSW+pszM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=baO4eGtq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC10A593;
	Wed, 18 Jun 2025 03:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750209544;
	bh=SU9kQUyq7HRHODtQj8/4ejzrvCox7SLiRfBjeOp8Td0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=baO4eGtqFHyRUMMZgepFXIY1A0V9BoAzJrMB+qgzKXAGhmUHyHcfJFkB8uFjAJ28d
	 jPR1eo4MFUQehPcXhGqGlQWS5oEs6bqgaFJufkUO4HTEJQtimYfI6E/KMh9UKYCdkZ
	 0SrTzhjI0wNN3q41Iyc6VBn7y5gO7IU9Y4LwN6Oo=
Date: Wed, 18 Jun 2025 04:19:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: rcar-fcp: Add rcar_fcp_soft_reset()
Message-ID: <20250618011901.GA29915@pendragon.ideasonboard.com>
References: <20250616-vspx-reset-v2-0-6cc12ed7e9bb@ideasonboard.com>
 <20250616-vspx-reset-v2-1-6cc12ed7e9bb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-vspx-reset-v2-1-6cc12ed7e9bb@ideasonboard.com>

On Mon, Jun 16, 2025 at 02:14:24PM +0200, Jacopo Mondi wrote:
> Add a function to perform soft reset of the FCP.
> 
> It is intended to support the correct stop procedure of the VSPX-FCPVX
> and VSPD-FCPD pairs according to section "62.3.7.3 Reset Operation" of
> the R-Car Hardware Manual at revision 1.20.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-fcp.c | 41 +++++++++++++++++++++++++++++++
>  include/media/rcar-fcp.h                  |  5 ++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-fcp.c b/drivers/media/platform/renesas/rcar-fcp.c
> index cee9bbce4e3affb2467dbc28142e1ab2304bf5b0..584add9f7a803e5ef041589c7c0be7eb8371fe9f 100644
> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c
> @@ -9,6 +9,8 @@
>  
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> @@ -19,14 +21,30 @@
>  
>  #include <media/rcar-fcp.h>
>  
> +#define RCAR_FCP_REG_RST		0x0010
> +#define RCAR_FCP_REG_RST_SOFTRST	BIT(0)
> +#define RCAR_FCP_REG_STA		0x0018
> +#define RCAR_FCP_REG_STA_ACT		BIT(0)
> +
>  struct rcar_fcp_device {
>  	struct list_head list;
>  	struct device *dev;
> +	void __iomem *base;
>  };
>  
>  static LIST_HEAD(fcp_devices);
>  static DEFINE_MUTEX(fcp_lock);
>  
> +static inline u32 rcar_fcp_read(struct rcar_fcp_device *fcp, u32 reg)
> +{
> +	return ioread32(fcp->base + reg);
> +}

This function isn't used, which generates a compilation warning, see
https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/jobs/78583977.
I will drop it.

> +
> +static inline void rcar_fcp_write(struct rcar_fcp_device *fcp, u32 reg, u32 val)
> +{
> +	iowrite32(val, fcp->base + reg);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Public API
>   */
> @@ -117,6 +135,25 @@ void rcar_fcp_disable(struct rcar_fcp_device *fcp)
>  }
>  EXPORT_SYMBOL_GPL(rcar_fcp_disable);
>  
> +int rcar_fcp_soft_reset(struct rcar_fcp_device *fcp)
> +{
> +	u32 value;
> +	int ret;
> +
> +	if (!fcp)
> +		return 0;
> +
> +	rcar_fcp_write(fcp, RCAR_FCP_REG_RST, RCAR_FCP_REG_RST_SOFTRST);
> +	ret = readl_poll_timeout(fcp->base + RCAR_FCP_REG_STA,
> +				 value, !(value & RCAR_FCP_REG_STA_ACT),
> +				 1, 100);
> +	if (ret)
> +		dev_err(fcp->dev, "Failed to soft-reset\n");
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(rcar_fcp_soft_reset);
> +
>  /* -----------------------------------------------------------------------------
>   * Platform Driver
>   */
> @@ -131,6 +168,10 @@ static int rcar_fcp_probe(struct platform_device *pdev)
>  
>  	fcp->dev = &pdev->dev;
>  
> +	fcp->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(fcp->base))
> +		return PTR_ERR(fcp->base);
> +
>  	dma_set_max_seg_size(fcp->dev, UINT_MAX);
>  
>  	pm_runtime_enable(&pdev->dev);
> diff --git a/include/media/rcar-fcp.h b/include/media/rcar-fcp.h
> index 179240fb163bd2e7cc347e559f99bae943bf0e34..6ac9be9f675e667d6482a5a2483963fa52a0c622 100644
> --- a/include/media/rcar-fcp.h
> +++ b/include/media/rcar-fcp.h
> @@ -18,6 +18,7 @@ void rcar_fcp_put(struct rcar_fcp_device *fcp);
>  struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp);
>  int rcar_fcp_enable(struct rcar_fcp_device *fcp);
>  void rcar_fcp_disable(struct rcar_fcp_device *fcp);
> +int rcar_fcp_soft_reset(struct rcar_fcp_device *fcp);
>  #else
>  static inline struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np)
>  {
> @@ -33,6 +34,10 @@ static inline int rcar_fcp_enable(struct rcar_fcp_device *fcp)
>  	return 0;
>  }
>  static inline void rcar_fcp_disable(struct rcar_fcp_device *fcp) { }
> +static inline int rcar_fcp_soft_reset(struct rcar_fcp_device *fcp)
> +{
> +	return 0;
> +}
>  #endif
>  
>  #endif /* __MEDIA_RCAR_FCP_H__ */
> 

-- 
Regards,

Laurent Pinchart

