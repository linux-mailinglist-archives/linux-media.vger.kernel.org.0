Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7F0189782
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 10:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbgCRJAj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 05:00:39 -0400
Received: from ma-dnext03.denso.co.jp ([133.192.181.78]:44480 "EHLO
        ma-dnext03.denso.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgCRJAi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 05:00:38 -0400
Received: from grdma01h.denso.co.jp (unknown [133.192.24.24])
        by ma-dnext03.denso.co.jp (Postfix) with ESMTP id 3117A5D024C;
        Wed, 18 Mar 2020 18:00:36 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=adit-jv.com;
        s=jpadit-jvmail2011; t=1584522036;
        bh=MJNLb+QUlzHddJJCWYqXFByLkk81A4pksiBWvdYtaZM=;
        h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
         Content-Type:Content-Transfer-Encoding:In-Reply-To;
        b=8TueuV3cLIbWFLV7WdQnl/jc8S05NMxWUWR4FaAmWLAglFfr6sTsgFKQ3L4XLcFOL
         wUfDIc+YAdRXTAAUmpWzbs6VmLrn6/c3qezoor1sSc0HcYrtnMCwRGo+iXnkkzJqAF
         uqMsi1Q73gisa4aUm+AZWg5pM+Ls3Y3SbTrK72dPG9A2Q+FRiT4RI/324+cy3NFFHK
         w+wJ0Oq2fZoCeg8RST4F1IB/y4MacAftLXCZyt4U8piydnOk42qEzTlirWt9rZ5QUa
         3shjvKZ8YtdQNvec3Q49CocZ7vF/TmutteOKiliMYBeOvsFD8IfHgtND309NBv2K4y
         TaWY1vUfWsgow==
Received: by grdma01h.denso.co.jp (Postfix, from userid 0)
        id 2E0F8C04E05; Wed, 18 Mar 2020 18:00:36 +0900 (JST)
Received: from smtp0.denso.co.jp [133.192.24.87] 
         by grdma01h. with ESMTP id UAA15964;
         Wed, 18 Mar 2020 18:00:36 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp00.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id FNI36647;
        Wed, 18 Mar 2020 18:00:34 +0900
Received: from jp-u0004 (10.71.112.120) by ky0exch01.adit-jv.com (10.71.113.8)
 with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 18 Mar 2020 18:00:34
 +0900
Date:   Wed, 18 Mar 2020 18:00:29 +0900
From:   Suresh Udipi <sudipi@jp.adit-jv.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
CC:     Suresh Udipi <sudipi@jp.adit-jv.com>, <akiyama@nds-osk.co.jp>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>,
        <hverkuil-cisco@xs4all.nl>, <jacopo+renesas@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <mrodin@de.adit-jv.com>,
        <securitycheck@denso.co.jp>
Subject: Re: [PATCH v2] [RFC] rcar-vin: rcar-csi2: Correct the selection of
 hsfreqrange
Message-ID: <20200318090029.GA22842@jp-u0004>
References: <20200316130247.GA2258968@oden.dyn.berto.se>
 <1584428905-21560-1-git-send-email-sudipi@jp.adit-jv.com>
 <20200317103756.GC2496015@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200317103756.GC2496015@oden.dyn.berto.se>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.71.112.120]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 11:37:56AM +0100, Niklas Söderlund wrote:
> Hi Suresh,
> 
> Thanks for your work.
> 
> On 2020-03-17 16:08:25 +0900, Suresh Udipi wrote:
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
> > There is one exectpion value 227Mbps, which may cause out of
> > range.
> 
> Then something else is needed I think :-)
> 
> I liked v1 of this RFC more, where you added a u16 min and max to struct 
> rcsi2_mbps_reg. I think that is the right solution.
> 
> What I tried to express in my review of v1 was
> 
> - You should remove the mbps member from struct rcsi2_mbps_reg.
> - Update the walk of the array in rcsi2_set_phypll() so that it finds 
>   the first entry where the calculated target value is between min and 
>   max and use the reg setting for that entry.
> 
> Would that solution make sens too you? Sorry if I expressed myself a but 
> muddy in v1 about this.
 
Thank you for your feedback. Checking the range make more sense.

We can further optimize it, by checking only the Max range value.

- Remove mbps and min member from struct rcsi2_mbps_reg.
- Update the walk of the array in rcsi2_set_phypll() so that it finds
  the first entry where the calculated bit rate is less than the max.

Lower bit rates less than 80Mbps 
like 48Mbps(Raspberry pi camera 640x480 connected to Kingfisher)
can also be supported by selecting the lowest default bit rate 80Mbps
as done before this fix.

Please let me know your opinion on the same.
Meanwhile iam working on creating the patch, test it and update the same.
> > 
> > Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> > 
> > Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> > Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
> > ---
> > Changes in v2:
> >   - Added the boundary check for the maximum bit rate.
> >   
> >   - Simplified the logic by remmoving range check 
> >     as only the closest default value covers most 
> >     of the use cases.
> > 
> >   - Aligning the commit message based on the above change
> > 
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index faa9fb2..6573625 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -199,6 +199,7 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
> >  /* PHY Frequency Control */
> >  #define PHYPLL_REG			0x68
> >  #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
> > +#define PHYPLL_HSFREQRANGE_MAX		1500
> >  
> >  static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
> >  	{ .mbps =   80, .reg = 0x00 },
> > @@ -431,16 +432,23 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
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
> > +	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
> > +		if (hsfreq->mbps >= mbps)
> > +			break;
> > +		hsfreq_prev = hsfreq;
> > +	}
> > +
> > +	if (hsfreq_prev &&
> > +	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
> > +		hsfreq = hsfreq_prev;
> > +
> >  	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
> >  
> >  	return 0;
> > -- 
> > 2.7.4
> > 
> 
> -- 
> Regards,
> Niklas Söderlund

-- 
Best Regards,
Suresh Udipi.
