Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCDD57A0786
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 16:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240180AbjINOkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 10:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236369AbjINOkd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 10:40:33 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E6AE61A5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 07:40:28 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF6DE1FB;
        Thu, 14 Sep 2023 07:41:05 -0700 (PDT)
Received: from [10.57.93.68] (unknown [10.57.93.68])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 513A43F738;
        Thu, 14 Sep 2023 07:40:26 -0700 (PDT)
Message-ID: <c15e4dd9-4250-0aac-4c03-5c1618288840@arm.com>
Date:   Thu, 14 Sep 2023 15:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 06/13] media: rockchip: rga: set dma mask to 32 bits
Content-Language: en-GB
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
 <20230914-rockchip-rga-multiplanar-v1-6-abfd77260ae3@pengutronix.de>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-6-abfd77260ae3@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2023-09-14 13:40, Michael Tretter wrote:
> The RGA DMA descriptor list contains only 32-bit addresses. Set the
> dma_mask to only allocate memory that is addressable by the descriptors.
> 
> This prevents errors when preparing vb2 buffers that were allocated by
> the RGA. Imported buffers may still fail the preparation, as they may be
> allocated above the 4 GB boundary.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>   drivers/media/platform/rockchip/rga/rga.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index f18fccc7b204..149deb1f1e03 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -824,6 +824,12 @@ static int rga_probe(struct platform_device *pdev)
>   		goto err_put_clk;
>   	}
>   
> +	ret = dma_set_mask(rga->dev, DMA_BIT_MASK(32));

You want dma_set_mask_and_coherent(), given that you are using coherent 
allocations as well. The driver's getting away with it since the default 
masks happen to be 32-bit anyway, but it's better to be explicit.

Thanks,
Robin.

> +	if (ret) {
> +		dev_err(rga->dev, "32-bit DMA not supported");
> +		goto err_put_clk;
> +	}
> +
>   	ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
>   	if (ret)
>   		goto err_put_clk;
> 
