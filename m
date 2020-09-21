Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0119C27193D
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 04:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgIUCVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Sep 2020 22:21:20 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:31175 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgIUCVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Sep 2020 22:21:18 -0400
X-Greylist: delayed 1091 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 22:21:14 EDT
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200921020302epoutp04c42dd70f212233bfaeb4f9c0d33ad448~2qiJmU7wt0485904859epoutp04H
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 02:03:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200921020302epoutp04c42dd70f212233bfaeb4f9c0d33ad448~2qiJmU7wt0485904859epoutp04H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600653782;
        bh=g0oATIzNYCSGdhBg71Jn3ib7IrPTFzcRdqScvC/9+KA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=p/gDGtDM/nMwDpbFNkp+QaN5dItnVVtxgMFuZtpNz31M1t46hdn/qmIEWOrBHbS3L
         TX1NiQ82R5i62d+B6i6Bl3flaP2d6ziHWD74fIsVY1avWwbQsseQFhhAv0Wc5d3XYK
         jpz+YlTjZwzm4CUrNidLZhTi2AiAkt7/T5FwafVQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20200921020301epcas1p33a3c996a8fda0bf05f9138a7ed20f551~2qiIsA5gO2088620886epcas1p33;
        Mon, 21 Sep 2020 02:03:01 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.158]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4BvnlQ2xcGzMqYkW; Mon, 21 Sep
        2020 02:02:58 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        87.9C.09543.2D9086F5; Mon, 21 Sep 2020 11:02:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200921020257epcas1p10b2f67e42db592d997c676ce1a82e182~2qiFIgUyJ2063820638epcas1p1b;
        Mon, 21 Sep 2020 02:02:57 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200921020257epsmtrp20870e2bf9102c449e2542fca2fd7031d~2qiFHYw-h0373303733epsmtrp2G;
        Mon, 21 Sep 2020 02:02:57 +0000 (GMT)
X-AuditID: b6c32a35-347ff70000002547-9c-5f6809d23504
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4B.60.08745.1D9086F5; Mon, 21 Sep 2020 11:02:57 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200921020257epsmtip1ce44e0e87ed151d9118ba907ba199b12~2qiEsTI4Y1836218362epsmtip1F;
        Mon, 21 Sep 2020 02:02:57 +0000 (GMT)
Subject: Re: [PATCH 14/18] drm/exynos: Consolidate IOMMU mapping code
To:     Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
        linux@armlinux.org.uk
Cc:     will@kernel.org, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        m.szyprowski@samsung.com, agross@kernel.org,
        bjorn.andersson@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, vdumpa@nvidia.com, digetx@gmail.com,
        matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <493d5e57-1026-210b-b386-f33c41355774@samsung.com>
Date:   Mon, 21 Sep 2020 11:09:44 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8b4a21e4f1b4d6da086371ee213c654b10fcf946.1597931876.git.robin.murphy@arm.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf1CTZRzveffu3eBu9gojnvjD5kIFcoMxRw/p1E7q3rvq5ErSqBwL3jZi
        jLWxMvsBwkBARccwYPwQDA/5YXgDElBAMUElzLVuEUIIjEtKkB+Sp3BXGy9e/Pf5fJ7P5/n+
        eO7hsnw6OQHcRG0qrdcqNULCG//hanCo6BcvtSLseIYvujW+iKO+rmkc1c+OA/TrwgMClZcW
        AFRbfw1DlV1bkcl6Gke5pec5qD/jPgflmqs5yDbuZCNzVz8HOdrLCHT0fAsbOTLtABX/3Imh
        3IdWAnWf7ADo3I/DHHS3fopAGSYpujLjYqOOJ51sVGyZJFD1RA6BHrdX4Ci/421kGpKhkYIm
        fOc6ynWlAqMaKhoA5XDaWZS5X0S1WYc5VGlOCZuy1eUS1JDzEkGNHOnFqKbqNMoyUAOoi7+n
        E5TpRhdOHcucJqj85jpA9Q5cwKLXxiZtU9PKBFovoLXxKQmJWpVc+MY7il0KWUSYRCSJRC8L
        BVplMi0XRr0ZLXo9UePelVDwmVJjdEvRSoNBGLp9mz7FmEoL1CmGVLmQ1iVodJE6sUGZbDBq
        VeL4lORXJGFh4TK3MS5J7bRJdfdywYHDZd+CdGDV5wEvLiS3wNs5E5w84M31IVsBHC+8RTBk
        DsB7M6dZDJkH8PF0Pf40Yq2aWYm0A3g8exYw5AGAS3mWZZcv+Rrs+6kA82A++SF80rq0nGCR
        l9nQ4RjleA4IcgM0nx1xF+RyeeR2WLsQ6pFxt5xtr2J7sB+5D/YesSzbeeRaeKPEtXy/F/k+
        HLp6jPBgFukPB12nMAa/ADNbSpfbhmSGNzTNZ6+0HQV7KvNZDPaFf/U2cxgcAOenOwgmkAmg
        ubgPY0gOgMPjv62kpbDrjAXzdMoig2Fjeygjr4dti+WAqbwGTi8cZXsskOTBnGwfxiKEPfYB
        wGAIb1ebCcZCwUc3Y0+A9dZVo1lXjWNdNY71/7qVAK8Dz9E6Q7KKNkh0ktXPbQPLHylE1grM
        UzPiboBxQTeAXJaQz9sYrlL48BKUXxyk9SkKvVFDG7qBzL1sMyvALz7F/RO1qQqJLFwqlaIt
        kgiZRCL0540OChQ+pEqZSifRtI7WP81hXK+AdEw4xP00OdYcuYserbl+MO1aXTzhvH/YLunZ
        1PxHxJ5iw2Cyes8nNars/f8WxVZUjfGfeTZud9M/hROHOi1fP+/Sx/Ef3sxbl9H4p//AxEui
        DlEMNXbSVBbnNcOanIyZsAeFvdWHzwU1XD4TsmNNvLyEiNpc9Kp8TrH1otGZ9NXfee+OjO82
        DmoO1PGU3rO25qjAsVzqPTG/ULbh+pctXndOhJx1BEoz2N+I9jZmgcC5U98Tm4q6kvjqj+yb
        BQKzbjh7isd3FWXJRw6lZdk+f/Sx2NoTYyH3bdy598Ugi6UmLW2x3GL0UznBpbs7TBe6z3FD
        m9oEwZMfTLq+2y9eKuHcqRXiBrVSEsLSG5T/AawyxVTRBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxiGfc9XTzGNhwrjVQJuJZsBBwyY5h2yxmUZO3FZpu4DI47a4Un5
        rE0r2yQzEGkGtcPxsYk9pbUViFCYGmyVVSjYoh04NB1bA6akG9RlZIiYSaLSmVGbJfy7nue+
        r+fXQ+NiI7mZLlUe5dRKeYWEiiGueCTJ6T5hiey1e4/j0e25FQLdGl4kUO/DOYB+XX5AIZOx
        BaCe3hsYsgzvRFr+HIF0xksCNHFiQYB0zZ0C1D/nJ1Hz8IQATTrbKfTNJQeJJut8AJ2548KQ
        7hFPIff3QwD9MDojQL/33qfQCW0Our4UItHQUxeJzrTOU6jzXgOFnjjNBDo1tA9pA9tRsOUy
        sSuZDV03Y2yfuQ+wk34fzjZPpLM/8jMC1thgINl+m45iA/5Big3qvRh7ubOGbZ06D9hr07UU
        qx0bJtjGukWKPWW3AdY7dRXbE3sgJu8wV1H6OafOlB6KKfH356j+0oEv69tPg1rAq08CIQ2Z
        1yFvXRKcBDG0mBkA0DM6tTrQqwGEdgcdxY3Q49FEK/cBbBrvxCPuRuYdeOvnFizCccyn8NH5
        XipSwpkRErrCYTJqBAC84G4jIi2KeRk2dwepyFURI4U9y5mRNbG6/tpnJSMcz+yH2mBYEGER
        EwvHDKHnqpAphAFPIxVhnNkKw+Zf8CgnwLuhs1iUt8A6hxFvAmJ+jc6vUfg1Cr9GsQDCBjZx
        Kk2lolKTpcpWcl9kaOSVmiqlIqP4SGU/eP4/aWkDYNC2lOEGGA3cANK4JE70SrZCJhYdlh+r
        5tRHZOqqCk7jBok0IUkQLfPWIjGjkB/lyjlOxan/TzFauLkWe/XDrpTMbR8cyG28OduRZZ4X
        Pumei3P+I30cHsmpfnDofXl3eXi3YeWhs829db0+kGQb7G4tKi4p2l++xfTuOeVx507Tvz1L
        Sbmpx3/7Vp24782E9k3rZSt7U9oXdl9xSJu+eyt2Q4FtXjqUO/tJTfWFz6ZVBa6bd06Xtdrz
        x2fbvAXJ4D3X+Edvp3obbgdf8G7fwC3o1xU6bTvKXrSMSi52vGTKq3dMz1pu7Dr4LNZXVoM7
        O76qkryR97elaWrEXlrqLS4MLIbWGbiuenXitD7l4/zMn/rqZvSOlXRZfld4wGS3Kv40Prvb
        Y7fKDE/zsuOxY4Lya34mJ7WlYc/Yjj+SxiSEpkSelYarNfL/ACKJmmCuAwAA
