Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A247E19CA9A
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 21:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732404AbgDBTv5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 15:51:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46466 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgDBTv5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 15:51:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 7AD4C297C74
Subject: Re: [PATCH v2 1/3] rkisp1: Get rid of unused variable warning
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Robin Murphy <robin.murphy@arm.com>
References: <20200402194504.5331-1-ezequiel@collabora.com>
 <20200402194504.5331-2-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <3f751060-8af4-3d7a-785a-c06c56736a08@collabora.com>
Date:   Thu, 2 Apr 2020 16:51:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200402194504.5331-2-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/2/20 4:45 PM, Ezequiel Garcia wrote:
> If CONFIG_OF is not selected, the compiler will complain:
> 
> drivers/staging/media/rkisp1/rkisp1-dev.c: In function ‘rkisp1_probe’:
> drivers/staging/media/rkisp1/rkisp1-dev.c:457:22: warning: unused variable ‘node’ [-Wunused-variable]
>   457 |  struct device_node *node = pdev->dev.of_node;
> 
> Rework the code slightly and make the compiler happy.
> 
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-dev.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index b1b3c058e957..3f6285709352 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -454,16 +454,17 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  
>  static int rkisp1_probe(struct platform_device *pdev)
>  {
> -	struct device_node *node = pdev->dev.of_node;
>  	const struct rkisp1_match_data *clk_data;
> -	const struct of_device_id *match;
>  	struct device *dev = &pdev->dev;
>  	struct rkisp1_device *rkisp1;
>  	struct v4l2_device *v4l2_dev;
>  	unsigned int i;
>  	int ret, irq;
>  
> -	match = of_match_node(rkisp1_of_match, node);
> +	clk_data = of_device_get_match_data(&pdev->dev);
> +	if (!clk_data)
> +		return -ENODEV;
> +
>  	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
>  	if (!rkisp1)
>  		return -ENOMEM;
> @@ -487,7 +488,6 @@ static int rkisp1_probe(struct platform_device *pdev)
>  	}
>  
>  	rkisp1->irq = irq;
> -	clk_data = match->data;
>  
>  	for (i = 0; i < clk_data->size; i++)
>  		rkisp1->clks[i].id = clk_data->clks[i];
> 
