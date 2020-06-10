Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F069C1F55F5
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 15:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgFJNkK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 09:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729333AbgFJNkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 09:40:09 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF51C08C5C1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 06:40:08 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id 9so2529265ljv.5
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 06:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jojD+3uUe7bHBI8ZVkJM6dh1a7rC0tnb8Kv/BKI8PTo=;
        b=b5f6XA/fiY2HPN4vYzcVzkAUkWWlbac9OR4vwSI9eZZhH7hQYFHFo3nYFiD+wYNsti
         ZrxOOnDt4qauD5COxxcBvgZ3Vs6pgZJNXe5dPS6j+OqZES54q0FzzwbF5LKR1H33ZeHU
         Wx6rVP1IP27O+6661zWSvB5VmfYvZBXab416roXWL4T25OLjta/SogK7bfDpE7rtcDbq
         VPwxuKsRRx3zlTc8xqGvuFw76OvMUyvVlAlNK/P6Nr4+G3aYsjukgVneUb4vGT8Wp8yM
         G139CmdC0Vvx2mm9AliIheBuJAJpNL8Qn36LzwcwOn2ZrUPw7lKJOVrpZOypTGzM9ssy
         E7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jojD+3uUe7bHBI8ZVkJM6dh1a7rC0tnb8Kv/BKI8PTo=;
        b=Z3Aw9XyCIyveZlwnLP53KDHgdpfjmkblpVQsTPTCATEe4CfF/eQFTFkKnBiF1tDWSQ
         sKhQ+fxJ65q5gnehNhWHxOMNCWTYtWjLCEV37NpEGKjuY6ElshAoOFgirtBINMPToJEM
         u0JsZ4m6ZapndKkxhqFi6Va9Zg8tKRdKoqF1RV9LNHBhNXJx3kEcBP8w0nEHX6cBwOag
         zOsGPIxxzW1AhjqiOrcj8p2x2EcW+OPgKE/noq2+zWdsEgyEtiABHzh0/cmPHpxfJMkz
         4nh+HenS1+S3uBngV6LksuSF4kzzt5jzqIjgekKV/qvRHIT1AOfTaAOiIHOaW+Rd7CXG
         H1Mg==
X-Gm-Message-State: AOAM530p7J8LP4TAtkxLee3xrLUK5RMJ1RZEmPBCbBdkBjpCZnsndzhU
        ZyyKnsc2NrHox9mIClwnKOVaXg==
X-Google-Smtp-Source: ABdhPJyd4XqO+sCdL5Qh0xknw6Cf5ui9omjHllMO2K3l/tivo28oGHxuif9gv7CufvHWPAr9HdAbbA==
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr1710965ljj.400.1591796405651;
        Wed, 10 Jun 2020 06:40:05 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id w144sm5828247lff.67.2020.06.10.06.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 06:40:05 -0700 (PDT)
Date:   Wed, 10 Jun 2020 15:40:04 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Suresh Udipi <sudipi@jp.adit-jv.com>
Cc:     mrodin@de.adit-jv.com, efriedrich@de.adit-jv.com,
        erosca@de.adit-jv.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        mchehab@kernel.org, michael@rodin.online,
        securitycheck@denso.co.jp,
        Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
Subject: Re: [PATCH v6] media: rcar-csi2: Correct the selection of hsfreqrange
Message-ID: <20200610134004.GA192296@oden.dyn.berto.se>
References: <20200605184426.GA5206@vmlxhi-121.adit-jv.com>
 <1591586703-32246-1-git-send-email-sudipi@jp.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1591586703-32246-1-git-send-email-sudipi@jp.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Suresh,

Thanks for your persistent work!

