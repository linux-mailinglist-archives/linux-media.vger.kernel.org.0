Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561703C8015
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 10:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238511AbhGNIdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 04:33:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49066 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238501AbhGNIdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 04:33:20 -0400
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E74891F42822;
        Wed, 14 Jul 2021 09:30:26 +0100 (BST)
Subject: Re: [PATCH v6 07/11] drm/mediatek: Get rid of mtk_smi_larb_get/put
To:     Yong Wu <yong.wu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        David Airlie <airlied@linux.ie>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Evan Green <evgreen@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
        ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
        acourbot@chromium.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Eizan Miyamoto <eizan@chromium.org>,
        anthony.huang@mediatek.com, CK Hu <ck.hu@mediatek.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-8-yong.wu@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <a0b487ec-5337-04da-2c97-f4992bf18394@collabora.com>
Date:   Wed, 14 Jul 2021 10:30:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-8-yong.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 14.07.21 04:56, Yong Wu wrote:
> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the drm device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: CK Hu <ck.hu@mediatek.com>
> CC: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  9 ------
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 36 ++-------------------
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 -
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  5 +--
>   4 files changed, 3 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 08e3f352377d..d046abcf66ce 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -10,7 +10,6 @@
>   #include <linux/soc/mediatek/mtk-mutex.h>
>   
>   #include <asm/barrier.h>
> -#include <soc/mediatek/smi.h>
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> @@ -551,12 +550,6 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>   
>   	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
>   
> -	ret = mtk_smi_larb_get(comp->larb_dev);
> -	if (ret) {
> -		DRM_ERROR("Failed to get larb: %d\n", ret);
> -		return;
> -	}
> -
>   	ret = pm_runtime_resume_and_get(comp->dev);
>   	if (ret < 0)
>   		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n",
> @@ -564,7 +557,6 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>   
>   	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
>   	if (ret) {
> -		mtk_smi_larb_put(comp->larb_dev);
>   		pm_runtime_put(comp->dev);
>   		return;
>   	}
> @@ -601,7 +593,6 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>   
>   	drm_crtc_vblank_off(crtc);
>   	mtk_crtc_ddp_hw_fini(mtk_crtc);
> -	mtk_smi_larb_put(comp->larb_dev);
>   	ret = pm_runtime_put(comp->dev);
>   	if (ret < 0)
>   		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n",
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 75bc00e17fc4..7d240218d4c7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -449,37 +449,15 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>   	return ret;
>   }
>   
> -static int mtk_ddp_get_larb_dev(struct device_node *node, struct mtk_ddp_comp *comp,
> -				struct device *dev)
> -{
> -	struct device_node *larb_node;
> -	struct platform_device *larb_pdev;
> -
> -	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
> -	if (!larb_node) {
> -		dev_err(dev, "Missing mediadek,larb phandle in %pOF node\n", node);
> -		return -EINVAL;
> -	}
> -
> -	larb_pdev = of_find_device_by_node(larb_node);
> -	if (!larb_pdev) {
> -		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
> -		of_node_put(larb_node);
> -		return -EPROBE_DEFER;
> -	}
> -	of_node_put(larb_node);
> -	comp->larb_dev = &larb_pdev->dev;
> -
> -	return 0;
> -}
> -
>   int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
>   		      enum mtk_ddp_comp_id comp_id)
>   {
>   	struct platform_device *comp_pdev;
>   	enum mtk_ddp_comp_type type;
>   	struct mtk_ddp_comp_dev *priv;
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	int ret;
> +#endif
>   
>   	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
>   		return -EINVAL;
> @@ -495,16 +473,6 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
>   	}
>   	comp->dev = &comp_pdev->dev;
>   
> -	/* Only DMA capable components need the LARB property */
> -	if (type == MTK_DISP_OVL ||
> -	    type == MTK_DISP_OVL_2L ||
> -	    type == MTK_DISP_RDMA ||
> -	    type == MTK_DISP_WDMA) {
> -		ret = mtk_ddp_get_larb_dev(node, comp, comp->dev);
> -		if (ret)
> -			return ret;
> -	}
> -
>   	if (type == MTK_DISP_BLS ||
>   	    type == MTK_DISP_CCORR ||
>   	    type == MTK_DISP_COLOR ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index bb914d976cf5..1b582262b682 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -70,7 +70,6 @@ struct mtk_ddp_comp_funcs {
>   struct mtk_ddp_comp {
>   	struct device *dev;
>   	int irq;
> -	struct device *larb_dev;
>   	enum mtk_ddp_comp_id id;
>   	const struct mtk_ddp_comp_funcs *funcs;
>   };
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index b46bdb8985da..0d5ef3d8d081 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -577,11 +577,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
>   	pm_runtime_disable(dev);
>   err_node:
>   	of_node_put(private->mutex_node);
> -	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++) {
> +	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
>   		of_node_put(private->comp_node[i]);
> -		if (private->ddp_comp[i].larb_dev)
> -			put_device(private->ddp_comp[i].larb_dev);
> -	}
>   	return ret;
>   }
>   
> 
