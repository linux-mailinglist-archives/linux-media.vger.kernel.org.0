Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4AF3CCE3A
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 09:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbhGSHJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 03:09:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60836 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbhGSHJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 03:09:44 -0400
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E4B571F422EC;
        Mon, 19 Jul 2021 08:06:43 +0100 (BST)
Subject: Re: [PATCH v2, 01/14] media: mtk-vcodec: Get numbers of register
 bases from DT
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Collabora Kernel ML <kernel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
 <20210717081233.7809-2-yunfei.dong@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <77ec9eec-0b93-102c-4e6e-a1a491d0ae7a@collabora.com>
Date:   Mon, 19 Jul 2021 09:06:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081233.7809-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 17.07.21 10:12, Yunfei Dong wrote:
> Different platform may has different numbers of register bases. Gets the
> numbers of register bases from DT (sizeof(u32) * 4 bytes for each).
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v2: no changes
> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 38 ++++++++++++++-----
>   1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 55ae198dbcf9..d3f34cd04759 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -78,6 +78,31 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
>   	return IRQ_HANDLED;
>   }
>   
> +static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
> +{
> +	struct platform_device *pdev = dev->plat_dev;
> +	int reg_num, i, ret = 0;
> +
> +	/* Sizeof(u32) * 4 bytes for each register base. */
> +	reg_num = of_property_count_elems_of_size(pdev->dev.of_node, "reg",
> +		sizeof(u32) * 4);

'reg_num' can also be negative if the 'of_..' function fails. So this case should
also be checked

> +	if (!reg_num || reg_num > NUM_MAX_VDEC_REG_BASE) {
> +		dev_err(&pdev->dev, "Invalid register property size: %d\n", reg_num);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < reg_num; i++) {
> +		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
> +		if (IS_ERR((__force void *)dev->reg_base[i])) {
> +			ret = PTR_ERR((__force void *)dev->reg_base[i]);
> +			break;

you can replace this two lines with "return PTR_ERR((__force void *)dev->reg_base[i]);"

thanks,
Dafna

> +		}
> +		mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
> +	}
> +
> +	return ret;
> +}
> +
>   static int fops_vcodec_open(struct file *file)
>   {
>   	struct mtk_vcodec_dev *dev = video_drvdata(file);
> @@ -206,7 +231,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   	struct resource *res;
>   	phandle rproc_phandle;
>   	enum mtk_vcodec_fw_type fw_type;
> -	int i, ret;
> +	int ret;
>   
>   	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>   	if (!dev)
> @@ -238,14 +263,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		goto err_dec_pm;
>   	}
>   
> -	for (i = 0; i < NUM_MAX_VDEC_REG_BASE; i++) {
> -		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
> -		if (IS_ERR((__force void *)dev->reg_base[i])) {
> -			ret = PTR_ERR((__force void *)dev->reg_base[i]);
> -			goto err_res;
> -		}
> -		mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
> -	}
> +	ret = mtk_vcodec_get_reg_bases(dev);
> +	if (ret)
> +		goto err_res;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>   	if (res == NULL) {
> 