X-CMS-MailID: 20200921020257epcas1p10b2f67e42db592d997c676ce1a82e182
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200820151152epcas1p453a5756e94028588f76233af17a05978
References: <cover.1597931875.git.robin.murphy@arm.com>
        <CGME20200820151152epcas1p453a5756e94028588f76233af17a05978@epcas1p4.samsung.com>
        <8b4a21e4f1b4d6da086371ee213c654b10fcf946.1597931876.git.robin.murphy@arm.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



20. 8. 21. 오전 12:08에 Robin Murphy 이(가) 쓴 글:
> Now that arch/arm is wired up for default domains and iommu-dma, we can
> consolidate the shared mapping code onto the generic IOMMU API version,
> and retire the arch-specific implementation.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> ---
> This is a cheeky revert of 07dc3678bacc ("drm/exynos: Fix cleanup of
> IOMMU related objects"), plus removal of the remaining arm_iommu_*
> references on top.

Thanks for cleanup.

Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +-
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  5 +-
>  drivers/gpu/drm/exynos/exynos_drm_dma.c       | 61 +++----------------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +-
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +-
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +-
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +-
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 +-
>  drivers/gpu/drm/exynos/exynos_mixer.c         |  7 +--
>  11 files changed, 29 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 1f79bc2a881e..8428ae12dfa5 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -55,7 +55,6 @@ static const char * const decon_clks_name[] = {
>  struct decon_context {
>  	struct device			*dev;
>  	struct drm_device		*drm_dev;
> -	void				*dma_priv;
>  	struct exynos_drm_crtc		*crtc;
>  	struct exynos_drm_plane		planes[WINDOWS_NR];
>  	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -645,7 +644,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>  
>  	decon_clear_channels(ctx->crtc);
>  
> -	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
> +	return exynos_drm_register_dma(drm_dev, dev);
>  }
>  
>  static void decon_unbind(struct device *dev, struct device *master, void *data)
> @@ -655,7 +654,7 @@ static void decon_unbind(struct device *dev, struct device *master, void *data)
>  	decon_atomic_disable(ctx->crtc);
>  
>  	/* detach this sub driver from iommu mapping if supported. */
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
>  }
>  
>  static const struct component_ops decon_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index f2d87a7445c7..e7b58097ccdc 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -40,7 +40,6 @@
>  struct decon_context {
>  	struct device			*dev;
>  	struct drm_device		*drm_dev;
> -	void				*dma_priv;
>  	struct exynos_drm_crtc		*crtc;
>  	struct exynos_drm_plane		planes[WINDOWS_NR];
>  	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -128,13 +127,13 @@ static int decon_ctx_initialize(struct decon_context *ctx,
>  
>  	decon_clear_channels(ctx->crtc);
>  
> -	return exynos_drm_register_dma(drm_dev, ctx->dev, &ctx->dma_priv);
> +	return exynos_drm_register_dma(drm_dev, ctx->dev);
>  }
>  
>  static void decon_ctx_remove(struct decon_context *ctx)
>  {
>  	/* detach this sub driver from iommu mapping if supported. */
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
>  }
>  
>  static u32 decon_calc_clkdiv(struct decon_context *ctx,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> index 58b89ec11b0e..fd5f9bcf1857 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -14,19 +14,6 @@
>  
>  #include "exynos_drm_drv.h"
>  
> -#if defined(CONFIG_ARM_DMA_USE_IOMMU)
> -#include <asm/dma-iommu.h>
> -#else
> -#define arm_iommu_create_mapping(...)	({ NULL; })
> -#define arm_iommu_attach_device(...)	({ -ENODEV; })
> -#define arm_iommu_release_mapping(...)	({ })
> -#define arm_iommu_detach_device(...)	({ })
> -#define to_dma_iommu_mapping(dev) NULL
> -#endif
> -
> -#if !defined(CONFIG_IOMMU_DMA)
> -#define iommu_dma_init_domain(...) ({ -EINVAL; })
> -#endif
>  
>  #define EXYNOS_DEV_ADDR_START	0x20000000
>  #define EXYNOS_DEV_ADDR_SIZE	0x40000000
> @@ -58,7 +45,7 @@ static inline void clear_dma_max_seg_size(struct device *dev)
>   * mapping.
>   */
>  static int drm_iommu_attach_device(struct drm_device *drm_dev,
> -				struct device *subdrv_dev, void **dma_priv)
> +				struct device *subdrv_dev)
>  {
>  	struct exynos_drm_private *priv = drm_dev->dev_private;
>  	int ret = 0;
> @@ -73,22 +60,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>  	if (ret)
>  		return ret;
>  
> -	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> -		/*
> -		 * Keep the original DMA mapping of the sub-device and
> -		 * restore it on Exynos DRM detach, otherwise the DMA
> -		 * framework considers it as IOMMU-less during the next
> -		 * probe (in case of deferred probe or modular build)
> -		 */
> -		*dma_priv = to_dma_iommu_mapping(subdrv_dev);
> -		if (*dma_priv)
> -			arm_iommu_detach_device(subdrv_dev);
> -
> -		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
> -	} else if (IS_ENABLED(CONFIG_IOMMU_DMA)) {
> -		ret = iommu_attach_device(priv->mapping, subdrv_dev);
> -	}
> -
> +	ret = iommu_attach_device(priv->mapping, subdrv_dev);
>  	if (ret)
>  		clear_dma_max_seg_size(subdrv_dev);
>  
> @@ -105,21 +77,15 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>   * mapping
>   */
>  static void drm_iommu_detach_device(struct drm_device *drm_dev,
> -				    struct device *subdrv_dev, void **dma_priv)
> +				struct device *subdrv_dev)
>  {
>  	struct exynos_drm_private *priv = drm_dev->dev_private;
>  
> -	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> -		arm_iommu_detach_device(subdrv_dev);
> -		arm_iommu_attach_device(subdrv_dev, *dma_priv);
> -	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
> -		iommu_detach_device(priv->mapping, subdrv_dev);
> -
> +	iommu_detach_device(priv->mapping, subdrv_dev);
>  	clear_dma_max_seg_size(subdrv_dev);
>  }
>  
> -int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
> -			    void **dma_priv)
> +int exynos_drm_register_dma(struct drm_device *drm, struct device *dev)
>  {
>  	struct exynos_drm_private *priv = drm->dev_private;
>  
> @@ -133,27 +99,20 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
>  		return 0;
>  
>  	if (!priv->mapping) {
> -		void *mapping;
> -
> -		if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
> -			mapping = arm_iommu_create_mapping(&platform_bus_type,
> -				EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
> -		else if (IS_ENABLED(CONFIG_IOMMU_DMA))
> -			mapping = iommu_get_domain_for_dev(priv->dma_dev);
> +		void *mapping = iommu_get_domain_for_dev(priv->dma_dev);
>  
>  		if (IS_ERR(mapping))
>  			return PTR_ERR(mapping);
>  		priv->mapping = mapping;
>  	}
>  
> -	return drm_iommu_attach_device(drm, dev, dma_priv);
> +	return drm_iommu_attach_device(drm, dev);
>  }
>  
> -void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev,
> -			       void **dma_priv)
> +void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev)
>  {
>  	if (IS_ENABLED(CONFIG_EXYNOS_IOMMU))
> -		drm_iommu_detach_device(drm, dev, dma_priv);
> +		drm_iommu_detach_device(drm, dev);
>  }
>  
>  void exynos_drm_cleanup_dma(struct drm_device *drm)
> @@ -163,7 +122,5 @@ void exynos_drm_cleanup_dma(struct drm_device *drm)
>  	if (!IS_ENABLED(CONFIG_EXYNOS_IOMMU))
>  		return;
>  
> -	arm_iommu_release_mapping(priv->mapping);
> -	priv->mapping = NULL;
>  	priv->dma_dev = NULL;
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 6ae9056e7a18..d4d21d8cfb90 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -223,10 +223,8 @@ static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
>  	return priv->mapping ? true : false;
>  }
>  
> -int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
> -			    void **dma_priv);
> -void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev,
> -			       void **dma_priv);
> +int exynos_drm_register_dma(struct drm_device *drm, struct device *dev);
> +void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev);
>  void exynos_drm_cleanup_dma(struct drm_device *drm);
>  
>  #ifdef CONFIG_DRM_EXYNOS_DPI
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index 29ab8be8604c..8ea2e1d77802 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -97,7 +97,6 @@ struct fimc_scaler {
>  struct fimc_context {
>  	struct exynos_drm_ipp ipp;
>  	struct drm_device *drm_dev;
> -	void		*dma_priv;
>  	struct device	*dev;
>  	struct exynos_drm_ipp_task	*task;
>  	struct exynos_drm_ipp_formats	*formats;
> @@ -1134,7 +1133,7 @@ static int fimc_bind(struct device *dev, struct device *master, void *data)
>  
>  	ctx->drm_dev = drm_dev;
>  	ipp->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
> +	exynos_drm_register_dma(drm_dev, dev);
>  
>  	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>  			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> @@ -1154,7 +1153,7 @@ static void fimc_unbind(struct device *dev, struct device *master,
>  	struct exynos_drm_ipp *ipp = &ctx->ipp;
>  
>  	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(drm_dev, dev, &ctx->dma_priv);
> +	exynos_drm_unregister_dma(drm_dev, dev);
>  }
>  
>  static const struct component_ops fimc_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index bb67cad8371f..21aec38702fc 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -167,7 +167,6 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
>  struct fimd_context {
>  	struct device			*dev;
>  	struct drm_device		*drm_dev;
> -	void				*dma_priv;
>  	struct exynos_drm_crtc		*crtc;
>  	struct exynos_drm_plane		planes[WINDOWS_NR];
>  	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -1091,7 +1090,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>  	if (is_drm_iommu_supported(drm_dev))
>  		fimd_clear_channels(ctx->crtc);
>  
> -	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
> +	return exynos_drm_register_dma(drm_dev, dev);
>  }
>  
>  static void fimd_unbind(struct device *dev, struct device *master,
> @@ -1101,7 +1100,7 @@ static void fimd_unbind(struct device *dev, struct device *master,
>  
>  	fimd_atomic_disable(ctx->crtc);
>  
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
>  
>  	if (ctx->encoder)
>  		exynos_dpi_remove(ctx->encoder);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 03be31427181..256ceafd9945 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -232,7 +232,6 @@ struct g2d_runqueue_node {
>  
>  struct g2d_data {
>  	struct device			*dev;
> -	void				*dma_priv;
>  	struct clk			*gate_clk;
>  	void __iomem			*regs;
>  	int				irq;
> @@ -1410,7 +1409,7 @@ static int g2d_bind(struct device *dev, struct device *master, void *data)
>  		return ret;
>  	}
>  
> -	ret = exynos_drm_register_dma(drm_dev, dev, &g2d->dma_priv);
> +	ret = exynos_drm_register_dma(drm_dev, dev);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to enable iommu.\n");
>  		g2d_fini_cmdlist(g2d);
> @@ -1435,7 +1434,7 @@ static void g2d_unbind(struct device *dev, struct device *master, void *data)
>  	priv->g2d_dev = NULL;
>  
>  	cancel_work_sync(&g2d->runqueue_work);
> -	exynos_drm_unregister_dma(g2d->drm_dev, dev, &g2d->dma_priv);
> +	exynos_drm_unregister_dma(g2d->drm_dev, dev);
>  }
>  
>  static const struct component_ops g2d_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> index 45e9aee8366a..88b6fcaa20be 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -97,7 +97,6 @@ struct gsc_scaler {
>  struct gsc_context {
>  	struct exynos_drm_ipp ipp;
>  	struct drm_device *drm_dev;
> -	void		*dma_priv;
>  	struct device	*dev;
>  	struct exynos_drm_ipp_task	*task;
>  	struct exynos_drm_ipp_formats	*formats;
> @@ -1170,7 +1169,7 @@ static int gsc_bind(struct device *dev, struct device *master, void *data)
>  
>  	ctx->drm_dev = drm_dev;
>  	ctx->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
> +	exynos_drm_register_dma(drm_dev, dev);
>  
>  	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>  			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> @@ -1190,7 +1189,7 @@ static void gsc_unbind(struct device *dev, struct device *master,
>  	struct exynos_drm_ipp *ipp = &ctx->ipp;
>  
>  	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(drm_dev, dev, &ctx->dma_priv);
> +	exynos_drm_unregister_dma(drm_dev, dev);
>  }
>  
>  static const struct component_ops gsc_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> index 2d94afba031e..f22fa0d2621a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -56,7 +56,6 @@ struct rot_variant {
>  struct rot_context {
>  	struct exynos_drm_ipp ipp;
>  	struct drm_device *drm_dev;
> -	void		*dma_priv;
>  	struct device	*dev;
>  	void __iomem	*regs;
>  	struct clk	*clock;
> @@ -244,7 +243,7 @@ static int rotator_bind(struct device *dev, struct device *master, void *data)
>  
>  	rot->drm_dev = drm_dev;
>  	ipp->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev, &rot->dma_priv);
> +	exynos_drm_register_dma(drm_dev, dev);
>  
>  	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>  			   DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE,
> @@ -262,7 +261,7 @@ static void rotator_unbind(struct device *dev, struct device *master,
>  	struct exynos_drm_ipp *ipp = &rot->ipp;
>  
>  	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(rot->drm_dev, rot->dev, &rot->dma_priv);
> +	exynos_drm_unregister_dma(rot->drm_dev, rot->dev);
>  }
>  
>  static const struct component_ops rotator_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> index ce1857138f89..0c560566bd2e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -39,7 +39,6 @@ struct scaler_data {
>  struct scaler_context {
>  	struct exynos_drm_ipp		ipp;
>  	struct drm_device		*drm_dev;
> -	void				*dma_priv;
>  	struct device			*dev;
>  	void __iomem			*regs;
>  	struct clk			*clock[SCALER_MAX_CLK];
> @@ -451,7 +450,7 @@ static int scaler_bind(struct device *dev, struct device *master, void *data)
>  
>  	scaler->drm_dev = drm_dev;
>  	ipp->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev, &scaler->dma_priv);
> +	exynos_drm_register_dma(drm_dev, dev);
>  
>  	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>  			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> @@ -471,8 +470,7 @@ static void scaler_unbind(struct device *dev, struct device *master,
>  	struct exynos_drm_ipp *ipp = &scaler->ipp;
>  
>  	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(scaler->drm_dev, scaler->dev,
> -				  &scaler->dma_priv);
> +	exynos_drm_unregister_dma(scaler->drm_dev, scaler->dev);
>  }
>  
>  static const struct component_ops scaler_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index af192e5a16ef..18972e605c5d 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -94,7 +94,6 @@ struct mixer_context {
>  	struct platform_device *pdev;
>  	struct device		*dev;
>  	struct drm_device	*drm_dev;
> -	void			*dma_priv;
>  	struct exynos_drm_crtc	*crtc;
>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
>  	unsigned long		flags;
> @@ -895,14 +894,12 @@ static int mixer_initialize(struct mixer_context *mixer_ctx,
>  		}
>  	}
>  
> -	return exynos_drm_register_dma(drm_dev, mixer_ctx->dev,
> -				       &mixer_ctx->dma_priv);
> +	return exynos_drm_register_dma(drm_dev, mixer_ctx->dev);
>  }
>  
>  static void mixer_ctx_remove(struct mixer_context *mixer_ctx)
>  {
> -	exynos_drm_unregister_dma(mixer_ctx->drm_dev, mixer_ctx->dev,
> -				  &mixer_ctx->dma_priv);
> +	exynos_drm_unregister_dma(mixer_ctx->drm_dev, mixer_ctx->dev);
>  }
>  
>  static int mixer_enable_vblank(struct exynos_drm_crtc *crtc)
> 
