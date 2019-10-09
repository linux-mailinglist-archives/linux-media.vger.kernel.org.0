Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88CE3D0F3D
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 14:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731212AbfJIMys (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 08:54:48 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53976 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730757AbfJIMys (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 08:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=k5TxblSZf2IuXWK7WL2O815ZfD+uD0inXCDcm1S7FoI=; b=tisLDzszi0X6OWW++ayPEDQ7f
        tvCQ72kYedXEXf6w0+mmECXepSg1K8MaEsyhlJTytdr7SNYz8swKiItIvkn1GjXPi2QvvcHsv3rXm
        SydPOEfntcL4CX3DEmU3sakbmMPoRletbjyurt9jxlKOCZ6zsmYlpsGIcJJkBljDeQWudgCFWFAB5
        Z4ZAvnN+MzarzP+zQs/7+3MuG3DDdZ4fHtGPgGye+MqwiumJQIiOfkAZxWY6fs/ZMv3sEXmZa7MFp
        Ic92R18eKW8SqxCdn8DOFherE28vaETfQ7hCT6q7qAyoyQ5KMNUK9OM9WZyR9L8d67uvWkqwyYpLj
        5791pxU+Q==;
Received: from 177.205.100.4.dynamic.adsl.gvt.net.br ([177.205.100.4] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iIBUM-0002v7-4W; Wed, 09 Oct 2019 12:54:46 +0000
Date:   Wed, 9 Oct 2019 09:54:40 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/10] media: renesas-ceu: Use
 of_device_get_match_data()
Message-ID: <20191009095440.6e834ecf@coco.lan>
In-Reply-To: <20191004214334.149976-3-swboyd@chromium.org>
References: <20191004214334.149976-1-swboyd@chromium.org>
        <20191004214334.149976-3-swboyd@chromium.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri,  4 Oct 2019 14:43:26 -0700
Stephen Boyd <swboyd@chromium.org> escreveu:

> This driver can use the replacement API instead of calling
> of_match_device() and then dereferencing the pointer that is returned.
> This nicely avoids referencing the match table when it is undefined with
> configurations where CONFIG_OF=n.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: <linux-media@vger.kernel.org>
> Cc: <linux-renesas-soc@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> Please ack or pick for immediate merge so the last patch can be merged.

Feel free to merge it via your tree:

Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>


> 
>  drivers/media/platform/renesas-ceu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> index 197b3991330d..60518bbc2cd5 100644
> --- a/drivers/media/platform/renesas-ceu.c
> +++ b/drivers/media/platform/renesas-ceu.c
> @@ -1679,7 +1679,7 @@ static int ceu_probe(struct platform_device *pdev)
>  	v4l2_async_notifier_init(&ceudev->notifier);
>  
>  	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
> -		ceu_data = of_match_device(ceu_of_match, dev)->data;
> +		ceu_data = of_device_get_match_data(dev);
>  		num_subdevs = ceu_parse_dt(ceudev);
>  	} else if (dev->platform_data) {
>  		/* Assume SH4 if booting with platform data. */



Thanks,
Mauro
