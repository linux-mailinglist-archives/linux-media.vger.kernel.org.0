Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7015B443934
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 23:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhKBXBw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 19:01:52 -0400
Received: from mga07.intel.com ([134.134.136.100]:24408 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231795AbhKBXBq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 19:01:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="294837458"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="294837458"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 15:58:49 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="560276001"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 15:58:47 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 7EDAA2036B;
        Wed,  3 Nov 2021 00:58:45 +0200 (EET)
Date:   Wed, 3 Nov 2021 00:58:45 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: Re: [PATCH v3] media: imx258: add vblank control to support more
 frame rate range
Message-ID: <YYHCpWFaQ1PkDg9Z@paasikivi.fi.intel.com>
References: <1634527576-2928-1-git-send-email-bingbu.cao@intel.com>
 <YW6/ZGI5/j4UDaBQ@paasikivi.fi.intel.com>
 <DM8PR11MB56532CA3BC7F2FDCD78C4E7E99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <DM8PR11MB5653B7646DEFC3F481B98CEF99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YXMhJJJYZl+A6dU7@paasikivi.fi.intel.com>
 <CAAFQd5BJg2PMzLCJC-QkPQagKH4d+94bw_Girb=63yw-SDPv8Q@mail.gmail.com>
 <DM8PR11MB5653F377D3FFB3F68723347C99879@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAAFQd5A9ofY4yDTxorrjGqdx9QnoWYXwssMe=6hi5qVEJPsbNA@mail.gmail.com>
 <DM8PR11MB56530049739DE29B4D87D77C99879@DM8PR11MB5653.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB56530049739DE29B4D87D77C99879@DM8PR11MB5653.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu, Tomasz,

On Fri, Oct 29, 2021 at 05:43:04AM +0000, Cao, Bingbu wrote:
> > -----Original Message-----
> > From: Tomasz Figa <tfiga@chromium.org>
> > Sent: Friday, October 29, 2021 11:05 AM
> > To: Cao, Bingbu <bingbu.cao@intel.com>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>; linux-
> > media@vger.kernel.org; kieran.bingham@ideasonboard.com;
> > bingbu.cao@linux.intel.com
> > Subject: Re: [PATCH v3] media: imx258: add vblank control to support
> > more frame rate range
> > 
> > On Fri, Oct 29, 2021 at 11:18 AM Cao, Bingbu <bingbu.cao@intel.com>
> > wrote:
> > >
> > > Sakari and Tomasz,
> > >
> > > Thanks for your review.
> > >
> > > ________________________
> > > BRs,
> > > Bingbu Cao
> > >
> > > > -----Original Message-----
> > > > From: Tomasz Figa <tfiga@chromium.org>
> > > > Sent: Thursday, October 28, 2021 9:52 PM
> > > > To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Cc: Cao, Bingbu <bingbu.cao@intel.com>; linux-media@vger.kernel.org;
> > > > kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> > > > Subject: Re: [PATCH v3] media: imx258: add vblank control to support
> > > > more frame rate range
> > > >
> > > > On Sat, Oct 23, 2021 at 5:38 AM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Hi Bingbu,
> > > > >
> > > > > On Tue, Oct 19, 2021 at 03:58:41PM +0000, Cao, Bingbu wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Cao, Bingbu
> > > > > > > Sent: Tuesday, October 19, 2021 11:30 PM
> > > > > > > To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > Cc: linux-media@vger.kernel.org; tfiga@chromium.org;
> > > > > > > kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> > > > > > > Subject: RE: [PATCH v3] media: imx258: add vblank control to
> > > > > > > support more frame rate range
> > > > > > >
> > > > > > > Sakari,
> > > > > > >
> > > > > > > ________________________
> > > > > > > BRs,
> > > > > > > Bingbu Cao
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > > Sent: Tuesday, October 19, 2021 8:52 PM
> > > > > > > > To: Cao, Bingbu <bingbu.cao@intel.com>
> > > > > > > > Cc: linux-media@vger.kernel.org; tfiga@chromium.org;
> > > > > > > > kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> > > > > > > > Subject: Re: [PATCH v3] media: imx258: add vblank control to
> > > > > > > > support more frame rate range
> > > > > > > >
> > > > > > > > Hi Bingbu,
> > > > > > > >
> > > > > > > > On Mon, Oct 18, 2021 at 11:26:16AM +0800, Bingbu Cao wrote:
> > > > > > > > > Current imx258 driver enable the automatic frame length
> > > > > > > > > tracking control by default and did not support VBLANK
> > > > > > > > > change, it's always
> > > > > > > > working at 30fps.
> > > > > > > > > However, in reality we need a wider frame rate range from
> > > > > > > > > 15
> > > > to 30.
> > > > > > > > > This patch disable the automatic frame length tracking
> > > > > > > > > control and enable the v4l2 VBLANK control to allow user
> > > > > > > > > changing frame rate per
> > > > > > > > requirement.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/media/i2c/imx258.c | 23 +++++++++++++++++------
> > > > > > > > >  1 file changed, 17 insertions(+), 6 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/media/i2c/imx258.c
> > > > > > > > > b/drivers/media/i2c/imx258.c index
> > > > > > > > > 81cdf37216ca..2c787af7074d
> > > > > > > > > 100644
> > > > > > > > > --- a/drivers/media/i2c/imx258.c
> > > > > > > > > +++ b/drivers/media/i2c/imx258.c
> > > > > > > > > @@ -29,6 +29,7 @@
> > > > > > > > >  #define IMX258_VTS_MAX                 0xffff
> > > > > > > > >
> > > > > > > > >  /*Frame Length Line*/
> > > > > > > > > +#define IMX258_REG_FLL                 0x0340
> > > > > > > > >  #define IMX258_FLL_MIN                 0x08a6
> > > > > > > > >  #define IMX258_FLL_MAX                 0xffff
> > > > > > > > >  #define IMX258_FLL_STEP                        1
> > > > > > > > > @@ -241,7 +242,7 @@ static const struct imx258_reg
> > > > > > > > > mode_4208x3118_regs[]
> > > > > > > > = {
> > > > > > > > >         { 0x034D, 0x70 },
> > > > > > > > >         { 0x034E, 0x0C },
> > > > > > > > >         { 0x034F, 0x30 },
> > > > > > > > > -       { 0x0350, 0x01 },
> > > > > > > > > +       { 0x0350, 0x00 }, /* no frame length automatic
> > > > > > > > > + tracking control */
> > > > > > > > >         { 0x0202, 0x0C },
> > > > > > > > >         { 0x0203, 0x46 },
> > > > > > > > >         { 0x0204, 0x00 },
> > > > > > > > > @@ -360,7 +361,7 @@ static const struct imx258_reg
> > > > > > > > > mode_2104_1560_regs[]
> > > > > > > > = {
> > > > > > > > >         { 0x034D, 0x38 },
> > > > > > > > >         { 0x034E, 0x06 },
> > > > > > > > >         { 0x034F, 0x18 },
> > > > > > > > > -       { 0x0350, 0x01 },
> > > > > > > > > +       { 0x0350, 0x00 }, /* no frame length automatic
> > > > > > > > > + tracking control */
> > > > > > > > >         { 0x0202, 0x06 },
> > > > > > > > >         { 0x0203, 0x2E },
> > > > > > > > >         { 0x0204, 0x00 },
> > > > > > > > > @@ -479,7 +480,7 @@ static const struct imx258_reg
> > > > > > > > > mode_1048_780_regs[]
> > > > > > > > = {
> > > > > > > > >         { 0x034D, 0x18 },
> > > > > > > > >         { 0x034E, 0x03 },
> > > > > > > > >         { 0x034F, 0x0C },
> > > > > > > > > -       { 0x0350, 0x01 },
> > > > > > > > > +       { 0x0350, 0x00 }, /* no frame length automatic
> > > > > > > > > + tracking control */
> > > > > > > >
> > > > > > > > Why is automatic frame length control disabled?
> > > > > > >
> > > > > > > My understanding:
> > > > > > > If automatic frame length control enabled, the frame length is
> > > > > > > changed automatically when COARSE_INTEGRATE_TIME + 10 >
> > > > > > > FRAME_LENGTH_LINES, it may not meet the requirement - less
> > > > integrate time with more frame length.
> > > > > > > we need control the vertical blank to do that.
> > > > > > >
> > > > > >
> > > > > > If frame length automatic tracking control enabled, the
> > > > > > CORSE_INTEGRATE_TIME could be larger than FRAME_LENGTH_LINES.
> > > > >
> > > > > Both are controlled by the driver. The driver is generally
> > > > > responsible for ensuring the exposure time stays within the limits
> > > > > for a given frame length.
> > > > >
> > > > > Unless this sensor does something weird, all you get by disabling
> > > > > this is undefined behaviour instead of increased frame length when
> > > > > the exposure time + margin exceeds frame length. This could mean
> > > > > broken
> > > > frames.
> > > > >
> > > > > Of course, it takes a driver bug to arrive into this situation.
> > > >
> > > > I'd argue that enabling the automatic control would make it much
> > > > more difficult to spot the driver bug in this case and so it would
> > > > be more desirable to keep it disabled as in this patch.
> > >
> > > You are right, I will remove the change in next version.
> > 
> > Sorry, remove what change? My comment agrees with this patch that keeps
> > the function disabled.
> 
> Tomasz, my bad, let me keep it disabled. Sakari, what do you think?

I guess this is balancing between failing graciously and making bugs
well visible. As this isn't about debugging I'd pick the first. There are
other ways to figure out if the frame time is wrong.

If the current is to be changed I think it should be a separate patch in
any case.

-- 
Regards,

Sakari Ailus
