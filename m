Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A209C1E4816
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 17:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389913AbgE0PrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 11:47:18 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:44804 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389890AbgE0PrQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 11:47:16 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 304413C0579;
        Wed, 27 May 2020 17:47:12 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kWYkDf7z-UDt; Wed, 27 May 2020 17:47:05 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id E85503C057C;
        Wed, 27 May 2020 17:47:05 +0200 (CEST)
Received: from vmlxhi-121.adit-jv.com (10.72.94.22) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 27 May
 2020 17:47:05 +0200
Date:   Wed, 27 May 2020 17:47:00 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
CC:     Michael Rodin <mrodin@de.adit-jv.com>,
        Suresh Udipi <sudipi@jp.adit-jv.com>, <akiyama@nds-osk.co.jp>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>,
        <hverkuil-cisco@xs4all.nl>, <jacopo+renesas@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <securitycheck@denso.co.jp>
Subject: Re: [PATCH v5] media: rcar-csi2: Correct the selection of hsfreqrange
Message-ID: <20200527154700.GA15669@vmlxhi-121.adit-jv.com>
References: <20200414115600.GB285053@oden.dyn.berto.se>
 <1588226590-12880-1-git-send-email-sudipi@jp.adit-jv.com>
 <20200504150122.GA8532@vmlxhi-121.adit-jv.com>
 <20200512213045.GC2542285@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200512213045.GC2542285@oden.dyn.berto.se>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.22]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 12, 2020 at 11:30:45PM +0200, Niklas Söderlund wrote:
> Hi Michael and Suresh,
> 
> Thanks for your comments Michael.
> 
> On 2020-05-04 17:01:22 +0200, Michael Rodin wrote:
> > Hello Suresh, Niklas,
> > 
> > I think that we should not change the structs for PHTW register configuration,
> > because there are no "max" values in the table "PHTW Set Values" from the
> > Renesas Hardware Manual. The patch looks just wrong. A major issue is also
> > that the Hardware Manual does not provide any algorithm, how to select the
> > right table entry for the configuration of PHTW and PHYPLL registers, so we
> > can not say for sure that the patch is correct. It is also not clear, what
> > are the "default" bit rates? It looks like they are made exactly for usage
> > in driver code:
> >  - both PHTW and PHYPLL tables have "default" values
> >  - only PHYPLL (HSFREQRANGE) tables have min/max values and it requires
> >    additional rounding in order to hardcode them in a driver
> > But these are just my speculations. If they are correct, then the only
> > exception, where the patch v2 failed, could be a typo in the Hardware Manual.
> > Otherwise patch v2 looks much better to me. I think, we should wait for more
> > details from Renesas before fixing this issue. 
> 
> I see your point.
> 
> As a middle ground as Suresh is having a real problem and the logic in 
> the driver is wrong and should be fixed. How about keeping the 
> definition of the struct rcsi2_mbps_reg as it is but updating all the 
> tables .mbps values from the default to the max value?

Do you mean we should rename "max" back to "mbps" in this patch but keep
the maximum value in the tables? This does not sound much better to me. If
it is "max", it should be called "max" :). One of the reasons why I like
[PATCH v2] is because we are currently using something very similar, and
we don't have any issues yet. Of course maybe we dont have any use case
with values around 227 mbps where we would have the exception mentioned by
Suresh for the range [197.125 - 224.125]. I will send the patches to make
more clear what I am talking about.

