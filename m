Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F78A36ED94
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 17:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240736AbhD2Prc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 11:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233420AbhD2Prc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 11:47:32 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED63EC06138B;
        Thu, 29 Apr 2021 08:46:44 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 621441F435E6
Subject: Re: [PATCH v1 4/4] mtk-mdp: soc: mediatek: register mdp from mmsys
To:     Eizan Miyamoto <eizan@chromium.org>, linux-kernel@vger.kernel.org
Cc:     chunkuang.hu@kernel.org, yong.wu@mediatek.com,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210423055842.2490679-1-eizan@chromium.org>
 <20210423155824.v1.4.I558dcbaa17bf00243951a8ceb6d0e98758aacfa4@changeid>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <ecf9ab25-779d-01c7-97e3-76aa09b69415@collabora.com>
Date:   Thu, 29 Apr 2021 17:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423155824.v1.4.I558dcbaa17bf00243951a8ceb6d0e98758aacfa4@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for your patch.

On 23/4/21 7:58, Eizan Miyamoto wrote:
> Rather than hanging the MDP master component driver off of the rdma0
> device, create a "virtual" device by the mmsys driver instead which is
> probed by the mtk_mdp_core driver.
> 
> Broadly, four interdependent things are done by this change:
> - A virtual device that is probed by the mtk_mdp_core driver is
>   instantiated by the mtk_mmsys driver.
> - Presence of a mediatek,vpu property in a child node to the mmsys
>   device node is used to determine what device to use when dispatching
>   dma ops from the relevant ioctl.
> - v4l-related setup is moved into from the mtk_mdp_core driver to the
>   mtk_mdp_comp driver.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 47 +++++++++-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 62 ++++++-------------
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |  2 +
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  4 +-
>  drivers/soc/mediatek/mtk-mmsys.c              | 20 +++++-
>  5 files changed, 75 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index d447bfaadef4..dc5231a1fcfd 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -106,8 +106,41 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>  {
>  	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>  	struct mtk_mdp_dev *mdp = data;
> +	struct device_node *vpu_node;
>  
>  	mtk_mdp_register_component(mdp, comp);
> +
> +	// If this component has a "mediatek-vpu" property, it is responsible for
> +	// notifying the mdp master driver about it so it can be further initialized
> +	// later.

Please use c-style comments here.

> +	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);

That's a bit confusing to me, please correct me if I am wrong, so, the
mediatek,vpu property is used to tell the code that this component should be the
'vpu master', not to point a vpu node in the DT? I understood correctly?


> +	if (vpu_node) {
> +		int ret;
> +
> +		mdp->vpu_dev = of_find_device_by_node(vpu_node);
> +		if (WARN_ON(!mdp->vpu_dev)) {
> +			dev_err(dev, "vpu pdev failed\n");
> +			of_node_put(vpu_node);
> +		}
> +
> +		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to register v4l2 device\n");
> +			return -EINVAL;
> +		}
> +
> +		ret = vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
> +		if (ret) {
> +			dev_err(dev, "Failed to set vb2 dma mag seg size\n");
> +			return -EINVAL;
> +		}
> +
> +		// presence of the "mediatek,vpu" property in a device node
> +		// indicates that it is the primary MDP rdma device and MDP DMA
> +		// ops should be handled by its DMA callbacks.

Isn't rdma0 always the primary MDP device? or there are SoCs or configurations
where this is different? At least I think it is for MT8173 and MT8183.

