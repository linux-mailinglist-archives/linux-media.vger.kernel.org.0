Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B206D0818
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 16:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232404AbjC3OWV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 10:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjC3OWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 10:22:12 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799F0CDD6
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 07:21:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id h25so24733811lfv.6
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680186103;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZvTRWMF7/T0WORHr47mJyaqCmNwg2xrooAflTpNfBs=;
        b=7yga/rNeiOQI1G+vCKlrD/yBinf905YNrF4q2qJzVZq4lSpnW1TeMEGSn+wscJW8NR
         v8+BwqJ557kMZxOQXWAukf8m8aRH4VSZtiMcH2f5OrZaj+ghTq9CE9oZeQwOIKa0A880
         jQsVQ6YH/pFN1iVT0nmkobfpWtYm3lKtO4YXF2Hn4zI/M1xIHHGumzByTkymq4luUjdP
         mGuKiFOm/YNLlV6+RDBQY64KosOEIy3yuFVemIq2WaAtj9U6TFP7JRvQJ7vSDkbhf3a7
         uuUFGJ43ci6IwsMy2yDRUkZR2Krunx2DPaetjf/Dg4RbBNA+5B2LH4N504vxKs900uLw
         Kmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680186103;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZvTRWMF7/T0WORHr47mJyaqCmNwg2xrooAflTpNfBs=;
        b=4rz7JUn0Dz7AmOkcHckPd+Z1wTwC+o5IeoLrMarprHQqWyjkSkcL3nLwwbW7WUdVfr
         a9sgvPpsF6LsvtNVigL12m5VL1OWGWtJwgn17l1q/akpJYvI5vyxBXjLM2g6KzHZgO4O
         ge8Fxl59dQMp0bMZ7j2wpLQItHKiijx6/XDHHTXwWYLF4bXruUPGINptK6/MvmMEjf/X
         qOldPFWWCkRKwZ8DGowEboBSB2yYoUkE6nhkhIqsG/pcxmxeOXciG3lTTsNwLqq8kl7G
         GbBVuiGeIHMtDfBw4NR/Ov0q12+4UYg86XMO34QjhDP+4wQkkWExQEeauHJfXYU7o7sj
         SoAA==
X-Gm-Message-State: AAQBX9f2i3sZfQt+r1ftZ045C2GpznZT0jQ333d10vjx6v8rtemdMTsS
        PJi34gpKNOBqh3ZhNSeZlMzqVQ==
X-Google-Smtp-Source: AKy350YECrkik6R+Kynv4HmFYKRQI8IuMi2oBMuYeAMQDu2ZkiBEE31wDNbkec+44kyQ715XQh1CTQ==
X-Received: by 2002:ac2:42c3:0:b0:4dd:98bd:411a with SMTP id n3-20020ac242c3000000b004dd98bd411amr6722286lfl.51.1680186102691;
        Thu, 30 Mar 2023 07:21:42 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id f24-20020a19ae18000000b004eb0f3b33a0sm1687678lfc.0.2023.03.30.07.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:21:42 -0700 (PDT)
Date:   Thu, 30 Mar 2023 16:21:41 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Add support for 3-lane C-PHY
Message-ID: <ZCWa9XbK5qlm67rz@oden.dyn.berto.se>
References: <20230211144614.3816247-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211144614.3816247-1-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Gentle ping on this patch.

On 2023-02-11 15:46:14 +0100, Niklas Söderlund wrote:
> Add basic support for outputting the test patterns on a 3-lane CSI-2
> C-PHY bus. As the driver only can output frames form its internal test
> pattern generator, enabling C-PHY output is as simple as setting the
> output mode to C-PHY instead of D-PHY.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/staging/media/max96712/max96712.c | 36 +++++++++++++++++++----
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 99b333b68198..d93dd985fb27 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -30,6 +30,7 @@ struct max96712_priv {
>  	struct regmap *regmap;
>  	struct gpio_desc *gpiod_pwdn;
>  
> +	bool cphy;
>  	struct v4l2_mbus_config_mipi_csi2 mipi;
>  
>  	struct v4l2_subdev sd;
> @@ -127,10 +128,18 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
>  	/* Select 2x4 mode. */
>  	max96712_write(priv, 0x8a0, 0x04);
>  
> -	/* Configure a 4-lane DPHY using PHY0 and PHY1. */
>  	/* TODO: Add support for 2-lane and 1-lane configurations. */
> -	/* TODO: Add support CPHY mode. */
> -	max96712_write(priv, 0x94a, 0xc0);
> +	if (priv->cphy) {
> +		/* Configure a 3-lane C-PHY using PHY0 and PHY1. */
> +		max96712_write(priv, 0x94a, 0xa0);
> +
> +		/* Configure C-PHY timings. */
> +		max96712_write(priv, 0x8ad, 0x3f);
> +		max96712_write(priv, 0x8ae, 0x7d);
> +	} else {
> +		/* Configure a 4-lane D-PHY using PHY0 and PHY1. */
> +		max96712_write(priv, 0x94a, 0xc0);
> +	}
>  
>  	/* Configure lane mapping for PHY0 and PHY1. */
>  	/* TODO: Add support for lane swapping. */
> @@ -332,8 +341,9 @@ static int max96712_parse_dt(struct max96712_priv *priv)
>  {
>  	struct fwnode_handle *ep;
>  	struct v4l2_fwnode_endpoint v4l2_ep = {
> -		.bus_type = V4L2_MBUS_CSI2_DPHY
> +		.bus_type = V4L2_MBUS_UNKNOWN,
>  	};
> +	unsigned int supported_lanes;
>  	int ret;
>  
>  	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(&priv->client->dev), 4,
> @@ -350,8 +360,22 @@ static int max96712_parse_dt(struct max96712_priv *priv)
>  		return -EINVAL;
>  	}
>  
> -	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != 4) {
> -		dev_err(&priv->client->dev, "Only 4 data lanes supported\n");
> +	switch (v4l2_ep.bus_type) {
> +	case V4L2_MBUS_CSI2_DPHY:
> +		supported_lanes = 4;
> +		priv->cphy = false;
> +		break;
> +	case V4L2_MBUS_CSI2_CPHY:
> +		supported_lanes = 3;
> +		priv->cphy = true;
> +		break;
> +	default:
> +		dev_err(&priv->client->dev, "Unsupported bus-type %u\n", v4l2_ep.bus_type);
> +		return -EINVAL;
> +	}
> +
> +	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != supported_lanes) {
> +		dev_err(&priv->client->dev, "Only %u data lanes supported\n", supported_lanes);
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.39.1
> 

-- 
Kind Regards,
Niklas Söderlund
