Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCC66F515E
	for <lists+linux-media@lfdr.de>; Wed,  3 May 2023 09:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjECH1j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 May 2023 03:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjECH0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 May 2023 03:26:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3371944B2
        for <linux-media@vger.kernel.org>; Wed,  3 May 2023 00:26:01 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 200A44FE;
        Wed,  3 May 2023 09:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683098739;
        bh=7gdXz18Q4qYJUVLUqf+VPtmlQh/gtOEcN3Nq6/BElZY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ufvWrvFJElXGYCWcitoogbxIeRvbedUpXgy6K7uSmvz8ib1vjxr7xIqC+tB4Eyev7
         EBx9DAtzjqJiSuS3yryakF+wJ1FZJjNYpy72bf43yJAEMI70FO9azGqfW1+NekJuGR
         95XddvK0m8wk9T0Lcdt46pMbFHfIlH96/tVplDAg=
Date:   Wed, 3 May 2023 09:25:37 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 1/1] media: i2c: ov5670: Fix conditions for clock access
Message-ID: <wbs5vvxshzludcyopgwbsr6sj2m4wnkwa4jyseb7fgspoy636k@4sg4hv4h6c6c>
References: <20230502125150.720051-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230502125150.720051-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, May 02, 2023 at 03:51:50PM +0300, Sakari Ailus wrote:
> Leftovers from the earlier fix. Fix also the conditions for reading the
> clock-frequency property as well as accessing the clock.
>
> Fixes: 8df08ba4a331 ("media: ov5670: Fix probe on ACPI")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov5670.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index c5e783a06f06c..5437cf32a7b3a 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2661,9 +2661,9 @@ static int ov5670_probe(struct i2c_client *client)
>  	}
>
>  	ov5670->xvclk = devm_clk_get_optional(&client->dev, NULL);
> -	if (!IS_ERR_OR_NULL(ov5670->xvclk))
> +	if (!IS_ERR(ov5670->xvclk))

Can't clk_get_optional() return NULL in the case the clock source is not
available ?

Also, if !CONFIG_HAVE_CLK devm_clk_get_optional() returns 0.

I would then keep the _OR_NULL() part

>  		input_clk = clk_get_rate(ov5670->xvclk);
> -	else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
> +	else if (!ov5670->xvclk)

While here it's probably correct, we only want to read
"clock-frequency" if xvclk == NULL (when either the clock providere is
not there, or !CONFIG_HAVE_CLK)

>  		device_property_read_u32(&client->dev, "clock-frequency",
>  					 &input_clk);
>  	else

Everything else is an error (in example, -EPROBE_DEFER)

> --
> 2.30.2
>
