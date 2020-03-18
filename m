Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E682C18987E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 10:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbgCRJu2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 05:50:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41922 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgCRJu1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 05:50:27 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1AAFF9;
        Wed, 18 Mar 2020 10:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584525025;
        bh=uom6CNTKpjWXa8wXRgwyabs6AYLWSbGZ8qHV1TXKP6k=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=wlcyULUmr6sbfjSUgZKaHdbZe5H18MiH1Y//0Fw1wX4m+h7VmJi5A3sn4HkqOSSLx
         SM8nXmr4BAnVBdjNuKUjbXshJVKtx9te+Op1mRC25tqXURLlH1EPZXVCJGd8RUgR5D
         FNHcJN6AYMfvbimS2LoDCzopkDnZbddLnu5mhMsg=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 3/5] media: i2c: max9286: Parse overlap window value
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     hyunk@xilinx.com, manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
 <20200316202757.529740-4-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2b648a3f-f7e6-f994-ae2e-1746e2bbf4ba@ideasonboard.com>
Date:   Wed, 18 Mar 2020 09:50:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200316202757.529740-4-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/03/2020 20:27, Jacopo Mondi wrote:
> Parse the 'maxim,overlap-window' property value and cache its
> content to later program registers 0x63 and 0x64.
> 
> As specified by the bindings documentation, the property is mandatory as
> long as a default value cannot be established to guarantee DTB backward
> compatibility.

Well, we don't yet have the DTB bindings 'in' I don't believe so I don't
think we need to worry about backwards compatibility yet...

Oh, or do you mean in the future it wouldn't have to be mandatory
perhaps ...

> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 06edd8bd3e82..0357515860b2 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -117,6 +117,9 @@
>  #define MAX9286_REV_FLEN(n)		((n) - 20)
>  /* Register 0x49 */
>  #define MAX9286_VIDEO_DETECT_MASK	0x0f
> +/* Register 0x64 */
> +#define MAX9286_OVLP_WINDOWH_MASK	GENMASK(4, 0)
> +
>  /* Register 0x69 */
>  #define MAX9286_LFLTBMONMASKED		BIT(7)
>  #define MAX9286_LOCKMONMASKED		BIT(6)
> @@ -164,6 +167,8 @@ struct max9286_priv {
>  	unsigned int csi2_data_lanes;
>  	struct max9286_source sources[MAX9286_NUM_GMSL];
>  	struct v4l2_async_notifier notifier;
> +
> +	u32 overlap_window;
>  };
>  
>  static struct max9286_source *next_source(struct max9286_priv *priv,
> @@ -895,6 +900,11 @@ static int max9286_setup(struct max9286_priv *priv)
>  	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
>  		      MAX9286_FSYNCMETH_AUTO);
>  
> +	/* Configure overlap window. */
> +	max9286_write(priv, 0x63, priv->overlap_window);
> +	max9286_write(priv, 0x64, (priv->overlap_window >> 8) &
> +				  MAX9286_OVLP_WINDOWH_MASK);
> +
>  	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
>  	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
>  		      MAX9286_HVSRC_D14);
> @@ -1041,8 +1051,24 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	struct device_node *i2c_mux;
>  	struct device_node *node = NULL;
>  	unsigned int i2c_mux_mask = 0;
> +	int ret;
>  
>  	of_node_get(dev->of_node);
> +
> +	/*
> +	 * FIXM: Require overlap window value to be specified by DTS as long as

/FIXM/FIXME/

> +	 * the control function is not clarified. As soon as a default
> +	 * behaviour can be established drop this requirement, while older

/established/established,/
/requirement,/requirement/


> +	 * DTBs are guaranteed to be fully specified.
> +	 */
> +	ret = of_property_read_u32(dev->of_node, "maxim,overlap-window",
> +				   &priv->overlap_window);
> +	if (ret) {
> +		dev_err(dev, "Missing property \"maxim,overlap-window\"\n");
> +		of_node_put(dev->of_node);
> +		return -EINVAL;
> +	}
> +

Other wise, this looks fine except for my concerns and wondering if this
could be approached by defining a property of the requirements in the
serializer and parsing that in some form.


--
Kieran

>  	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
>  	if (!i2c_mux) {
>  		dev_err(dev, "Failed to find i2c-mux node\n");
> 

