Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45DEB3C7FFA
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 10:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238483AbhGNI3Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 04:29:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48908 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238489AbhGNI3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 04:29:16 -0400
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C15441F41B8C;
        Wed, 14 Jul 2021 09:26:22 +0100 (BST)
Subject: Re: [PATCH v6 03/11] iommu/mediatek: Add device_link between the
 consumer and the larb devices
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
        Eizan Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-4-yong.wu@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <f7b2c5e5-f540-b885-f063-9611031035bc@collabora.com>
Date:   Wed, 14 Jul 2021 10:26:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-4-yong.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 14.07.21 04:56, Yong Wu wrote:
> MediaTek IOMMU-SMI diagram is like below. all the consumer connect with
> smi-larb, then connect with smi-common.
> 
>          M4U
>           |
>      smi-common
>           |
>    -------------
>    |         |    ...
>    |         |
> larb1     larb2
>    |         |
> vdec       venc
> 
> When the consumer works, it should enable the smi-larb's power which
> also need enable the smi-common's power firstly.
> 
> Thus, First of all, use the device link connect the consumer and the
> smi-larbs. then add device link between the smi-larb and smi-common.
> 
> This patch adds device_link between the consumer and the larbs.
> 
> When device_link_add, I add the flag DL_FLAG_STATELESS to avoid calling
> pm_runtime_xx to keep the original status of clocks. It can avoid two
> issues:
> 1) Display HW show fastlogo abnormally reported in [1]. At the beggining,
> all the clocks are enabled before entering kernel, but the clocks for
> display HW(always in larb0) will be gated after clk_enable and clk_disable
> called from device_link_add(->pm_runtime_resume) and rpm_idle. The clock
> operation happened before display driver probe. At that time, the display
> HW will be abnormal.
> 
> 2) A deadlock issue reported in [2]. Use DL_FLAG_STATELESS to skip
> pm_runtime_xx to avoid the deadlock.
> 
> Corresponding, DL_FLAG_AUTOREMOVE_CONSUMER can't be added, then
> device_link_removed should be added explicitly.
> 
> [1] https://lore.kernel.org/linux-mediatek/1564213888.22908.4.camel@mhfsdcap03/
> [2] https://lore.kernel.org/patchwork/patch/1086569/
> 
> Suggested-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c    | 22 ++++++++++++++++++++++
>   drivers/iommu/mtk_iommu_v1.c | 20 +++++++++++++++++++-
>   2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index a02dde094788..ee742900cf4b 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -571,22 +571,44 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
>   {
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>   	struct mtk_iommu_data *data;
> +	struct device_link *link;
> +	struct device *larbdev;
> +	unsigned int larbid;
>   
>   	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
>   		return ERR_PTR(-ENODEV); /* Not a iommu client device */
>   
>   	data = dev_iommu_priv_get(dev);
>   
> +	/*
> +	 * Link the consumer device with the smi-larb device(supplier)
> +	 * The device in each a larb is a independent HW. thus only link
> +	 * one larb here.
> +	 */
> +	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
> +	larbdev = data->larb_imu[larbid].dev;
> +	link = device_link_add(dev, larbdev,
> +			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> +	if (!link)
> +		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
shoudn't ERR_PTR be returned in case of failure?

Thanks,
Dafna

>   	return &data->iommu;
>   }
>   
>   static void mtk_iommu_release_device(struct device *dev)
>   {
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct mtk_iommu_data *data;
> +	struct device *larbdev;
> +	unsigned int larbid;
>   
>   	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
>   		return;
>   
> +	data = dev_iommu_priv_get(dev);
> +	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
> +	larbdev = data->larb_imu[larbid].dev;
> +	device_link_remove(dev, larbdev);
> +
>   	iommu_fwspec_free(dev);
>   }
>   
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index d9365a3d8dc9..d2a7c66b8239 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -424,7 +424,9 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>   	struct of_phandle_args iommu_spec;
>   	struct mtk_iommu_data *data;
> -	int err, idx = 0;
> +	int err, idx = 0, larbid;
> +	struct device_link *link;
> +	struct device *larbdev;
>   
>   	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
>   					   "#iommu-cells",
> @@ -445,6 +447,14 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
>   
>   	data = dev_iommu_priv_get(dev);
>   
> +	/* Link the consumer device with the smi-larb device(supplier) */
> +	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
> +	larbdev = data->larb_imu[larbid].dev;
> +	link = device_link_add(dev, larbdev,
> +			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> +	if (!link)
> +		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
> +
>   	return &data->iommu;
>   }
>   
> @@ -465,10 +475,18 @@ static void mtk_iommu_probe_finalize(struct device *dev)
>   static void mtk_iommu_release_device(struct device *dev)
>   {
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct mtk_iommu_data *data;
> +	struct device *larbdev;
> +	unsigned int larbid;
>   
>   	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
>   		return;
>   
> +	data = dev_iommu_priv_get(dev);
> +	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
> +	larbdev = data->larb_imu[larbid].dev;
> +	device_link_remove(dev, larbdev);
> +
>   	iommu_fwspec_free(dev);
>   }
>   
> 
