Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FCC3C5AB5
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 13:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235186AbhGLKP7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 06:15:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51774 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235075AbhGLKPz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 06:15:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 71C1D1F4210C
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v5 7/8] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
To:     Eizan Miyamoto <eizan@chromium.org>, linux-kernel@vger.kernel.org
Cc:     wenst@chromium.org, chunkuang.hu@kernel.org, yong.wu@mediatek.com,
        houlong.wei@mediatek.com,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210709022324.1607884-1-eizan@chromium.org>
 <20210709122040.v5.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
Message-ID: <36c6a9bc-8bf9-97e3-2791-3665cb237daa@collabora.com>
Date:   Mon, 12 Jul 2021 12:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709122040.v5.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for your patch.

On 9/7/21 4:23, Eizan Miyamoto wrote:
> ... Instead of depending on the presence of a mediatek,vpu property in
> the device node.
> 
> That property was originally added to link to the vpu node so that the
> mtk_mdp_core driver could pass the right device to
> vpu_wdt_reg_handler(). However in a previous patch in this series,
> the driver has been modified to search the device tree for that node
> instead.
> 
> That property was also used to indicate the primary MDP device, so that
> it can be passed to the V4L2 subsystem as well as register it to be
> used when setting up queues in the open() callback for the filesystem
> device node that is created. In this case, assuming that the primary
> MDP device is the one with a specific alias seems useable because the
> alternative is to add a property to the device tree which doesn't
> actually represent any facet of hardware (i.e., this being the primary
> MDP device is a software decision). In other words, this solution is
> equally as arbitrary, but at least it doesn't add a property to a
> device node where said property is unrelated to the hardware present.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 47 ++++++++++++++-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 +++
>  2 files changed, 42 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 87e3f72ff02b..de2d425efdd1 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -151,22 +151,48 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>  		mtk_smi_larb_put(comp->larb_dev);
>  }
>  
> +/*
> + * The MDP master device node is identified by the device tree alias
> + * "mdp-rdma0".
> + */
> +static int is_mdp_master(struct device *dev)

bool ? (and return true/false)

> +{
> +	struct device_node *aliases, *mdp_rdma0_node;
> +	const char *mdp_rdma0_path;
> +
> +	if (!dev->of_node)
> +		return 0;
> +
> +	aliases = of_find_node_by_path("/aliases");
> +	if (!aliases) {
> +		dev_err(dev, "no aliases found for mdp-rdma0");
> +		return 0;
> +	}
> +
> +	mdp_rdma0_path = of_get_property(aliases, "mdp-rdma0", NULL);
> +	if (!mdp_rdma0_path) {
> +		dev_err(dev, "get mdp-rdma0 property of /aliases failed");
> +		return 0;
> +	}
> +
> +	mdp_rdma0_node = of_find_node_by_path(mdp_rdma0_path);
> +	if (!mdp_rdma0_node) {
> +		dev_err(dev, "path resolution failed for %s", mdp_rdma0_path);
> +		return 0;
> +	}
> +
> +	return dev->of_node == mdp_rdma0_node;
> +}
> +
>  static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>  			void *data)
>  {
>  	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>  	struct mtk_mdp_dev *mdp = data;
> -	struct device_node *vpu_node;
>  
>  	mtk_mdp_register_component(mdp, comp);
>  
> -	/*
> -	 * If this component has a "mediatek-vpu" property, it is responsible for
> -	 * notifying the mdp master driver about it so it can be further initialized
> -	 * later.
> -	 */
> -	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> -	if (vpu_node) {
> +	if (is_mdp_master(dev)) {
>  		int ret;
>  
>  		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> @@ -182,9 +208,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>  		}
>  
>  		/*
> -		 * presence of the "mediatek,vpu" property in a device node
> -		 * indicates that it is the primary MDP rdma device and MDP DMA
> -		 * ops should be handled by its DMA callbacks.
> +		 * MDP DMA ops will be handled by the DMA callbacks associated with this
> +		 * device;
>  		 */
>  		mdp->rdma_dev = dev;
>  	}
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index b45d588d2659..e1fb39231248 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -158,6 +158,12 @@ static int mtk_mdp_master_bind(struct device *dev)
>  		goto err_component_bind_all;
>  	}
>  
> +	if (mdp->rdma_dev == NULL) {
> +		dev_err(dev, "Primary MDP device not found");
> +		status = -ENODEV;
> +		goto err_component_bind_all;
> +	}
> +
>  	vpu_node = of_find_node_by_name(NULL, "vpu");
>  	if (!vpu_node) {
>  		dev_err(dev, "unable to find vpu node");
> 