On 2020-06-08 12:25:03 +0900, Suresh Udipi wrote:
> hsfreqrange should be chosen based on the calculated mbps which
> is closer to the default bit rate  and within the range as per
> table[1]. But current calculation always selects first value which
> is greater than or equal to the calculated mbps which may lead
> to chosing a wrong range in some cases.
> 
> For example for 360 mbps for H3/M3N
> Existing logic selects
> Calculated value 360Mbps : Default 400Mbps Range [368.125 -433.125 mbps]
> 
> This hsfreqrange is out of range.
> 
> The logic is changed to get the default value which is closest to the
> calculated value [1]
> 
> Calculated value 360Mbps : Default 350Mbps  Range [320.625 -380.625 mpbs]
> 
> [1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]
> 
> Please note that According to Renesas in Table 25.9 the range for
> 220 default value is corrected as below
> 
>  |Range (Mbps)     |  Default  Bit rate (Mbps) |
>  -----------------------------------------------
>  | 197.125-244.125 |     220                   |
>  -----------------------------------------------
> 
> Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> 
> Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> ---
>  Changes in v2:
>   - Added the boundary check for the maximum bit rate.
> 
>   - Simplified the logic by remmoving range check
>     as only the closest default value covers most
>     of the use cases.
> 
>   - Aligning the commit message based on the above change
> 
> 
>  Changes in v3:
>     - Added max member from struct rcsi2_mbps_reg.
>       mbps varialbe cannot be removed from rcsi2_mbps_reg,
>       since this structure is reused for
>       phtw_mbps_h3_v3h_m3n/phtw_mbps_v3m_e3 where mbps is
>       used.
> 
> 
>    -  Update the walk of the array in rcsi2_set_phypll() so that it finds
>       the first entry where the calculated bit rate is less than the max.
> 
>    - Support lower bit rates less than 80Mbps like 48Mbps
>      (Raspberry pi camera 640x480 connected to Kingfisher)
>      can also be supported by selecting the lowest default bit rate 80Mbps
>      as done before this fix
> 
>    - Alignement of the commit message based on above changes.
> 
>  Changes in v4:
>   -  Remove unncessary braces.
> 
>  Changes in v5:
>    - Removed mbps variable in rcsi2_mbps_reg and aligned all 
>      tables accordingly
> 	 
>  Changes in v6
>    - Renesas correct the range of default value 220Mbps. Now
>      if we select the nearest value to the default value all
> 	 the values are in range. So reverting back to original patch
> 	 
>    - Added warning for values less than Minimum 80Mbps
> 
> 
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 151e6a9..8c502b7 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -199,6 +199,8 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
>  /* PHY Frequency Control */
>  #define PHYPLL_REG			0x68
>  #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
> +#define PHYPLL_HSFREQRANGE_MAX		1500
> +#define PHYPLL_HSFREQRANGE_MIN		  80
>  
>  static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
>  	{ .mbps =   80, .reg = 0x00 },
> @@ -431,16 +433,27 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
>  static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  {
>  	const struct rcsi2_mbps_reg *hsfreq;
> +	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
>  
> -	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
> -		if (hsfreq->mbps >= mbps)
> -			break;
> -
> -	if (!hsfreq->mbps) {
> +	if (mbps > PHYPLL_HSFREQRANGE_MAX) {
>  		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
>  		return -ERANGE;
>  	}
>  
> +	if (mbps < PHYPLL_HSFREQRANGE_MIN)
> +		dev_warn(priv->dev, "PHY speed (%u Mbps) less \
> +			 than Min 80Mbps\n", mbps);

I would drop this warning.

> +
> +	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
> +		if (hsfreq->mbps >= mbps)
> +			break;
> +		hsfreq_prev = hsfreq;
> +	}
> +
> +	if (hsfreq_prev &&
> +	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))

Longer lines are now OK [1] and I think it would add to the readability 
here.

> +		hsfreq = hsfreq_prev;
> +

How about

static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
{
    const struct rcsi2_mbps_reg *hsfreq;
    const struct rcsi2_mbps_reg *hsfreq_prev = NULL;

    for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
	if (hsfreq->mbps >= mbps)
		break;
	hsfreq_prev = hsfreq;
    }

    if (!hsfreq->mbps) {
	dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
	return -ERANGE;
    }

    if (hsfreq_prev && ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
	hsfreq = hsfreq_prev;

    rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));

    return 0;
}

>  	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
>  
>  	return 0;
> -- 
> 2.7.4
> 

1. https://lkml.org/lkml/2020/5/29/1038

-- 
Regards,
Niklas Söderlund
