Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0717455D0E
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 02:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbfFZApo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 20:45:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37226 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfFZApn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 20:45:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so623500wrr.4
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2019 17:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CcGx8nGGPgePvCK9a/1gq+R347fY4+PUfFITQmVv5zY=;
        b=JTaeS6aYXUpkEOATqp4ttVLgMJHakd/Ab8kS4N8nwk6ilbxwPY/6WBJkHWeK8MSmnU
         8bWqspwducw5+qVPRaP2AMyahVxqs5IJ89M+n9KaGdAtSNM8pWw0zt3jnEyO+dn6ZxrT
         o5cC4a3Qx+SlQ4+0nT/DFVIk5vMRm2SYZpAcZTqCA8qf67dI9iBguYepuV/Sq5HTadiN
         TeCJXSkl3/3KeWVAsn6BTqNMWrThAzl62j8RRP3wAodNoQxNZ+D3lecMAbly/l8EXwKZ
         TdJ8pky2KpPT+XpcHY0S3bSywAk9p7ZHTxkkVpgcnTSRW3SGXSxE8hGfg6SauLYCfEqV
         Zmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CcGx8nGGPgePvCK9a/1gq+R347fY4+PUfFITQmVv5zY=;
        b=Ri34CJg9ZFIIaNSfL2GLEXvDi/qfcstgMJY6AZ38R6uv7pTMcRpoLujX/LYVaTml9o
         yb7v34A/GD2s8bhfBUal8c9K3mHfWbY2BPSkKwrtH31ui/lNuXrrdj+f6yI1nXKPkEgT
         aqiDsQOG7PTIKZ7O1QFPGSA08xzpdH3ObM2WCJhfhT52MoZusDZpQgmVx2p/bWzx0WU3
         +N6Lcsau0kFwFRN40jWiz4y89wNAblK3fQ1dVi6OzqOhus4cNEe3XBnzKuw/MR6CGaYh
         T44C08spm3zI4Excr9tpuvbynYl7xlT8eJvy/UvGbI9/H9wuuPvDL6uu+781xBRxmkXc
         khtw==
X-Gm-Message-State: APjAAAVDP+g0bfF0kL5IZ7qrqaF9tZpe2PSJ2GOk4EUP4I4+P7nSa/Z4
        zspB7qBNFs6XfvhzXiB2G5I=
X-Google-Smtp-Source: APXvYqwUyR+j9VUvWm/sk4FEn9TMVy+zD/xSa/ERgUsIR3R6FjOdsXJC3Z/acOyF7f1vHhQXUSFK3g==
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr647294wre.340.1561509941440;
        Tue, 25 Jun 2019 17:45:41 -0700 (PDT)
Received: from [172.30.89.88] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id f13sm5943214wrt.89.2019.06.25.17.45.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 17:45:40 -0700 (PDT)
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20190625203945.28081-1-ezequiel@collabora.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <9a2efc26-0f39-595c-a058-da54c42049e4@gmail.com>
Date:   Tue, 25 Jun 2019 17:45:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190625203945.28081-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks, there was earlier talk of relaxing those CSI-2 bus startup 
requirements, but somehow it fell through the cracks.

Acked-by: Steve Longerbeam <slongerbeam@gmail.com>

On 6/25/19 1:39 PM, Ezequiel Garcia wrote:
> Not all sensors will be able to guarantee a proper initial state.
> This may be either because the driver is not properly written,
> or (probably unlikely) because the hardware won't support it.
>
> While the right solution in the former case is to fix the sensor
> driver, the real world not always allows right solutions, due to lack
> of available documentation and support on these sensors.
>
> Let's relax this requirement, and allow the driver to support stream start,
> even if the sensor initial sequence wasn't the expected.
> A warning is still emitted, so users should be hinted that something is off.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>   drivers/staging/media/imx/imx6-mipi-csi2.c | 33 ++++++----------------
>   1 file changed, 9 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index f29e28df36ed..10342434e797 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -243,7 +243,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
>   }
>   
>   /* Waits for low-power LP-11 state on data and clock lanes. */
> -static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
> +static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>   {
>   	u32 mask, reg;
>   	int ret;
> @@ -253,29 +253,21 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>   
>   	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
>   				 (reg & mask) == mask, 0, 500000);
> -	if (ret) {
> -		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
> -		return ret;
> -	}
> -
> -	return 0;
> +	if (ret)
> +		v4l2_warn(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
>   }
>   
>   /* Wait for active clock on the clock lane. */
> -static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
> +static void csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
>   {
>   	u32 reg;
>   	int ret;
>   
>   	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
>   				 (reg & PHY_RXCLKACTIVEHS), 0, 500000);
> -	if (ret) {
> -		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
> -			 reg);
> -		return ret;
> -	}
> -
> -	return 0;
> +	if (ret)
> +		v4l2_warn(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
> +			  reg);
>   }
>   
>   /* Setup the i.MX CSI2IPU Gasket */
> @@ -316,9 +308,7 @@ static int csi2_start(struct csi2_dev *csi2)
>   	csi2_enable(csi2, true);
>   
>   	/* Step 5 */
> -	ret = csi2_dphy_wait_stopstate(csi2);
> -	if (ret)
> -		goto err_assert_reset;
> +	csi2_dphy_wait_stopstate(csi2);
>   
>   	/* Step 6 */
>   	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
> @@ -327,14 +317,9 @@ static int csi2_start(struct csi2_dev *csi2)
>   		goto err_assert_reset;
>   
>   	/* Step 7 */
> -	ret = csi2_dphy_wait_clock_lane(csi2);
> -	if (ret)
> -		goto err_stop_upstream;
> -
> +	csi2_dphy_wait_clock_lane(csi2);
>   	return 0;
>   
> -err_stop_upstream:
> -	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
>   err_assert_reset:
>   	csi2_enable(csi2, false);
>   err_disable_clk:

