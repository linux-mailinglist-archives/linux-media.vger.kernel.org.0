Return-Path: <linux-media+bounces-34548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6103AD63CB
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D85F188A234
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 23:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E162C17A8;
	Wed, 11 Jun 2025 23:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KXzDZ5d3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E60319D890;
	Wed, 11 Jun 2025 23:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749684021; cv=none; b=dRDui4VVX8w2Bh72GG1XMK0h4IacjD//CBYOz0UZOOiDio59e7Z4X8UkGguRJmd7kKFfsOrcn+To+sCNHkG+9UmoR7PDiXrqgfc4u4GmqEWRojlZG3GZ9OvGBzaIv4MC4X7JWbW3YhYwRC/XWHpkYsTlKgi6r+NPO9r4oNeAatY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749684021; c=relaxed/simple;
	bh=BgniamC2Jyp3qUxMiYiYleOI3ssJMMoJa96+tB6wZTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfDc7QOlhATSCm91+X6fqmCOx/OLD4JXaxCXmNkPdKSXQApPNgM51v0Dkqu2iShzUXNrZOzFbARm74/sTWSAzTtkViOcbbNUv9NAvOxYATOVAuwO+pPK3e5P5ZxWzPzkr6LkOtZtZgmbUM1SqdF65pJxxgPPfIlQYtu1zNAseFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KXzDZ5d3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 203ADD52;
	Thu, 12 Jun 2025 01:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749684009;
	bh=BgniamC2Jyp3qUxMiYiYleOI3ssJMMoJa96+tB6wZTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXzDZ5d3AyEhMIXKDFhk5KdHFYDQGuI3pEcjGh9DBsqciuQetkieAegi1NrKx10i9
	 1s+Lv8LI7fxxNZwuvQB3dmoofg54bi6l+tw7PIwUiqp4CtmHLFfEyel6kIeHYQeObu
	 GZJDuWSWtlj2ma1yMdl2jfMmuRay3xHmD1aLQvvk=
Date: Thu, 12 Jun 2025 02:20:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rcar-fcp: Add rcar_fcp_soft_reset()
Message-ID: <20250611232004.GP24465@pendragon.ideasonboard.com>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-1-9f17277ff1e2@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-vspx-reset-v1-1-9f17277ff1e2@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Jun 09, 2025 at 09:01:42PM +0200, Jacopo Mondi wrote:
> Add a function to perform soft reset of the FCP.
> 
> It is intended to support the correct stop procedure of the VSPX-FCPVX
> and VSPD-FCPD pairs according to section "62.3.7.3 Reset Operation" of
> the R-Car Hardware Manual at revision 1.20.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-fcp.c | 41 +++++++++++++++++++++++++++++++
>  include/media/rcar-fcp.h                  |  5 ++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-fcp.c b/drivers/media/platform/renesas/rcar-fcp.c
> index cee9bbce4e3affb2467dbc28142e1ab2304bf5b0..fefeaf77f0122a2d88ac03a5c42a892dc284a163 100644
> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c
> @@ -10,6 +10,8 @@
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/list.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>

i goes before l.

>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/mutex.h>
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
> +				 0, 100);

That will be a busy loop for up to 100µs. Shouldn't the sleep_us
argument be at least 1 ?

You could also use

	ret = read_poll_timeout(rcar_fcp_read, value,
				!(value & FCAR_FCP_REG_STA_ACT), 1, 100, false,
				fcp, RCAR_FCP_REG_STA);

Up to you.

> +	if (ret)
> +		dev_err(fcp->dev, "Failed to soft-reset: %d\n", ret);

ret can only be 0 or -ETIMEDOUT, so I wouldn't print its value in the
message.

With these issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart

