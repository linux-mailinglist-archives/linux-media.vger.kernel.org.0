Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2583FD3F3
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 08:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242348AbhIAGrq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 1 Sep 2021 02:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242074AbhIAGrp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 02:47:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC23CC061575
        for <linux-media@vger.kernel.org>; Tue, 31 Aug 2021 23:46:49 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mLK1B-00060n-Qe; Wed, 01 Sep 2021 08:46:41 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mLK18-000317-F6; Wed, 01 Sep 2021 08:46:38 +0200
Message-ID: <718b22d5ca0f8afa2f2815287e7aa13d34d9b0ec.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx-pxp: Make use of the helper function
 devm_platform_ioremap_resource()
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 01 Sep 2021 08:46:38 +0200
In-Reply-To: <20210901055147.6779-1-caihuoqing@baidu.com>
References: <20210901055147.6779-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-09-01 at 13:51 +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/imx-pxp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
> index 4321edc0c23d..723b096fedd1 100644
> --- a/drivers/media/platform/imx-pxp.c
> +++ b/drivers/media/platform/imx-pxp.c
> @@ -1636,7 +1636,6 @@ static int pxp_soft_reset(struct pxp_dev *dev)
>  static int pxp_probe(struct platform_device *pdev)
>  {
>  	struct pxp_dev *dev;
> -	struct resource *res;
>  	struct video_device *vfd;
>  	int irq;
>  	int ret;
> @@ -1652,8 +1651,7 @@ static int pxp_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	dev->mmio = devm_ioremap_resource(&pdev->dev, res);
> +	dev->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(dev->mmio))
>  		return PTR_ERR(dev->mmio);

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