> +		mdp->rdma_dev = dev;
> +	}
> +
>  	pm_runtime_enable(dev);
>  
>  	return 0;
> @@ -164,23 +197,9 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>  static int mtk_mdp_comp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *vpu_node;
>  	int status;
>  	struct mtk_mdp_comp *comp;
>  
> -	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> -	if (vpu_node) {
> -		of_node_put(vpu_node);
> -		/*
> -		 * The device tree node with a mediatek,vpu property is deemed
> -		 * the MDP "master" device, we don't want to add a component
> -		 * for it in this function because the initialization for the
> -		 * master is done elsewhere.
> -		 */
> -		dev_info(dev, "vpu node found, not probing\n");
> -		return -ENODEV;
> -	}
> -
>  	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
>  	if (!comp)
>  		return -ENOMEM;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 5e71496e2517..4d7aa4e26be6 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -121,6 +121,17 @@ static int mtk_mdp_master_bind(struct device *dev)
>  		goto err_component_bind_all;
>  	}
>  
> +	if (mdp->vpu_dev) {
> +		int ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> +					  VPU_RST_MDP);
> +		if (ret) {
> +			dev_err(dev, "Failed to register reset handler\n");
> +			goto err_wdt_reg;
> +		}
> +	} else {
> +		dev_err(dev, "no vpu_dev found\n");
> +	}
> +
>  	status = mtk_mdp_register_m2m_device(mdp);
>  	if (status) {
>  		dev_err(dev, "Failed to register m2m device: %d\n", status);
> @@ -133,6 +144,8 @@ static int mtk_mdp_master_bind(struct device *dev)
>  	return 0;
>  
>  err_mtk_mdp_register_m2m_device:
> +
> +err_wdt_reg:
>  	component_unbind_all(dev, mdp);
>  
>  err_component_bind_all:
> @@ -191,8 +204,13 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  		of_node_put(node);
>  		parent = dev->of_node;
>  		dev_warn(dev, "device tree is out of date\n");
> -	} else {
> +	} else if (dev->of_node) {
>  		parent = dev->of_node->parent;
> +	} else if (dev->parent) {
> +		// maybe we were created from a call to platform_device_register_data()
> +		parent = dev->parent->parent->of_node;
> +	} else {
> +		return -ENODEV;
>  	}
>  
>  	/* Iterate over sibling MDP function blocks */
> @@ -225,16 +243,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/*
> -	 * Create a component for myself so that clocks can be toggled in
> -	 * clock_on().
> -	 */
> -	ret = mtk_mdp_comp_init(&mdp->comp_self, dev);
> -	if (ret) {
> -		dev_err(dev, "Failed to initialize component\n");
> -		goto err_comp;
> -	}
> -
>  	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
>  	if (!mdp->job_wq) {
>  		dev_err(&pdev->dev, "unable to alloc job workqueue\n");
> @@ -250,29 +258,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  	}
>  	INIT_WORK(&mdp->wdt_work, mtk_mdp_wdt_worker);
>  
> -	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to register v4l2 device\n");
> -		ret = -EINVAL;
> -		goto err_dev_register;
> -	}
> -
> -	mdp->vpu_dev = vpu_get_plat_device(pdev);
> -	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> -				  VPU_RST_MDP);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to register reset handler\n");
> -		goto err_wdt_reg;
> -	}
> -
>  	platform_set_drvdata(pdev, mdp);
>  
> -	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> -		goto err_set_max_seg_size;
> -	}
> -
>  	ret = component_master_add_with_match(dev, &mtk_mdp_com_ops, match);
>  	if (ret) {
>  		dev_err(dev, "Component master add failed\n");
> @@ -284,22 +271,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_component_master_add:
> -	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> -
> -err_set_max_seg_size:
> -
> -err_wdt_reg:
> -	v4l2_device_unregister(&mdp->v4l2_dev);
> -
> -err_dev_register:
>  	destroy_workqueue(mdp->wdt_wq);
>  
>  err_alloc_wdt_wq:
>  	destroy_workqueue(mdp->job_wq);
>  
>  err_alloc_job_wq:
> -
> -err_comp:
>  	dev_dbg(dev, "err %d\n", ret);
>  	return ret;
>  }
> @@ -371,7 +348,6 @@ static struct platform_driver mtk_mdp_driver = {
>  	.driver = {
>  		.name	= MTK_MDP_MODULE_NAME,
>  		.pm	= &mtk_mdp_pm_ops,
> -		.of_match_table = mtk_mdp_of_ids,
>  	}
>  };
>  
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> index 230f531400ca..78c3c77cd226 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> @@ -133,6 +133,7 @@ struct mtk_mdp_variant {
>   * struct mtk_mdp_dev - abstraction for image processor entity
>   * @lock:	the mutex protecting this data structure
>   * @vpulock:	the mutex protecting the communication with VPU
> + * @rdma_dev:  device pointer to rdma device for MDP
>   * @pdev:	pointer to the image processor platform device
>   * @variant:	the IP variant information
>   * @id:		image processor device index (0..MTK_MDP_MAX_DEVS)
> @@ -151,6 +152,7 @@ struct mtk_mdp_variant {
>  struct mtk_mdp_dev {
>  	struct mutex			lock;
>  	struct mutex			vpulock;
> +	struct device			*rdma_dev;
>  	struct platform_device		*pdev;
>  	struct mtk_mdp_variant		*variant;
>  	u16				id;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> index d351e5a44768..c80ad8299c5e 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> @@ -932,7 +932,7 @@ static int mtk_mdp_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	src_vq->mem_ops = &vb2_dma_contig_memops;
>  	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>  	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> -	src_vq->dev = &ctx->mdp_dev->pdev->dev;
> +	src_vq->dev = ctx->mdp_dev->rdma_dev;
>  	src_vq->lock = &ctx->mdp_dev->lock;
>  
>  	ret = vb2_queue_init(src_vq);
> @@ -947,7 +947,7 @@ static int mtk_mdp_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	dst_vq->mem_ops = &vb2_dma_contig_memops;
>  	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>  	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> -	dst_vq->dev = &ctx->mdp_dev->pdev->dev;
> +	dst_vq->dev = ctx->mdp_dev->rdma_dev;
>  	dst_vq->lock = &ctx->mdp_dev->lock;
>  
>  	return vb2_queue_init(dst_vq);
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 18f93979e14a..6f9cf7725529 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -305,6 +305,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct platform_device *clks;
>  	struct platform_device *drm;
> +	struct platform_device *mdp;
>  	void __iomem *config_regs;
>  	int ret;
>  
> @@ -328,10 +329,27 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  					    PLATFORM_DEVID_AUTO, NULL, 0);
>  	if (IS_ERR(drm)) {
>  		platform_device_unregister(clks);
> -		return PTR_ERR(drm);
> +		ret = PTR_ERR(drm);
> +		goto err_drm;
> +	}
> +
> +	mdp = platform_device_register_data(&pdev->dev, "mtk-mdp",
> +					    PLATFORM_DEVID_AUTO, NULL, 0);
> +	if (IS_ERR(mdp)) {
> +		ret = PTR_ERR(mdp);
> +		dev_err(dev, "Failed to register mdp: %d\n", ret);
> +		goto err_mdp;
>  	}
>  
>  	return 0;
> +
> +err_mdp:
> +	platform_device_unregister(drm);
> +
> +err_drm:
> +	platform_device_unregister(clks);
> +
> +	return ret;
>  }
>  
>  static const struct of_device_id of_match_mtk_mmsys[] = {
> 
