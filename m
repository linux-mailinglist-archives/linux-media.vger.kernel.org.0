Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835051F7265
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 05:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgFLDLC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 23:11:02 -0400
Received: from ma-dnext02.denso.co.jp ([133.192.181.77]:53114 "EHLO
        ma-dnext02.denso.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgFLDLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 23:11:01 -0400
Received: from grdma01h.denso.co.jp (unknown [133.192.24.24])
        by ma-dnext02.denso.co.jp (Postfix) with ESMTP id B9A8A31C40F;
        Fri, 12 Jun 2020 12:10:59 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=adit-jv.com;
        s=jpadit-jvmail2011; t=1591931459;
        bh=XTbVH5Cf2KeZKXo8qqWUGjfzHe/SYDh7ZYtXZjdXZvw=;
        h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
         Content-Type:Content-Transfer-Encoding:In-Reply-To;
        b=8r2sfnqmwm1uZskV4id5OyDnpIuA+/MgFhurPgwZ/Kt/ldHpVr3GufKIN8YYPR0wu
         5wACEsGF5hUrpoU5Yy69ybYPBEdmdd5/DJDAj9VwzFvBNlfH7enpBqJlc12UkH/sN/
         H+5JIpSEzPZBKdQpP4KVvKN93nh1mwwhI0AAbtxDF1J8vJy6DBIRv6mxH/ld4xjrY8
         4RQo95+KSe2CKIf0AOb1VBS8p1WWPD0q/B7pW8JbQNe5DDcJEcKi5h+IqKf+QdCAQ7
         7gcNncIK7xcFWS4cSZAuNZcIKmAlSZuGwaw71XcVKHTyDEQ800WHi3tsBeWxgP1Aia
         LFgh4RehUZvJw==
Received: by grdma01h.denso.co.jp (Postfix, from userid 0)
        id AF1E6C04E0D; Fri, 12 Jun 2020 12:10:59 +0900 (JST)
Received: from smtp1.denso.co.jp [133.192.24.88] 
         by grdma01h. with ESMTP id NAA02161;
         Fri, 12 Jun 2020 12:10:59 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp01.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id FZY09138;
        Fri, 12 Jun 2020 12:10:58 +0900
Received: from jp-u0004 (10.71.112.120) by ky0exch01.adit-jv.com (10.71.113.8)
 with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 12 Jun 2020 12:10:57
 +0900
Date:   Fri, 12 Jun 2020 12:10:51 +0900
From:   Suresh Udipi <sudipi@jp.adit-jv.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
CC:     Suresh Udipi <sudipi@jp.adit-jv.com>, <mrodin@de.adit-jv.com>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <mchehab@kernel.org>,
        <michael@rodin.online>, <securitycheck@denso.co.jp>,
        Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
Subject: Re: [PATCH v6] media: rcar-csi2: Correct the selection of hsfreqrange
Message-ID: <20200612031051.GA18602@jp-u0004>
References: <20200605184426.GA5206@vmlxhi-121.adit-jv.com>
 <1591586703-32246-1-git-send-email-sudipi@jp.adit-jv.com>
 <20200610134004.GA192296@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610134004.GA192296@oden.dyn.berto.se>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.71.112.120]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 10, 2020 at 03:40:04PM +0200, Niklas Söderlund wrote:
