Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3600D19C365
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 15:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732804AbgDBN6p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 09:58:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43490 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbgDBN6p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 09:58:45 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 425FA280125
Subject: Re: [PATCH 1/3] rkisp1: Get rid of unused variable warning
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>
References: <20200401213721.24173-1-ezequiel@collabora.com>
 <20200401213721.24173-2-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <86db2adb-d567-afc4-b675-49ad031cd75e@collabora.com>
Date:   Thu, 2 Apr 2020 10:58:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200401213721.24173-2-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/1/20 6:37 PM, Ezequiel Garcia wrote:
> If CONFIG_OF is not selected, the compiler will complain:
> 
> drivers/staging/media/rkisp1/rkisp1-dev.c: In function ‘rkisp1_probe’:
> drivers/staging/media/rkisp1/rkisp1-dev.c:457:22: warning: unused variable ‘node’ [-Wunused-variable]
>   457 |  struct device_node *node = pdev->dev.of_node;
> 
> Rework the code slightly and make the compiler happy.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-dev.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index b1b3c058e957..5e7e797aad71 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -454,7 +454,6 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  
>  static int rkisp1_probe(struct platform_device *pdev)
>  {
> -	struct device_node *node = pdev->dev.of_node;
>  	const struct rkisp1_match_data *clk_data;
>  	const struct of_device_id *match;
>  	struct device *dev = &pdev->dev;
> @@ -463,7 +462,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>  	unsigned int i;
>  	int ret, irq;
>  
> -	match = of_match_node(rkisp1_of_match, node);
> +	match = of_match_node(rkisp1_of_match, pdev->dev.of_node);
>  	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
>  	if (!rkisp1)
>  		return -ENOMEM;
> 
