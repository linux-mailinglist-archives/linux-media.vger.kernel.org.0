Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5C01F7C7A
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 19:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgFLR2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 13:28:25 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:46611 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLR2Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 13:28:24 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 8EE263C04C1;
        Fri, 12 Jun 2020 19:28:20 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id F4mlFpUaCfBe; Fri, 12 Jun 2020 19:28:11 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id EC9273C00BB;
        Fri, 12 Jun 2020 19:28:11 +0200 (CEST)
Received: from vmlxhi-121.adit-jv.com (10.72.92.132) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 12 Jun
 2020 19:28:11 +0200
Date:   Fri, 12 Jun 2020 19:28:06 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Suresh Udipi <sudipi@jp.adit-jv.com>
CC:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        <mrodin@de.adit-jv.com>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <mchehab@kernel.org>, <michael@rodin.online>,
        <securitycheck@denso.co.jp>,
        Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
Subject: Re: [PATCH v6] media: rcar-csi2: Correct the selection of hsfreqrange
Message-ID: <20200612172806.GA46338@vmlxhi-121.adit-jv.com>
References: <20200605184426.GA5206@vmlxhi-121.adit-jv.com>
 <1591586703-32246-1-git-send-email-sudipi@jp.adit-jv.com>
 <20200610134004.GA192296@oden.dyn.berto.se>
 <20200612031051.GA18602@jp-u0004>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200612031051.GA18602@jp-u0004>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.92.132]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,
Hi Suresh,