> > 
> > On Thu, Apr 30, 2020 at 03:03:10PM +0900, Suresh Udipi wrote:
> > > hsfreqrange should be chosen based on the calculated mbps which
> > > is within the range as per table[1]. But current calculation
> > > always selects first value which is greater than or equal to the
> > > calculated mbps which may lead to chosing a wrong range in some cases.
> > > 
> > > For example for 360 mbps for H3/M3N
> > > Existing logic selects
> > > Calculated value 360Mbps : Default 400Mbps Range [368.125 -433.125 mbps]
> > > 
> > > This hsfreqrange is out of range.
> > > 
> > > The logic is changed to select the first hsfreqrange whose max range[1] is
> > > greater than the calculated bit rate.
> > > 
> > > Calculated value 360Mbps : max range 380.625 mbps is selected
> > >  i.e Default 350Mbps  Range [320.625 -380.625 mpbs]
> > > 
> > > [1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]
> > > 
> > > Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> > > 
> > > Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> > > Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
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
> > >    - Remove unncessary braces.
> > >  
> > >  Changes in v5:
> > >    - Removed mbps variable in rcsi2_mbps_reg and aligned all 
> > >      tables accordingly
> > > 
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 282 ++++++++++++++--------------
> > >  1 file changed, 141 insertions(+), 141 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > index faa9fb2..d45bf80 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > @@ -132,63 +132,63 @@ struct phtw_value {
> > >  };
> > >  
> > >  struct rcsi2_mbps_reg {
> > > -	u16 mbps;
> > >  	u16 reg;
> > > +	u16 max;
> > >  };
> > >  
> > >  static const struct rcsi2_mbps_reg phtw_mbps_h3_v3h_m3n[] = {
> > > -	{ .mbps =   80, .reg = 0x86 },
> > > -	{ .mbps =   90, .reg = 0x86 },
> > > -	{ .mbps =  100, .reg = 0x87 },
> > > -	{ .mbps =  110, .reg = 0x87 },
> > > -	{ .mbps =  120, .reg = 0x88 },
> > > -	{ .mbps =  130, .reg = 0x88 },
> > > -	{ .mbps =  140, .reg = 0x89 },
> > > -	{ .mbps =  150, .reg = 0x89 },
> > > -	{ .mbps =  160, .reg = 0x8a },
> > > -	{ .mbps =  170, .reg = 0x8a },
> > > -	{ .mbps =  180, .reg = 0x8b },
> > > -	{ .mbps =  190, .reg = 0x8b },
> > > -	{ .mbps =  205, .reg = 0x8c },
> > > -	{ .mbps =  220, .reg = 0x8d },
> > > -	{ .mbps =  235, .reg = 0x8e },
> > > -	{ .mbps =  250, .reg = 0x8e },
> > > +	{ .reg = 0x86, .max =  80  },
> > > +	{ .reg = 0x86, .max =  90  },
> > > +	{ .reg = 0x87, .max =  100 },
> > > +	{ .reg = 0x87, .max =  110 },
> > > +	{ .reg = 0x88, .max =  120 },
> > > +	{ .reg = 0x88, .max =  130 },
> > > +	{ .reg = 0x89, .max =  140 },
> > > +	{ .reg = 0x89, .max =  150 },
> > > +	{ .reg = 0x8a, .max =  160 },
> > > +	{ .reg = 0x8a, .max =  170 },
> > > +	{ .reg = 0x8b, .max =  180 },
> > > +	{ .reg = 0x8b, .max =  190 },
> > > +	{ .reg = 0x8c, .max =  205 },
> > > +	{ .reg = 0x8d, .max =  220 },
> > > +	{ .reg = 0x8e, .max =  235 },
> > > +	{ .reg = 0x8e, .max =  250 },
> > >  	{ /* sentinel */ },
> > >  };
> > >  
> > >  static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
> > > -	{ .mbps =   80, .reg = 0x00 },
> > > -	{ .mbps =   90, .reg = 0x20 },
> > > -	{ .mbps =  100, .reg = 0x40 },
> > > -	{ .mbps =  110, .reg = 0x02 },
> > > -	{ .mbps =  130, .reg = 0x22 },
> > > -	{ .mbps =  140, .reg = 0x42 },
> > > -	{ .mbps =  150, .reg = 0x04 },
> > > -	{ .mbps =  170, .reg = 0x24 },
> > > -	{ .mbps =  180, .reg = 0x44 },
> > > -	{ .mbps =  200, .reg = 0x06 },
> > > -	{ .mbps =  220, .reg = 0x26 },
> > > -	{ .mbps =  240, .reg = 0x46 },
> > > -	{ .mbps =  250, .reg = 0x08 },
> > > -	{ .mbps =  270, .reg = 0x28 },
> > > -	{ .mbps =  300, .reg = 0x0a },
> > > -	{ .mbps =  330, .reg = 0x2a },
> > > -	{ .mbps =  360, .reg = 0x4a },
> > > -	{ .mbps =  400, .reg = 0x0c },
> > > -	{ .mbps =  450, .reg = 0x2c },
> > > -	{ .mbps =  500, .reg = 0x0e },
> > > -	{ .mbps =  550, .reg = 0x2e },
> > > -	{ .mbps =  600, .reg = 0x10 },
> > > -	{ .mbps =  650, .reg = 0x30 },
> > > -	{ .mbps =  700, .reg = 0x12 },
> > > -	{ .mbps =  750, .reg = 0x32 },
> > > -	{ .mbps =  800, .reg = 0x52 },
> > > -	{ .mbps =  850, .reg = 0x72 },
> > > -	{ .mbps =  900, .reg = 0x14 },
> > > -	{ .mbps =  950, .reg = 0x34 },
> > > -	{ .mbps = 1000, .reg = 0x54 },
> > > -	{ .mbps = 1050, .reg = 0x74 },
> > > -	{ .mbps = 1125, .reg = 0x16 },
> > > +	{ .reg = 0x00, .max = 80   },
> > > +	{ .reg = 0x20, .max = 90   },
> > > +	{ .reg = 0x40, .max = 100  },
> > > +	{ .reg = 0x02, .max = 110  },
> > > +	{ .reg = 0x22, .max = 130  },
> > > +	{ .reg = 0x42, .max = 140  },
> > > +	{ .reg = 0x04, .max = 150  },
> > > +	{ .reg = 0x24, .max = 170  },
> > > +	{ .reg = 0x44, .max = 180  },
> > > +	{ .reg = 0x06, .max = 200  },
> > > +	{ .reg = 0x26, .max = 220  },
> > > +	{ .reg = 0x46, .max = 240  },
> > > +	{ .reg = 0x08, .max = 250  },
> > > +	{ .reg = 0x28, .max = 270  },
> > > +	{ .reg = 0x0a, .max = 300  },
> > > +	{ .reg = 0x2a, .max = 330  },
> > > +	{ .reg = 0x4a, .max = 360  },
> > > +	{ .reg = 0x0c, .max = 400  },
> > > +	{ .reg = 0x2c, .max = 450  },
> > > +	{ .reg = 0x0e, .max = 500  },
> > > +	{ .reg = 0x2e, .max = 550  },
> > > +	{ .reg = 0x10, .max = 600  },
> > > +	{ .reg = 0x30, .max = 650  },
> > > +	{ .reg = 0x12, .max = 700  },
> > > +	{ .reg = 0x32, .max = 750  },
> > > +	{ .reg = 0x52, .max = 800  },
> > > +	{ .reg = 0x72, .max = 850  },
> > > +	{ .reg = 0x14, .max = 900  },
> > > +	{ .reg = 0x34, .max = 950  },
> > > +	{ .reg = 0x54, .max = 1000 },
> > > +	{ .reg = 0x74, .max = 1050 },
> > > +	{ .reg = 0x16, .max = 1125 },
> > >  	{ /* sentinel */ },
> > >  };
> > >  
> > > @@ -201,96 +201,96 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
> > >  #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
> > >  
> > >  static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
> > > -	{ .mbps =   80, .reg = 0x00 },
> > > -	{ .mbps =   90, .reg = 0x10 },
> > > -	{ .mbps =  100, .reg = 0x20 },
> > > -	{ .mbps =  110, .reg = 0x30 },
> > > -	{ .mbps =  120, .reg = 0x01 },
> > > -	{ .mbps =  130, .reg = 0x11 },
> > > -	{ .mbps =  140, .reg = 0x21 },
> > > -	{ .mbps =  150, .reg = 0x31 },
> > > -	{ .mbps =  160, .reg = 0x02 },
> > > -	{ .mbps =  170, .reg = 0x12 },
> > > -	{ .mbps =  180, .reg = 0x22 },
> > > -	{ .mbps =  190, .reg = 0x32 },
> > > -	{ .mbps =  205, .reg = 0x03 },
> > > -	{ .mbps =  220, .reg = 0x13 },
> > > -	{ .mbps =  235, .reg = 0x23 },
> > > -	{ .mbps =  250, .reg = 0x33 },
> > > -	{ .mbps =  275, .reg = 0x04 },
> > > -	{ .mbps =  300, .reg = 0x14 },
> > > -	{ .mbps =  325, .reg = 0x25 },
> > > -	{ .mbps =  350, .reg = 0x35 },
> > > -	{ .mbps =  400, .reg = 0x05 },
> > > -	{ .mbps =  450, .reg = 0x16 },
> > > -	{ .mbps =  500, .reg = 0x26 },
> > > -	{ .mbps =  550, .reg = 0x37 },
> > > -	{ .mbps =  600, .reg = 0x07 },
> > > -	{ .mbps =  650, .reg = 0x18 },
> > > -	{ .mbps =  700, .reg = 0x28 },
> > > -	{ .mbps =  750, .reg = 0x39 },
> > > -	{ .mbps =  800, .reg = 0x09 },
> > > -	{ .mbps =  850, .reg = 0x19 },
> > > -	{ .mbps =  900, .reg = 0x29 },
> > > -	{ .mbps =  950, .reg = 0x3a },
> > > -	{ .mbps = 1000, .reg = 0x0a },
> > > -	{ .mbps = 1050, .reg = 0x1a },
> > > -	{ .mbps = 1100, .reg = 0x2a },
> > > -	{ .mbps = 1150, .reg = 0x3b },
> > > -	{ .mbps = 1200, .reg = 0x0b },
> > > -	{ .mbps = 1250, .reg = 0x1b },
> > > -	{ .mbps = 1300, .reg = 0x2b },
> > > -	{ .mbps = 1350, .reg = 0x3c },
> > > -	{ .mbps = 1400, .reg = 0x0c },
> > > -	{ .mbps = 1450, .reg = 0x1c },
> > > -	{ .mbps = 1500, .reg = 0x2c },
> > > +	{ .reg = 0x00, .max =   97 },
> > > +	{ .reg = 0x10, .max =  107 },
> > > +	{ .reg = 0x20, .max =  118 },
> > > +	{ .reg = 0x30, .max =  128 },
> > > +	{ .reg = 0x01, .max =  139 },
> > > +	{ .reg = 0x11, .max =  149 },
> > > +	{ .reg = 0x21, .max =  160 },
> > > +	{ .reg = 0x31, .max =  170 },
> > > +	{ .reg = 0x02, .max =  181 },
> > > +	{ .reg = 0x12, .max =  191 },
> > > +	{ .reg = 0x22, .max =  202 },
> > > +	{ .reg = 0x32, .max =  212 },
> > > +	{ .reg = 0x03, .max =  228 },
> > > +	{ .reg = 0x13, .max =  224 },
> > > +	{ .reg = 0x23, .max =  259 },
> > > +	{ .reg = 0x33, .max =  275 },
> > > +	{ .reg = 0x04, .max =  301 },
> > > +	{ .reg = 0x14, .max =  328 },
> > > +	{ .reg = 0x25, .max =  354 },
> > > +	{ .reg = 0x35, .max =  380 },
> > > +	{ .reg = 0x05, .max =  433 },
> > > +	{ .reg = 0x16, .max =  485 },
> > > +	{ .reg = 0x26, .max =  538 },
> > > +	{ .reg = 0x37, .max =  590 },
> > > +	{ .reg = 0x07, .max =  643 },
> > > +	{ .reg = 0x18, .max =  695 },
> > > +	{ .reg = 0x28, .max =  748 },
> > > +	{ .reg = 0x39, .max =  800 },
> > > +	{ .reg = 0x09, .max =  853 },
> > > +	{ .reg = 0x19, .max =  905 },
> > > +	{ .reg = 0x29, .max =  958 },
> > > +	{ .reg = 0x3a, .max = 1010 },
> > > +	{ .reg = 0x0a, .max = 1063 },
> > > +	{ .reg = 0x1a, .max = 1115 },
> > > +	{ .reg = 0x2a, .max = 1168 },
> > > +	{ .reg = 0x3b, .max = 1220 },
> > > +	{ .reg = 0x0b, .max = 1273 },
> > > +	{ .reg = 0x1b, .max = 1325 },
> > > +	{ .reg = 0x2b, .max = 1378 },
> > > +	{ .reg = 0x3c, .max = 1430 },
> > > +	{ .reg = 0x0c, .max = 1483 },
> > > +	{ .reg = 0x1c, .max = 1500 },
> > > +	{ .reg = 0x2c, .max = 1500 },
> > >  	{ /* sentinel */ },
> > >  };
> > >  
> > >  static const struct rcsi2_mbps_reg hsfreqrange_m3w_h3es1[] = {
> > > -	{ .mbps =   80,	.reg = 0x00 },
> > > -	{ .mbps =   90,	.reg = 0x10 },
> > > -	{ .mbps =  100,	.reg = 0x20 },
> > > -	{ .mbps =  110,	.reg = 0x30 },
> > > -	{ .mbps =  120,	.reg = 0x01 },
> > > -	{ .mbps =  130,	.reg = 0x11 },
> > > -	{ .mbps =  140,	.reg = 0x21 },
> > > -	{ .mbps =  150,	.reg = 0x31 },
> > > -	{ .mbps =  160,	.reg = 0x02 },
> > > -	{ .mbps =  170,	.reg = 0x12 },
> > > -	{ .mbps =  180,	.reg = 0x22 },
> > > -	{ .mbps =  190,	.reg = 0x32 },
> > > -	{ .mbps =  205,	.reg = 0x03 },
> > > -	{ .mbps =  220,	.reg = 0x13 },
> > > -	{ .mbps =  235,	.reg = 0x23 },
> > > -	{ .mbps =  250,	.reg = 0x33 },
> > > -	{ .mbps =  275,	.reg = 0x04 },
> > > -	{ .mbps =  300,	.reg = 0x14 },
> > > -	{ .mbps =  325,	.reg = 0x05 },
> > > -	{ .mbps =  350,	.reg = 0x15 },
> > > -	{ .mbps =  400,	.reg = 0x25 },
> > > -	{ .mbps =  450,	.reg = 0x06 },
> > > -	{ .mbps =  500,	.reg = 0x16 },
> > > -	{ .mbps =  550,	.reg = 0x07 },
> > > -	{ .mbps =  600,	.reg = 0x17 },
> > > -	{ .mbps =  650,	.reg = 0x08 },
> > > -	{ .mbps =  700,	.reg = 0x18 },
> > > -	{ .mbps =  750,	.reg = 0x09 },
> > > -	{ .mbps =  800,	.reg = 0x19 },
> > > -	{ .mbps =  850,	.reg = 0x29 },
> > > -	{ .mbps =  900,	.reg = 0x39 },
> > > -	{ .mbps =  950,	.reg = 0x0a },
> > > -	{ .mbps = 1000,	.reg = 0x1a },
> > > -	{ .mbps = 1050,	.reg = 0x2a },
> > > -	{ .mbps = 1100,	.reg = 0x3a },
> > > -	{ .mbps = 1150,	.reg = 0x0b },
> > > -	{ .mbps = 1200,	.reg = 0x1b },
> > > -	{ .mbps = 1250,	.reg = 0x2b },
> > > -	{ .mbps = 1300,	.reg = 0x3b },
> > > -	{ .mbps = 1350,	.reg = 0x0c },
> > > -	{ .mbps = 1400,	.reg = 0x1c },
> > > -	{ .mbps = 1450,	.reg = 0x2c },
> > > -	{ .mbps = 1500,	.reg = 0x3c },
> > > +	{ .reg = 0x00, .max =  110 },
> > > +	{ .reg = 0x10, .max =  120 },
> > > +	{ .reg = 0x20, .max =  131 },
> > > +	{ .reg = 0x30, .max =  141 },
> > > +	{ .reg = 0x01, .max =  152 },
> > > +	{ .reg = 0x11, .max =  162 },
> > > +	{ .reg = 0x21, .max =  173 },
> > > +	{ .reg = 0x31, .max =  183 },
> > > +	{ .reg = 0x02, .max =  194 },
> > > +	{ .reg = 0x12, .max =  204 },
> > > +	{ .reg = 0x22, .max =  215 },
> > > +	{ .reg = 0x32, .max =  225 },
> > > +	{ .reg = 0x03, .max =  241 },
> > > +	{ .reg = 0x13, .max =  257 },
> > > +	{ .reg = 0x23, .max =  273 },
> > > +	{ .reg = 0x33, .max =  275 },
> > > +	{ .reg = 0x04, .max =  301 },
> > > +	{ .reg = 0x14, .max =  328 },
> > > +	{ .reg = 0x05, .max =  354 },
> > > +	{ .reg = 0x15, .max =  393 },
> > > +	{ .reg = 0x25, .max =  446 },
> > > +	{ .reg = 0x06, .max =  498 },
> > > +	{ .reg = 0x16, .max =  551 },
> > > +	{ .reg = 0x07, .max =  603 },
> > > +	{ .reg = 0x17, .max =  656 },
> > > +	{ .reg = 0x08, .max =  708 },
> > > +	{ .reg = 0x18, .max =  761 },
> > > +	{ .reg = 0x09, .max =  813 },
> > > +	{ .reg = 0x19, .max =  866 },
> > > +	{ .reg = 0x29, .max =  918 },
> > > +	{ .reg = 0x39, .max =  971 },
> > > +	{ .reg = 0x0a, .max = 1023 },
> > > +	{ .reg = 0x1a, .max = 1076 },
> > > +	{ .reg = 0x2a, .max = 1128 },
> > > +	{ .reg = 0x3a, .max = 1181 },
> > > +	{ .reg = 0x0b, .max = 1233 },
> > > +	{ .reg = 0x1b, .max = 1286 },
> > > +	{ .reg = 0x2b, .max = 1338 },
> > > +	{ .reg = 0x3b, .max = 1391 },
> > > +	{ .reg = 0x0c, .max = 1443 },
> > > +	{ .reg = 0x1c, .max = 1496 },
> > > +	{ .reg = 0x2c, .max = 1500 },
> > > +	{ .reg = 0x3c, .max = 1500 },
> > >  	{ /* sentinel */ },
> > >  };
> > >  
> > > @@ -432,11 +432,11 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> > >  {
> > >  	const struct rcsi2_mbps_reg *hsfreq;
> > >  
> > > -	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
> > > -		if (hsfreq->mbps >= mbps)
> > > +	for (hsfreq = priv->info->hsfreqrange; hsfreq->max != 0; hsfreq++)
> > > +		if (hsfreq->max >= mbps)
> > >  			break;
> > >  
> > > -	if (!hsfreq->mbps) {
> > > +	if (!hsfreq->max) {
> > >  		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
> > >  		return -ERANGE;
> > >  	}
> > > @@ -907,11 +907,11 @@ static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
> > >  {
> > >  	const struct rcsi2_mbps_reg *value;
> > >  
> > > -	for (value = values; value->mbps; value++)
> > > -		if (value->mbps >= mbps)
> > > +	for (value = values; value->max; value++)
> > > +		if (value->max >= mbps)
> > >  			break;
> > >  
> > > -	if (!value->mbps) {
> > > +	if (!value->max) {
> > >  		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
> > >  		return -ERANGE;
> > >  	}
> > > -- 
> > > 2.7.4
> > > 
> > 
> > -- 
> > Best Regards,
> > Michael
> 
> -- 
> Regards,
> Niklas Söderlund

-- 
Best Regards,
Michael
