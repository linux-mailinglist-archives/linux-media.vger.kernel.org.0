Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B2E2D850
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 10:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfE2I4y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 04:56:54 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:38349 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725948AbfE2I4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 04:56:53 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VuO8h4USX3qlsVuO9hsPNJ; Wed, 29 May 2019 10:56:51 +0200
Subject: Re: [PATCH 4/4] media: xilinx: fix leaked of_node references
To:     Wen Yang <wen.yang99@zte.com.cn>, linux-kernel@vger.kernel.org
Cc:     wang.yi59@zte.com.cn, Patrice Chotard <patrice.chotard@st.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
 <1557126318-21487-5-git-send-email-wen.yang99@zte.com.cn>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e557b5a7-524b-56e0-0642-7f9c04c136f9@xs4all.nl>
Date:   Wed, 29 May 2019 10:56:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557126318-21487-5-git-send-email-wen.yang99@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCNcQwo2tuDr/le+vUGvfG5jmsmcDf9YkYYz99PHycHPmKjCwQlYKvxglDv57a3asuiBY5gKxAEKqAKjFc3lu2ZDtAslmARGu7eN1mc1tICkwrBtrRHf
 jETldO7ENIaH2fYtCZa/jD7AxE9q1CAbUGMt1a8I5v5wFd7bSIxyT7b/3sKSZp7oJMDyr6CUNt6HoGn2YWiU5+GcUsoXjpM8Pc+shfRL1wxAx3m4MqOPgmB8
 nsusfRls9FAQ0N3gedQv9uF1D0i7yN02Xg0g5gDG4nGL2N7GiZ2FQPIaW+ie4kwQ/Gj2ZsAegb4rK8gMy8dhNhKhysa5bTmT2uKO+ReHJJ2w5he2Csd/Vl4p
 l8l28GeEUPq0xeflpZ2iE0cHY81U0zQfutkAM7pGNxk5AEGrsR0y6xpoXw9981qK4kklNbnqvb3aVKIdYUCwmTCofERU0yrjY4lk25P+4JpgzTEZHdnaMuH4
 nl6AbgRZYZoa66bsIu3U2qHzj2GHmXFvoJIW23v+ACJSAD8d9g403vBZc/tvdYSdn2OFqot0GZg0YegL02ignZKzTGObZ3Je5nqDEh9PuWlx4KeGDDwKdwqI
 zVaalO86OUNbdiaWzg8SWOK9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/6/19 9:05 AM, Wen Yang wrote:
> The call to of_get_child_by_name returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
> 
> Detected by coccinelle with the following warnings:
> drivers/media/platform/xilinx/xilinx-vipp.c:487:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 477, but without a corresponding object release within this function.
> drivers/media/platform/xilinx/xilinx-vipp.c:491:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 477, but without a corresponding object release within this function.
> 
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/media/platform/exynos4-is/fimc-is.c   | 1 +
>  drivers/media/platform/exynos4-is/media-dev.c | 1 +

Huh? This patch changes exynos4 as well, not just xilinx.

Please split this up into two patches, one for each driver.

>  drivers/media/platform/xilinx/xilinx-vipp.c   | 8 +++++---
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
> index 02da0b0..25df4c6 100644
> --- a/drivers/media/platform/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/exynos4-is/fimc-is.c
> @@ -809,6 +809,7 @@ static int fimc_is_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  
>  	is->pmu_regs = of_iomap(node, 0);
> +	of_node_put(node);
>  	if (!is->pmu_regs)
>  		return -ENOMEM;
>  
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index 463f2d8..a31dacf 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -450,6 +450,7 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
>  	else
>  		pd->fimc_bus_type = pd->sensor_bus_type;
>  
> +	of_node_put(np);
>  	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor))) {
>  		of_node_put(rem);
>  		return -EINVAL;
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index edce040..307717c 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -472,7 +472,7 @@ static int xvip_graph_dma_init(struct xvip_composite_device *xdev)
>  {
>  	struct device_node *ports;
>  	struct device_node *port;
> -	int ret;
> +	int ret = 0;
>  
>  	ports = of_get_child_by_name(xdev->dev->of_node, "ports");
>  	if (ports == NULL) {
> @@ -484,11 +484,13 @@ static int xvip_graph_dma_init(struct xvip_composite_device *xdev)
>  		ret = xvip_graph_dma_init_one(xdev, port);
>  		if (ret < 0) {
>  			of_node_put(port);
> -			return ret;
> +			goto out_put_node;

Just do a break here,

>  		}
>  	}
>  
> -	return 0;
> +out_put_node:

and drop this label.

> +	of_node_put(ports);
> +	return ret;
>  }
>  
>  static void xvip_graph_cleanup(struct xvip_composite_device *xdev)
> 

Regards,

	Hans