> Hi Suresh,
> 
> Thanks for your persistent work!
> 
> On 2020-06-08 12:25:03 +0900, Suresh Udipi wrote:
> > hsfreqrange should be chosen based on the calculated mbps which
> > is closer to the default bit rate  and within the range as per
> > table[1]. But current calculation always selects first value which
> > is greater than or equal to the calculated mbps which may lead
> > to chosing a wrong range in some cases.
> > 
> > For example for 360 mbps for H3/M3N
> > Existing logic selects
> > Calculated value 360Mbps : Default 400Mbps Range [368.125 -433.125 mbps]
> > 
> > This hsfreqrange is out of range.
> > 
> > The logic is changed to get the default value which is closest to the
> > calculated value [1]
> > 
> > Calculated value 360Mbps : Default 350Mbps  Range [320.625 -380.625 mpbs]
> > 
> > [1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]
> > 
> > Please note that According to Renesas in Table 25.9 the range for
> > 220 default value is corrected as below
> > 
> >  |Range (Mbps)     |  Default  Bit rate (Mbps) |
> >  -----------------------------------------------
> >  | 197.125-244.125 |     220                   |
> >  -----------------------------------------------
> > 
> > Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> > 
> > Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> > Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
> > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > ---
> >  Changes in v2:
> >   - Added the boundary check for the maximum bit rate.
> > 
> >   - Simplified the logic by remmoving range check
> >     as only the closest default value covers most
> >     of the use cases.
> > 
> >   - Aligning the commit message based on the above change
> > 
> > 
> >  Changes in v3:
> >     - Added max member from struct rcsi2_mbps_reg.
> >       mbps varialbe cannot be removed from rcsi2_mbps_reg,
> >       since this structure is reused for
> >       phtw_mbps_h3_v3h_m3n/phtw_mbps_v3m_e3 where mbps is
> >       used.
> > 
> > 
> >    -  Update the walk of the array in rcsi2_set_phypll() so that it finds
> >       the first entry where the calculated bit rate is less than the max.
> > 
> >    - Support lower bit rates less than 80Mbps like 48Mbps
> >      (Raspberry pi camera 640x480 connected to Kingfisher)
> >      can also be supported by selecting the lowest default bit rate 80Mbps
> >      as done before this fix
> > 
> >    - Alignement of the commit message based on above changes.
> > 
> >  Changes in v4:
> >   -  Remove unncessary braces.
> > 
> >  Changes in v5:
> >    - Removed mbps variable in rcsi2_mbps_reg and aligned all 
> >      tables accordingly
> > 	 
> >  Changes in v6
> >    - Renesas correct the range of default value 220Mbps. Now
> >      if we select the nearest value to the default value all
> > 	 the values are in range. So reverting back to original patch
> > 	 
> >    - Added warning for values less than Minimum 80Mbps
> > 
> > 
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 23 ++++++++++++++++++-----
> >  1 file changed, 18 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index 151e6a9..8c502b7 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -199,6 +199,8 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
> >  /* PHY Frequency Control */
> >  #define PHYPLL_REG			0x68
> >  #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
> > +#define PHYPLL_HSFREQRANGE_MAX		1500
> > +#define PHYPLL_HSFREQRANGE_MIN		  80
> >  
> >  static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
> >  	{ .mbps =   80, .reg = 0x00 },
> > @@ -431,16 +433,27 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> >  static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> >  {
> >  	const struct rcsi2_mbps_reg *hsfreq;
> > +	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
> >  
> > -	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
> > -		if (hsfreq->mbps >= mbps)
> > -			break;
> > -
> > -	if (!hsfreq->mbps) {
> > +	if (mbps > PHYPLL_HSFREQRANGE_MAX) {
> >  		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
> >  		return -ERANGE;
> >  	}
> >  
> > +	if (mbps < PHYPLL_HSFREQRANGE_MIN)
> > +		dev_warn(priv->dev, "PHY speed (%u Mbps) less \
> > +			 than Min 80Mbps\n", mbps);
> 
> I would drop this warning.
> 

  This was suggested by Michael. Michael is it ok to drop this warning
  as it is not available before this changes also. 

> > +
> > +	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
> > +		if (hsfreq->mbps >= mbps)
> > +			break;
> > +		hsfreq_prev = hsfreq;
> > +	}
> > +
> > +	if (hsfreq_prev &&
> > +	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
> 
> Longer lines are now OK [1] and I think it would add to the readability 
> here.
> 
> > +		hsfreq = hsfreq_prev;
> > +
> 
> How about
> 
> static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> {
>     const struct rcsi2_mbps_reg *hsfreq;
>     const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
> 
>     for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
> 	if (hsfreq->mbps >= mbps)
> 		break;
> 	hsfreq_prev = hsfreq;
>     }
> 
>     if (!hsfreq->mbps) {
> 	dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
> 	return -ERANGE;
>     }
> 
>     if (hsfreq_prev && ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
> 	hsfreq = hsfreq_prev;
> 
>     rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
> 
>     return 0;
> }
> 
> >  	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
> >  
> >  	return 0;

Agreed I will do the changes and update.
> > -- 
> > 2.7.4
> > 
> 
> 1. https://lkml.org/lkml/2020/5/29/1038
> 
> -- 
> Regards,
> Niklas Söderlund

-- 
Best Regards,
Suresh Udipi.