On Fri, Jun 12, 2020 at 12:10:51PM +0900, Suresh Udipi wrote:
> On Wed, Jun 10, 2020 at 03:40:04PM +0200, Niklas Söderlund wrote:
> > Hi Suresh,
> > 
> > Thanks for your persistent work!
> > 
> > On 2020-06-08 12:25:03 +0900, Suresh Udipi wrote:
> > > hsfreqrange should be chosen based on the calculated mbps which
> > > is closer to the default bit rate  and within the range as per
> > > table[1]. But current calculation always selects first value which
> > > is greater than or equal to the calculated mbps which may lead
> > > to chosing a wrong range in some cases.
> > > 
> > > For example for 360 mbps for H3/M3N
> > > Existing logic selects
> > > Calculated value 360Mbps : Default 400Mbps Range [368.125 -433.125 mbps]
> > > 
> > > This hsfreqrange is out of range.
> > > 
> > > The logic is changed to get the default value which is closest to the
> > > calculated value [1]
> > > 
> > > Calculated value 360Mbps : Default 350Mbps  Range [320.625 -380.625 mpbs]
> > > 
> > > [1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]
> > > 
> > > Please note that According to Renesas in Table 25.9 the range for
> > > 220 default value is corrected as below
> > > 
> > >  |Range (Mbps)     |  Default  Bit rate (Mbps) |
> > >  -----------------------------------------------
> > >  | 197.125-244.125 |     220                   |
> > >  -----------------------------------------------
> > > 
> > > Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> > > 
> > > Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> > > Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
> > > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > > ---
> > >  Changes in v2:
> > >   - Added the boundary check for the maximum bit rate.
> > > 
> > >   - Simplified the logic by remmoving range check
> > >     as only the closest default value covers most
> > >     of the use cases.
> > > 
> > >   - Aligning the commit message based on the above change
> > > 
> > > 
> > >  Changes in v3:
> > >     - Added max member from struct rcsi2_mbps_reg.
> > >       mbps varialbe cannot be removed from rcsi2_mbps_reg,
> > >       since this structure is reused for
> > >       phtw_mbps_h3_v3h_m3n/phtw_mbps_v3m_e3 where mbps is
> > >       used.
> > > 
> > > 
> > >    -  Update the walk of the array in rcsi2_set_phypll() so that it finds
> > >       the first entry where the calculated bit rate is less than the max.
> > > 
> > >    - Support lower bit rates less than 80Mbps like 48Mbps
> > >      (Raspberry pi camera 640x480 connected to Kingfisher)
> > >      can also be supported by selecting the lowest default bit rate 80Mbps
> > >      as done before this fix
> > > 
> > >    - Alignement of the commit message based on above changes.
> > > 
> > >  Changes in v4:
> > >   -  Remove unncessary braces.
> > > 
> > >  Changes in v5:
> > >    - Removed mbps variable in rcsi2_mbps_reg and aligned all 
> > >      tables accordingly
> > > 	 
> > >  Changes in v6
> > >    - Renesas correct the range of default value 220Mbps. Now
> > >      if we select the nearest value to the default value all
> > > 	 the values are in range. So reverting back to original patch
> > > 	 
> > >    - Added warning for values less than Minimum 80Mbps
> > > 
> > > 
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 23 ++++++++++++++++++-----
> > >  1 file changed, 18 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > index 151e6a9..8c502b7 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > @@ -199,6 +199,8 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
> > >  /* PHY Frequency Control */
> > >  #define PHYPLL_REG			0x68
> > >  #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
> > > +#define PHYPLL_HSFREQRANGE_MAX		1500
> > > +#define PHYPLL_HSFREQRANGE_MIN		  80
> > >  
> > >  static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
> > >  	{ .mbps =   80, .reg = 0x00 },
> > > @@ -431,16 +433,27 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> > >  static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> > >  {
> > >  	const struct rcsi2_mbps_reg *hsfreq;
> > > +	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
> > >  
> > > -	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
> > > -		if (hsfreq->mbps >= mbps)
> > > -			break;
> > > -
> > > -	if (!hsfreq->mbps) {
> > > +	if (mbps > PHYPLL_HSFREQRANGE_MAX) {
> > >  		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
> > >  		return -ERANGE;
> > >  	}
> > >  
> > > +	if (mbps < PHYPLL_HSFREQRANGE_MIN)
> > > +		dev_warn(priv->dev, "PHY speed (%u Mbps) less \
> > > +			 than Min 80Mbps\n", mbps);
> > 
> > I would drop this warning.
> > 
> 
>   This was suggested by Michael. Michael is it ok to drop this warning
>   as it is not available before this changes also. 
> 

I strongly disagree. We should keep the warning for the following reasons:

 1. Renesas explicitly states in the hardware manual tables, that 80Mbps is
    the lowest supported bit rate (I guess, for a good reason), so using
    devices with lower bit rates is at our own risk.
 2. Failing for mbps > PHYPLL_HSFREQRANGE_MAX with an ERANGE error but
    silently succeeding for mbps < PHYPLL_HSFREQRANGE_MIN does not look
    consistent. Both values are out of the official hardware specs.
 3. Although rcar csi2 seems to work with at least 1 device in the range
    mbps < PHYPLL_HSFREQRANGE_MIN, there is no guarantee that ALL devices
    work. And from my experience, users are very happy about any warning,
    which points them to a possible reason, why their new device does not
    work ;)

> > > +
> > > +	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
> > > +		if (hsfreq->mbps >= mbps)
> > > +			break;
> > > +		hsfreq_prev = hsfreq;
> > > +	}
> > > +
> > > +	if (hsfreq_prev &&
> > > +	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
> > 
> > Longer lines are now OK [1] and I think it would add to the readability 
> > here.
> > 
> > > +		hsfreq = hsfreq_prev;
> > > +
> > 
> > How about
> > 
> > static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> > {
> >     const struct rcsi2_mbps_reg *hsfreq;
> >     const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
> > 
> >     for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
> > 	if (hsfreq->mbps >= mbps)
> > 		break;
> > 	hsfreq_prev = hsfreq;
> >     }
> > 
> >     if (!hsfreq->mbps) {
> > 	dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
> > 	return -ERANGE;
> >     }
> > 
> >     if (hsfreq_prev && ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
> > 	hsfreq = hsfreq_prev;
> > 
> >     rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
> > 
> >     return 0;
> > }
> > 
> > >  	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
> > >  
> > >  	return 0;
> 
> Agreed I will do the changes and update.
> > > -- 
> > > 2.7.4
> > > 
> > 
> > 1. https://lkml.org/lkml/2020/5/29/1038
> > 
> > -- 
> > Regards,
> > Niklas Söderlund
> 
> -- 
> Best Regards,
> Suresh Udipi.

-- 
Best Regards,
Michael
