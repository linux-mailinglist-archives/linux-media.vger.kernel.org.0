Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 316E5635223
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 09:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236487AbiKWIS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 03:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236506AbiKWISy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 03:18:54 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0B3D229A
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669191530; x=1700727530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5fY1MfdL5UdkQbz08Z2m2tWOH5yXFmEyqgZaM9i4OIE=;
  b=DmhMLgjH8teEpiq+O2MgHRo6edG09FwOIi+/EFYpcvSb1YHQeNvdaWXm
   e+GwWpmqlIBlf5VoGQfYLKp1Oe//x/fU8pkNn2VBBSuEybmLiSXxJQYt1
   pOS3kn0i1dktZUadKlUCLvgxVyhXJqJn6Z23xvDEnsHc2U+a6sCOb4GbA
   4blVEuBmst/UiggqS+jo9UuA5jCnE3J92Wrnhei7ngFnmunu/8HrLpENv
   m3zUTcg6CJUhRYdScrpJ2BZU6Ff7vUQL3dVDETGNFPu8nclS7Cc2VwQaz
   eGfA8L3P/itnwUamr5LQn16u5+ei4OmPmlh61RoTxWUybIM+Vioem2e7S
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27527335"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 09:18:48 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 09:18:48 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 09:18:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669191528; x=1700727528;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5fY1MfdL5UdkQbz08Z2m2tWOH5yXFmEyqgZaM9i4OIE=;
  b=CEuLt2HSeQg3k1Iu4qLE2zxYsO2IbYmpY8VM9/fSwHeTaYPJQHMWJyr4
   zIZPqEEevNhmyZT0hj3qcObhvVq7DqbVjFtSSqQgul3MJ3cDQh0g8hNLL
   Ae0HZpWkFmbr+Xi2yhGvCZJ6Cs0ebYq0mrxUbmsfaXXj41K3eWz/yJQDH
   zBT6JAic+foO96vhR0FO4yyhBoNgpAR/V8vyL14sKOK9+QuhIfYPzSU2v
   7o4QpHMO7ohgq/srUVcn5teH/zYk/s1BBFGtytuXr0wYIPkZuYexMS/TW
   awlk0PV0p3cHcLIABdMMxB3HjIQTut+JI71+qPkLk8KqyDA4+WvoISX5D
   A==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27527334"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 09:18:47 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C560E280056;
        Wed, 23 Nov 2022 09:18:47 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 10/15] media: i2c: imx290: Factor out clock initialization to separate function
Date:   Wed, 23 Nov 2022 09:18:49 +0100
Message-ID: <5783462.MhkbZ0Pkbq@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-11-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-11-laurent.pinchart@ideasonboard.com>
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

Am Dienstag, 22. November 2022, 23:32:45 CET schrieb Laurent Pinchart:
> Move the external clock initialization code from probe() to a separate
> function to improve readability. No functional change intended.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 57 +++++++++++++++++++++++---------------
>  1 file changed, 35 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index d423860402fd..848de4c90d3b 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1117,6 +1117,34 @@ static int imx290_get_regulators(struct device *dev,
> struct imx290 *imx290) imx290->supplies);
>  }
> 
> +static int imx290_init_clk(struct imx290 *imx290)
> +{
> +	u32 xclk_freq;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(dev_fwnode(imx290->dev),
> +				       "clock-frequency", &xclk_freq);
> +	if (ret) {
> +		dev_err(imx290->dev, "Could not get xclk frequency\n");
> +		return ret;
> +	}
> +
> +	/* external clock must be 37.125 MHz */
> +	if (xclk_freq != 37125000) {
> +		dev_err(imx290->dev, "External clock frequency %u is not 
supported\n",
> +			xclk_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = clk_set_rate(imx290->xclk, xclk_freq);
> +	if (ret) {
> +		dev_err(imx290->dev, "Could not set xclk frequency\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * Returns 0 if all link frequencies used by the driver for the given
> number * of MIPI data lanes are mentioned in the device tree, or the value
> of the @@ -1201,7 +1229,6 @@ static int imx290_probe(struct i2c_client
> *client) {
>  	struct device *dev = &client->dev;
>  	struct imx290 *imx290;
> -	u32 xclk_freq;
>  	u32 chip_id;
>  	int ret;
> 
> @@ -1220,32 +1247,12 @@ static int imx290_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
> 
> -	/* get system clock (xclk) */
> +	/* Acquire resources. */
>  	imx290->xclk = devm_clk_get(dev, "xclk");
>  	if (IS_ERR(imx290->xclk))
>  		return dev_err_probe(dev, PTR_ERR(imx290->xclk),
>  				     "Could not get xclk");
> 
> -	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> -				       &xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "Could not get xclk frequency\n");
> -		return ret;
> -	}
> -
> -	/* external clock must be 37.125 MHz */
> -	if (xclk_freq != 37125000) {
> -		dev_err(dev, "External clock frequency %u is not 
supported\n",
> -			xclk_freq);
> -		return -EINVAL;
> -	}
> -
> -	ret = clk_set_rate(imx290->xclk, xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "Could not set xclk frequency\n");
> -		return ret;
> -	}
> -
>  	ret = imx290_get_regulators(dev, imx290);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Cannot get regulators\n");
> @@ -1256,8 +1263,14 @@ static int imx290_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(imx290->rst_gpio),
>  				     "Cannot get reset gpio\n");
> 
> +	/* Initialize external clock frequency. */
> +	ret = imx290_init_clk(imx290);
> +	if (ret)
> +		return ret;
> +
>  	mutex_init(&imx290->lock);
> 
> +	/* Initialize and register subdev. */
>  	ret = imx290_subdev_init(imx290);
>  	if (ret)
>  		goto err_mutex;

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



