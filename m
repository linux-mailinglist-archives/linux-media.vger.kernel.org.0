Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F99E1F99B3
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 16:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730177AbgFOOLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 10:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729243AbgFOOLa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 10:11:30 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234FDC05BD43
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 07:11:30 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id i8so3141860lfo.4
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nn2A50oo7axmTzb8pTNpospU/7dTZtc7rnSXeJoWkDs=;
        b=tEfKsR7H1hKnMlIixTZjscTWn3hkX9wEEdkMw+UKlfDDJKgV9aYx3IFd3t62axXdZZ
         EqqFPdJ4PtK5yBk773cYTFBS/V50FYgy0Gwwp5l1FsWwozXvPMhBRQdNxNuEBzyEP+gM
         rFB0GxdHIsHzcpOBIZVF+ThAgwLJ8z6n4qdZOSFc4CtZ98yPftm5vRuzBRdCIUpkkUsb
         36Sg/0FSaej/Sb14eZZ07GMed6b3rbW3M9jxOTpvc4MasIojFHHWgM/bvM549+weocjn
         x1vKDcLG62nWj5ZHXUWza54HydpRpkcX2KrVFcU/GqEaab4Uqqd9CQbv4a1BhTwr1fts
         5eDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nn2A50oo7axmTzb8pTNpospU/7dTZtc7rnSXeJoWkDs=;
        b=sGn2Dh6ifkaN8hUX7LnbGhuvoTqo/aFaI0dZljkJ72y2oj6mAD0MdfsQSQ4ecziBqS
         sPM84onjF8GOpEaXRaG2KPh4ECOV9wy7k9EKlmdxWTA8Hf46AE15dQl/pNlWyiIqvIZf
         lwbu/weKVVYlYVBcqhUVXGQoFNFFEr2USLX0//xp/xdylCxR3DWR/xzohICKaMSvIysE
         mLR/dXcg4IFtb2OUi5HqLxpY4lsGcBI9fnppi3yU+LaePT1n0fY0IjxQHTSGpZLFVH6B
         vCOBeYP/6qp+gtt7s+Ep2LRZHOYLSf2VMENzMwUsIehR6m78EKmWqv0C8XqRafdS5Ym2
         0cmQ==
X-Gm-Message-State: AOAM530LY6ubHLO18U6QZFmedxs2+x5iD1AwwrXmV4dVes3lb6BmzNcF
        XLBbwC4uCjfAE3ckCWI0GB5/NA==
X-Google-Smtp-Source: ABdhPJxGF4BSVnKXqfGj0+gNMNUhfNOr92tkqwUTlc+41fuoeBUuO/Ce5g6gBhDFhmbFUM90hnNTlw==
X-Received: by 2002:ac2:4c21:: with SMTP id u1mr13709213lfq.185.1592230288292;
        Mon, 15 Jun 2020 07:11:28 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id d8sm632884lfa.16.2020.06.15.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:11:27 -0700 (PDT)
Date:   Mon, 15 Jun 2020 16:11:26 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Michael Rodin <mrodin@de.adit-jv.com>
Cc:     Suresh Udipi <sudipi@jp.adit-jv.com>, efriedrich@de.adit-jv.com,
        erosca@de.adit-jv.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        mchehab@kernel.org, michael@rodin.online,
        securitycheck@denso.co.jp,
        Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
Subject: Re: [PATCH v6] media: rcar-csi2: Correct the selection of hsfreqrange
Message-ID: <20200615141126.GE915368@oden.dyn.berto.se>
References: <20200605184426.GA5206@vmlxhi-121.adit-jv.com>
 <1591586703-32246-1-git-send-email-sudipi@jp.adit-jv.com>
 <20200610134004.GA192296@oden.dyn.berto.se>
 <20200612031051.GA18602@jp-u0004>
 <20200612172806.GA46338@vmlxhi-121.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200612172806.GA46338@vmlxhi-121.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 2020-06-12 19:28:06 +0200, Michael Rodin wrote:
> Hi Niklas,
> Hi Suresh,
> 
> On Fri, Jun 12, 2020 at 12:10:51PM +0900, Suresh Udipi wrote:
> > On Wed, Jun 10, 2020 at 03:40:04PM +0200, Niklas Söderlund wrote:
> > > Hi Suresh,
> > > 
> > > Thanks for your persistent work!
> > > 
> > > On 2020-06-08 12:25:03 +0900, Suresh Udipi wrote:
> > > > hsfreqrange should be chosen based on the calculated mbps which
> > > > is closer to the default bit rate  and within the range as per
> > > > table[1]. But current calculation always selects first value which
> > > > is greater than or equal to the calculated mbps which may lead
> > > > to chosing a wrong range in some cases.
> > > > 
> > > > For example for 360 mbps for H3/M3N
> > > > Existing logic selects
> > > > Calculated value 360Mbps : Default 400Mbps Range [368.125 -433.125 mbps]
> > > > 
> > > > This hsfreqrange is out of range.
> > > > 
> > > > The logic is changed to get the default value which is closest to the
> > > > calculated value [1]
> > > > 
> > > > Calculated value 360Mbps : Default 350Mbps  Range [320.625 -380.625 mpbs]
> > > > 
> > > > [1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]
> > > > 
> > > > Please note that According to Renesas in Table 25.9 the range for
> > > > 220 default value is corrected as below
> > > > 
> > > >  |Range (Mbps)     |  Default  Bit rate (Mbps) |
> > > >  -----------------------------------------------
> > > >  | 197.125-244.125 |     220                   |
> > > >  -----------------------------------------------
> > > > 
> > > > Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> > > > 
> > > > Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> > > > Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
> > > > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > > > ---
> > > >  Changes in v2:
> > > >   - Added the boundary check for the maximum bit rate.
> > > > 
> > > >   - Simplified the logic by remmoving range check
> > > >     as only the closest default value covers most
> > > >     of the use cases.
> > > > 
> > > >   - Aligning the commit message based on the above change
> > > > 
> > > > 
> > > >  Changes in v3:
> > > >     - Added max member from struct rcsi2_mbps_reg.
> > > >       mbps varialbe cannot be removed from rcsi2_mbps_reg,
> > > >       since this structure is reused for
> > > >       phtw_mbps_h3_v3h_m3n/phtw_mbps_v3m_e3 where mbps is
> > > >       used.
> > > > 
> > > > 
> > > >    -  Update the walk of the array in rcsi2_set_phypll() so that it finds
> > > >       the first entry where the calculated bit rate is less than the max.
> > > > 
> > > >    - Support lower bit rates less than 80Mbps like 48Mbps
> > > >      (Raspberry pi camera 640x480 connected to Kingfisher)
> > > >      can also be supported by selecting the lowest default bit rate 80Mbps
> > > >      as done before this fix
> > > > 
> > > >    - Alignement of the commit message based on above changes.
> > > > 
> > > >  Changes in v4:
> > > >   -  Remove unncessary braces.
> > > > 
> > > >  Changes in v5:
> > > >    - Removed mbps variable in rcsi2_mbps_reg and aligned all 
> > > >      tables accordingly
> > > > 	 
> > > >  Changes in v6
> > > >    - Renesas correct the range of default value 220Mbps. Now
> > > >      if we select the nearest value to the default value all
> > > > 	 the values are in range. So reverting back to original patch
> > > > 	 
> > > >    - Added warning for values less than Minimum 80Mbps
> > > > 
> > > > 
> > > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 23 ++++++++++++++++++-----
> > > >  1 file changed, 18 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > index 151e6a9..8c502b7 100644
> > > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > @@ -199,6 +199,8 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
> > > >  /* PHY Frequency Control */
> > > >  #define PHYPLL_REG			0x68
> > > >  #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
> > > > +#define PHYPLL_HSFREQRANGE_MAX		1500
> > > > +#define PHYPLL_HSFREQRANGE_MIN		  80
> > > >  
> > > >  static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
> > > >  	{ .mbps =   80, .reg = 0x00 },
> > > > @@ -431,16 +433,27 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> > > >  static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> > > >  {
> > > >  	const struct rcsi2_mbps_reg *hsfreq;
> > > > +	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
> > > >  
> > > > -	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
> > > > -		if (hsfreq->mbps >= mbps)
> > > > -			break;
> > > > -
> > > > -	if (!hsfreq->mbps) {
> > > > +	if (mbps > PHYPLL_HSFREQRANGE_MAX) {
> > > >  		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
> > > >  		return -ERANGE;
> > > >  	}
> > > >  
> > > > +	if (mbps < PHYPLL_HSFREQRANGE_MIN)
> > > > +		dev_warn(priv->dev, "PHY speed (%u Mbps) less \
> > > > +			 than Min 80Mbps\n", mbps);
> > > 
> > > I would drop this warning.
> > > 
> > 
> >   This was suggested by Michael. Michael is it ok to drop this warning
> >   as it is not available before this changes also. 
> > 
> 
> I strongly disagree. We should keep the warning for the following reasons:
> 
>  1. Renesas explicitly states in the hardware manual tables, that 80Mbps is
>     the lowest supported bit rate (I guess, for a good reason), so using
>     devices with lower bit rates is at our own risk.
>  2. Failing for mbps > PHYPLL_HSFREQRANGE_MAX with an ERANGE error but
>     silently succeeding for mbps < PHYPLL_HSFREQRANGE_MIN does not look
>     consistent. Both values are out of the official hardware specs.
>  3. Although rcar csi2 seems to work with at least 1 device in the range
>     mbps < PHYPLL_HSFREQRANGE_MIN, there is no guarantee that ALL devices
>     work. And from my experience, users are very happy about any warning,
>     which points them to a possible reason, why their new device does not
>     work ;)

You convinced me, lets add a warning then. But please do so in a 
separate patch on-top of this change.

Also if possible I would like to avoid adding a PHYPLL_HSFREQRANGE_MIN 
define and instead get the minimum setting from the data tables. As we 
already require the tables to be sorted for the logic touched in this 
change to work it should be doable to get the minimum freq from the same 
source.

> 
> > > > +
> > > > +	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
> > > > +		if (hsfreq->mbps >= mbps)
> > > > +			break;
> > > > +		hsfreq_prev = hsfreq;
> > > > +	}
> > > > +
> > > > +	if (hsfreq_prev &&
> > > > +	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
> > > 
> > > Longer lines are now OK [1] and I think it would add to the readability 
> > > here.
> > > 
> > > > +		hsfreq = hsfreq_prev;
> > > > +
> > > 
> > > How about
> > > 
> > > static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> > > {
> > >     const struct rcsi2_mbps_reg *hsfreq;
> > >     const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
> > > 
> > >     for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
> > > 	if (hsfreq->mbps >= mbps)
> > > 		break;
> > > 	hsfreq_prev = hsfreq;
> > >     }
> > > 
> > >     if (!hsfreq->mbps) {
> > > 	dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
> > > 	return -ERANGE;
> > >     }
> > > 
> > >     if (hsfreq_prev && ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
> > > 	hsfreq = hsfreq_prev;
> > > 
> > >     rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
> > > 
> > >     return 0;
> > > }
> > > 
> > > >  	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
> > > >  
> > > >  	return 0;
> > 
> > Agreed I will do the changes and update.
> > > > -- 
> > > > 2.7.4
> > > > 
> > > 
> > > 1. https://lkml.org/lkml/2020/5/29/1038
> > > 
> > > -- 
> > > Regards,
> > > Niklas Söderlund
> > 
> > -- 
> > Best Regards,
> > Suresh Udipi.
> 
> -- 
> Best Regards,
> Michael

-- 
Regards,
Niklas Söderlund
