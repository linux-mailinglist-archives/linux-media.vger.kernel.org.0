Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17DF256A3DE
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 15:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235944AbiGGNkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 09:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235431AbiGGNj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 09:39:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC78718349
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 06:39:57 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E6CCD00;
        Thu,  7 Jul 2022 15:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657201196;
        bh=diixu0MQlBX3XaPIgi4rFyO41T70rAiMJ2feLfDRqZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pAbz2j2OeV4wOg6g2rDO13FKGdqzu7ZFMwlHcCVYxQvPdz2gXfiOq5ehdnQmGcIKD
         jR51zw0uerWj5VlurQfLSGeSOkb7xnsmuldIxu65ovRMnylmtQu+tUn1qIoqz6Ks/A
         3BGfKLxXI9RSGg7Ff0/eTm73qgNiIPR7F0BmIU14=
Date:   Thu, 7 Jul 2022 22:39:47 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2 06/55] media: rkisp1: Disable runtime PM in probe
 error path
Message-ID: <20220707133947.GK3886060@pyrite.rasen.tech>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-7-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-7-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jul 01, 2022 at 02:06:24AM +0300, Laurent Pinchart wrote:
> If the v4l2_device_register() call fails, runtime PM is left enabled.
> Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 97d569968285..248f0172ca62 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -523,7 +523,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>  
>  	ret = v4l2_device_register(rkisp1->dev, &rkisp1->v4l2_dev);
>  	if (ret)
> -		return ret;
> +		goto err_pm_runtime_disable;
>  
>  	ret = media_device_register(&rkisp1->media_dev);
>  	if (ret) {
> @@ -543,6 +543,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>  	media_device_unregister(&rkisp1->media_dev);
>  err_unreg_v4l2_dev:
>  	v4l2_device_unregister(&rkisp1->v4l2_dev);
> +err_pm_runtime_disable:
>  	pm_runtime_disable(&pdev->dev);
>  	return ret;
>  }
