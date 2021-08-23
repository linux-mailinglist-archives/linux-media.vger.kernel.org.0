Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88FD03F481D
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 12:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235897AbhHWKC3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 06:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbhHWKC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 06:02:29 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED04AC061575
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 03:01:46 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j4-20020a17090a734400b0018f6dd1ec97so969426pjs.3
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a83R/B9Lm/qgVoAlx8qnij+Ld74e3iDN4AlBrXWn3Xk=;
        b=YZAtljkGqZOJTdpRv6gq3v0m2WWXbAf3uPSSoPDrKNT7qchBAg69QpaFsao25+MF+w
         HtHHW7Xa3yHKhgbPyYjKcjpcuIY67qgVoPIzkF+0JqcXxgMhml9BkAsrUVsEi3Hvr/Yw
         ghdLNA3EoSYqVEhybvndDhd3KlSRoZ9Ctz7bZQJa4arwFKkUbcwzvwto9nAuG4oNm9sb
         U8Ln9GL1z6ZUsb3QdhRRTO5kqRTyf9FVQg/n+4XuaLKkZYzDbGN50oWhWdoDDT+5QYXG
         K2qKN2aKdOwgp6ik/5WSHkHQsbvQSBjSfbAXPs4dbrsrD2J+gdq+fzTXW9ESrBIurWGT
         Uu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a83R/B9Lm/qgVoAlx8qnij+Ld74e3iDN4AlBrXWn3Xk=;
        b=B8c0tElzTJOmNTEM19SPEob3WOwtE9olfHqTfbDXgK2gJxc19ePTALtE3R4RN/2xT5
         8wFiKXdKNQIz7B1zyuIuP8ff2S7OszdjIoyr6ySP0Du5+S1SJz0zQIE/CDBv0YdW929u
         YHD4ejgMK5csOH4LeFzc4SWwBYeCLAXINI/2kYUuWLcLx7mIEtNJnaI/AjNkL+1vsec1
         ZHVALIreP4oPCtyz1ydi7Nqd2ZMQroAhkFK6QHcwkpL4K0xotptURVb5EWExlZ6dDFJy
         oLVVuFgaojZX6Bf5QmKY39wybk3q1LsS6m8zhsF8vHbhHI9NxNxESVg9CuIHJzgVjbWT
         2aQw==
X-Gm-Message-State: AOAM533TxTZK5zX8sAGZsIyXQt1e3L3yG8dwybE78gcEo1c4wWbJlwFx
        2J6hl8cOc+UtUpWDbKW8z73t7g==
X-Google-Smtp-Source: ABdhPJz+hz17o/gcGS8iJUfbpeh537f4BVJ+xiYeyWgkJMD344jXhdt++YyEDBEi6/n1J0b8QZSPZQ==
X-Received: by 2002:a17:90a:4584:: with SMTP id v4mr19165244pjg.169.1629712906127;
        Mon, 23 Aug 2021 03:01:46 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:bc5a:af6a:3f08:a084])
        by smtp.gmail.com with ESMTPSA id g13sm15458871pfo.53.2021.08.23.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 03:01:45 -0700 (PDT)
Date:   Mon, 23 Aug 2021 18:01:40 +0800
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 2/9] media: mtk-vcodec: Use component framework to manage
 encoder hardware
