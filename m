Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3D520FFD2
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 00:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgF3WD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 18:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgF3WD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 18:03:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D31C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 15:03:56 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s1so24508220ljo.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 15:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xdNoXenycdknAZtX1Bd4pirlygryBFdZq5W7DISDEy4=;
        b=S1+omJoiEMRnT0XLriHCwXfXnnWsNgUS3wg9ns59m7eyzAViGx1zAwYojbKooCeo0k
         p32CN3QVNMxkjZqhNYFr+5H6BE/0sJCMZJoAy+gD9MthYbzQclpyF5Bc9jHvaWo4ltWP
         wUJmspg/rgiWsVGwVbk1oZ1K9G0M0M6KkYoccVlqJkpD64xdpOoRyGxJU2RPOGj78Uhy
         cBSM6ECzaIiVsXO6iEJrFSrnZZKM4fVZa43XnEH0Ns2GTpwMeHVPPSIcU9hqAJ3w7uC9
         z9M3YWFf9igVtCzlzZWmPwhu0h0vN6wsbBU94MDZXUeZJmah3y7ZfgAOj4lYQziV1FFk
         FyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xdNoXenycdknAZtX1Bd4pirlygryBFdZq5W7DISDEy4=;
        b=XskHl6UFndh3unDBkxMKC9pOADM21R0iSa17tWWhSA9pX17vLruk6B+jKGLHtolFAz
         oz3JvfKaPV34P5y61bzydfPYqI2S79tjJrs9ipq2/4DiNJAOzgyMpTFKQsEirOcQhWQR
         3Ehp+1fFbzRaQLk4+6Ebt3CaN1jw3ZUsH/F+t9YKqYUJn5diWA7Jvk6ovhWqm/yQldNC
         Qt086VGKWPighoNlmdatotxj4Oww9I2AnUlyv18asufp6ET2Ymc8HECPr4QAsMpigOxE
         1FwBmft2R5iDDojeJuaRpKX/H1OfZeHiCcfOPhs6FuJMTEAbCT2cNxepNvxniWt3DiSB
         Y0qw==
X-Gm-Message-State: AOAM531AWPKn6HF3pzwp6Toeqa61SfuXCWbaEiyaAeZIialwMNqLaWS6
        2kjiXavoA7auEHlndeOxiHh+vwk2Z6s=
X-Google-Smtp-Source: ABdhPJy/V4jlChNsI5ZIPhawDkQpYe3Ajx4aHOxXwknaD2WISsRIG0xD7nVmJYMjCAEqwH50kqOyPw==
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr4867724ljl.167.1593554634836;
        Tue, 30 Jun 2020 15:03:54 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id v20sm983322lfr.74.2020.06.30.15.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 15:03:54 -0700 (PDT)
Date:   Wed, 1 Jul 2020 00:03:53 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Suresh Udipi <sudipi@jp.adit-jv.com>
Cc:     mrodin@de.adit-jv.com, akiyama@nds-osk.co.jp,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, mchehab@kernel.org,
        michael@rodin.online, securitycheck@denso.co.jp
Subject: Re: [PATCH v8 1/3] media: rcar-csi2: Correct the selection of
 hsfreqrange
Message-ID: <20200630220353.GJ2365286@oden.dyn.berto.se>
References: <20200617133705.GA88066@vmlxhi-121.adit-jv.com>
 <1592476472-26235-1-git-send-email-sudipi@jp.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1592476472-26235-1-git-send-email-sudipi@jp.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Suresh,

Thanks for your work.

On 2020-06-18 19:34:30 +0900, Suresh Udipi wrote:
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

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

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
> 
>  Changes in v6
>    - Renesas correct the range of default value 220Mbps. Now
>      if we select the nearest value to the default value all
>          the values are in range. So reverting back to original patch
>   
>    - Added warning for values less than Minimum 80Mbps
>       
> Changes in v7
>   - Create a seperate commit for the warning message less
>     than minimum 80Mbps 
>   
>   - Reorder the statements to increase readability
>   
> Changes in v8
>   - Extended the logic of selection of nearest mbps to
>     PHTW registers value less than 250Mbps. A new commit
>     is added
> 	
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 151e6a9..f18dedc 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -431,16 +431,23 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
>  static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  {
>  	const struct rcsi2_mbps_reg *hsfreq;
> +	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
>  
> -	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
> +	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
>  		if (hsfreq->mbps >= mbps)
>  			break;
> +		hsfreq_prev = hsfreq;
> +	}
>  
>  	if (!hsfreq->mbps) {
>  		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
>  		return -ERANGE;
>  	}
>  
> +	if (hsfreq_prev &&
> +	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
> +		hsfreq = hsfreq_prev;
> +
>  	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
>  
>  	return 0;
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
