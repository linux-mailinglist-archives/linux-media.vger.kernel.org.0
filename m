Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551251F0002
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 20:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgFESpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 14:45:15 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:52515 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbgFESpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 14:45:15 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 668CA3C0579;
        Fri,  5 Jun 2020 20:45:12 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qq7PiBWcn3Pm; Fri,  5 Jun 2020 20:45:06 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 9C8B13C00B5;
        Fri,  5 Jun 2020 20:45:06 +0200 (CEST)
Received: from vmlxhi-121.adit-jv.com (10.72.92.132) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 5 Jun 2020
 20:45:06 +0200
Date:   Fri, 5 Jun 2020 20:44:59 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <michael@rodin.online>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>,
        Suresh Udipi <sudipi@jp.adit-jv.com>
Subject: Re: [PATCH] rcar-vin: rcar-csi2: Correct the selection of hsfreqrange
Message-ID: <20200605184426.GA5206@vmlxhi-121.adit-jv.com>
References: <20200512213045.GC2542285@oden.dyn.berto.se>
 <1590596167-17403-1-git-send-email-mrodin@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1590596167-17403-1-git-send-email-mrodin@de.adit-jv.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.92.132]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Niklas and Suresh,

Renesas confirmed that there is a typo in the Hardware Manual (Table 25.9):
The correct range for 220 Mbps is 197.125-244.125 and not 197.125 - 224.125
so the both patches are correct, we can do configuration based only on
the "default" bit rates. I would say that now we can correct the commit
message with respect to the exception value and use these patches. I would
additionally add a warning for bitrates below 80 Mbps. They seem to work
(for example Raspberry Pi camera), however they are not officially supported
so the user needs to be warned.

On Wed, May 27, 2020 at 06:16:07PM +0200, Michael Rodin wrote:
> From: Suresh Udipi <sudipi@jp.adit-jv.com>
> 
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
> range. This needs to be further handled if required.
> 
> Fixes: ADIT v4.14 commit 9e568b895ee0 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> 
> Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index c473a56..73d9830 100644
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
> @@ -446,16 +447,23 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
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
Best Regards,
Michael
