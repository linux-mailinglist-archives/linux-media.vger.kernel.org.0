Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7C5635215
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 09:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236411AbiKWIQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 03:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236462AbiKWIQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 03:16:50 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B5CFAEA4
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 00:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669191409; x=1700727409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NZCDaOgGqR15Rss+cTBixCco/QJioCdnpkpTpAV1J/k=;
  b=Vjcd/M6yCMjFaockJaZ35M87onLMTK9IV5qSLGzVp1G+V16DjKgFwzUk
   IdxfKrinJMGV0RcSXjVNKk10XOBswxmfqC87hxtOyVkFq5U+PnTXYY73b
   nGWPx+za0F1AHVrbi01GY3FGCT1AlAC5bkAXmiwrhco0bi4fwHnSYQHRE
   RiEBPFkhkH32bfG9rBfwDoJ1qTAFBlcyqWhGXfQUW6ckC2CzjkNsqm2xi
   mzZAMhyNs+5IHZMk5K7JYd97qCQ/+uNPPOPJxKsJ5osKjpYZwX1FPB+B8
   0L5gbhfQwrp1vdj7ei0vUeEuUapvFREJFUCn6LXnU++qFArBx2daJgZY6
   A==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27527231"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 09:16:46 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 09:16:46 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 09:16:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669191406; x=1700727406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NZCDaOgGqR15Rss+cTBixCco/QJioCdnpkpTpAV1J/k=;
  b=ckwvJpAU/V4GSyRsS6cZogpxCONbOFLd5SWubk3jIzX5oh0wv2jCh2px
   TGop70i2ymxpXJSeAuzmv6Ts/O9WtQe7rtcK9twkTkEXwSIv8xyCkwB/I
   D9FVZ5ntbYrIIK4cIaR9oO7sInlfxNXBP/Kvda/NV9c+Ey3lDMDMQ/Tbx
   5ytmkdfRpYWe1pBViZAnt9wyAbN0Ojm1WdDnMDnh/6qNLTBw+3oAstPgO
   dl6zMdIjspc91J2rr2DCFN4macQjZG6fIneYNe2wKY2RZV1ErOtIJ1AGw
   PdAW/h0RSVf77rk7tNfRBvA4Rmugp2zO3eSWOKbeZZzPlwxyLFF18aAIe
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27527230"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 09:16:45 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5CE41280056;
        Wed, 23 Nov 2022 09:16:45 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 09/15] media: i2c: imx290: Use dev_err_probe()
Date:   Wed, 23 Nov 2022 09:16:45 +0100
Message-ID: <9030369.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-10-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-10-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

thanks for working on this.

Am Dienstag, 22. November 2022, 23:32:44 CET schrieb Laurent Pinchart:
> Improve error handling in the probe() function with dev_err_probe().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 655f676df3d2..d423860402fd 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1222,10 +1222,9 @@ static int imx290_probe(struct i2c_client *client)
> 
>  	/* get system clock (xclk) */
>  	imx290->xclk = devm_clk_get(dev, "xclk");
> -	if (IS_ERR(imx290->xclk)) {
> -		dev_err(dev, "Could not get xclk");
> -		return PTR_ERR(imx290->xclk);
> -	}
> +	if (IS_ERR(imx290->xclk))
> +		return dev_err_probe(dev, PTR_ERR(imx290->xclk),
> +				     "Could not get xclk");
> 
>  	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>  				       &xclk_freq);
> @@ -1248,17 +1247,14 @@ static int imx290_probe(struct i2c_client *client)
>  	}
> 
>  	ret = imx290_get_regulators(dev, imx290);
> -	if (ret < 0) {
> -		dev_err(dev, "Cannot get regulators\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Cannot get regulators\n");
> 
>  	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
>  						   
GPIOD_OUT_HIGH);
> -	if (IS_ERR(imx290->rst_gpio)) {
> -		dev_err(dev, "Cannot get reset gpio\n");
> -		return PTR_ERR(imx290->rst_gpio);
> -	}
> +	if (IS_ERR(imx290->rst_gpio))
> +		return dev_err_probe(dev, PTR_ERR(imx290->rst_gpio),
> +				     "Cannot get reset gpio\n");
> 
>  	mutex_init(&imx290->lock);

Oh, you already addressed my dev_err_probe comments on the last patch :)
For this one:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



