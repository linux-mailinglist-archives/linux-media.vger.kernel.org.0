Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE89400132
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 16:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349369AbhICO0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 10:26:47 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:35765 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbhICO0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 10:26:47 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id D3944240010;
        Fri,  3 Sep 2021 14:25:44 +0000 (UTC)
Date:   Fri, 3 Sep 2021 16:26:33 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: renesas-ceu: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <20210903142633.iavhmk3t7zmqonbd@uno.localdomain>
References: <20210901055540.7479-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901055540.7479-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Cai,

On Wed, Sep 01, 2021 at 01:55:39PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/renesas-ceu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> index 9376eb363748..2e8dbacc414e 100644
> --- a/drivers/media/platform/renesas-ceu.c
> +++ b/drivers/media/platform/renesas-ceu.c
> @@ -1628,7 +1628,6 @@ static int ceu_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	const struct ceu_data *ceu_data;
>  	struct ceu_device *ceudev;
> -	struct resource *res;
>  	unsigned int irq;
>  	int num_subdevs;
>  	int ret;
> @@ -1644,8 +1643,7 @@ static int ceu_probe(struct platform_device *pdev)
>  	spin_lock_init(&ceudev->lock);
>  	mutex_init(&ceudev->mlock);
>
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ceudev->base = devm_ioremap_resource(dev, res);
> +	ceudev->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ceudev->base)) {
>  		ret = PTR_ERR(ceudev->base);
>  		goto error_free_ceudev;
> --
> 2.25.1
>
