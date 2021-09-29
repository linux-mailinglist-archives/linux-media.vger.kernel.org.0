Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519D641CA2D
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 18:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345483AbhI2Qew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Sep 2021 12:34:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51880 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244930AbhI2Qev (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Sep 2021 12:34:51 -0400
Received: from [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1] (unknown [IPv6:2a02:810a:880:f54:fd5c:7cb1:aaa8:78b1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3A3C31F4473B;
        Wed, 29 Sep 2021 17:33:08 +0100 (BST)
Subject: Re: [PATCH v8 03/12] iommu/mediatek: Add probe_defer for smi-larb
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
        Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
        yi.kuo@mediatek.com, acourbot@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Eizan Miyamoto <eizan@chromium.org>,
        anthony.huang@mediatek.com,
        Frank Wunderlich <frank-w@public-files.de>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-4-yong.wu@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <33a8b313-ad1b-d307-7e8c-2fdebdc6f1a7@collabora.com>
Date:   Wed, 29 Sep 2021 18:33:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210929013719.25120-4-yong.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 29.09.21 03:37, Yong Wu wrote:
> Prepare for adding device_link.
> 
> The iommu consumer should use device_link to connect with the
> smi-larb(supplier). then the smi-larb should run before the iommu
> consumer. Here we delay the iommu driver until the smi driver is ready,
> then all the iommu consumers always are after the smi driver.
> 
> When there is no this patch, if some consumer drivers run before
> smi-larb, the supplier link_status is DL_DEV_NO_DRIVER(0) in the
> device_link_add, then device_links_driver_bound will use WARN_ON
> to complain that the link_status of supplier is not right.
> 
> device_is_bound may be more elegant here. but it is not allowed to
> EXPORT from https://lore.kernel.org/patchwork/patch/1334670/.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623
> ---
>   drivers/iommu/mtk_iommu.c    | 2 +-
>   drivers/iommu/mtk_iommu_v1.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index d837adfd1da5..d5848f78a677 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -844,7 +844,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   			id = i;
>   
>   		plarbdev = of_find_device_by_node(larbnode);
> -		if (!plarbdev) {
> +		if (!plarbdev || !plarbdev->dev.driver) {
>   			of_node_put(larbnode);
>   			return -EPROBE_DEFER;

if plarbdev is null doesn't that mean that the device does not exist?
so we should return -ENODEV in that case?

thanks,
Dafna

>   		}
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 1467ba1e4417..4d7809432239 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -602,7 +602,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   		}
>   
>   		plarbdev = of_find_device_by_node(larbnode);
> -		if (!plarbdev) {
> +		if (!plarbdev || !plarbdev->dev.driver) {
>   			of_node_put(larbnode);
>   			return -EPROBE_DEFER;
>   		}
> 
