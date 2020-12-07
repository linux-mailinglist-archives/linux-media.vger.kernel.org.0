Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCA42D0D49
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 10:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgLGJpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 04:45:24 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39173 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgLGJpX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 04:45:23 -0500
Received: by mail-wr1-f65.google.com with SMTP id c1so128065wrq.6;
        Mon, 07 Dec 2020 01:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VDaELBJNAHnJCXBlzzeKHCr2UreS9lliSm76y6uffoQ=;
        b=gy59ZTWN6ENG7kU1yOoJnRr/OAmnMjmu+9sruDAOlz/B/7PsqyWdOZw+pJy7NvfPXE
         1EoFT06PVwCF+C8RonZmNu+J46krGGsOapkmdZ2Zm/I9wntlWIYL6aNjacPefbxBxgY5
         wqvMtVTsxV4+RRIefudjuJYLsyuZtStISfjCsoTHx0WwVwavqZUbyLBmcfzY3wuXhqdV
         roL+3kiPrGXTgO601C0yFCfpD3E3jbDk+cDh37iZmPlg3Ic6/XtJqbIrQCPhE17C711H
         92KpQUZOlmx0OnRMkzrGD/xDCKeZFbzZl8g3489mKkdQaXP1xWUV3KtiIQq6lH+peK8n
         GDHg==
X-Gm-Message-State: AOAM531cEoE62yjfzncfGJkXUQzdkj+t7MTOTNDMvOCdaCpZ0/5Rv/jp
        WxIQqZtWaZ+m0uzDC3q+C70=
X-Google-Smtp-Source: ABdhPJwfT27kvUX1kkV3sfhoA2umu107YomTUVjpfX0vBm8TaA9H5pQnBuJGrMYFT9xoqapaV/Ri3w==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr18452293wrq.256.1607334281147;
        Mon, 07 Dec 2020 01:44:41 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id y7sm13652154wmb.37.2020.12.07.01.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 01:44:39 -0800 (PST)
Date:   Mon, 7 Dec 2020 10:44:38 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: imx219: add support for specifying
 clock-frequencies
Message-ID: <20201207094438.GA17448@kozik-lap>
References: <20201205183355.6488-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201205183355.6488-1-michael.srba@seznam.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Dec 05, 2020 at 07:33:53PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds 1% tolerance on input clock, similar to other camera sensor
> drivers. It also allows for specifying the actual clock in the device tree,
> instead of relying on it being already set to the right frequency (which is
> often not the case).

All this can be achieved with assigned-clocks-rate and basically you do
not add here value. At least not for DT-based systems. The supported
clock rates will be the same. The method of choosing frequency is
over-complicated comparing to simple assigned-clocks.

If this is for ACPI systems, please document in commit msg why you
cannot used assigned-clocks and choose this solution.

> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  drivers/media/i2c/imx219.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f64c0ef7a897..a8f05562d0af 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1443,13 +1443,26 @@ static int imx219_probe(struct i2c_client *client)
>  		return PTR_ERR(imx219->xclk);
>  	}
>  
> -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> -	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &imx219->xclk_freq);
> +	if (ret) {
> +		dev_err(dev, "could not get xclk frequency\n");
> +		return ret;
> +	}
> +
> +	/* this driver currently expects 24MHz; allow 1% tolerance */
> +	if (imx219->xclk_freq < 23760000 || imx219->xclk_freq > 24240000) {
>  		dev_err(dev, "xclk frequency not supported: %d Hz\n",
>  			imx219->xclk_freq);
>  		return -EINVAL;
>  	}
>  
> +	ret = clk_set_rate(imx219->xclk, imx219->xclk_freq);
> +	if (ret) {
> +		dev_err(dev, "could not set xclk frequency\n");
> +		return ret;
> +	}
> +
> +

No need for double line break.

Best regards,
Krzysztof
