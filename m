Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65902187E80
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 11:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgCQKiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 06:38:02 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45880 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgCQKiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 06:38:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id x143so507414lff.12
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 03:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7mUtSodRzVFrNOdwotyLpGRUL0sXdt0yPPIiSrVrsLs=;
        b=PPMraiP7BrnvbgEUdY7vtJGlY/uq1xXN0yspKo+AerSKh+3S/VAgqVbKJPIs3l0k7U
         ut6qoQMdEwd7W3g0K8vz6PZfWVjKyFLUpSo+bOxY9DSGFmBoMTXOYKfP+G8N0BxszBLV
         9HOPnE3mLGCz2eO7SrH+k89yt2n3fCLD9mpcts/8gq5t7kZytl/xqlIjZR3MWh5/gYln
         Hs+1EX00oS9H9TViCN6KUHqH+UV7vLXXAcNnEYlRp1tTH7tt00Zn+hT/IP6uIWfV8FQO
         FF9vMbelEhdvFltQ+P363Wqfo/crm/zEjIGfsHAxCWhjBfprUGL7wE6fC+NnNkdCDGds
         4F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7mUtSodRzVFrNOdwotyLpGRUL0sXdt0yPPIiSrVrsLs=;
        b=H2nAC3Fr5ZyXaFZ42aN9bIYno6xJD351Jcwkp32IIXwK5BIM8EHrg8b/6PDEKk9sex
         u+VnoaXOkWZfGnU/oXxsXyrHB0RJH+eTceTiG9+79Y/6yps5M2u0wwqG8eMDs809SQvP
         sRxVmTm1hzGXyzlfMyX+H3NiGgjJwdMY5LGboGhb6OJd+pnLPfRQEaE1ea7FOjmxun4n
         DuqVCDCD50O1hUSVSDFK5LZv7LE4cIXtjS32trLX+YNP7KcaXhoJ6vm/SrtruwaYq1hO
         5WNoYaDfbVLVx2rWfvpzs2BSW402IzBIL75lUajWitqC/mQa06Rx9L32IdNvVaSZgeLR
         GAjw==
X-Gm-Message-State: ANhLgQ3uf4w4h0f26S7cC5KIe8LRqc9Rpd+JXublLHohrsmhKOGKosN6
        qLaKlVzvZN3nQVilWP8tWePipg==
X-Google-Smtp-Source: ADFU+vtVlYRQTZ5F59LQqxdeWy9nM1l8g9ypwAvky2egMozG6VNQd4T99otV//QeFt6Y/pXumoW8qQ==
X-Received: by 2002:ac2:59c6:: with SMTP id x6mr730389lfn.177.1584441477770;
        Tue, 17 Mar 2020 03:37:57 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id y11sm1989763ljn.83.2020.03.17.03.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 03:37:56 -0700 (PDT)
Date:   Tue, 17 Mar 2020 11:37:56 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Suresh Udipi <sudipi@jp.adit-jv.com>
Cc:     akiyama@nds-osk.co.jp, efriedrich@de.adit-jv.com,
        erosca@de.adit-jv.com, hverkuil-cisco@xs4all.nl,
        jacopo+renesas@jmondi.org, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, mrodin@de.adit-jv.com,
        securitycheck@denso.co.jp
Subject: Re: [PATCH v2] [RFC] rcar-vin: rcar-csi2: Correct the selection of
 hsfreqrange
Message-ID: <20200317103756.GC2496015@oden.dyn.berto.se>
References: <20200316130247.GA2258968@oden.dyn.berto.se>
 <1584428905-21560-1-git-send-email-sudipi@jp.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1584428905-21560-1-git-send-email-sudipi@jp.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Suresh,

Thanks for your work.

On 2020-03-17 16:08:25 +0900, Suresh Udipi wrote:
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
> There is one exectpion value 227Mbps, which may cause out of
> range.

Then something else is needed I think :-)

I liked v1 of this RFC more, where you added a u16 min and max to struct 
rcsi2_mbps_reg. I think that is the right solution.

What I tried to express in my review of v1 was

- You should remove the mbps member from struct rcsi2_mbps_reg.
- Update the walk of the array in rcsi2_set_phypll() so that it finds 
  the first entry where the calculated target value is between min and 
  max and use the reg setting for that entry.

Would that solution make sens too you? Sorry if I expressed myself a but 
muddy in v1 about this.

> 
> Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> 
> Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
> ---
> Changes in v2:
>   - Added the boundary check for the maximum bit rate.
>   
>   - Simplified the logic by remmoving range check 
>     as only the closest default value covers most 
>     of the use cases.
> 
>   - Aligning the commit message based on the above change
> 
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index faa9fb2..6573625 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -199,6 +199,7 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
>  /* PHY Frequency Control */
>  #define PHYPLL_REG			0x68
>  #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
> +#define PHYPLL_HSFREQRANGE_MAX		1500
>  
>  static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
>  	{ .mbps =   80, .reg = 0x00 },
> @@ -431,16 +432,23 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
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
> +	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
> +		if (hsfreq->mbps >= mbps)
> +			break;
> +		hsfreq_prev = hsfreq;
> +	}
> +
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