Message-ID: <YSNyBE4yF6VDt3cC@google.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-3-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-3-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 16, 2021 at 06:59:27PM +0800, Irui Wang wrote:
> +static struct component_match *mtk_venc_match_add(struct mtk_vcodec_dev *dev)
> +{
> +	struct platform_device *pdev = dev->plat_dev;
> +	struct component_match *match = NULL;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mtk_venc_comp_ids); i++) {
> +		enum mtk_venc_hw_id comp_idx;
> +		struct device_node *comp_node;
> +		const struct of_device_id *of_id;
To be neat, prefer to define the variables outside of the loop (i.e. at the beginning of the function).

> +
> +		comp_node = of_find_compatible_node(NULL, NULL,
> +			mtk_venc_comp_ids[i].compatible);
> +		if (!comp_node)
> +			continue;
> +
> +		of_id = of_match_node(mtk_venc_comp_ids, comp_node);
> +		if (!of_id) {
> +			dev_err(&pdev->dev, "Failed to get match node\n");
Need to call of_node_put() actually, but see comment below.

> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		comp_idx = (enum mtk_venc_hw_id)of_id->data;
For getting the comp_idx, mtk_venc_comp_ids[i].data should be sufficient.  If so, of_match_node() can be removed so that the error handling path won't need to call of_node_put().

> @@ -239,6 +314,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	phandle rproc_phandle;
>  	enum mtk_vcodec_fw_type fw_type;
>  	int ret;
> +	struct component_match *match = NULL;
It doesn't need to be initialized.

> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (res == NULL) {
> -		dev_err(&pdev->dev, "failed to get irq resource");
> -		ret = -ENOENT;
> -		goto err_res;
> -	}
> +		res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +		if (!res) {
> +			dev_err(&pdev->dev, "failed to get irq resource");
> +			ret = -ENOENT;
> +			goto err_res;
> +		}
res is not used.  Can be removed in next version or in another patch.

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
> new file mode 100644
> index 000000000000..4e6a8a81ff67
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/module.h>
Would be better to maintain an order.

> +#include "mtk_vcodec_enc_hw.h"
> +#include "mtk_vcodec_enc.h"
Would be better to maintain an order.

> +static irqreturn_t mtk_enc_comp_irq_handler(int irq, void *priv)
> +{
> +	struct mtk_venc_comp_dev *dev = priv;
> +	struct mtk_vcodec_ctx *ctx;
> +	unsigned long flags;
> +	void __iomem *addr;
> +
> +	spin_lock_irqsave(&dev->master_dev->irqlock, flags);
> +	ctx = dev->curr_ctx;
> +	spin_unlock_irqrestore(&dev->master_dev->irqlock, flags);
> +	if (!ctx)
> +		return IRQ_HANDLED;
Here is a read lock for the curr_ctx.  The patch doesn't contain the write lock part.

I am not sure if the following situation would be happened:
1. curr_ctx is not NULL.
2. mtk_enc_comp_irq_handler() gets the curr_ctx.
3. The curr_ctx has been destroyed somewhere.
4. mtk_enc_comp_irq_handler() finds the ctx is not NULL so that it continues to execute.
5. Something wrong in latter mtk_enc_comp_irq_handler() because the ctx has been destroyed.

Does it make more sense to set curr_ctx to NULL to indicate the ownership has been transferred to mtk_enc_comp_irq_handler()?  For example:

spin_lock_irqsave(...);
ctx = dev->curr_ctx;
dev->curr_ctx = NULL;
spin_unlock_irqrestore(...);

> +static int mtk_venc_comp_bind(struct device *dev,
> +			      struct device *master, void *data)
> +{
> +	struct mtk_venc_comp_dev *comp_dev = dev_get_drvdata(dev);
> +	struct mtk_vcodec_dev *master_dev = data;
> +	int i;
> +
> +	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
> +		if (dev->of_node != master_dev->enc_comp_node[i])
> +			continue;
> +
> +		/*add component device by order*/
> +		if (comp_dev->core_id == MTK_VENC_CORE0)
> +			master_dev->enc_comp_dev[MTK_VENC_CORE0] = comp_dev;
> +		else if (comp_dev->core_id == MTK_VENC_CORE1)
> +			master_dev->enc_comp_dev[MTK_VENC_CORE1] = comp_dev;
> +		else
> +			return -EINVAL;
if (comp_dev->core_id < 0 || comp_dev->core_id >= MTK_VENC_HW_MAX)
    return -EINVAL;

master_dev->enc_comp_dev[comp_dev->core_id] = comp_dev;
