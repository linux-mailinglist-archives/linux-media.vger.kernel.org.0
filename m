Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC381A1807
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 00:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgDGWYT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 18:24:19 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36630 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgDGWYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 18:24:15 -0400
Received: by mail-lj1-f195.google.com with SMTP id b1so5542201ljp.3
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 15:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/Z0bzv011gEX2sHo6uX4WWQiqWBbnMhRVCknB14w2U4=;
        b=jHLjOjAT+29MuGhA+MC1I+OB0ystsBrjNqbb8gc/L1zDDaj0hl0Qoq9jArYGRdZUp1
         +w5w2dCYGg2O9x3aEAUrZNKOGyqKkjqRHs6f6KjY+fT4uWN2KvTm3Y32cZMrOFlp7xP3
         UhviGPuTuwUtK/D6jaXciifp75WXR1r/3R3Fc4qEvMadBLESKfUk+mMJeJidVA5Ty1/X
         yUtut3J/reyjEZUPtkY6TZlUU5DHB0EqIrzbzABJOBHDM4bMuCTgM4B1YcCosmoumOBi
         4T+um+vkjiY+6mFgdNXXhecVT+A5Ukr+YMM04NNVIve0+gWUYQ5+RlshqOr+kjRwjzay
         z7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/Z0bzv011gEX2sHo6uX4WWQiqWBbnMhRVCknB14w2U4=;
        b=FnGVpDG65L1o5oM28O6y/p5vXgvphqEwtUNzJGW2jEKv00CzME26NMGzIv7NozLoRj
         RX2zSm3nrSnoommVRXcmUyTbgNz66yOwe6axKwdbu+1fWNM+zGNI/HZZ0S6eq5mZG7ZP
         oRl29M6jIdnk+cnQiooPTgxXmqKkp9DF/KjMqh+MBuI2xVJnOJ27+k3yLDWpTXfg7uyn
         yhYFKXZ7e+hQiXOl4wGEETxTsw8f/SMCm7EBi0u9/Pg0NoIAiBUpkuoodda64RprQ8It
         foSOhMwUeJ/8kxJCmyCbAA/oneWdH1V6qlfr8dMa4T3bEjtS0OQUDbOSYW+tJ4q4jebb
         oZBQ==
X-Gm-Message-State: AGi0Pub9XQMToCVZA94aNVqPqtLNJD+rngXsIs9uiu/TbaBvanp/NOiR
        CICkayG31FN/Yqh+CP8+/Wqcuw==
X-Google-Smtp-Source: APiQypKKv2zueNnMNmant2sAJ3r2n48JSfWutPpW8dni0/WC8Hsde2KKIkdeX4uYLPekNg+OHmXZPg==
X-Received: by 2002:a05:651c:50a:: with SMTP id o10mr2826026ljp.163.1586298253612;
        Tue, 07 Apr 2020 15:24:13 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id x17sm6871751lfg.36.2020.04.07.15.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 15:24:13 -0700 (PDT)
Date:   Wed, 8 Apr 2020 00:24:12 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] media: i2c: adv748x: Implement get_mbus_config
Message-ID: <20200407222412.GT1716317@oden.dyn.berto.se>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200313144035.401430-4-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your patch.

On 2020-03-13 15:40:34 +0100, Jacopo Mondi wrote:
> Implement the newly introduced get_mbus_config operation to report the
> number of currently used data lanes on the MIPI CSI-2 interface.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 2091cda50935..f13563da3ff3 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -214,9 +214,24 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
> +					struct v4l2_mbus_pad_config *config)
> +{
> +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> +
> +	if (pad != ADV748X_CSI2_SOURCE)
> +		return -EINVAL;
> +
> +	config->type = V4L2_MBUS_CSI2_DPHY;
> +	config->csi2_dphy.data_lanes = tx->active_lanes;
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
>  	.get_fmt = adv748x_csi2_get_format,
>  	.set_fmt = adv748x_csi2_set_format,
> +	.get_mbus_config = adv748x_csi2_get_mbus_config,
>  };
>  
>  /* -----------------------------------------------------------------------------
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
